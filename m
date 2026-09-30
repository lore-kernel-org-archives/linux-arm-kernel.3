Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE4FCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHBzvkyAz6qIuzrHXiXDcUpv5YLjttHF1IIwKiFQRgs=; b=w14Lqe0IGj9o7Jcp5Ud8+RkknC
	fWm77s2befsO9EXGd+Tngg1Lmv56pVfvWa6d8B+KCyGnA650Pe+r97cJyj2Swy0pqEsWP4j5/epXW
	+batosVWD1+0MzVlTgIeCddJ2JFb+WH6aEe8M4PsELE8q975luBErZLLgag6geDI3G8S7U+GnNXDq
	lhrmCIJho4Xe5bm/ZFXLhxAjmPSBvx8tA1BQ0ShjxFzpU2QMnEkPFXue7m3Pdv7swwCWIluPpk5Ne
	ILulO1IqPR0U3jhPDlg++81OGGrto/I46XEDOImHRGKLH5sIpAPmSKDVy3r2uYvodp74TXpbwKDFj
	f7t28bkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp2T-00000005K25-1AgA;
	Wed, 30 Sep 2026 07:47:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp18-00000005JRk-0b6X
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oHBzvkyAz6qIuzrHXiXDcUpv5YLjttHF1IIwKiFQRgs=; b=RnQJ2tMnTNxa+ZQbghDpeQXysH
	+biyNptCZtXT2mL+p5dxpcHqOitnVIFd7m7AUmxeTkKTrbV/oTbBsb4Z+f7/h356p0R9331dX5nCA
	aHD7BDjmC1oFe96c6O1RykW6Hh1yfPSKCjCGHBin7e5z1ljsYALM9i+dbHXMCKS6FILa7rCGayfg1
	vWx8euCW4jv0eq2xFKn1YU+eWnXlRi7cKiuv66UD+8BrxSAN+J3RKBwdSnNvUwkodGbGVH8jKgC1F
	9usSB9QQ9D+K3ZYsX2OGcDwDhCjnB1y/7cgCy1CScpzCrDs+EQbUmanYbiBu/70ThCW1rk5OgLNwU
	aCkw6p7w==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBp14-00000003ULM-3wGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:46:16 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48882c1f2baso1427981f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754373; x=1791359173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHBzvkyAz6qIuzrHXiXDcUpv5YLjttHF1IIwKiFQRgs=;
        b=lGQ7nK1raWiABROTNJx3g+lc8KIr5b3JlXKLW+QD58MlssgnKS50OnWa1GOa28APe5
         bTcM1SddVkYJu5m1/4uDN4PUdmZ4vk60ruJvbf+iaEtd3iIcHZb+dsHieEKXX2lqWazC
         zgqJIqI4ILQpiBzsCXhFyWOxqSjbftE6h0m7uTPFB7YdcwXWuTu8DLsSkkxp1BuX1szY
         7aIusd9clqWSGwamPnBAaNJYpGYVrkWHgwjD6tlXbke8iqlJPGQ/vcxSJU4Gf2HJ6qoZ
         0eEKxZayEo7cGWQzSVAbvemlAdpkc7zgctKoe6U+QwB+lUbTYn6ZjPpRAg9j5ZlLlVK5
         zzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754373; x=1791359173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHBzvkyAz6qIuzrHXiXDcUpv5YLjttHF1IIwKiFQRgs=;
        b=GiBAsmeYBmbBPNgc9CeXlgekztckhAwQBIpu61i1sRBfWaOWTlloRy8MImsMwily2l
         myGiO3LJaAOnS2f/Bt7nejcb8gZ4ArD23wDaY+XsEfdlIl8n9jBL7JDU4Fk5LHOSvS/p
         6Q9pTWc006/7Y50lcxs940eutH5eFQ3TH7oW+n0Tj9mP9q4hPO3mjM7zsoCoZvd6gHul
         a2Eoljs5MVM8AgyRZV87HOH3r7Fcd7j855FqNCgL24O6bG1aHOOGevWjbLXBgpcMgSgB
         h96gnUEpdEgcM3mQy/VBvBqS0u0Y6JEnyKpNdvih5r/dObw4a/vdZg8JkAPJrRizaZ36
         v6dA==
X-Forwarded-Encrypted: i=1; AKwUvBz4+X72fW4evcfdOjy4YlrVdznNz29mfYvSkjfnVwC4RKc3MWK1TtOk/bQI+b4UKOrdY9fgNdCxqwB/iHQDiWf7@lists.infradead.org
X-Gm-Message-State: AFq9FYJZreB36EFyNcOkJ0IRr9+YCh3EHyeX+2NITOEm1blaygPGswt4
	EYCnCNuhEluNbkT5lpNx1Jd2I19GOLnXiJ1toaxMbV3gX00kvJoO59xa
X-Gm-Gg: AYBFou3W7qQc/Ikvciz6sM/vL1SXYh/8cDtOpT0673tPnQglR2YbuCkSDdVSWHEPatv
	SpzEs/es0Y1BOcPxn+GLeonsca/sf5IzSwV5C6LpRSN4VTrFE2c8/qQPQs+VzoNn9nUFx8odW4f
	IaK1S6J6lDK3xGRQ+BZbEycDoK8xlTrCsFYsmF++y5aaPzpcK9ea4eLx2pwvC7Gq5dnIlvHo4Zj
	lVP8qUlohtloGoySt0PqEKU3MFgKbKfqYo9XDmqbaAxdEPXJQIGV1ocxlt0d1TtzpEgOXG3SS35
	plvv0VQHGEun7B2Yww7lxqPZcrSAPvKTwLp1mL25qItJnW/To9JV86JFMxAje4aWDJwIYgQ2ryF
	ZdFg6ZEP3R36csyjirgLJGa1PCitzOuyqlvOcFYbIPDdouS15p/PibTPajPlGXkGdR41mTAn2L5
	LWglHkhj3htu6ZJL6uGvNd7iZ2Eiq9lzjsF89CFgmkPbo9vedNyB4dnLZEF7MbSBRRVoJtKoR9B
	7ETS0QWk3GzXExoW6BQldYjWESV8//+jOL0EfSMbbTyUQ==
