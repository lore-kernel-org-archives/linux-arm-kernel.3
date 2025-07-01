Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22C7C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izGYiVRCi02r3mHWqGF4QIu9SBmrk+ZHTmWL1Vrn6tY=; b=0VqyerMWiWNPdFnkmNiNJyCjTf
	wu72n+PKPhWM/GfnydNgwd1rcPVHm6ZFZkMCePtl4j3aU7mK1R2ybETfKq60089OZU3vl4SiJSwZ7
	c+QHvIx4hmhqIZ6Lv+EvLHA8Bn22YZlWwRaVDNSMh4Ii1BKUS4I5KsoF/eZ/CThKd0eKZNVoU9RWV
	whv3MGfx0p5m58/hgau1kmDL1aeRS58jdsBSa7ao4aK6s94o/WYd2f543W2lR2/9tGrD7zD72QYm6
	rdTBIxknSVAycExDFM9F8HPQd4SA1LE3lJ6ozJJQ1IQf1kJ40s3lsHDxiB3EPZHvLtzL0WnvXsCzc
	SEkl/I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWacO-00000005Qbd-01N6;
	Tue, 01 Jul 2025 13:01:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUm-00000004vJd-2xH8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453643020bdso48238005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370591; x=1751975391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izGYiVRCi02r3mHWqGF4QIu9SBmrk+ZHTmWL1Vrn6tY=;
        b=eDJHukbPfrJx9Z50xWB4pG5tBmvn8NU8IFRV0iP4wQ4xVcM0vxnOe4lbAzvvp5fK0j
         AjkPebzpEALKMq9YrCXlIvvRzczYGq3/ZsoI2KMHqZTuBI/w+CPpMY45bVXj4aA86yyc
         dVZMkesGslvFvrravHHLpdwbMeMNrl5D0voaVEFVW/DHBsqGCttl7e+6X3nxdpb0eJS0
         IxxiMllQkQ5gs3v++0aBfA59atqOOBdSdLWdI5cP/cFM70XgMi8mAT/0xFpO5xIDmHe2
         Qu0tjOpetwQOCztDgQtB06ZBIU1ZSx1uTHiAjYdJENAS2rBooMwxfxgKUEU1DSTUYKTX
         D3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370591; x=1751975391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izGYiVRCi02r3mHWqGF4QIu9SBmrk+ZHTmWL1Vrn6tY=;
        b=jribQo28rLXRltVX7Tc928xH8azElh4QxpiEVekXWysCf3HEqbm8WVlJjk1jotaU89
         8GHAUdbqNLQNaVyOVZZVz+GFzabw1jjpoJOVh8aaVdX0qg1hE+gEfH+5nQpME5fwe9on
         AD3Jo7L9rH8Up1xmYcAxWKivf2+k5XNWeU528DZBFcr+jlEelimhsUGtCw38yMu2LX7m
         clmdvKtfVY14q8tvW+BY6092XphRwQjslAEdzdcBLYKFebWWp89HWS+Kjyri/7m7+l+j
         iiqpVxnPz39MmZrcFPRlgPkd8P5CM5wa+o8PQHaDnFx8wlx+AyLXW5glkpZmnYA1G75O
         cGVw==
X-Forwarded-Encrypted: i=1; AJvYcCWv6ClJuu0eivxTm6WDWR2H3T0VeyuK11oKnybubBTlntvrwskQ3eb1Z2RICtR3xnWaKn8VUQYszRma0sQMnZ4g@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7f58Pv+VNmfryD1yE77SCyLGzcA/CMXQC5F7MtbM9YnEbVrLL
	w6KResbiPhrgdvJba/T0Evb3PfLH3q8MsXJTkwXWiCfJwG5wd+45RYwlPZiPjIK2v6A=
X-Gm-Gg: ASbGnctYrByrrZHoCN3yKqfO/Z4sWEI/WTlHpGI04B0zc6kelEWeU3JJ8Mv7d6FWpjj
	AC9PE4URM38YYAeBhZ7f+vw6tTbVbXq3LIStUl2P4+WtsXoXIJSn2Mgc2EafNfOh3Rvi53CrZfr
	8XHyO93HtJcfKnvgkS571gYVwUOsEjN+dvcohLTnTZWDx4RCKcXT5S/bMbgIRtToLOIOojLQFzP
	N3iTnBT9thZTFapzjMqn8xGDGhFvLIjPHEkcfK5bzom+86TucEEtlBxDvs0Sbkf64HzoKv9SExL
	3ZWQrx17FrZRMF95uixRiKArLjFWtBxbQylqmdB0VUUrytetELAozw==
X-Google-Smtp-Source: AGHT+IFrcmk0/tbiV/1dv+6YlxrA5d22+2IS83WwEoAaJRu/KYB6N6nKzdbcBuOnEP7Enr6/jTeGEg==
X-Received: by 2002:a05:600c:1f94:b0:453:c39:d0c2 with SMTP id 5b1f17b1804b1-4538ee8562dmr175036385e9.24.1751370591152;
        Tue, 01 Jul 2025 04:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:38 +0200
