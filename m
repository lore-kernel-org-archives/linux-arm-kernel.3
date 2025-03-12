Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8152C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 22:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BPOcBuscqnakrAJecbgIerqvHQVWozMPF/kbWLGHz8=; b=WoBpdTrpkZEAajQXiXyxvv6LLh
	fZobTDUs7KQwzVPYt3OLLyeiuLmph6p3ATaRGdT0cLdwb8MfEWQSMgb/YrIHJ1yw3nQ6YLoW/AVyu
	DD8AnMgw8b9gV4nXtfY2S4VX/J3mEUjg0+QUevXrPQfE5IyZZpr9Oiv9WxFHnx1Mg1RPlS+HRUKx2
	xnjW5uMtepKMsOAZsaVbsDbCsluX8usl2ax4kqJ7SgcrnrePgLVjv8AvQ9TNDf5PAe8W8xl7mh+sD
	33AELWplRZdKSvk1tiRAK44MZ/nPv66QDK4gDL8qt2bYgwFyRYCcEcC0MU1VU+hUJw/OXybHoav3b
	IjsUeq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUBn-00000009aOf-1vIg;
	Wed, 12 Mar 2025 22:04:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsU6v-00000009Zg5-2L2h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:59:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso1766355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741816772; x=1742421572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BPOcBuscqnakrAJecbgIerqvHQVWozMPF/kbWLGHz8=;
        b=u3smUAZiY+TTUfm6zcrLNwv2U/heLvbldhR98EE3jbIThjvWb8OU0ksrFPdldC/j+P
         n2ycdmO1r9m5qI5azqSw7thmVBmBQCA5OxVlAIKL0XpdpblHGHSiJAXsWr3ac3kpJEJU
         IpfC8rK/IVJe85+7w/5DTbM2dNESrn0qMtFq3tUQDc8Pq/vpU5fzUxvcTxIySQZ8HvXU
         wREK7c5a8tnJQONsLZbkzPgpoiw2EQe8wUksQBNhb6HSVnxrKH75r3bSXSuN5CGj8BED
         8bY+d5GHDWJ3gR2z6QZemg8nRG0O+KdQdKuBNvOfQReSH5OUkk06otwiKt3ImINEPqon
         4JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741816772; x=1742421572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BPOcBuscqnakrAJecbgIerqvHQVWozMPF/kbWLGHz8=;
        b=CSfdpE4yeaQot401D9TLZl4qb1KM1GC4tDJ+V4dSasWG+8f/kPu5eEVB0Jx8NLSxRY
         +T0hikepS3wawQ9D1pGlVeU0DEdTEWM7c6U9lWK+NgAg4OLZShk9yQJKML3pEEZWAS62
         wM02rvNVXoTAdublxv6lzdYqgdFO+R4GjQe448pXLAx6pkCprzzZtJSIDf4ZQD7vwUr1
         X/OzobffQHPbgtPltiWsgmqYACAyZAzb6mpAcliwO5xMeNQT8ZVCfAlmozwjohXmcZZ1
         MJwWZ2YkR3nTgUY9lGOpPx6n812RcltvUXoXwNNcOuytCXCPx2sDxeDkLt2ooCBtVKO4
         3/GA==
X-Gm-Message-State: AOJu0YwTRyeTOr/tD9CO5BSza/bl9x+vbxAuCJ8qkIukUlkAOUnOc4h8
	ik6QPY2BcIuCylEzZzCG7AmfpJgowd5tz76XxJwWS8UkUhmAIZBJ96X9x/wP2Xg=
X-Gm-Gg: ASbGncsijp90I380hy+vftzSAvNee0BkFh0jRpn/CkHZCt91b/CENKlzJSGRn6VtCf/
	BUxNTbBHD5teF4TXxf9HcGAP2yNUgx4ojn3WrYlM2VUS5YqHiLo9CSW1Xw3GCZ0V01pRKyVkXgm
	zHsod0EbySaAqIBIErLf5gRx1in/aP/QchNCOKthKCXCYzQICUl//eMucEW/vmU3X0t6/WsXAHz
	zw/Gy28KRsmFg2YiU8IPzHVElKus3DROyHi2bsUQ6An8OSBm+RLhoZgWs/nIARxKVVtKyTqIVHG
	Algb1lMoPoy1eNkdFlOUc0byq1H3GF9iT8M8D+LgoBck6bDuYa0IV415HnOrSZ1R86bP7xRrqmI
	k
X-Google-Smtp-Source: AGHT+IGandCyInoBlFimfik1nhqFVeJ+aHeTPEW1Yga14N2YX7AZdDUpjp9raK86xmISAiOp0my9LA==
X-Received: by 2002:a05:600c:19cc:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d04e92a66mr74714305e9.7.1741816771779;
        Wed, 12 Mar 2025 14:59:31 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188bb34asm110175e9.18.2025.03.12.14.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 14:59:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 21:58:59 +0000
