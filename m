Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E39C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeYXWrbDPIe582+hLadmsueMm8iAc4fIl9vPeooNz1Q=; b=WCGMVMIx/F5nVATC0k1bi5hVOF
	RrNrkAbVYQYYvkf96CA2woRit+PdLgsJdmc/Rdf1RlAg2IAp4ripXLkMmBSXzJm2+OAWB8pE9r49j
	/uYIy0dDxmORVY0NJphLystWNO+Ho/pGZMI6WbIq62NMgBOq2sapW74rop9CegJC07sFt8fQlQUzZ
	kuOKcudYMUJi1kYCkCMayv6mK1kIShC4ycNlmVuduULpwABpbc60sg2VEC1gXwtLW4KU/YWj0e0bp
	QHfWm/EY3yGt5RKvpcAh0TbWJQpMraoqMwaf2ExVfJxum3r0n1MaXnI6m2tnT85PWbiLiJd40iKlw
	gKdD/PCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gkO-000000091Ie-3vkH;
	Tue, 29 Apr 2025 08:55:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gef-00000008zt5-49G9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:49:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso5960447a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916568; x=1746521368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeYXWrbDPIe582+hLadmsueMm8iAc4fIl9vPeooNz1Q=;
        b=QxYIGir0q4UVLh9QFfkpM1+FhgbuOc6e1rn/FYahXGyNWKbHhKUYOjqy9CHYcXHyE5
         B/zYZxqK/46a1wnhYa5YJ0dmuHVU95VL/v2f8kiQKrzWXgxaKm8nSkuwWbE+vNQnp7vP
         Fqg68xmLEWBQLsLfFyvgEbe44FjzhdsFr3xe0XgIR11GeMVK48dxlCuyNR7sIoNdW4Et
         WUaBX3h54a1Bxf3dxrh66Y8aavM5GcI85vMydLc0+fexeDZ6wWDStmu0MH5Lo5reH1eg
         XAjdB31isTHYN2hJ8UXW8tNRt2ftBbHJkXYDzPSaVy72jyJBnFVzQ2WhRKvDTkKZMzpD
         xZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916568; x=1746521368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeYXWrbDPIe582+hLadmsueMm8iAc4fIl9vPeooNz1Q=;
        b=Hd3RZDUE/gNjUUPeOKQnoflhuK6ykFQDBw3SNsELHJPS0tnQ6EjJrZvt1hmDyinFue
         UQWadp2GOZwlQay/owYtjOFRZnHRSLkUE21tvD/cP3lMczgHy0bDUxXAzdtpdi9vVAIw
         /qhfzYGjKr9aIfNV+O6o1KGDc/QDYe0jDzxQ77CWX3TGIs61HnF8EjWRnl0EICuGkP3U
         gXFHlT+HBah3NlvPT0oDhXaStIIwcx+o2WxVQVRDuZpgBzbhit7UBlnNhB1V4/zWeIZU
         daTRh92vBLqTa22RxbhQ/oi7/p1YafJcc+fxgina6mgc6KXBNW5lglOW9xchRnR5AQS0
         sQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCX3I5221QulBU706Uq3eOTLPJilh6QKqpgGcLNdqUMVp0XuXwFbGjsWvWk7CQ6xjvBLuA1MmlE0p0Fyo08Zga61@lists.infradead.org
X-Gm-Message-State: AOJu0YywNF/Shi0VFn/fiJtOHqxJGv5223LSSeah3SRb8DX1MoUkd7ZT
	NH+Qru4zIeS5SE8CpQ52ADzJiQ+Jkz+sVbuSe1n4eCzbrhQpj1LXtrYmwI6ciow=
X-Gm-Gg: ASbGncvts6iCBGQCLLyhFIGrnSjO0tYEq3oVDUApPHXSX0oHI1p2ZdRzzr3pLK1nWfN
	Xu7rczfm8jMvUDDYcMAlmRUmPMjcofEDqA8jD0zYdXuQCHaWyh43GYrPaUf23uQIZaBw0ih9f3i
	MgDXuLFkM2fkODh59qQLeWdDAnGbtuHnqe/ssG9DQ945xv0cyRS/Em1/+E7CiKcxOjNrXpI2LYR
	edlHFt5mTt3sqpRUw9GgFhBfKduHnVCUyAz9PkwhXoGsxOtMEfRZ2UiFkC4eXo2+4mxxiKmAA3t
	kV3gFkG/mTjorrLnGp6BfzN3/CZHaC4Mul4hIAhJLGspQxJxw7nKeVHqdml401ei7Nkvh/hOaow
	fMGZGJt1p9imzvGfzQZrstIH/
