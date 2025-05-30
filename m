Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D29C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=; b=Hqss7yp4abkuQU9gj6RP7/J5r5
	hjUfunnij9HYmI1VFLhnNRVByEgXgvECpxXD4QbN8sghNpn2ljx/uatanHaA6syW/gNHPh/s5k0g/
	AgAbm4RJh0FxpeLI0qUyIo+dfICGcLm3fA4Ed+g2JGBxgdwPGV5/N96H3VD88NRwxX1K7hrYeBEzF
	LPRtkYoeJCy6nqGkounXbAu9sPGwdVsK5f32ThswGtbynwTI6SloHzUcGDw+Ryg7dT+I8R5nxtCCK
	Pi1KO8qOtYR0EhyBxK2/Fm9yeZIwUXpwmDDiVYw8rg4eR+IQQ7r0xuBfyF22C1VrPL76CLxVyjHY+
	T+RgKmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxsS-00000000Q2S-3ZGD;
	Fri, 30 May 2025 11:26:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxm9-00000000P91-3It3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:19:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so571510f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603988; x=1749208788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=;
        b=KqSLR9saupYfq7G46RoJgtlWkr6ZtEr5HQkT8Z+lXK0tEEoN2Ypv+Ql7CvqmzX+MZL
         rdDPsWTe3VB3R7oVqoQr5AGLvL+j2+OjmNM7gJrcZywFSOn3agaNz4/ORAS1IkuxAdIE
         RjB40XMJ53x5n0Rv7iYXR/DrpiuaqxdMEODf8u05GSGODfScyiSt12zptG+W4Wl46bRP
         vhiAgTx62b1ZwloNU2exsoVvpmQPPQFjPXgzCglv4vt0BJQwim1Lyco5ZIIUU1DVPXn7
         WET8q/Pcy3B5aaN3QkLP+a7gCMjy8+S+LxDS9sKgMY0f8suOJRSBbt15KORCob6mdVyJ
         YVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603988; x=1749208788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ/+G+AC3goiMLAvY8TZZVygk03XZkoKHyxtdwV9Bko=;
        b=u7u7wsqaEDFIVSKR2R4+O7wb/zdI+H+dO68o/CA70SS/q2YPhZlReqGWGon7hpFGYt
         k9Ap7sB/Bly8qPSa2JFmoYiG8xK64nJS10Tj42DKj00rGln0mkFM5aWloMky2XVWb1XG
         gwo8QjvxoT8sN8U0eJuNqqHN70ZdHqRlquxRE1zjP26paXRI5sP1yxSogZyBjcqLaRf7
         U0YLflA2kWWvHm/W6X4nzW4bPwHYkZQBsIRpKWkXdNIU0e/6AacinkAw0DQr4y9fsnBo
         IGWdcM6RLAmyeOHRPNN4GNdelbU51/LoY0vmSH06DPpdiYh1rlSz31Aahbjx8UKvon6z
         UFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsVca+HEX/jV3dEyDpnsfXNaauzqO1JQHuCcbGLldy9Z8K5Vf3di7Qzym1ZoI8SCNEu0KBYDF6F4SF9u4d1sf4@lists.infradead.org
X-Gm-Message-State: AOJu0YycCPRcY8YUKy5qDJMsjmddHF2NOGpe0ZuDjU9xAFvTzEc+8+PP
	+ukH7e1IwEwYiBPKN+aAwDURrAJRmwYsy7O1d2ACgnWso2Ys9lAmbjNr3mTPwt0Bvg7d3jIRoyW
	aa3yt
X-Gm-Gg: ASbGncuGB2Jvtq5wk3dd9Br5KQANMkV9mtu1sngvjfXhsMb172X9Lqekh3AEj1ChHBp
	jPCyurrYB26hN6Rqq+mBMEuadZUXvtZhnRVD8pNTFXYeIBudUK31uqUGjc6blX4rhVn1mwUwXdl
	Fv/Bor11pyeasec2lwS0+/8vbW1JvuK6l725zv4ZKMSAvJ8vraA3DOiLX46KhllDPkV9wDV7Hyy
	HIrQr1V73mJ1Q5qcNonWADfQZ+XCdWfaCSdZ3B2snNXnujEgE3koiv+7zMk0KvXdfZKq1Tu6USm
	hniAnV+3mN+WoMaPA6yve6qCgvkyPXZ6Ux4eAMrcv+SMkusjj+MJ6tpmWN6/TwyH2WlPOhieBmW
	v0emdUw==
X-Google-Smtp-Source: AGHT+IHmpme3ASdZjXhpIgvfrfPC8BzS2kR2b9/W6J51HT2LhURSK9ofZ+2PJlI42CY77vECWpRGwg==
X-Received: by 2002:a05:6000:4029:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a4eedb8a81mr6645254f8f.23.1748603987781;
        Fri, 30 May 2025 04:19:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:47 -0700 (PDT)
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
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/8] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the PCIe
Date: Fri, 30 May 2025 14:19:11 +0300
Message-ID: <20250530111917.1495023-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_041949_826073_3FB64EA9 
X-CRM114-Status: GOOD (  13.75  )
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

Changes in v2:
- none

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


