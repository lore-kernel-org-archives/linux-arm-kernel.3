Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848EEC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPRQY28nN74Kh95BFEt+ohvgl/j08Tf0hPpDTXYE12g=; b=NHqUFBjWfPCpEM1wh6KkvfO7T+
	KsfJPbuTz1GexfkcRi1Wj88BUiKbSaw9fY0/XzK54FKrqIln1qpf93HQYcGg6/gHp+4mb91N2LLQB
	wW8dyC2ncO8Dex+iki0/4wboZ7rfuW3iNeOksDCGhb8hkbCzZmO+zvkVJ0X7/yWeyBHUChyWuVvKH
	4sx5QyASdSazkjfigZ+IjGCrI/CzZzHCWO0uD2F5BypBQqqO3xQEHACIjUUH+LBD4dmglx2XF4dOC
	vaQnoFXryGOGcCd/CPDa3osU+//84YM1oi4XZLDfqIxjCPiPW9bCYJZnOc61A9q9a8sZaN9uEEAR7
	MQgEYSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBls-0000000Ej5D-0yCJ;
	Wed, 27 Aug 2025 08:44:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBjA-0000000EihK-31er
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 08:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RPRQY28nN74Kh95BFEt+ohvgl/j08Tf0hPpDTXYE12g=; b=HnZW6N+jpf3sOHGmvI2bA9wWHY
	Umws2c6dlonhdUQTelLzaFqCle4wIFR2/2y1InSx6mPaeVMKWZiuqBY5PM3tspQnWthiN8P5ukdSo
	oq42TC5OGjWwEJTugcBRfdncmOfVtoXctf2ZI9WFZHhWtkyl4WMA3yfJ1OrHQ6ZYsM0G6XJ/pG4/7
	AqZwvNW5TVmq1gJi1M2HWryE0lys2VHLorvU0lgi952fxqImPHxezA3IsllbivU14dOFAZA9UuaOq
	9pGIN75GwkMliRz5raVNb0vfPCMH2uUtO2aQDl0YO7HZDKpkqaisAvVtj3ocN2gEeJlWikgKflA7b
	zo0x9Tog==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49906 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1urBj2-000000000Es-3pdZ;
	Wed, 27 Aug 2025 09:41:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1urBj2-000000002as-0pod;
	Wed, 27 Aug 2025 09:41:48 +0100
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
Subject: [PATCH net-next] net: stmmac: mdio: use netdev_priv() directly
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1urBj2-000000002as-0pod@rmk-PC.armlinux.org.uk>
Date: Wed, 27 Aug 2025 09:41:48 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_014156_757733_4FB383E7 
X-CRM114-Status: GOOD (  11.51  )
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

netdev_priv() is an inline function, taking a struct net_device
pointer. When passing in the MII bus->priv, which is a void pointer,
there is no need to go via a local ndev variable to type it first.

Thus, instead of:

	struct net_device *ndev = bus->priv;
	struct stmmac_priv *priv;
...
	priv = netdev_priv(ndev);

we can simply do:

	struct stmmac_priv *priv = netdev_priv(bus->priv);

which simplifies the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 38 +++++--------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 836f2848dfeb..86021e6b67b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -131,12 +131,9 @@ static int stmmac_xgmac2_mdio_read(struct stmmac_priv *priv, u32 addr,
 static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 				       int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
 	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
@@ -150,12 +147,9 @@ static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 static int stmmac_xgmac2_mdio_read_c45(struct mii_bus *bus, int phyaddr,
 				       int devad, int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	stmmac_xgmac2_c45_format(priv, phyaddr, devad, phyreg, &addr);
 
 	return stmmac_xgmac2_mdio_read(priv, addr, MII_XGMAC_BUSY);
@@ -209,12 +203,9 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 					int phyreg, u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
 	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
@@ -229,12 +220,9 @@ static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 static int stmmac_xgmac2_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 					int devad, int phyreg, u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	stmmac_xgmac2_c45_format(priv, phyaddr, devad, phyreg, &addr);
 
 	return stmmac_xgmac2_mdio_write(priv, addr, MII_XGMAC_BUSY,
@@ -274,8 +262,7 @@ static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
  */
 static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 value = MII_BUSY;
 	int data = 0;
 
@@ -312,8 +299,7 @@ static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 				int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 value = MII_BUSY;
 	int data = 0;
 
@@ -373,8 +359,7 @@ static int stmmac_mdio_write(struct stmmac_priv *priv, int data, u32 value)
 static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 				 u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
 	u32 value = MII_BUSY;
 
@@ -412,8 +397,7 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 				 int devad, int phyreg, u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
 	u32 value = MII_BUSY;
 
@@ -452,8 +436,7 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 int stmmac_mdio_reset(struct mii_bus *bus)
 {
 #if IS_ENABLED(CONFIG_STMMAC_PLATFORM)
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	unsigned int mii_address = priv->hw->mii.addr;
 
 #ifdef CONFIG_OF
@@ -497,12 +480,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 int stmmac_pcs_setup(struct net_device *ndev)
 {
+	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct fwnode_handle *devnode, *pcsnode;
 	struct dw_xpcs *xpcs = NULL;
-	struct stmmac_priv *priv;
 	int addr, ret;
 
-	priv = netdev_priv(ndev);
 	devnode = priv->plat->port_node;
 
 	if (priv->plat->pcs_init) {
-- 
2.47.2


