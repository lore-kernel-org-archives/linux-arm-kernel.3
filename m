Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE6EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8VrzxACgA2dOPOHl6AhU6CQRJ0KF6yC3uD65WRmQ9s=; b=WHjpm3Qg4nuACQSuB4KDTdh5rO
	Wfz2sugusu5UM+1euwpt1sGNf2SNna82rZ3GS4qldMlSTJi/nu7+zUkyYXC5dhfEyufDKBepcnvbh
	saFhYG5xkl8EyqKrh88aT4B0kbouUGYRqkgdutaIhyZkmABCkneVlb9g9u/fHpo3XERgk7oSj8jqE
	xpC9qMapLp9lmqNcRJsmMxL/KeThk36Uok7VY/EcbicQgGGIK8PKnaC9BVIEG5jgXA/u9zjuBRMnp
	yPEL494ci+Q4mhLE1qq7s4NGKEGr0ySZawQNdtaIh7Io4dyoHtlI2P8zxdpzlSTHTEodsUyylaSNe
	MaAWWJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglC-000000010ab-1Kho;
	Thu, 09 Jul 2026 04:53:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl5-000000010XE-3Ap2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cacd69a9c0so17969455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572791; x=1784177591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8VrzxACgA2dOPOHl6AhU6CQRJ0KF6yC3uD65WRmQ9s=;
        b=E2LOZU3ps5Y/3RTNpssCPEsgWn5zTgL/WqXpjNx6xPTsiRPnPZBe6Z+tXkDMCtGDx5
         V71sNWnO+j2oUf0+5fbWoe/v67UW/rYYjJqeS1cpI6C9q91Ejgta3A5CpJz8xgDB52p8
         eORl8vye5xReKLbv0x5vbkAkOfqA9NHOzxlzQa3Bo9H2dnzkcKbrO8XN27U5+r3IdPz5
         UmVAJcSlC0W64xrI81gDySHqWWq2FOEiw8Ww8QmgahvvdrSOCTB1/U6VLrnBkvqCNXPx
         Jc6Esqjv+S6CLScoKjxkLC9Rd3uvLPZjxUrM395L0xkfpcfAncMGZK62CR2RWbh6ohrG
         pyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572791; x=1784177591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8VrzxACgA2dOPOHl6AhU6CQRJ0KF6yC3uD65WRmQ9s=;
        b=MWFSPZu7r5HGgJeXZiFdaK2FVznjBkQmjS0NnFebQ2xNgzS/DrFR0Gq/gn6+M20im6
         sTAtHriS/WUk/92ntpPSqYIX3S5bAoULwgkCU159t6ABimvgeN5z07LxCZwYhD+Y1jSI
         izZAHjBvEUWW9qHwB3kwg3MlRmzlgPG48jMJPOVPzm34Q0QdCg0idNgsnFWpo414b32Y
         RcSUNH+jX4rY2B24ZNGGxafGqFAAASla59uWnhkxnQjr/gAoatKscQfvLc+HaA5wAAFI
         1nGILU2/zg8kHdhlK0lDcyGDNoIPWf8W75FrmUccatjcXlEvmMABfVx9u1IefV8nuvyf
         XX0g==
X-Forwarded-Encrypted: i=1; AHgh+Rrxj7i7HN6xsvcJ1mUHEfnXJR3RJS7zEtTa6bpHgCaZ2xwZIqH3zXhjOS5hUXWLGxbsVIve8vBLpvWHgyHcERSj@lists.infradead.org
X-Gm-Message-State: AOJu0YyMNJZv1AxyYH3WBNwtv+9UqD15iMRy9EqYEX4WrUxkbaRU3wvi
	9b7fLflNM8SbNCqmb4zjAzpcnwro1xB5RDZiNnLF+XVMzjk+wz5rbhDK
