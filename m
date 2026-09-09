Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE71EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8u8VJpPTCQW06OMcbNJMSceQi2D6H3mdsBS77V+NZc=; b=QQ9Y92126tQvQ0SmH9mSuMNe4N
	8mZEh77IvxQVU3Hw7pjyq+q5TikOcc9cPEIoLcBthGOXNO338p3QYASICemWV2hOmYg8hJhIB6QXm
	tGI0D/JNoNnJIeSFQ4bbsDSxXHhOY0iZayeg9ExCEiTA5Aq8o6tI26BLN8y3dCdOaA2niNf1ZoUCA
	mtlFk8bq1Hc5rL0hIUk0pWCvYPRTLGsFt3NEcRveMZDBHhturiyYYDmu3GWx0ZGMU3PXepGF+4WHo
	zo6zQ4NOli2ncJ7ZNKTNFIZZTkYT+01L9afddJhcTSQ3ZToWhStuZ7MpLQ0PaEvD3UhG9sZQGV6oX
	S7mHYWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3F-0000000Bv3y-3zLH;
	Wed, 09 Sep 2026 14:13:25 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3B-0000000Bv1I-34Pg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:13:23 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e257a23aso4040247f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963199; x=1789567999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8u8VJpPTCQW06OMcbNJMSceQi2D6H3mdsBS77V+NZc=;
        b=FqILjGSEBXTszQQtfKfw96UmZejPfnkYfa+jUDaiRSCTiQGNhTmxh0ym7+RbIw3oKd
         ZeTFk//Fm+oHh2sJsgAor9T94yItDcvc/xV06V/meg9gj1xJqoHIez5byGO6EXOiNVpV
         2cSGeSTI97ovgf8vgmkYvmtyObdhDmLM6fk6AmvAiMDl6qUjCa915KLgp7ThbE/S7ACc
         lRuCOtW7YNVG3+vJs9ASGE1a8ATyd3giDxB6Uei4JAq+DObPRUz534pDUyuol86We/YV
         L5xtmKvP0ewDKX2toWgE4KxQBOa6Mh6c9LKaoprL/Q994UqwgHWGAbOzagn05ReRHqxz
         EVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963199; x=1789567999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8u8VJpPTCQW06OMcbNJMSceQi2D6H3mdsBS77V+NZc=;
        b=tJjU7pPXct+3liy+a4zOguUQuoj80u2V6Gne3U90MhjeuU7AHoPp9gjzbTGbnysI17
         bAGpN/SBbKNWSoBRlTf0G7CxeZ3vEY9iBrWF+5qCyk2GDnWhStNJNGQeOZwZZQPL3+sK
         +PJSuqviTTX7dnvnTiWDeERns+5dYMlhh8xg3WVY4kAEEURbMZj0Tc+F37qjc0tpybfE
         Yzao67IuW9mr8V7hooaH2DUhqfVSXcPEG3uzO2Lm4f8p/41moiL1gBEQOltTPqRLWscE
         zJoFSrJjJpskm5f77szua0m77yWrVx7pSI7uRlC2mw6O5FIlnhmXzpG/DbOmvNLdK/+a
         EXjA==
X-Forwarded-Encrypted: i=1; AKwUvBzmmwVJ68m9Es/R5LjFHTuxYytSLFx2uRHdSbv8gZpQhMzGxUtl0N/VnKSKYzsAANFdmaoYLYND7afdU5cZ1XEG@lists.infradead.org
X-Gm-Message-State: AFuF++kiBKvD3g6fE85V5N7s5ZI97o8TK7ZIUAPyiimYI0TfW7fpPkFF
	N3RiD3bzi8NW3afmh/0D9Fqbp0WcYCVX/vKLfExKLzaKT/cxAI7vDScI
X-Gm-Gg: AYBFou1CdF3tUtJrTC0SyOluSsxVKfk4LWyQrG0AoV2PIP5cy5yNkQRZyH4r8RuaJRR
	wJgYt4nmScIKL9zNMwXadDVwj7dUxumpQKO9a61To+YRBp2bfqDO3zJyjI+nMfxzzsCkOCN6JSX
	DemyS++W3omWw2q+GAQ2SUUCKq0dxgPkTxQqYWy2g5dr1/6XqPXWBWAXyYWmHye+VRvBw26vVPm
	a5nmTiYqD5UXXjEqXLKJK5pTjKZgKntTa+Qi8s4HyKFzrR752nZlooRsoOV8xZVDYXIQVdMCxWK
	8VqeFZiNKTkAQAls36qgl9aELUSXt/3sYbG2nWKGPG8FLmnNQh/WUtZ31wFmIXMJFoAZWErF3tS
	CUJJlUoEpQG1Xw8v/kITC0w18T9uFNZWqspTOQkEACqXe7+lKTgH1BmIozpTzyBebEezaO96um0
	bnVT7e7PKZRlR2dJMrn2L1xj1KaqXBd/nSqOqsgXBVibEMLZYUt4M6mFOxwyQs6jP4G6MUvR5ht
	SzkR9/LWG2xb2pJdcYzsD7ZsbycMboSrai6nIUERzVzEg==
