Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF7EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FHjUZQYADUT6bCIy3JjzfiUR27NaQqxGvamZew7Xmw=; b=zMSRdtYlsMLQrJUVOXCLCbku/u
	maeZJH/IB5sFacY7mygZSgDhhO3yAlehwpowxN0K4OcPzcCWWws2gz7SQpPiChmtBTyKVyFFn2/Us
	qsErbUiBB5q5a4vbWHN6uP4VpyLZWOfelUu6lEjNroQVWv9EMzj3J1LsfYsLYMHNERSGYSNugT0Vo
	DwWg37eyCJYza4zpXa8S76TUpN2MmuxBrR0sNsxamXPFlDz3ac6phaO27yUb/X4Il25784cFl1ra1
	CPuLkCJQiXitHr3bR1wzA7BT4pflrgsHQfTL3cNh6za5Fg8zLVAb/26eX2FoFquCPTpzPVQbXyyXX
	9FteR4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijh0-000000070AB-0idl;
	Sun, 12 Jul 2026 02:13:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgu-0000000705u-1Lhq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cea3004256so10985735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822391; x=1784427191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FHjUZQYADUT6bCIy3JjzfiUR27NaQqxGvamZew7Xmw=;
        b=Feo8lRGOQ/L+9/tmKUBFIlIqN6XB/gxp9KrcFdTp8dGNYNwwcds7POuHlEQujyrdse
         cz23SDm4S/1vhMeVZK/o9ad4RyTIjIBxRIXX9UtPrqSuaDZsv6yLxcwUZScsozYQLyIS
         BQ9jYhZqxyTpb62nkF+70ltTrDfPux1YcOFxn7oJyobyQDeotn7D9VxsOsCofdmAszQC
         E6ogh6lJaTODgSwMblgPh99QokyVimKcgNHcQ4AuFWyMueaSJp4cPFuyoQw4RUtp6fyM
         AiFWj16HPBhnJN/TBT10WUBFfI+jWdnI5oDeF1rDwhsD1MAqpPf1Wfog136nUrrUElR8
         nOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822391; x=1784427191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FHjUZQYADUT6bCIy3JjzfiUR27NaQqxGvamZew7Xmw=;
        b=LVl5Qtk0CfZeNCMMl+xIfrBke5dkqUKVMkEW0dE5VGYrs7EeuazHEeRJmafh2a5Iyo
         C8FknDY/f/WV1616FiLf5Mt1xMEuwcf5d+iaFqe4B+YyFub2sYHXepnfqi7Ax5CpS1bC
         AeJFh++P2sHeWi22/ynmzwszEIWMrlnpCgcbohwwVAhZ4wfURBMtQlG8p7jXaGc4N4pU
         S2qwfZ8EfQzuCjjn5uAxIU6ce8KYFMd343aK+LZtLP5Z6SHRB+Qs86Bidm59Om/fl03r
         FCJjGus8hgJq4R4V/KHIxsft22GJ0pdLBARmFFQGZnp7LinPPVernh63z8T8/PtVQccM
         v/Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrEiAMHi4FCM5j2QPjx2UGrNgtO91WTAcSDKZxDyW/KViqFG+/ldbo8bQC4hyvSHNa3xkqoF/hhD3X5auEKF8R8@lists.infradead.org
X-Gm-Message-State: AOJu0YxjZhfmyvYUihpwGyXxZAgu13SWLiYAS97yug+SrscVQpg2iGp8
	VOjF7fGP4oFtoSjXMDZtAFg8IbbaWG8C0KVlIgZLPJ8pi/OlxmHP48YJ
X-Gm-Gg: AfdE7cmvVhmFMTZx3OAUin6amY3B2B85PfqAceDvH1fiCOi3bMCDOdfe6NbINNRN8O0
	KP37OYJeZTyQBzaGaBlT6llIS7QeEi5RxnUEf0pTgcWNTVaYsIQxMaGsu1bQCMeFqVMBnpQE+Wo
	nVaQ9zGDsp8/VgObZzLc9wyh43CybebIwyK4ip/JHvcV2SA6F7RUl/8YUdV9i1mvYNj1qiL+mJY
	yYCe0AuAGaiB+qwnP0IlMJJzFEam4ARnngqjNb0lG1Uv81jhTykmYdfrvpvs//sLLlq7RPoJbJJ
	nWQ049hc5DIPlD4GJcZ/NaFrG+Lhk83qXvJZcl5kySyIYFltjSlirxKbB7teihOTNPaMFeTskM5
	KlQakAntDcu/+udNtX5sjtonPjyH9sinUebtKLXrN+KlHrAn7AkfbhI2OpJz90q5qHhnby6L/F1
	hPGfOf/O0qT3jC7qjRl/ZUDPAWtr55tNsz93g+k7Mf4uOBtq7DczSIVuGKb86u27YvAtvoUrym8
	YI=
