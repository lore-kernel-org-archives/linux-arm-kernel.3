Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CDEC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuVUwIb3ATElWRb+tDZLU6hMx05qo8CzOAa+DShnxhY=; b=I6j82w2gNH/RnnB9Vy5mKY3c1L
	Zp7qVNcom6tAg6YKazGc0LTxZvrYdnXQpy2sCDt+E5QLnavpRj1kLCnuHZ1wJDIStf13xdqw5x8JT
	W/0SZCQHKd37pGVXe1JmFK325PR1/CvMnAdFIOF10C+ePnV05E/KwfqUrhogxjIutyys6+fSXO3d4
	VZTRjGDlzfG2W/YboK/cJ9p2YiJBnLFnCppEDqNkhq6oYmsgb7lBgJcXuxvfDlcxzNUBveoN9pjxZ
	Nfn317cZS4hB7gmkWTDtwgKzhqI8ZAeZxN8Dd2LXpYO492MkYEzf9KeUy65pf8GDkxn0iFBtfM9JC
	UXCTjxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev42-0000000FINh-0rHq;
	Mon, 03 Feb 2025 11:56:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev0E-0000000FHjL-1Gd1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:52:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216281bc30fso3705925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583553; x=1739188353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuVUwIb3ATElWRb+tDZLU6hMx05qo8CzOAa+DShnxhY=;
        b=Ifg64Tmfx0wCwBsBjPIm5au8vN5daq4kPdp6c+hl5eZccZUYL2/p5Cq77Lg/tU/9PI
         0ZYksi4O2++37fR2uRmfMSCU3rJyhBWTv4v99I/BFvDTND/RdMumDc9mLYJ1XdmG5PfU
         AyN1cnFZ3X+PWkzUx56UVO19Zpb/dRSBndV44bNGCZObi3Wdrp7nvyeO7K7BL0v5t6ZA
         GvZXap0NaR5rIIaAF+mYVBQcfthmnB9cbjjzNM/V79OvQSg1/jE8w89imH2HS9WjxjJW
         vgS2AGx305mFxG8lg8o073oyq9aQ17Xn/ggM4uxSVG0UrzS5O6w4Dy8GoEjVYIbyhHgq
         xtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583553; x=1739188353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuVUwIb3ATElWRb+tDZLU6hMx05qo8CzOAa+DShnxhY=;
        b=O03TZenAZSq9taINLKHQcxnEdKUn40OxH3db/tQBfxvKn2+3q6bzKz2SbMfwlAEVrx
         KtkJSdFdfZRWvmrer0oLZVZGoXeFNLYA9KIDA4QAkm6bscSoy2mJr0hcAnapfCNOWSB7
         eaJUwK0RtLOYUPo/5/LheiAc3L4Yj1n/McnpmWsEzOuCNMxIHL2HtClGqvwvSEcMirMG
         ypOdgsc0IUBZST01OSiQWVHIhOyDrn95AODp+Ym9AXe0599W6Y86V0ym3YGvwq0iiJRM
         HUgnssblVC+oxxGA9zDEqq4jWZmtychTwPOHE4KfwMs4R7YXqDn9kJvJKN0MdQG/XVQB
         /VzA==
X-Forwarded-Encrypted: i=1; AJvYcCXeoQF8kj6MmaZ9HTSbgFXC09bLY6a8sxMJilEbXxsApwflHTJaUCL6QY/7oKQuZJXT05/yGn6Rj58YuiUwh9Jj@lists.infradead.org
X-Gm-Message-State: AOJu0YxTG5Jg7TZN4OM4r9mNqZRqVyBUY6QO/QbkHBHqMn1c2UcLdwWF
	sbVgOm/uAWYyEkiU9D3WEePEVp1Amlub5Qm7X7FsMR6vRswikgS7DqDdHiZ5
X-Gm-Gg: ASbGncvWMxjFgrhuWK7KFO2i8TCAquCtzAaGFd7tAFnn2znD+J8BObn4p7LU4Uy2zam
	uAn2oNdvjUvrRlVouj4u+mbwSzRXxM51M77RZXfrSf6qt4uSYQuiyqnId9OpN0GrDoNaadPlb+a
	rXpE4Q+uw6B3IICxF1DDJflIMujEcsywbyy6wm2+bkHZJ6Z8syMFyPrS6xOqJBs8k2Srr7dZT/f
	fV1H+f9X7yET5Bf0S6v/0H3Kzhk4e9oaIVCEyU5UEX/laEPJXsmyxW5nvzN1qL1owbPnHkMhSis
	4aFLkTe7qWV1OnIS
