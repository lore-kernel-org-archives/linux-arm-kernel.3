Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470BDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z/cSWxWRpqsqO8grG7ONZ7m7YAObdYsI81BO7B0oww=; b=rGywjBisRrWiDPV1U17NBX8YG1
	Yr6CswFHNelk/zsuvlxSIsJVB1dDwRMubpXdW9nIjvxOW9064okqRz8Zp/fiTjH4Dfbo5Hln2KGX5
	GYvx+zOl1vU3qB9Y9/cPGc1wmP33mm096SqZxauhvogq1CV/Pt+JEo8h8FoAZSZ/dS8zKhrAmdbqk
	GdPPu0I7GdyOOS7m0RctQsMAY2sGtc4nTESZlAz43QVE3FGlZqTv4Z+6zD6RGEMQLw52m8+V9ti5N
	qzCuvtLTeX6gIYBxS66Ks1SGxl9wNeIYttWKoIDqEfVMit8rLUNt4j+xvxStESOMyT7k72rpvHlz9
	X3PGNCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toLM7-0000000Ds05-1g1M;
	Sat, 01 Mar 2025 11:50:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toLG2-0000000DrJq-0agI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 11:43:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f488f3161so1770862f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740829429; x=1741434229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z/cSWxWRpqsqO8grG7ONZ7m7YAObdYsI81BO7B0oww=;
        b=HFdh2Y6pQZVLxTpnMFplWhJ2x3ibkTNI/vc0WdgZmK/yFDmy+DINj2MQg9c6cuvsk9
         oFeq6ly1LHYDzLcWAogzuGRvSeVhw5iDfxcRlJQe4jD7L9Hf9BDc7+wHEoh8AbF7dLzQ
         gR7aTFbXGSQFn8nfnLKBqTNLKT37Ribq+O7RBw+NQTTKHkpJGqvt7mR3guFvDVX5txRe
         QU1pYWh1/v+nQLO84c9KLdNYdPy/VpQd7y0eH1NL6NS29RTOTqkG85RrKgrz26UAR43l
         wu1mhrOSf/CGlP8cSiC95xTFbBIjGK3B+Rg45IfmDNiQN2vq5AxALnvH9L/6rlHmQ6St
         Mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829429; x=1741434229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z/cSWxWRpqsqO8grG7ONZ7m7YAObdYsI81BO7B0oww=;
        b=X8yWiOHLwxoHR+ATAeEFj9MvwXHNdWBH+kKe7UaunwnN1zhtQH26a5r29zxTDQrkkj
         MW5GCmSbpzV1T3s8ax+uoPSTcV9w8RojXvcJqqgqug2IZW28UpyBxpmuH/7DZv1kvEW/
         cNU1D7C8UIx2DLOVVRaiS7GXm6eX2EBpcfrsZ1xfljSZHwYvm+0Mzz3SwOcdG51o+paw
         pNtcY3022y8LKCyYUKm5RfDdnq8Doda19vEVoC2PmCvsWh4tsMiJ4yGAWvVLihTuBur4
         eQFIE3grFHqJ3roHxduuETBt5xdTwREj7FZHi0z3zEzhnM9rbxj8ZqoM0LIb+Mqhv6pU
         GTpQ==
X-Gm-Message-State: AOJu0YxI0zGSnpA5NRH7g4ahaI1CcEvFuLNM6AO92W4n/9ArfW43sB1k
	n+7WRnMTIULWbZhfX+Ojt0+WXgjjsGFpfT5HLVzPGh8uTjPLuqaXws+VZ9aSGrZq3ZUH/FHIUFv
	q
X-Gm-Gg: ASbGncs7JMusPeOa9Hegix4F5NYAhdCCkG9yk+2PgdNRy0wnziLGhkWvKT+/ADhXSIY
	a9yUXJ8/OFcZut7rj7rWjkWy2RAJ06sfuqojLacBOEPv0E0qsE3IbVuTS8l5B9IHvFCEs0QIJPi
	4T1itEFqcUtXlVfVKqgFHwVFlOKnhds7qvTrp4kplttTpP+7XBv7KzcEZ5BJa0bljl0Hh5YjKPV
	UeCdK3ncSn2egyP0byAAI6rw2HJdWZv/TSdMDNWGA3bHdq3eU4vYTMrUAk1FEj+mXja55dbB8ud
	GaNRfyXLKf1vHEEsncUl1t6Hu5bKsAtNO5A2AOT0XhxPpSoQkOZ5D+p9JgCq7Ee8I8HBwo8RwVo
	=
