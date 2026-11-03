Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5313B6083615
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UIyJIHdr;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MnaSJxZ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/rd//ZDdO+MZKKO3ezoxvx5OOdgP341hQCUAB+a47OU=; b=UIyJIHdrT5ECfq
	CsNfy12QRTtOf60LZUh9IC3xJOQsOr8E97cCIesuEXaCI59BFSUv7jZh4ZbJnwKH2QG8lBvvxl7aM
	sM2Yq6s4MSoAmw6yZ+pXbmlwofc/3oRzTC2HZNW0KMqiQu2h+wrVC7noTEsTNKGKw+3oNShQ9b3N/
	gt0kdZWUNPjzgJofrPtcIXx2/uSJ6/VpCJfSkhI6iItadvQxZGQkUDyaZzYDqeWRLnnl1Lf53amca
	uky8qBazIg1HXsB2t/F2e5Prz83JfK0zE/cCZOi8d1T6aiu7s4jHG/GZ2klvRN88/wvMj2nQH2OqA
	sZiMOtiEgqczzKMjNl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVh-00000001trw-2bxr;
	Tue, 03 Nov 2026 10:12:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVU-00000001tbd-2npl;
	Tue, 03 Nov 2026 10:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793700762;
	bh=EJGN37Ey3EhmvVVvzwrvC1ymlngy/bd0/j1H7VTyw9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnaSJxZ9xdPkB2mxGOjpKSMNY07Gkr1suFKDP1LNRJn7fcMSdZ7BynlV85sCjpqQH
	 tzzjRfenPdK5Efg/CwKc5EMar70Fl4+WsIgtPaeJJ35Z5GHufBpWQHMokDy+5i8dy8
	 STXEidQnz8xzIzKfrGrql8b3Eu5ouQHliohv5JlrxXGfRU14F+MB+T9omY0DFcNCK6
	 kjrcClcTvDsVhOt/FKdXPHauXLxaRypvgH6/d2YnvKOX4WvZvt2F5cjhUjGsOGDAKr
	 Edttv2mjBBiPZUz9RCB35K78DvjBdwTE4S3qKn49o5cMkHwe1C8ewCMv98SMIWNjFI
	 UdQlRqDEnhCxw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8BEC17E0D3B;
	Tue, 03 Nov 2026 11:12:41 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Nov 2026 11:12:11 +0100
Subject: [PATCH net-next v4 06/10] net: stmmac: mediatek: use standard
 internal delay properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwmac-mediatek-mt8189-v4-6-c86c14fc50f4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700755; l=6731;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=EJGN37Ey3EhmvVVvzwrvC1ymlngy/bd0/j1H7VTyw9M=;
 b=IN0zDnnvKMNvGlzFmC72azHT05TcYnFb5vOCey82BhS8qlOrPZq2sUzfL92fboOl4gNP/cDjF
 f2RbIephHTlCHmApIsd81prRuubRLelEhVjZBJLyizb4e+J0UwdSNIo
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021246_677331_C2AB923A 
X-CRM114-Status: GOOD (  16.72  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, the mediatek-dwmac driver uses the 'mediatek,rx-delay-ps'
and 'mediatek,tx-delay-ps' vendor properties for configuring the RX and
TX internal clock delays for all its supported PHY modes (MII, RMII,
and RGMII).

The generic Ethernet controller bindings provide 'rx-internal-delay-ps'
and 'tx-internal-delay-ps' standard properties to describe the RGMII RX
and TX internal clock delays. Their use is now recommended, rather than
existing vendor properties.
There is no equivalent standard properties for RMII and MII case at the
moment.

So, add in driver data separate config values for MII/RMII and RGMII
delays and modify mediatek_dwmac_config_dt, used to parse devicetree
to populate and check these configs with the following logic:
 - read vendor properties for MII and RMII delay timings
 - read standard properties for RGMII delay timings
 - if not available, fallback to vendor values

Also, modify mt2712/mt8195_set_delay to use these new separate config
values.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 87 +++++++++++++++-------
 1 file changed, 62 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index cda3f3edde39..b4abc20c8314 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -76,6 +76,8 @@
 struct mac_delay_struct {
 	u32 tx_delay;
 	u32 rx_delay;
+	u32 rgmii_tx_delay;
+	u32 rgmii_rx_delay;
 	bool tx_inv;
 	bool rx_inv;
 };
@@ -103,8 +105,8 @@ struct mediatek_dwmac_variant {
 	const char * const *clk_list;
 	int num_clks;
 
-	u32 rx_delay_max;
-	u32 tx_delay_max;
+	u32 mii_delay_max;
+	u32 rgmii_delay_max;
 	u8 dma_bit_mask;
 };
 
@@ -223,9 +225,9 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		rx_delay_stage_val = mac_delay->rx_delay
+		rx_delay_stage_val = mac_delay->rgmii_rx_delay
 				     / MT2712_RGMII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
+		tx_delay_stage_val = mac_delay->rgmii_tx_delay
 				     / MT2712_RGMII_DLY_STAGE_DIV;
 
 		fine_val = ETH_FINE_DLY_GTXC | ETH_FINE_DLY_RXC;
@@ -257,8 +259,8 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 	.dwmac_set_delay = mt2712_set_delay,
 	.clk_list = mt2712_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
-	.rx_delay_max = MT2712_MII_DELAY_MAX,
-	.tx_delay_max = MT2712_MII_DELAY_MAX,
+	.mii_delay_max = MT2712_MII_DELAY_MAX,
+	.rgmii_delay_max = MT2712_RGMII_DELAY_MAX,
 	.dma_bit_mask = 33,
 };
 
