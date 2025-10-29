Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E22CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcXEPQyqf6GsKaleSSXSU+xfwkXDy5QAKjsevcvEoJ4=; b=uU8JX58iGs6F8XOewdWXqMhiEm
	8wTM5+bbr34sa3ANSHIB013YC1Tk16n/9Cktnn/6JrHRbM8VsliH5VlVtDR48wpU4RYuXQVC8zyWF
	hpmT4gYAsHwTaMj9ct+9ZtHkV1bnfEKDLNgNNAWEPOkr0r6fWArtWHr8VETAg4SXe+mCRRgcX3yZC
	sSezKTLz2zTGx3YhXr8E5e+7gsDXgm/QFNO9RRmJyI9dAbGBJNHh/AZh1e1L7PENDf70y3/d/IInd
	zyYkvZt6d7+1VgwLkXta5jq1bHH+ddFPFkmeOkvbL4cd3NmXWJYKT6ZiZ9nCiCQQbiYBLUZi82plZ
	QqCm4WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5v5-00000001IAP-0B53;
	Wed, 29 Oct 2025 13:08:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5v3-00000001I9S-3ghL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 13:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fcXEPQyqf6GsKaleSSXSU+xfwkXDy5QAKjsevcvEoJ4=; b=o3N2m9fih0EnEGIVR1lAkbO2Ob
	P0KkaH+g3yfdtGJHwts2CRPVuLzMTDBSxdyjqmxhNuRp2rPq3/8tMtt8trGXLsAa8/fAcIkV+Dira
	TQVfHTnijmDCMx659R1xoWLpFZIxP3CjDThEYyQBXwe0/NVdZpfJfdVYgabbhFjzd92U9kGG20LDb
	D66nXPOZw4SaDP8obHM3i9wIoDAtxqd9DZHe62PUMm1utLAjujYm3LX8rFPN7fftm0qnEvPwwT0f8
	HirEidY6lIP7Y0tYEhS6GbOmz7KIqkBZFY8+IXkiU+EI8CASZhYK+xECytM5EvimhYRbrkCPr2nPj
	bgsK+dmw==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE53G-00000006lgX-49gW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:13:21 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251029130844epoutp04b997ec5867ccbba8116825c7c5951b7e~y_DhKcNTE1427514275epoutp04Y
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:08:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251029130844epoutp04b997ec5867ccbba8116825c7c5951b7e~y_DhKcNTE1427514275epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761743324;
	bh=fcXEPQyqf6GsKaleSSXSU+xfwkXDy5QAKjsevcvEoJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8sNyAL2JyGsJFiaKqtLi1LEPGA9TBjhStt6tBj9zMuHm54IhX1ww3/f4a3ZyQ78Q
	 KO56EIRU/c9gyZEfpxUnc/Ulmw5nixoX9s7yuF1mKp/VKqm7snraInTd+5JL+btDYq
	 WixtF7UZTmYbPwXwKs1kpMQwme5j7/E54I4m7Fvs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251029130844epcas5p39496dc6d57b0207e90cedd573bf0fc3c~y_DgaEXZ00997109971epcas5p31;
	Wed, 29 Oct 2025 13:08:44 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cxSHH1Bs3z3hhT7; Wed, 29 Oct
	2025 13:08:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52~y_DeOVX4_0507205072epcas5p4f;
	Wed, 29 Oct 2025 13:08:41 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130827epsmtip208825858d8db77b734a34cf778954846~y_DQ50pln1034610346epsmtip2W;
	Wed, 29 Oct 2025 13:08:27 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH v3 2/4] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
Date: Wed, 29 Oct 2025 18:37:29 +0530
Message-Id: <20251029130731.51305-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029130731.51305-1-ravi.patel@samsung.com>
X-CMS-MailID: 20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52
References: <20251029130731.51305-1-ravi.patel@samsung.com>
	<CGME20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_121319_836504_74D4CF4E 
X-CRM114-Status: GOOD (  23.87  )
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

From: GyoungBo Min <mingyoungbo@coasia.com>

Add below clock PLL support for Axis ARTPEC-9 SoC platform:
- pll_a9fracm: Integer PLL with mid frequency FVCO (800 to 6400 MHz)
             This is used in ARTPEC-9 SoC for shared PLL