X-Received: by 2002:a05:6000:186d:b0:485:ac0e:6fb2 with SMTP id ffacd0b85a97d-485ac0e70a4mr5799917f8f.18.1788963199268;
        Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:18 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH 2/3] rtc: Add Raspberry Pi 5 RTC driver
Date: Wed,  9 Sep 2026 16:12:59 +0200
Message-ID: <20260909141300.1368790-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141300.1368790-1-sander.speetjens@gmail.com>
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071321_834274_BD8A4C53 
X-CRM114-Status: GOOD (  27.12  )
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

From: Jonathan Bell <jonathan@raspberrypi.com>

Upstreaming the downstream Raspberry Pi 5 RTC driver.
This driver supports the custom DA9091, which is accessed through the firmware mailbox.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/rtc/Kconfig   |  11 ++
 drivers/rtc/Makefile  |   1 +
 drivers/rtc/rtc-rpi.c | 277 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 289 insertions(+)
 create mode 100644 drivers/rtc/rtc-rpi.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 05b9233b9418..382973d46e06 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1999,6 +1999,17 @@ config RTC_DRV_R7301
 	   This driver can also be built as a module. If so, the module
 	   will be called rtc-r7301.
 
+config RTC_DRV_RPI
+        tristate "Raspberry Pi RTC"
+        depends on ARCH_BRCMSTB || COMPILE_TEST
+        default ARCH_BRCMSTB
+        help
+          If you say yes here you get support for the RTC found on
+          Raspberry Pi devices.
+
+          This driver can also be built as a module. If so, the module
+          will be called rtc-rpi.
+
 config RTC_DRV_STM32
 	tristate "STM32 RTC"
 	select REGMAP_MMIO
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 0347645b021f..78551bb04c5c 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -148,6 +148,7 @@ obj-$(CONFIG_RTC_DRV_RC5T583)	+= rtc-rc5t583.o
 obj-$(CONFIG_RTC_DRV_RC5T619)	+= rtc-rc5t619.o
 obj-$(CONFIG_RTC_DRV_RK808)	+= rtc-rk808.o
 obj-$(CONFIG_RTC_DRV_RP5C01)	+= rtc-rp5c01.o
+obj-$(CONFIG_RTC_DRV_RPI)	+= rtc-rpi.o
 obj-$(CONFIG_RTC_DRV_RS5C313)	+= rtc-rs5c313.o
 obj-$(CONFIG_RTC_DRV_RS5C348)	+= rtc-rs5c348.o
 obj-$(CONFIG_RTC_DRV_RS5C372)	+= rtc-rs5c372.o
