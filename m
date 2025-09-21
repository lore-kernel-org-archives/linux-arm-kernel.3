Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12085CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRxIJ6cM/uBzVILghoV+9GLrZ/XIzrr+/eiu3+V2I/w=; b=LSaccvOx4rs2nkPQK/5GmYhGA4
	d0K2/AyvNbgEpVd1cuASJlHhJWJVfm0de/0f3mXjMt3s+M9kLkRqZApZi/NmRWdJA1XWEYeyISRcU
	BCBiz7t23Mpq+Rd8FrM+ZTOqKAM8JfWb0hHYTAVr3MKsp02Q15KXfWFrm5Sqmk5I06Vv8+eg/Q/Yy
	PI05wYZ7xE0wFkpPXTvDGagzvLXsb7pBMDE206Wc1AD5ypyIG+OyYlsiQXVb685oba+2Y5UMnLI0F
	Pc11xgx0E3Gl524WGakQLDig9Jjg8gNi2xTLEVFW37bfyVypAUCkJ0/K+BoX6YXyWRc4ZBqn2UgLq
	p8ldyB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0OKr-00000007yjs-09Ux;
	Sun, 21 Sep 2025 17:58:53 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0OKo-00000007yir-2xMn;
	Sun, 21 Sep 2025 17:58:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1v0OKa-000000004Nn-0Rcb;
	Sun, 21 Sep 2025 17:58:36 +0000
Date: Sun, 21 Sep 2025 18:58:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] clk: mediatek: mt7988-infracfg: SPI0 clocks are not
 critical
Message-ID: <49fb368b4da6f5ed11812dceb45f174ceca8f10a.1758477397.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_105850_745096_70C8A80A 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

SPI0 clocks have wrongly been marked as critical while, probably due
to the SPI driver not requesting them. This can (and should) be addressed
in device tree instead.
Remove CLK_IS_CRITICAL flag from clocks related to SPI0.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Patch originally sent 2024-10-31 but never received any feedback.

 drivers/clk/mediatek/clk-mt7988-infracfg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index ef8267319d91..c40e18c27f12 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -196,12 +196,10 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA2(CLK_INFRA_SPINFI, "infra_f_fspinfi", "spinfi_sel", 10),
 	GATE_INFRA2_FLAGS(CLK_INFRA_66M_NFI_HCK, "infra_hf_66m_nfi_hck", "sysaxi_sel", 11,
 			  CLK_IS_CRITICAL),
-	GATE_INFRA2_FLAGS(CLK_INFRA_104M_SPI0, "infra_hf_104m_spi0", "infra_mux_spi0_sel", 12,
-			  CLK_IS_CRITICAL),
+	GATE_INFRA2(CLK_INFRA_104M_SPI0, "infra_hf_104m_spi0", "infra_mux_spi0_sel", 12),
 	GATE_INFRA2(CLK_INFRA_104M_SPI1, "infra_hf_104m_spi1", "infra_mux_spi1_sel", 13),
 	GATE_INFRA2(CLK_INFRA_104M_SPI2_BCK, "infra_hf_104m_spi2_bck", "infra_mux_spi2_sel", 14),
-	GATE_INFRA2_FLAGS(CLK_INFRA_66M_SPI0_HCK, "infra_hf_66m_spi0_hck", "sysaxi_sel", 15,
-			  CLK_IS_CRITICAL),
+	GATE_INFRA2(CLK_INFRA_66M_SPI0_HCK, "infra_hf_66m_spi0_hck", "sysaxi_sel", 15),
 	GATE_INFRA2(CLK_INFRA_66M_SPI1_HCK, "infra_hf_66m_spi1_hck", "sysaxi_sel", 16),
 	GATE_INFRA2(CLK_INFRA_66M_SPI2_HCK, "infra_hf_66m_spi2_hck", "sysaxi_sel", 17),
 	GATE_INFRA2(CLK_INFRA_66M_FLASHIF_AXI, "infra_hf_66m_flashif_axi", "sysaxi_sel", 18),
-- 
2.51.0