X-Google-Smtp-Source: AGHT+IHX+OpT7K19yydnzy+psqVpStq59olCev5VC5wN6FATIvbdpym0kYv3N0K9MfItgnSgiMs2Bg==
X-Received: by 2002:a05:6000:184e:b0:38d:d767:364 with SMTP id ffacd0b85a97d-390ec7cd0bcmr5447965f8f.13.1740829428873;
        Sat, 01 Mar 2025 03:43:48 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm8002871f8f.20.2025.03.01.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 03:43:48 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 01 Mar 2025 11:43:21 +0000
Subject: [PATCH v2 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-pinctrl-fltcon-suspend-v2-3-a7eef9bb443b@linaro.org>
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
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6945;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=WQiMAhEABATibxf9rK2qY4X4q9LA1nT3D1jg8dWK8TE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnwvLrfpYm0YyTVeiAj1A7Ag9aSpY7VSix6xhfw
 eZen8OONlCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8Ly6wAKCRDO6LjWAjRy
 ug09D/9g2XLh/S/e21WJPNg/JLGMHnmgmGrxTD1hI2pdfssjjxykj5a1IQIHhclFa3fh1NGdNoa
 JJW+wvLkX5DwhiZNLmKkQpMWMicIEo/DdFACmLH0mpfQApX443hdyd2MDQy+tVXj+brjiTl3GiQ
 Czugm+HOpinux9oHRy0UBjIJ9kU9ZB+BHcf6ZN0ho57T4SjHq/yy33YvBb+q6Zhh6r0x2D9W7lH
 Z8ytM5T7tTXFLV95lWqlB4FQMc9Ljx7jxJPfm8wSgTvdLcUT4kTkDhbJBwTR5syy+LVSjrtlhXv
 pVfeV1PT8dgsvcsIrsRbjElFHfcPoA7qzsBjdi9zbVFTbGIoeUihuQdvKbRhH0sRqawsKQBrgx+
 DDtpSKKqobukBy9cfZshP9Zoa6NJ4t6GJydyHyvOLNi48mzHswG7OCMW+wYBFNOYyDI0frAeNlg
 nlsZGaYv3OJfPvOnrDYVnKYERGiHqv0prrS3sg0jpQX5d94IClgZIEAOb1nnvvgK2e4ZSPWW5Hp
 cu9Tdok5OAik644hkqsvHVNbEAkwHgEWn26YFjJFdPUhNkhFjwJn0JeqicNnfTHYbuLFlSzmP0V
 CKFtZSI2hhvU/S0GHDwIKx5+iQOB171VcufbY/Zszv7a4FR2K9W9A9JpRFK2XseMTrY5YZ8RE9d
 pULSiyl+x3SHCqw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_034350_207291_EC122702 
X-CRM114-Status: GOOD (  16.03  )
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
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 71 ++++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  2 +
 3 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 57c98d2451b5..fca447ebc5f5 100644
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
index d65a9fba0781..ddc7245ec2e5 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -801,6 +801,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
 	}
 }
 
+void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
+{
+	struct exynos_eint_gpio_save *save = bank->soc_priv;
+	const void __iomem *regs = bank->eint_base;
+
+	exynos_set_wakeup(bank);
+
+	if (bank->eint_type == EINT_TYPE_GPIO) {
+		save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
+				       + bank->eint_offset);
+
+		save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET +
+					   bank->eint_fltcon_offset);
+
+		/* fltcon1 register only exists for pins 4-7 */
+		if (bank->nr_pins > 4)
+			save->eint_fltcon1 = readl(regs +
+						EXYNOS_GPIO_EFLTCON_OFFSET +
+						bank->eint_fltcon_offset + 4);
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
+	}
+}
+
 void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
 {
 	struct exynos_eint_gpio_save *save = bank->soc_priv;
@@ -820,6 +855,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
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
+		if (bank->nr_pins > 4) {
+			pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
+				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
+		}
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
index 35c2bc4ea488..773f161a82a3 100644
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
2.48.1.711.g2feabab25a-goog


