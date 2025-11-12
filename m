Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E06CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3U72yXoy8URZJehSyBgGHubHpkITsAXeWW6E7/w/5P4=; b=qjGZDwFPXUILqvCmm14CC8anAU
	mxVvC5xdPaXg5dKOE1vENVHqa1Zexj7EEDOP+/JYvdg0WVB2+P/5MoZVzW9k18bqlHJvLzEixuO+I
	C7Cdw4H9/EaepkAlQtVN05YBEv9VvEM/gMfGLYAeFIMSHqhKE1HvvzfjdnJvFeE9bURUwO0YCH6RM
	V9axF2rOGiU3tkfMXAoUS+iC2wXD8TKIBdkjvmTLrgnDTjNSltPT3kxxXleykPN33q7hR9fAZZdHv
	xtLk/qlxZTT0YQh72soxNNphcyQFd5Ian7Sou9FhSBtK+a4S4KrRWnOW1lDEgkakW2z+FQw3c9h/R
	4ZFSr5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rR-00000008f8v-0ntY;
	Wed, 12 Nov 2025 11:18:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rO-00000008f7c-0rN7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:17:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-297d4ac44fbso4655215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946277; x=1763551077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U72yXoy8URZJehSyBgGHubHpkITsAXeWW6E7/w/5P4=;
        b=ZvcNcozorBhBDf4XEkb1yQC4aKTdhCiMrHoiBct0Jw27H57GxgL7ctyQemc47HUiGa
         TTahFT0H11E0UkrchWVyvHaXuISF4Vnp4Rl5QCLeySK0CQYedvBS+tMGNEdfGCvaFlBV
         9ikylYWdKEVc0r651yvMU+YAz4QR9vokqAFp7g2iwdOf4oXNz6WQg7eln0m/TL5X71UC
         0go8X509RSN1W58yiyxAfQgCrlTt+Ik72LQ3Eecn42z8ahpEBa81aZd1MMkzK2+8nPOq
         FKXOIBI/1N5ZlCSWwn1cI4IU2Mjo55MKXsfzX16aE7jcX7iTWogGLVLPdf6iyBg/mC45
         VG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946277; x=1763551077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3U72yXoy8URZJehSyBgGHubHpkITsAXeWW6E7/w/5P4=;
        b=fLMf4VcYo+4OkQqw8VPAWp7VLcVto+e78spePi6MEQ2XLLqdG7Nsn5G1AyX7ctuuQd
         w0OWvFbQRuZeLSwuxuODpewyGscc78hc+EPW9Uudpv0syPzrNqtmRVtgSDTjf5qtmMrz
         Kg6eg3QctmDDn9GJfaf1Z24ZcSdarHqNd1zss2MezWGQaGxysS2GMd8u4VLpxAf7Uu2a
         6qV6iqUD2cfDs1bpc1L0DQ0wRzZBgfDwo/qERJPtkeGdTx5kh8dJaX6T5tDo+SZbGPna
         kWNIzcFAs1qpBLh0us3kQvB23kIuYUTXCRV937LlVFs2umh9V0b3XF67VDjVMpdmAcXW
         aPHw==
X-Forwarded-Encrypted: i=1; AJvYcCWBuMysthofpp87TUwSj9TQiqxhg40mFjGofH0ZRcU/YU4qo3T+ul/oPmUMx9SOQjgkM0FJx749Y5nWlRrHnSP1@lists.infradead.org
X-Gm-Message-State: AOJu0YyxU3e3qO3RoUPP1vlnbKHtoMiqFIt3mlf39Y7ocdEwGEWTzTNS
	s0e1NNyQvrJMwfmatf7RNCFqtNgsA+iZ79tMWcPo2N5K5F5FokMdFsUT