@@ -370,9 +372,9 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		rx_delay_stage_val = mac_delay->rx_delay
+		rx_delay_stage_val = mac_delay->rgmii_rx_delay
 				     / MT8195_RGMII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
+		tx_delay_stage_val = mac_delay->rgmii_tx_delay
 				     / MT8195_RGMII_DLY_STAGE_DIV;
 
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
@@ -411,15 +413,18 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_delay = mt8195_set_delay,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
-	.rx_delay_max = MT8195_MII_DELAY_MAX,
-	.tx_delay_max = MT8195_MII_DELAY_MAX,
+	.mii_delay_max = MT8195_MII_DELAY_MAX,
+	.rgmii_delay_max = MT8195_RGMII_DELAY_MAX,
 	.dma_bit_mask = 35,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-	u32 tx_delay_ps, rx_delay_ps;
+	u32 rgmii_tx_delay_ps = 0;
+	u32 rgmii_rx_delay_ps = 0;
+	u32 tx_delay_ps = 0;
+	u32 rx_delay_ps = 0;
 
 	plat->peri_regmap = syscon_regmap_lookup_by_phandle(plat->np, "mediatek,pericfg");
 	if (IS_ERR(plat->peri_regmap)) {
@@ -427,24 +432,56 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 		return PTR_ERR(plat->peri_regmap);
 	}
 
-	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
-		if (tx_delay_ps < plat->variant->tx_delay_max) {
-			mac_delay->tx_delay = tx_delay_ps;
-		} else {
-			dev_err(plat->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
-			return -EINVAL;
-		}
+	of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);
+	if (tx_delay_ps >= plat->variant->mii_delay_max) {
+		dev_err(plat->dev, "Invalid TX clock delay: %dps\n",
+			tx_delay_ps);
+		return -EINVAL;
 	}
 
-	if (!of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps)) {
-		if (rx_delay_ps < plat->variant->rx_delay_max) {
-			mac_delay->rx_delay = rx_delay_ps;
-		} else {
-			dev_err(plat->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
-			return -EINVAL;
-		}
+	/* Read RGMII TX internal delay standard property */
+	if (of_property_read_u32(plat->np, "tx-internal-delay-ps",
+				 &rgmii_tx_delay_ps)) {
+		/*
+		 * standard property value not available, fallback on vendor
+		 * value instead
+		 */
+		rgmii_tx_delay_ps = tx_delay_ps;
+	}
+
+	if (rgmii_tx_delay_ps >= plat->variant->rgmii_delay_max) {
+		dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
+			rgmii_tx_delay_ps);
+		return -EINVAL;
+	}
+
+	of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps);
+	if (rx_delay_ps >= plat->variant->mii_delay_max) {
+		dev_err(plat->dev, "Invalid RX clock delay: %dps\n",
+			rx_delay_ps);
+		return -EINVAL;
+	}
+
+	/* Read RGMII RX internal delay standard property */
+	if (of_property_read_u32(plat->np, "rx-internal-delay-ps",
+				 &rgmii_rx_delay_ps)) {
+		/*
+		 * standard property value not available, fallback on vendor
+		 * value instead
+		 */
+		rgmii_rx_delay_ps = rx_delay_ps;
+	}
+
+	if (rgmii_rx_delay_ps >= plat->variant->rgmii_delay_max) {
+		dev_err(plat->dev, "Invalid RGMII RX clock delay: %dps\n",
+			rgmii_tx_delay_ps);
+		return -EINVAL;
 	}
 
+	mac_delay->rx_delay = rx_delay_ps;
+	mac_delay->tx_delay = tx_delay_ps;
+	mac_delay->rgmii_tx_delay = rgmii_tx_delay_ps;
+	mac_delay->rgmii_rx_delay = rgmii_rx_delay_ps;
 	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
 	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
 	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");

-- 
2.56.0


