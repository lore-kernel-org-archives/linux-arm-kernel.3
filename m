Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B0FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpHtfXZMtovgp9ILU8zfEF7HMKzE1ti5rdjRAjVazZg=; b=WPMSPEsb/akUWSwoeBspuK8KHF
	24b2+hHJ4mC4FMLYcWMbJ5hyBh9v3fWqgawxb34Rz3PejkF36uozcQqhUeAna6mPKIASgXcDAmU2O
	MFlCxx3iYB+c8u/dCuHCGQ9wwx5+ScRplu8jL5oZLAsvLGTBFtWdgGqGQVDe67flrEqHeA71CIEPN
	Acf6A+HD22QfAYwU/C6vOsEmx5YwZKvOZIKvrtJdUTJo/IfXlJkdUCDIryjDB0EwEOlo38NYNiIJU
	YL1jNW1sOa8YXcsqn6nvh0BSzjY2eDDiVdOSbhEd/Z2r8/9JjLRmo59gwRF91gRFQ7g51pNlBawsm
	E342hqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV5K-0000000Du83-1Sfx;
	Fri, 07 Mar 2025 10:37:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUxP-0000000DsOT-1rpI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:29:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f403edb4eso915483f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741343370; x=1741948170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpHtfXZMtovgp9ILU8zfEF7HMKzE1ti5rdjRAjVazZg=;
        b=iiyewD5F3ykH5vYk5DF64gkDG9+1/G0nbh9i8EeGdxqDzBGPbjpMLnb9NTpJnXA6hw
         FPLa5HLfjVUvrZe4wcSLTxyKcJmdlMiIp8zV7Ou9c3X1mCX452v1ir6mPJ2ZxiUOWfw6
         ziS1ZXiccIDOKo7J3+zpG3NdPW73SWs4hh127qt1f/oxXzLTs2wVifqmGbETC5DR4aBV
         FBNFYjGaCF/u1yRxG5sxAbkIW6g+ysweS13ZYx75Il87TtR60jQL3aSL4kOPouRUBExU
         1Zn8KAj2vk74ZgGa7dKFZdCkNW8/VeBy1huHPTnbphIdpgnhBIMIJZh34T05R77Bz+gN
         tuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741343370; x=1741948170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpHtfXZMtovgp9ILU8zfEF7HMKzE1ti5rdjRAjVazZg=;
        b=tpzPeiyOHPTvD2E4btmTn4IC5EgXwloAm+MwkM25EaHniurongZxJhh3PWAPkFHjE/
         0Rce6XIVBrkAqisxev6sEkXfrnVqqc+jbq3MT2Dg7MCETOJhYUzoQmK4b1i1dn8HZ48V
         2LYbIaoX2pWxb8MyvwuvB8asubj/UREdNeyGlQvcEABvMI9e8unL8IMpsvRJVFoqVtsJ
         SBg3wA6S5cCdCTDJjAcgccnyGKZrpZyL0V+shJMYvaA4poywk9PK2Ecf6fbmcI2rwAv9
         StbN17FHFS5myLeZueTZ8h/jWX6GrhbYN9ndH9RIG7QORPlzNuBUUZlB/tY7lXy3y6s4
         KDkg==
X-Gm-Message-State: AOJu0YwsY3zTFK1FL9ZvtsOYEFmK4Wc0Gtpa30HZL2H2MhrT8ETbziCH
	nG+bATlIoGnyeLILd/0aXc4GJIl5Xcd5UgN1yeNZ4ZBC+dU9MrC0ahyJhMiG5RM=
X-Gm-Gg: ASbGncsI8SDhohTk3anmfGqYjwau05yq+1EUBfy/1RYzL9LszhaG0evzHWYJu4T9Qo8
	aQdumhNVvUOOhN9VuhQp/vmNBsZb0Z3ZzyvsWNi5FbCR25el5a3hS/x5+0mWNuR4SKZjDgqu7HZ
	k4XImVgEKLCDcKRur2xZBYD7iOou/MdrDiPNaP0mjJSWTMHAS+pVJLjjQtUhQQ1Ec13UFUE+GFR
	MIRlF+ybWAC8NPz2/DkKRCrQ/CHQTOD8goffSG5Qi3DSgF3N3+0EW9KQJKLYr+bBnWqbhYOQRh1
	I9lNmGFki7BZEjPhZw67BLi00o1yK/Gh6a1djmjaOMp++u8JIVlAxP6vtbkrEC3fQ3SezzZtQ8E
	=
X-Google-Smtp-Source: AGHT+IELqpVmd0fvvLrbeGlBslX14EFMXRP9VSs8vnkHH4WGNHv+xxIo63qhgA6uSenseZlnpH1JeQ==
X-Received: by 2002:a05:6000:4112:b0:391:d52:d042 with SMTP id ffacd0b85a97d-39132d883f3mr1316285f8f.32.1741343369573;
        Fri, 07 Mar 2025 02:29:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm49192955e9.4.2025.03.07.02.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:29:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 07 Mar 2025 10:29:08 +0000
