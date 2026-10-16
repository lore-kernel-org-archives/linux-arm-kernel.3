Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02698CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtX6moLiEDyyb54iFO36REzn2dsxYfnFv7RF12DwwdA=; b=p3w9nCVjHkGi0IuZ2ZW+0uZt4L
	LH4eFqMf/nl0deyz3tPit/wJ+w7n5WXOvy0fEws3e0QKrBC+2YMox3/eldBxmc+GYLLuieSQQGImm
	walZEoZ5hQWs0IFqe19BI+zyZG/9or+QNRLXc7I7yalO4BfGF2c8BeuN1tERsWgSluGtJsonDJgh0
	AyT66U8RNUFwJwk58kVriCPWQp3VsjlLCaN2SJQ5pvmUS/Bzg+2ZLA8rxzH6s98FFPaK27gU2MSr8
	FUykEhtFb3PZLvlCP8KdJvRhBQHRocLCPTNGFmXghxdgjZI1gELAUE8ap6vmei9CHbbo8JLd4ZfnQ
	xYcm/Neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEd-00000002dsW-40tf;
	Fri, 16 Oct 2026 10:32:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEM-00000002dad-3yWH;
	Fri, 16 Oct 2026 10:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792146725;
	bh=Ev55+tgmhSJO+uziRYJNFGaoM3W5u7vYucKkCPu54NY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QRNE9vVr6+OV4GmISThs/htm3+vdpqPN01hPmVCrIpFoYS468R2q6OuZPaecpW1QH
	 VroQXPwvoc06iJYIsSsXJWHCuQDu3mCt0+YmgVUKA3yE2GQKdV7spmGKybUVlOgCR8
	 kvpUri6jdf+64mZ2ekImdwNQBNp/0JlSJ8dzDBp2TCEy7WXWB3hbU0Ilq0yUTt20cS
	 ZCNoKsEVE4z2RWge0NZ0/Jz5pUU2w9tM0n8YV7LoZBcVcvqBm/8YBFFyGa93WX4n0C
	 4l3wCrPjJDG/GXSHEI3bnKOXzoDJYc2PKDddCePA8BPjyJ2zlwM2iRcGXABOHz4vS4
	 yQf08vCecwZBA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F40917E0A5F;
	Fri, 16 Oct 2026 12:32:04 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 12:31:11 +0200
Subject: [PATCH net-next v3 7/9] net: stmmac: mediatek: use TX clock phase
 shift in RGMII mode with 1Gbps speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dwmac-mediatek-mt8189-v3-7-25daf2bbcf35@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146716; l=5192;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Ev55+tgmhSJO+uziRYJNFGaoM3W5u7vYucKkCPu54NY=;
 b=xQaJp8M7VImuQGCBpE8lI/kabQra9OAnuRKQlLcXlQlGJbyweHSIfFHq7K8h8XiCff/DEMf98
 kNNPwSLfUL4BiS/sHSFlQloMcL1jBM8fOVQjYbyCpjzPMPUaZqp2noL
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_033207_151351_65A0F743 
X-CRM114-Status: GOOD (  23.47  )
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

Currently, if the devicetree of a board based on MT8195 (or compatible)
configures the use of RGMII PHY mode and insert at MAC level additional
delay on TX clock at MAC (with "mediatek,tx-delay-ps" vendor property
presence), the driver inserts this delay by setting TX coarse delay
bits (bit 0 to 5) of the Ethernet control 0 register from the
peripheral configuration (pericfg) at probe time.

The HW delay macro circuit, that these bits enable, can be affected by
external factors such as environment temperature or vcore voltage and
thus applied delay value can change. For 10/100M link speed cases the
variations are not problematic, but it can be for 1G link speed cases,
that require much precise and stable timings (around 2ns).

The Ethernet control 0 register of MT8195 SoC has another bit (bit 22:
MT8195_RGMII_TXC_PHASE_CTR) to enable the TX clock phase shift and
insert a 2ns clock delay in a more consistence way, as it is not
affected like the HW delay macro circuit under the same conditions.
This only works though for 1G speed cases so it cannot be set
unconditionally at probe time, thus needs to be set after link speed
negotiation.

