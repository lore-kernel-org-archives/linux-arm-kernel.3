Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B8FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=; b=tzTBoU5R/AKU97hzRs9N3x1ixe
	m2Em4t1UYeGWR5rrwkT56jkW4DYybJz2/OadAfFUMCRlTy1fHzFDRacY3dOQIdp02SI0x4rAs9e85
	lS22dmQ8ZwXYfJ1gcK1/aZdnTfUOIikYbwQzQGZ34DOMC2S3mvzhtNEusVuJjrg0TLX+mSAWcPcAx
	n2Y6xkcqRnTEHVxgdMMphjV3tOR10Ih17f/6G0r7L8pb9ERU0rpo4EMzQKaFuBwo4nEacZjED09dB
	2oiTcSho030bbFUuAADP5FVoXhtdt/U0oIuC2OErstRKtu45veJ4JOIoNlcYHVzZXwtkY8ARfQbbJ
	dXSzGy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwGB-0000000Dz9P-49Uz;
	Tue, 07 Jul 2026 03:14:11 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwG9-0000000Dz7q-1dUg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:14:10 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2401893a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394048; x=1783998848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=;
        b=PZ0TCOAlgnAg23zMaG6XpkOosc8NcZkT1FIEBcnjXPg935zehp36V8AmYashhsyIqx
         QrMfjEVZUicxu95D5cM1pPUjWhbyBt75ZLg/5sHNAFewK8lc1stbP8DkUbsvYvUiFStI
         Xlb+uqyCpUSUMpHFH+5GuC0fAkxSWWiafFyMWqg3jTuIj0xDs1U1uoK5EfvcFD04ksID
         P4J2mdazw+NRwEyJkzt/g/cVeXEBHEgudAocKg75TaqWgpg8QoUARBKY8mTb7OB0v7B4
         vNGpdXa/e/Tttxip0dSM8yRUR6Ynup66uZMdbM10YSL4PfxWkhFeWOhS9yL2oZHnYkef
         9QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394048; x=1783998848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=;
        b=Ipoi35+FBvO+Tsxl6oIt0xbvBIMLk34Uyi3QSstRsK+gevUOHhngzxfR0/EcW31ehF
         udTc9nwO/idplseyUIlsX1o/6b+W6x43Yd3xY6NwFQjqWpIaT/OICMNIyTlAsZmUGww3
         Fmcnv0ftQ1Vrhz27J6+Zbys4Vvxau2TDdY0Sw29bb5vXKzjSdEu3LwZ6jVjyiMzEdJV0
         /EOsAhHijt2wPwfVcz/OjX4pkk9HoNTPIENuYcZD2/PZnhdQEv4b0w4A2xlC3lFxuMVw
         HjQxcIsfxO5626i/Ye9HtJB+q5Mpz/PrPrzQqncKaIk/SBCltUu/BMPMChD7sNW2uH1z
         v7ZQ==
X-Gm-Message-State: AOJu0YwR1/KUMfz3hevjBby9QMQypPK0ESHmotklsd7C+ffLemjKzeMu
	g66rV2gIq+IeaD02yeMdQRI0zTjfu77R8ff6b2tOQrHZ52uUwqEb/YGJ
X-Gm-Gg: AfdE7clkQt/b9tp6DoCgd0msqq7SxtXucexaioWFiuoPiKUwa9SbZYNS6Cu9wM2Oqjz
	wQAhaBz/HwxZ2MUO70JZhPZtnkFq6cxxV4uL7BRDaBmzIaG6JXDxEQzj1dQiMJvmU/KbyAqBWJ1
	B4GkJ0+OvIs3ubwS+Ikl9Qgu4r6+mlw7O41fawmfSz+SC2PU3H+hE70YBmkh7fzO4YCO9Tqbjbf
	6WDt5XE1tLIjUOEjc98K3hPTUoRN+z61xwMh2M2yzspvtfFPYWRWiLUBaOv0CbipSHve8SC609y
	d4NgGsrnSXOqjo3Gbrk8joafQ1wV4Kfq6MHVoA+RAZVWrxpmI6du9Laqf87Vm44jt7MliLO8iim
	7yFnFylKruv6Syqs/lGG5ITHfNKvcOvrFt9+i2AHg6IsSV7A3FTleV7tF0fcuyjr2TR3jBbzdPw
	TJlV+8Bn9XrY5vuMAjLMZTKLvsCNnbdpIjbucNYFT6HQHHjYn/SjGy7/WCsxsx1ATwG/QcG3BT4
	ViU
