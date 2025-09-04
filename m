Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C510DCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+igjDa/+h9/dAI1xGE7rMdzLe9y5NMxBfbCy+NMhbVY=; b=yNHvnq6yjfGG1nKRtvAWeLdqGa
	ORSYuKFCXndaN1TacBNWbSlq2eKqJJBEdMtRHvSfOUXmRYdROxPSdWobUgtpIaSM9f0Y1sC6WolMR
	OhdWBH2z3Vrwhk5IPgW9i5bIla1gFpmfv0GMUsKgqn1gaxnU2Dm0YnyctGwISritzt3Z2fOpzSsVg
	xfme48+Px4poZr7Rg6Lp0lZfpvKccOpN7GIvUlHi4roXUnftdgBtBEi781NBqgnSwayaiCUL2Pwns
	WaxqQdMufDTVR8+/HmuTYuhxTl0smybUTd3yD3loqeSZaEnm4KS2iOPV23iMbZBDUVa/Ot7AeSg2Y
	4CVHLE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClC-0000000CqRH-34Ew;
	Thu, 04 Sep 2025 16:24:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8nx-0000000BSxj-2QTD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+igjDa/+h9/dAI1xGE7rMdzLe9y5NMxBfbCy+NMhbVY=; b=vQdDzl2XgdNOcAHkagERx00mel
	7ytanqclz8vvy4ifouQhW0CFGlpLuFygOkm45cmxH5DOLuQWLXob4AQz9Dy62RHlMoWccsDFl6kVj
	rBAdCvx/abs4MXUk31UcFzmHXb61HT7ZTt9sQRf/E2tU5ukDwJDKiNZgVOsSTOjTbBRyh1ADhxkj7
	YeQBL0UpQNDBZ2p7sE8tzHJAht9snD0rYuL1eIOWla4tvm17g2PPmnEGz8c3Uv47JCL2d5fJVzXKJ
	hMsjTowIGuLfeSMYeIRoU5GBwQR2Sq9IU6Xc4hq7bjGay0RCJnVYkFqhpAd8Vr3EIcCXh1Ae7k05j
	IWOYDnng==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55606 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uu8ns-000000001x3-3kcd;
	Thu, 04 Sep 2025 13:11:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uu8ns-00000001voU-0S7b;
	Thu, 04 Sep 2025 13:11:00 +0100
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 01/11] net: stmmac: mdio: provide address register
 formatter
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uu8ns-00000001voU-0S7b@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:00 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051105_618111_1877F657 
X-CRM114-Status: GOOD (  11.88  )
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

Rather than duplicating the logic for filling the PA (MDIO address),
GR (MDIO register/devad), CR (clock range) and GB (busy) fields of the
address register in four locations, provide a helper to do this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 55 ++++++++++---------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 0a302b711bc2..c305c202055a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -229,6 +229,26 @@ static int stmmac_xgmac2_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 					phydata);
 }
 
+/**
+ * stmmac_mdio_format_addr() - format the address register
+ * @priv: struct stmmac_priv pointer
+ * @pa: 5-bit MDIO package address
+ * @gr: 5-bit MDIO register address (C22) or MDIO device address (C45)
+ *
+ * Return: formatted address register
+ */
+static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
+				   unsigned int pa, unsigned int gr)
+{
+	const struct mii_regs *mii_regs = &priv->hw->mii;
+
+	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
+	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
+	       ((priv->clk_csr << mii_regs->clk_csr_shift) &
+		mii_regs->clk_csr_mask) |
+	       MII_BUSY;
+}
+
 static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
 {
 	unsigned int mii_address = priv->hw->mii.addr;
@@ -263,18 +283,14 @@ static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
 static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	u32 value = MII_BUSY;
 	int data = 0;
+	u32 value;
 
 	data = pm_runtime_resume_and_get(priv->device);
 	if (data < 0)
 		return data;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
+	value = stmmac_mdio_format_addr(priv, phyaddr, phyreg);
 	if (priv->plat->has_gmac4)
 		value |= MII_GMAC4_READ;
 
@@ -300,20 +316,16 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 				int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	u32 value = MII_BUSY;
 	int data = 0;
+	u32 value;
 
 	data = pm_runtime_resume_and_get(priv->device);
 	if (data < 0)
 		return data;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
+	value = stmmac_mdio_format_addr(priv, phyaddr, devad);
 	value |= MII_GMAC4_READ;
 	value |= MII_GMAC4_C45E;
-	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
@@ -357,18 +369,13 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
-	u32 value = MII_BUSY;
+	u32 value;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
-
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
+	value = stmmac_mdio_format_addr(priv, phyaddr, phyreg);
 	if (priv->plat->has_gmac4)
 		value |= MII_GMAC4_WRITE;
 	else
@@ -395,21 +402,15 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
-	u32 value = MII_BUSY;
+	u32 value;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
-
+	value = stmmac_mdio_format_addr(priv, phyaddr, devad);
 	value |= MII_GMAC4_WRITE;
 	value |= MII_GMAC4_C45E;
-	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
-- 
2.47.2