In order to allow the TX clock phase shift use in the driver, add in
the variant platform data and probe sequence the support of
fix_mac_speed callback, provided by dwmac core. This callback allows
driver configuration update when the link speed has been negotiated.
Implement it for MT8195 so that, when a delay needs to be inserted
for TX clock (due to the devicetree configuration), it enables the
TX clock phase shift in Ethernet control 0 register only and only if
the PHY mode allows it and negotiated link speed is 1G, and fallback
to the HW delay macro circuit otherwise.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 7dd46cd5a49e..4b2d5280f703 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -104,6 +104,9 @@ struct mediatek_dwmac_variant {
 				       u8 phy_intf_sel);
 	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
 
+	void (*dwmac_fix_mac_speed)(void *priv, phy_interface_t interface,
+				    int speed, unsigned int mode);
+
 	/* clock ids to be requested */
 	const char * const *clk_list;
 	int num_clks;
@@ -430,9 +433,65 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	return 0;
 }
 
+static void mt8195_fix_mac_speed(void *priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
+{
+	struct mediatek_dwmac_plat_data *priv_plat = priv;
+	const struct mediatek_dwmac_variant *variant;
+	struct mac_delay_struct *mac_delay;
+	u32 tx_delay_stage_val, reg_offset;
+	u32 reg_val = 0;
+
+	if (!priv_plat)
+		return;
+
+	mac_delay = &priv_plat->mac_delay;
+	variant = priv_plat->variant;
+
+	if (!mac_delay->tx_delay ||
+	    (interface != PHY_INTERFACE_MODE_RGMII &&
+	     interface != PHY_INTERFACE_MODE_RGMII_RXID))
+		return;
+
+	/*
+	 * When link speed is 1Gbps with RGMII interface, and a TX internal
+	 * delay needs to be applied on MAC, prefer to override the delay
+	 * settings with a 2ns fixed delay which is controlled by
+	 * RGMII_TXC_PHASE_CTRL. Otherwise, fallback to HW delay macro circuit
+	 * for 10/100Mbps link speeds.
+	 */
+	if (speed == SPEED_1000) {
+		reg_val = MT8195_RGMII_TXC_PHASE_CTRL;
+	} else {
+		if (variant->tx_rgmii_delay_stage_div) {
+			tx_delay_stage_val = mac_delay->tx_delay /
+					     variant->tx_rgmii_delay_stage_div;
+		} else {
+			tx_delay_stage_val = 0;
+		}
+
+		reg_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
+				      !!tx_delay_stage_val);
+		reg_val |= FIELD_PREP(MT8195_DLY_GTXC_STAGES,
+				      tx_delay_stage_val);
+		reg_val |= FIELD_PREP(MT8195_DLY_GTXC_INV,
+				      mac_delay->tx_inv);
+	}
+
+	reg_offset = variant->peri_eth_ctrl_offset + MT8195_PERI_ETH_CTRL0;
+	regmap_update_bits(priv_plat->peri_regmap,
+			   reg_offset,
+			   MT8195_RGMII_TXC_PHASE_CTRL |
+			   MT8195_DLY_GTXC_ENABLE |
+			   MT8195_DLY_GTXC_INV |
+			   MT8195_DLY_GTXC_STAGES,
+			   reg_val);
+}
+
 static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_phy_interface = mt8195_set_interface,
 	.dwmac_set_delay = mt8195_set_delay,
+	.dwmac_fix_mac_speed = mt8195_fix_mac_speed,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
 	.rx_delay_max = MT8195_DLY_RXC_MAX,
@@ -591,6 +650,9 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	plat->resume = mediatek_dwmac_init;
 	plat->clks_config = mediatek_dwmac_clks_config;
 
+	if (priv_plat->variant->dwmac_fix_mac_speed)
+		plat->fix_mac_speed = priv_plat->variant->dwmac_fix_mac_speed;
+
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);

-- 
2.56.0


