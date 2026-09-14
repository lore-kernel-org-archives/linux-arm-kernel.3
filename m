Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457FC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fvuBTJV1Dk/Ie/KYF79kHSdwiXYxbsMSNO4Fc9UKz0o=; b=YJ3YF7NIcIAWW8zjtYGM756j9n
	QFPTv0GdaT2Bzhj0pVSPEYjm4cwiMc1MakdhTZ0xf0by30DFBh8lYMJ7P0/9sZLoEdKQ6OuM6ogZ7
	h1+M5WW7PkByXquPoCE7Cx7ny4HQ7A0RmcfPK9nljOJmPsoiMH+AQgvliq43RvpX3I7yzMuQ84elR
	94RaU3lo5l0XXUY4qyJcTjBnZaUmzY7Sh6h1m+k5/5kSEX0GpEK5jk+vJfyb2dMG7pMKkRG5woYB4
	U1ktClRVqF05cJPoAszA7RTHxwqJfDv9ay4CX6EIoKV3qBSPJzj4g0WidZro16M6OvGVb0Zb0wbkD
	FpWD6aAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zpa-00000002PWS-0N2a;
	Mon, 14 Sep 2026 06:06:18 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zpY-00000002PUa-2Upr;
	Mon, 14 Sep 2026 06:06:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Michal Simek <michal.simek@amd.com>,
	Ronak Jain <ronak.jain@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] firmware: zynqmp: use literal blocks for commands
Date: Sun, 13 Sep 2026 23:06:15 -0700
Message-ID: <20260914060615.1398531-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use literal blocks for 'cat' and 'echo' commands to separate them from
the surrounding text. Otherwise the lines run together, without any
clear break before or after the commands.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Michal Simek <michal.simek@amd.com>
Cc: Ronak Jain <ronak.jain@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
 1 file changed, 50 insertions(+), 20 deletions(-)

--- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
+++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
@@ -141,32 +141,44 @@ Description:
 
 		Usage:
 
-		Select over temperature config ID to enable/disable feature
+		Select over temperature config ID to enable/disable feature::
+
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check over temperature config ID is selected or not
+		Check over temperature config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 1.
 
-		Select over temperature config ID to configure OT limit
+		Select over temperature config ID to configure OT limit::
+
 		# echo 2 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check over temperature config ID is selected or not
+		Check over temperature config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 2.
 
-		Select external watchdog config ID to enable/disable feature
+		Select external watchdog config ID to enable/disable feature::
+
 		# echo 3 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check external watchdog config ID is selected or not
+		Check external watchdog config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 3.
 
-		Select external watchdog config ID to configure time interval
+		Select external watchdog config ID to configure time interval::
+
 		# echo 4 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 
-		Check external watchdog config ID is selected or not
+		Check external watchdog config ID is selected or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
+
 		The expected result is 4.
 
 Users:		Xilinx
@@ -205,52 +217,70 @@ Description:
 
 		Usage:
 
-		Enable over temperature feature
+		Enable over temperature feature::
+
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the over temperature feature is enabled or not
+		Check whether the over temperature feature is enabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 1.
 
-		Disable over temperature feature
+		Disable over temperature feature::
+
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 0 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the over temperature feature is disabled or not
+		Check whether the over temperature feature is disabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 0.
 
-		Configure over temperature limit to 50 Degree Celsius
+		Configure over temperature limit to 50 Degree Celsius::
+
 		# echo 2 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 50 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the over temperature limit is configured or not
+		Check whether the over temperature limit is configured or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 50.
 
-		Enable external watchdog feature
+		Enable external watchdog feature::
+
 		# echo 3 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the external watchdog feature is enabled or not
+		Check whether the external watchdog feature is enabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 1.
 
-		Disable external watchdog feature
+		Disable external watchdog feature::
+
 		# echo 3 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 0 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the external watchdog feature is disabled or not
+		Check whether the external watchdog feature is disabled or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 0.
 
-		Configure external watchdog timer interval to 500ms
+		Configure external watchdog timer interval to 500ms::
+
 		# echo 4 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
 		# echo 500 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
 
-		Check whether the external watchdog timer interval is configured or not
+		Check whether the external watchdog timer interval is configured or not::
+
 		# cat /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_value
+
 		The expected result is 500.
 
 Users:		Xilinx

