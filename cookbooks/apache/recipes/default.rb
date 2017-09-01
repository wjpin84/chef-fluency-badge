#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# Basic apache installation and service starting.

if node['platform_family'] == 'rhel'
  apache_pkg = "httpd"
elsif node['platform_family'] == 'debian'
  apache_pkg = "apache2"
end

package 'apache2' do
  package_name apache_pkg
  action :install
end

service 'apache2' do
  service_name apache_pkg
  action [:enable, :start]
end
