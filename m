Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B822C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYK1Z9GeiM6Oipd0henjIr1Llh7/cXW03YwW6z6VPJo=; b=XaPKWwXbXNETO7QKfnxUn01Gji
	ckbl3D3VcmSGUT3LR4dJBoFrjAcp82bPg5YYf2/0MNbz3cTfwHnvuMOzPjiP9hHp2bQaFcvj4thcJ
	MQOU9eaZ2joZ9katsNEvOV05alwkgiczjVETKofocWV2dWkpF1YM32fJdIkjluGVbkm4EkdgQD0T+
	HwmzQGFI4cyqyG8F1niQsV24mLBW3aOIRa1vLmxdstS30NDVzvt2DP65P3GffrjW5WTUH32wRhVPQ
	uylADWffQ/vD0McqVT9a6nchDpriF+3v/56ctzBTfgdm6uYzscKIhX5Zl4+1uX8vY3hvWW3t4xkIw
	JFWwiEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuTC-00000003SNp-2aIS;
	Mon, 17 Feb 2025 06:19:06 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuNa-00000003RTI-0mmZ;
	Mon, 17 Feb 2025 06:13:19 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1482625B74;
	Mon, 17 Feb 2025 07:13:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3J08wnY5d9p; Mon, 17 Feb 2025 07:13:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739772794; bh=58xzbLCdhNCilxabqnQbn6q6tobvOe7G9WeMgslUdXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BfG3D5WKvdopBWufa82rVui6rj7ZIjL2eUJDRKkmBYPFAc/wgD7+TLBOUQom9Jcaf
	 2hXqZbX2n5qNh1UOhZkl163Uj8vxa/NDDYOl2jJA7maBA57IVZCne6YNs8oFhrvrQn
	 GE3jLCHEJcTpio82h5H4J78npXOKXIPKq7dH4o25ARDjkNw1s2XI15rphcskVeib+/
	 IrCDVzUQF0JzOkupWHAkJ1hQTC7yDiiilCNSYWF+Q+7mynmDN+Cj4nebUNULAi/nRl
	 8d1IbOSJfCi8KKEGbVfzc1Vc/Me8QnjdMzt8F4jQsBRe7HBTyXdTEVc/v337gr8XTR
	 iKCs9SEM4ecZQ==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 2/5] clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
Date: Mon, 17 Feb 2025 06:11:43 +0000
Message-ID: <20250217061142.38480-7-ziyao@disroot.org>
In-Reply-To: <20250217061142.38480-5-ziyao@disroot.org>
References: <20250217061142.38480-5-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_221318_355534_A77839DE 
X-CRM114-Status: GOOD (  13.84  )
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

RK3528 comes with a new PLL variant: its "PPLL", which mainly generates
clocks for the PCIe controller, operates in normal mode only. Let's
describe it with flag ROCKCHIP_PLL_FIXED_MODE and handle it in code.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-pll.c | 10 ++++++----
 drivers/clk/rockchip/clk.h     |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index fe76756e592e..2c2abb3b4210 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -204,10 +204,12 @@ static int rockchip_rk3036_pll_set_params(struct rockchip_clk_pll *pll,
 	rockchip_rk3036_pll_get_params(pll, &cur);
 	cur.rate = 0;
 
-	cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
-	if (cur_parent == PLL_MODE_NORM) {
-		pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
-		rate_change_remuxed = 1;
+	if (!(pll->flags & ROCKCHIP_PLL_FIXED_MODE)) {
+		cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
+		if (cur_parent == PLL_MODE_NORM) {
+			pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
+			rate_change_remuxed = 1;
+		}
 	}
 
 	/* update pll values */
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 9b37d44b9e5d..460de5a67faf 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -444,6 +444,7 @@ struct rockchip_pll_rate_table {
  * Flags:
  * ROCKCHIP_PLL_SYNC_RATE - check rate parameters to match against the
  *	rate_table parameters and ajust them if necessary.
+ * ROCKCHIP_PLL_FIXED_MODE - the pll operates in normal mode only
  */
 struct rockchip_pll_clock {
 	unsigned int		id;
@@ -461,6 +462,7 @@ struct rockchip_pll_clock {
 };
 
 #define ROCKCHIP_PLL_SYNC_RATE		BIT(0)
+#define ROCKCHIP_PLL_FIXED_MODE		BIT(1)
 
 #define PLL(_type, _id, _name, _pnames, _flags, _con, _mode, _mshift,	\
 		_lshift, _pflags, _rtable)				\
-- 
2.48.1


