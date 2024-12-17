Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31215E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIuFXKMjlt2eqMXCgMM0MpSNKB+FCQyk+A1j47l3HY8=; b=2LFhMBhOQ9jc6l0AXOjOT8i3wp
	H8Si7Ymo09bw6HdIFR8AepvhchEh9IeYfO5E8L3sf9rG/Shq3u7wr/iUHWdpyvcU/J21xr08iSrro
	9y6Y4u2oIsqteAozwWbuDyApcapULrB4xYO0i5t3OeazRyutvOejGzlN04CeQK8jPE3Cvutq8MJ22
	zilEZxwQcU0n5vayplxjgqV/OBlqYr3wBZWZ2cBbx/pUUSXeOGhknWGI2//2zKQmarhuOrGiX5mT7
	6UpcdNkmll6Kf66QXBb8YqwXlrIZHlEyGJiw0LbFULQnx3RstZRZ02/kzsvxK1C12rTLYhZ3IGz/J
	WZUQ/g0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNGB-0000000BxtB-02PP;
	Tue, 17 Dec 2024 02:24:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNND1-0000000BxDz-1CVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 02:21:16 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFHurU019557;
	Tue, 17 Dec 2024 02:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=yIuFXKMjlt2eqMXCg
	MM0MpSNKB+FCQyk+A1j47l3HY8=; b=ra7kmIT0TUL1Ert5plHZJNRWLWstAwaH1
	95PcaVAjGqUfUGua0BtqbLqG0LxhqRGuwLkH7x7QuUDb8Y1ZIwtd0dt3nN4b+Nrd
	Ez1jKKYM1fpdkflhfUqG84EVDPq/Cjsu3XY6OCmzPaScGCW5gkoQRHDGh6XVFnsU
	uWUAFOt3R/Fygm3UHKHsXp48ufqgQaE68iRXUAFUGrgisMZSGoGsAhjGyr/H0oU/
	yOqOdlOgL7NsaErztA/geW56w4ipQFcwm1lE1iqHIzZv1+6CkV7uer7dovklZVCB
	/pCyQStjmH+NpSHhnyfPRqkwOcCxgRJ/lFqpoGEJqVA6PAx+bgLRQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpgws3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:20:59 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH2KwZ6015225;
	Tue, 17 Dec 2024 02:20:58 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpgws3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:20:58 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH0CEBP014391;
	Tue, 17 Dec 2024 02:20:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21gef4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:20:57 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH2KurW31261384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 02:20:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BA105803F;
	Tue, 17 Dec 2024 02:20:56 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE3E458056;
	Tue, 17 Dec 2024 02:20:53 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 02:20:53 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v3 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Date: Mon, 16 Dec 2024 20:20:40 -0600
Message-ID: <20241217022046.113830-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217022046.113830-1-ninad@linux.ibm.com>
References: <20241217022046.113830-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YcR4Q7u9MjKTFy1YlyEbg6pdZHNxne_N
X-Proofpoint-ORIG-GUID: ldz9OOB_8-KCFUbL-IJjJvv-QCc3ZHQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_182115_325499_1462CD9A 
X-CRM114-Status: GOOD (  26.06  )
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

Add the driver to monitor Intel common redundant power supply (crps185)
with hwmon over pmbus.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/hwmon/crps.rst  | 97 +++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst |  1 +
 MAINTAINERS                   |  7 +++
 drivers/hwmon/pmbus/Kconfig   |  9 ++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/crps.c    | 74 ++++++++++++++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