X-Received: by 2002:a5d:5e84:0:b0:487:27f9:843 with SMTP id ffacd0b85a97d-48b0258264cmr1060720f8f.56.1790754372559;
        Wed, 30 Sep 2026 00:46:12 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0185asm1487480f8f.32.2026.09.30.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:46:11 -0700 (PDT)
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
Subject: [PATCH v6 2/2] rtc: Add Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 09:46:08 +0200
Message-ID: <20260930074608.479089-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930074608.479089-1-sander.speetjens@gmail.com>
References: <20260930074608.479089-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_084615_226831_3D38A044 
X-CRM114-Status: GOOD (  41.68  )
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

 drivers/firmware/raspberrypi.c |  25 ++++
 drivers/rtc/Kconfig            |  12 ++
 drivers/rtc/Makefile           |   1 +
 drivers/rtc/rtc-raspberrypi.c  | 251 +++++++++++++++++++++++++++++++++
 4 files changed, 289 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..a35f00c6fb2c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -24,6 +24,7 @@
 
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
+static struct platform_device *rpi_rtc;
 
 struct rpi_firmware {
 	struct mbox_client cl;
@@ -231,6 +232,27 @@ static void rpi_register_clk_driver(struct device *dev)
 						-1, NULL, 0);
 }
 
+static void rpi_register_rtc_driver(struct device *dev)
+{
+	struct device_node *firmware;
+
+	// Check if our model is a Raspberry Pi 5, as the RTC is only present on that model.
+	const char *model = of_get_property(of_root, "model", NULL);
+
+	if (!model || strncmp(model, "Raspberry Pi 5", 14) != 0)
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
@@ -305,6 +327,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_rtc_driver(dev);
 
 	return 0;
 }
@@ -327,6 +350,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
+	platform_device_unregister(rpi_rtc);
+	rpi_rtc = NULL;
 
 	rpi_firmware_put(fw);
 }
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 05b9233b9418..4dbe20bcace8 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1999,6 +1999,18 @@ config RTC_DRV_R7301
 	   This driver can also be built as a module. If so, the module
 	   will be called rtc-r7301.
 
+config RTC_DRV_RPI
+        tristate "Raspberry Pi RTC"
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+        depends on ARCH_BRCMSTB || COMPILE_TEST
+        default ARCH_BRCMSTB
+        help
+          If you say yes here you get support for the RTC found on
+          Raspberry Pi devices.
+
+          This driver can also be built as a module. If so, the module
+          will be called rtc-raspberrypi.
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
index 000000000000..53178d1eaf48
--- /dev/null
+++ b/drivers/rtc/rtc-raspberrypi.c
@@ -0,0 +1,251 @@
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
+struct rpi_rtc_data {
+	struct rtc_device *rtc;
+	struct rpi_firmware *fw;
+	u32 bbat_vchg_millivolts;
+	u32 bbat_vchg_min_millivolts;
+	u32 bbat_vchg_max_millivolts;
+};
+
+static int rpi_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_TIME };
+	int err;
+
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	rtc_time64_to_tm(le32_to_cpu(data[1]), tm);
+	return err;
+}
+
+static int rpi_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_TIME, cpu_to_le32(rtc_tm_to_time64(tm)) };
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_irq_is_enabled(struct device *dev, unsigned char *enabled)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_ALARM_ENABLE };
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
+	u32 data[2] = { RTC_ALARM_ENABLE, enabled };
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_clear_pending(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_ALARM_PENDING, 1 };
+
+	return rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_ALARM };
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
+	u32 data[2] = { RTC_ALARM, rtc_tm_to_time64(&alarm->time) };
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
+static void rpi_rtc_set_limits(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_BBAT_CHG_VOLTS_MIN };
+
+	int err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					&data, sizeof(data));
+	if (err == 0)
+		vrtc->bbat_vchg_min_millivolts = data[1] / 1000U;
+
+	data[0] = RTC_BBAT_CHG_VOLTS_MAX;
+	data[1] = 0;
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	if (err == 0)
+		vrtc->bbat_vchg_max_millivolts = data[1] / 1000U;
+}
+
+static int rpi_rtc_set_charge_voltage(struct device *dev)
+{
+	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
+	u32 data[2] = { RTC_BBAT_CHG_VOLTS, vrtc->bbat_vchg_millivolts * 1000U };
+	int err;
+
+	if (vrtc->bbat_vchg_millivolts != 0 &&
+	    (vrtc->bbat_vchg_millivolts < vrtc->bbat_vchg_min_millivolts ||
+	    vrtc->bbat_vchg_millivolts > vrtc->bbat_vchg_max_millivolts)) {
+		dev_warn(dev, "trickle charge voltage %umV is outside of the supported range (%umV - %umV)\n",
+			 vrtc->bbat_vchg_millivolts,
+			 vrtc->bbat_vchg_min_millivolts,
+			 vrtc->bbat_vchg_max_millivolts);
+		return -EINVAL;
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
+
+	return err;
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
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:raspberrypi-rtc");
-- 
2.55.0