Subject: [PATCH v4 4/4] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250307-pinctrl-fltcon-suspend-v4-4-2d775e486036@linaro.org>
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
In-Reply-To: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5749;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=0g0PL41FvwddA+yzjOccP1eOi8+XeiX+2I7QmRbycHw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnysqBWYKPT3JlFe3EPL9ZQ4Cxe9Oo6QkFzQ3J3
 g/okGUam0KJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8rKgQAKCRDO6LjWAjRy
 utzhD/9SPJA0sK/S5QY+aQ2jbKWzDSNcZLzygXB/AH06vQGgCdMyqqV4uA5fnVT/7UQvweoR8jx
 TwEWWZEPyFhTyVinHXgBNc674T4NE1hHF5KYtVgU7GYV+j+Fpm3PfbJPKvvHzHncNmvE+l654Nu
 YqdVf8q3Y8+gMPqtL+C+tR/9sLO471lzqCm3qXZO95ZFSFXz9XMjCBOcAI3wS4rHq/2ydG94tZw
 02PGCPpj1gHbSOEKlwQ84OVEC8aVsWKpbF+b1Jrz1Hhd+4lpxb0SC0CbZPFFRWM38iNUFj9rihp
 d0HjNZ789nCTQR58nAAYndk62BVkK/YNKBTRDeNVl1h4IBQvFTRTP/QJjRPmWA5fUz6NpgFwmLY
 XYj0h4xhtHsNtS+6+UBwtDzyEv8ZwzT6zcxkNzTlDKqqThUcQ3sgp9cBdP1EevUWAqhj48mog4w
 3RalHQj7D5sedV0N9l1tOzwF+hW63cdSwegrbCWleLUy+ATb3W3opbrTbpquFExfx2XTYC/9QDr
 9eHpuqsNZGx4X+GnM9VMqiRWbRf8MiB/NV64I9BNzx1b6mg4LV7FuyP8+5la26T58ddcAhoLeq5
 3IvWYWer8IQ6sECPJTX6FznWnZ0eRq+8ZvOYiW0IbEkaCcnPxNhQXG2oRgAM58nFtMaop1qDPWH
 OyUnDN56Ht4kWOA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_022931_488373_C93FCA58 
X-CRM114-Status: GOOD (  21.34  )
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

Newer Exynos based SoCs have a filter selection bitfield in the filter
configuration registers on alive bank pins. This allows the selection of
a digital or analog delay filter for each pin. Add support for selecting
and enabling the filter.

On suspend we set the analog filter to all pins in the bank (as the
digital filter relies on a clock). On resume the digital filter is
reapplied to all pins in the bank. The digital filter is working via
a clock and has an adjustable filter delay flt_width bitfield, whereas
the analog filter uses a fixed delay.

The filter determines to what extent signal fluctuations received through
the pad are considered glitches.

The code path can be exercised using
echo mem > /sys/power/state
And then wake the device using a eint gpio

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes since v2:
* Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
* Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)

Changes since v1:
* Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
* Move filter config comment to header (Andre)
* Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
* Remove misleading old comment (Andre)
* Refactor exynos_eint_update_flt_reg() into a loop (Andre)

Note: this patch was previously sent as part of the initial gs101/ Pixel 6
series and was dropped in v6. This new version incorporates the review
feedback from Sam Protsenko here in v5.

Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8

Changes since previous version
* Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
* Refactor and add exynos_eint_update_flt_reg() (Sam)
* Rename function to exynos_eint_set_filter() for easier readability (Sam)
* Remove comments and `if bank->fltcon_type != FLT_DEFAULT)` checks and indentation (Sam)
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 37 +++++++++++++++++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h | 20 +++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 5f0045d03346600557fa6735bad709897c71935c..1d2a4f4b825fce4be3f3d337145f2a4128315f0b 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -369,6 +369,37 @@ struct exynos_eint_gpio_save {
 	u32 eint_mask;
 };
 
+static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int con)
+{
+	unsigned int val, shift;
+	int i;
+
+	val = readl(reg);
+	for (i = 0; i < cnt; i++) {
+		shift = i * EXYNOS_FLTCON_LEN;
+		val &= ~(EXYNOS_FLTCON_DIGITAL << shift);
+		val |= con << shift;
+	}
+	writel(val, reg);
+}
+
+/*
+ * Set the desired filter (digital or analog delay) and enable it to
+ * every pin in the bank. Note the filter selection bitfield is only
+ * found on alive banks. The filter determines to what extent signal
+ * fluctuations received through the pad are considered glitches.
+ */
+static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int filter)
+{
+	unsigned int off = EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_offset;
+	void __iomem *reg = bank->drvdata->virt_base + off;
+	unsigned int con = EXYNOS_FLTCON_EN | filter;
+
+	for (int n = 0; n < bank->nr_pins; n += 4)
+		exynos_eint_update_flt_reg(reg + n,
+					   min(bank->nr_pins - n, 4), con);
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -828,8 +859,10 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 				 bank->name, save->eint_fltcon1);
 		pr_debug("%s: save    mask %#010x\n",
 			 bank->name, save->eint_mask);
-	} else if (bank->eint_type == EINT_TYPE_WKUP)
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
 		exynos_set_wakeup(bank);
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
+	}
 }
 
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
@@ -883,6 +916,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 773f161a82a38cbaad05fcbc09a936300f5c7595..66acbd08d3445ca6ee7358d3c4a6cb2be5d82842 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -52,6 +52,26 @@
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
 
+/*
+ * EINT filter configuration register (on alive banks) has
+ * the following layout.
+ *
+ * BitfieldName[PinNum][Bit:Bit]
+ * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
+ * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
+ * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
+ * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
+ *
+ * FLT_EN	0x0 = Disable, 0x1=Enable
+ * FLT_SEL	0x0 = Analog delay filter, 0x1 Digital filter (clock count)
+ * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
+ */
+
+#define EXYNOS_FLTCON_EN		BIT(7)
+#define EXYNOS_FLTCON_DIGITAL		BIT(6)
+#define EXYNOS_FLTCON_ANALOG		(0 << 6)
+#define EXYNOS_FLTCON_LEN		8
+
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
 		.type		= &bank_type_off,	\

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


