Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F23EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxLdyU5xLA0l8ZLb1APWpUpQHCVn0xb1VkCSknV6KMc=; b=YhyBoduuuTIfXt8W8Ja7ge+Pfr
	mVYfcmar8JqTxQ4CVIRc+fm3QWWw6+Qvo2L3E4raSYjmNt6pYxuT9WRwMThrUCf6WjvivV1avMqjm
	VctUQBjse32HCVSoyFYd08K0y56FGStxoBRmqAqPagi2oRh9ZuM6g8WXY9CE82mpGjRop1oY4GzPw
	fGZx74fFiCN+XG6C6y7UIKP3Zb4Tsxmu1rKaKXOKfCLEttj2MGSLw9SzxnA5oZtG2nGEK6iTOSEbY
	lBvzD5yzvwSkeewODI8eGZdetAimU81yRwB5BVp5DTNwg3zea5i8Ib8p6MQrl7QzS4dzFCbiK3M/e
	T5vAk6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqICa-0000000CAaC-1KVY;
	Thu, 06 Mar 2025 20:52:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI3g-0000000C9B0-2yre
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:43:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43690d4605dso7339885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 12:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293787; x=1741898587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxLdyU5xLA0l8ZLb1APWpUpQHCVn0xb1VkCSknV6KMc=;
        b=dBJBiWzA627ExN2x8yDtXIkWvGz1PjtCiVU1VziWyiszrUlhjO3ydP3WF0NBwU5ya7
         GxlYvFfUN1t1pEpmCSF3BQiYyYlSZm614XEQRIbPeKBXvjlTCvSf25dmgwLVLU53tiwu
         TpuZnPb/eWhrJy5BnHNmAlzuHFt40gVipr46nDqcnKPt8SUqdL4Ub+woI+fMPflXt8sb
         aeg5y7VzWMTcD3mqBgj3OQE2Tj/mY7FcmIhMMdtToKXicmcagLQ6Ste4OLsWN+hBg+mX
         SknhhQSzxMtMukCm+Ry8MmOdHR7u5kSH6xDfbEmoxHi5mPrI4Nxs1Xj4Wk52wh9ZrHls
         IDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293787; x=1741898587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxLdyU5xLA0l8ZLb1APWpUpQHCVn0xb1VkCSknV6KMc=;
        b=wSRDvfVWiBdWz3Zu6kyzqsEKXM3C/ejlNql3uCl2NReGC2NZvNEd+HlQEcwxuTGTU/
         orV6GKcxWhhvf16gLKbScpvyv/2XibkPDbfX2MAZzH8ospwilOZVuAGaJWFwIZSkgIre
         BD2+vrgasvkhjo2/X1nNWoUDE6B8ldIo/i50SriBB3lBqZuJvh3PhcvnPqt1knEriz5D
         lL5dM0ETZ/6GcF/0WiDmtG76/pNllkxu9tjvkpD2TmtCyEYnGF1oXLYc3p+g/w1k6lpq
         Ar8TgELXKywfCw8Wr9LxQAwMM59ugF04lJsv0SN1RCwKcgmjDTw9+uuwbJwCmYRldTQb
         wQVw==
X-Gm-Message-State: AOJu0YxVU34kr2z/qkrFuD5uEonXAesr3cOUFrVeamyGBWowC7bZox+n
	cm4fedGH/NFD0JRhV9EuaeTw9z1VF1Wzw+9ULNFu4JkR+49BaNoRvD/TjBxTE6g=
X-Gm-Gg: ASbGncsa0i6cIPrxqFvA86Wj0D6vME20dPew9HxkJRkpA/eqjpTfuOurvBYd+j3t7lV
	h0nsr5IybQBfxzy+SNnzJyPpEq5+c/BPwy6PN+xCys3wikhmMUCddL/Wc/jCNBc0HKQ1cHAC1RK
	7xGbTaEuQ8Mt4LxkholCT6uJZxeqiiiBxUB+xn1NlKIYAIgn6/ilqUW7gHaoVPpuBJpbgsWO9yE
	0+27b7OGOO54NEAQT7c9utuIx/BrMHyIxOwLY/XWP6E/3Cpd3BM6PKoev8XS+b4TAnU31WZrzy9
	h9L9GE04O/gEQQPuCCXTB7Aeaonf2aOJ9f1B3AGnl4jHMiDhOqzAdmEvaBx+pWfmQ4tzNKWvAEI
	=