Subject: [PATCH v5 2/5] pinctrl: samsung: refactor drvdata suspend & resume
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pinctrl-fltcon-suspend-v5-2-d98d5b271242@linaro.org>
References: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
In-Reply-To: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10132;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Ifk7YdZuIp5E4EKR7US35EuSCJAK0G+XzSgLezpskrU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn0gO9EUm+cy/E4CFUezGpu0cs+NdsD3ticaqG3
 isl43NpBKmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9IDvQAKCRDO6LjWAjRy
 uj4MD/wJvkj0lvrcAv+/wdy9wwAtx/OJH4DsdIWDVijRM1qHHSwlLZleTfcc7eN2+R88e/6fQie
 D1CyTPSHD3iGYIEBgXPXcRFnCIk8DM1YJzzvwgD7aZo/fBnXNVIfX18Hrdu8knxyUWLuQMbEp8f
 SFTzOuKN2YoX44s7zqKWCO3oLLueaeMlvCsKqAHIqFpxFoLZPerRFPGzSDbqC76n5TZuLLyb1iM
 5Wqv+vts2FWdu+4o8asyHrgIpj7thvT8W+98UNs3uSOQMm/e+lYryK+x1YiUhmBrMlrof5dayRF
 OfukLikY5QRvGeZe2TBW2zLqnfOHsRQugLIp0vSSilYt2I8cAlGN9eLS3U+cSu6FyD8VVjitf4e
 egRKCYYDZFtLm5kqwjGhZ49vPF3H0Vtfv9Gv3iAO7PULcfiOkUC2rQfkVU/+moB8d1s+xoUfmXT
 M+kUBMgDk/LPUsvMocSyK+zhIpkSO+G27Et5bXDC3D2vVRvgCYZteTersX8VW+zBAmA79vxJkKp
 3s0+Z63/Avtd45tw+7L5i7U3qYlBK3yVnZDnKgGmobNE9jRvLo6T4vXZ76h01xhoZKbPh42tZ+S
 NS5u+aFa+hUgPH1FK715EoUjJRZzWRI2Pfl0A+iZz5jTFNTgUeNXTao3sZsA48huCNY2Pr0m8XH
 Uck+BXNrEf1ApQA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_145933_604382_7C8D4A19 
X-CRM114-Status: GOOD (  18.43  )
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

Move the call of drvdata->suspend()/resume into the loop which is
iterating drvdata for each bank.

This allows the clk_enable() and clk_disable() logic to be removed
from each callback, and also avoids iterating the same loop again
in the next function.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++-----------------------
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 11 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.h |  8 +--
 4 files changed, 33 insertions(+), 79 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ac6dc22b37c98ed5b7fca3335764f19abb2f71cc..62c8d8d907545119c49a89d79b5dae63282467d5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -761,19 +761,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
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
@@ -783,71 +775,46 @@ static void exynos_pinctrl_suspend_bank(
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
@@ -869,22 +836,13 @@ static void exynos_pinctrl_resume_bank(
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
@@ -893,21 +851,16 @@ static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_data *drvd
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
index 33df21d5c9d61e852834031570d4a0ac0e51f6a4..69be0746e29d9714a33f4aa49df0e8d7257b4220 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -221,8 +221,8 @@ struct exynos_muxed_weint_data {
 
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
index 963060920301ec90affb2ee6d758d3d602ffb4a9..375634d8cc79d6533603e3eed562452181e2ee25 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
 
+		if (drvdata->suspend)
+			drvdata->suspend(bank);
+
 		/* Registers without a powerdown config aren't lost */
 		if (!widths[PINCFG_TYPE_CON_PDN])
 			continue;
@@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 
 	clk_disable(drvdata->pclk);
 
-	if (drvdata->suspend)
-		drvdata->suspend(drvdata);
 	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
 		drvdata->retention_ctrl->enable(drvdata);
 
@@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		return ret;
 	}
 
-	if (drvdata->resume)
-		drvdata->resume(drvdata);
-
 	for (i = 0; i < drvdata->nr_banks; i++) {
 		struct samsung_pin_bank *bank = &drvdata->pin_banks[i];
 		void __iomem *reg = bank->pctl_base + bank->pctl_offset;
@@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 		const u8 *widths = bank->type->fld_width;
 		enum pincfg_type type;
 
+		if (drvdata->resume)
+			drvdata->resume(bank);
+
 		/* Registers without a powerdown config aren't lost */
 		if (!widths[PINCFG_TYPE_CON_PDN])
 			continue;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 371e4f02bbfb375964b7833beb9bbc098a51f4a3..e939e5bb0347458ae4a9014fd9657fc59c5c3994 100644
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
2.49.0.rc1.451.g8f38331e32-goog


