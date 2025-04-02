Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD8C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJXyGFNl9SEsXCG7pRs0ciZjuv0V95H1dQUcXEiYOzY=; b=4wY1r6KrG2eENT89qYE1DsUE5u
	gbCeYiGio+zNh7vB5Drp7dFzsHoNqz+j1TYOLHoohAB52Fru1d9C0koYKRdc0EZQjf3UbKp52iEoM
	F2ErxJS8I5g2NBJQbqJQclsfjxveSrkanLEUMIHUk/u//W+J6Dod2qhUGgMmGYPrfWWDWs8nXoQaK
	9YqcuhzyI0A6nR46O8hJUD/B5GwmaMuJnqM5LITfAOqZXIs5DONm/9DII+fMiJyflSktnLvXcyyGK
	YwXD39c/DGvB38+okThqM3eokat8vVlZxzHOi48iBzGCFnTbxgCUMLpbeqG5eDFzBXUEr5Di1t7XI
	Zr1CDLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzzE-00000006Vss-2Ad1;
	Wed, 02 Apr 2025 15:26:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzqZ-00000006USy-2cXI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:17:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso633068f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607062; x=1744211862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJXyGFNl9SEsXCG7pRs0ciZjuv0V95H1dQUcXEiYOzY=;
        b=fod6NYawB6ayVQo916nQItqCAyZmFfJpCTDkcjn5D0PeI0T/KxnoQNHcP07GfAml+s
         3jJjgTh6rlgOIfNdqfSfXeVj0Ds8ECJKhPMQev0uSx+5Jtz4H8hShaQaPuhZODgBlY+9
         5VvJz8/LlB6hR0V3omM9MML0A2rHPjlGJDRttzJg/UVsjIbEhl0z+ObQjPVKJD7CP/j9
         xK2xcPLlF1FsAQMCtKwvgt1pXG722YEHapR0Hh1unwyKgKz1ACGWvhJlsAUKZvyOcnGh
         OUvjpQY3FzgyHoSLGJdUrgDBBzp15UHliL/t1QD8f3JSDRT4MbkQK7myneQQ1MnAxy5C
         jbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607062; x=1744211862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJXyGFNl9SEsXCG7pRs0ciZjuv0V95H1dQUcXEiYOzY=;
        b=SZun/egUSnvV+HJFXzBU2N3pR9NJqD+tZy6hp800EmrYilZyP0lCONyXt7K7I+xP3E
         XSG36NQEm4sKtYieSbVq7z9svEj1Mzas7fLCHAGTF/aiFjblvXGZJOkfooNOtEr+rfBl
         SbR7bba95/+A2cu8F/qjY2J4W5jO5wFz4B+e/54dMmMi7H/DuSDxUS7oxaXKkzA4CM1J
         1Kqum/Bw5NFcwkqSuylYNaTEAveSkChyCseN2JX1FGqnIlrYyEZ3zf2UgqJ2dQ0/AOqg
         ++JvruDJ1zsGU2eOz5az+beK/g8ldz3RKcv/T+4agLFpeANYsH/nb3fIUSnVoJGgAbk4
         ddtw==
X-Gm-Message-State: AOJu0YwWYhbHA5INl4xvMGzu9tSS1gBJoDLHkr19RBbh77md3O8x+/hb
	RUTvSLYT40CqX1CLBUgUbVwoNqPVLHlCQtFXfN8pCUFGdFzyMr7MgQiAUDELxDk=
X-Gm-Gg: ASbGncvm9fnZioniOhNlJj2zDaQNdpNDfmmn+6WoFBcfqriIiCugFbTA0V+B/SB2gxk
	NN7ejkctvuPrRSTZnLrRPaTvcLWmWwtzzbldZrPdRcEkiLAuA4eFEG2HWyaqbFWj9avktdvcwp7
	M3+0vofmx58irDmNqfiqoh9cw5aKV1qADmHgxXL9aqnllKDqyNGSPJOxf6759l08sNjrb70GYll
	Nj6GMq9jxdgX9b6asGO/5kEYGNdFCLvVp1aBJ9FX3uBoD1L98bg2qO5MvZmHOY3272KSY0KBOQU
	7QHzQ9t8Ve/7SkHxL5O3Bkhl5IEGYC4sBP+KxJXJQm6eCH31Nl4/Uqr2eOKiRcPWglMKI9+SlNz
	FT5vHgDJb
X-Google-Smtp-Source: AGHT+IGXFitwfRwQw8LcY87uDeDOkdepFnFOIZQ0PmBBCKyFhe/uyPZiGsOkZ5b44Pxx5/sBXlJP6g==
X-Received: by 2002:a5d:6d88:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-39c2a6a3e06mr2274333f8f.22.1743607061958;
        Wed, 02 Apr 2025 08:17:41 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:41 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:32 +0100
