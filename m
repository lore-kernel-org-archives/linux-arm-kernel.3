Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F660CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tF4GdSjPxt9A9sQdNVGH0JFNeUEmQ3gtKZ9O3MWYXAk=; b=kGN2kLY1IEnBe/TWeUeWgjafzI
	MyM6DY6oGAj/+P43GAnkNeG1oLJbDiT4cpuOYIwueHIE/V6ZaF9bgwGBqCb/I+i3WVA4lozKqhvaw
	CeSs2UQuUKCIOz4FnnSnP9vcrXSVOOA9maFKRIG0obsdrHubrZP55IZcpl8S008FbFf5ePJAgmPgr
	1m8kfTx1lhKwuFP65YV7TlOnHZ5Ti/7vJ8cCn7u2A9cQRY8QDzC4dqynTGTSscUL8NyBGpetZYC7f
	YoZQ/ca+5t5n28ysFKog6buHAgcA23ji+cpJwYjilcciN7gpyBIbnH2nP68mEqMFDunBIy0QWtTTz
	e02cMTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWIy-00000008Y65-0C58;
	Mon, 11 Aug 2025 17:27:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU2P-000000087lX-0B8y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:02:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a0feae86aso1915445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924531; x=1755529331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tF4GdSjPxt9A9sQdNVGH0JFNeUEmQ3gtKZ9O3MWYXAk=;
        b=oZl8kfuu9vdG7Md25fYWQT+0zfGrmZrlvglVhI2so3eScDzvoMRhAJgYZZphAoRg1U
         MHnCpRh7xhI5rGzONtCU4y/GB2Ncvf2Zna3koh9MWcPwL+E0+UhfWeh2nRRUUZIja+yQ
         NXFvvcSwfrz3GeahlYKWuniit8GMFckj44qBtoSgCJSyp2JPE0nsQqqteWoxYBTolXkh
         /uJEUxkMcHV0tv5ENKW/NHNPTjjLnSmilR7W1ky38QuOIpBIOO9ySWCTEktXklFDjYUJ
         Shn7ki2EzltvaOTmDXEYIQfdOuVhUsm6r3DPoN+qOjmB62mwdlMAcPVa+euFe+RvdrnY
         IBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924531; x=1755529331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF4GdSjPxt9A9sQdNVGH0JFNeUEmQ3gtKZ9O3MWYXAk=;
        b=UEdGHcCQXQYN5CEXTynh5t1l+VQm06vVUb4QHdrGXfunZ/YA8tMXcAMrqrRMQl6SYA
         75hWN1eHLLRc014Pmf5ZUfDPErOexTaUqER8kRygyko1LjVeDMPMXk16vOt9dQ63K2Q+
         R3p4gcy7sGXI7ySo2bA3cSdVj9DbApPEzFascs36fjJDZlZkN3aQ3r5viOQTjaFvEebf
         TW5krSpra4pxSfj7C+6IfDYDLoQcB0NSMZiOjWpEanyer3x9vns1k2A7EbYI2wNWxcxf
         28c15BP/hhJAknmTdeoIHkDe8GYw09b1aHKhMnyai1aRWFSk4TtCMVtfGwhSc838sfYO
         i4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhmcRPSCwusBAS4lcFYINkqSQSFKYsZyFnYVqsJpQrizq8aC+gKmZt5wO/CwfAjqYP4ez5PhOGGLXcXq7Lc7jf@lists.infradead.org
X-Gm-Message-State: AOJu0YzlmsPI4pvbeajny2uK2w9vySaO7yNIr7Iy7v/Uyxl1DwcbUxQ/
	igyZgEcZqXzRvxyTcFIFNjKkYn7KvcIEjWVt+x2N2gKucjSyFOJKxNhK8UtEBCNRL2s=
X-Gm-Gg: ASbGnct05hJKvY+LycayrBs+zaYB9eCG1oS95oofZD5DW9/yurOmBy2TttcFWlPsY+D
	en2orIbN13QQP2H25VgtQSejfLK6pbzZUiZrj9oyCfK62MQ6zQkoe4Oke+WeV7iA3VYQgcuM3gM
	beYYPnC1PpYVhbYgLxvO1iiBzXn/0gcgb4QxX66CIek/m+URqwS7E7b4HEqM/RHfTi0VgJdYnwk
	U/UxgnJmNj2r+fn0HJ4DttYM3VY810TnC9HHq7+EKiDBfJzHp4/SmWn8rzIOOcRfTBJWS11rPZO
	4oryabfY0p/fHANsbsc7GR7zN3y1pmnR/5bEw4b/NCU5mHQi8nWAb7xJcVjzqAQKK6R7+Cze4+T
	wYgFR3sSpwSVA+sVp
