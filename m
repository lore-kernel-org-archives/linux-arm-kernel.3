Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A8ACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpSQZYW9cHOFp0nZ3DJvRTrd6ZNtS3bDiMK+dRLrpgQ=; b=r4Z94S1tQcy9Sn8/fNaFUjvX3z
	94BtEh73lT4A+8pYy2KWokcVWLs0abgl6orkxYXoL8u3O7Xgm9bi2ODJnZCpN6Y7Fpoar49wH+I5z
	5Sv0jluWdV0m/0JyCuSnkYGqQUsJbfDUnyxo2LjeEpWaj2pjGK2Yyq527CTWU9ZHPZkyJtkZxVe/M
	x15Zei+c5e6YHzyhNX2A4s57ymV5HaAvAQSy7fJz33HL+qW4a53jWTLlPjQTSFlN25Ihx00jPmtQt
	LBZuXa/ard90t1vr/QE45o5RwtKI61e1qI/7JnyaSeUBS/LTsf2P0hs6bQ5cvgCZFmYiFeuXrM6MJ
	hyDAfObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMaj-0000000A5qi-12H6;
	Thu, 01 Oct 2026 19:37:17 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMad-0000000A5ld-2a31
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:37:13 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso27424225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790883430; x=1791488230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpSQZYW9cHOFp0nZ3DJvRTrd6ZNtS3bDiMK+dRLrpgQ=;
        b=GKkKT8Vjct8lteNFrfP2HzGYcSOicV2YSnnOKUmNSfF32EgmwBztOoxLwVsE2ZFjJh
         p2YU58i2pt92O46wiA9A4GbntT54KJEsd5mxWaz6xs0cR3X7szC3qrf77KhhxrHtjFbE
         5pzCB1veov0bZPN43kSK5GQdGJxO4cWjyV5JMTVe7H8QTMB+PKV1ZKhORdzXa+OI0Tsp
         akTXN4SiDb930MxgSbDgLdoRyBvOrVbAL4xaQhnHEWW8fT7PcKjbnVCgnt3b7yH17iWO
         QSsCrVG9USfdE5BPyGnl1aI5Sha7MLfXBsSOFYvWMl2NE8kgUViiJSnm2uX6rtw3CkqF
         clug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883430; x=1791488230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpSQZYW9cHOFp0nZ3DJvRTrd6ZNtS3bDiMK+dRLrpgQ=;
        b=i3y7DxPLDoh6DS1M0pbg4F8ssFwyJN7dvFOYs0dF72MB3w5h1UfPi3asa0SvuXkWRB
         sH7JS58nn7KIuVbMB9uCTuVubKWV6DzRlnrs5GSvX0bd3x93eOqp4q3VncuMqavA8kjo
         xyuk5B2xik5Z5Fsd1+zhzrnWmhPrC6CE8Vlkj6OX/wjWbcRiN9G6UJd3VMBOVs6AvMvJ
         oOqxHGQCgE8o+WhVa7AQbGfHe7/zR/BzVZ2HJZeDs5CyPCWBrSvqhdsnM7C5Ic7KGeqD
         Kd/sV9tqOWHYPUraTct0sEk2DFUSg9Y3LdyQ8JtOi9yEAz6frDPqd8qj/71hvs1usVSo
         4oYg==
X-Forwarded-Encrypted: i=1; AKwUvBy+wmX9aWtMfI8UOQKq8hmxzrEjfV+tctOpaCoWrfK+zkOPwygnqXjLEgjHhQWsbb+qPhNfY6oVRylaiy5utsF+@lists.infradead.org
X-Gm-Message-State: AFuF++nJN2TTX+8fIMclhGSjVbl7VdpZdqzG4V+G++rqIYlINrklvy/J
	Ux5izvZpiIhX6f+wxG98CngkmBOTS9uBVr8cstxt+NjEPCWDGk7KFNXq
X-Gm-Gg: AYBFou3a9keeUBeU9KAjZg8GMtcQCWLu8wyHfe+pqL0vpmGuW5a0CRq7nJi8wAZWghF
	A1M52cWZuSRGQC1CJB54y7oY9c93qfWY/AGtQ9CmHirWhO8wY77F+JTgXumEur9J1TXp162yAea
	88/ariBNyXPG0oIjpwfL6mt4Ib52S52q7b3A4caWX57RGUF/cW62UO9zZaDdd2icAfTCfE67sYu
	6QBlV56avr17y6s4mqcO1d+BEb788hdeyTOoKqw3jWgZV5a+XTKRYjB978FC6tr3/poNKphLn3K
	Gi7s4cQhVb3/T8z0ADkFfr47Ysy2toCtf0xV3n59dpBvmiSptZ4JAPsM53Xjqq6X9FGWc6iYm7g
	z52GqSM2GVTzjKsIbJ/aqYJuicokU/fYaXTfQ8k/NbDVdhyGcvlznhgSU3SbQcOuETCewwcPN0X
	nNjDB5hBU4JaLkesmTsjH3Sbw/1ar86pBo6qtsRRO/EUa5KKP2sud7EOHYLp4zAh1R0UqFKXD/0
	G28TR3J+BOCGKqskHUd0BQ+jlI3KdeChqG9R4chl4D8lw==
