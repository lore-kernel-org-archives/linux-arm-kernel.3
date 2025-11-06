Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A440CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW/Iy/YgXaPnDYTHZN2tIGLz73bnDzACNiiCiEAutOU=; b=ZfVlwLNwUK1C5afJLud1YORYzX
	e3wgikBhAlLybbdkitluluW0cDCgbUYR1Z1qyl0jRCH0zkO4JVS++PsVZrcl/cdcckgsP67jCFyI/
	ggf1G0tTG041b1nEAgHodTjFbDzigSzGBktUK/rnypCiu8jC/rauC8NygU6JtvbmSX+yvr51Q5Q35
	bTaIQIl9Z71lkZGSbWTWOUjXLxXNd0HempaGtjfThj/mK+giKOJqHpYmIjR8R8EsBJVGFuBGRTTGP
	+Ug/AbQBiwAz8smEnB7pUdxfq5AuO6LYRtVoilVIc2YjIXatItsbNASCB+gpHY0XRb59sppcexW8+
	0URYG69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvob-0000000F6He-0HTV;
	Thu, 06 Nov 2025 08:57:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvoY-0000000F6FU-0wQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QW/Iy/YgXaPnDYTHZN2tIGLz73bnDzACNiiCiEAutOU=; b=t1rrINssWSEvFR8b44hv1DtYMv
	OUxh8MK1mKjDy2+UbNbK2YUHnRFv/8j158u6RqImsQMROX7VU7zkXDa25Ke1ik8tIfG/GhrFo8Jts
	t77LE6p1fV+Q9B7FeInGL0dOMbdCdCu/mK7cUo2y+d903gFil0W77RcpkYGlwHAf1nYaGowa8PNsY
	+WzGJBdvLc54Zg8QJ5VNJBx9QMYn0gjpBHhvRLWPRnPLRqkeg3Y4zFw/fIalK0nacg1TNgemTLqsi
	B76Rt5xwZ2fupOxYclDQCcxE2Eog67h5eXOugokFEkLM4z6G9T+MsH5qq3iqDPlJD37SJP63FLjEZ
	dXrWJdKA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44192 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGvoQ-000000004YX-1NrM;
	Thu, 06 Nov 2025 08:57:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGvoP-0000000DWon-1cOI;
	Thu, 06 Nov 2025 08:57:45 +0000
In-Reply-To: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 06/11] net: stmmac: ingenic: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGvoP-0000000DWon-1cOI@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 08:57:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_005755_405344_9E4042C6 
X-CRM114-Status: GOOD (  14.84  )
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
phy_intf_sel value, validate the result against the SoC specific
supported phy_intf_sel values, and pass into the SoC specific
set_mode() methods, replacing the local phy_intf_sel variable. This
provides the value for the MACPHYC_PHY_INFT_MASK field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 55 ++++++++++++-------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 6680f7d3a469..79735a476e86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -64,28 +64,27 @@ struct ingenic_soc_info {
 	enum ingenic_mac_version version;
 	u32 mask;
 
-	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
+	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
+
+	u8 valid_phy_intf_sel;
 };
 
-static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			       u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_GMII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -93,7 +92,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
 		break;
 
@@ -110,7 +108,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 
@@ -129,15 +128,14 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
 }
 
-static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -153,16 +151,15 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -178,17 +175,16 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
+static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
+			      u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
-	u8 phy_intf_sel;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
 			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
@@ -197,8 +193,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 		val = 0;
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
-
 		if (mac->tx_delay == 0)
 			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
 		else
@@ -229,10 +223,21 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 {
 	struct ingenic_mac *mac = bsp_priv;
-	int ret;
+	phy_interface_t interface;
+	int phy_intf_sel, ret;
 
 	if (mac->soc_info->set_mode) {
-		ret = mac->soc_info->set_mode(mac->plat_dat);
+		interface = mac->plat_dat->phy_interface;
+
+		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
+		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
+			dev_err(mac->dev, "unsupported interface %s\n",
+				phy_modes(interface));
+			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+		}
+
+		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
@@ -309,6 +314,9 @@ static struct ingenic_soc_info jz4775_soc_info = {
 	.mask = MACPHYC_TXCLK_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = jz4775_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_GMII_MII) |
+			      BIT(PHY_INTF_SEL_RGMII) |
+			      BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x1000_soc_info = {
@@ -316,6 +324,7 @@ static struct ingenic_soc_info x1000_soc_info = {
 	.mask = MACPHYC_SOFT_RST_MASK,
 
 	.set_mode = x1000_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x1600_soc_info = {
@@ -323,6 +332,7 @@ static struct ingenic_soc_info x1600_soc_info = {
 	.mask = MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = x1600_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x1830_soc_info = {
@@ -330,6 +340,7 @@ static struct ingenic_soc_info x1830_soc_info = {
 	.mask = MACPHYC_MODE_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = x1830_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
 };
 
 static struct ingenic_soc_info x2000_soc_info = {
@@ -338,6 +349,8 @@ static struct ingenic_soc_info x2000_soc_info = {
 			MACPHYC_RX_DELAY_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
 
 	.set_mode = x2000_mac_set_mode,
+	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RGMII) |
+			      BIT(PHY_INTF_SEL_RMII),
 };
 
 static const struct of_device_id ingenic_mac_of_matches[] = {
-- 
2.47.3


