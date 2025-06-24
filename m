Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F028FC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=; b=ftckPMq+KMsZQ+FHcS3bQ3TzFz
	DQlcBJqDLzqBFhWU4vLBB3/3YDs1PRPgbM5AsUyHym8w1QUMLyGAjhhSAMzesD42N4UmaeltLzQ4J
	a9nAELeWS6rE4fF8GMIgVyI/POQPQIx4kGOHgkU6OycjN1LGET+jdnu0nH5g73JXGHZyNiwhN73uq
	67e3CZt5PGVIFiXForlALbNKFlxwfRJnPMNaZmSkJ6LSe/9mG4pqEQMmMK2oafqfPyO/6ogYD44og
	S6+TInlIdUyMcpvhZe/M+6xU/apB+qkWiVuZsfFRuwK9MIxE42TLyN/rpKAhjeeb1BaN77Wk9jWXm
	p9s6mfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3hb-00000005iHO-0STI;
	Tue, 24 Jun 2025 13:28:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yf-00000005h4z-0n9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a510432236so3936032f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771168; x=1751375968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=;
        b=yFc5ZtDHBJRU1RErxgbND+DQ4poCQuL7lOf0v7hqd3Qv/aacGSZa9h3LAViFcxSLar
         3NIGJcoZzpqWq5v1e7h4Bpoypu7GRJAE3IOBL25ZSjkjQ2uiWYgoK8HCpWcUwIfU+YdP
         YGDvLKOHe2qmU1xXB9q427EUC3AhfULXdcN4fmp8CJq90hkXdXxxZ3YZu3QQmFHhcknK
         CQZKF++4zmd2lOv9tUqR+H7Kml1KqSnwEVYu8XlYKuNwGD2pTQcKhAJcx5w5Ylu7WHxF
         9M+c6OnHJ3PaFohCEfPMMIsUPM3t7zjr8s8SYG4RPPcHW/5lO5V1Y3gXDcCKMA38WeRy
         R4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771168; x=1751375968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=;
        b=r6cuC2gWNZBb9wneVuKhOfgswki2eEwTZZ595RD2kHJmyMM1/xe1osw/RbQYbkSrk/
         WvLf/RBp1ViEkjZLMq8nUPJHYKztxtihytK3Ko8hRuPhzH2h+ULrCsOt62lKaDCwClFq
         BUP2o8xD8FirY8lX1MKTD//6KEZnnv9czG5u2fYi9MGoYG6+btgJeI9Mdz2FK3Tx+VeT
         Y/3DMf7R2n4jxnHgQrVeqXqLiTjYMCjyDTFhxvme88Vi7xQux5FVeYYmqZs2fsRCexff
         /WmjAOa8UceBCIyKEm/CbUysHHGugSShpmyDcfz6RzjbvdqCmUAaTlsO5nrVrd7VZENx
         +0jA==
X-Forwarded-Encrypted: i=1; AJvYcCXt93MSOaSklwhrBgEPDeNfzTJgmJxy4h7W/fE5l8p6CWg9CEEtYwOuhcBC2lAF0ooz3Yn0sh5QjjymGSNOz7gq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwd1nguGg+f6IY9/br8FbBaII+PX3Pe/lSj5mSEPS4YDSmsZ2A
	Y9MwgBImIY+UBU4Ss709hHkxvrdk359JoalztgPxikoDFiHkMmqtQ2uCexaYyR7bHXI=
X-Gm-Gg: ASbGnct7UAPZR79Rqj9YiMaiMuoQdvuycrXLbZ4+kGwO4GpEOnxFnL47HKIMs0aNhzL
	lYECUSJer3aKYuf6xZcC0BfLDjLiqUxb1hGvk6FlPFtsG5JzHr0UyOnfdZsiewbYTIu4y/G4NJz
	FFxh2pCAYNYapQ2UOcGEnQL3D8lgu99C1yJXdfNcNq8eZv/3W6YOW0khtZQOGPtMDcjzUFYQr3G
	sJ4kBRUFLwMDZG624Rot3UQjYBiuUvbsTkp+oENNoLIRv1/6E66HvXje3Q3omF8p5scNGpMBPIL
	Cp5Oj6GtEKGjvSkhQkiAdCQIKXgc3zg1YGuln5NGMq3O9rveGs8glAIJLNR85ObsNA==
X-Google-Smtp-Source: AGHT+IFTifOhva4BdmUJzGwpovbRm2O4f8NWPXbDRvmJfySUXOoY/Vcz/no16JAPAVghSOGd/Bdvdw==
X-Received: by 2002:a05:6000:402a:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a6d12e33b5mr14504534f8f.13.1750771167466;
        Tue, 24 Jun 2025 06:19:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:15 +0200
Subject: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gFSys3VgqjoqW4I00DJkRfiOOgkVrIw7F6KFiFLO89k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXnpvf/V8HRXBEddOjIKP61RqNuBN355+tm
 gJZnUsAYSeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cmTxEADJSTbkm9nmIjrvON/4aWNZaOQWGwmERXenxDHo6azSSVxY0Vqu/df0cBANsdlJ0bQZ5kg
 GMeopmjkGkyzNMRfxcSoA3M1nZjPMObxMVCEW844SdxsJUg3D++QxcXspEi0HFmFmtuxrQx7SSE
 A2tP6ZP9pgxcZ5RJPc3CYvsZU7zECWTUTMpETHKjaA5Zva1cQZWsSRSNyN4btQPr5nIeL4qrrGw
 KzDvBxP+WD9/HRFx1OV5siWn3MjpUoTP0u4dr5AkuPCBqbSGsUbD1V0EOF+QzQ+1EoAuMTR6s3b
 hqH+ZOkMCnIaktBI+Josa8iHbdfffA8IQ25A6gn0cnJ3NKNrUSNMjptPYtOmcXPmGpaUKh5XVH9
 wMVLWjOzoStmxen9NcmFIahGkb5PNvcyVp+YhFEyMbikAjeBi1fh2b5H0N5RvcKEftV8mn2Ipti
 MONCVWkuAn/2f/fWUIXwvoyNOV0cHpcSCMu4yARrvbIX6hrz5eiSxtaDmEnL+bxo4wfHfAXFXn0
 6GOu0tHw84dy8Ny3+dB7XIXPoySiaFB4BS3cZH8X7SJxefYejQYp5+hy0xB0+nm5TLlQ1DmLHMa
 udtgNZ28WrAsW19CMj3wZ7MsAVJCgoIoaSwspXrXH0DdEyvbhCD93Bu6qkcZX7kHJOrKlcQXtqK
 XFxQ11pBw2aA3ug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_061929_237180_AF346D7F 
X-CRM114-Status: GOOD (  19.06  )
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


