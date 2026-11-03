Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27788606A82E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XAXpqxYz;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TlPGrDQ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JZXhzsVLIvg1ViYjMYt6DpefmtHctMUokDfh6DTIEJM=; b=XAXpqxYzrPGNPy
	M7Esl3sfk60U0z7yaVuYiVF7aqyFVC0FCmmON0XU4hzByvQo/p/GxsaR6Ou6Odxp5ApbNGdiBlSiK
	JWK0WgBrwthao+b3PJJS/nujHmij9+DUnYFwj04MxG0bsUcrmwxg6ZL1BrGqCCvb9xjtkRAIPqD9F
	GM8eBkyu2TUjETMAvoBnp2TPZS6UK/wUh7ioLj5SB3jY82Qg6BKdZUd3WwuU1M2b6OibsY8ceXTd3
	cHhomiLYWkca3JG/FtX5V73eSiUmHAlf94Ort4kVLVKLAt6DsPtfl5fznPHslQ7iivDs44FU49uJR
	M+atWKpXPMji77sUOMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVh-00000001tsw-3Loa;
	Tue, 03 Nov 2026 10:12:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVV-00000001tcI-2iVO;
	Tue, 03 Nov 2026 10:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793700763;
	bh=VPSZwCEv5torKR+wmxwzRLGZCW+aC0AI03BYyCa/FbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TlPGrDQ6SYeW00GL3ML9skc+CPUOCEyXGZjC83KJupZffF/NO0Pn5P10Uw9Wm9ISW
	 gAj7DMXemydc+XXBIFx2S87gz4cSKdvO6evZgJiizPXgTTUJ/8gytr/ELkNfjempIe
	 mlPy/u+raeeEhHSWv4v8TrFRqgA15ar4PG+2XgHs17LGQoJDUmomOtKCjMkNUmYFXG
	 /P0w06TsxLhOrCdb1s9SqDHO6H1yi7NsYPx7Wj3W4tAlFdv+HswAm2ez+y5V3xbEOb
	 bqMh2SxYuBg1ESbXPorTR5SkFFdeOtSL0IM7qf1Yq79zxxkGOcgGeaufZHVv4SHFaY
	 umfEnFRvTBZxw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D91B117E0D43;
	Tue, 03 Nov 2026 11:12:42 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Nov 2026 11:12:12 +0100
Subject: [PATCH net-next v4 07/10] net: stmmac: mediatek: add RX/TX delay
 stage divider in platform data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwmac-mediatek-mt8189-v4-7-c86c14fc50f4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700755; l=6197;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=VPSZwCEv5torKR+wmxwzRLGZCW+aC0AI03BYyCa/FbE=;
 b=ewgAlcbRpzDnffQJC187W4ii9iWdwbxC8lmeDj0Cl+n8HvRtHr9z0DEtf35EK1sIOXP9qVU8S
 3kt7iezNSQ3Cady6Zu8UBgK5jgPthHvLiyZ4rwp5Vue1UKvW1f7HrxQ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021246_647467_D848B7E6 
X-CRM114-Status: GOOD (  15.23  )
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

In preparation of newer SoC support, that have like MT8189 SoC
different RX and TX internal delay stage steps than MT8188/MT8195, add
the RX and TX delay stage divider values in the variant platform data
and replace the hardcoded value uses in mt2712_set_delay and
mt8195_set_delay.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 76 +++++++++++++---------
 1 file changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index b4abc20c8314..61bc1ff08cc4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -107,6 +107,8 @@ struct mediatek_dwmac_variant {
 
 	u32 mii_delay_max;
 	u32 rgmii_delay_max;
+	u16 mii_delay_stage_div;
+	u16 rgmii_delay_stage_div;
 	u8 dma_bit_mask;
 };
 
