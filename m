Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162FCCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuEqlECWDCaNWgWH8z84uCmKw/NZbDZ8phBddxEwuWo=; b=kH72X5dr98O+Vi9S11EUK7ju4C
	tzecb3fWZkt4fuzzXIZNCf7pOXQ7inuFClIoO1oAZbmJIqIzoKM/alJBwyZTW9ozt6aVy6o6YU532
	/9TThTwudrOwkw0eHx/kYcAbWozTwYaVgZXyCP4x59hgE7R3RyW4p+xaHWl+DQ/bwP4O7AA2nFyML
	3RUdNZXdPLsHWzh87oSfaPOvLX3knJXQpD624T2Lw1Q5QdeY6+wM3kyu0kjbtoI7W2Et38Tyx+/kV
	0MnPTt/SaKkOqXYSLQgz7Ds/56C2kahCHSM+UqyEgBXJJ74G/ZSczsHMGUjPZt1IlCU8r7pbqRSfE
	AvBlgB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUE-00000006koi-01jK;
	Tue, 11 Nov 2025 08:12:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUB-00000006klc-3tfS;
	Tue, 11 Nov 2025 08:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HuEqlECWDCaNWgWH8z84uCmKw/NZbDZ8phBddxEwuWo=; b=R+ncjn/TVMVN8wHgGcuWZwhWak
	9Q966o7o4AJIX8PfPfKDJmahmj5zHrc99yH7X5zsPjUtmVe/+i6hPAIsuOhd8IoXPNceRWnJiV45D
	3hyrsLfogn20B0CsWUY4YWDaUGprrQJpTDDbBScphejt/cxqu+etXynStUcPLOA62wtjZR5y8HSq2
	6JVYz6vxAB8d3Jr3qeLbTjpoZ3Iw0Q9KBkHxLdwicWQmoRIwxw0Li0sjstMyzxC2+F6RdEGN8MYiV
	Jl+poRU34unsV6kGaXhq0Kehls4mMEz00FV97MybysVTXxneuahWlBGH38jT75EFI8ox6mZ0c/tDQ
	v1JV67lg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51550 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjU0-000000002AZ-3MPk;
	Tue, 11 Nov 2025 08:12:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTz-0000000DqtP-3N9v;
	Tue, 11 Nov 2025 08:12:07 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 05/13] net: stmmac: mediatek: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001220_037596_FE3CB30E 
X-CRM114-Status: GOOD (  14.55  )
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

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result, and pass that into the
implementation specific ->dwmac_set_phy_interface() method. Use this
to configure the PHY interface selection field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index dcdf28418fec..0f32732efb75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -85,7 +85,8 @@ struct mediatek_dwmac_plat_data {
 };
 
 struct mediatek_dwmac_variant {
-	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
+	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat,
+				       u8 phy_intf_sel);
 	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
 
 	/* clock ids to be requested */
@@ -106,25 +107,25 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
-static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
+static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
+				u8 phy_intf_sel)
 {
 	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
-	u32 intf_val = 0;
+	u32 intf_val;
+
+	intf_val = phy_intf_sel;
 
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_MII:
-		intf_val |= PHY_INTF_SEL_GMII_MII;
-		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
+		intf_val |= rmii_rxc | rmii_clk_from_mac;
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -285,27 +286,25 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.tx_delay_max = 17600,
 };
 
-static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
+static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
+				u8 phy_intf_sel)
 {
 	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
-	u32 intf_val = 0;
+	u32 intf_val;
+
+	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
 
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_MII:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
-				       PHY_INTF_SEL_GMII_MII);
-		break;
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -525,10 +524,18 @@ static int mediatek_dwmac_init(struct device *dev, void *priv)
 {
 	struct mediatek_dwmac_plat_data *plat = priv;
 	const struct mediatek_dwmac_variant *variant = plat->variant;
-	int ret;
+	int phy_intf_sel, ret;
 
 	if (variant->dwmac_set_phy_interface) {
-		ret = variant->dwmac_set_phy_interface(plat);
+		phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_mode);
+		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+		    phy_intf_sel != PHY_INTF_SEL_RMII) {
+			dev_err(plat->dev, "phy interface not supported\n");
+			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+		}
+
+		ret = variant->dwmac_set_phy_interface(plat, phy_intf_sel);
 		if (ret) {
 			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
 			return ret;
-- 
2.47.3