X-Google-Smtp-Source: AGHT+IHAUg+jBA6FADxyc/xDCHiXuFU49eYPAhY7dRRNEYaiurAK+cyssoskPZL1rJkF+Q3jR0YDHw==
X-Received: by 2002:a05:6a00:2e14:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72fd0bf7126mr31273767b3a.6.1738583553324;
        Mon, 03 Feb 2025 03:52:33 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 RESEND 2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
Date: Mon,  3 Feb 2025 19:50:33 +0800
Message-ID: <20250203115156.28174-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035234_340182_6F6E1182 
X-CRM114-Status: GOOD (  24.06  )
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

Add driver for backlight controllers attached via Apple DWI 2-wire
interface, which is found on some Apple iPhones, iPads and iPod touches
with a LCD display.

Although there is an existing apple_bl driver, it is for backlight
controllers on Intel Macs attached via PCI, which is completely different
from the Samsung-derived DWI block.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig        |  12 +++
 drivers/video/backlight/Makefile       |   1 +
 drivers/video/backlight/apple_dwi_bl.c | 123 +++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..c6168727900a 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+	  Say Y to enable the backlight driver for backlight controllers
+	  attached via the Apple DWI 2-wire interface which is found in some
+	  Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called apple_dwi_bl.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..156ff9461fb3 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
new file mode 100644
index 000000000000..93bd744972d6
--- /dev/null
+++ b/drivers/video/backlight/apple_dwi_bl.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DWI_BL_CTL			0x0
+#define DWI_BL_CTL_SEND1		BIT(0)
+#define DWI_BL_CTL_SEND2		BIT(4)
+#define DWI_BL_CTL_SEND3		BIT(5)
+#define DWI_BL_CTL_LE_DATA		BIT(6)
+/* Only used on Apple A9 and later */
+#define DWI_BL_CTL_SEND4		BIT(12)
+
+#define DWI_BL_CMD			0x4
+#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
+#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
+#define DWI_BL_CMD_DATA			GENMASK(10, 0)
+
+#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
+					 DWI_BL_CTL_SEND2 | \
+					 DWI_BL_CTL_SEND3 | \
+					 DWI_BL_CTL_LE_DATA | \
+					 DWI_BL_CTL_SEND4)
+
+#define DWI_BL_MAX_BRIGHTNESS		2047
+
+struct apple_dwi_bl {
+	void __iomem *base;
+};
+
+static int dwi_bl_update_status(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	int brightness = backlight_get_brightness(bl);
+
+	u32 cmd = 0;
+
+	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
+	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
+
+	writel(cmd, dwi_bl->base + DWI_BL_CMD);
+	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
+
+	return 0;
+}
+
+static int dwi_bl_get_brightness(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
+
+	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
+}
+
+static const struct backlight_ops dwi_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = dwi_bl_get_brightness,
+	.update_status	= dwi_bl_update_status
+};
+
+static int dwi_bl_probe(struct platform_device *dev)
+{
+	struct apple_dwi_bl *dwi_bl;
+	struct backlight_device *bl;
+	struct backlight_properties props;
+	struct resource *res;
+
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	platform_set_drvdata(dev, dwi_bl);
+
+	bl->props.brightness = dwi_bl_get_brightness(bl);
+
+	return 0;
+}
+
+static const struct of_device_id dwi_bl_of_match[] = {
+	{ .compatible = "apple,dwi-bl" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dwi_bl_of_match);
+
+static struct platform_driver dwi_bl_driver = {
+	.driver		= {
+		.name	= "apple-dwi-bl",
+		.of_match_table = dwi_bl_of_match
+	},
+	.probe		= dwi_bl_probe,
+};
+
+module_platform_driver(dwi_bl_driver);
+
+MODULE_DESCRIPTION("Apple DWI Backlight Driver");
+MODULE_AUTHOR("Nick Chan <towinchenmi@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.48.1


