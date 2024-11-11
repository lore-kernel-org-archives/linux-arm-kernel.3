Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08DDD3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BKz2VN1nWMnbQqfmx/ND1K/EZd0XbehhCz5EUh9qlIY=; b=FH9Gt7iYZ9PGFI2gO8T8m+c3G5
	VxdTr2xTDKGLmuwK3lTeDBYK0NCxiCgbuImZ/5DTWryUE2++pN1wX6S2e6Te29NF0qv/QpptoMvqZ
	pnLAFc2+ZTXfDkPxq99Uv6Z3Z9Z5z6fbC7BE3hXOwRFXvx0x8RmdVNNGR7DYUfMsDm9N7jrG3x4tG
	kOVIHjRKT0BTVMS7rxvJwa1zCJzyumEygNTeQ47yIwPQX77OaYgUV86NqBUA1iX6VckhD+4Ne+7HZ
	ijtQENEgBmByz0N2G1dNAqKqPj25cx27/o7jOFLP1u1LIxdNC+ixd/nyG8VqaOPYnBLWbwlbL0ITQ
	6PTE4MMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcFn-00000001PE3-2XGR;
	Mon, 11 Nov 2024 21:47:23 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcE1-00000001P39-2RrW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 21:45:35 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E809A8938A;
	Mon, 11 Nov 2024 22:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731361531;
	bh=BKz2VN1nWMnbQqfmx/ND1K/EZd0XbehhCz5EUh9qlIY=;
	h=From:To:Cc:Subject:Date:From;
	b=MSW7/AxjmzAKcgjprOCXGUC1ar47jLaWXMZer/XZOGGBF6UsP5sNzye1O63zU81Gx
	 Hr8IzHdjo6r/nn03pANvlXmNoPbSqjt42N+ZYlpmnOJGUoGuTsuoCOU1B4u0vEFukU
	 NibFZmb+nDu6c23lUr3eR0mC4+0HCyg+czmFtT7tHkNT7GkbaLr9pZ56YNVAEPNCDV
	 vsSuTAzIE8AyKgt1ScrfB4gv+KVMXBwDIm5fDFPAzhtk9c/eez8ELA4Jpl98HsVNzf
	 zT4b5hrAYDBqxC1U8Y6Bz1vRw4QVAecF3Na3le1Nl1JU3WyACTZhrmi0fdEvRYdP+X
	 fnlXM/8z0DZ/g==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to PLL1416x
Date: Mon, 11 Nov 2024 22:44:54 +0100
Message-ID: <20241111214516.208820-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_134533_972762_AED6FF48 
X-CRM114-Status: GOOD (  16.17  )
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

The pll1416x PLL so far only supports rates from a rate table passed
during initialization. Calculating PLL settings dynamically helps in
case e.g. multiple video outputs are used and they each need their own
separate source of accurate pixel clock on i.MX8MP. In that case, e.g.
PLL1416x PLL3 can be used as another Video PLL for another output.

Extend the existing PLL1443x dynamic rate support to also apply to PLL1416x .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/imx/clk-pll14xx.c | 39 ++++++++---------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12ca..19b9f764a0015 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -214,23 +214,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		 t->mdiv, t->kdiv);
 }
 
-static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
-{
-	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	const struct imx_pll14xx_rate_table *rate_table = pll->rate_table;
-	int i;
-
-	/* Assuming rate_table is in descending order */
-	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
-
-	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
-}
-
-static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
+static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
 			unsigned long *prate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -285,22 +269,17 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	const struct imx_pll14xx_rate_table *rate;
+	struct imx_pll14xx_rate_table rate;
 	u32 tmp, div_val;
 	int ret;
 
-	rate = imx_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("Invalid rate %lu for pll clk %s\n", drate,
-		       clk_hw_get_name(hw));
-		return -EINVAL;
-	}
+	imx_pll14xx_calc_settings(pll, drate, prate, &rate);
 
 	tmp = readl_relaxed(pll->base + DIV_CTL0);
 
-	if (!clk_pll14xx_mp_change(rate, tmp)) {
+	if (!clk_pll14xx_mp_change(&rate, tmp)) {
 		tmp &= ~SDIV_MASK;
-		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
+		tmp |= FIELD_PREP(SDIV_MASK, rate.sdiv);
 		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
 		return 0;
@@ -319,8 +298,8 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp |= BYPASS_MASK;
 	writel(tmp, pll->base + GNRL_CTL);
 
-	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) | FIELD_PREP(PDIV_MASK, rate->pdiv) |
-		FIELD_PREP(SDIV_MASK, rate->sdiv);
+	div_val = FIELD_PREP(MDIV_MASK, rate.mdiv) | FIELD_PREP(PDIV_MASK, rate.pdiv) |
+		FIELD_PREP(SDIV_MASK, rate.sdiv);
 	writel_relaxed(div_val, pll->base + DIV_CTL0);
 
 	/*
@@ -468,7 +447,7 @@ static const struct clk_ops clk_pll1416x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1416x_round_rate,
+	.round_rate	= clk_pll14xx_round_rate,
 	.set_rate	= clk_pll1416x_set_rate,
 };
 
@@ -481,7 +460,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1443x_round_rate,
+	.round_rate	= clk_pll14xx_round_rate,
 	.set_rate	= clk_pll1443x_set_rate,
 };
 
-- 
2.45.2