X-Gm-Gg: ASbGncszIJw//RQiKOTb+4SVN8Jy8bcH5mLLUQOQCq23/G5CONUsUHAjGrfe3RQYHSq
	wJzH4eMEI1ahETX4nt4YL0FgpDvIxEPJAu+IPnzo8B8kwk0CN0ILYvJW1h2qHr/EVUjRXLzCdp1
	YvENInRMDRpVGCL2CY1h3iaqVOnS0Y+sJ/87oo4yF6lJgBsGnNcGBDl678xXXzbZMaYbp/dIdf1
	udPuV+ygNxox/68HlqlaD8kAH2eZZLr6aUhWAVWzj/tQfCTM9u7+mLciRJE3clPmwvtQCkHLnbv
	1D2ms/XNKXdPhKWsyC3J0oAQW20Y8gFqUDMugJjK2KaPiGG5g3KqPvf6pvoB0t0pzYKfVMVfGB+
	vUCxAw1UDa+WV5WLpacr/vYAXK1usDLFlzEjde6mBm6mV00vT+4Obq5LHsz4JyfcLGTSeSxBNyT
	7cOdemmXyogDI6DyCgUbEywJnysoxtWDHqAyF1e8rx6DuvNxDMSujHLebnx46PPOg/DO56scQv0
	ZS5Ww5oW93tyCWBYxWDF2LeFD2DZKA3W6ZNK6UHxKiv4YLXqHgNnCl4eWzvkxyloA==
X-Google-Smtp-Source: AGHT+IFuHm/8uBRLakD4dqGqWgYIv8jGlgnxHYKXY5Xa9zy45I0fwjvsmUDrL+MrrEoBjOhkIEbSVA==
X-Received: by 2002:a17:902:fc4c:b0:297:f39d:90c5 with SMTP id d9443c01a7336-2984094a5c7mr75156335ad.24.1762946277403;
        Wed, 12 Nov 2025 03:17:57 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:17:57 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:49 +1000
Subject: [PATCH v5 03/11] rtc: Add new rtc-macsmc driver for Apple Silicon
 Macs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-3-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6867;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JF8fPy7WCsEZI5w3lDmHu7AY077U0hzX/PAUVsnziAI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUf6qjfx3bX13OPaHsl+9DJf7Lzzk/oXr7fZLMzOb
 NYwUc29YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNVdWowMj+7kn+laYi7w7Os5xW+iLOfM5H6bTDkfdWOC0Jaqr1lWKgz/nXuEVoS
 61E0rScoO/8J7/9gH21UH7qmf1FLL5jU/M6uJHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031758_267588_ED67DC08 
X-CRM114-Status: GOOD (  30.16  )
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

From: Hector Martin <marcan@marcan.st>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
On T600x machines, the RTC counter must be accessed via the SMC to
get full functionality, and it seems likely that future machines
will move towards making SMC handle all RTC functionality.

The SMC RTC counter access is implemented on all current machines
as of the time of this writing, on firmware 12.x. However, the RTC
offset (needed to set the time) is still only accessible via direct
PMU access. To handle this, we expose the RTC offset as an NVMEM
cell from the SPMI PMU device node, and this driver consumes that
cell and uses it to compute/set the current time.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS              |   1 +
 drivers/rtc/Kconfig      |  11 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-macsmc.c | 140 +++++++++++++++++++++++++
 4 files changed, 153 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e5e219c5fe6..5cf253a25831 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2464,6 +2464,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/pwm/pwm-apple.c
+F:	drivers/rtc/rtc-macsmc.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c8..cf3fa1475ffd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2074,6 +2074,17 @@ config RTC_DRV_WILCO_EC
 	  This can also be built as a module. If so, the module will
 	  be named "rtc_wilco_ec".
 
+config RTC_DRV_MACSMC
+	tristate "Apple Mac System Management Controller RTC"
+	depends on MFD_MACSMC
+	help
+	  If you say yes here you get support for RTC functions
+	  inside Apple SPMI PMUs accessed through the SoC's
+	  System Management Controller
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rtc-macsmc.
+
 config RTC_DRV_MSC313
 	tristate "MStar MSC313 RTC"
         depends on ARCH_MSTARV7 || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 8221bda6e6dc..0485b09caceb 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_RTC_DRV_M48T35)	+= rtc-m48t35.o
 obj-$(CONFIG_RTC_DRV_M48T59)	+= rtc-m48t59.o
 obj-$(CONFIG_RTC_DRV_M48T86)	+= rtc-m48t86.o
 obj-$(CONFIG_RTC_DRV_MA35D1)	+= rtc-ma35d1.o
+obj-$(CONFIG_RTC_DRV_MACSMC)	+= rtc-macsmc.o
 obj-$(CONFIG_RTC_DRV_MAX31335)	+= rtc-max31335.o
 obj-$(CONFIG_RTC_DRV_MAX6900)	+= rtc-max6900.o
 obj-$(CONFIG_RTC_DRV_MAX6902)	+= rtc-max6902.o
