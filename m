Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69084C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Cw4gLVTEj41qd71UbYcQXltNv/HIrv2J6jXCx+5O9E=; b=S60GH80VbXcbNGilWeRzsSSROy
	7GD8eHF818szNDE2Y3mHTbaK+fjTm9Ey6nESEgBI62bKSkVMolY51rXIqWUCNrsBx62lIiL6+hzu8
	w5l7YRPLSFBrs5wW7u5wBSidNcnO++uQvo6h2/cTeXVbkP15wZjNu1b29Lm15lUMQY4ibDCEEztUO
	YRcxf+4FWPoA9XFxY1tq5zhDeVnjj9CdJp9Q9JCj3ZHLHU5lHeI+Y4DrDWZ+7qxoSYtehJ3Bntz3F
	wvEEhTs72ZIVrvHMCghpFrFg7SH/yx4sTRwdQVioxXHt5wm3gVtnsg0hktXTua3anYwHzyn2Vp/uE
	0hBgxkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk0o-00000003PrQ-1K1Q;
	Mon, 23 Jun 2025 16:27:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRa-00000002M0r-18Xr;
	Mon, 23 Jun 2025 10:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750674628;
	bh=Cby/X1WV3HopZtvi73KSTUoPTPZcfuR/lZXjxwDwr/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+l/mtFHnyYwE1eT37KU1f5VAUd9yRClm/3UBRTYs/t4JqXIbPhEqLetEbj9wjgFu
	 /laM/3myPav4hDdXrUTPZnrao7cySic2woomeAKuL/ZJSfatWBTD8XrKY7OXwMHuHm
	 B5baqgw3l6mJWdFYhLYmg2xhltJ8K4jRIaiCaTHi14XeWhyB5I78suFIFMKeoITE+L
	 SVjrq+w4VhfO/giV3IVus4vYNfBI4/fZZBA+KclD5ztt5vE511to7Pjek5gX41E03h
	 MENQL/1g9ihMTfFQ8SaC2vD6rYZZj7QswE5UGcRz6tV7fmvPDMAZL6VJaBQFZekuQc
	 0m5jKnsu8Jk8Q==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e046:b666:1d47:e832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9F4F17E1560;
	Mon, 23 Jun 2025 12:30:27 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 02/30] clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
Date: Mon, 23 Jun 2025 12:29:12 +0200
Message-Id: <20250623102940.214269-3-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623102940.214269-1-laura.nao@collabora.com>
References: <20250623102940.214269-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_033030_471135_66E139BD 
X-CRM114-Status: GOOD (  15.00  )
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

MT8196 uses a combination of set/clr registers to control the PLL
enable state, along with a FENC bit to check the preparation status.
Add new set of PLL clock operations with support for set/clr enable and
FENC status logic.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 42 +++++++++++++++++++++++++++++++++-
 drivers/clk/mediatek/clk-pll.h |  5 ++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 49ca25dd5418..8f46de77f42d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -37,6 +37,13 @@ int mtk_pll_is_prepared(struct clk_hw *hw)
 	return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
 }
 
+static int mtk_pll_fenc_is_prepared(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	return readl(pll->fenc_addr) & pll->fenc_mask;
+}
+
 static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
 		u32 pcw, int postdiv)
 {
@@ -274,6 +281,25 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 }
 
+static int mtk_pll_prepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
+
+	/* Wait 20us after enable for the PLL to stabilize */
+	udelay(20);
+
+	return 0;
+}
+
+static void mtk_pll_unprepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
+}
+
 const struct clk_ops mtk_pll_ops = {
 	.is_prepared	= mtk_pll_is_prepared,
 	.prepare	= mtk_pll_prepare,
@@ -283,6 +309,16 @@ const struct clk_ops mtk_pll_ops = {
 	.set_rate	= mtk_pll_set_rate,
 };
 
+const struct clk_ops mtk_pll_fenc_clr_set_ops = {
+	.is_prepared	= mtk_pll_fenc_is_prepared,
+	.prepare	= mtk_pll_prepare_setclr,
+	.unprepare	= mtk_pll_unprepare_setclr,
+	.recalc_rate	= mtk_pll_recalc_rate,
+	.round_rate	= mtk_pll_round_rate,
+	.set_rate	= mtk_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_pll_fenc_clr_set_ops);
+
 struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 					const struct mtk_pll_data *data,
 					void __iomem *base,
@@ -315,6 +351,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 	pll->hw.init = &init;
 	pll->data = data;
 
+	pll->fenc_addr = base + data->fenc_sta_ofs;
+	pll->fenc_mask = BIT(data->fenc_sta_bit);
+
 	init.name = data->name;
 	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
 	init.ops = pll_ops;
@@ -337,12 +376,13 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 {
 	struct mtk_clk_pll *pll;
 	struct clk_hw *hw;
+	const struct clk_ops *pll_ops = data->ops ? data->ops : &mtk_pll_ops;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
-	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
+	hw = mtk_clk_register_pll_ops(pll, data, base, pll_ops);
 	if (IS_ERR(hw))
 		kfree(pll);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index c4d06bb11516..7fdc5267a2b5 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -29,6 +29,7 @@ struct mtk_pll_data {
 	u32 reg;
 	u32 pwr_reg;
 	u32 en_mask;
+	u32 fenc_sta_ofs;
 	u32 pd_reg;
 	u32 tuner_reg;
 	u32 tuner_en_reg;
@@ -51,6 +52,7 @@ struct mtk_pll_data {
 	u32 en_clr_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
+	u8 fenc_sta_bit;
 };
 
 /*
@@ -72,6 +74,8 @@ struct mtk_clk_pll {
 	void __iomem	*en_addr;
 	void __iomem	*en_set_addr;
 	void __iomem	*en_clr_addr;
+	void __iomem	*fenc_addr;
+	u32		fenc_mask;
 	const struct mtk_pll_data *data;
 };
 
@@ -82,6 +86,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_hw_onecell_data *clk_data);
 
 extern const struct clk_ops mtk_pll_ops;
+extern const struct clk_ops mtk_pll_fenc_clr_set_ops;
 
 static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
 {
-- 
2.39.5


