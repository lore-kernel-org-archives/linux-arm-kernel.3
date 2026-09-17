Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43ADC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeIgvphI+LPzS5P0ex7mko96E1kXXs3hCH7XitTslVA=; b=G4hHTNtfhCblFprCXwpsbAkQ8B
	QGChjHGnYZcdDESGSJuuYgsAbcLLbMaexBmKi/KivCy7UvrP4G/Df6ErFODORtpMXkhREpAGJfjU0
	OuSivdo8VpM456exjWpGks/yDq8jUESzjEC8xYOuXuDMP/ANSzxSdYqV0lGSQbRIAr2YfTFCxghqg
	HFwcbATI2idaKOPExK6loCUldCUH/zHPYWn16kEQUnGOv3NlZbARNg3S8u+kPXCTceHB7XBdN8uws
	sOnBaRApmpeQW+zWaVdTL6Z5oZmrrNsn7vsZspPCpc+uHligiuh9IcCLshEivdH5sWJtTVaD1hYV9
	6dtlccDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BB3-0000000BHg3-1DzP;
	Thu, 17 Sep 2026 12:25:21 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BAz-0000000BHdV-2Iso
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:25:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso642535f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647916; x=1790252716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeIgvphI+LPzS5P0ex7mko96E1kXXs3hCH7XitTslVA=;
        b=jeRv+5W4/Izt4eP1iCkncrW9s8/T1FfOZEHVj5irGmJBlAPz76RqHeLH9QTs1rbt1A
         S0gu53FNec36XeBbw+U8SmtSvIQouhuzOggIsswqKRBhted054iLi84+Za8I7ZoxjXsa
         uK/EOUMs0fkUwrzf/pUq6VY/JItukEvJJXV4rt5bLU35xT11q2ZF2F2wTJ5cn3Vg3y1l
         rtCXuNxvOQzwysZhzsGrVnp7mQuOLcikY4eqtuTSr2pHKzJPchTYyy+9EKcqpiL7j1Dl
         262p5sp0m1Pc75lHdRdJPEFeb43myLoKbpVdFplTzWl0su6lkMdVo5zqgldr+elRAxQy
         lmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647916; x=1790252716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeIgvphI+LPzS5P0ex7mko96E1kXXs3hCH7XitTslVA=;
        b=W/OCVGJWEpX9NZ665W4jdaWFYyUEiwgaD66pWdJnQ9MYJFpNeGO9eQZ67KFOh6eIM+
         CjK3IzCV20hFxGwLEDk6fRrlb4hpL0H+MmIT8eNC9Wx9uTE7qT5a5bjbDAYHmOFAOY/Y
         /3UduuYlYJZW3keR1L0IXmEFXx/eeuMT7NKTXbNteQGfnFszM8JK3uepgHlCMURXHthF
         5QWaBi0rCL/WIw0ZxLzO+gm562Kd1uUAGKO0rQ/Uijz0RZqWpSA7yJ9ItBIXFPE4Y1+B
         mTICIHe5h4HJJg4UiW4rRFZBUDZHeENMXm6uguB5/gi6OagbfjB9uWXARRsqTVxXtP96
         7d1A==
X-Forwarded-Encrypted: i=1; AKwUvBwztmYDaNYHAIGo0qh6cdxprQlIcB8L0ifLwUY+8iAUPb4K2eIn/WtBoQAiOPZtaC+it3rfdSVekwcGNI+R9pvj@lists.infradead.org
X-Gm-Message-State: AFuF++k333YqrNcXjOpUge0P9fIyxjjl72EoiO2nv0qiPJrpwXpfGNTh
	/hVzt5CpL9eIRJu6Tj/VSjYQZRMAxIy1nWsyP8G3GgtpNmp7E6TXwof2