X-Google-Smtp-Source: AGHT+IFzsdzLq0N4FqNybCrqo3s1JLy/WZZPcFkAEx21WO1BYxDl4k17etxA0M+ge3novFvtYXCeWA==
X-Received: by 2002:a05:6402:2685:b0:5ed:599a:3cbe with SMTP id 4fb4d7f45d1cf-5f839224516mr2358189a12.4.1745916568451;
        Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:49:25 +0100
Subject: [PATCH 2/2] phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP
 where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-exynos5-phy-field-prep-v1-2-39eb279a3e0e@linaro.org>
References: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
In-Reply-To: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_014930_024142_54DF8134 
X-CRM114-Status: GOOD (  11.71  )
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

Commit 9b6662a0f715 ("phy: exynos5-usbdrd: use GENMASK and FIELD_PREP
for Exynos5 PHY registers") added FIELD_PREP_CONST() in many cases
where FIELD_PREP() would have been more appropriate. It also switched
existing uses of FIELD_PREP() to FIELD_PREP_CONST().

FIELD_PREP() is the preferred macro to use whenever possible while
FIELD_PREP_CONST() is meant to be used in constant initialisers.

Switch (back) to FIELD_PREP().

Fixes: 7e6c2ffe6c22 ("phy: exynos5-usbdrd: convert some FIELD_PREP_CONST() to FIELD_PREP()")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 62 +++++++++++++++-----------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 4ea1fabd4d6f9c9fe412f17d4d26be07724b6361..6cbe563a7bd0449248d6b41c4f6785c91ccc47ba 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -540,8 +540,7 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 
 	/* Use EXTREFCLK as ref clock */
 	reg &= ~PHYCLKRST_REFCLKSEL;
-	reg |=	FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
-				 PHYCLKRST_REFCLKSEL_EXT_REFCLK);
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_EXT_REFCLK);
 
 	/* FSEL settings corresponding to reference clock */
 	reg &= ~(PHYCLKRST_FSEL_PIPE |
@@ -549,24 +548,24 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 		 PHYCLKRST_SSC_REFCLKSEL);
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_50M_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_50M_REF));
 		break;
 	case EXYNOS5_FSEL_24MHZ:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_24MHZ_REF));
 		break;
 	case EXYNOS5_FSEL_20MHZ:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x00) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_20MHZ_REF));
 		break;
 	case EXYNOS5_FSEL_19MHZ2:
