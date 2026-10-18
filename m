Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B48CCF2CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R2Am0pzHroS24EV9vCKe/B0SJu2m9Gae1TG04O1MgE=; b=LZJCyROrmWATS4mpNZCnIzipc0
	m5Uj8V0x2fG4T0ziUyHD+cbT2uGlIoOMwprTLLq7i5ls2ZWJQnRdPAR5cHgMUFLSluovt64DbhPXA
	Cl1brnObb1g+2+fD3b5iIdv+zkUUyvGTJ09bq2kKeEs6v/NRiewmU/Pz+G7xc8DNWFF2vJrpLAOB8
	1hAhx46PlFVhtAfiCDT2aS/9AJi8fzwX1NiR0w+lrjJJMxKK/vLZvrR0frSHw9euGbOt4tKIh40H7
	43wG684rxuBt070vWopCU32ladzwJZDZCbVVVMYJbLWICduN00VJkpp3Wx6b7cKWjmNu73c9Xhgkc
	B9uBXVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1U-00000005wsz-08Dk;
	Sun, 18 Oct 2026 14:38:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1L-00000005wpY-1d1w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 14:37:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so3154105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334273; x=1792939073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1R2Am0pzHroS24EV9vCKe/B0SJu2m9Gae1TG04O1MgE=;
        b=RTbsrCCeF4lSa39/JTAJ+6UMnolWDB0ALpZ+E5W1JuXSDdtpo91roPh/mbIk26pog2
         e+FBuIcT/KOChCezeN/qloOO0kpl6tOPKllhXYufOGNbfkRcQQJk6BXvf+29e8mjMBb8
         4CfmIPn8hyjJUwgb/WYZ2dZNxzHc73ya+veAS4PcXBfGr8QtWA0mJQJ6lDsECrJVSm48
         25pnnzrx0YqsqWdQrm+kIQx7IlahCj+nj8B+Jhjlg6afc+MVNh1fXgPdCF/aDhgcCNOv
         zki0/JCuCshNgUqMqxlMNHBqfH89EYFuVnwfw8wHA+WzM+3fyYe/4YXwl7zxvOzvJigj
         1RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334273; x=1792939073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1R2Am0pzHroS24EV9vCKe/B0SJu2m9Gae1TG04O1MgE=;
        b=KtDKl6Im2lHeZmmgIfRTu0uYPGE4zAwoDhO+eLsvS2XxamoOvCxwX4qQb71p3vFiWa
         SEvtpM+m254VoO+cVLpJ49vZ7i4O+rwcJwaYCWk8f8e3mBpw1lg5NvJCkwBGAIYZ1jh+
         IKF4n9pl2G4xCXp3ZTA0J9gQdpXbl8MgkPVGq2FrRGvx2zkgJflTdVQbkxa/LMjJh9YF
         ctusJtyAR14AiPPh/4TagpFYNtMgNVJPGze28jV/IkiMe9fh0cNXN/fGGTRaw++k33cJ
         3yWPMevjAX5kJxKQCdLNMKB+zJIsFzZ6YAdPBD0N8dDQJuTHqrXAyvZCZ9jGZVM+huWP
         IKMg==
X-Forwarded-Encrypted: i=1; AKwUvBwYEEJNfE8AvuyvJHZX0gDOn5dLRvA2AS7RM45HJ3SU3XJFOL6pTfCegk+OUXa4160p8Ik9gmd2t+phaWUlgjPk@lists.infradead.org
X-Gm-Message-State: AFq9FYJSRhFDo3SuwAb3/PDTNsXaLfngHD0JLbvQdG1R6fB2i6g55w+Y
	tSlHWWGZwxXT0OopglrwzTCqsVdt1OWM2vEKMcIcjDziD4CZ3iBry7sB
X-Gm-Gg: AYBFou3yUm8bJ0GXBOtO2lJ3yVwjk7xd4qag3bpl8JG37BQocEeNv66rysKJ5ESBQww
	/lUlS0XkNXQD+PX0OMHgE5Sq6E8mUL1uI8hMUucd9+bV+9DI8s/qOpzDnod8vMO250DbNjk1ld5
	nk3/Cki5eWFaeN9YahdgoQCis6B76V+zmuJ9rJsGEDHqs975YKOO3/RBcek3WV+AEH49RhMeqck
	6o33cheH+rc5S9r2TOtU9a1VWFqLPD8cP8xPkIi4yioDPPETNENV3tZF++PjtJTt0UKuRdWyJDs
	3thWymwUg2BcdUpCa8Dca1mCO8+MdvvnewI1Jjs0TrA5f1wwk61oJOjyFTroi/8cfQCSmviWqRj
	jJx/KV0+2Wc3nBYVzcY6AUhgSY1RdQeyHXZts9QN6InhEAZcHOac/wNTFeBEPOgafkYW4kPq7Ye
	5aB8o6l4KJFlCLJx4PP3woLki/oRid7zFDwpEwQXtzdC5T2gJnVBPGnk8OfZiKroZpXhHfBmT0r
	TWyXzLBW64tLz7XIfzG4MTT9lvs5QVIIb+s+03XH50UBg==
