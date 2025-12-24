Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C685E7491C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDd5ecR3DhD17Syo/L/GME/XjYLDnkMJOJbjzS9MS0E=; b=VZk+pfyE172Q2B2M6hDIra7c/L
	88StAuREYFYZV55cj5PV3S1xQCbu6cTP0SxOfNfZ3uBHnNF8DE6o03rhxu7wiA8/4qfYQWVrd1ovB
	eRlLibEkz7+Q/lJNek9eN2vtl3kyZY4y6151ncUk2xq+tot2vLGWPpWSHCM/duhMlERF6fRT75K6m
	5zzmlFE3vGGoxukPeHVfkZOTyrJL1ufCmmJmDhPShVstNj822tt6smicKdYmFLdk0XN3g5fy+tpJB
	uU/EIOEpoel0W/R3Pqps/WTN24KTwlrBFaZVks19NPDfCspu8mD5RyFcpyTOO/lpeDwsYoDfdALUg
	g1yShF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKO-0000000GXQ6-21ks;
	Wed, 24 Dec 2025 07:30:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKK-0000000GXNh-3Z0E;
	Wed, 24 Dec 2025 07:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=eYu8Nq+w5A2A6v7D8iAIPR9NzDkFmS/GlSo/NzWVz0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o0StNlF6AT/Im/wgG6NhEi2JBngssBhzjkCacTC0TOmAuU/4x3vg88cz2kXd8yDBl
	 fbyBBdPBljnfHOoh5OQwn+y9d7eiZRkaioh5PaV5EERmrQ+WZrVm8kbe3SPzc1EJMB
	 trMS5oowhPYhp76N/W6fa0/Di0leSPniy1TwwrGKWA37t0zMaGQqqTLdwI1OCvk9Nc
	 eiYkd9gyPpyHeJGNHeUdnETBzSy/HF33DIYt6jF+Y+myz7h3Dyg+fOmgALIGkHuifE
	 p0RMBe7Qm5PYJ5ifqmg06d3ZH0n8/i76LbOq4Y++Ic7OQ3mEo7f/jstszLPoqJBLDj
	 wJzwVpgBhU8zQ==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23D0717E10F8;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id CBF5D11A3A2DB; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:13 +0100
Subject: [PATCH 4/4] clk: mediatek: Declare MT7988 infra muxes as no-gate
 muxes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-4-d4667e3b7856@collabora.com>
References: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
In-Reply-To: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_233033_431527_B24D62EE 
X-CRM114-Status: GOOD (  10.87  )
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

A MUX_GATE without a gate, is really just a MUX. Adjust the mux
declarations to match that. This fixes out-of-bounds shifts due to no
longer trying to enable/disable the gate with a shift of (u8)-1.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 88 ++++++++++++++++--------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index ef8267319d91..69e86fc29d73 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -56,49 +56,53 @@ static const char *const infra_pcie_gfmux_tl_ck_o_p3_parents[] __initconst = {
 
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
+	MUX_CLR_SET(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
+		    infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
+		    infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
+		    infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel",
+		    infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel",
+		    infra_mux_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1),
+	MUX_CLR_SET(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel",
+		    infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM_SEL, "infra_pwm_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 14, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 16, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 18, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 20, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 22, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 24, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 26, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 28, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel",
+		    infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 30, 2),
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
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL,
+		    "infra_pcie_gfmux_tl_o_p0_sel",
+		    infra_pcie_gfmux_tl_ck_o_p0_parents,
+		    0x0028, 0x0020, 0x0024, 0, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL,
+		    "infra_pcie_gfmux_tl_o_p1_sel",
+		    infra_pcie_gfmux_tl_ck_o_p1_parents,
+		    0x0028, 0x0020, 0x0024, 2, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL,
+		    "infra_pcie_gfmux_tl_o_p2_sel",
+		    infra_pcie_gfmux_tl_ck_o_p2_parents,
+		    0x0028, 0x0020, 0x0024, 4, 2),
+	MUX_CLR_SET(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL,
+		    "infra_pcie_gfmux_tl_o_p3_sel",
+		    infra_pcie_gfmux_tl_ck_o_p3_parents,
+		    0x0028, 0x0020, 0x0024, 6, 2),
 };
 
 static const struct mtk_gate_regs infra0_cg_regs = {

-- 
2.51.0


