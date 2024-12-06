Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57923E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mhx+3SpE0HhgGnWW6FB4h1qjMppjxy5kVkibP++35Cs=; b=eUY2T21z/SH0yUVxN870OjcqnE
	eYzwMvP+hpDKrhn+tsIt+d00aB6c1ynO9wGVZE3TvEt+27cCnFsLvKhHQ895+rHOBYWzgFWu+VWM4
	2qJI15ZXBy2ry/9oTICwQqBFCCJVeG4ks820Ms3FLpuThnb4tJ/APY+juysFoL41i9cnBU9o91emy
	bNBTPjN/r/k0DIrbhwc6ioWEU/67YlEF2nzmy115Gzl3rbPgsWX2zk7bESbgFLw/XhutR1WFpp0Gu
	U07NKf0lpHkdN0WgyWjfx7Mws8ZGU8HjZP+nlpe5DlIgOaxJz1YREIjGzNG75nvf6cxB5V87jCTm1
	8SD1T9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcAd-00000002Lje-2Q37;
	Fri, 06 Dec 2024 17:31:15 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc7k-00000002KzF-1ImM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:28:17 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1860465a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506095; x=1734110895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mhx+3SpE0HhgGnWW6FB4h1qjMppjxy5kVkibP++35Cs=;
        b=aTl3nsJ7C90/8OJzrBuqilhhSPmlIUBJrF89dNLx+o1Ff7QWegA5FkqTkZtrsH2uqC
         grTOs91E2OBSZc59Edm9wPH7s0tasGM8yfd/albtPZiAfO1C6AeUF+S3rmwpytDSCuRo
         HxVtBblyDYksN5mAA9abk5kHxDAmPVKgmJOjA9JHFVTW+K32ZmtKO2++Dc3w952x8I86
         lac/49oaKBUSoace3xzREDJGORU8Oi4TYGWZpNmfiMcu0WknhTanXtJUj3yY6IZ+fO7I
         gOI9eab0/lu8wVHPp4oFuXjMSGu8D1ukCcl3YGM851pDfATtxE6xSgyQcUFwoMkRHlhK
         w8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506095; x=1734110895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mhx+3SpE0HhgGnWW6FB4h1qjMppjxy5kVkibP++35Cs=;
        b=fO9V0P4zie4v2tuFOn/+S9BNntn4vjarTv9JnGEazaXfycXyqioi0D7ta4DrkmIMbF
         aDzKLKDa/sQj5fVcQ3rzIktj3dggsmWlTYHtVDa8ZNDvqXU795TElBQ1q/tTvYO2ZRl7
         jJ0qQT01ZHoWWFu7XwpDYQzX3y0WAe5Wx7f2ny6K9jvHuXh40VNtNNNatbn1IwB9GIjf
         PDAJIqDf71pAT2C8fYn64tv9IMOEm1YNyOOqhCYRXNRGVV0L3Z/n1KzXERfQpVebsTLE
         ui1VxoEVoG/e6Xf5xRFDAHYOCaztISC5c/FCb2lhq1TF4KcbfGYcjsmY3YwvxSCdgy4X
         O2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaVn5hwywp/EjHoU6LpEQ/OK/gdtwCtGu+3N7Q2GjC+250ZRt/0awe5Z9yMzdU7O1js72h0p35YKxsakxelFL5@lists.infradead.org
X-Gm-Message-State: AOJu0YzD1UVrfHPFNu5/Rv7rtWSQpbz7b5cmktCVlUOVQfAhsUowO52F
	lu6jCay7/rJST7HP3DTBdcZfOdw8560Fjw5dxyDfpcrp5xFsKAfg
X-Gm-Gg: ASbGncuoEPrfmTWNawlWvozzPSvOnZypOjPQZ6QZ7c1ksgcXJXayDlFlLmAQ/R18UMG
	GUdJqEryhSoCZxwpOkY7rYGRIDsbZQ7oC6tVbff06uvxs0Frue6uezg2FkT0s8NSm0LsaWtjpO/
	dwPulV2CgR5FAZ6izHzg2LN/tBpaDE/Blro/gu6CTcIGnLOxROWsrL+BVwpZCYERdmMPOrCKx+j
	KxT44WzBviyJDhMvDq7agFIhNu6yVnpgJ/96QPCzDOCZ5SlLONiWdN7+tIJVt/j
X-Google-Smtp-Source: AGHT+IHmRnmelG8M99ofNXhJAhbZ1joLqatv/c5LTXmUbLyOedvxPVbkzChlDj9sArumdzcvk7YaUg==
X-Received: by 2002:a17:90a:c105:b0:2ee:db8a:29d0 with SMTP id 98e67ed59e1d1-2ef6ab07f61mr5535784a91.26.1733506094955;
        Fri, 06 Dec 2024 09:28:14 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Sat,  7 Dec 2024 01:24:34 +0800
Message-ID: <20241206172735.4310-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_092816_348391_D8E97734 
X-CRM114-Status: GOOD (  22.90  )
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 123 +++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..e64cc3d51ac5 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
 	  To compile this driver as a module, choose M here: the module will
 	  be called ep93xx_bl.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+          Say Y to enable the backlight driver for backlight controllers
+          attached via the Apple DWI 2-wire interface which is found in some
+          Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_IPAQ_MICRO
 	tristate "iPAQ microcontroller backlight driver"
 	depends on MFD_IPAQ_MICRO
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..0a569d7f0210 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..6dd7edf661fd
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/backlight.h>
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
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+
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
+		.name	= "dwi-bl",
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
2.47.1