X-Received: by 2002:a5d:6dcd:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48e07fa8cedmr7897251f8f.37.1792334273345;
        Sun, 18 Oct 2026 07:37:53 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm16559652f8f.58.2026.10.18.07.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:37:52 -0700 (PDT)
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
	pbrobinson@gmail.com
Subject: [PATCH v12 3/3] rtc: Add Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 16:37:12 +0200
Message-ID: <20261018143712.1040152-4-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018143712.1040152-1-sander.speetjens@gmail.com>
References: <20261018143712.1040152-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_073755_555137_DED03069 
X-CRM114-Status: GOOD (  33.31  )
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

Based on code originally written by Jonathan Bell
<jonathan@raspberrypi.com>
and Dom Cobley <popcornmix@gmail.com>

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V11 -> V12:
- Remove unused var in firmware
- Clear pending alarms before setting a new one 

V11: https://lore.kernel.org/linux-rtc/20261014083016.332338-1-sander.speetjens@gmail.com

 drivers/firmware/raspberrypi.c             |  24 ++
 drivers/rtc/Kconfig                        |  12 +
 drivers/rtc/Makefile                       |   1 +
 drivers/rtc/rtc-raspberrypi.c              | 278 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |   2 +
 5 files changed, 317 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..443459c8c90f 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -24,6 +24,7 @@
 
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
+static struct platform_device *rpi_rtc;
 
 struct rpi_firmware {
 	struct mbox_client cl;
@@ -231,6 +232,26 @@ static void rpi_register_clk_driver(struct device *dev)
 						-1, NULL, 0);
 }
 
+static void rpi_register_rtc_driver(struct device *dev)
+{
+	struct platform_device *pdev;
+
+	/*
+	 * Check if our model of Raspberry Pi board is from the 5th gen
+	 * as the RTC is only present on that model.
+	 */
+	if (!of_machine_is_compatible("brcm,bcm2712"))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-rtc",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	rpi_rtc = pdev;
+}
+
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
 {
 	struct rpi_firmware_clk_rate_request msg =
@@ -305,6 +326,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_rtc_driver(dev);
 
 	return 0;
 }