Subject: [PATCH v6 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-3-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7439;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+vRNL7JjGCNtmJAbIRr10U3zF2K/nXrIo0wzFSbSVGQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUPlcQ6xH1bRCUPq2XjXcbjl07iHX8ZEn0Xt
 nUnMLNbmP2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDwAKCRDO6LjWAjRy
 uoo4EACS3wlPtSC+5jM+PNGrsaSxnHM/kS7RXO4f/aScP2JCK3jHkFsgH6li8eDpPtB1EQVHSr/
 sVx50HGvnfdVIOCT6YRtZ3U9wVD7XNAxv8TTw1bAY5oHMWP4lAc3HVOSqhiYJW+svlMFOz9vh1i
 7ysTZDh4MSoidu4IYVNtRhhsYhFD81jAWTSu6MTItdSgpcnq+xRCBRUUkBDHkqHrcmtk4QFoYD6
 SPDD/tFjI/E/tx/vRFKB5/F3xu6LM2pbzhDRhht9Z/JMLJ7fUbgPv6ZS9SInt0eZwgB6U22GLsU
 m7HxboSktZenp6KAKXxU9SAD4uTcq/9TVqzS5Fx1bS7BLoPGYqLoF0EDBPPXllXpuzQSA6AgnOB
 TNHnQNKd4q8gsqETj0KNB5r7A//kPufzaP4wchUQXGsKrkw7BTgWEqb1vEtZAklJtEDDWRBctOq
 4Dvhl5VpUw502xbZFt+5KGQ6mc3IL0i7vk5keRp8MHy5my6ei0LUiWL6qR/EnZ5GeNcQKuNl8do
 Pq1vBnoFiPB4pTckWY3wZqzRpMWZ0rYkA6TkUmWfzNjPuQOPySll9qS+j2hPbuEQxUZzVHysecQ
 Jwv41rr4UIbgvcY1LY3UIqgqVpxscwjxixUYIPcG98wwaUNa6Fc9Ry9DoumKSIH+3xVc3woA8Km
 SwdAmRANnD9s+fQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081743_671016_1CA2AD52 
X-CRM114-Status: GOOD (  17.02  )
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

gs101 differs to other SoCs in that fltcon1 register doesn't
always exist. Additionally the offset of fltcon0 is not fixed
and needs to use the newly added eint_fltcon_offset variable.

Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org  # depends on the previous three patches
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v2:
* make it clear exynos_set_wakeup(bank) is conditional on bank type (Andre)
* align style where the '+' is placed (Andre)
* remove unnecessary braces (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 71 ++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  2 +
 3 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 4b5d4e436a337ff13dee6ef740a1500eaf86cc12..9fd894729a7b87c3e144ff90921a1cadbde93d3d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1762,15 +1762,15 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
 		.eint_wkup_init = exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
 		.pin_banks	= gs101_pin_gsacore,
@@ -1784,29 +1784,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.pin_banks	= gs101_pin_peric0,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (PERIC1) */
 		.pin_banks	= gs101_pin_peric1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume	= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI1) */
 		.pin_banks	= gs101_pin_hsi1,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	}, {
 		/* pin banks of gs101 pin-controller (HSI2) */
 		.pin_banks	= gs101_pin_hsi2,
 		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
 		.eint_gpio_init = exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 18c327f7e313355c4aba72f49a79b1697244f1ba..0879684338c772e484174a94ac2c274cc7d932ed 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -800,6 +800,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + bank->eint_fltcon_offset);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			save->eint_fltcon1 = readl(regs +
+						EXYNOS_GPIO_EFLTCON_OFFSET
+						+ bank->eint_fltcon_offset + 4);
+
+		save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+					+ bank->eint_offset);
+
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save fltcon0 %#010x\n",
+			 bank->name, save->eint_fltcon0);
+		if (bank->nr_pins > 4)
+			pr_debug("%s: save fltcon1 %#010x\n",
+				 bank->name, save->eint_fltcon1);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_set_wakeup(bank);
+	}
+}
+
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
@@ -819,6 +854,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+
+	void __iomem *regs = bank->eint_base;
+	void __iomem *eint_fltcfg0 = regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		     + bank->eint_fltcon_offset;
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
+			       + bank->eint_offset), save->eint_con);
+
+		pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
+			 readl(eint_fltcfg0), save->eint_fltcon0);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
+
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->irq_chip->eint_mask
+			       + bank->eint_offset), save->eint_mask);
+
+		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
+		       + bank->eint_offset);
+		writel(save->eint_fltcon0, eint_fltcfg0);
+
+		if (bank->nr_pins > 4)
+			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
+		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+		       + bank->eint_offset);
+	}
+}
+
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 3a771862b4b1762b32f9e067b011e80cfebb99d2..2bee52b61b9317ff79c618c1dc53e98242805087 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -244,6 +244,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);

-- 
2.49.0.504.g3bcea36a83-goog


