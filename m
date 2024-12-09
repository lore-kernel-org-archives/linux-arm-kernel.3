Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37769E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=; b=iCHaUEGNuzmfaIHZxieN8rEyYG
	zSX0osoSaWQrozBcYox7bEbBJJkmlHZkqvEuSD+4z6A16gTFv9tUEsCGZDSqa0ajFjOhvcJhWSqLj
	BVFsiuxt3/1iOb8muJxUgPzoQfGCKgxtMTgoGGk2JeLujI+TG5zrFgPlMBh/bGR1ktku+kO21MWwb
	ZYTlBO2OQ4dLwkPapYeoC4eHljKC325+18ZvIRgmm9tHuPkCIMz1KNbbonJAk3TbWxiIHrsCRw6I/
	FSsvdFuMhqHcvtKyjHtrsubV6buXeyJjdngGu7K00v1zjCYhEqb8UkwWyaovhc38aoQJClKeaUIS9
	qjOekbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYj6-00000006ot6-2gkP;
	Mon, 09 Dec 2024 08:02:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYg6-00000006ntJ-3tzH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:59:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215ac560292so39506735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 23:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731178; x=1734335978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=;
        b=AtC8/0i2A+UcEcKPfKW1EFdKJ8SN68rfn8zzs5qr9RW2Qce6rnHma9yLxMRERxefNs
         +AwcdQPpqlyZWa6qXfZaJwSUL2HbRomkII7yWjjyK+Y//jW3zAqmFnDiurm/V3ZzO0ai
         DdPmKph8DfP6LEPkKCVBHxAqXqHHmQdF4ZZZrLk5XQk2CNdK2d3UUTcPWTg7VC57y1po
         Mt+db/yxvSNIBTbT1wdMuZCuNzO2MKUmQz3oAN3XG4O08fVUmniLa2SthFPQ7jsri++w
         O9vACCXEpnlZaCT1A42dnwiq9eZqBmcEHgBpUbsIbjhiHGyN1GRIVJnfqYiRJkWjnf24
         m/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731178; x=1734335978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=;
        b=SAZ9jIhNS9j9stHF6FaG3y8egqD+2vOQqQ9Kye13egI6oHZVF+peQfnj2o/qKAnzJx
         Gdqnt0lmmb0jM42X76hVsVOjeNukEWp+zWmlwsX3Ys8Q7FDjCah37ho4kHqnVmkOTrmr
         ++aG0ZV03w4Vy0pl5UzJ0fhKPemnTXm2zSRDIeBVCEaMyNPG7uYtjjxyZIlrivFsIWDh
         EW7he+qdwmv3hG7fFpaKq+Xii6Qt/hxGuTgk63c97HOGPI48gYWJQJH/mSNrg4vaY/1b
         wJnPRdgao1rHf0vzMyMLGkmIUIWcyJedd0YH9Uc1/TVxzvuUEKsEZcWLudkPnlJwi5AM
         bP9w==
X-Forwarded-Encrypted: i=1; AJvYcCW9hS27UcQGQq4wXsACQfNelsGWJcSwzXSZJrzedvYrIkioh0YKp1IJLzPSGao+Fs4iRiFi7c6d20zj5Xc33/bt@lists.infradead.org
X-Gm-Message-State: AOJu0YxWF4YOX1BQkmov1QTnAmlFlQp9GI9Dc5Ynrhj30gjBQg12aDC7
	seajT9ggsob2pPww1otyh3EvX5UqxhQzgmTh3xo3EfzcvFMMs+sm
X-Gm-Gg: ASbGncsRILMjRyzXGW0q0+dm8PV4Z8hQ24J8mZ7xM0cbHvbXWABQggL23ncDkTK+fSg
	phXnjPAqkMnsrBNNAxP6EwoZJnIfwNUWq6fCOSlEXnfBhUSW5MVcQw7oLJKj86KX0k3Ph7KIoCL
	AanoLZMoiinHyFFEKpkQqT3w0FtaHBO8OkNmWpcKLZM7W0Zh5JEHevQs0JyKXtLiAJAPTzy+Z90
	R7Nsn27vePRveWDgV5pwNC1GiMV3zXp5ApWxiBTY1OFP8MYyVK+HGARidlhf+ltjg==
X-Google-Smtp-Source: AGHT+IEJ6aeTSfdHSwUg/1x4m3Ob8o0V0LmoiLC6iCHD0eKmgDPprihMoSkpmUMGcXKVy/JGiuvYmQ==
X-Received: by 2002:a17:902:ec87:b0:215:8dd3:536a with SMTP id d9443c01a7336-21614d2efdcmr161736885ad.4.1733731177985;
        Sun, 08 Dec 2024 23:59:37 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:37 -0800 (PST)
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
Subject: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:34 +0800
Message-ID: <20241209075908.140014-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235938_974105_A1ED6DF0 
X-CRM114-Status: GOOD (  23.22  )
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
 drivers/video/backlight/dwi_bl.c | 126 +++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
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
index 000000000000..501c36bed8f3
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,126 @@
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
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
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


