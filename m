Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6127DC36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfPwCl7aYTIbWPSAYmdsvg2+Jb9PZVNsfh4JLw3ATow=; b=jTYREyuBWew3JDTcWxGfuDOHej
	lG1FfGfoBYd97yt8+e6bp+cE/9/+AN4ZAB6ZVaDQesRsmAWAKpv1H421X6JXOmbpcS5qxursITdih
	b7vhGhQLt81wqKJp4RZBNdYuf24BgBtTBcAClOiX0ZY7Vt6GDq9+0v8oe4ObGyTKjIBJk5d4hGj9K
	FrLa3v4di2b1g2fWItB1Dh9iiCT70Ja/hYAWJpvkVG+ZS8JokkAlHVP8hnQ7S71hjrzdZsaTICKY2
	o0g9oqKewGLo0PuuMWRlYXzUMXzHpcRcIO8/7F/Yt1nYYnm67NDcPgcFX5o5hi+nLtZHd9oZ2BUtm
	SBLA6JZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzvm-00000006VNo-0Kfu;
	Wed, 02 Apr 2025 15:23:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzqX-00000006URf-044o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:17:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3979458f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607059; x=1744211859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfPwCl7aYTIbWPSAYmdsvg2+Jb9PZVNsfh4JLw3ATow=;
        b=yVFJ8GuVobfk1eQ3IM5Y4th7MRnfjZmtHyQmb5WmoZb/rjTrO+7orKGAWCqGLeL2wl
         rAI/r0CkrVNmg2plXqL4VpxW9CImBCfDXTe0wOu1VzVNoezsVd1WBvAdQO9etJFdRNCT
         VEEqSuP7uQOwez+e/WdmmxpmhygBpv5i6qMGQIEVhXe0kZ8u6gw/GP1C0NfYXCGNoAfF
         8xeQAVxzv+t4aJJBnD99x2ssW+SYkkAj/hTxTx8vJqAEHvQktROQ/A6orXnAofGK1yRf
         oaMtpA6VcB59L9+RdRHpd5kT5P7zAwwRNdKKm92X6vv6xvhqvhFtNozbWoIMdZz4LwYu
         1Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607059; x=1744211859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfPwCl7aYTIbWPSAYmdsvg2+Jb9PZVNsfh4JLw3ATow=;
        b=HjAHWiyVVEA6MumiDWT7cJ8U5fSku2Hx5jkvrv2U7/SuHlRrx4XytGuUxP/kbfefuY
         irQ+xWGs/SVuGT2vs0HNd5RoZGa4D0jWmx0seSdAhEP/pIiAyO3eHmm+V0gchQOGbBlL
         qn6K6oMysBRKlWmzjqbcwN46AZAsOpUCcgSaWBRHBYTkJYzIWsQfzzNQSjmpw/IpMnhx
         dK0CDtR4MO2uwYI/badXNWsTmChGpqtaBEnW5Jyuo4oBGFy6om/DksqwXE/gc8Hf5TNc
         JfDST1QuFMRetbriOpopAzCVqLom/msb1ZfBPCRHM5ytcqAuMcGYAFUOV6+0jTMWEmZg
         U5Yg==
X-Gm-Message-State: AOJu0YwA9y68UL/VXNBOuuJ6oHQo6xHCGo0RWO9/Fk2d0L+KViSQAj6u
	FDjpRYqWONQj1HUeEW97/foG+tZpl4pOum8Of+LZMqC/syNlZgpISohOdIA73wE=
X-Gm-Gg: ASbGncsQ79wOzOS8EaITaQbHwjOUqWCO8Xp6wwn1dcvAxHqYMofC5I+2rT6nvo9fc+K
	c9lQ/ZFCJJM7wNvUFtDEspr8Fuyp0nqZ9ZVrMlI/Qn65Dj3J6al5zgE4lnfJuwkz6uBub2UJ7nX
	EdJXr/8PaGbl7EujnkOC4dirOIFEp4y7A8oKGPHW9NUpRPwYUl69NTjuFxOdYmtgtD0yD2mvSIb
	EgSkLGVogXOZoJhYL3QLVPQ71wFj02q/IlAol/YxMZN6zp7EecWBfe0V35z022HVzJ8elcLix4g
	rKDtw7l4oLQdgxSXa81mIZT0w6WzyLGIFsk9KhjI7vdAxSQlN+uIHmpkzHQ7qbXK4Nm4QzfEog=
	=
X-Google-Smtp-Source: AGHT+IFLdkbEa6K1faZlIk+TcENgKb4y4keAd2lgqG563akV2hjUSxTIV8SnOYHmRxq7XbWIlJosHQ==
X-Received: by 2002:a05:6000:144e:b0:39a:d20b:5c25 with SMTP id ffacd0b85a97d-39c120e34ffmr14401209f8f.26.1743607059322;
        Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:38 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:30 +0100
