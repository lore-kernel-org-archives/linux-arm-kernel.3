Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EDDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1NBXJidkBGm2njw6LIa5Omst8pPNRb+XaVquPbX31s=; b=IPz897wrycZzo/LVWkcNdPCOKP
	A+ef1GK6PXZMhVH+WSDJMWJAgXAHGxkTr7IviANEZMLqhJlhMNP/opk/mq65EoQB5KUvOfQ6ED5v6
	aYtGNygZvPHUHzTymn98IkGlAUhY6ZOiOYogYWGaxhcGlE9rqonODqJwQ+PgFFQcJ4M9CxE14tYUJ
	fUcpw6stNwzO6nP0zVoBP5+k7//wzcLZ+AcJzfgaPmdCdwd33wohQJRItbewV1DYfwTltdm6x6xgd
	gizF6WfGM8tjEiT0XcvOZErP7ssLwfNrGMxZ2qLOIlvaKkRBLgNybS/LMN5XelIcSM54qFmVQgZ8T
	+a7RSTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toLNe-0000000Ds8q-0Y1A;
	Sat, 01 Mar 2025 11:51:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toLG3-0000000DrKA-3JGH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 11:43:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-390dd362848so2299799f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 03:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740829430; x=1741434230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1NBXJidkBGm2njw6LIa5Omst8pPNRb+XaVquPbX31s=;
        b=PKqpkrFvsQeenwfaZl2amtBOa7QT2VKMt9AVSc9i23Cda8phL4D8UNKugrAg3OwFVl
         8cQSXQQnHF/8OIIWJRTUBf/Z/nm9dFX8/7e3A3O5GNrSod44Fjvug2NQ2eI6dt3i6KKt
         qoD4v8/YfgB29gh6nwjywQCdAGuF0PDVqQ6XgUBpDk3W/vKbYYWyxnAGXbeaTtYeErJS
         MsvVHOtE+76MagjlNnjPE+sN9y8FljVNP79TlaSoL8R5PjKc6rsOpZ3M1LTC3J3ZGHv7
         Gfw5ejwfUtG1FG4/gp6Zz8yqzvKhx+67hukdiejufnfhCyKEUx4wp7QHhA1wiNzIq6dW
         u0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829430; x=1741434230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1NBXJidkBGm2njw6LIa5Omst8pPNRb+XaVquPbX31s=;
        b=f2ZOqOZlD8nf59pWPSHQOOJfvNPFm30PCy7RlkXWaMLtya93BRbJZhaOXxMj9MbIVQ
         DLpj4DK8uA89GbUz11I9AprwFn7z0h1eeHLaShyE0xir8+g6Tf8LtouDF73cyc/VAf6C
         +IeAK95jYv12tW3jk6k62gScqtaqKJJxAblihRhkJJLZn9De8VvzT/AZvAq7K33bbYlX
         I64crHxNiMC4lIfk/sdmvmoMBfsAChyIj5sqFhEUueMomNkDLD+OFKVsGhTLRF+CHf3K
         X4vI6T09ykztYzxBEcc8vtcYX19GG0rksV0ev7DQ1tgR5/R4oaO0mEEsoIafOUCSIcKU
         Qn2g==
X-Gm-Message-State: AOJu0YxnOgneVYSZ+7HPbVB+clmVCewiJkJLLt+hyLpl1fW+cVVHIxF3
	MCx/oTOdkENuk+k8TA6ptg5Ynu/PeDbEmpNN0MDesSy8JU4ebBXBCJxS0CyjNak=
X-Gm-Gg: ASbGnctW1vC4/6zTws1HjxyzcI90SSqx+TXXWGZZGKFfXHUX3xlxMe6GW4GsxY0J/KN
	uzXx1FKu+8V7mUDSwIkNsIKgsDsVePIoJiZE8es0INhXI/4wsrc+G1WqIiB/+uhztLPPA79HG4k
	m8OnkshVMFJBl4hSZm5mYrZjrNrOHftgqDRbQ7PCyAvNQgzg+HUfnYXvoJ3MdwW/lV+J+YGW/eu
	C00CwTV37XSItOkFl0cXxYGjDkf5c/1W3sl0lzyUVCzlMy8YezRllotrbNEQYMO04VXvAvB2p++
	NU+dEhejWgx5VmtOgCyBNUUsnfF6QflAZ6Og25Z7CffVMICp4wgom/lVnyKYPSG1ihV37aKzcrg
	=
