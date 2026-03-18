Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2897410854D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 02:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kLI1oGyPeNgE8d0aFHOE+Ov9caa7NWvuHOYqj2tUfuU=; b=wiCaJEiTn1uvbHRx8vuXx7ho3P
	gFsGlUaK1S16KV3USF18xruGntVs2zpZXL4/mi95gOkWYofBLHOAq9iazP7xmS4TeamFJGZMUKTJt
	RJZM5Vg3rXMfMvXNBSjilfWdGPub6UB5XFUeCSWuIziu+CRyYOJmfkPjteVtrUFzohjfkeYxTka2e
	vMq1Lx8jqIPXaOQvINIjTLzWq7Mad9pYSRzPDRsAqHEDmni2Hoi/ueC0W0M4+sHzwM8VrpMKK9C8A
	+Xw7PvxwPZbPNtUjfd0GAe1z1bmUas/+GNWWSlOqx7O+pkWDBFXY4v0TklcwF/rWMM3+GHiWp7yCx
	/G6ODvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gy0-00000007gTV-0KyA;
	Wed, 18 Mar 2026 02:49:04 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gxx-00000007gT4-0eDn;
	Wed, 18 Mar 2026 02:49:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w2gxg-000000004CM-2SK6;
	Wed, 18 Mar 2026 02:48:44 +0000
Date: Wed, 18 Mar 2026 02:48:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt7988: use MUX_CLR_SET_UPD for gate-less
 muxes
Message-ID: <869a8a99bbde357fb4f2175f99e605c3e1597640.1773801987.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_194901_397423_C328CEED 
X-CRM114-Status: GOOD (  10.22  )
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

All 18 muxes in the infra_muxes[] array are pure mux selectors without
a clock gate, yet they were defined using MUX_GATE_CLR_SET_UPD with
gate_shift = -1.

This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
gate_shift is stored as u8, the -1 truncates to 255, causing a
shift-out-of-bounds at runtime:

UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
shift exponent 255 is too large for 64-bit type 'long unsigned int'

UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
shift exponent 255 is too large for 64-bit type 'long unsigned int'

UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
shift exponent 255 is too large for 64-bit type 'long unsigned int'

Switch these definitions to MUX_CLR_SET_UPD, which uses
mtk_mux_clr_set_upd_ops (no gate callbacks). The actual clock gating
for these peripherals is handled by the separate GATE_INFRA* definitions
further down.

Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 84 +++++++++++-----------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index c40e18c27f12e..57203d08ac265 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -56,49 +56,49 @@ static const char *const infra_pcie_gfmux_tl_ck_o_p3_parents[] __initconst = {
 
 static const struct mtk_mux infra_muxes[] = {
 	/* MODULE_CLK_SEL_0 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
-			     infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
-			     infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
-			     infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel", infra_mux_spi0_parents,
-			     0x0018, 0x0010, 0x0014, 4, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel", infra_mux_spi1_parents,
-			     0x0018, 0x0010, 0x0014, 5, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel", infra_mux_spi0_parents,
-			     0x0018, 0x0010, 0x0014, 6, 1, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel", infra_pwm_bck_parents, 0x0018,
-			     0x0010, 0x0014, 14, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 16, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 18, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 20, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 22, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 24, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 26, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 28, 2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel", infra_pwm_bck_parents,
-			     0x0018, 0x0010, 0x0014, 30, 2, -1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
+			infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
+			infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
+			infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel",
+			infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel",
+			infra_mux_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel",
+			infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 14, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 16, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 18, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 20, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 22, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 24, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 26, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 28, 2, -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel",
+			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 30, 2, -1, -1),
 	/* MODULE_CLK_SEL_1 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
-			     infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
-			     infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
-			     infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2, -1,
-			     -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
-			     infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2, -1,
-			     -1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
+			infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2,
+			-1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
+			infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2,
+			-1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
+			infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2,
+			-1, -1),
+	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
+			infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2,
+			-1, -1),
 };
 
 static const struct mtk_gate_regs infra0_cg_regs = {
-- 
2.53.0