X-Gm-Gg: AYBFou2nIbk6hsQioxLqcRxApTxt5bSmjK8mX/vkoj2ulnq9Jt6qpVhYPQpr+MJAxJz
	bgIDrtb5l44eZZgiDc2Reww81DV0GNoqQK5Mqm2jm6SGviZE+XgcM7+zdBeKPVvpYfaD1lMtjkk
	4LuLyRBLnZFpG+JyA2HqGcdb1MA5LAgYWwblo69rUxI/mq9L9lczWk3+QOaFjmo/borDXUicjCm
	YBM4iwUy8QsSdUJaZ9scMbmx1X3TxkgYujGDfM40WI7bw5DBb5hWpl8qqF00pacWtnGqYslWqKM
	VjiVw7XqBfJwMQuT/4C0huhqvfRqK5qZsY3/UFhmjAba9kLZl+bk38aMKistesAK3OP3NPTmsv+
	Yo+QPtgNW3pHeG6ylUSNnxTaJL3V3aGc9w5ZZ0vImqsEqDztxfQTJ6pERUayZm/MZBHb6/lT9p8
	0A9TU2sIXaVc/IR4yNR7KjI2FjJVP4dFwqHck19Gi3OEUU8HroJh7WpmnYoWkHGJtApVxU2SL9r
	dz27L8wyvpqkmzSiNGyRKWWojNQCh4UxfNcaunecJUZRK4=
X-Received: by 2002:a05:6000:1a86:b0:487:10b5:a88a with SMTP id ffacd0b85a97d-48710b5a941mr11468742f8f.9.1789647915655;
        Thu, 17 Sep 2026 05:25:15 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm15276567f8f.20.2026.09.17.05.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:15 -0700 (PDT)
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
Subject: [PATCH v2 2/2] rtc: Add Raspberry Pi 5 RTC driver
Date: Thu, 17 Sep 2026 14:21:44 +0200
Message-ID: <20260917122144.703221-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917122144.703221-1-sander.speetjens@gmail.com>
References: <20260917122144.703221-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052517_650023_F3DEA6D3 
X-CRM114-Status: GOOD (  36.04  )
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

Upstreaming the downstream Raspberry Pi 5 RTC driver.
This driver supports the custom DA9091, which is accessed through the firmware mailbox.

V1 -> V2:
Instead of the original driver, which was directly bound to the device tree. This driver is bound to the Raspberry Pi firmware device by creating a child device in the firmware driver probe function. The child device is then bound to this driver, which uses the firmware mailbox to access the RTC.

A couple of minor changes have been made to the driver since it was originally written, including:
- Checking if the model is a Raspberry Pi 5, as the RTC is only present on that model.
- Using the new devm_rpi_firmware_get() and devm_init_wakeup() helper to get the firmware device and avoid leaking memory.
- Using millivolts instead of microvolts for the trickle charge voltage, to match the RTC standard.
- Instead of setting the trickle charge voltage to 0 to disable trickle charging, the property is now optional. If the property is not present, trickle charging is disabled, per the RTC standard.
- Renaming the driver dt match compatible to "raspberrypi,firmware-rtc" to match the other firmware bindings.
- Renaming the driver name to "raspberrypi-rtc" to match the other firmware drivers.

Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c |  19 +++
 drivers/rtc/Kconfig            |  11 ++
 drivers/rtc/Makefile           |   1 +
 drivers/rtc/rtc-raspberrypi.c  | 277 +++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..b284c689f782 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -24,6 +24,7 @@
 
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
+static struct platform_device *rpi_rtc;
 
 struct rpi_firmware {
 	struct mbox_client cl;
@@ -231,6 +232,21 @@ static void rpi_register_clk_driver(struct device *dev)
 						-1, NULL, 0);
 }
 
+static void rpi_register_rtc_driver(struct device *dev)
+{
+	struct device_node *firmware;
+
+	firmware = of_get_compatible_child(dev->of_node,
+					   "raspberrypi,firmware-rtc");
+	if (firmware) {
+		of_node_put(firmware);
+		return;
+	}
+
+	rpi_rtc = platform_device_register_data(dev, "raspberrypi-rtc",
+						-1, NULL, 0);
+}
+
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
 {
 	struct rpi_firmware_clk_rate_request msg =
@@ -305,6 +321,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_rtc_driver(dev);
 
 	return 0;
 }
