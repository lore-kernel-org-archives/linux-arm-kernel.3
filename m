Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B9C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8+Pe1U0LJW3ofzK+b01yHbnwSQmoedut47oQ7P2Cbs=; b=LKH0hpHgbwUh7GzzNtfQ6HZjsW
	VrU+YJS8ok0pSAEN7rflz8lqydm4cTqHvwHes/W9L9cbGKTa5vnT/+lJeaCDoLtymkNVGqPht/29z
	NBuA997EtyPkbUTp8vEaxsqBAmNKtbLUWJo4RJnLjrlPekenirfi6dubYupSCojRZbGtrgIv0wEby
	ih0MjWE+43W0afP00lWcq86BccmsgLFHX5fk8XgfQRh9l7tryR61uhH0P+XdcoTjSi4zpreL+Syt7
	F83S7LITtIfqN96CrttUDgLPNFhSYFwd5K99c1/Pd80qo9PyfW6ttsPx2YT9JG7mRk/dfzeI1DLRp
	FxK9iblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzxU-00000006Vcw-3YsP;
	Wed, 02 Apr 2025 15:24:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzqY-00000006USS-1Mk3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:17:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so46014025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607061; x=1744211861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8+Pe1U0LJW3ofzK+b01yHbnwSQmoedut47oQ7P2Cbs=;
        b=hOh7i0PkbNaD9q18gtjOYg3mt+wQ7VC0ndvvWH0FYPVx/kwN1Xy7+nQCudsI8KXLGy
         WYpE0Ws90hVVwVD09eefP1eSZREwdStDjN+Wp4kVtBrsGvLmQNGDlf+Vgz9ukbMWHrhX
         8f/J+DVp/RHgfkz1A/Q0NmfT/o+JoHYXPLY+A53+uf7dsQIjLVZsEIH1MUXCrmzLzS9+
         aCZ7QJq+FQRY+2ugin55MZoKgU2GCs0nj3wRiDGoqm64ER3jn/Q3Ewbz28sZMmKjDZbT
         tRAxU+QJHUnKKrBrvCC1RI7a/gerRkL8gUGex1jvEIIU1qRuls3U3hmgXaCm+3LliPuM
         S9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607061; x=1744211861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8+Pe1U0LJW3ofzK+b01yHbnwSQmoedut47oQ7P2Cbs=;
        b=XZ/XqVFALbgc+9hmr0PMRbMaUL+B+cfRrUbh4T0uoPuBEunzvZ72T1EOsECGVUPFg6
         +jv9IwCKyM5Ui0xCIkYNjnK4CsatxVQF71WMN90wqnkR+ooYzSnpzbXVE5pzAaPAKW/s
         aYvhKJbOwq4HXp5MdGwneEXNIcJjjB0ClpMMp8hz2WBp+I94pRKtdCtvS+rOUhur1SNx
         5yQBpk94qlptmo2iiOc2zpQvVdNDf9/RtquMCjoaEJLOIp3xJL0sDM97vCA7KdqP6q3/
         DAtgbw9I0XxY6QmXCtfcjf2QqCeLgEZKUXrylTo2Re2mmvuR1ss1/zMjurfB2D8O7zxR
         ZkPA==
X-Gm-Message-State: AOJu0Yy4XQZ8vOodYQXJa1uLcK+yTFWiUC8pSWKDVm44BvFii9oXyFIi
	S5D7WB+Q/ZIMl+KzVjNgrBsbCR2PGVTbJLJHx6NNxR/5rH+7V4b/ftl2NmwXC5c=
X-Gm-Gg: ASbGncud+wvgbBSJfrldnZeYOFnD4gtsBjqFllckpvRmDPZredswvuMPSME7/YNdpED
	Y241bs1u/w4UEGGEsM0WjEMZdBew/rIT5iDAnve8fRVFSsGr+JqOXmpEcZ1Jen58HiZ2n75lmre
	vlPLhSWM2s5cPj2Lo87ii/3R+Eu1lDdiQj/PZYk0zYSvtniypUZIx7OrVOo2Ule4rIMjDRSMHfC
	li/cBJTSgkaK9BxIr+K3kNQ/7jDwdzY3PUqowo1R4WleLAkhHGDCCUNdo7X9Ib8xt5Kd5o/83sw
	L02G695173ij1anKd9SnZt8YO9xno6pnm/IeubxGnzBdG/4CkTx3XeB3HfWJaRtczCB/B+oevw=
	=
X-Google-Smtp-Source: AGHT+IFQcBVw5nc/Df59dJyECsuyovtt7ap7m1YZVO+GW+Nv/8l+dQJgnqQsw10qPVZcvSWyxcgxIw==
X-Received: by 2002:a05:6000:1449:b0:390:e48a:3869 with SMTP id ffacd0b85a97d-39c29737d42mr2785591f8f.11.1743607060627;
        Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 02 Apr 2025 16:17:31 +0100