@@ -327,6 +349,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
+	platform_device_unregister(rpi_rtc);
+	rpi_rtc = NULL;
 
 	rpi_firmware_put(fw);
 }
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 05b9233b9418..6adaf425a76b 100644
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
+	  If you say yes here you get support for the RTC found on
+	  Raspberry Pi 5th gen devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-raspberrypi.
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
index 000000000000..4b55b887b4aa
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
+#define	RTC_TIME		0
+#define	RTC_ALARM		1
+#define	RTC_ALARM_PENDING	2
+#define	RTC_ALARM_ENABLE	3
+#define	RTC_BBAT_CHG_VOLTS	4
+#define	RTC_BBAT_CHG_VOLTS_MIN	5
+#define	RTC_BBAT_CHG_VOLTS_MAX	6
+#define	RTC_BBAT_VOLTS		7
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
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_TIME)
+	};
+	int err;
+
+	err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	rtc_time64_to_tm(le32_to_cpu(data.val), tm);
+	return err;
+}
+
+static int rpi_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_TIME),
+		.val = cpu_to_le32(rtc_tm_to_time64(tm))
+	};
+
+	return rpi_firmware_property(rtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_irq_is_enabled(struct device *dev, unsigned char *enabled)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM_ENABLE)
+	};
+	int err;
+
+	err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	*enabled = le32_to_cpu(data.val) & 0x1;
+	return err;
+}
+
+static int rpi_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM_ENABLE),
+		.val = cpu_to_le32(enabled)
+	};
+
+	return rpi_firmware_property(rtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_alarm_clear_pending(struct device *dev)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM_PENDING),
+		.val = cpu_to_le32(1)
+	};
+
+	return rpi_firmware_property(rtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				     &data, sizeof(data));
+}
+
+static int rpi_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM)
+	};
+	int err;
+
+	err = rpi_rtc_alarm_irq_is_enabled(dev, &alarm->enabled);
+	if (!err)
+		err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					    &data, sizeof(data));
+	rtc_time64_to_tm(le32_to_cpu(data.val), &alarm->time);
+
+	return err;
+}
+
+static int rpi_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_ALARM),
+		.val = cpu_to_le32(rtc_tm_to_time64(&alarm->time))
+	};
+	int err;
+
+	err = rpi_rtc_alarm_clear_pending(dev);
+
+	if (!err)
+		err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+					    &data, sizeof(data));
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
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS_MIN)
+	};
+
+	int err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+					&data, sizeof(data));
+	if (!err)
+		rtc->bbat_vchg_min_millivolts = le32_to_cpu(data.val) / 1000U;
+	else
+		dev_warn(dev, "failed to get minimum trickle charge voltage\n");
+
+	data.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS_MAX);
+	data.val = cpu_to_le32(0);
+	err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_GET_RTC_REG,
+				    &data, sizeof(data));
+	if (!err)
+		rtc->bbat_vchg_max_millivolts = le32_to_cpu(data.val) / 1000U;
+	else
+		dev_warn(dev, "failed to get maximum trickle charge voltage\n");
+}
+
+static void rpi_rtc_set_charge_voltage(struct device *dev)
+{
+	struct rpi_rtc_data *rtc = dev_get_drvdata(dev);
+	struct rpi_rtc_reg data = {
+		.reg = cpu_to_le32(RTC_BBAT_CHG_VOLTS),
+		.val = cpu_to_le32(rtc->bbat_vchg_millivolts * 1000U)
+	};
+	int err;
+
+	if (rtc->bbat_vchg_millivolts != 0 &&
+	    (rtc->bbat_vchg_millivolts < rtc->bbat_vchg_min_millivolts ||
+	    rtc->bbat_vchg_millivolts > rtc->bbat_vchg_max_millivolts)) {
+		dev_warn(dev, "trickle charge voltage %umV is outside of the supported range (%umV - %umV)\n",
+			 rtc->bbat_vchg_millivolts,
+			 rtc->bbat_vchg_min_millivolts,
+			 rtc->bbat_vchg_max_millivolts);
+		return;
+	}
+
+	err = rpi_firmware_property(rtc->fw, RPI_FIRMWARE_SET_RTC_REG,
+				    &data, sizeof(data));
+
+	if (err)
+		dev_err(dev, "failed to set trickle charge voltage to %umV: %d\n",
+			rtc->bbat_vchg_millivolts, err);
+	else if (rtc->bbat_vchg_millivolts)
+		dev_info(dev, "trickle charging enabled at %umV\n",
+			 rtc->bbat_vchg_millivolts);
+}
+
+static int rpi_rtc_probe(struct platform_device *pdev)
+{
+	struct rpi_rtc_data *rtc;
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
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->fw = firmware;
+
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc->rtc))
+		return PTR_ERR(rtc->rtc);
+
+	rtc->rtc->range_max = U32_MAX;           /* 2106-02-07 */
+
+	set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc->features);
+
+	rtc->rtc->ops = &rpi_rtc_ops;
+
+	rpi_rtc_alarm_clear_pending(dev);
+
+	/*
+	 * The trickle-voltage property lives on the parent firmware node
+	 * because we deliberately do not create a DT child node just to
+	 * instantiate this driver (see DT maintainer guidance).
+	 * The firmware driver registers us as a platform device at runtime.
+	 */
+	rtc->bbat_vchg_millivolts = 0;
+	of_property_read_u32(dev->parent->of_node, "trickle-voltage-millivolt",
+			     &rtc->bbat_vchg_millivolts);
+
+	rpi_rtc_set_limits(dev);
+	rpi_rtc_set_charge_voltage(dev);
+
+	return devm_rtc_register_device(rtc->rtc);
+}
+
+static const struct platform_device_id raspberrypi_rtc_id[] = {
+	{ "raspberrypi-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, raspberrypi_rtc_id);
+
+static struct platform_driver rpi_rtc_driver = {
+	.driver = {
+		.name = "raspberrypi-rtc",
+	},
+	.id_table = raspberrypi_rtc_id,
+	.probe = rpi_rtc_probe
+};
+
+module_platform_driver(rpi_rtc_driver);
+
+MODULE_AUTHOR("Jonathan Bell <jonathan@raspberrypi.com>");
+MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
+MODULE_DESCRIPTION("Raspberry Pi RTC driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 975bef529854..8c3d43977a03 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -75,6 +75,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
 	RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
+	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
@@ -92,6 +93,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
+	RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,
-- 
2.56.0