Subject: [PATCH v6 1/4] pinctrl: samsung: refactor drvdata suspend & resume
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-1-78ce0d4eb30c@linaro.org>
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
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10911;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SOyw3jdStYdySfM8lBPDNtxClYBS3HT3b7KLkFjw5bI=;
 b=owEBbAKT/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUORK1okRhy92aZ5/zfF/Uu4Lef42dODQBq+
 NkN1s3qFfuJAjIEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDgAKCRDO6LjWAjRy
 ujLbD/MGef9ZtKfw/6GtMkCSwqrst5lC7jROYLj2A1qiaz0Wan9N1nK9mxxr8cXoZNUnppMZB/k
 PPcQCER88cwn5G96+IQcuYOYbXDcqHJP65C8h4Fkxzy/hfEdJqpXTBOGBjgMvIWluXF4I7QZ5G9
 pvV9BYmG3PYPCEakcPDbJsjh3i8p38cEuetrOIYnJw9PVM5DcrXsJ8CBPwcqv0Z3IILPKnw4fTL
 /mNC8XMJ50+k7Irz++wOHpuH7d7hlWCmuqFIPG2R9yuBtvnYdOtl9CTYsTYlylu7khed4xqrEWH
 0Li1VcJG16pd7AQLcvQBpwOBylP+R1bcoDzI1YRRh63L6PZBiv6PMnBaOqOmZY9Y0WQ0NZ64fvR
 RulKxSpq928AXrJOCRdcmeo/ddDOkqb4zz4v+kytNTFfwSqQfIxigercuiC41P0A314tjHfsHph
 //I9zq9nLL+ayHmzh7GnG96DKF7TzEqCwhs5Ddo6I+2R18MnD98P+nnOolk8/kpS3u40hk2CrQI
 Ns8pcv4AxnOjonXWr044q9EY9yOvqQjp8ODptbGe7XV16/bpSoUE/hX3AppqV91hnHTpxv+yEtv
 4jENH9oHPFOKn4S2s4XblEEg+Q2m6RFjAy7T9xTGWV+IUJc9ysibwShtqF3cOrDdJBDxE23MOUm
 On68kyrV+d7u7
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081741_062039_C7CDBB57 
X-CRM114-Status: GOOD (  19.52  )
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

This enables the clk_enable() and clk_disable() logic to be removed
from each callback, but otherwise should have no functional impact.

It is a prepatory patch so that the callbacks can become SoC
specific.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v5:
* Ensure it is symmetrically reversed (Krzysztof)
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++-----------------------
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 21 +++++---
 drivers/pinctrl/samsung/pinctrl-samsung.h |  8 +--
 4 files changed, 42 insertions(+), 80 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 42093bae8bb79390f3c0ee7d387220b297af812b..ae82f42be83cf0a294452d7f44cd744295bb0408 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -762,19 +762,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void exynos_pinctrl_suspend_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
 	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
 						+ bank->eint_offset);
 	save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
@@ -784,71 +776,46 @@ static void exynos_pinctrl_suspend_bank(
 	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
 						+ bank->eint_offset);
 
-	clk_disable(bank->drvdata->pclk);
-
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
 	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
 	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_data *drvdata,
-					    struct samsung_pin_bank *bank)
+static void exynosauto_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for saving state\n");
-		return;
-	}
-
 	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
 	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
 
-	clk_disable(bank->drvdata->pclk);
-
 	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
 	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
 }
 
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
 	struct exynos_irq_chip *irq_chip = NULL;
-	int i;
 
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank) {
-		if (bank->eint_type == EINT_TYPE_GPIO) {
-			if (bank->eint_con_offset)
-				exynosauto_pinctrl_suspend_bank(drvdata, bank);
-			else
-				exynos_pinctrl_suspend_bank(drvdata, bank);
-		}
-		else if (bank->eint_type == EINT_TYPE_WKUP) {
-			if (!irq_chip) {
-				irq_chip = bank->irq_chip;
-				irq_chip->set_eint_wakeup_mask(drvdata,
-							       irq_chip);
-			}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		if (bank->eint_con_offset)
+			exynosauto_pinctrl_suspend_bank(bank);
+		else
+			exynos_pinctrl_suspend_bank(bank);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		if (!irq_chip) {
+			irq_chip = bank->irq_chip;
+			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
 		}
 	}
 }
 
