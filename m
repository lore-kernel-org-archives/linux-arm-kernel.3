Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C2BC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0UYbDqjA9oSxzTTbMfckhINJfPoDSuCBjudN8pqLYc=; b=aV6+Eahk8QkgkTtPJIgSTj9uhk
	rKKHp3Hv5MyBL3hx6hU2za3dO+Ivzz9X/AUHSgGVYAgR9oZTT6+Au68C/6hmt75MOErqjZQI9lT70
	d06M7HX4guJ7uV3/jXcCseEQOg8N8BLKWOLXV0tFcRv1lgtNYETlHzCuW7ZLk151iN1EwWksfvm7L
	FGeDfEzCgNe75zLCdWYrfLKZsuSHafROSd7+vh3bOuFpKvt2OBsZFmhdcHAdS/o4z9XRj3sTKfVw6
	il2y78TNzF4XUNr/uucEOQg8/4IVaKv7KiP0nAhU8jVX5kAtB4YaNfxXLLo17s1nrBU9+Mk0+Bapu
	LKuKNyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXibf-0000000ErxR-1xDN;
	Fri, 04 Jul 2025 15:45:43 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiXQ-0000000ErIp-3xJG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:41:22 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 65A861F00047
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 15:41:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C0B1DACA64E; Fri,  4 Jul 2025 15:41:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 8BD7DACA63A;
	Fri,  4 Jul 2025 15:40:12 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/2] clk: sunxi-ng: v3s: Assign the de and tcon clocks to the video pll
Date: Fri,  4 Jul 2025 17:40:08 +0200
Message-ID: <20250704154008.3463257-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154008.3463257-1-paulk@sys-base.io>
References: <20250704154008.3463257-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_084121_136520_461D44C0 
X-CRM114-Status: GOOD (  18.69  )
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

It appears (based on experimentation) that both the de and tcon clocks
need to have the same parent for the two units to work together.

Assign them both to the video pll by manually clearing the parent
selection bits (effectively setting index 0) and marking the clocks
with the CLK_SET_RATE_NO_REPARENT flag, which ensures that they will
never use a different parent.

The video pll is also a possible parent for the camera subsystem,
but it can use the dedicated isp pll if needed so there should be
no negative side-effect due to this change.

Note that ccu_mux_helper_set_parent cannot be used at this stage as
it requires the clock driver to be initialized and this configuration
is best done before the clock driver is available to consumers.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index df345a620d8d..05595ac51b76 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -347,11 +347,13 @@ static SUNXI_CCU_GATE(dram_ohci_clk,	"dram-ohci",	"dram",
 
 static const char * const de_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
-				 0x104, 0, 4, 24, 3, BIT(31), 0);
+				 0x104, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_NO_REPARENT);
 
 static const char * const tcon_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
-				 0x118, 0, 4, 24, 3, BIT(31), 0);
+				 0x118, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_NO_REPARENT);
 
 static SUNXI_CCU_GATE(csi_misc_clk,	"csi-misc",	"osc24M",
 		      0x130, BIT(31), 0);
@@ -753,6 +755,21 @@ static int sun8i_v3s_ccu_probe(struct platform_device *pdev)
 	val &= ~GENMASK(19, 16);
 	writel(val, reg + SUN8I_V3S_PLL_AUDIO_REG);
 
+	/*
+	 * Assign the DE and TCON clock to the video PLL. Both clocks need to
+	 * have the same parent for the units to work together.
+	 */
+
+	val = readl(reg + de_clk.common.reg);
+	val &= ~GENMASK(de_clk.mux.shift + de_clk.mux.width - 1,
+			de_clk.mux.shift);
+	writel(val, reg + de_clk.common.reg);
+
+	val = readl(reg + tcon_clk.common.reg);
+	val &= ~GENMASK(tcon_clk.mux.shift + tcon_clk.mux.width - 1,
+			tcon_clk.mux.shift);
+	writel(val, reg + tcon_clk.common.reg);
+
 	return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
 }
 
-- 
2.49.0


