Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90738CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybAe4Yq5WnbodBsCF6/CHnT6jJ3uUESQY3Wg7H337Q8=; b=1ONbsjP3ASoZMclYpahBe1lUDo
	BkyjD4jQYVrzx0pdZUV0ynb6QoyrEzXQrPNv2J963sKYcgVHCjTcJSh8jg5AdOwtr6x5W0wgzAS9T
	JmfKlfkQAqaxtXLe90Fp44Jx7D3v4zydfJOLPq7Gh7pc8pGyDzB7jR+cbCsS5AU3Dxc6ciwfsyU7f
	gU43vRezmfPIYDeHG1MN1H7RW7EKsmrjkkkGe0zWoOlNhhDt7i5NEV4s7xHh1YVCpDMpE9vSE0lYt
	7b4rT/KcpeSlc1018O8iaMNtTEmwLdI+nourogHLsMienSElroCh31C1GjZKGA3EwFWr+B0xIScds
	DwkZKEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKVB-0000000BLl8-0PK7;
	Sat, 16 May 2026 19:16:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUy-0000000BLfr-3DV7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 19:16:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-834f1075805so761961b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958992; x=1779563792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybAe4Yq5WnbodBsCF6/CHnT6jJ3uUESQY3Wg7H337Q8=;
        b=pbU2FajlZud0UrhKfF17IXhjmPNH6kgjo9Lo3cRlgDqkDxeLGklDDnOxsha7d82b2D
         ZLhzCpTySftyRGfMfnZrrp9K4AS4APxm3dhG9R1Nwc4nDtbocfvtJsex2Foqky4IVsL9
         Q0zAEJVdFPpRm76MQZuEzhkzH6YOwxjmd2UUx/xU4v2JAa2MufvSQZgJEfv2jADAcu4D
         7H8b4IQiygeORNlwW+0OdO05tUBAFPGBhBtvqoy2mTQK0BraflvAB+Larka6eJjRx4rZ
         mcSP8CagCb10pkgfu6EwTKRvOusb2Xd8pMIH25cqQUNtieVphDUdOtCGtzuzaui9qZJO
         H9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958992; x=1779563792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybAe4Yq5WnbodBsCF6/CHnT6jJ3uUESQY3Wg7H337Q8=;
        b=nUwDMo/keW2LbE5AlzA3QQQrm08HqOXugD005whoPaqOfIdaz0kDrRrYUDCc6E106b
         NmQlBbeG8GOVr/9hhpkk6aXqshgJyEAsvWimZltS9QrNnbgA/OP3M0Nyxd1F1b6n/uyB
         kp0xrC+KzAYKxhj375eh2D0bpwiiO8UllWmZB1R4Qh4lecdBvUq8tDf/ljXYneh5GlJ2
         QSuUx9R7H0zX1g4wpBdeD+Z10BkkdAWOYMZR94iNeBgGtJiEt/7lVDm6Gx1XyTecqC1y
         1NgUTzu4PR9o7sdS6nJLiS3e9EDvap3yaOneurDpwmL0bLfFwGwkodMx125rCMYltFjI
         nv4g==
X-Forwarded-Encrypted: i=1; AFNElJ/+ZKYsUu2dr9nCaMDbUD6k/lT2LbDEKraUNPapNpSVXbdYXIM6wVTINeAryL6EbtURqrk0JH+kiwtwRr2sl6qN@lists.infradead.org
X-Gm-Message-State: AOJu0YxFg465bq1qlW/oM9nFlckKmB2AYBc77AhhtfC6afdhyzQFfxfn
	96xLYRxcv7oFDSjwNLhmNXOMk96eB9W6kDmWH05xYhz1GwxwOeYeT9vM
X-Gm-Gg: Acq92OF56PC/03HHfWuXq84MoEWqH17I1O1i/R3CMJOQNFNrVUF1bchMQw1Slo3S5A3
	zdpO6JwtF6kYMOI1Hniso+HQcr7xh5AdwEbaXU5hhAur+4R0IekIUkNsb/0v1ojxaAPO8VRgAvs
	9lNx5y7TIagWVgue4gfoAyxxOq0w82/YoeUrLFryBSf4ZVmsHaIRI/UL7Vke2yg53pFvFuNJxFN
	PGeHli51t7ThoM6REDkwXd/+HEtlHghY0WEDSQ9QeO8zVJWw/lBCMacUHvNn0nxS82Os2T/5NYS
	J6tIp4VfcOS7IFhZR97FEzwvVY3TGWoeQo5nyo9W1GBao3KDAQq0u9cH1IaGmkVD4cZBOe/1Vqb
	TjhcnBGe9IiMUsEWLRPdD+DJD46yyi7G/WYZm2xqF7mOB0IAOgqY9v/5ixZqQI+YWnJFiVkyEeo
	gXJPBmNSBi5LGKh2Foa0gkJdStRnPIGbkTLldz2Ujg4yuN3wvqGqViDpTtsPbPkwoN9X3b
