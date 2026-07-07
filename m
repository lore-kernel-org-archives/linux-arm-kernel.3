Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ88S9xDrHlGZhPJnmjusnykZhyDYEhKMzkVwW6u5CE=; b=TNf4OjXTLq+np5VrHc0TV8Z366
	7uBES3no2XWxZ+MhiKZyBRKo89fFqdadmGEdTGM8pUl6ps4Aw0cSYiC8fb9x/OHQOF84vyCEz+cmS
	0Kcz5nZu4e+zdtCQmpsK8k1gLTFv7CDMRec0K4kTFm+IbHVQaJlEquhudZj7TWiOuhsDAe2H8mt79
	RUSrgsfgNgjj7nYDI8/r+LkS3mirykwFkKNpht77DzyCNmh2HV9HYCGrnIui9YQLq+rW6jZitfyj/
	TJBTyzuxw14a6I2hTuH8mWLTGcWLSpJyfxLuT4aOlAbqynsDCUC4KQRuikXPK7fBTkX6aR3hjHPSf
	5kd/qdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13u-0000000ES4i-1knB;
	Tue, 07 Jul 2026 08:21:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13j-0000000ERvP-1lQD;
	Tue, 07 Jul 2026 08:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783412497;
	bh=rn+h6E9crTmTz6FeyLcR9ekRM3gKcnx7ZytFNlkAdFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EbIy0yCM6Xjop0S4NBqYIiw0/0tuGqyG3AscIjPdYcY3CVVPRyAfRQelLfNHdMb3U
	 PwHKglb7kKyTcuMnQ5n/QqUgmqnPXeDrdcWHxVaXbPRXu+fWGR6+Hq2pB92GjjFi2D
	 yTpz7CBsz6rfAzWYBMUMroljwAqTrGqxHD4rcl10PH9kNqk+ZkjfCdk/b3biicR7lo
	 oQHJ+8n7M9G2vnwGSZJluyXIBfQ2iHI2ZNq/jJWJ9mC0iSeLIua7ZReYQvRtqP3zPe
	 aYKC5eSB+Gaaj73+w7OXL79EzfCVndW4tdTw5Dvj116uAWikmNVmjU1QfVCWjhzSIE
	 ET2OkGpfciTRw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52BAA17E0CDE;
	Tue, 07 Jul 2026 10:21:36 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 07 Jul 2026 10:21:20 +0200
Subject: [PATCH net-next 2/6] net: stmmac: mediatek: add PERI_ETH_CTRLx
 register offset in platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dwmac-mediatek-mt8189-v1-2-17f345eaaca3@collabora.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, 
 kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783412493; l=4145;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rn+h6E9crTmTz6FeyLcR9ekRM3gKcnx7ZytFNlkAdFc=;
 b=UAKb+wXQKcB5/p4YdbNOyXQMoqNpBez8ppGNqQFLQwt7dFu9sOpqg4ZbVLWJX8QB5LvXt8Ad8
 ZzvlmwEgXqYBnqGtrwTQMw3CKw1C668o7ow0K71CtHub0CvBM6pbdm1
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012139_617014_D5B099BD 
X-CRM114-Status: GOOD (  15.90  )
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

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 28 +++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 30ae0dba7fff..0cabab4fd89a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -37,7 +37,9 @@
 #define ETH_FINE_DLY_RXC	BIT(0)
 
 /* Peri Configuration register for mt8195 */
-#define MT8195_PERI_ETH_CTRL0		0xFD0
+#define MT8195_PERI_ETH_CTRL_BASE	0xFD0
+
+#define MT8195_PERI_ETH_CTRL0		0x0
 #define MT8195_RMII_CLK_SRC_INTERNAL	BIT(28)
 #define MT8195_RMII_CLK_SRC_RXC		BIT(27)
 #define MT8195_ETH_INTF_SEL		GENMASK(26, 24)
@@ -47,7 +49,7 @@
 #define MT8195_DLY_GTXC_ENABLE		BIT(5)
 #define MT8195_DLY_GTXC_STAGES		GENMASK(4, 0)
 
-#define MT8195_PERI_ETH_CTRL1		0xFD4
+#define MT8195_PERI_ETH_CTRL1		0x4
 #define MT8195_DLY_RXC_INV		BIT(25)
 #define MT8195_DLY_RXC_ENABLE		BIT(18)
 #define MT8195_DLY_RXC_STAGES		GENMASK(17, 13)
@@ -55,7 +57,7 @@
 #define MT8195_DLY_TXC_ENABLE		BIT(5)
 #define MT8195_DLY_TXC_STAGES		GENMASK(4, 0)
 
-#define MT8195_PERI_ETH_CTRL2		0xFD8
+#define MT8195_PERI_ETH_CTRL2		0x8
 #define MT8195_DLY_RMII_RXC_INV		BIT(25)
 #define MT8195_DLY_RMII_RXC_ENABLE	BIT(18)
 #define MT8195_DLY_RMII_RXC_STAGES	GENMASK(17, 13)
@@ -95,6 +97,7 @@ struct mediatek_dwmac_variant {
 
 	u32 rx_delay_max;
 	u32 tx_delay_max;
+	u32 peri_eth_ctrl_offset;
 	u8 dma_bit_mask;
 };
 
@@ -277,6 +280,7 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
 	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
+	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 
 	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
 		if (plat->rmii_clk_from_mac)
@@ -288,7 +292,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	/* MT8195 only support external PHY */
 	intf_val |= MT8195_EXT_PHY_MODE;
 
-	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL0, intf_val);
+	regmap_write(plat->peri_regmap,
+		     reg_offset + MT8195_PERI_ETH_CTRL0,
+		     intf_val);
 
 	return 0;
 }
@@ -313,8 +319,9 @@ static void mt8195_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
 
 static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
-	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 gtxc_delay_val = 0, delay_val = 0, rmii_delay_val = 0;
+	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 
 	mt8195_delay_ps2stage(plat);
 
@@ -399,14 +406,18 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
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
 
 	mt8195_delay_stage2ps(plat);
 
@@ -421,6 +432,7 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.rx_delay_max = 9280,
 	.tx_delay_max = 9280,
 	.dma_bit_mask = 35,
+	.peri_eth_ctrl_offset = MT8195_PERI_ETH_CTRL_BASE,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)

-- 
2.55.0


