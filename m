Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA39C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Xu0lwXfHypam6aFf6MDeNeMIOVtEqILdYrrYMjhy+Y=; b=jKhVenEV6LlIKcSmpRaO7zNLeV
	PlrPDiwxwHfBQKbzANd8YNbCExf6aTfj/yB/Hftz9+H48MXEEeMezEYRPzedKr15HeD25uhqFRqWu
	7uFP1QfbsXzH+uq2se+rVYOrqfCTT5+JWeUcaMTMeNPrkxxPSndRQ8m4JfGNJ+NH0hOfIl0DzaWxA
	DPZ6N/yogycuXXoyMDkCVze1aAvjJgbbeKuQkiQuX5aviKdXb/ZwNcx5mIMgHfWRpTWVDmei7AVYh
	VfYe5eA4eNPfGrRET2AltmusGIyuXIQ3ltiDfmDGcPzcIay0mk55PYi7OnVekONJ0T1Brtaud7dLM
	O8a7p8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5TM-0000000Cf0J-3YYA;
	Wed, 30 Apr 2025 11:19:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kT-0000000CXiY-2ElG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:33:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac29fd22163so1062720266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009184; x=1746613984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xu0lwXfHypam6aFf6MDeNeMIOVtEqILdYrrYMjhy+Y=;
        b=bjB93u9pn99q6l3WBauIw8qVVSFw+7iAKzQRWiyp3bxgW/hXvccOEorARoYAxkbcLd
         EQVG4yImLEsL/7rYL5TKqdePbUgMjKFf3JdNNEfZ4LXSnwLYSyfHOHEJuhr4MSbXN/3X
         /T8fKVA7mfpl5R2J1lRtRL5Xr1jcxfxDGot7CsODsNgLad0PvLQEMaYR4dY+3yATAq49
         ADCJlbJt60RpYvZpWXx10M0JUkKN3h+Swggdsr1LDopdK/ddGit5IyPElCQzxyzbgtUR
         bllBzPlKFunIX4dzkD/sVQJgeeksUplbQAli4doiGLPmxcvWc+/48jh4673c8kjfD0bJ
         k47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009184; x=1746613984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xu0lwXfHypam6aFf6MDeNeMIOVtEqILdYrrYMjhy+Y=;
        b=SLemwMeUrHQg5BmWqvODw2ECqF8JPseO++g4144DzG0IM7lIxwI++gL+g5y1dkJWrU
         N/QL3aPKL6SQKjQitydmSWw0n5xbpVxRn4Aw31aks1twVzB5auq75VEM8Xob/Sd2QwwP
         H4onGmTZsxvZXc80a6EuDI7CrNwSGiRNx3TVE0SuRhFrVoreUpyHCCHyeglPe6HjFyHG
         EFx/hHEvbh81nQrxjntWupDF1amc1D19IWKb+GJlySqcxcATtOtYPUvxyLyQ8+mO5EcE
         Dz1H16mXi95t+DNh4Tevft8UIGCgjjenIUziZ26swXpipI+CkZtKTkgkyMbySOD3CsPd
         D9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWr7L8p+ftKT2TQIXL6iW16ET8nDqKCepkU1Cjojvs38zuCcJqGKcouXHVTEihC0Xwx/FfevGwLVWhAijPosf6k@lists.infradead.org
X-Gm-Message-State: AOJu0YyeNQ9aD56SWYED5GjF8HzQHn7lGr7RyGjmoMDl2r1TOQKJC5LA
	OtieRei8pmUKEoiijrtNOHKB6MNXNcN1yYH47Jc2HkLNrMnJAIaseDbngLXAgG8=
X-Gm-Gg: ASbGncvGM/49eXUy0HTbO+04K99PxouOka5dCnmkszve3xJrWgG/7HK/+34fqTOeJMx
	G77CUkSlzEI7bPQKLhFwsd6FCJZDenjyL/unXWbSSOv8tvUkr9xgsP3/KshwIWeokdKPYYDa7tE
	9uAVdluU78EV7vJFJutzM7cPX2OIUJIMe68TD/wAjRD+RUv67XU/euQk/VzFH4htXfWhpAK5wst
	8UjOZ/h9dSfelk13Qpb9szvYNQYMW38H2jzkrreVz6SU0iJcn1op0TtsmhexBQJ7OTArLH+NgL7
	gAA8ohu7ggZkH1Yf4dmKbzF5PQQ0ov4A/QZRRPvu9FqLbCINUT/BWetbhaf9NBQraW5GzcI=
X-Google-Smtp-Source: AGHT+IEiP6Vgn86q0Y+9iOsEDH1SApC/mbVRMzQBBXjANsWv64cM9/IPsj3x7m/5obY5CmIm9XqGUw==
X-Received: by 2002:a17:907:9805:b0:ac3:422a:76dc with SMTP id a640c23a62f3a-acedc65297fmr255856866b.34.1746009184102;
        Wed, 30 Apr 2025 03:33:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:03 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/8] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the PCIe
Date: Wed, 30 Apr 2025 13:32:30 +0300
Message-ID: <20250430103236.3511989-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033305_574930_F4A4E759 
X-CRM114-Status: GOOD (  13.06  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add clocks, resets and power domains for the PCIe IP available on the
Renesas RZ/G3S SoC. The clkl1pm clock is required for PCIe link power
management (PM) control and should be enabled based on the state of the
CLKREQ# pin. Therefore, mark it as a no_pm clock to allow the PCIe driver
to manage it during link PM transitions.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4035f3443598..33219164a19a 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -243,6 +243,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
+	DEF_MOD("pci_aclk",		R9A08G045_PCI_ACLK, R9A08G045_CLK_M0, 0x608, 0),
+	DEF_MOD("pci_clk1pm",		R9A08G045_PCI_CLKL1PM, R9A08G045_CLK_ZT, 0x608, 1),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
@@ -282,6 +284,13 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
+	DEF_RST(R9A08G045_PCI_ARESETN, 0x908, 0),
+	DEF_RST(R9A08G045_PCI_RST_B, 0x908, 1),
+	DEF_RST(R9A08G045_PCI_RST_GP_B, 0x908, 2),
+	DEF_RST(R9A08G045_PCI_RST_PS_B, 0x908, 3),
+	DEF_RST(R9A08G045_PCI_RST_RSM_B, 0x908, 4),
+	DEF_RST(R9A08G045_PCI_RST_CFG_B, 0x908, 5),
+	DEF_RST(R9A08G045_PCI_RST_LOAD_B, 0x908, 6),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -358,6 +367,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
 	DEF_PD("tsu",		R9A08G045_PD_TSU,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
+	DEF_PD("pci",		R9A08G045_PD_PCI,
+				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(10)), 0),
 	DEF_PD("vbat",		R9A08G045_PD_VBAT,
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -365,6 +376,10 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7)), 0),
 };
 
+static const unsigned int r9a08g045_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -381,6 +396,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a08g045_mod_clks),
 	.num_hw_mod_clks = R9A08G045_VBAT_BCLK + 1,
 
+	/* No PM modules Clocks */
+	.no_pm_mod_clks = r9a08g045_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a08g045_no_pm_mod_clks),
+
 	/* Resets */
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
-- 
2.43.0