diff --git a/Documentation/hwmon/crps.rst b/Documentation/hwmon/crps.rst
new file mode 100644
index 000000000000..87380b496558
--- /dev/null
+++ b/Documentation/hwmon/crps.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver crps
+==================
+
+Supported chips:
+
+  * Intel CRPS185
+
+    Prefix: 'crps185'
+
+    Addresses scanned: -
+
+    Datasheet: Only available under NDA.
+
+Authors:
+    Ninad Palsule <ninad@linux.ibm.com>
+
+
+Description
+-----------
+
+This driver implements support for Intel Common Redundant Power supply with
+PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_max		Maximum input current
+curr1_max_alarm		Input maximum current high alarm
+curr1_crit		Critial high input current
+curr1_crit_alarm	Input critical current high alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm		Output maximum current high alarm
+curr2_crit		Critial high output current
+curr2_crit_alarm	Output critical current high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical input over voltage
+in1_crit_alarm		Critical input over voltage alarm
+in1_max			Maximum input over voltage
+in1_max_alarm		Maximum input over voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured input voltage
+in2_crit		Critical input over voltage
+in2_crit_alarm		Critical input over voltage alarm
+in2_lcrit		Critical input under voltage fault
+in2_lcrit_alarm		Critical input under voltage fault alarm
+in2_max			Maximum input over voltage
+in2_max_alarm		Maximum input over voltage alarm
+in2_min			Minimum input under voltage warning
+in2_min_alarm		Minimum input under voltage warning alarm
+in2_rated_min		Minimum rated input voltage
+in2_rated_max		Maximum rated input voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+power1_max  		Maximum input power
+power1_rated_max	Maximum rated input power
+
+temp[1-2]_input		Measured temperature
+temp[1-2]_crit 		Critical temperature
+temp[1-2]_crit_alarm	Critical temperature alarm
+temp[1-2]_max		Maximum temperature
+temp[1-2]_max_alarm	Maximum temperature alarm
+temp[1-2]_rated_max	Maximum rated temperature
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan1_target		Fan 1 target.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1a3cb0a59f72..b1ea445479b0 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -58,6 +58,7 @@ Hardware Monitoring Kernel Drivers
    corsair-cpro
    corsair-psu
    cros_ec_hwmon
+   crps
    da9052
    da9055
    dell-smm-hwmon
diff --git a/MAINTAINERS b/MAINTAINERS
index 7523a456fd6f..e194478ecc55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6118,6 +6118,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
 
+INTEL CRPS COMMON REDUNDANT PSU DRIVER
+M:	Ninad Palsule <ninad@linux.ibm.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/crps.rst
+F:	drivers/hwmon/pmbus/crps.c
+
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 M:	"David S. Miller" <davem@davemloft.net>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 22418a05ced0..43b6df04e0f9 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -85,6 +85,15 @@ config SENSORS_BPA_RS600
 	  This driver can also be built as a module. If so, the module will
 	  be called bpa-rs600.
 
+config SENSORS_CRPS
+	tristate "Intel Common Redundant Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the Intel
+	  Common Redundant Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called crps.
+
 config SENSORS_DELTA_AHE50DC_FAN
 	tristate "Delta AHE-50DC fan control module"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 3d3183f8d2a7..c7eb7739b7f8 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -62,3 +62,4 @@ obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
+obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
diff --git a/drivers/hwmon/pmbus/crps.c b/drivers/hwmon/pmbus/crps.c
new file mode 100644
index 000000000000..164b33fed312
--- /dev/null
+++ b/drivers/hwmon/pmbus/crps.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 IBM Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+static const struct i2c_device_id crps_id[] = {
+	{ "intel_crps185" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, crps_id);
+
+static struct pmbus_driver_info crps_info = {
+	.pages = 1,
+	/* PSU uses default linear data format. */
+	.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_IIN |
+		PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+		PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+};
+
+static int crps_probe(struct i2c_client *client)
+{
+	int rc;
+	struct device *dev = &client->dev;
+	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (rc != 7 || strncmp(buf, "03NK260", 7)) {
+		buf[rc] = '\0';
+		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n", buf);
+	}
+
+	rc = pmbus_do_probe(client, &crps_info);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to probe\n");
+
+	return 0;
+}
+
+static const struct of_device_id crps_of_match[] = {
+	{
+		.compatible = "intel,crps185",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, crps_of_match);
+
+static struct i2c_driver crps_driver = {
+	.driver = {
+		.name = "crps",
+		.of_match_table = crps_of_match,
+	},
+	.probe = crps_probe,
+	.id_table = crps_id,
+};
+
+module_i2c_driver(crps_driver);
+
+MODULE_AUTHOR("Ninad Palsule");
+MODULE_DESCRIPTION("PMBus driver for Intel Common Redundant power supplies");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


