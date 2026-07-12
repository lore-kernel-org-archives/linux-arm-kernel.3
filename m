Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6164AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQ4PU66CTnBXQAzr6PHBDQyKEYKs9ioZmr93h8ngf+E=; b=h7iVu1djUZIfCIEHSSuwSwPpQ1
	8J0ImzJ67oqbCl/OapCvsycW5dA8DuIZSj3EmIPI2bPdm3oTD5JUBdONbRvghyz/iane9Lbix0aaw
	oYTPvbw2ZNmL68kxglH53/8h3wZXRbKUTUU3Tcxlz7GQkE5axh12B8dv2LRzNNHa56H9gMMaUuEy7
	K5yrMwX24D4z94gTriBzJYWWUJ2Z45nYe+YYVz7t8Gx0EDL+wsOJrg4kb/1oFkbC0ElrAvbsojRu0
	j/n9kLods3ZhjgOtdLSEyJOMg6GTBcQD9X9foV/PbEPOyQBjOaQECNncL3ZsLuSXAuYhUhrpbjeTy
	3qliRWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijh0-0000000709f-0DXE;
	Sun, 12 Jul 2026 02:13:18 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgp-0000000704u-492T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:13 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-381891a9525so2463553a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822387; x=1784427187; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ4PU66CTnBXQAzr6PHBDQyKEYKs9ioZmr93h8ngf+E=;
        b=VF9verspNylHGRdzVe7nrPL2GecBV+clnOybG/LOiwuWLjE26LCEPazN3pLnR2HkSK
         Inm8Cdr2HZUCehBHQ6nS5T5DETuovlYvAXqQplVl6DlfE16FhhMc4DAff6K0QivjTh4y
         I/AxssXZv1UH317NgkqONsLKwyt7uerqBG+67ulOa4v/6lqujOP/ieSQUwt0syQ7qSVq
         JZ43OWHChZzDd+vn5zOXalXfidTb/UXxxktdTcXMMPLeAqLjCtSqeGXlqez91K/brC5q
         vLqlh8YfcYqkL9s4YVC/nb6WmLQBGbbSUd1FzhiYeB+W+RRGzqILFYgpiNCf5Rmvwert
         CC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822387; x=1784427187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQ4PU66CTnBXQAzr6PHBDQyKEYKs9ioZmr93h8ngf+E=;
        b=TYE+13idmxFi4LQY1xZLD2nFLR7/eZaHXRisV7MdF9/obtF9ZxwGAKUY7GFE2hTQWj
         M7lRpdM94M8UKz7p0Isgw0jh+rvSMZqpKGQ5N9rHbSci8RpE4CSChuTUyTxbDhb63w+j
         YtdPMVhTjt0jgV1HvVKCHHAZUt3hzsHtlFj/dFa406Io/neH75yO5IXHkg2Hu4Jje2Wj
         8mcf9BUjKE1gqLJSxKOD4TOVH78ih4cwp8DXPIWeMrY3MF+0cvRKwozuJ83JpcOchzoz
         oURhWZrKVEILFCaL5L2y9LiOYB+7V6Mvws/+0tV7lDN8znwXX056QQQ12238rqK2EllE
         lNnw==
X-Forwarded-Encrypted: i=1; AHgh+RpxfwUbmgFsjvBiPO2NsUEZVh48uD0is6C9CoCsuhIhgsOWVLSnIpg4R3sT5MRn37G/dxZfYjFz1wUtgNi6ujJx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuli2dhnCnVAI0algamz63ZWnRirk1T73KV0fJpZ/SxYBcgkzG
	EwMWL65852UJNm1UiMY4DQ0DUCKUKPzgCMoQzReV1ptcJ1VeT6MguEDr
