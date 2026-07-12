Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08553C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/De877qrc3LI5SOFOCYuqXrG3akE0R4KYm/cFtv2XA=; b=d28TgmZ+nrpiUSs4uQHF5lqQd4
	uFGuwIXfO9aGVNyQ4WDeR3YMfciZJaUfUTLpObCdbX0qzGE2As5JUeRcFcOD0IE2maU3fGaf3CF+R
	XShffQKIMpeNgpUp4X5xJkqgc97c38a6iP76fxGMHW1sJDAjqRz2TMlfL8koJenpp0tAa2Ildx3wF
	Wg1c3uJZfos9Fcu+NsXxgvWJ8OoGW+gfHeExPSr98o2X/DwYQ17vVG4tdw/WvYzd4QOz/q/xaV5wU
	y7AlaXcruK7NDljoDFLl0dfnZ+YZvSL9GS/KczyyAbv/Yh2h7sgvH00U2wkQd7MvdPvHohOTv2cN2
	WLBUB8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgu-0000000706W-3yMQ;
	Sun, 12 Jul 2026 02:13:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgo-0000000703t-0Lbx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2006045a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822385; x=1784427185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/De877qrc3LI5SOFOCYuqXrG3akE0R4KYm/cFtv2XA=;
        b=K7OiwnmvTa3zQzuvl/Qol6T6AFs3uTHrfdVSeU3OkKJhne2H/DEZAS/MpVKyzE0227
         d9oZTdN866vBhC2m/yMmWjoT0yHkOlEzQ4l0cDk9uWKsrCIndaUnUXIS7/6Q3ce9Y/1G
         4VlgHBWAkOFK5Wfk7fccOHdwyGwmfU/tmibxhtxa0R27MntTuGOosjBjLJsl204xWe6E
         jDZRkG7fL7SUVm9BX9AOQfLP0IHR3MnHnn1oBUNGwFpAvQ9Puw8BxZIafkbLbvhBiR7n
         DUTAtNmIM0cU9UmWdvqYWQmVlyM6Wa88yrlWrdOT6HvLstGk1u7Vo05QQ2wIwxNI9w8y
         psoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822385; x=1784427185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/De877qrc3LI5SOFOCYuqXrG3akE0R4KYm/cFtv2XA=;
        b=Qh9+ckbmCeV55Py+noi0lRUOoGqpyQTr2/8ayFQlOaJlDgZbUUaUOZ7Vs49EFWCjiO
         onMq4+nAVhAjXWxEv5WM6LvuMfJWwn6O3vKKZplxh6hvXZp3g0s/+GuFBuwvx3aqUs31
         CC2xgMhHV/29gTcjSAJLmJyyRpHq8FVTw5ucBkbuap2Lmxpx9KmCzpe8O7A8eskLA8U8
         jRkNMFJHCu2MD5KBONrjKgyCjjpueThRRCwW4OnmTCFF8C0kKS3VuPDHaLyewN0qJ+nG
         jQ374uzkrO0buVje+uXinUS8YBH4eERNHGT2XH8tnQjzLafnT4b0YJbwC971iAA3ocpE
         Sm1Q==
X-Forwarded-Encrypted: i=1; AHgh+RriIriMUIQFUiANiC9itqoaMCUM0t+zDsAUVD6TqU7QxplRs5wx9TfVwA8nbF5IVv4wjc4v598aHl0zwP7299Gw@lists.infradead.org
X-Gm-Message-State: AOJu0YxadGsLdzPcD4AmKh/0ZoKgC6eNnxBGt1EXv/LqhRres2BplaN0
	dpjBz06TY6fa7X/F2AXy5k0k35CGZPLnrgY9eoYnx9DdWX1t0mMSOZE6
X-Gm-Gg: AfdE7cnR1TlR7hWEUWQL+E4UJID2EhIe8U+aljMO46Ndl63IDxZO78tXuSA5a1xH6ED
	0jEqklVdhXhxcwr+OAApVBaZ7TXLczMuQuRQzC11dJIMu3yZzwYfiug3yI+SclBYoj+tkFc5QWR
	3gw86tmc2vy96NdQI4ajw0P+MP+S3+4p3AEryCE7oohtXalAcFASl7OtPwB9JwToDzamDNKT2QY
	uOFyNQqAzY+rI4CHwyvGVTQtOPB+k3NZBCW6wXwdZ1Q6M5inUEJUQa7SwJn07PY3bB5GVnojhpK
	ph2WXFwwXcZXFeD/35O7nNs3QiB+jGJHHGqg84V5xIyGfhoDWQsldUUtnFWrqpX48Og8SldRBsx
	0MuSIjaH/4wymJlhkUtR0BuMSJUY/0qAK7wHcPj5Qje+aE+68mz5156h3sYg5LzenoQjNWdXmJM
	+9qBOFGh2gRuxyOYKk2TMtakZl/yxgPxVCwoLviPs7ibbe6pAU9LjRK6LUAOecgWZPRF0IE++I1
	aY=
X-Received: by 2002:a17:90b:3908:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38dc7737215mr4573280a91.21.1783822385166;
        Sat, 11 Jul 2026 19:13:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:44 -0700
Subject: [PATCH v3 03/10] ARM: s3c: register and attach software nodes for
 Samsung gpio_chips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-3-b2fcaba77aff@gmail.com>
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
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191306_140470_134BD4C5 
X-CRM114-Status: GOOD (  21.21  )
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
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