X-Google-Smtp-Source: AGHT+IHbf3C2cKV5VNg4w9HYYGVhTfvb8MGb89lf6+MR83bDnKCZPqk6aJ4AsegYvjQ6Ya45+DM4ng==
X-Received: by 2002:a5d:5f84:0:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-390eca52f6dmr6773296f8f.35.1740829430126;
        Sat, 01 Mar 2025 03:43:50 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm8002871f8f.20.2025.03.01.03.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 03:43:49 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 01 Mar 2025 11:43:22 +0000
Subject: [PATCH v2 4/4] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-pinctrl-fltcon-suspend-v2-4-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Rt0hCQ7EEJnbniMu4u2x1+6fzo/ekNqUHhKZTA6KCkg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnwvLtplYOMeVA4pMszyl6HNpGhtya0aSaJnCsl
 /qHoc0BlXOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8Ly7QAKCRDO6LjWAjRy
 uixWD/9u2iwpTaNDJxSTN50ZLujwgyWgslkzSejWqwBjDft55EN4595kqD1TFeOIenIOoGqK51n
 tcdr7yg+h7irFTgUXFOr6ciSFZmucDgRDxvRC74L1Gl9z1DYbfbmk608rdzn3tbvCOe5wbvGSWu
 mTNnsxkwgzHDIe4+zy7o7jgNW72eEjnMteahdc253vhmM1g/xF/mBSJLPKARTe9+Pg7b86CnaLp
 g3C+uvdvYJtsOrb7V7E3AVKuHgCJXHBatFuGjMpoD6BA1dgU7O6AoHe+wgbciydXJ2gGJSTcVWk
 SMqJoh3T3wcz+mrlqY0iTIer0uhN1GzYFzSXK7vXBDxqCYj0XY6m6+exigoPyXv8+IXrqCGUUfI
 KqFxz4l/qPWo/NnE0KO2WRP1BwyPt9JjSaoiPDl/pn/MkOp0+UNFoFm+uwhWO/6ufF1XlLTi+sa
 w3sKkJ2iyTxviny/mtNkBiswLKBrqtx9Ls+sVx4VMBjBhZyExRvA8t+TpdNhhYpJR5fyJ3Avxhm
 U53AWqIB81ARuYMPHRcw9oJvZtq01IUMQqbgBD9hyoxmeue8IcwfKZ/vDLgB1SmKBIIqNps8YCI
 H6U9qhYmLHXJltgVLLB7QolHluLplzav2oDYi+vjf1cpvDiuvz0t+NyqYiVlyaz8lXAuvQreqPz
 oIwT/UOlTgz1BAg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_034351_833559_B2A98D18 
X-CRM114-Status: GOOD (  20.17  )
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

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

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
 drivers/pinctrl/samsung/pinctrl-exynos.c | 35 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h | 21 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ddc7245ec2e5..4c467651b034 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -369,6 +369,39 @@ struct exynos_eint_gpio_save {
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
+	if (bank->eint_type != EINT_TYPE_WKUP)
+		return;
+
+	for (int n = 0; n < bank->nr_pins; n += 4)
+		exynos_eint_update_flt_reg(reg + n,
+					   min(bank->nr_pins - n, 4), con);
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -834,6 +867,7 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
 		pr_debug("%s: save    mask %#010x\n",
 			 bank->name, save->eint_mask);
 	}
+	exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);
 }
 
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
@@ -889,6 +923,7 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
 		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 		       + bank->eint_offset);
 	}
+	exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
 }
 
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 773f161a82a3..203d4b76a956 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -52,6 +52,27 @@
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
+#define EXYNOS_FLTCON_MASK		GENMASK(7, 0)
+#define EXYNOS_FLTCON_LEN		8
+
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
 		.type		= &bank_type_off,	\

-- 
2.48.1.711.g2feabab25a-goog


