Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7920CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVWzBWolNb7/3cWSgXWCuO2Me5i6M9ko/70PWgwjB5w=; b=R1yLj2mGMn+ddE641KnsQxJnL8
	ddI4RXeW54IfI+EYIYq+qD3/tOvYsSJWEaIN4mk61Nwgp219HfJK6H0cGu1j5lQ6+W9uXZdpM11bo
	WaadwGTXZQ26AW/HK86b04HIPQztpgcxFKJqeIEWwJ2PploOkDGbblKqM6tgl9ai93GsPHYvxbAwZ
	kZRLYp1omjXoaRralDX3Ash8vWxdCLUbm5v5TUGXwGT3YLlFrQe9QkBDMMGkBJp51vgRNo0naySws
	NXh67xjgKvtDmRipvpkIXz8NXqUKedQHZCza8zbbVfLz0Hz3nnRjYh5KkjfDU6kTStwMlGcR1zcFd
	OiGTZCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEV-00000002dlw-25KK;
	Fri, 16 Oct 2026 10:32:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEL-00000002dZg-2o8s;
	Fri, 16 Oct 2026 10:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792146723;
	bh=VFqBuDg+MHmypOZ1tY1WQ2KCI8cVVVwGmugyCH+F/Rk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nGWnhFltN46q2pDuBt67YVVjFMnAM6Zfkhgg4d3zuvLT+UV0SUH+reX83HVd1qwzV
	 3PMMANNq/GleFXEWV0k2+39V1oFtRZZ1iDKO9l7KGHH5JvG2Uxr55wCISGiig+FKAy
	 aoxqMhcLUrZnTbWQBB5iVHLNfJqLg30uj2nX8lzRNsplJ3FNeG2ZViTJvN3MPFB2RR
	 dfZj7zAiJqPXjNxlr8BdjnVHmjX3cIJfdvMo8MCm1FMpR/OIkcvyLgAaCXEFzO2CRN
	 mWzc7g55S1pEdT/TzGQPFY/2+Gv9Y2+Nm4PivTffFUkhEhFQXUFhPpF8W8axkXmSuo
	 XtqJIMWDpMIdA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0522F17E0A5D;
	Fri, 16 Oct 2026 12:32:02 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 12:31:10 +0200
Subject: [PATCH net-next v3 6/9] net: stmmac: mediatek: add PERI_ETH_CTRLx
 register offset in platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dwmac-mediatek-mt8189-v3-6-25daf2bbcf35@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146716; l=4318;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=VFqBuDg+MHmypOZ1tY1WQ2KCI8cVVVwGmugyCH+F/Rk=;
 b=cA3ClWS5m1dqYMiQDYBriRcoxVts4Oxb09+EM096jX239JnsIgRHHUY97gTfEQjuzV/t02uTZ
 h9IS2yHSlo9CPhMzMU4vnkHqaSg7/Fapbyhprasa0Byh5lBkPr3+XYO
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_033205_869321_6141E3D2 
X-CRM114-Status: GOOD (  14.97  )
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

In preparation of newer SoC support, that use like MT8195 the Ethernet
control registers from the peripheral configuration syscon but at a
different base offset, add a new base offset in the variant platform
data to access the PERI_ETH_CTRLx registers and use it in implemented
methods.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index cb5bda53edb9..7dd46cd5a49e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -45,7 +45,9 @@
 #define MT2712_RGMII_DLY_TXC_MAX	17600 /* 32 x 550ps */
 
 /* Peri Configuration register for mt8195 */
-#define MT8195_PERI_ETH_CTRL0		0xFD0
+#define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
+
+#define MT8195_PERI_ETH_CTRL0		0x0
 #define MT8195_RMII_CLK_SRC_INTERNAL	BIT(28)
 #define MT8195_RMII_CLK_SRC_RXC		BIT(27)
 #define MT8195_ETH_INTF_SEL		GENMASK(26, 24)
@@ -55,7 +57,7 @@
 #define MT8195_DLY_GTXC_ENABLE		BIT(5)
 #define MT8195_DLY_GTXC_STAGES		GENMASK(4, 0)
 
-#define MT8195_PERI_ETH_CTRL1		0xFD4
+#define MT8195_PERI_ETH_CTRL1		0x4
 #define MT8195_DLY_RXC_INV		BIT(25)
 #define MT8195_DLY_RXC_ENABLE		BIT(18)
 #define MT8195_DLY_RXC_STAGES		GENMASK(17, 13)
@@ -63,7 +65,7 @@
 #define MT8195_DLY_TXC_ENABLE		BIT(5)
 #define MT8195_DLY_TXC_STAGES		GENMASK(4, 0)
 
-#define MT8195_PERI_ETH_CTRL2		0xFD8
+#define MT8195_PERI_ETH_CTRL2		0x8
 #define MT8195_DLY_RMII_RXC_INV		BIT(25)
 #define MT8195_DLY_RMII_RXC_ENABLE	BIT(18)
 #define MT8195_DLY_RMII_RXC_STAGES	GENMASK(17, 13)
@@ -106,6 +108,7 @@ struct mediatek_dwmac_variant {
 	const char * const *clk_list;
 	int num_clks;
 
+	u32 peri_eth_ctrl_offset;
 	u32 rx_delay_max;
 	u32 tx_delay_max;
 	u16 rx_rmii_delay_stage_div;
@@ -281,6 +284,7 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
 	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
+	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 
 	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
 		if (plat->rmii_clk_from_mac)
@@ -292,7 +296,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	/* MT8195 only support external PHY */
 	intf_val |= MT8195_EXT_PHY_MODE;
 
-	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL0, intf_val);
+	regmap_write(plat->peri_regmap,
+		     reg_offset + MT8195_PERI_ETH_CTRL0,
+		     intf_val);
 
 	return 0;
 }
@@ -302,6 +308,7 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	u16 rx_delay_stage_div = plat->variant->rx_rgmii_delay_stage_div;
 	u16 tx_delay_stage_div = plat->variant->tx_rgmii_delay_stage_div;
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 	u32 rx_delay_stage_val;
 	u32 tx_delay_stage_val;
 	u32 gtxc_delay_val = 0;
@@ -407,14 +414,18 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	}
 
 	regmap_update_bits(plat->peri_regmap,
-			   MT8195_PERI_ETH_CTRL0,
+			   reg_offset + MT8195_PERI_ETH_CTRL0,
 			   MT8195_RGMII_TXC_PHASE_CTRL |
 			   MT8195_DLY_GTXC_INV |
 			   MT8195_DLY_GTXC_ENABLE |
 			   MT8195_DLY_GTXC_STAGES,
 			   gtxc_delay_val);
-	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL1, delay_val);
-	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL2, rmii_delay_val);
+	regmap_write(plat->peri_regmap,
+		     reg_offset + MT8195_PERI_ETH_CTRL1,
+		     delay_val);
+	regmap_write(plat->peri_regmap,
+		     reg_offset + MT8195_PERI_ETH_CTRL2,
+		     rmii_delay_val);
 
 	return 0;
 }
@@ -429,6 +440,7 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.rx_rgmii_delay_stage_div = MT8195_DLY_RXC_STAGE_DIV,
 	.tx_rgmii_delay_stage_div = MT8195_DLY_TXC_STAGE_DIV,
 	.dma_bit_mask = 35,
+	.peri_eth_ctrl_offset = MT8195_PERI_ETH_CTRL_OFFSET,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)

-- 
2.56.0