-static void exynos_pinctrl_resume_bank(
-				struct samsung_pinctrl_drv_data *drvdata,
-				struct samsung_pin_bank *bank)
+static void exynos_pinctrl_resume_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
-	}
-
 	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
 			readl(regs + EXYNOS_GPIO_ECON_OFFSET
 			+ bank->eint_offset), save->eint_con);
@@ -870,22 +837,13 @@ static void exynos_pinctrl_resume_bank(
 						+ 2 * bank->eint_offset + 4);
 	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
 						+ bank->eint_offset);
-
-	clk_disable(bank->drvdata->pclk);
 }
 
-static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvdata,
-					   struct samsung_pin_bank *bank)
+static void exynosauto_pinctrl_resume_bank(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	if (clk_enable(bank->drvdata->pclk)) {
-		dev_err(bank->gpio_chip.parent,
-			"unable to enable clock for restoring state\n");
-		return;
-	}
-
 	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
 		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_con);
 	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
@@ -894,21 +852,16 @@ static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvd
 	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset);
 	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offset);
 
-	clk_disable(bank->drvdata->pclk);
 }
 
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
-	int i;
-
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
-		if (bank->eint_type == EINT_TYPE_GPIO) {
-			if (bank->eint_con_offset)
-				exynosauto_pinctrl_resume_bank(drvdata, bank);
-			else
-				exynos_pinctrl_resume_bank(drvdata, bank);
-		}
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		if (bank->eint_con_offset)
+			exynosauto_pinctrl_resume_bank(bank);
+		else
+			exynos_pinctrl_resume_bank(bank);
+	}
 }
 
 static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index b483270ddc53c0b0e8d0f425cd7b0f59e6a894da..341155c1abd153eb3efec5212b268ccfa535bd8e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -240,8 +240,8 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
-void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata);
-void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata);
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *
 exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 		      const struct samsung_retention_data *data);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 2896eb2de2c098c72adc4de5c9d72bb2b7e46bdb..ef557217e173af905c1667c6a167c5c77057e254 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1333,6 +1333,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
+	struct samsung_pin_bank *bank;
 	int i;
 
 	i = clk_enable(drvdata->pclk);
@@ -1343,7 +1344,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 	}
 
 	for (i = 0; i < drvdata->nr_banks; i++) {
-		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
+		bank = &drvdata->pin_banks[i];
 		const void __iomem *reg = bank->pctl_base + bank->pctl_offset;
 		const u8 *offs = bank->type->reg_offset;
 		const u8 *widths = bank->type->fld_width;
@@ -1371,10 +1372,14 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 		}
 	}
 
+	for (i = 0; i < drvdata->nr_banks; i++) {
+		bank = &drvdata->pin_banks[i];
+		if (drvdata->suspend)
+			drvdata->suspend(bank);
+	}
+
 	clk_disable(drvdata->pclk);
 
-	if (drvdata->suspend)
-		drvdata->suspend(drvdata);
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
 		drvdata->retention_ctrl->enable(drvdata);
 
@@ -1392,6 +1397,7 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
+	struct samsung_pin_bank *bank;
 	int ret;
 	int i;
 
@@ -1406,11 +1412,14 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		return ret;
 	}
 
-	if (drvdata->resume)
-		drvdata->resume(drvdata);
+	for (i = 0; i < drvdata->nr_banks; i++) {
+		bank = &drvdata->pin_banks[i];
+		if (drvdata->resume)
+			drvdata->resume(bank);
+	}
 
 	for (i = 0; i < drvdata->nr_banks; i++) {
-		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
+		bank = &drvdata->pin_banks[i];
 		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
 		const u8 *offs = bank->type->reg_offset;
 		const u8 *widths = bank->type->fld_width;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 3cf758df7d69127a1b012105eebcfbba45c993f2..fcc57c244d167db1de8c7aceffa6a9e7484bf348 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -285,8 +285,8 @@ struct samsung_pin_ctrl {
 	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
 	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
 	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
-	void		(*suspend)(struct samsung_pinctrl_drv_data *);
-	void		(*resume)(struct samsung_pinctrl_drv_data *);
+	void		(*suspend)(struct samsung_pin_bank *bank);
+	void		(*resume)(struct samsung_pin_bank *bank);
 };
 
 /**
@@ -335,8 +335,8 @@ struct samsung_pinctrl_drv_data {
 
 	struct samsung_retention_ctrl	*retention_ctrl;
 
-	void (*suspend)(struct samsung_pinctrl_drv_data *);
-	void (*resume)(struct samsung_pinctrl_drv_data *);
+	void (*suspend)(struct samsung_pin_bank *bank);
+	void (*resume)(struct samsung_pin_bank *bank);
 };
 
 /**

-- 
2.49.0.504.g3bcea36a83-goog