X-Gm-Gg: AfdE7cnPZz9CNnR0cjBRi3DOMdxqbV1HV82cWoT7UDYQubCrSVbDGG8/WkjHVdBQv5s
	uQqobNYI/5z3e2tABjprONyWUpBT7e+UG3Urvm5CsJoWPwiNMXAQeTRDSEfJcikA2xleI8oncEf
	HynycFF07zJRp4ZWlpyOOHQ53JIxtfDoAZXCipKy+R33sIn8CJslX6n8ZWbHK+5KbRoBtoVCmXh
	nkBqz9Xow+Zpj58Xljb5xfZKHB+4YJvGYzcQkXLFF/tSY/fe60fKytovPc5n6RGieEyu9ypiLQB
	8ME1EMpccDo+pI8d8GjlkLAjs8w5i1bPcCBQ51kEksBDC68dgbmY+MX3dbR91gxq5tgF9k8NWJq
	T8gBr0AEinkX7Ar+tJYB16YyUbx403AJ871gcrLocAm5KojsTNqqjoHHC7Ia03SSWEuxghR9Kp1
	3BtPf6N9tN8+/vGVJglD68n2wKfuRCjWFHwrqm2G4OzzMkEhrXmlyEpE9LOccEeBgwRRW6glnC5
	hS4
X-Received: by 2002:a05:6a21:d82:b0:3bf:bde7:d66f with SMTP id adf61e73a8af0-3c0bc8aa661mr6031384637.2.1783572790764;
        Wed, 08 Jul 2026 21:53:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:01 -0700
Subject: [PATCH v2 03/11] ARM: s3c: register and attach software nodes for
 Samsung gpio_chips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-3-3c6ed4c9b3b6@gmail.com>
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
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215311_826482_8250A4A3 
X-CRM114-Status: GOOD (  21.09  )
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

Define and register software nodes for the Samsung GPIO chips on legacy
(non-DT) platforms.

Attach the matching software node to each gpio_chip's fwnode during
registration, using the bank label to calculate the index.

This provides the infrastructure for converting board files and drivers
to use software nodes/properties instead of legacy platform data or GPIO
lookup tables.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/gpio-core.h            |  3 ++
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h |  5 +++
 arch/arm/mach-s3c/gpio-samsung.c         | 72 ++++++++++++++++++++++++--------
 3 files changed, 63 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-s3c/gpio-core.h b/arch/arm/mach-s3c/gpio-core.h
index 6801c85fb9da..464b0d02f102 100644
--- a/arch/arm/mach-s3c/gpio-core.h
+++ b/arch/arm/mach-s3c/gpio-core.h
@@ -14,6 +14,8 @@
 #include "gpio-samsung.h"
 #include <linux/gpio/driver.h>
 
+struct software_node;
+
 #define GPIOCON_OFF	(0x00)
 #define GPIODAT_OFF	(0x04)
 