X-Gm-Gg: AfdE7ckvCY0aJvpV4O8bGMmrkVNoQw3p7mCGrc/uTiZLu+ez5LAgVTr3G5i3UunbFLR
	M1o8gAI4KUBrF7uznvOcTC55JNN+rul7QvvSpbPS0wth4Yz5TmtOnXxFAM+VsyIk2gUD4fjBBSZ
	jNljnvUwJHUoVKco64/bWOttVgOpVukqsiMq7JtOP8uL3SGcFMZm3hOP1H9IdY9N9TxcXAYTm9D
	0OhNiN1s5E0mvyDufQ2AwClR8fSxqoZlxjkXtFoieH1VYU+9YrENdxJUMOPdi4qfIxcwo1GAfjx
	Ir/5R4+5ZSWdxoVoX8mGyBnME5EBUR35dia9fzsp8A1r+QYqNt344lkJ8qx2D9G8PQepnJRY9L1
	I//PFO5/HbQzzXiBJPiA9VNfO0MshZxC0r0jzsYpjMLpGDB2+hr6ajcKVGcF6F45ZlQ8TVr1MWG
	WgsnyvkC/L4qeSHmJoBegeEgYR/epr8xcm+GtwYs+x731mmlMb0j6xmsER0P2Yfr/hqihWvRy+Z
	WM=
X-Received: by 2002:a17:90b:5343:b0:37f:9ce1:7369 with SMTP id 98e67ed59e1d1-38dc777486cmr4384818a91.31.1783822387067;
        Sat, 11 Jul 2026 19:13:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:45 -0700
Subject: [PATCH v3 04/10] ARM: s3c: crag6410: switch keypad device to
 software properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-4-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191308_045979_03D076A0 
X-CRM114-Status: GOOD (  26.22  )
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

Switch the keypad device to use software properties to describe the
keypad. This will allow dropping support for platform data from the
samsung-keypad driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/Kconfig                |  5 ---
 arch/arm/mach-s3c/Kconfig.s3c64xx        |  7 ----
 arch/arm/mach-s3c/Makefile.s3c64xx       |  1 -
 arch/arm/mach-s3c/devs.c                 | 27 ---------------
 arch/arm/mach-s3c/devs.h                 |  1 -
 arch/arm/mach-s3c/keypad.h               | 27 ---------------
 arch/arm/mach-s3c/mach-crag6410.c        | 56 ++++++++++++++++++++++++--------
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c | 20 ------------
 8 files changed, 42 insertions(+), 102 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
index b3656109f1f7..2e77bb4f3a8c 100644
--- a/arch/arm/mach-s3c/Kconfig
+++ b/arch/arm/mach-s3c/Kconfig
@@ -111,11 +111,6 @@ config S3C64XX_DEV_SPI0
 	  Compile in platform device definitions for S3C64XX's type
 	  SPI controller 0
 
-config SAMSUNG_DEV_KEYPAD
-	bool
-	help
-	  Compile in platform device definitions for keypad
-
 config SAMSUNG_DEV_PWM
 	bool
 	help
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 3f97fba8e4f5..aef97cc5d195 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -74,11 +74,6 @@ config S3C64XX_SETUP_FB_24BPP
 	help
 	  Common setup code for S3C64XX with an 24bpp RGB display helper.
 
-config S3C64XX_SETUP_KEYPAD
-	bool
-	help
-	  Common setup code for S3C64XX KEYPAD GPIO configurations
-
 config S3C64XX_SETUP_SDHCI_GPIO
 	bool
 	help
@@ -106,7 +101,6 @@ config MACH_WLF_CRAGG_6410
 	select S3C64XX_DEV_SPI0
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_I2C1
-	select S3C64XX_SETUP_KEYPAD
 	select S3C64XX_SETUP_SDHCI
 	select S3C64XX_SETUP_SPI
 	select S3C64XX_SETUP_USB_PHY
@@ -117,7 +111,6 @@ config MACH_WLF_CRAGG_6410
 	select S3C_DEV_I2C1
 	select S3C_DEV_USB_HOST
 	select S3C_DEV_USB_HSOTG
-	select SAMSUNG_DEV_KEYPAD
 	select SAMSUNG_DEV_PWM
 	help
 	  Machine support for the Wolfson Cragganmore S3C6410 variant.
diff --git a/arch/arm/mach-s3c/Makefile.s3c64xx b/arch/arm/mach-s3c/Makefile.s3c64xx
index 61287ad2ea42..1686b1f344f8 100644
--- a/arch/arm/mach-s3c/Makefile.s3c64xx
+++ b/arch/arm/mach-s3c/Makefile.s3c64xx
@@ -32,7 +32,6 @@ obj-y				+= dev-audio-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_FB_24BPP)	+= setup-fb-24bpp-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_I2C0)	+= setup-i2c0-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_I2C1)	+= setup-i2c1-s3c64xx.o
-obj-$(CONFIG_S3C64XX_SETUP_KEYPAD)	+= setup-keypad-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_SPI)		+= setup-spi-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_USB_PHY) += setup-usb-phy-s3c64xx.o
diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index bab2abd8a34a..0237307b9238 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -39,7 +39,6 @@
 #include "devs.h"
 #include "fb.h"
 #include <linux/platform_data/i2c-s3c2410.h>