X-Received: by 2002:a05:600c:840e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-4a0276ea428mr11958135e9.27.1790883429906;
        Thu, 01 Oct 2026 12:37:09 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm12312315e9.6.2026.10.01.12.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:37:09 -0700 (PDT)
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
	pbrobinson@gmail.com,
	Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH v9 3/3] rtc: Add Raspberry Pi 5 RTC driver
Date: Thu,  1 Oct 2026 21:37:03 +0200
Message-ID: <20261001193703.734323-4-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001193703.734323-1-sander.speetjens@gmail.com>
References: <20261001193703.734323-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_123711_803716_7349BFC0 
X-CRM114-Status: GOOD (  38.31  )
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
This driver supports the custom DA9091,
which is accessed through the firmware mailbox.

Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V8 -> V9:
- Fix whitespace in Kconfig
- Move RTC regs to firmware header
- Add a warn when getting the min or max charging values fails
- Remove the unused return value of set charge voltage

V7 -> V8:
- Fix whitespacing errors
- Use of_machine_is_compatible instead of strncmp

V6 -> V7:
- Move from u32 array to struct
- Fix encapsulation as mentioned by sashiko-bot

V5 -> V6:
- Add MODULE_ALIAS, as mentioned by sashiko-bot
- Encapsulate the mailbox data in le32_to_cpu or cpu_to_le32, as
  mentioned by sashiko-bot. For good practice

V4 -> V5: No changes

V3 -> V4:
- Fix Kconfig depends that disallows having Raspberrypi
firmware built as a module while the rtc driver is built in
- Remove sysfs
- Add limits from firmware properties and check in rpi_rtc_set_charge_voltage

V2 -> V3:
- Move platform check to firmware and abort before registering
a platform device if on another platform
- Add a dependency on the Raspberry Pi firmware to Kconfig
- Check return value of devm_device_init_wakeup
- Fix property name

V1 -> V2:
Instead of the original driver, which was directly bound to the device tree.
This driver is bound to the Raspberry Pi firmware device by creating
a child device in the firmware driver probe function.
The child device is then bound to this driver,
which uses the firmware mailbox to access the RTC.

A couple of minor changes have been made to the driver since it was originally written, including:
- Checking if the model is a Raspberry Pi 5, as the RTC is only present on that model.
- Using the new devm_rpi_firmware_get() and devm_init_wakeup() helper to get the firmware device and avoid leaking memory.
- Using millivolts instead of microvolts for the trickle charge voltage, to match the RTC standard.
- Instead of setting the trickle charge voltage to 0 to disable trickle charging, the property is now optional. If the property is not present, trickle charging is disabled, per the RTC standard.
- Renaming the driver dt match compatible to "raspberrypi,firmware-rtc" to match the other firmware bindings.
- Renaming the driver name to "raspberrypi-rtc" to match the other firmware drivers.

 drivers/firmware/raspberrypi.c             |  23 ++
 drivers/rtc/Kconfig                        |  12 +
 drivers/rtc/Makefile                       |   1 +
 drivers/rtc/rtc-raspberrypi.c              | 278 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |   2 +
 5 files changed, 316 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..b91b63136882 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -24,6 +24,7 @@
 
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
+static struct platform_device *rpi_rtc;
 
 struct rpi_firmware {
 	struct mbox_client cl;
@@ -231,6 +232,25 @@ static void rpi_register_clk_driver(struct device *dev)
 						-1, NULL, 0);
 }
 
+static void rpi_register_rtc_driver(struct device *dev)
+{
+	struct device_node *firmware;
+
+	// Check if our model is a BCM2712, as the RTC is only present on that model.
+	if (!of_machine_is_compatible("brcm,bcm2712"))
+		return;
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
@@ -305,6 +325,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_rtc_driver(dev);
 
 	return 0;
 }
@@ -327,6 +348,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
+	platform_device_unregister(rpi_rtc);
+	rpi_rtc = NULL;
 
 	rpi_firmware_put(fw);
 }
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 05b9233b9418..6dae4c069be2 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1999,6 +1999,18 @@ config RTC_DRV_R7301
 	   This driver can also be built as a module. If so, the module
 	   will be called rtc-r7301.
 
