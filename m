Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4538C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g68sAzI9q3vaKyqY3YH6kGACv1PDnX+8oCrf0C6vpMw=; b=J+0c5tuRZZaNUNZ2oGOnYv8Ddl
	6+9JSNixhLI91fZxUVgSSgb+Lij7NR8Nk8zMKl+lQoFsz3rQ8vbqwU8ttidLTm7QlHQ0/iNApoSEh
	/Nj7Hyjt+skz98kECtsR5KxtpweggPZAVdahrEANVuBGh2jhJ9gNtOP4xW/I5MMuwJmIHtsPUjguL
	UFEUKZhuUzKtEZdx2htpHUhxtInxcVMRWur7Yx7/3AXTzbiqWLRy1bzkaZjvu+YgK8WFdqtFBvb+K
	d0ZRK4/RPd4vDVvPnPdEjNqEie6cLGR8bQvcI6I9Io0y4ZG5QZRLIilwnn2AgkTi18bKj+ueW8+xk
	4hRRtMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglH-000000010eN-3C17;
	Thu, 09 Jul 2026 04:53:23 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglC-000000010a5-0Amn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:19 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1023186a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572797; x=1784177597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g68sAzI9q3vaKyqY3YH6kGACv1PDnX+8oCrf0C6vpMw=;
        b=JHbbBe5rxSxo2GJ7rs80nLuETqLYXxhmujh8K9/W68f/vivXlGKXQXWLtYlQSaT0Iz
         Wsb4FZAyZsJV+QQC+arIJ3FXWe1dv7ZicBwSBwOPrjPy7wol2Klife950mGivn0oKGWM
         1CaM0av6FC5e5vwNKFV/ZBbPwGGjOkRJKzeixUK6Li/AiTNeMLHZSkq9vK7H35yDyvFP
         ck4SU34UFHdBDFiH3aMnFCcg2r/kdecijzG2sMGOybGjCn93YanNTQdj8lq0evUyoiRC
         Nx++MXA2PZUW251mZ6/KsMif7pcfEdtkt2WjWmxZVJJk6w0HM/Sxjk9OCRfoJySMSNGv
         MdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572797; x=1784177597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g68sAzI9q3vaKyqY3YH6kGACv1PDnX+8oCrf0C6vpMw=;
        b=Nm8HiVsOe5/JR8JWxLBnZyUOQqMLD8zEQcJxRj82GucXnH7KhnaCZTQ0Z50Zhb7R/+
         5ZzmzoGCU3jzrZDniN+n9SPcPmoE7viw1PiUw37tXuhFkayEUBuf+8h9pcSRypXabpPx
         3BfCx5neN5I//huUm4gU69phRrpxChMZSIE7K9mW3+p4PlAc1AoBPh9kNRZ3cybFvLfr
         inzW/BFImN8GrY+DnUhpyIkMYvECzxizOc008keg2vDI7rPxz5XC5xG90nPMMKTmJd6R
         kC6/sgdwn71Xw6Jgxveq4gbH87tisyQoSzo81HNnSP/ZnqXvv4cSzi9Cxh/SH1/1Yc8B
         Zbzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/svSn7ICXSE184YQdu70s6b8y9py96VjhjYYj3pKUhMjWdsyF5FFwObRQl6tqtyi9SvHXTNAXDpWaOZw0VDDa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7dxCbmuK/MwaiHJDheiIwUhsg6PFh8MOtjSNvU1arSLJegpj0
	LGpQZGKep/D9uBs+HBiH7RwMWrqfKxP+CkVkbSP0osbWImnes9WID3Yq
X-Gm-Gg: AfdE7ckKiaHcNRs6TOebFSlpvHQBoW7wx+hDceXfd7KAhZ7zRl3yXjxAhts2ZPPkYdX
	B60UNYvFYB35wfJ+iHpAbTfPy2Mob4Pf/LBMe6aCti7gDBn6To+YlquAn0iA/Hhs7F9W5WMVuNf
	jaUxYbB0qAVH9Gc14iabsYumXLI4/w/qKRsftIp9Ya06bkERo3i/5PCCvYbSHfoRXNuNnOZoSdK
	y/t7o2L58UkC8iFDydNMNXsJneNwMrbPZbxoo5XfkcBpw0/daZ1E90eKnak/ULtr1ypwc84Uolq
	LkMUmoP7aYs+L4Qhg/w3kdKNG7UD62Lxt7JzPqfRW3PL6Wd6OuFy38SroFybGozjV52f/rb0HSS
	FU677tjuDUWUWY/opkEjcXLKiNAtDihozCVPaLpIAJFoRBLU7/CM44OfJITReRcmvcWzwOmCLFx
	nurBhOrVQZxC+nxZFA6CY2V6/78watHISTxgYerlUkyU8UGZpPDL5dP09XbWjxe39QtHIJqdki0
	1BU
X-Received: by 2002:a05:6a20:431f:b0:3bf:6c05:ac with SMTP id adf61e73a8af0-3c0bcc26ademr6559980637.59.1783572797080;
        Wed, 08 Jul 2026 21:53:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:04 -0700
Subject: [PATCH v2 06/11] ARM: s3c: crag6410: use software nodes/properties
 to set up GPIO keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-6-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
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
X-CRM114-CacheID: sfid-20260708_215318_109629_231E798B 
X-CRM114-Status: GOOD (  19.35  )
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

Switch the gpio-keys device to use software inodes/properties to
describe the buttons and switches. This will allow dropping support
for platform data from the gpio-keys driver in the future.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 79 ++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 6354fc2a49b8..9682ef67b866 100644
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
 		pr_err("failed to instantiate keypad device");
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