-#include "keypad.h"
 #include "pwm-core.h"
 #include "sdhci.h"
 #include "usb-phy.h"
@@ -265,32 +264,6 @@ void __init s3c_i2c1_set_platdata(struct s3c2410_platform_i2c *pd)
 }
 #endif /* CONFIG_S3C_DEV_I2C1 */
 
-/* KEYPAD */
-
-#ifdef CONFIG_SAMSUNG_DEV_KEYPAD
-static struct resource samsung_keypad_resources[] = {
-	[0] = DEFINE_RES_MEM(SAMSUNG_PA_KEYPAD, SZ_32),
-	[1] = DEFINE_RES_IRQ(IRQ_KEYPAD),
-};
-
-struct platform_device samsung_device_keypad = {
-	.name		= "samsung-keypad",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(samsung_keypad_resources),
-	.resource	= samsung_keypad_resources,
-};
-
-void __init samsung_keypad_set_platdata(struct samsung_keypad_platdata *pd)
-{
-	struct samsung_keypad_platdata *npd;
-
-	npd = s3c_set_platdata(pd, sizeof(*npd), &samsung_device_keypad);
-
-	if (!npd->cfg_gpio)
-		npd->cfg_gpio = samsung_keypad_cfg_gpio;
-}
-#endif /* CONFIG_SAMSUNG_DEV_KEYPAD */
-
 /* PWM Timer */
 
 #ifdef CONFIG_SAMSUNG_DEV_PWM
diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 21c00786c264..2737990063b1 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -39,7 +39,6 @@ extern struct platform_device s3c_device_i2c1;
 extern struct platform_device s3c_device_ohci;
 extern struct platform_device s3c_device_usb_hsotg;
 
-extern struct platform_device samsung_device_keypad;
 extern struct platform_device samsung_device_pwm;
 
 /**
diff --git a/arch/arm/mach-s3c/keypad.h b/arch/arm/mach-s3c/keypad.h
deleted file mode 100644
index 9754b9a29945..000000000000
--- a/arch/arm/mach-s3c/keypad.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Samsung Platform - Keypad platform data definitions
- *
- * Copyright (C) 2010 Samsung Electronics Co.Ltd
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- */
-
-#ifndef __PLAT_SAMSUNG_KEYPAD_H
-#define __PLAT_SAMSUNG_KEYPAD_H
-
-#include <linux/input/samsung-keypad.h>
-
-/**
- * samsung_keypad_set_platdata - Set platform data for Samsung Keypad device.
- * @pd: Platform data to register to device.
- *
- * Register the given platform data for use with Samsung Keypad device.
- * The call will copy the platform data, so the board definitions can
- * make the structure itself __initdata.
- */
-extern void samsung_keypad_set_platdata(struct samsung_keypad_platdata *pd);
-
-/* defined by architecture to configure gpio. */
-extern void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols);
-
-#endif /* __PLAT_SAMSUNG_KEYPAD_H */
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index c4040aad1ed3..c2df5dcb3368 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/input-event-codes.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
@@ -22,6 +23,7 @@
 #include <linux/mmc/host.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/fixed.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/dm9000.h>
@@ -53,7 +55,6 @@
 #include "gpio-cfg.h"
 #include <linux/platform_data/spi-s3c64xx.h>
 
-#include "keypad.h"
 #include "devs.h"
 #include "cpu.h"
 #include <linux/platform_data/i2c-s3c2410.h>