+config RTC_DRV_RPI
+	tristate "Raspberry Pi RTC"
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	default ARCH_BRCMSTB
+	help
+		If you say yes here you get support for the RTC found on
+		Raspberry Pi devices.
+
+		This driver can also be built as a module. If so, the module
+		will be called rtc-raspberrypi.
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
index 000000000000..16e4017d0a1c
--- /dev/null
+++ b/drivers/rtc/rtc-raspberrypi.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/**
+ * rtc-raspberrypi.c
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
+struct rpi_rtc_data {
+	struct rtc_device *rtc;
+	struct rpi_firmware *fw;
+	u32 bbat_vchg_millivolts;
+	u32 bbat_vchg_min_millivolts;
+	u32 bbat_vchg_max_millivolts;
+};
+
+struct rpi_rtc_reg {
+	__le32 reg;
+	__le32 val;
+} __packed;
+
+static int rpi_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_TIME)
+	};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	rtc_time64_to_tm(le32_to_cpu(data.val), tm);
+	return err;
+}
+
+static int rpi_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_TIME),
+		.val = cpu_to_le32(rtc_tm_to_time64(tm))
+	};
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_irq_is_enabled(struct device *dev, unsigned char *enabled)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM_ENABLE)
+	};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	*enabled = le32_to_cpu(data.val) & 0x1;
+	return err;
+}
+
+static int rpi_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM_ENABLE),
+		.val = cpu_to_le32(enabled)
+	};
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_clear_pending(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM_PENDING),
+		.val = cpu_to_le32(1)
+	};
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM)
+	};
+	int err;
+
+	err = rpi_rtc_alarm_irq_is_enabled(dev, &alarm->enabled);
+	if (!err)
+		err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					    &data, sizeof(data));
+	rtc_time64_to_tm(le32_to_cpu(data.val), &alarm->time);
+
+	return err;
+}
+
+static int rpi_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM),
+		.val = cpu_to_le32(rtc_tm_to_time64(&alarm->time))
+	};
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				    &data, sizeof(data));
+
+	if (!err)
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
+static void rpi_rtc_set_limits(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS_MIN)
+	};
+
+	int err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					&data, sizeof(data));
+	if (!err)
+		vrtc->bbat_vchg_min_millivolts = le32_to_cpu(data.val) / 1000U;
+	else
+		dev_warn(dev, "failed to get minimum trickle charge voltage\n");
+
+	data.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS_MAX);
+	data.val = cpu_to_le32(0);
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	if (!err)
+		vrtc->bbat_vchg_max_millivolts = le32_to_cpu(data.val) / 1000U;
+	else
+		dev_warn(dev, "failed to get maximum trickle charge voltage\n");
+}
+
+static void rpi_rtc_set_charge_voltage(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS),
+		.val = cpu_to_le32(vrtc->bbat_vchg_millivolts * 1000U)
+	};
+	int err;
+
+	if (vrtc->bbat_vchg_millivolts != 0 &&
+	    (vrtc->bbat_vchg_millivolts < vrtc->bbat_vchg_min_millivolts ||
+	    vrtc->bbat_vchg_millivolts > vrtc->bbat_vchg_max_millivolts)) {
+		dev_warn(dev, "trickle charge voltage %umV is outside of the supported range (%umV - %umV)\n",
+			 vrtc->bbat_vchg_millivolts,
+			 vrtc->bbat_vchg_min_millivolts,
+			 vrtc->bbat_vchg_max_millivolts);
+		return;
+	}
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
+}
+
+static int rpi_rtc_probe(struct platform_device *pdev)
+{
+	struct rpi_rtc_data *vrtc;
+	struct device *dev = &pdev->dev;
+	struct rpi_firmware *firmware;
+	int ret;
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
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return ret;
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
+
+	rpi_rtc_alarm_clear_pending(dev);
+
+	/*
+	 * The trickle-voltage property lives on the parent firmware node
+	 * because we deliberately do not create a DT child node just to
+	 * instantiate this driver (see DT maintainer guidance).
+	 * The firmware driver registers us as a platform device at runtime.
+	 */
+	vrtc->bbat_vchg_millivolts = 0;
+	of_property_read_u32(dev->parent->of_node, "trickle-voltage-millivolt",
+			     &vrtc->bbat_vchg_millivolts);
+
+	rpi_rtc_set_limits(dev);
+	rpi_rtc_set_charge_voltage(dev);
+
+	return devm_rtc_register_device(vrtc->rtc);
+}
+
+static const struct of_device_id rpi_rtc_dt_match[] = {
+	{ .compatible = "raspberrypi,firmware-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpi_rtc_dt_match);
+
+static struct platform_driver rpi_rtc_driver = {
+	.driver = {
+		.name = "raspberrypi-rtc",
+		.of_match_table = of_match_ptr(rpi_rtc_dt_match),
+	},
+	.probe = rpi_rtc_probe
+};
+
+module_platform_driver(rpi_rtc_driver);
+
+MODULE_AUTHOR("Jonathan Bell <jonathan@raspberrypi.com>");
+MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
+MODULE_DESCRIPTION("Raspberry Pi RTC driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:raspberrypi-rtc");
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 975bef529854..e13994d8281c 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -75,6 +75,8 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
 	RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
+	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
-- 
2.55.0