Subject: [PATCH v6 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-2-78ce0d4eb30c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12872;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=9jYQ8qFG3TCrgXmTWSIUauoWLDB9OBDMIl5DHxr8JMk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUPYDTKw48WdMIpk0jhkhzMlUwV3+KWfMBNm
 BMltT/syYaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDwAKCRDO6LjWAjRy
 utdrEACIvcQSZ3gChmJ7hRlkDz2FGZzv8V6u8EMEDod8h8ydKU4wljiktur2odFDoX2h9A+tQh/
 MPgebTu2IwTmoLpVYAK+Z0KWNtJxyrYABVBmjYPCcL7tZZpSQC8SdPNKYsTSTnLiDEV/10g/P5f
 I2tG6oJAYbX8HAgpJhKWOitzh3YdHCWkVjyaGbKeGfT67LfA45QmfyeSg9u3cPdlh6tN4RDNPyH
 zSsuSEftlHFzAZgASN62dIZWk5G/uj6kBSX/c3nPHndMXqM5ipGS1xAA3+jM+/6VT4PFtFZATOs
 3XBNoDMpiqknmqjV3k52bEGs9GtNXiFtxz4HjORc263jVF99Xe7lqstvVJwRzPBfE2ey3smNHgp
 cdqBgLwfthWPL7ZlKNR0AhcuIo/1qjoFKBlTqdy4DkFG0MhLtvbzy71PIJh/+5HHFhaP3JjqqsD
 09cYDFmhfKFv1saeOgJeWTBW+Zl8J3F1qZwp6q7f9eEisx9bo+w7D62hNzkv4O+rIGKmxbHa3io
 6a3GjddZc8qVHu6dXgmRIicBs1HqmhtOg9jW1K57sH70wBCBao+cl+dSxvuDTrW7v4X3/fXoi3X
 JvAx3aPuWnXgeOPAd3woWhKXvYY/dRU7sQu9R4NAMMgc7P4GiZRf8t16ZvVx3KX2CkMKqOQ1YL9
 DUGGvO3IqJHgIVw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081742_372625_D16C5A65 
X-CRM114-Status: GOOD (  16.55  )
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

Refactor the existing platform specific suspend/resume callback
so that each SoC variant has it's own callback containing the
SoC specific logic.

This allows exynosautov920 to have a dedicated function for using
eint_con_offset and eint_mask_offset. Also it is easily extendable
for gs101 which will need dedicated logic for handling the varying
register offset of fltcon0 via eint_fltcon_offset.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v4:
* split the clk_enable/clk_disable refactor parts into separate patch (Krzystof)

Changes since v3:
* save->eint_fltcon1 is an argument to pr_debug(), not readl()
  change alignment accordingly (Andre)

Changes since v2:
* Remove useless init (Andre)
* make it clear set_wakeup is conditional on bank->eint_type (Andre)

Changes since v1:
* Split code refactor & gs101 parts into separate patches (Andre)
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  28 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 152 +++++++++++++------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |   2 +
 3 files changed, 97 insertions(+), 85 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index dd07720e32cc09ea1d5a20c8d1cbea3bcff79204..4b5d4e436a337ff13dee6ef740a1500eaf86cc12 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1419,8 +1419,8 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.pin_banks	= exynosautov920_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks0),
 		.eint_wkup_init	= exynos_eint_wkup_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 		.retention_data	= &exynosautov920_retention_data,
 	}, {
 		/* pin-controller instance 1 AUD data */
@@ -1431,43 +1431,43 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.pin_banks	= exynosautov920_pin_banks2,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks2),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 3 HSI1 data */
 		.pin_banks	= exynosautov920_pin_banks3,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks3),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 4 HSI2 data */
 		.pin_banks	= exynosautov920_pin_banks4,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks4),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 5 HSI2UFS data */
 		.pin_banks	= exynosautov920_pin_banks5,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks5),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 6 PERIC0 data */
 		.pin_banks	= exynosautov920_pin_banks6,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks6),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	}, {
 		/* pin-controller instance 7 PERIC1 data */
 		.pin_banks	= exynosautov920_pin_banks7,
 		.nr_banks	= ARRAY_SIZE(exynosautov920_pin_banks7),
 		.eint_gpio_init	= exynos_eint_gpio_init,
-		.suspend	= exynos_pinctrl_suspend,
-		.resume		= exynos_pinctrl_resume,
+		.suspend	= exynosautov920_pinctrl_suspend,
+		.resume		= exynosautov920_pinctrl_resume,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ae82f42be83cf0a294452d7f44cd744295bb0408..18c327f7e313355c4aba72f49a79b1697244f1ba 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -762,105 +762,115 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	return 0;
 }
 
-static void exynos_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
+static void exynos_set_wakeup(struct samsung_pin_bank *bank)
 {
-	struct exynos_eint_gpio_save *save = bank->soc_priv;
-	const void __iomem *regs = bank->eint_base;
+	struct exynos_irq_chip *irq_chip;
 
-	save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
-						+ bank->eint_offset);
-	save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset);
-	save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset + 4);
-	save->eint_mask = readl(regs + bank->irq_chip->eint_mask
-						+ bank->eint_offset);
-
-	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
-	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
-	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
-	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
+	if (bank->irq_chip) {
+		irq_chip = bank->irq_chip;
+		irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
+	}
 }
 