- pll_a9fraco: Integer/Fractional PLL with mid frequency FVCO
             (600 to 2400 MHz)
             This is used in ARTPEC-9 SoC for Audio PLL

FOUT calculation for pll_a9fracm and pll_a9fraco:
FOUT = (MDIV x FIN)/(PDIV x (SDIV + 1)) for integer PLL
FOUT = (((MDIV + (KDIV/2^24)) x FIN)/(PDIV x (SDIV + 1)) for fractional PLL

Signed-off-by: GyoungBo Min <mingyoungbo@coasia.com>
Reviewed-by: Kyunghwan Kim <kenkim@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 185 ++++++++++++++++++++++++++++++++--
 drivers/clk/samsung/clk-pll.h |  17 ++++
 2 files changed, 194 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 0a8fc9649ae2..51e51ef48412 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -201,6 +201,9 @@ static const struct clk_ops samsung_pll3000_clk_ops = {
 #define PLL35XX_LOCK_STAT_SHIFT	(29)
 #define PLL35XX_ENABLE_SHIFT	(31)

+/* A9FRACM is similar to PLL35xx, except that MDIV is bit different */
+#define PLLA9FRACM_MDIV_SHIFT	(14)
+
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
@@ -209,7 +212,12 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;

 	pll_con = readl_relaxed(pll->con_reg);
-	mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+
+	if (pll->type == pll_a9fracm)
+		mdiv = (pll_con >> PLLA9FRACM_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	else
+		mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+
 	pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 	sdiv = (pll_con >> PLL35XX_SDIV_SHIFT) & PLL35XX_SDIV_MASK;

@@ -219,12 +227,15 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }

-static inline bool samsung_pll35xx_mp_change(
-		const struct samsung_pll_rate_table *rate, u32 pll_con)
+static inline bool samsung_pll35xx_mp_change(u32 pll_type,
+					     const struct samsung_pll_rate_table *rate, u32 pll_con)
 {
 	u32 old_mdiv, old_pdiv;

-	old_mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	if (pll_type == pll_a9fracm)
+		old_mdiv = (pll_con >> PLLA9FRACM_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	else
+		old_mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
 	old_pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;

 	return (rate->mdiv != old_mdiv || rate->pdiv != old_pdiv);
@@ -236,6 +247,12 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	const struct samsung_pll_rate_table *rate;
 	u32 tmp;
+	u32 mdiv_shift;
+
+	if (pll->type == pll_a9fracm)
+		mdiv_shift = PLLA9FRACM_MDIV_SHIFT;
+	else
+		mdiv_shift = PLL35XX_MDIV_SHIFT;

 	/* Get required rate settings from table */
 	rate = samsung_get_pll_settings(pll, drate);
@@ -247,7 +264,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,

 	tmp = readl_relaxed(pll->con_reg);

-	if (!(samsung_pll35xx_mp_change(rate, tmp))) {
+	if (!(samsung_pll35xx_mp_change(pll->type, rate, tmp))) {
 		/* If only s change, change just s value only*/
 		tmp &= ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
 		tmp |= rate->sdiv << PLL35XX_SDIV_SHIFT;
@@ -257,7 +274,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}

 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_1017x)
+	if (pll->type == pll_142xx || pll->type == pll_1017x || pll->type == pll_a9fracm)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -265,10 +282,10 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			pll->lock_reg);

 	/* Change PLL PMS values */
-	tmp &= ~((PLL35XX_MDIV_MASK << PLL35XX_MDIV_SHIFT) |
+	tmp &= ~((PLL35XX_MDIV_MASK << mdiv_shift) |
 			(PLL35XX_PDIV_MASK << PLL35XX_PDIV_SHIFT) |
 			(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT));
-	tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
+	tmp |= (rate->mdiv << mdiv_shift) |
 			(rate->pdiv << PLL35XX_PDIV_SHIFT) |
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
 	writel_relaxed(tmp, pll->con_reg);
@@ -1428,6 +1445,149 @@ static const struct clk_ops samsung_pll1031x_clk_min_ops = {
 	.recalc_rate = samsung_pll1031x_recalc_rate,
 };

+/*
+ * PLLA9FRACO Clock Type
+ */
+#define PLLA9FRACO_LOCK_FACTOR		(500)
+
+#define PLLA9FRACO_MDIV_MASK		(0x3ff)
+#define PLLA9FRACO_PDIV_MASK		(0x3f)
+#define PLLA9FRACO_SDIV_MASK		(0x7)
+#define PLLA9FRACO_MDIV_SHIFT		(14)
+#define PLLA9FRACO_PDIV_SHIFT		(8)
+#define PLLA9FRACO_SDIV_SHIFT		(0)
+
+#define PLLA9FRACO_PLL_CON5_DIV_FRAC	(0x14)
+#define PLLA9FRACO_KDIV_MASK		(0xffffff)
+#define PLLA9FRACO_KDIV_SHIFT		(0)
+#define PLLA9FRACO_DAC_MODE		BIT(30)
+#define PLLA9FRACO_DSM_EN		BIT(31)
+#define PLLA9FRACO_FOUTPOSTDIVEN	BIT(3)
+#define PLLA9FRACO_MUX_SEL		BIT(4)
+#define PLLA9FRACO_ENABLE_SHIFT		(31)
+#define PLLA9FRACO_LOCK_STAT_SHIFT	(29)
+
+static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 pll_con0, pll_con5;
+	u64 mdiv, pdiv, sdiv, kdiv;
+	u64 fvco = parent_rate;
+
+	pll_con0 = readl_relaxed(pll->con_reg);
+	pll_con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+	mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
+	pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
+	sdiv = (pll_con0 >> PLLA9FRACO_SDIV_SHIFT) & PLLA9FRACO_SDIV_MASK;
+	kdiv = (pll_con5 & PLLA9FRACO_KDIV_MASK);
+
+	/* fvco = fref * (M + K/2^24) / p * (S+1) */
+	fvco *= mdiv;
+	fvco = (fvco << 24) + kdiv;
+	do_div(fvco, ((pdiv * (sdiv + 1)) << 24));
+
+	return (unsigned long)fvco;
+}
+
+static bool samsung_a9fraco_mpk_change(u32 pll_con0, u32 pll_con5,
+				       const struct samsung_pll_rate_table *rate)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
+	old_pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
+	old_kdiv = (pll_con5 >> PLLA9FRACO_KDIV_SHIFT) & PLLA9FRACO_KDIV_MASK;
+
+	return (old_mdiv != rate->mdiv || old_pdiv != rate->pdiv || old_kdiv != rate->kdiv);
+}
+
+static int samsung_a9fraco_set_rate(struct clk_hw *hw, unsigned long drate, unsigned long prate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	const struct samsung_pll_rate_table *rate;
+	u32 con0, con5;
+	int ret;
+
+	/* Get required rate settings from table */
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+		       drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	con0 = readl_relaxed(pll->con_reg);
+	con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+
+	if (!(samsung_a9fraco_mpk_change(con0, con5, rate))) {
+		/* If only s change, change just s value only */
+		con0 &= ~(PLLA9FRACO_SDIV_MASK << PLLA9FRACO_SDIV_SHIFT);
+		con0 |= rate->sdiv << PLLA9FRACO_SDIV_SHIFT;
+		writel_relaxed(con0, pll->con_reg);
+
+		return 0;
+	}
+
+	/* Select OSCCLK (0) */
+	con0 = readl_relaxed(pll->con_reg);
+	con0 &= ~(PLLA9FRACO_MUX_SEL);
+	writel_relaxed(con0, pll->con_reg);
+
+	/* Disable PLL */
+	con0 &= ~BIT(PLLA9FRACO_ENABLE_SHIFT);
+	writel_relaxed(con0, pll->con_reg);
+
+	/* Set PLL lock time. */
+	writel_relaxed(rate->pdiv * PLLA9FRACO_LOCK_FACTOR, pll->lock_reg);
+
+	/* Set PLL M, P, and S values. */
+	con0 &= ~((PLLA9FRACO_MDIV_MASK << PLLA9FRACO_MDIV_SHIFT) |
+		  (PLLA9FRACO_PDIV_MASK << PLLA9FRACO_PDIV_SHIFT) |
+		  (PLLA9FRACO_SDIV_MASK << PLLA9FRACO_SDIV_SHIFT));
+
+	/* The field FOUTPOSTDIVEN should always be 1, else FOUT might be 0 Hz. */
+	con0 |= (rate->mdiv << PLLA9FRACO_MDIV_SHIFT) |
+		(rate->pdiv << PLLA9FRACO_PDIV_SHIFT) |
+		(rate->sdiv << PLLA9FRACO_SDIV_SHIFT) | (PLLA9FRACO_FOUTPOSTDIVEN);
+
+	/* Set PLL K, DSM_EN and DAC_MODE values. */
+	con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+	con5 &= ~((PLLA9FRACO_KDIV_MASK << PLLA9FRACO_KDIV_SHIFT) |
+		  PLLA9FRACO_DSM_EN | PLLA9FRACO_DAC_MODE);
+	con5 |= (rate->kdiv << PLLA9FRACO_KDIV_SHIFT) | PLLA9FRACO_DSM_EN | PLLA9FRACO_DAC_MODE;
+
+	/* Write configuration to PLL */
+	writel_relaxed(con0, pll->con_reg);
+	writel_relaxed(con5, pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+
+	/* Enable PLL */
+	con0 = readl_relaxed(pll->con_reg);
+	con0 |= BIT(PLLA9FRACO_ENABLE_SHIFT);
+	writel_relaxed(con0, pll->con_reg);
+
+	/* Wait for PLL lock if the PLL is enabled */
+	ret = samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
+	if (ret < 0)
+		return ret;
+
+	/* Select FOUT (1) */
+	con0 |= (PLLA9FRACO_MUX_SEL);
+	writel_relaxed(con0, pll->con_reg);
+
+	return 0;
+}
+
+static const struct clk_ops samsung_a9fraco_clk_ops = {
+	.recalc_rate = samsung_a9fraco_recalc_rate,
+	.determine_rate = samsung_pll_determine_rate,
+	.set_rate = samsung_a9fraco_set_rate,
+};
+
+static const struct clk_ops samsung_a9fraco_clk_min_ops = {
+	.recalc_rate = samsung_a9fraco_recalc_rate,
+};
+
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 				const struct samsung_pll_clock *pll_clk)
 {
@@ -1477,6 +1637,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1452x:
 	case pll_142xx:
 	case pll_1017x:
+	case pll_a9fracm:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
@@ -1578,6 +1739,14 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_pll1031x_clk_ops;
 		break;
+	case pll_a9fraco:
+		pll->enable_offs = PLLA9FRACO_ENABLE_SHIFT;
+		pll->lock_offs = PLLA9FRACO_LOCK_STAT_SHIFT;
+		if (!pll->rate_table)
+			init.ops = &samsung_a9fraco_clk_min_ops;
+		else
+			init.ops = &samsung_a9fraco_clk_ops;
+		break;
 	default:
 		pr_warn("%s: Unknown pll type for pll clk %s\n",
 			__func__, pll_clk->name);
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26da5..d6eb3246611b 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,8 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_1017x,
 	pll_1031x,
+	pll_a9fracm,
+	pll_a9fraco,
 };

 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
@@ -58,6 +60,11 @@ enum samsung_pll_type {
 #define PLL_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
 	BUILD_BUG_ON_ZERO(PLL_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))

+#define PLL_FRACO_RATE(_fin, _m, _p, _s, _k, _ks) \
+	((u64)(_fin) * (BIT(_ks) * (_m) + (_k)) / BIT(_ks) / ((_p) * ((_s) + 1)))
+#define PLL_FRACO_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
+	BUILD_BUG_ON_ZERO(PLL_FRACO_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))
+
 #define PLL_35XX_RATE(_fin, _rate, _m, _p, _s)			\
 	{							\
 		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
@@ -111,6 +118,16 @@ enum samsung_pll_type {
 		.vsel	=	(_vsel),			\
 	}

+#define PLL_A9FRACO_RATE(_fin, _rate, _m, _p, _s, _k)		\
+	{							\
+		.rate	=	PLL_FRACO_VALID_RATE(_fin, _rate, \
+				_m, _p, _s, _k, 24),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+		.kdiv	=	(_k),				\
+	}
+
 /* NOTE: Rate table should be kept sorted in descending order. */

 struct samsung_pll_rate_table {
--
2.17.1