@@ -66,6 +68,7 @@ struct samsung_gpio_cfg;
  */
 struct samsung_gpio_chip {
 	struct gpio_chip	chip;
+	const struct software_node *swnode;
 	struct samsung_gpio_cfg	*config;
 	struct samsung_gpio_pm	*pm;
 	void __iomem		*base;
diff --git a/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h b/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
index 8ed144a0d474..fc21d3f50ce9 100644
--- a/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
+++ b/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
@@ -13,6 +13,8 @@
 
 #ifdef CONFIG_GPIO_SAMSUNG
 
+#include <linux/property.h>
+
 /* GPIO bank sizes */
 #define S3C64XX_GPIO_A_NR	(8)
 #define S3C64XX_GPIO_B_NR	(7)
@@ -89,6 +91,9 @@ enum s3c_gpio_number {
 /* define the number of gpios we need to the one after the GPQ() range */
 #define GPIO_BOARD_START (S3C64XX_GPQ(S3C64XX_GPIO_Q_NR) + 1)
 
+extern const struct software_node samsung_gpiochip_nodes[];
+#define SAMSUNG_GPIO_NODE(node)	(&samsung_gpiochip_nodes[(node) - 'A'])
+
 #endif /* GPIO_SAMSUNG */
 #endif /* GPIO_SAMSUNG_S3C64XX_H */
 
diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 81e198e5a6d3..b35cf62a9157 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -37,6 +37,28 @@
 #include "gpio-cfg-helpers.h"
 #include "pm.h"
 
+const struct software_node samsung_gpiochip_nodes[] = {
+	SOFTWARE_NODE("GPA", NULL, NULL),
+	SOFTWARE_NODE("GPB", NULL, NULL),
+	SOFTWARE_NODE("GPC", NULL, NULL),
+	SOFTWARE_NODE("GPD", NULL, NULL),
+	SOFTWARE_NODE("GPE", NULL, NULL),
+	SOFTWARE_NODE("GPF", NULL, NULL),
+	SOFTWARE_NODE("GPG", NULL, NULL),
+	SOFTWARE_NODE("GPH", NULL, NULL),
+	SOFTWARE_NODE("GPI", NULL, NULL),
+	SOFTWARE_NODE("GPJ", NULL, NULL),
+	SOFTWARE_NODE("GPK", NULL, NULL),
+	SOFTWARE_NODE("GPL", NULL, NULL),
+	SOFTWARE_NODE("GPM", NULL, NULL),
+	SOFTWARE_NODE("GPN", NULL, NULL),
+	SOFTWARE_NODE("GPO", NULL, NULL),
+	SOFTWARE_NODE("GPP", NULL, NULL),
+	SOFTWARE_NODE("GPQ", NULL, NULL),
+};
+
+#define NUM_SAMSUNG_GPIOCHIPS ARRAY_SIZE(samsung_gpiochip_nodes)
+
 static int samsung_gpio_setpull_updown(struct samsung_gpio_chip *chip,
 				unsigned int off, samsung_gpio_pull_t pull)
 {
@@ -491,6 +513,16 @@ static __init void s3c_gpiolib_track(struct samsung_gpio_chip *chip)
 }
 #endif /* CONFIG_S3C_GPIO_TRACK */
 
+static void __init samsung_setup_gpiochip_nodes(void)
+{
+	const struct software_node *group[NUM_SAMSUNG_GPIOCHIPS + 1] = { 0 };
+
+	for (unsigned int i = 0; i < NUM_SAMSUNG_GPIOCHIPS; i++)
+		group[i] = &samsung_gpiochip_nodes[i];
+
+	software_node_register_node_group(group);
+}
+
 /*
  * samsung_gpiolib_add() - add the Samsung gpio_chip.
  * @chip: The chip to register
@@ -506,12 +538,16 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 	struct gpio_chip *gc = &chip->chip;
 	int ret;
 
+	gc->label = chip->swnode->name;
+
 	BUG_ON(!chip->base);
 	BUG_ON(!gc->label);
 	BUG_ON(!gc->ngpio);
 
 	spin_lock_init(&chip->lock);
 
+	gc->fwnode = software_node_fwnode(chip->swnode);
+
 	if (!gc->direction_input)
 		gc->direction_input = samsung_gpiolib_2bit_input;
 	if (!gc->direction_output)
@@ -659,49 +695,49 @@ static struct samsung_gpio_chip s3c64xx_gpios_4bit[] = {
 		.chip	= {
 			.base	= S3C64XX_GPA(0),
 			.ngpio	= S3C64XX_GPIO_A_NR,
-			.label	= "GPA",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('A'),
 	}, {
 		.chip	= {
 			.base	= S3C64XX_GPB(0),
 			.ngpio	= S3C64XX_GPIO_B_NR,
-			.label	= "GPB",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('B'),
 	}, {
 		.chip	= {
 			.base	= S3C64XX_GPC(0),
 			.ngpio	= S3C64XX_GPIO_C_NR,
-			.label	= "GPC",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('C'),
 	}, {
 		.chip	= {
 			.base	= S3C64XX_GPD(0),
 			.ngpio	= S3C64XX_GPIO_D_NR,
-			.label	= "GPD",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('D'),
 	}, {
 		.config	= &samsung_gpio_cfgs[0],
 		.chip	= {
 			.base	= S3C64XX_GPE(0),
 			.ngpio	= S3C64XX_GPIO_E_NR,
-			.label	= "GPE",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('E'),
 	}, {
 		.base	= S3C64XX_GPG_BASE,
 		.chip	= {
 			.base	= S3C64XX_GPG(0),
 			.ngpio	= S3C64XX_GPIO_G_NR,
-			.label	= "GPG",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('G'),
 	}, {
 		.base	= S3C64XX_GPM_BASE,
 		.config	= &samsung_gpio_cfgs[1],
 		.chip	= {
 			.base	= S3C64XX_GPM(0),
 			.ngpio	= S3C64XX_GPIO_M_NR,
-			.label	= "GPM",
 			.to_irq = s3c64xx_gpiolib_mbank_to_irq,
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('M'),
 	},
 };
 
@@ -711,25 +747,25 @@ static struct samsung_gpio_chip s3c64xx_gpios_4bit2[] = {
 		.chip	= {
 			.base	= S3C64XX_GPH(0),
 			.ngpio	= S3C64XX_GPIO_H_NR,
-			.label	= "GPH",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('H'),
 	}, {
 		.base	= S3C64XX_GPK_BASE + 0x4,
 		.config	= &samsung_gpio_cfgs[0],
 		.chip	= {
 			.base	= S3C64XX_GPK(0),
 			.ngpio	= S3C64XX_GPIO_K_NR,
-			.label	= "GPK",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('K'),
 	}, {
 		.base	= S3C64XX_GPL_BASE + 0x4,
 		.config	= &samsung_gpio_cfgs[1],
 		.chip	= {
 			.base	= S3C64XX_GPL(0),
 			.ngpio	= S3C64XX_GPIO_L_NR,
-			.label	= "GPL",
 			.to_irq = s3c64xx_gpiolib_lbank_to_irq,
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('L'),
 	},
 };
 
@@ -740,43 +776,43 @@ static struct samsung_gpio_chip s3c64xx_gpios_2bit[] = {
 		.chip	= {
 			.base	= S3C64XX_GPF(0),
 			.ngpio	= S3C64XX_GPIO_F_NR,
-			.label	= "GPF",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('F'),
 	}, {
 		.config	= &samsung_gpio_cfgs[7],
 		.chip	= {
 			.base	= S3C64XX_GPI(0),
 			.ngpio	= S3C64XX_GPIO_I_NR,
-			.label	= "GPI",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('I'),
 	}, {
 		.config	= &samsung_gpio_cfgs[7],
 		.chip	= {
 			.base	= S3C64XX_GPJ(0),
 			.ngpio	= S3C64XX_GPIO_J_NR,
-			.label	= "GPJ",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('J'),
 	}, {
 		.config	= &samsung_gpio_cfgs[6],
 		.chip	= {
 			.base	= S3C64XX_GPO(0),
 			.ngpio	= S3C64XX_GPIO_O_NR,
-			.label	= "GPO",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('O'),
 	}, {
 		.config	= &samsung_gpio_cfgs[6],
 		.chip	= {
 			.base	= S3C64XX_GPP(0),
 			.ngpio	= S3C64XX_GPIO_P_NR,
-			.label	= "GPP",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('P'),
 	}, {
 		.config	= &samsung_gpio_cfgs[6],
 		.chip	= {
 			.base	= S3C64XX_GPQ(0),
 			.ngpio	= S3C64XX_GPIO_Q_NR,
-			.label	= "GPQ",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('Q'),
 	}, {
 		.base	= S3C64XX_GPN_BASE,
 		.irq_base = IRQ_EINT(0),
@@ -784,9 +820,9 @@ static struct samsung_gpio_chip s3c64xx_gpios_2bit[] = {
 		.chip	= {
 			.base	= S3C64XX_GPN(0),
 			.ngpio	= S3C64XX_GPIO_N_NR,
-			.label	= "GPN",
 			.to_irq = samsung_gpiolib_to_irq,
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('N'),
 	},
 };
 
@@ -803,6 +839,8 @@ static __init int samsung_gpiolib_init(void)
 		return 0;
 
 	if (soc_is_s3c64xx()) {
+		samsung_setup_gpiochip_nodes();
+
 		samsung_gpiolib_set_cfg(samsung_gpio_cfgs,
 				ARRAY_SIZE(samsung_gpio_cfgs));
 		samsung_gpiolib_add_2bit_chips(s3c64xx_gpios_2bit,

-- 
2.55.0.795.g602f6c329a-goog