-static void exynosauto_pinctrl_suspend_bank(struct samsung_pin_bank *bank)
+void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	const void __iomem *regs = bank->eint_base;
 
-	save->eint_con = readl(regs + bank->pctl_offset + bank->eint_con_offset);
-	save->eint_mask = readl(regs + bank->pctl_offset + bank->eint_mask_offset);
-
-	pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
-	pr_debug("%s: save    mask %#010x\n", bank->name, save->eint_mask);
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + 2 * bank->eint_offset);
+		save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+					   + 2 * bank->eint_offset + 4);
+		save->eint_mask = readl(regs + bank->irq_chip->eint_mask
+					+ bank->eint_offset);
+
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save fltcon0 %#010x\n",
+			 bank->name, save->eint_fltcon0);
+		pr_debug("%s: save fltcon1 %#010x\n",
+			 bank->name, save->eint_fltcon1);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
+	} else if (bank->eint_type == EINT_TYPE_WKUP) {
+		exynos_set_wakeup(bank);
+	}
 }
 
-void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
-	struct exynos_irq_chip *irq_chip = NULL;
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
 
 	if (bank->eint_type == EINT_TYPE_GPIO) {
-		if (bank->eint_con_offset)
-			exynosauto_pinctrl_suspend_bank(bank);
-		else
-			exynos_pinctrl_suspend_bank(bank);
+		save->eint_con = readl(regs + bank->pctl_offset +
+				       bank->eint_con_offset);
+		save->eint_mask = readl(regs + bank->pctl_offset +
+					bank->eint_mask_offset);
+		pr_debug("%s: save     con %#010x\n",
+			 bank->name, save->eint_con);
+		pr_debug("%s: save    mask %#010x\n",
+			 bank->name, save->eint_mask);
 	} else if (bank->eint_type == EINT_TYPE_WKUP) {
-		if (!irq_chip) {
-			irq_chip = bank->irq_chip;
-			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
-		}
+		exynos_set_wakeup(bank);
 	}
 }
 
-static void exynos_pinctrl_resume_bank(struct samsung_pin_bank *bank)
+void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_ECON_OFFSET
-			+ bank->eint_offset), save->eint_con);
-	pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-			+ 2 * bank->eint_offset), save->eint_fltcon0);
-	pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
-			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
-			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
-	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
-			readl(regs + bank->irq_chip->eint_mask
-			+ bank->eint_offset), save->eint_mask);
-
-	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
-						+ bank->eint_offset);
-	writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset);
-	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
-						+ 2 * bank->eint_offset + 4);
-	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
-						+ bank->eint_offset);
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
+			       + bank->eint_offset), save->eint_con);
+		pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+			       + 2 * bank->eint_offset), save->eint_fltcon0);
+		pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
+			       + 2 * bank->eint_offset + 4),
+			 save->eint_fltcon1);
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->irq_chip->eint_mask
+			       + bank->eint_offset), save->eint_mask);
+
+		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
+		       + bank->eint_offset);
+		writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		       + 2 * bank->eint_offset);
+		writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
+		       + 2 * bank->eint_offset + 4);
+		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
+		       + bank->eint_offset);
+	}
 }
 
-static void exynosauto_pinctrl_resume_bank(struct samsung_pin_bank *bank)
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
 	void __iomem *regs = bank->eint_base;
 
-	pr_debug("%s:     con %#010x => %#010x\n", bank->name,
-		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_con);
-	pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
-		 readl(regs + bank->pctl_offset + bank->eint_mask_offset), save->eint_mask);
-
-	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset);
-	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offset);
-
-}
-
-void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
-{
 	if (bank->eint_type == EINT_TYPE_GPIO) {
-		if (bank->eint_con_offset)
-			exynosauto_pinctrl_resume_bank(bank);
-		else
-			exynos_pinctrl_resume_bank(bank);
+		/* exynosautov920 has eint_con_offset for all but one bank */
+		if (!bank->eint_con_offset)
+			exynos_pinctrl_resume(bank);
+
+		pr_debug("%s:     con %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->pctl_offset + bank->eint_con_offset),
+			 save->eint_con);
+		pr_debug("%s:    mask %#010x => %#010x\n", bank->name,
+			 readl(regs + bank->pctl_offset +
+			       bank->eint_mask_offset), save->eint_mask);
+
+		writel(save->eint_con,
+		       regs + bank->pctl_offset + bank->eint_con_offset);
+		writel(save->eint_mask,
+		       regs + bank->pctl_offset + bank->eint_mask_offset);
 	}
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 341155c1abd153eb3efec5212b268ccfa535bd8e..3a771862b4b1762b32f9e067b011e80cfebb99d2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -240,6 +240,8 @@ struct exynos_muxed_weint_data {
 
 int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
 int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
+void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
+void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
 void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
 struct samsung_retention_ctrl *

-- 
2.49.0.504.g3bcea36a83-goog


