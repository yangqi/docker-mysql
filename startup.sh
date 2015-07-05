#!/bin/sh

if [ ! -f /var/lib/mysql/ibdata1 ]; then
  mysql_install_db
  service mysql start
  echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
  service mysql stop
fi

/usr/bin/mysqld_safe