X-Google-Smtp-Source: AGHT+IG4zTuy1s9S/P7JB7DBLKEB7LPsQ3aflAelimWWQ3Dse/nqSvgFOTamj6MqOc0bss+Usz+71w==
X-Received: by 2002:a05:600c:1912:b0:456:18ca:68db with SMTP id 5b1f17b1804b1-45a10ba0259mr191945e9.8.1754924531386;
        Mon, 11 Aug 2025 08:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:02 +0200
Subject: [PATCH 3/5] pinctrl: npcm8xx: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-3-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16133;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sl6mYTSJ2jezzmb6zj6+T/Vzlk2Xh+eIJhstvC15sfY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXtmZ2RiMNO8gXw6mygfQ0yrO4W8x+HCTrc7
 xpdoBYGRdqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 cjPuD/0dPUue0zOuTHuvoSEdy9KiTWKJj055R6d86qPhg0pl3aIMD5vxLu5b93Ani3O+kDMwVXm
 heRVTGSo2I+3FqosnOdJT9P6+LJ8Q6nvIMh6pkCzBSldth7JJv0aPuuHbqIJjPvfC9/jP4DMyZ6
 z/ThqFn9XOvVQGgrlPh9L1WJYtQbnkTc1OAnPFJjb54prPq1X8E8XwCXm6tHdVYlaO20AMQo188
 EWJ+Hzi1mGSknsPV7QFGPO7pPyumsKBYM5XHe5CmpJ8/SIaF5QIgdwjZEx8t2U6IPZziEZzoRwP
 ilRKPENC2x6WqYYrX7ZqVaC1GJeS0B0yDasyVL4ldmIm7VTUvmOM+yqU5QfyA7VH1SpDbJaprhG
 8AyIogNMZNm8r7D8ElfaNa/P2OYuXufm9ec7K4iadyeXcLoK4E4zQ0Hca/eJkpMldq8mS7E+VuQ
 Hp4XouAqPnBa6E5XMSYDAKz1+kz+VOzHYbYzn6iDPnm07CMsjgkcjRJzVIRb2w0XFB/T+17QQX+
 Rqovb6l7eiJYhY4CK90GGJ2VOE4xWIb0Urz4RV5Uet3mQ+tgPEPzRAvaRTHAEQ4zGsPlSWgH8ja
 ilUGHnkRY78AMhRnZAF4zNcIFj3iBqUncZGLpg5t2wDEiTgQ9VPDv/X+0kDJYF/rn4DKEP+Jt9q
 ADMRqFrrw4xsX+A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_080213_115182_73DE14CD 