@@ -327,6 +344,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
+	platform_device_unregister(rpi_rtc);
+	rpi_rtc = NULL;
 
 	rpi_firmware_put(fw);
 }
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
index 0347645b021f..46f1a0fc2416 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -144,6 +144,7 @@ obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
 obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
 obj-$(CONFIG_RTC_DRV_R7301)	+= rtc-r7301.o
 obj-$(CONFIG_RTC_DRV_R9701)	+= rtc-r9701.o
+obj-$(CONFIG_RTC_DRV_RPI)	+= rtc-raspberrypi.o
 obj-$(CONFIG_RTC_DRV_RC5T583)	+= rtc-rc5t583.o
 obj-$(CONFIG_RTC_DRV_RC5T619)	+= rtc-rc5t619.o
 obj-$(CONFIG_RTC_DRV_RK808)	+= rtc-rk808.o
diff --git a/drivers/rtc/rtc-raspberrypi.c b/drivers/rtc/rtc-raspberrypi.c
new file mode 100644
index 000000000000..af775ae55a87
--- /dev/null
+++ b/drivers/rtc/rtc-raspberrypi.c
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
+	u32 bbat_vchg_millivolts;
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
+	u32 data[2] = {RTC_BBAT_CHG_VOLTS, vrtc->bbat_vchg_millivolts * 1000U};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				    &data, sizeof(data));
+
+	if (err)
+		dev_err(dev, "failed to set trickle charge voltage to %umV: %d\n",
+			vrtc->bbat_vchg_millivolts, err);
+	else if (vrtc->bbat_vchg_millivolts)
+		dev_info(dev, "trickle charging enabled at %umV\n",
+			 vrtc->bbat_vchg_millivolts);
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
+	struct rpi_firmware *firmware;
+	int ret;
+
+	// Check if our model is a Raspberry Pi 5, as the RTC is only present on that model.
+	const char *model = of_get_property(of_root, "model", NULL);
+	if (!model || strncmp(model, "Raspberry Pi 5", 14) != 0) {
+		dev_err(dev, "RTC is only available on Raspberry Pi 5\n");
+		return -ENODEV;
+	}
+
+	// Get the firmware device from the parent device
+	firmware = devm_rpi_firmware_get(dev, dev->parent->of_node);
+
+	if (!firmware)
+		return -EPROBE_DEFER;
+
+	vrtc = devm_kzalloc(dev, sizeof(*vrtc), GFP_KERNEL);
+	if (!vrtc)
+		return -ENOMEM;
+
+	vrtc->fw = firmware;
+
+	devm_device_init_wakeup(dev);
+
+	platform_set_drvdata(pdev, vrtc);
+
+	vrtc->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(vrtc->rtc))
+		return PTR_ERR(vrtc->rtc);
+
+	vrtc->rtc->range_max = U32_MAX;           /* 2106-02-07 */
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
+	vrtc->bbat_vchg_millivolts = 0;
+	of_property_read_u32(dev->parent->of_node, "trickle-charge-millivolt",
+			&vrtc->bbat_vchg_millivolts);
+
+	rpi_rtc_set_charge_voltage(dev);
+
+	return devm_rtc_register_device(vrtc->rtc);
+}
+
+static const struct of_device_id rpi_rtc_dt_match[] = {
+	{ .compatible = "raspberrypi,firmware-rtc"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rpi_rtc_dt_match);
+
+static struct platform_driver rpi_rtc_driver = {
+	.probe = rpi_rtc_probe,
+	.driver = {
+		.name = "raspberrypi-rtc",
+		.of_match_table = rpi_rtc_dt_match,
+	},
+};
+
+module_platform_driver(rpi_rtc_driver);
+
+MODULE_DESCRIPTION("Raspberry Pi RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