Subject: [PATCH RFT v2 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3706;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7iayfgJ1dAZc21AW/gMObpJaTK4Jre7W6uoH3VtFMTk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXdkaoNLb+tPOwKTmXWO2Kc1HFqnzGAwtoq
 Y0sJyZVX3yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 clDND/9BuRpZx3u9XqWNJ7hOLcErccn0sL4gSURj0Br9j+kDJJr46tueiThfMZpkPEwlYT6h3s3
 Q47+uYZ8bV9WkhY+59KzB8otEDdNvsMP05xEdnLoD0h8C2l12eu+jAUZv5lI3ueCGW5/fxcXjT0
 Iucu9kXJbjwq+EU/+ucAuMzRT9/GqyiP++t6Kvw9A62uldgPVPhgir3m7KMVeSNzVFXfevpsmkB
 aIHOTAwDDGwDRferwWj/9GQlHB4BuapKCS992iP1tQgbCWhev7bMZdqdDhtYt2iYkZYndrQGdg0
 9Dj84j79kyzrWjE+OEDPdw3DVEg20KVvJP6SlRx8RcSpd18sT4U7bSkqkbRMo1si3/oLWgVo+ae
 VIWNZmQjj5ZHCwvAJcjQDJNIJpnmayRzQc/ealI5muuiAzpWCl+oSjYlLevvI23fJI2dVfxSWva
 Ut+objfa15+H2NMgDVpPkKOrMUPKsZb24Az4Rn/q7Trmk3lsx9jReF6gpCPjqb04ZDmhMWnBp3B
 ciR4Ytq03ponzgxA90LttFx9K7+tvdAxup6UD6urmPjpT09F6vEpZTkPzqJN3L4OadivrVR+Xxx
 DkycKLK4K5DCQhrrN7QOsoiEmCh9WYAgQhDhTMOyDjQ0jWBYddTPm4Z+LvjGqBqHOWzlfGFD5jF
 Xc13UlKAP1cOiXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044952_766866_55004716 
X-CRM114-Status: GOOD (  20.19  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The two latch GPIO devices in ams-delta are registered with struct
bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
also able to get the relevant values from the software node. Set up
device properties and switch to using platform_device_info to register
the devices as platform_add_devices() doesn't allow us to pass device
properties to the driver model.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 42 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1cbcfd5bd15203cad119d39aa95f19..16392720296cd224732450c85419c35bbab506f6 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -175,20 +176,18 @@ static struct resource latch1_resources[] = {
 
 #define LATCH1_LABEL	"latch1"
 
-static struct bgpio_pdata latch1_pdata = {
-	.label	= LATCH1_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH1_NGPIO,
+static const struct property_entry latch1_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH1_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH1_NGPIO),
+	{ }
 };
 
-static struct platform_device latch1_gpio_device = {
+static const struct platform_device_info latch1_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 0,
-	.resource	= latch1_resources,
-	.num_resources	= ARRAY_SIZE(latch1_resources),
-	.dev		= {
-		.platform_data	= &latch1_pdata,
-	},
+	.res		= latch1_resources,
+	.num_res	= ARRAY_SIZE(latch1_resources),
+	.properties	= latch1_gpio_props,
 };
 
 #define LATCH1_PIN_LED_CAMERA		0
@@ -213,20 +212,18 @@ static struct resource latch2_resources[] = {
 
 #define LATCH2_LABEL	"latch2"
 
-static struct bgpio_pdata latch2_pdata = {
-	.label	= LATCH2_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH2_NGPIO,
+static const struct property_entry latch2_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH2_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH2_NGPIO),
+	{ }
 };
 
-static struct platform_device latch2_gpio_device = {
+static struct platform_device_info latch2_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 1,
-	.resource	= latch2_resources,
-	.num_resources	= ARRAY_SIZE(latch2_resources),
-	.dev		= {
-		.platform_data	= &latch2_pdata,
-	},
+	.res		= latch2_resources,
+	.num_res	= ARRAY_SIZE(latch2_resources),
+	.properties	= latch2_gpio_props,
 };
 
 #define LATCH2_PIN_LCD_VBLEN		0
@@ -542,8 +539,6 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
 };
 
 static struct platform_device *ams_delta_devices[] __initdata = {
-	&latch1_gpio_device,
-	&latch2_gpio_device,
 	&ams_delta_kp_device,
 	&ams_delta_audio_device,
 	&ams_delta_serio_device,
@@ -697,6 +692,9 @@ static void __init ams_delta_init(void)
 	omap1_usb_init(&ams_delta_usb_config);
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
+	platform_device_register_full(&latch1_gpio_devinfo);
+	platform_device_register_full(&latch2_gpio_devinfo);
+
 	/*
 	 * As soon as regulator consumers have been registered, assign their
 	 * dev_names to consumer supply entries of respective regulators.

-- 
2.48.1