@@ -119,6 +121,36 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
+static int get_delay_stage(struct mediatek_dwmac_plat_data *plat,
+			   u32 *rx_val, u32 *tx_val)
+{
+	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+	u32 rx_delay_conf_val, tx_delay_conf_val;
+	u16 delay_stage_div;
+
+	if (phy_interface_mode_is_rgmii(plat->phy_mode)) {
+		/* RGMII case */
+		delay_stage_div = plat->variant->rgmii_delay_stage_div;
+		rx_delay_conf_val = mac_delay->rgmii_rx_delay;
+		tx_delay_conf_val = mac_delay->rgmii_tx_delay;
+	} else {
+		/* MII/RMII case */
+		delay_stage_div = plat->variant->mii_delay_stage_div;
+		rx_delay_conf_val = mac_delay->rx_delay;
+		tx_delay_conf_val = mac_delay->tx_delay;
+	}
+
+	if (!delay_stage_div) {
+		dev_err(plat->dev, "Invalid internal delay stage divider\n");
+		return -EINVAL;
+	}
+
+	*rx_val = rx_delay_conf_val / delay_stage_div;
+	*tx_val = tx_delay_conf_val / delay_stage_div;
+
+	return 0;
+}
+
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
@@ -142,14 +174,14 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	u32 rx_delay_stage_val, tx_delay_stage_val;
 	u32 delay_val = 0;
 	u32 fine_val = 0;
+	int ret;
+
+	ret = get_delay_stage(plat, &rx_delay_stage_val, &tx_delay_stage_val);
+	if (ret)
+		return ret;
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		rx_delay_stage_val = mac_delay->rx_delay
-				     / MT2712_MII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
-				     / MT2712_MII_DLY_STAGE_DIV;
-
 		delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE,
 					!!tx_delay_stage_val);
 		delay_val |= FIELD_PREP(ETH_DLY_TXC_STAGES,
@@ -163,11 +195,6 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 		delay_val |= FIELD_PREP(ETH_DLY_RXC_INV, mac_delay->rx_inv);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		rx_delay_stage_val = mac_delay->rx_delay
-				     / MT2712_MII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
-				     / MT2712_MII_DLY_STAGE_DIV;
-
 		if (plat->rmii_clk_from_mac) {
 			/* case 1: mac provides the rmii reference clock,
 			 * and the clock output to TXC pin.
@@ -225,11 +252,6 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		rx_delay_stage_val = mac_delay->rgmii_rx_delay
-				     / MT2712_RGMII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->rgmii_tx_delay
-				     / MT2712_RGMII_DLY_STAGE_DIV;
-
 		fine_val = ETH_FINE_DLY_GTXC | ETH_FINE_DLY_RXC;
 
 		delay_val |= FIELD_PREP(ETH_DLY_GTXC_ENABLE,
@@ -261,6 +283,8 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 	.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
 	.mii_delay_max = MT2712_MII_DELAY_MAX,
 	.rgmii_delay_max = MT2712_RGMII_DELAY_MAX,
+	.mii_delay_stage_div = MT2712_MII_DLY_STAGE_DIV,
+	.rgmii_delay_stage_div = MT2712_RGMII_DLY_STAGE_DIV,
 	.dma_bit_mask = 33,
 };
 
@@ -291,14 +315,14 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	u32 gtxc_delay_val = 0;
 	u32 rmii_delay_val = 0;
 	u32 delay_val = 0;
+	int ret;
+
+	ret = get_delay_stage(plat, &rx_delay_stage_val, &tx_delay_stage_val);
+	if (ret)
+		return ret;
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		rx_delay_stage_val = mac_delay->rx_delay
-				     / MT8195_MII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
-				     / MT8195_MII_DLY_STAGE_DIV;
-
 		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
 					!!tx_delay_stage_val);
 		delay_val |= FIELD_PREP(MT8195_DLY_TXC_STAGES,
@@ -312,11 +336,6 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 		delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV, mac_delay->rx_inv);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		rx_delay_stage_val = mac_delay->rx_delay
-				     / MT8195_MII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
-				     / MT8195_MII_DLY_STAGE_DIV;
-
 		if (plat->rmii_clk_from_mac) {
 			/* case 1: mac provides the rmii reference clock,
 			 * and the clock output to TXC pin.
@@ -372,11 +391,6 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		rx_delay_stage_val = mac_delay->rgmii_rx_delay
-				     / MT8195_RGMII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->rgmii_tx_delay
-				     / MT8195_RGMII_DLY_STAGE_DIV;
-
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
 					     !!tx_delay_stage_val);
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_STAGES,
@@ -415,6 +429,8 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
 	.mii_delay_max = MT8195_MII_DELAY_MAX,
 	.rgmii_delay_max = MT8195_RGMII_DELAY_MAX,
+	.mii_delay_stage_div = MT8195_MII_DLY_STAGE_DIV,
+	.rgmii_delay_stage_div = MT8195_RGMII_DLY_STAGE_DIV,
 	.dma_bit_mask = 35,
 };
 

-- 
2.56.0