X-Received: by 2002:a05:6a00:340c:b0:83b:aa29:3415 with SMTP id d2e1a72fcca58-83f33cb5e9bmr9160316b3a.17.1778958991872;
        Sat, 16 May 2026 12:16:31 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 2/2] hwmon: raspberrypi: Add voltage input support
Date: Sun, 17 May 2026 00:45:55 +0530
Message-ID: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_121632_806281_5BD35028 
X-CRM114-Status: GOOD (  22.72  )
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

Extend the raspberrypi-hwmon driver to expose firmware-provided
voltage measurements through the hwmon subsystem.

The driver now exports the following voltage inputs:

  - in0_input (core)
  - in1_input (sdram_c)
  - in2_input (sdram_i)
  - in3_input (sdram_p)

Voltage values returned by firmware are converted from microvolts
to millivolts as expected by the hwmon subsystem.

Update the documentation related to it.

The existing undervoltage sticky alarm handling is preserved and
associated with the first voltage channel.

Tested in -
- Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
  Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/hwmon/raspberrypi-hwmon.rst |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c         | 134 +++++++++++++++++++++-
 2 files changed, 144 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/raspberrypi-hwmon.rst b/Documentation/hwmon/raspberrypi-hwmon.rst
index 8038ade36490..db315184b861 100644
--- a/Documentation/hwmon/raspberrypi-hwmon.rst
+++ b/Documentation/hwmon/raspberrypi-hwmon.rst
@@ -20,6 +20,17 @@ undervoltage conditions.
 Sysfs entries
 -------------
 
-======================= ==================
+======================= ======================================================
+in0_input		Core voltage in millivolts
+in1_input		SDRAM controller voltage in millivolts
+in2_input		SDRAM I/O voltage in millivolts
+in3_input		SDRAM PHY voltage in millivolts
+in0_label		"core"
+in1_label		"sdram_c"
+in2_label		"sdram_i"
+in3_label		"sdram_p"
 in0_lcrit_alarm		Undervoltage alarm
-======================= ==================
+======================= ======================================================
+
+The voltage inputs and labels are only exposed if the firmware reports support
+for the corresponding voltage ID.
diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2..4f96f37116f3 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -5,6 +5,7 @@
  * Based on firmware/raspberrypi.c by Noralf Trønnes
  *
  * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
+ * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
 #include <linux/devm-helpers.h>
@@ -18,13 +19,26 @@
 
 #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
 
+struct rpi_firmware_get_value {
+	__le32 id;
+	__le32 val;
+} __packed;
+
 struct rpi_hwmon_data {
 	struct device *hwmon_dev;
 	struct rpi_firmware *fw;
+	u32 valid_inputs;
 	u32 last_throttled;
 	struct delayed_work get_values_poll_work;
 };
 
+static const char * const rpi_hwmon_labels[] = {
+	"core",
+	"sdram_c",
+	"sdram_i",
+	"sdram_p",
+};
+
 static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 {
 	u32 new_uv, old_uv, value;
@@ -56,6 +70,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }
 
+static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
+				    long *val)
+{
+	struct rpi_firmware_get_value packet;
+	int ret;
+
+	packet.id = cpu_to_le32(id);
+	packet.val = 0;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
+				    &packet, sizeof(packet));
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(packet.val) / 1000;
+	return 0;
+}
+
 static void get_values_poll(struct work_struct *work)
 {
 	struct rpi_hwmon_data *data;
@@ -77,19 +108,94 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
 
-	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+			switch (channel) {
+			case 0:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_CORE,
+						val);
+			case 1:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+						val);
+			case 2:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+						val);
+			case 3:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+						val);
+			default:
+				return -EOPNOTSUPP;
+			}
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0) {
+				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+				return 0;
+			}
+			return -EOPNOTSUPP;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	if (type == hwmon_in && attr == hwmon_in_label) {
+		if (channel >= ARRAY_SIZE(rpi_hwmon_labels))
+			return -EOPNOTSUPP;
+
+		*str = rpi_hwmon_labels[channel];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	const struct rpi_hwmon_data *data = _data;
+
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			if (!(data->valid_inputs & BIT(channel)))
+				return 0;
+			return 0444;
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0)
+				return 0444;
+			return 0;
+		default:
+			return 0;
+		}
+	}
+
 	return 0;
 }
 
 static const struct hwmon_channel_info * const rpi_info[] = {
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_LCRIT_ALARM),
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
 	NULL
 };
 
 static const struct hwmon_ops rpi_hwmon_ops = {
-	.visible = 0444,
+	.is_visible = rpi_is_visible,
 	.read = rpi_read,
+	.read_string = rpi_read_string,
 };
 
 static const struct hwmon_chip_info rpi_chip_info = {
@@ -101,6 +207,7 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_hwmon_data *data;
+	long voltage;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -110,6 +217,26 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	/* Parent driver assure that firmware is correct */
 	data->fw = dev_get_drvdata(dev->parent);
 
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_CORE,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(0);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(1);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(2);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(3);
+
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
 							       data,
 							       &rpi_chip_info,
@@ -159,6 +286,7 @@ static struct platform_driver rpi_hwmon_driver = {
 module_platform_driver(rpi_hwmon_driver);
 
 MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.54.0