X-Received: by 2002:a05:6a20:1615:b0:3bf:6c05:ad with SMTP id adf61e73a8af0-3c08f020a10mr4089430637.60.1783394048343;
        Mon, 06 Jul 2026 20:14:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:01 -0700
Subject: [PATCH 2/4] ARM: sa1100: assabet: convert gpio-keys to use
 software nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-2-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_201409_439409_9EE56DB3 
X-CRM114-Status: GOOD (  16.84  )
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

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Assabet evaluation board to use software nodes and device properties.
This allows describing the buttons and their GPIO bindings via software
nodes so that platform data support can eventually be removed from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the two button
child nodes at file scope, referencing the SA-1100 GPIO controller node
directly. In assabet_init(), register the software node group and use
platform_device_register_full() to register the gpio-keys device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/assabet.c | 75 ++++++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2b833aa0212b..b001f0b6a3fa 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -13,8 +13,10 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/gpio-reg.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
+#include <linux/input.h>
 #include <linux/ioport.h>
+#include <linux/property.h>
 #include <linux/platform_data/sa11x0-serial.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -467,28 +469,53 @@ static const struct gpio_led_platform_data assabet_leds_pdata __initconst = {
 	.leds = assabet_leds,
 };
 
-static struct gpio_keys_button assabet_keys_buttons[] = {
-	{
-		.gpio = 0,
-		.irq = IRQ_GPIO0,
-		.desc = "gpio0",
-		.wakeup = 1,
-		.can_disable = 1,
-		.debounce_interval = 5,
-	}, {
-		.gpio = 1,
-		.irq = IRQ_GPIO1,
-		.desc = "gpio1",
-		.wakeup = 1,
-		.can_disable = 1,
-		.debounce_interval = 5,
-	},
+static const struct software_node assabet_gpio_keys_node = {
+	.name = "assabet-gpio-keys",
+};
+
+static const struct property_entry assabet_key0_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    0, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "gpio0"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),
+	PROPERTY_ENTRY_U32("debounce-interval", 5),
+	{ }
+};
+
+static const struct software_node assabet_key0_node = {
+	.parent = &assabet_gpio_keys_node,
+	.properties = assabet_key0_props,
+};
+
+static const struct property_entry assabet_key1_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "gpio1"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),
+	PROPERTY_ENTRY_U32("debounce-interval", 5),
+	{ }
+};
+
+static const struct software_node assabet_key1_node = {
+	.parent = &assabet_gpio_keys_node,
+	.properties = assabet_key1_props,
+};
+
+static const struct software_node * const assabet_gpio_keys_swnodes[] __initconst = {
+	&assabet_gpio_keys_node,
+	&assabet_key0_node,
+	&assabet_key1_node,
+	NULL
 };
 
-static const struct gpio_keys_platform_data assabet_keys_pdata = {
-	.buttons = assabet_keys_buttons,
-	.nbuttons = ARRAY_SIZE(assabet_keys_buttons),
-	.rep = 0,
+static const struct platform_device_info assabet_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &assabet_gpio_keys_node,
 };
 
 static struct gpiod_lookup_table assabet_uart1_gpio_table = {
@@ -571,10 +598,8 @@ static void __init assabet_init(void)
 
 	}
 
-	platform_device_register_resndata(NULL, "gpio-keys", 0,
-					  NULL, 0,
-					  &assabet_keys_pdata,
-					  sizeof(assabet_keys_pdata));
+	software_node_register_node_group(assabet_gpio_keys_swnodes);
+	platform_device_register_full(&assabet_gpio_keys_dev_info);
 
 	gpiod_add_lookup_table(&assabet_leds_gpio_table);
 	gpio_led_register_device(-1, &assabet_leds_pdata);

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