diff --git a/drivers/rtc/rtc-rpi.c b/drivers/rtc/rtc-rpi.c
new file mode 100644
index 000000000000..e455b4116957
--- /dev/null
+++ b/drivers/rtc/rtc-rpi.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/**
+ * rtc-rpi.c
+ *
+ * RTC driver using firmware mailbox
+ * Supports battery backed RTC and wake alarms
+ *
+ * Based on rtc-meson-vrtc by Neil Armstrong
+ *
+ * Copyright (c) 2023, Raspberry Pi Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/of.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
+struct rpi_rtc_data {
+	struct rtc_device *rtc;
+	struct rpi_firmware *fw;
+	u32 bbat_vchg_microvolts;
+};
+
+#define RPI_FIRMWARE_GET_RTC_REG 0x00030087
+#define RPI_FIRMWARE_SET_RTC_REG 0x00038087
+
+enum {
+	RTC_TIME,
+	RTC_ALARM,
+	RTC_ALARM_PENDING,
+	RTC_ALARM_ENABLE,
+	RTC_BBAT_CHG_VOLTS,
+	RTC_BBAT_CHG_VOLTS_MIN,
+	RTC_BBAT_CHG_VOLTS_MAX,
+	RTC_BBAT_VOLTS
+};
+
+static int rpi_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_TIME};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	rtc_time64_to_tm(data[1], tm);
+	return err;
+}
+
+static int rpi_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_TIME, rtc_tm_to_time64(tm)};
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_irq_is_enabled(struct device *dev, unsigned char *enabled)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_ALARM_ENABLE};
+	s32 err = 0;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	*enabled = data[1] & 0x1;
+	return err;
+}
+
+static int rpi_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_ALARM_ENABLE, enabled};
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_clear_pending(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_ALARM_PENDING, 1};
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_ALARM};
+	s32 err = 0;
+
+	err = rpi_rtc_alarm_irq_is_enabled(dev, &alarm->enabled);
+	if (!err)
+		err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					    &data, sizeof(data));
+	rtc_time64_to_tm(data[1], &alarm->time);
+
+	return err;
+}
+
+static int rpi_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_ALARM, rtc_tm_to_time64(&alarm->time)};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				    &data, sizeof(data));
+
+	if (err == 0)
+		err = rpi_rtc_alarm_irq_enable(dev, alarm->enabled);
+
+	return err;
+}
+
+static const struct rtc_class_ops rpi_rtc_ops = {
+	.read_time = rpi_rtc_read_time,
+	.set_time = rpi_rtc_set_time,
+	.read_alarm = rpi_rtc_read_alarm,
+	.set_alarm = rpi_rtc_set_alarm,
+	.alarm_irq_enable = rpi_rtc_alarm_irq_enable,
+};
+
+static int rpi_rtc_set_charge_voltage(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = {RTC_BBAT_CHG_VOLTS, vrtc->bbat_vchg_microvolts};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				    &data, sizeof(data));
+
+	if (err)
+		dev_err(dev, "failed to set trickle charge voltage to %uuV: %d\n",
+			vrtc->bbat_vchg_microvolts, err);
+	else if (vrtc->bbat_vchg_microvolts)
+		dev_info(dev, "trickle charging enabled at %uuV\n",
+			 vrtc->bbat_vchg_microvolts);
+
+	return err;
+}
+
+static ssize_t rpi_rtc_print_uint_reg(struct device *dev, char *buf, u32 reg)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev->parent);
+	u32 data[2] = {reg, 0};
+	int ret = 0;
+
+	ret = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%u\n", data[1]);
+}
+
+static ssize_t charging_voltage_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	return rpi_rtc_print_uint_reg(dev, buf, RTC_BBAT_CHG_VOLTS);
+}
+static DEVICE_ATTR_RO(charging_voltage);
+
+static ssize_t charging_voltage_min_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	return rpi_rtc_print_uint_reg(dev, buf, RTC_BBAT_CHG_VOLTS_MIN);
+}
+static DEVICE_ATTR_RO(charging_voltage_min);
+
+static ssize_t charging_voltage_max_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	return rpi_rtc_print_uint_reg(dev, buf, RTC_BBAT_CHG_VOLTS_MAX);
+}
+static DEVICE_ATTR_RO(charging_voltage_max);
+
+static ssize_t battery_voltage_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	return rpi_rtc_print_uint_reg(dev, buf, RTC_BBAT_VOLTS);
+}
+static DEVICE_ATTR_RO(battery_voltage);
+
+static struct attribute *rpi_rtc_attrs[] = {
+	&dev_attr_charging_voltage.attr,
+	&dev_attr_charging_voltage_min.attr,
+	&dev_attr_charging_voltage_max.attr,
+	&dev_attr_battery_voltage.attr,
+	NULL
+};
+
+static const struct attribute_group rpi_rtc_sysfs_files = {
+	.attrs = rpi_rtc_attrs,
+};
+
+static int rpi_rtc_probe(struct platform_device *pdev)
+{
+	struct rpi_rtc_data *vrtc;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *fw_node;
+	struct rpi_firmware *fw;
+	int ret;
+
+	fw_node = of_parse_phandle(np, "firmware", 0);
+	if (!fw_node) {
+		dev_err(dev, "Missing firmware node\n");
+		return -ENOENT;
+	}
+
+	fw = rpi_firmware_get(fw_node);
+	if (!fw)
+		return -EPROBE_DEFER;
+
+	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
+	if (!vrtc)
+		return -ENOMEM;
+
+	vrtc->fw = fw;
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	platform_set_drvdata(pdev, vrtc);
+
+	vrtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(vrtc->rtc))
+		return PTR_ERR(vrtc->rtc);
+
+	set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, vrtc->rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, vrtc->rtc->features);
+
+	vrtc->rtc->ops = &rpi_rtc_ops;
+	ret = rtc_add_group(vrtc->rtc, &rpi_rtc_sysfs_files);
+	if (ret)
+		return ret;
+
+	rpi_rtc_alarm_clear_pending(dev);
+
+	/*
+	 * Optionally enable trickle charging - if the property isn't
+	 * present (or set to zero), trickle charging is disabled.
+	 */
+	of_property_read_u32(np, "trickle-charge-microvolt",
+			     &vrtc->bbat_vchg_microvolts);
+
+	rpi_rtc_set_charge_voltage(dev);
+
+	return devm_rtc_register_device(vrtc->rtc);
+}
+
+static const struct of_device_id rpi_rtc_dt_match[] = {
+	{ .compatible = "raspberrypi,rpi-rtc"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rpi_rtc_dt_match);
+
+static struct platform_driver rpi_rtc_driver = {
+	.probe = rpi_rtc_probe,
+	.driver = {
+		.name = "rpi-rtc",
+		.of_match_table = rpi_rtc_dt_match,
+	},
+};
+
+module_platform_driver(rpi_rtc_driver);
+
+MODULE_DESCRIPTION("Raspberry Pi RTC driver");
+MODULE_LICENSE("GPL");
\ No newline at end of file
-- 
2.55.0


