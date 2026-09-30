Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE201CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBWkGkDc+oQ2cR+XlQk929W1FLbiF1uO23P8lM3/OV0=; b=fWmS29UDLu6YZx3xtqpULpNwbf
	9sPn6rLxS5CraOZYNzBmbidHB/tGwtlAd0qFwts6Nk6IID/LUiE30nhrOMwnMn9OTVDSWO+SodF8i
	Cq3HvIFH0vIXk9cc39VdwP/2ug+uqsE33O05lSiEBH3AlcAEubI3fGD5hX24T6ovt2LFQTfBAYjgg
	dpgbqPe0v9b4P7haSrsg1D4pWT+ciVx2SkNWHBbmrS3BQTlN2eZFDu+8SQ/D/VgiU2QHQ35UtrT2i
	+JoKrCLMYfpsGWP7Nmwih5ANYnswQgvPJKddUXh3XEqlYPjYEMRDZ6p/cMKj9bsbD63X9DRHtkxZF
	kUH1gSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqzG-00000005cfD-0g2S;
	Wed, 30 Sep 2026 09:52:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqz0-00000005caB-3zk0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QBWkGkDc+oQ2cR+XlQk929W1FLbiF1uO23P8lM3/OV0=; b=rb4/nXcSKmpX4/qGgDCeHRMNp4
	pXRhZkv+Lj+s3kEa5Gvrbjg6icgm5UnxsDKe4S54AmQsBZvNHq+AOgFbea641tofubo2RGyWbyb4f
	aDrPksyVXLN0RcWcL54AlifI5zvkV3KJfCcjx95uRrxDXN9vqE+MpLA9H9cPGlcms13d6G/EaF/oS
	fDO8Ui3nUIGJItkp5sNrzd6TAxTeU5AjtWzutTHRq6gBBVW5ICripay72F3mGtoBXnkeNQNkc5MaR
	Mjiime1+vf+NGfalndgxzitm+PBLKw7d39R+d+eHDhGGQ53hYCjfgcqi98IqsCoQ9BCyTXUp81Mv1
	F3Q37Z7Q==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqyu-00000003be5-1dQX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:52:13 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff72474fso21539925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761927; x=1791366727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBWkGkDc+oQ2cR+XlQk929W1FLbiF1uO23P8lM3/OV0=;
        b=ECkOv3lyj/iyeQ0GWuunBsaRf8KLUbuAymIagAII99eudUv0rnuIxFpoxUT/nlVCEQ
         HKYS6zeKU6hCK/3Ixq5rxurBXYdC6vA9xxUl+4iGUXT65UFfM3VuFfx2cuZmtXG/JMEx
         pAFq/8AzOgNZTLD5OiJr4WHsVBiuEa0lTejJm4M3c7a1cohxN0kbDIas9b/G5LF3hRE/
         2/NZLZ8qSVTZuTHfm55BqGDLED5GXhtKNmHvqdQ1x53D5KvlFqT/H/9PmhKpatvTYf+J
         znMvneDzjFX1fwFu9wr7FhNpsFkvD3T/9QKfv+JooIjX4kv8oaMEA/DoiVfN+HUEn41D
         6+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761927; x=1791366727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBWkGkDc+oQ2cR+XlQk929W1FLbiF1uO23P8lM3/OV0=;
        b=cfhndHZ2+NNQTViRxYNecwZCuqXl849BGdleHTixhTBiwxAIL+lxGMldH5HiMbU4tT
         246LjCbJyiEivdlmLqCgTdnLzYcaUe9NTv/WMFQjBnKsgAEggLjro0uDTvP+y/jXM/Cf
         BQIC0pLo0Fc/7S/r36tQTeCyCTWDi54pIAhW2ERQat05ciVfwdM9OPxujHJ53dCJviD5
         xDopx2VovoUlMi4SHZsDL81Z7FCEpSoAleZ4mE5jO+PvhCF8Fazcn+mLZhl2oFNww/4i
         SguEOzRy/s0AUKlPxSVG0gxtXTZ48MgZUncPJmryMTTz07M//UOKFLfEKxmyTKn7jgzg
         WWFg==