X-Google-Smtp-Source: AGHT+IH98Yy4XpGZ3iFL/yc88/Vd0u6qTJdcdq7H0Fudor0UsWPApYHhC7lFeOykmBLoYFNgZvM27Q==
X-Received: by 2002:a05:600c:198b:b0:439:b7e3:ce56 with SMTP id 5b1f17b1804b1-43c687027f5mr6517265e9.29.1741293787173;
        Thu, 06 Mar 2025 12:43:07 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:06 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 06 Mar 2025 20:42:37 +0000
Subject: [PATCH v3 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7387;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=OOOqe0Ly4Iczxs4BjPyBWwEmra4AzhJ6AleNF6mmhiM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjSWndMrJynxLbm7vZqCmsxhBbi5E7irLMwQ
 Yj/4xbDU7+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oI0gAKCRDO6LjWAjRy
 upeID/9Oxax6mOIhXOJZd9AnETnx6O5VKzbSrXK8a0U8K40Dw2PkkjMfcp2xA3WYl1VpeO7QJNl
 JwDYVSJ7t3UrBJJyYg8ArSW7AbLzAeB1TnNRLWfDwBdylbs+bHHQS2uFXkgYvULzQlAS761sv6c
 BDNy1Covy9gir5OL05aMdWO7W+xoP6nqRUZ0Fe90Iet1JNyMJtV7p5Tw1WsYdFWT88HvrcjF7/k
 EZgCrQUTRbgNHqnHyY+AW0/fHvlSE2xVVartpBpfO654K+FrMyplYods3q/S9tiilpm+VTCDK/r
 WOuWzTzUoReABOgNCLoDT3drairndt+0fwDfbzsNosI/Q2dlrJ2uc9UjFxmMPY2YHIPVuoXBKYb
 k/mwd8Fb4XuKgfH3vbDxYR0mL8fs9fzaw8vPL+Utvq3dxlCNcqlA1gij+BDVqD6fxm9mMtA2B6Y
 anIkouB1jkE8qn+R9yCZ2qSnJ7NNulReeD1gzlCZ+FHFYLavjZh+WvGCGb3EtzW+T+mRPsMyWE2
 4wWy/TyJ44g/VidSbp8P4hcDE796DGf9rJMydiCPaZrCw8tM/8+V5OE4DzBxjyfOBcAgIm1oyAN
 thM3CUzwgOA0GAfCckxiZN2WNgCiLMafiTVmM6oApSNWvK9Au7Tu6MaLpLRo6a3FtOK70Zmq/Yi
 i2r0SvaM3z56ycg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_124308_760144_BF3A21DF 
X-CRM114-Status: GOOD (  15.96  )
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

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org
---
Changes since v2:
* make it clear exynos_set_wakeup(bank) is conditional on bank type (Andre)
* align style where the '+' is placed (Andre)
* remove unnecessary braces (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 70 ++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  2 +
 3 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 57c98d2451b54b00d50e0e948e272ed53d386c34..fca447ebc5f5956b7e8d2f2d08f23622095b1ee6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1455,15 +1455,15 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
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
@@ -1477,29 +1477,29 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
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
index f10ff09c1af01c11ff9229aaef77df32eb057b7b..9cffbe9ee64aa5236026978ac2466b709da5bffc 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -798,6 +798,40 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 		exynos_set_wakeup(bank);
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
+	} else if (bank->eint_type == EINT_TYPE_WKUP)
+		exynos_set_wakeup(bank);
+}
+
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
@@ -816,6 +850,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 		exynos_set_wakeup(bank);
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
index 35c2bc4ea488bda600ebfbda1492f5f49dbd9849..773f161a82a38cbaad05fcbc09a936300f5c7595 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -225,6 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
+void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