X-Received: by 2002:a05:6300:2290:b0:3b5:4fff:fa0f with SMTP id adf61e73a8af0-3c1109ecda0mr4245973637.14.1783822391326;
        Sat, 11 Jul 2026 19:13:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:47 -0700
Subject: [PATCH v3 06/10] ARM: s3c: crag6410: use software nodes/properties
 to set up GPIO keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-6-b2fcaba77aff@gmail.com>
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
X-CRM114-CacheID: sfid-20260711_191312_372794_85FF5A52 
X-CRM114-Status: GOOD (  19.36  )
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

Switch the gpio-keys device to use software nodes/properties to
describe the buttons and switches. This will allow dropping support
for platform data from the gpio-keys driver in the future.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 79 ++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index c2df5dcb3368..757c0f383ff1 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -18,6 +18,7 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/leds.h>
 #include <linux/delay.h>
 #include <linux/mmc/host.h>
@@ -228,32 +229,68 @@ static void __init crag6410_setup_keypad(void)
 		pr_err("failed to instantiate keypad device\n");
 }
 
-static struct gpio_keys_button crag6410_gpio_keys[] = {
-	[0] = {
-		.code	= KEY_SUSPEND,
-		.gpio	= S3C64XX_GPL(10),	/* EINT 18 */
-		.type	= EV_KEY,
-		.wakeup	= 1,
-		.active_low = 1,
-	},
-	[1] = {
-		.code	= SW_FRONT_PROXIMITY,
-		.gpio	= S3C64XX_GPN(11),	/* EINT 11 */
-		.type	= EV_SW,
-	},
+static const struct software_node crag6410_gpio_keys_node = {
+	.name = "crag6410-gpio-keys",
 };
 
-static struct gpio_keys_platform_data crag6410_gpio_keydata = {
-	.buttons	= crag6410_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(crag6410_gpio_keys),
+static const struct property_entry crag6410_suspend_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_SUSPEND),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    SAMSUNG_GPIO_NODE('L'), 10,	/* EINT 18 */
+			    GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device crag6410_gpio_keydev = {
-	.name		= "gpio-keys",
-	.id		= 0,
-	.dev.platform_data = &crag6410_gpio_keydata,
+static const struct software_node crag6410_suspend_key_node = {
+	.parent = &crag6410_gpio_keys_node,
+	.properties = crag6410_suspend_key_props,
+};
+
+static const struct property_entry crag6410_prox_sw_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", SW_FRONT_PROXIMITY),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    SAMSUNG_GPIO_NODE('N'), 11,	/* EINT 11 */
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag6410_prox_sw_node = {
+	.parent = &crag6410_gpio_keys_node,
+	.properties = crag6410_prox_sw_props,
 };
 
+static const struct software_node *crag6410_gpio_keys_swnodes[] = {
+	&crag6410_gpio_keys_node,
+	&crag6410_suspend_key_node,
+	&crag6410_prox_sw_node,
+	NULL
+};
+
+static void __init crag6410_setup_gpio_keys(void)
+{
+	struct platform_device_info keys_info = {
+		.name	= "gpio-keys",
+		.id	= 0,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_gpio_keys_swnodes);
+	if (err) {
+		pr_err("failed to register gpio-keys software nodes: %d\n", err);
+		return;
+	}
+
+	keys_info.fwnode = software_node_fwnode(&crag6410_gpio_keys_node);
+
+	pd = platform_device_register_full(&keys_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
+}
+
 static struct resource crag6410_dm9k_resource[] = {
 	[0] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5, 2),
 	[1] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5 + (1 << 8), 2),
@@ -397,7 +434,6 @@ static struct platform_device *crag6410_devs0[] __initdata = {
 	&samsung_device_pwm,
 	&s3c64xx_device_iis0,
 	&s3c64xx_device_iis1,
-	&crag6410_gpio_keydev,
 };
 
 static struct platform_device *crag6410_devs1[] __initdata = {
@@ -909,6 +945,7 @@ static void __init crag6410_machine_init(void)
 
 	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
+	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 	gpio_led_register_device(-1, &gpio_leds_pdata);

-- 
2.55.0.795.g602f6c329a-goog


