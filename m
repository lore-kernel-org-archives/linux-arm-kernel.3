Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E78606B111
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UkXr1g0z;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bT4qjTDD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YzQBxDywg53L/d7II1zv+CoUHO7/4sl0WQuSbexemXU=; b=UkXr1g0z7DOVID
	nslZ9Oe4CignfnLo2JLe/bZMa92oSLfsMjZ1oTS5EzSE1uARW+lRjYQdiBEt7hYwh/GP6AQxYrTc/
	EDm4vc+NYVbbc/uEROsVNHRJGC0s7dQWmjAMr4OM0iUv4pVgU5G2nAxvhHYxe7Qxh3v389Go91oQc
	3+c1wih43rzpinM9BqRjk10NzDDoGoKiiEG5GuWqsx6L7q2XLNmGJzfnlT4KFlBtPKqffVW0Wn6DQ
	/khf22VE5ljJDOkQnJMTrYrKBMpmYjnTcIyZ8nRnCMEPbvDfLsR13fDh6p8tFkwsetWnVwaOnGrL5
	3fd7CeKwI2neiM+MNe5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVm-00000001tzc-33ZQ;
	Tue, 03 Nov 2026 10:13:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVW-00000001tcc-368k;
	Tue, 03 Nov 2026 10:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793700764;
	bh=fgRG/Qp5WV1QVNiuGm1kV55/qVJ1752aXcE75rXacDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bT4qjTDD8nhVuE2QOXMBQeQQzT9j7dnABNRCT9UJTxfgA11T5bhdPr+OrFwgS3k3H
	 1TFoQ6IlZ66BJ1yGFj6SsLoMONaohJZEMci8HJp5uFvcHLBqYy3ncsUYOhiolCp1T0
	 QF+6MjpZdtHCDcNMeXVQ9nvxcQHqpsJ97GSOI+u2kx4LibG4hmI/SPE7EYX1PCpqEJ
	 qqCqyJTt1wcTJ1+UiG4bVrcdCwgAjjohREhcQyQudxILPc8tY7MGQRP/Vs6EFSbWi7
	 miNowF+/QwjxQApfKuI6c8f5WPsKBZlQoPOVhyoxYZIdgLh6U8i/aFZbSDDxae1fNJ
	 7u/tHcq6nNxBQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAEC317E0D48;
	Tue, 03 Nov 2026 11:12:43 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Nov 2026 11:12:13 +0100
Subject: [PATCH net-next v4 08/10] net: stmmac: mediatek: add
 PERI_ETH_CTRLx register offset in platform data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwmac-mediatek-mt8189-v4-8-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700755; l=4252;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=fgRG/Qp5WV1QVNiuGm1kV55/qVJ1752aXcE75rXacDY=;
 b=3v6Sd2ufLqjqoYS8sbLNQO/XBHltzdUWz8j+vLUnIhNiWcExXGEmDeterfwVsw0ebv1vF9Ba1
 nzA+ia0C0NZDE/XXT777Lp+tCfntNgoBtcmkpyrHV7eDl9vtD64ymXx
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021247_113771_E01B3A43 
X-CRM114-Status: GOOD (  14.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 61bc1ff08cc4..0426a0876956 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -42,7 +42,9 @@
 #define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */
 
 /* Peri Configuration register for mt8195 */
-#define MT8195_PERI_ETH_CTRL0		0xFD0
+#define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
+
+#define MT8195_PERI_ETH_CTRL0		0x0
 #define MT8195_RMII_CLK_SRC_INTERNAL	BIT(28)
 #define MT8195_RMII_CLK_SRC_RXC		BIT(27)
 #define MT8195_ETH_INTF_SEL		GENMASK(26, 24)
@@ -52,7 +54,7 @@
 #define MT8195_DLY_GTXC_ENABLE		BIT(5)
 #define MT8195_DLY_GTXC_STAGES		GENMASK(4, 0)
 
-#define MT8195_PERI_ETH_CTRL1		0xFD4
+#define MT8195_PERI_ETH_CTRL1		0x4
 #define MT8195_DLY_RXC_INV		BIT(25)
 #define MT8195_DLY_RXC_ENABLE		BIT(18)
 #define MT8195_DLY_RXC_STAGES		GENMASK(17, 13)
@@ -60,7 +62,7 @@
 #define MT8195_DLY_TXC_ENABLE		BIT(5)
 #define MT8195_DLY_TXC_STAGES		GENMASK(4, 0)
 
-#define MT8195_PERI_ETH_CTRL2		0xFD8
+#define MT8195_PERI_ETH_CTRL2		0x8
 #define MT8195_DLY_RMII_RXC_INV		BIT(25)
 #define MT8195_DLY_RMII_RXC_ENABLE	BIT(18)
 #define MT8195_DLY_RMII_RXC_STAGES	GENMASK(17, 13)
@@ -109,6 +111,7 @@ struct mediatek_dwmac_variant {
 	u32 rgmii_delay_max;
 	u16 mii_delay_stage_div;
 	u16 rgmii_delay_stage_div;
+	u32 peri_eth_ctrl_offset;
 	u8 dma_bit_mask;
 };
 
@@ -292,6 +295,7 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
 	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
+	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 
 	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
 		if (plat->rmii_clk_from_mac)
@@ -303,7 +307,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	/* MT8195 only support external PHY */
 	intf_val |= MT8195_EXT_PHY_MODE;
 
-	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL0, intf_val);
+	regmap_write(plat->peri_regmap,
+		     reg_offset + MT8195_PERI_ETH_CTRL0,
+		     intf_val);
 
 	return 0;
 }
@@ -311,6 +317,7 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 	u32 rx_delay_stage_val, tx_delay_stage_val;
 	u32 gtxc_delay_val = 0;
 	u32 rmii_delay_val = 0;
@@ -410,14 +417,18 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
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
@@ -432,6 +443,7 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.mii_delay_stage_div = MT8195_MII_DLY_STAGE_DIV,
 	.rgmii_delay_stage_div = MT8195_RGMII_DLY_STAGE_DIV,
 	.dma_bit_mask = 35,
+	.peri_eth_ctrl_offset = MT8195_PERI_ETH_CTRL_OFFSET,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)

-- 
2.56.0