X-Forwarded-Encrypted: i=1; AKwUvBwIcyt6jwi5BzxId5Pk9l5lmrF0lLQ9MLZYAo7sFxERiOj399XOWVcintA5CMFd9HauxoVrWrjQhGMO3yFc5O3e@lists.infradead.org
X-Gm-Message-State: AFuF++k2FXHPnbFGtJ1yc/Gjva6z0Ck2ShdFkLbw9ZC6EqFpUqOqkLD/
	VGDycs6tqOv1p7pPQg8pNXBOTscIfUQeT10B+HpMUxCnUnGBUjUmZFd+
X-Gm-Gg: AYBFou0WqdPJdMfD7hMp9GLNdG3CW3qd6BPfwg6VctoX9MVGFFvaCY5BQsZdDHwydJu
	hKj/xGho3El6EH598A+aiHqMMiU5lJVacZgfQrwvGCg+EtWi9nKIon2+2ogz3Zx2xrjV0Y0bHV9
	AeEE6RdWA92ctTfVZu/ihaR4Sh5utvUAM/EuAFmWU/DLnYEb2LbGVHAG0Af8jEn4s3ovzveH0uG
	nYR+2IjJZVOud29+FDJYKr2QK+VBZza5e8vWD6XxEdpRX3/1ppfbU52B0btrx+hOrbRmDLwS3wT
	safFtX7mLR7vWr30yg9fMvIgNb/Il70onTfBN/GhXvLzMtQEW4zqCeEV3godH6QfA2+s9ZW3Wql
	Z6lRZzIhqsb2P/zj7ca/0mkwZ1CGyVXP05XGTkRg6UKVy6u+bVvulzxyLyFgwIfPuSVwKqnBbE3
	4Fd4/pJhmkMo+dwYraaRwazSNOY4atpxrwr0+vrZFWKi7eHEMdNa2HboHA8ugxrWqOWMpC1ZP3V
	FLVzUnuWc1+e74Lml7GV37zknWq2CpKVSsbvsvmZganDQ==
X-Received: by 2002:a05:600c:45d3:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a01aff9b3dmr12464275e9.12.1790761926552;
        Wed, 30 Sep 2026 02:52:06 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015abd9ffsm43859655e9.2.2026.09.30.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:52:06 -0700 (PDT)
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
Subject: [PATCH v8 2/2] rtc: Add Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 11:52:03 +0200
Message-ID: <20260930095203.492949-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930095203.492949-1-sander.speetjens@gmail.com>
References: <20260930095203.492949-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_105210_300481_DC492CF2 
X-CRM114-Status: GOOD (  40.66  )
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


 drivers/firmware/raspberrypi.c |  23 +++
 drivers/rtc/Kconfig            |  12 ++
 drivers/rtc/Makefile           |   1 +
 drivers/rtc/rtc-raspberrypi.c  | 279 +++++++++++++++++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..b5ee6d7a8951 100644
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
+	// Check if our model is a Raspberry Pi 5, as the RTC is only present on that model.
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
index 000000000000..3b77a0cef1d3
--- /dev/null
+++ b/drivers/rtc/rtc-raspberrypi.c
@@ -0,0 +1,279 @@
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
+	s32 err = 0;
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
+	s32 err = 0;
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
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS_MIN)
+	};
+
+	int err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					&data, sizeof(data));
+	if (err == 0)
+		vrtc->bbat_vchg_min_millivolts = le32_to_cpu(data.val) / 1000U;
+
+	data.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS_MAX);
+	data.val = cpu_to_le32(0);
+	err = rpi_firmware_property(vrtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	if (err == 0)
+		vrtc->bbat_vchg_max_millivolts = le32_to_cpu(data.val) / 1000U;
+}
+
+static int rpi_rtc_set_charge_voltage(struct device *dev)
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