-		reg |= (FIELD_PREP_CONST(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
-			FIELD_PREP_CONST(PHYCLKRST_MPLL_MULTIPLIER,
-					 PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF));
+		reg |= (FIELD_PREP(PHYCLKRST_SSC_REFCLKSEL, 0x88) |
+			FIELD_PREP(PHYCLKRST_MPLL_MULTIPLIER,
+				   PHYCLKRST_MPLL_MULTIPLIER_19200KHZ_REF));
 		break;
 	default:
 		dev_dbg(phy_drd->dev, "unsupported ref clk\n");
@@ -590,8 +589,7 @@ exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
 	reg &= ~PHYCLKRST_REFCLKSEL;
-	reg |=	FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
-				 PHYCLKRST_REFCLKSEL_EXT_REFCLK);
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_EXT_REFCLK);
 
 	reg &= ~(PHYCLKRST_FSEL_UTMI |
 		 PHYCLKRST_MPLL_MULTIPLIER |
@@ -647,8 +645,7 @@ static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 	/* Set Tx De-Emphasis level */
 	reg &= ~PHYPARAM1_PCS_TXDEEMPH;
-	reg |=	FIELD_PREP_CONST(PHYPARAM1_PCS_TXDEEMPH,
-				 PHYPARAM1_PCS_TXDEEMPH_VAL);
+	reg |= FIELD_PREP(PHYPARAM1_PCS_TXDEEMPH, PHYPARAM1_PCS_TXDEEMPH_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
@@ -669,7 +666,7 @@ exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(struct exynos5_usbdrd_phy *phy_drd)
 
 	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
 	reg &= ~SECPMACTL_PMA_REF_FREQ_SEL;
-	reg |= FIELD_PREP_CONST(SECPMACTL_PMA_REF_FREQ_SEL, 1);
+	reg |= FIELD_PREP(SECPMACTL_PMA_REF_FREQ_SEL, 1);
 	/* SFR reset */
 	reg |= (SECPMACTL_PMA_LOW_PWR | SECPMACTL_PMA_APB_SW_RST);
 	reg &= ~(SECPMACTL_PMA_ROPLL_REF_CLK_SEL |
@@ -799,15 +796,13 @@ static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 	/* Set Loss-of-Signal Detector sensitivity */
 	reg &= ~PHYPARAM0_REF_LOSLEVEL;
-	reg |=	FIELD_PREP_CONST(PHYPARAM0_REF_LOSLEVEL,
-				 PHYPARAM0_REF_LOSLEVEL_VAL);
+	reg |= FIELD_PREP(PHYPARAM0_REF_LOSLEVEL, PHYPARAM0_REF_LOSLEVEL_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 	/* Set Tx De-Emphasis level */
 	reg &= ~PHYPARAM1_PCS_TXDEEMPH;
-	reg |=	FIELD_PREP_CONST(PHYPARAM1_PCS_TXDEEMPH,
-				 PHYPARAM1_PCS_TXDEEMPH_VAL);
+	reg |= FIELD_PREP(PHYPARAM1_PCS_TXDEEMPH, PHYPARAM1_PCS_TXDEEMPH_VAL);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM1);
 
 	/* UTMI Power Control */
@@ -838,7 +833,7 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	 * See xHCI 1.0 spec, 5.2.4
 	 */
 	reg =	LINKSYSTEM_XHCI_VERSION_CONTROL |
-		FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
+		FIELD_PREP(LINKSYSTEM_FLADJ, 0x20);
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_LINKSYSTEM);
 
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYPARAM0);
@@ -1145,8 +1140,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 	/* Use PADREFCLK as ref clock */
 	reg &= ~PHYCLKRST_REFCLKSEL;
-	reg |= FIELD_PREP_CONST(PHYCLKRST_REFCLKSEL,
-				PHYCLKRST_REFCLKSEL_PAD_REFCLK);
+	reg |= FIELD_PREP(PHYCLKRST_REFCLKSEL, PHYCLKRST_REFCLKSEL_PAD_REFCLK);
 	/* Select ref clock rate */
 	reg &= ~PHYCLKRST_FSEL_UTMI;
 	reg &= ~PHYCLKRST_FSEL_PIPE;
@@ -1169,7 +1163,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	else
 		reg &= ~HSPHYPLLTUNE_PLL_B_TUNE;
 	reg &= ~HSPHYPLLTUNE_PLL_P_TUNE;
-	reg |= FIELD_PREP_CONST(HSPHYPLLTUNE_PLL_P_TUNE, 14);
+	reg |= FIELD_PREP(HSPHYPLLTUNE_PLL_P_TUNE, 14);
 	writel(reg, phy_drd->reg_phy + EXYNOS7870_DRD_HSPHYPLLTUNE);
 
 	/* High-Speed PHY control */
@@ -1187,7 +1181,7 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	 */
 	reg |= LINKSYSTEM_XHCI_VERSION_CONTROL;
 	reg &= ~LINKSYSTEM_FLADJ;
-	reg |= FIELD_PREP_CONST(LINKSYSTEM_FLADJ, 0x20);
+	reg |= FIELD_PREP(LINKSYSTEM_FLADJ, 0x20);
 	/* Set VBUSVALID signal as the VBUS pad is not used */
 	reg |= LINKSYSTEM_FORCE_BVALID;
 	reg |= LINKSYSTEM_FORCE_VBUSVALID;
@@ -1350,7 +1344,7 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	/* Set VBUS Valid and D+ pull-up control by VBUS pad usage */
 	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
-	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
+	reg |= FIELD_PREP(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
 	if (!phy_drd->sw) {
@@ -1367,19 +1361,19 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg &= ~SSPPLLCTL_FSEL;
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 7);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 7);
 		break;
 	case EXYNOS5_FSEL_26MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 6);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 6);
 		break;
 	case EXYNOS5_FSEL_24MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 2);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 2);
 		break;
 	case EXYNOS5_FSEL_20MHZ:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 1);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 1);
 		break;
 	case EXYNOS5_FSEL_19MHZ2:
-		reg |= FIELD_PREP_CONST(SSPPLLCTL_FSEL, 0);
+		reg |= FIELD_PREP(SSPPLLCTL_FSEL, 0);
 		break;
 	default:
 		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",

-- 
2.49.0.901.g37484f566f-goog


