Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30746CCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh4gRZZ0pVfag6oDW9bCAHk4qqDRUpRFJnw6OkoXU78=; b=HdGI2xbHhcdql2sf3HBcW2fdKk
	Iaau/Vx7QHcQkumipIVHOqTKIu7GdshJiXHoM4OmEJmI8awKqKqgAh6pYsGHROqusA7CrQpvpwn5D
	u9sU/7gQB43H7mlr3IlUjh/1csN1zQd3CW7TtMryNPiCm30FpZdVoVqMiNpU5R+QpezEYOE1ILO1E
	C9dbFtYr6+rOndBPue4QFYw9YBMSc9SQwkMq/LhXn3zUn7MNN42vRMBvA94hJ5+MgSNVI9ShhaBDg
	qyGtGVaWVmI9Z8zN8l+i74z1d2OuB020i55p2TfW/zC5kg/npMKWHbwY0eY/l6fY5fbJ93Xl5UcP2
	HEoXx4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEe-00000002dt7-0bRj;
	Fri, 16 Oct 2026 10:32:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEP-00000002dcV-0MYM;
	Fri, 16 Oct 2026 10:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792146727;
	bh=i2eA1g8hDVZivBeAZaOHWG6zdSgE3ONYneQsyHDZBF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K27pmBMHZzU+7NVK8xmAja3oWC9Hj0xg4sgcGjS0yUfsnyLxBsmHPD7mS2cw4cGqN
	 H/ZUUkPiR2W9UiO8WtxyuXASvmNSX+Z2lHcN0UYXOFGzyHcJSHTVZELX2or2OYuy/p
	 4saUPA7JMNjtvQDwpTK1GvD2zs6mRtKPt8EC9sxyOaxL72YwmpOqIkW+82Zv1E/mYm
	 XANUA9nzuBDbcCZwCSLbboL1OT2OBtyX1l0azFbHJpaEZNaUmOf00Ug1duf5/MZv+y
	 MzD0c1o521+BpCD6WEg8gW+yeukGppoYW5FHB5p/A0GN5sdaQwRLJ0aS4GSERB5svn
	 sQwv221kl7ouw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 510B017E020C;
	Fri, 16 Oct 2026 12:32:06 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 12:31:13 +0200
Subject: [PATCH net-next v3 9/9] net: stmmac: mediatek: add support for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dwmac-mediatek-mt8189-v3-9-25daf2bbcf35@collabora.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146716; l=3119;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=i2eA1g8hDVZivBeAZaOHWG6zdSgE3ONYneQsyHDZBF8=;
 b=9yIUu0ofzyAAWDOQnO/YpjHDr+MOngyMS/O2iwlxiUts+wqjUGCc9WrenITtvMepTp6Grlj64
 UwLNfyetg6FCPEYMyoaCcIMLqTt37pAgepfdrAEOoUvJ+IqA/czy+1B
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_033209_314536_DC54DCD1 
X-CRM114-Status: GOOD (  15.21  )
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

Like MT8195 SoC, MT8189 SoC uses the Ethernet control registers from
the peripheral configuration (pericfg) but at a different offset.
It also has different RX and TX internal delay stage dividers (290ps
for MT8195, 180ps for MT8189), and by consequence a reduced value range
for these delays. It finally needs additional feature such as the
TX clock output enable one.

Thus, add compatible, clock definitions and specific platform data to
support the MT8189 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 147e217b8662..d480c339a16d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -45,8 +45,15 @@
 #define MT2712_RGMII_DLY_TXC_MAX	17600 /* 32 x 550ps */
 
 /* Peri Configuration register for mt8189 */
+#define MT8189_PERI_ETH_CTRL_OFFSET	0x270
+
 #define MT8189_CTRL0_TXC_OUT_OP_EN	BIT(20)
 
+#define MT8189_DLY_RXC_STAGE_DIV	180  /* 180ps per stage */
+#define MT8189_DLY_RXC_MAX		5760 /* 32 * 180ps */
+#define MT8189_DLY_TXC_STAGE_DIV	180  /* 180ps per stage */
+#define MT8189_DLY_TXC_MAX		5760 /* 32 * 180ps */
+
 /* Peri Configuration register for mt8195 */
 #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
 
@@ -134,6 +141,10 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
+static const char * const mt8189_dwmac_clk_l[] = {
+	"axi", "apb", "mac_main", "ptp_ref"
+};
+
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
@@ -495,6 +506,21 @@ static void mt8195_fix_mac_speed(void *priv, phy_interface_t interface,
 			   reg_val);
 }
 
+static const struct mediatek_dwmac_variant mt8189_gmac_variant = {
+	.dwmac_set_phy_interface = mt8195_set_interface,
+	.dwmac_set_delay = mt8195_set_delay,
+	.dwmac_fix_mac_speed = mt8195_fix_mac_speed,
+	.clk_list = mt8189_dwmac_clk_l,
+	.num_clks = ARRAY_SIZE(mt8189_dwmac_clk_l),
+	.dma_bit_mask = 35,
+	.rx_delay_max = MT8189_DLY_RXC_MAX,
+	.tx_delay_max = MT8189_DLY_TXC_MAX,
+	.rx_rgmii_delay_stage_div = MT8189_DLY_RXC_STAGE_DIV,
+	.tx_rgmii_delay_stage_div = MT8189_DLY_TXC_STAGE_DIV,
+	.peri_eth_ctrl_offset = MT8189_PERI_ETH_CTRL_OFFSET,
+	.mac_txclk_out_en = true,
+};
+
 static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_phy_interface = mt8195_set_interface,
 	.dwmac_set_delay = mt8195_set_delay,
@@ -751,6 +777,8 @@ static void mediatek_dwmac_remove(struct platform_device *pdev)
 static const struct of_device_id mediatek_dwmac_match[] = {
 	{ .compatible = "mediatek,mt2712-gmac",
 	  .data = &mt2712_gmac_variant },
+	{ .compatible = "mediatek,mt8189-gmac",
+	  .data = &mt8189_gmac_variant },
 	{ .compatible = "mediatek,mt8195-gmac",
 	  .data = &mt8195_gmac_variant },
 	{ }

-- 
2.56.0