diff --git a/drivers/rtc/rtc-macsmc.c b/drivers/rtc/rtc-macsmc.c
new file mode 100644
index 000000000000..8fe883066956
--- /dev/null
+++ b/drivers/rtc/rtc-macsmc.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC RTC driver
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitops.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+/* 48-bit RTC */
+#define RTC_BYTES 6
+#define RTC_BITS (8 * RTC_BYTES)
+
+/* 32768 Hz clock */
+#define RTC_SEC_SHIFT 15
+
+struct macsmc_rtc {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct rtc_device *rtc_dev;
+	struct nvmem_cell *rtc_offset;
+};
+
+static int macsmc_rtc_get_time(struct device *dev, struct rtc_time *tm)
+{
+	struct macsmc_rtc *rtc = dev_get_drvdata(dev);
+	u64 ctr = 0, off = 0;
+	time64_t now;
+	void *p_off;
+	size_t len;
+	int ret;
+
+	ret = apple_smc_read(rtc->smc, SMC_KEY(CLKM), &ctr, RTC_BYTES);
+	if (ret < 0)
+		return ret;
+	if (ret != RTC_BYTES)
+		return -EIO;
+
+	p_off = nvmem_cell_read(rtc->rtc_offset, &len);
+	if (IS_ERR(p_off))
+		return PTR_ERR(p_off);
+	if (len < RTC_BYTES) {
+		kfree(p_off);
+		return -EIO;
+	}
+
+	memcpy(&off, p_off, RTC_BYTES);
+	kfree(p_off);
+
+	/* Sign extend from 48 to 64 bits, then arithmetic shift right 15 bits to get seconds */
+	now = sign_extend64(ctr + off, RTC_BITS - 1) >> RTC_SEC_SHIFT;
+	rtc_time64_to_tm(now, tm);
+
+	return ret;
+}
+
+static int macsmc_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct macsmc_rtc *rtc = dev_get_drvdata(dev);
+	u64 ctr = 0, off = 0;
+	int ret;
+
+	ret = apple_smc_read(rtc->smc, SMC_KEY(CLKM), &ctr, RTC_BYTES);
+	if (ret < 0)
+		return ret;
+	if (ret != RTC_BYTES)
+		return -EIO;
+
+	/* This sets the offset such that the set second begins now */
+	off = (rtc_tm_to_time64(tm) << RTC_SEC_SHIFT) - ctr;
+	return nvmem_cell_write(rtc->rtc_offset, &off, RTC_BYTES);
+}
+
+static const struct rtc_class_ops macsmc_rtc_ops = {
+	.read_time = macsmc_rtc_get_time,
+	.set_time = macsmc_rtc_set_time,
+};
+
+static int macsmc_rtc_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_rtc *rtc;
+
+	/*
+	 * MFD will probe this device even without a node in the device tree,
+	 * thus bail out early if the SMC on the current machines does not
+	 * support RTC and has no node in the device tree.
+	 */
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->dev = &pdev->dev;
+	rtc->smc = smc;
+
+	rtc->rtc_offset = devm_nvmem_cell_get(&pdev->dev, "rtc_offset");
+	if (IS_ERR(rtc->rtc_offset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_offset),
+				     "Failed to get rtc_offset NVMEM cell\n");
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &macsmc_rtc_ops;
+	rtc->rtc_dev->range_min = S64_MIN >> (RTC_SEC_SHIFT + (64 - RTC_BITS));
+	rtc->rtc_dev->range_max = S64_MAX >> (RTC_SEC_SHIFT + (64 - RTC_BITS));
+
+	platform_set_drvdata(pdev, rtc);
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static const struct of_device_id macsmc_rtc_of_table[] = {
+	{ .compatible = "apple,smc-rtc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, macsmc_rtc_of_table);
+
+static struct platform_driver macsmc_rtc_driver = {
+	.driver = {
+		.name = "macsmc-rtc",
+		.of_match_table = macsmc_rtc_of_table,
+	},
+	.probe = macsmc_rtc_probe,
+};
+module_platform_driver(macsmc_rtc_driver);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC RTC driver");
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");

-- 
2.51.2


