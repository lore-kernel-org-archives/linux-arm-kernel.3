Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DB8CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxtZc9DxAp4rwz/OaxnGtR7sGKct7r/qlyJWz+2oUkc=; b=RY5efEx6ajSZEBS1XhmGk6GU1W
	oSySbio6trONpJtmfTWdmAmWxztv3VB7n7kMQp4CVVJJcBlevQUFtPcvMYXumQPDF3qmCzsdqpGFd
	LYkSyk+Z8hJ4U/WGlqeRO3Nq2JvmHCap9YIbhIa0uZN3ppa3XeZPls1ofWECcxVACjQ6xyID6BUxu
	KiqBv9Kt4Kfl6Gdy8rdkVsLcOnVfzZ4DNyTTXvccMdImYHx4rGR69RRXmBqQdEVLB2MEEUJ3nP6yF
	YS6TCkHKJpqevf9XJ3MxQ7nzp1eX+2HrxjdwJ7YBIzddQqQZub/Q/6B8uJaweBIF2Hcfm0o2Bv/eI
	LpFLL7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt5P-00000009mQF-1t3g;
	Mon, 03 Nov 2025 11:50:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt5M-00000009mLy-1FTE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hxtZc9DxAp4rwz/OaxnGtR7sGKct7r/qlyJWz+2oUkc=; b=C+pj2AL4iRGWtz6E8XodiWYxJs
	mxGGdtrHZ7PpacZGgUaGxkifRBk7kc+jHr6Y4DCe+t0Bldh8nF9g8IWSgQsIrSxohbAYbZbo2Amfu
	oCRM0YV54WTKigbsmj5NVnYL2IwlAXnCuBksnGbSUpyEq8q6BgyKDloNLV8criiMw8sZ/gJIaKpzU
	vHjbmeoX2EUb9FhI54Tzpz3f8n0EBVTZ2lPXIyqE9+O/rREVQeEMdnDAbcCdp6zQjcS7eOikXr39R
	EOZLY2dcTvsp5lfNusXN1ipEe10GPZAY5lZCzFTHsMZOoNTjpZk1TxekoS9ZkVYbuKti7tpcp+Y5N
	3XqtGFFQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50024 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt50-000000000hS-3qZo;
	Mon, 03 Nov 2025 11:50:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt4x-0000000ChpA-1Edr;
	Mon, 03 Nov 2025 11:50:31 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 08/11] net: stmmac: imx: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt4x-0000000ChpA-1Edr@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035056_833291_5DE6DAA5 
X-CRM114-Status: GOOD (  13.56  )
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

i.MX implementations other than IMX8DXL involve setting the dwmac core
phy_intf_sel input. Use stmmac_get_phy_intf_sel() to decode the PHY
interface mode to the phy_intf_sel value, validating the result, and
passing it into the implementation specific .set_intf_mode() method
rather than each .set_intf_mode() method doing this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index f1cfccd4269c..dc28486a7af0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -45,7 +45,8 @@ struct imx_dwmac_ops {
 	bool mac_rgmii_txclk_auto_adj;
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
-	int (*set_intf_mode)(struct plat_stmmacenet_data *plat_dat);
+	int (*set_intf_mode)(struct plat_stmmacenet_data *plat_dat,
+			     u8 phy_intf_sel);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 };
 
@@ -62,26 +63,23 @@ struct imx_priv_data {
 	struct plat_stmmacenet_data *plat_dat;
 };
 
-static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
+static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
+				u8 phy_intf_sel)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	u8 phy_intf_sel;
 	int val;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		val = 0;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		val = dwmac->rmii_refclk_ext ? 0 : GPR_ENET_QOS_CLK_TX_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		val = GPR_ENET_QOS_RGMII_EN;
 		break;
 	default:
@@ -98,7 +96,8 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 };
 
 static int
-imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
+imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
+		      u8 phy_intf_sel)
 {
 	int ret = 0;
 
@@ -106,16 +105,13 @@ imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 	return ret;
 }
 
-static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
+static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
+			       u8 phy_intf_sel)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	u8 phy_intf_sel;
 	int val, ret;
 
 	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
-		break;
 	case PHY_INTERFACE_MODE_RMII:
 		if (dwmac->rmii_refclk_ext) {
 			ret = regmap_clear_bits(dwmac->intf_regmap,
@@ -125,13 +121,12 @@ static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 			if (ret)
 				return ret;
 		}
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_dbg(dwmac->dev, "imx dwmac doesn't support %s interface\n",
@@ -176,12 +171,24 @@ static int imx_dwmac_init(struct platform_device *pdev, void *priv)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
-	int ret;
-
-	plat_dat = dwmac->plat_dat;
+	phy_interface_t interface;
+	int phy_intf_sel, ret;
 
 	if (dwmac->ops->set_intf_mode) {
-		ret = dwmac->ops->set_intf_mode(plat_dat);
+		plat_dat = dwmac->plat_dat;
+		interface = plat_dat->phy_interface;
+
+		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+		    phy_intf_sel != PHY_INTF_SEL_RMII) {
+			dev_dbg(dwmac->dev,
+				"imx dwmac doesn't support %s interface\n",
+				phy_modes(interface));
+			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+		}
+
+		ret = dwmac->ops->set_intf_mode(plat_dat, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
-- 
2.47.3