X-CRM114-Status: GOOD (  17.70  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 154 +++++++++++++++---------------
 1 file changed, 78 insertions(+), 76 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 3c3b9d8d3681c64c21927615e1bb49f157f156b5..0f155a685bbae774129aa55b83865e546314e81c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -4,6 +4,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
@@ -90,7 +91,7 @@ struct debounce_time {
 };
 
 struct npcm8xx_gpio {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	void __iomem		*base;
 	struct debounce_time	debounce;
 	int			irqbase;
@@ -115,24 +116,20 @@ struct npcm8xx_pinctrl {
 };
 
 /* GPIO handling in the pinctrl driver */
-static void npcm_gpio_set(struct gpio_chip *gc, void __iomem *reg,
+static void npcm_gpio_set(struct gpio_generic_chip *chip, void __iomem *reg,
 			  unsigned int pinmask)
 {
-	unsigned long flags;
+	guard(gpio_generic_lock_irqsave)(chip);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 	iowrite32(ioread32(reg) | pinmask, reg);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
-static void npcm_gpio_clr(struct gpio_chip *gc, void __iomem *reg,
+static void npcm_gpio_clr(struct gpio_generic_chip *chip, void __iomem *reg,
 			  unsigned int pinmask)
 {
-	unsigned long flags;
+	guard(gpio_generic_lock_irqsave)(chip);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 	iowrite32(ioread32(reg) & ~pinmask, reg);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
@@ -233,32 +230,32 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_EVBE, gpio);
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_EVBE, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_EVBE, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_EVBE, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_EVBE, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_POL, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_EVBE, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_POL, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_POL, gpio);
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	if (type & IRQ_TYPE_LEVEL_MASK) {
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_EVTYP, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_level_irq);
 	} else if (type & IRQ_TYPE_EDGE_BOTH) {
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_EVTYP, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_edge_irq);
 	}
 
@@ -1842,7 +1839,7 @@ static void npcm8xx_setfunc(struct regmap *gcr_regmap, const unsigned int *pin,
 static int npcm8xx_get_slew_rate(struct npcm8xx_gpio *bank,
 				 struct regmap *gcr_regmap, unsigned int pin)
 {
-	int gpio = pin % bank->gc.ngpio;
+	int gpio = pin % bank->chip.gc.ngpio;
 	unsigned long pinmask = BIT(gpio);
 	u32 val;
 
@@ -1862,15 +1859,15 @@ static int npcm8xx_set_slew_rate(struct npcm8xx_gpio *bank,
 				 int arg)
 {
 	void __iomem *OSRC_Offset = bank->base + NPCM8XX_GP_N_OSRC;
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 
 	if (pincfg[pin].flag & SLEW) {
 		switch (arg) {
 		case 0:
-			npcm_gpio_clr(&bank->gc, OSRC_Offset, gpio);
+			npcm_gpio_clr(&bank->chip, OSRC_Offset, gpio);
 			return 0;
 		case 1:
-			npcm_gpio_set(&bank->gc, OSRC_Offset, gpio);
+			npcm_gpio_set(&bank->chip, OSRC_Offset, gpio);
 			return 0;
 		default:
 			return -EINVAL;
@@ -1902,7 +1899,7 @@ static int npcm8xx_get_drive_strength(struct pinctrl_dev *pctldev,
 	struct npcm8xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
 	struct npcm8xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
-	int gpio = pin % bank->gc.ngpio;
+	int gpio = pin % bank->chip.gc.ngpio;
 	unsigned long pinmask = BIT(gpio);
 	int flg, val;
 	u32 ds = 0;
@@ -1913,7 +1910,7 @@ static int npcm8xx_get_drive_strength(struct pinctrl_dev *pctldev,
 
 	val = ioread32(bank->base + NPCM8XX_GP_N_ODSC) & pinmask;
 	ds = val ? DSHI(flg) : DSLO(flg);
-	dev_dbg(bank->gc.parent, "pin %d strength %d = %d\n", pin, val, ds);
+	dev_dbg(bank->chip.gc.parent, "pin %d strength %d = %d\n", pin, val, ds);
 
 	return ds;
 }
@@ -1923,15 +1920,15 @@ static int npcm8xx_set_drive_strength(struct npcm8xx_pinctrl *npcm,
 {
 	struct npcm8xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 	int v;
 
 	v = pincfg[pin].flag & DRIVE_STRENGTH_MASK;
 
 	if (DSLO(v) == nval)
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_ODSC, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_ODSC, gpio);
 	else if (DSHI(v) == nval)
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_ODSC, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_ODSC, gpio);
 	else
 		return -ENOTSUPP;
 
@@ -2054,7 +2051,7 @@ static int npcm_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct npcm8xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
 	struct npcm8xx_gpio *bank =
 		&npcm->gpio_bank[offset / NPCM8XX_GPIO_PER_BANK];
-	int gpio = BIT(offset % bank->gc.ngpio);
+	int gpio = BIT(offset % bank->chip.gc.ngpio);
 
 	if (input)
 		iowrite32(gpio, bank->base + NPCM8XX_GP_N_OEC);
@@ -2085,7 +2082,7 @@ static int debounce_timing_setting(struct npcm8xx_gpio *bank, u32 gpio,
 		if (bank->debounce.set_val[i]) {
 			if (bank->debounce.nanosec_val[i] == nanosecs) {
 				debounce_select = i << gpio_debounce;
-				npcm_gpio_set(&bank->gc, DBNCS_offset,
+				npcm_gpio_set(&bank->chip, DBNCS_offset,
 					      debounce_select);
 				break;
 			}
@@ -2093,7 +2090,7 @@ static int debounce_timing_setting(struct npcm8xx_gpio *bank, u32 gpio,
 			bank->debounce.set_val[i] = true;
 			bank->debounce.nanosec_val[i] = nanosecs;
 			debounce_select = i << gpio_debounce;
-			npcm_gpio_set(&bank->gc, DBNCS_offset, debounce_select);
+			npcm_gpio_set(&bank->chip, DBNCS_offset, debounce_select);
 			switch (nanosecs) {
 			case 1 ... 1040:
 				iowrite32(0, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));
@@ -2145,21 +2142,21 @@ static int npcm_set_debounce(struct npcm8xx_pinctrl *npcm, unsigned int pin,
 {
 	struct npcm8xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 	int ret;
 
 	if (nanosecs) {
-		ret = debounce_timing_setting(bank, pin % bank->gc.ngpio,
+		ret = debounce_timing_setting(bank, pin % bank->chip.gc.ngpio,
 					      nanosecs);
 		if (ret)
 			dev_err(npcm->dev, "Pin %d, All four debounce timing values are used, please use one of exist debounce values\n", pin);
 		else
-			npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_DBNC,
+			npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_DBNC,
 				      gpio);
 		return ret;
 	}
 
-	npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_DBNC, gpio);
+	npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_DBNC, gpio);
 
 	return 0;
 }
@@ -2172,7 +2169,7 @@ static int npcm8xx_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	struct npcm8xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
 	struct npcm8xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
-	int gpio = pin % bank->gc.ngpio;
+	int gpio = pin % bank->chip.gc.ngpio;
 	unsigned long pinmask = BIT(gpio);
 	u32 ie, oe, pu, pd;
 	int rc = 0;
@@ -2235,34 +2232,34 @@ static int npcm8xx_config_set_one(struct npcm8xx_pinctrl *npcm,
 	struct npcm8xx_gpio *bank =
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
 	u32 arg = pinconf_to_config_argument(config);
-	int gpio = BIT(pin % bank->gc.ngpio);
+	int gpio = BIT(pin % bank->chip.gc.ngpio);
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_PU, gpio);
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_PD, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_PU, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_PD, gpio);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_PU, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_PD, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_PU, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_PD, gpio);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_PD, gpio);
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_PU, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_PD, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_PU, gpio);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 		iowrite32(gpio, bank->base + NPCM8XX_GP_N_OEC);
-		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
+		bank->direction_input(&bank->chip.gc, pin % bank->chip.gc.ngpio);
 		break;
 	case PIN_CONFIG_OUTPUT:
-		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
+		bank->direction_output(&bank->chip.gc, pin % bank->chip.gc.ngpio, arg);
 		iowrite32(gpio, bank->base + NPCM8XX_GP_N_OES);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_OTYP, gpio);
+		npcm_gpio_clr(&bank->chip, bank->base + NPCM8XX_GP_N_OTYP, gpio);
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_OTYP, gpio);
+		npcm_gpio_set(&bank->chip, bank->base + NPCM8XX_GP_N_OTYP, gpio);
 		break;
 	case PIN_CONFIG_INPUT_DEBOUNCE:
 		return npcm_set_debounce(npcm, pin, arg * 1000);
@@ -2313,13 +2310,14 @@ static int npcmgpio_add_pin_ranges(struct gpio_chip *chip)
 {
 	struct npcm8xx_gpio *bank = gpiochip_get_data(chip);
 
-	return gpiochip_add_pin_range(&bank->gc, dev_name(chip->parent),
-				      bank->pinctrl_id, bank->gc.base,
-				      bank->gc.ngpio);
+	return gpiochip_add_pin_range(&bank->chip.gc, dev_name(chip->parent),
+				      bank->pinctrl_id, bank->chip.gc.base,
+				      bank->chip.gc.ngpio);
 }
 
 static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 {
+	struct gpio_generic_chip_config config;
 	struct fwnode_reference_args args;
 	struct device *dev = pctrl->dev;
 	struct fwnode_handle *child;
@@ -2331,15 +2329,19 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return dev_err_probe(dev, -ENXIO, "fwnode_iomap id %d failed\n", id);
 
-		ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
-				 pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DIN,
-				 pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DOUT,
-				 NULL,
-				 NULL,
-				 pctrl->gpio_bank[id].base + NPCM8XX_GP_N_IEM,
-				 BGPIOF_READ_OUTPUT_REG_SET);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DIN,
+			.set = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DOUT,
+			.dirin = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_IEM,
+			.flags = BGPIOF_READ_OUTPUT_REG_SET,
+		};
+
+		ret = gpio_generic_chip_init(&pctrl->gpio_bank[id].chip, &config);
 		if (ret)
-			return dev_err_probe(dev, ret, "bgpio_init() failed\n");
+			return dev_err_probe(dev, ret,
+					     "failed to initialize the generic GPIO chip\n");
 
 		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &args);
 		if (ret < 0)
@@ -2353,26 +2355,26 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
 		pctrl->gpio_bank[id].irqbase = id * NPCM8XX_GPIO_PER_BANK;
 		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
-		pctrl->gpio_bank[id].gc.base = -1;
-		pctrl->gpio_bank[id].gc.ngpio = args.args[2];
-		pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
-		pctrl->gpio_bank[id].gc.parent = dev;
-		pctrl->gpio_bank[id].gc.fwnode = child;
-		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
-		if (pctrl->gpio_bank[id].gc.label == NULL)
+		pctrl->gpio_bank[id].chip.gc.base = -1;
+		pctrl->gpio_bank[id].chip.gc.ngpio = args.args[2];
+		pctrl->gpio_bank[id].chip.gc.owner = THIS_MODULE;
+		pctrl->gpio_bank[id].chip.gc.parent = dev;
+		pctrl->gpio_bank[id].chip.gc.fwnode = child;
+		pctrl->gpio_bank[id].chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (pctrl->gpio_bank[id].chip.gc.label == NULL)
 			return -ENOMEM;
 
-		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
-		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
-		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
-		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].gc.direction_output;
-		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
-		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
-		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-		pctrl->gpio_bank[id].gc.free = pinctrl_gpio_free;
+		pctrl->gpio_bank[id].chip.gc.dbg_show = npcmgpio_dbg_show;
+		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].chip.gc.direction_input;
+		pctrl->gpio_bank[id].chip.gc.direction_input = npcmgpio_direction_input;
+		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].chip.gc.direction_output;
+		pctrl->gpio_bank[id].chip.gc.direction_output = npcmgpio_direction_output;
+		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].chip.gc.request;
+		pctrl->gpio_bank[id].chip.gc.request = npcmgpio_gpio_request;
+		pctrl->gpio_bank[id].chip.gc.free = pinctrl_gpio_free;
 		for (i = 0 ; i < NPCM8XX_DEBOUNCE_MAX ; i++)
 			pctrl->gpio_bank[id].debounce.set_val[i] = false;
