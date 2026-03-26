Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554DD109E54E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGGWTdMUIVyS3Qgx0DfvUx9qEFkK7tjaolD+dx0ptGw=; b=AmliTmf9yZ44AByRBu7uoYpLEX
	dLzN99qFdr+2/e/2SUNpU9a78UYfBknnxAl1usHu4m2KImYh/PSGgw/g2IhWYZ6NtONnlYt4iU2kf
	0SfSejEcuszl8HJcsoSg1qnzWFYMZM5EToDY0jtze7d7PcjBVYvmAiGYbWsipj6QTtLklWz5uZLSX
	D4aXnOceCqvDxBnMX7ToTtdhq6ldENcEX0rzhFEfOp9Jw3og7oBNexxrOFUafmhNoCm8cTfq2JEVg
	rU2aJyCdE4jyectkA8WE1NsjyKUTF+cWgzX9UW1cgpIq6i/IiMJvo9w5sZ4SOBkQmzpElQ7z7CbSF
	+CJOAuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5czh-00000004iXn-2S7L;
	Thu, 26 Mar 2026 05:10:57 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cze-00000004iXN-3UY3;
	Thu, 26 Mar 2026 05:10:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5cza-000000006qv-0vim;
	Thu, 26 Mar 2026 05:10:50 +0000
Date: Thu, 26 Mar 2026 05:10:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
Message-ID: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774499536.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_221054_868054_FA7B80BC 
X-CRM114-Status: GOOD (  12.13  )
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

The mfg_pll_sel mux has neither a clock gate nor an update register,
and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.

While upd_shift being -1 (as s8) prevents the update path from
executing at runtime, the bogus upd_ofs value is still stored in the
struct.

Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
fields.

Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 50b43807c60cf..6413619880483 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -579,8 +579,8 @@ static const struct mtk_mux top_mtk_muxes[] = {
 			     dsp7_parents, 0x050, 0x054, 0x058, 0, 3, 7, 0x004, 16),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
 			     mfg_ref_parents, 0x050, 0x054, 0x058, 16, 2, 23, 0x004, 18),
-	MUX_CLR_SET_UPD(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel",
-			mfg_pll_parents, 0x050, 0x054, 0x058, 18, 1, -1, -1),
+	MUX_CLR_SET(CLK_TOP_MFG_PLL_SEL, "mfg_pll_sel", mfg_pll_parents,
+		   0x050, 0x054, 0x058, 18, 1),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG_SEL, "camtg_sel",
 			     camtg_parents, 0x050, 0x054, 0x058, 24, 3, 31, 0x004, 19),
 	/* CLK_CFG_5 */
-- 
2.53.0

