Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFDEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOc5JswKnDA4H+vLGsg75xhpVAwF1vf0JvXpUApvXDs=; b=BM0AOR2n8dLvCTgkBeSF1iF2Wd
	zHKL61C+X3xBsBgW2go3eKk1KGuqLXghYBmiCM119JjkKpM6+Dp7qcm0AcKOsoB3utGGPwZFgBTob
	33MfECpWv21cEuesTM+QlyiznIx2+u3MFwluVq5klXnJUoUY7+tkTU45zRE265FhnlH+C++S3Y9VD
	0O11Y5AVVyw3s3tF5OMmoRfu6FkmP8SK3jgPc6mKap/J1LzayXbekah1lMJGINesWPB/dGfkjygND
	ox2iMX46lKE/88Sh+bHHXvn1EafvwwWOuhktczwsZgeV+z72JdcMLozhFzx1Zp1U/1EaCforYMfwe
	ChLi40+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV3j-0000000Dtp6-2dLH;
	Fri, 07 Mar 2025 10:36:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUxN-0000000DsNe-3s1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:29:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so13889885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741343368; x=1741948168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOc5JswKnDA4H+vLGsg75xhpVAwF1vf0JvXpUApvXDs=;
        b=YA5miDu9i+dNUCE6mPsMP1eypNpdoLt5FPVwHcdKEk2JYK7U/IpB/Z57TO6yYB/hAX
         Rtm7/DG8aHUfrQGDkx9BUUyLOUImND02CfwKO9qGhJVyQYvFXdGdwe+ErTCi1rXP0Rsd
         Ea9nhrWFKSrQK6U/IDI1i2/d55QNKvxazSXRXkfDG6xdI2U0FfnVs1blK7RNSsdMDDP+
         NuYtUsEorj5bjO07T7Q+7o1YJ/oOQTVPVGG1c74ky989D3lN2kS3B165D9aEC0DGv5CL
         w6IzOmhJyJ3ne8rg9z93X/BEbLfa0/tEzUYv3xTKb2wLVmfT2qLXKpV9wa3vOFiNkt0T
         KVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741343368; x=1741948168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOc5JswKnDA4H+vLGsg75xhpVAwF1vf0JvXpUApvXDs=;
        b=MMtFx7z89e0lNC+0Yxl3EqbuKYxAaz+I4F3t9P2d0FijCahjZkAkvHaHar4+aofO1W
         Mm/PjGKBpud5H0dsmO1TcTIhHB2cuykln4tadL9EwqE1AFQhXII7fqBi+O+TZrT1Aw28
         OXGtUWOUMhVI69RHJFx/daiNehWOx+9XWCWwd3yRn1cO+reHSaeXoMldqGlFFCP984Np
         93TTnc67ci+4OejJW8NI852dioOfmmAkaoO5vUqR2oQ7JQdOYkV6lKuTBztuKaSSqFG4
         pdBe6U2NfWRAqXY53KScxd5YR1F1tENnR6UB8o1JkAihGXX9aDHhdTLPTDIxUjzZKdTt
         lUjA==
X-Gm-Message-State: AOJu0YzlNjK0cdMe4OFcA8hRd5cApBzwd6Tx/FhPE3B2L9bkj/tkK5kr
	yeD05yGQcXIy788YkXp5XN27AMbtt3mWbm4f6XJkKfBEQMCS5MB5nop/2BE9DjU=
X-Gm-Gg: ASbGncvaUq6dDODbmTOf+Qr/nCGOSsmc5uSXk4wLBv3EZBfXM0lJpRgvYb+DUKjFtm3
	uHlCNTREA06RUt1xVOKOF3CECu3n688hGwtien0AV1U+WUNlKRCQfsJLWXmLvgWckrffeRex066
	2w50CEsa20JgtKhWvqGg3ZAOoOxbf8cfQ4EKDBtTa+hf0HAWOvBjLqkwthyi8WVjTLJnb3idZ7C
	pLp2eXR8DO6fs7ZB6Nj9Hv6Ezek8eVreawsQsKWM4+P60zotLTqH05oWSflfyJj39VxCA2CxteS
	JbvpOxdK1BN8j+xhoGqKeyvnEFyVJIUdoAj1zwG40h0GFO3lntp/N2TUFJo9zw+9vaqLgwBLiwI
	=
X-Google-Smtp-Source: AGHT+IEDjIydZyO8tevIfkIq4dv+j9dQjTmzyABCpR96qJ7XQw5e0qvvubHLPigP0m6YKTDQV3Lu3A==
X-Received: by 2002:a05:600c:5857:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43c6de39734mr18301675e9.2.1741343368303;
        Fri, 07 Mar 2025 02:29:28 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm49192955e9.4.2025.03.07.02.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:29:27 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 07 Mar 2025 10:29:07 +0000
Subject: [PATCH v4 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250307-pinctrl-fltcon-suspend-v4-3-2d775e486036@linaro.org>
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
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7443;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=5hPOCM1S1pmc1S8RzEq8t8D72yqSF8b6KhQM50bjrdw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnysqALrYS4PAAAK03uKqVFDBA1lA/Q4rTqdKug
 ndPT2Rx3AOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8rKgAAKCRDO6LjWAjRy
 usflD/9oI20ugy/mZ2pMSJJTiyGUQP7ZbgMDGHZCKXWK5L+JJAwnG8LDkGVfe5R3IeoifLxtf8J
 Fi+svFPN+9afcfIMcOM8FIRjtjihtqw6Q/P9jaO0+MNqioD+KajVnNniijLUVEW0WYoSPPod7L2
 wnhI/I44YRydoLoUSCiT9KGQRT+SuYXAve5a3YMbux7JUQjRiER1b1BiQ8MzILAFrznAT9uo3p8
 kLcPNDnJSG635E8Ko5W9Jz7haXhMponBYVbRxAZ+TkDhyC6VSJDN6tyZcDuRpgR+16vuxt9tDDK
 6q00TDduCjyTOlrSbcExqq6Hfv3Dgkn5YgoKiWe0hQs8dsM8yhGZ5OX6t2PgnFbtf+vK78M6KdQ
 MkzYrrYyxXfLf1Omwst6kQRvJazjKJF+cRCdWFU0iK62216TXPD2tYSKyD1P6C8E/MvOH3yU2UY
 KUNz5p8QoHTQFVnad5SBSWg43mWU1SS84Ro+oyGqXq4WrtVNINKucNufg/U0Z5QAbhU9B9poYYw
 Ov+bDmf5MMAYqogI/izBx6tIG7Nk3VDF6KtylbRtRCZi+W068z5vnrNcdWA4QYmZzrpQ2fuE/fH
 0iZ+nckrxNZpuO+NZOQJB8JG1nhQXL1ghoEZa2G13QQ/2g85Mtvdz8AJp4i6tUIZFH4mOIT0Wfx
 jtsbirq6sNP5bTg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_022929_961637_D943CCEE 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: stable@vger.kernel.org
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
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
index 75b9ab19e4e8f81bf85cd75573485b7f2e717e7b..5f0045d03346600557fa6735bad709897c71935c 100644
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