@@ -176,7 +177,7 @@ static struct s3c_fb_platdata crag6410_lcd_pdata = {
 
 /* 2x6 keypad */
 
-static uint32_t crag6410_keymap[] = {
+static const u32 crag6410_keymap[] __initconst = {
 	/* KEY(row, col, keycode) */
 	KEY(0, 0, KEY_VOLUMEUP),
 	KEY(0, 1, KEY_HOME),
@@ -192,17 +193,41 @@ static uint32_t crag6410_keymap[] = {
 	KEY(1, 5, KEY_CAMERA),
 };
 
-static struct matrix_keymap_data crag6410_keymap_data = {
-	.keymap		= crag6410_keymap,
-	.keymap_size	= ARRAY_SIZE(crag6410_keymap),
+static const struct property_entry crag6410_keypad_props[] __initconst = {
+	PROPERTY_ENTRY_U32("keypad,num-columns", 6),
+	PROPERTY_ENTRY_U32("keypad,num-rows", 2),
+	PROPERTY_ENTRY_U32_ARRAY("linux,keymap", crag6410_keymap),
+	{ }
+};
+
+static const struct resource crag6410_keypad_resources[] __initconst = {
+	[0] = DEFINE_RES_MEM(SAMSUNG_PA_KEYPAD, SZ_32),
+	[1] = DEFINE_RES_IRQ(IRQ_KEYPAD),
 };
 
-static struct samsung_keypad_platdata crag6410_keypad_data = {
-	.keymap_data	= &crag6410_keymap_data,
-	.rows		= 2,
-	.cols		= 6,
+static const struct platform_device_info crag6410_keypad_info __initconst = {
+	.name		= "samsung-keypad",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= crag6410_keypad_resources,
+	.num_res	= ARRAY_SIZE(crag6410_keypad_resources),
+	.properties	= crag6410_keypad_props,
 };
 
+static void __init crag6410_setup_keypad(void)
+{
+	struct platform_device *pd;
+
+	/* Set all the necessary GPK pins to special-function 3: KP_ROW[x] */
+	s3c_gpio_cfgrange_nopull(S3C64XX_GPK(8), 2, S3C_GPIO_SFN(3));
+
+	/* Set all the necessary GPL pins to special-function 3: KP_COL[x] */
+	s3c_gpio_cfgrange_nopull(S3C64XX_GPL(0), 6, S3C_GPIO_SFN(3));
+
+	pd = platform_device_register_full(&crag6410_keypad_info);
+	if (IS_ERR(pd))
+		pr_err("failed to instantiate keypad device\n");
+}
+
 static struct gpio_keys_button crag6410_gpio_keys[] = {
 	[0] = {
 		.code	= KEY_SUSPEND,
@@ -361,7 +386,7 @@ static struct platform_device wallvdd_device = {
 	},
 };
 
-static struct platform_device *crag6410_devices[] __initdata = {
+static struct platform_device *crag6410_devs0[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_i2c0,
@@ -372,8 +397,10 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&samsung_device_pwm,
 	&s3c64xx_device_iis0,
 	&s3c64xx_device_iis1,
-	&samsung_device_keypad,
 	&crag6410_gpio_keydev,
+};
+
+static struct platform_device *crag6410_devs1[] __initdata = {
 	&crag6410_dm9k_device,
 	&s3c64xx_device_spi0,
 	&crag6410_lcd_powerdev,
@@ -873,16 +900,17 @@ static void __init crag6410_machine_init(void)
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
-	samsung_keypad_set_platdata(&crag6410_keypad_data);
-
 	gpiod_add_lookup_table(&crag_spi0_gpiod_table);
 	s3c64xx_spi0_set_platdata(0, 2);
 
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
-	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
+	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
 	gpiod_add_lookup_table(&crag_leds_table);
+	crag6410_setup_keypad();
+
+	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 
 	regulator_has_full_constraints();
diff --git a/arch/arm/mach-s3c/setup-keypad-s3c64xx.c b/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
deleted file mode 100644
index 8463ad37c6ab..000000000000
--- a/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Copyright (c) 2010 Samsung Electronics Co., Ltd.
-//		http://www.samsung.com/
-//
-// GPIO configuration for S3C64XX KeyPad device
-
-#include <linux/gpio.h>
-#include "gpio-cfg.h"
-#include "keypad.h"
-#include "gpio-samsung.h"
-
-void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols)
-{
-	/* Set all the necessary GPK pins to special-function 3: KP_ROW[x] */
-	s3c_gpio_cfgrange_nopull(S3C64XX_GPK(8), rows, S3C_GPIO_SFN(3));
-
-	/* Set all the necessary GPL pins to special-function 3: KP_COL[x] */
-	s3c_gpio_cfgrange_nopull(S3C64XX_GPL(0), cols, S3C_GPIO_SFN(3));
-}

-- 
2.55.0.795.g602f6c329a-goog