-		pctrl->gpio_bank[id].gc.add_pin_ranges = npcmgpio_add_pin_ranges;
+		pctrl->gpio_bank[id].chip.gc.add_pin_ranges = npcmgpio_add_pin_ranges;
 		id++;
 	}
 
@@ -2387,7 +2389,7 @@ static int npcm8xx_gpio_register(struct npcm8xx_pinctrl *pctrl)
 	for (id = 0 ; id < pctrl->bank_num ; id++) {
 		struct gpio_irq_chip *girq;
 
-		girq = &pctrl->gpio_bank[id].gc.irq;
+		girq = &pctrl->gpio_bank[id].chip.gc.irq;
 		girq->chip = &pctrl->gpio_bank[id].irq_chip;
 		girq->parent_handler = npcmgpio_irq_handler;
 		girq->num_parents = 1;
@@ -2401,7 +2403,7 @@ static int npcm8xx_gpio_register(struct npcm8xx_pinctrl *pctrl)
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		ret = devm_gpiochip_add_data(pctrl->dev,
-					     &pctrl->gpio_bank[id].gc,
+					     &pctrl->gpio_bank[id].chip.gc,
 					     &pctrl->gpio_bank[id]);
 		if (ret)
 			return dev_err_probe(pctrl->dev, ret, "Failed to add GPIO chip %u\n", id);

-- 
2.48.1


