Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FD8CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1ebKDo9aSBHHibW6Zw6iWwBcU+APekEZ4/kod4pzVE=; b=cWby3PyeghDMkD7DqduACH/kzT
	XYwA63zoIux67k9b0AAYhd8yZIkO1l4miPiSQrY58VkDW6Hy6Aa1MytlSDLdYI08zY/tYFlfRIF0q
	XK6SrwrOVRRY19XRgzNSpn6X8h888uOT82AWA1JQeNUs7L/Ef689q3ds3bb2z6muB3nXQCmycKL83
	XBvtKm+PLwPTDerbeHcWDCd8Y7FxYK+RHFI5iurqL12lYOCNoQzE1wntKL8gE2dtn1+Nz+yaXeOd3
	e6jl8WLX1MMK5IF4B4OfENBDoum+rPVxYHTIbfQOigRHsOYpMTTyQPUZ9cDQp+bNFaABBSZ58/8rh
	N4xtGVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomi-00000006lju-3VmC;
	Wed, 03 Sep 2025 14:48:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmmE-00000006Q7j-062a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a1ebKDo9aSBHHibW6Zw6iWwBcU+APekEZ4/kod4pzVE=; b=Y0XEPdK55mZWRPV3+3ZcTQ5tqC
	McyCyAyUCyDWvFS4XKagZ+194cm4ZBaqv8OfvL9s2rfHVaTguPNYjhYuvED4TqCfPlvh5G8u/Bh8J
	l3zCHuBQ5Rmg7sgUhv9YTQG1R0L9fYUTbPIx/2QAfpbFYW10iAOufCUlW4A/rmm6I8ykI1rFQzb2m
	DOlO9Ehe6BjunYA1tmCwjzVWVNcf34EuYMyUJKj1OV1OEtRAn+Oz/VukBNLnbLzBkLGs1ks8VgFn4
	rATLjFQyPG51B5zEe7GppLiZ1HkWboHvkkLk3H2M0b4wSvr41LtG7XyN2/YLY8GZEjcMfFaavpdKJ
	WaoGcx3Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36462 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1utmm9-000000000W8-226m;
	Wed, 03 Sep 2025 13:39:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1utmm8-00000001s0U-2VYX;
	Wed, 03 Sep 2025 13:39:44 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 06/11] net: stmmac: mdio: move runtime PM into
 stmmac_mdio_access()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1utmm8-00000001s0U-2VYX@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:44 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_053950_060864_9109DF31 
X-CRM114-Status: GOOD (  13.17  )
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

Move the runtime PM handling into the common stmmac_mdio_access()
function, rather than having it in the four top-level bus access
functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 71 ++++++-------------
 1 file changed, 20 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 62e74467de49..2d6a5d40e2c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -246,9 +246,13 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 	u32 addr;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
+		return ret;
+
 	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
 	if (ret)
-		return ret;
+		goto out;
 
 	addr = stmmac_mdio_format_addr(priv, pa, gr) | cmd;
 
@@ -257,10 +261,15 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 
 	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Read the data from the MII data register if in read mode */
-	return read ? readl(mii_data) & MII_DATA_MASK : 0;
+	ret = read ? readl(mii_data) & MII_DATA_MASK : 0;
+
+out:
+	pm_runtime_put(priv->device);
+
+	return ret;
 }
 
 static int stmmac_mdio_read(struct stmmac_priv *priv, unsigned int pa,
@@ -288,23 +297,14 @@ static int stmmac_mdio_write(struct stmmac_priv *priv, unsigned int pa,
 static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	int data = 0;
 	u32 cmd;
 
-	data = pm_runtime_resume_and_get(priv->device);
-	if (data < 0)
-		return data;
-
 	if (priv->plat->has_gmac4)
 		cmd = MII_GMAC4_READ;
 	else
 		cmd = 0;
 
-	data = stmmac_mdio_read(priv, phyaddr, phyreg, cmd, data);
-
-	pm_runtime_put(priv->device);
-
-	return data;
+	return stmmac_mdio_read(priv, phyaddr, phyreg, cmd, 0);
 }
 
 /**
@@ -322,22 +322,10 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 				int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	int data = 0;
-	u32 cmd;
-
-	data = pm_runtime_resume_and_get(priv->device);
-	if (data < 0)
-		return data;
-
-	cmd = MII_GMAC4_READ | MII_GMAC4_C45E;
-
-	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
-
-	data = stmmac_mdio_read(priv, phyaddr, devad, cmd, data);
+	int data = phyreg << MII_GMAC4_REG_ADDR_SHIFT;
+	u32 cmd = MII_GMAC4_READ | MII_GMAC4_C45E;
 
-	pm_runtime_put(priv->device);
-
-	return data;
+	return stmmac_mdio_read(priv, phyaddr, devad, cmd, data);
 }
 
 /**
@@ -352,23 +340,14 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 				 u16 phydata)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	int ret, data = phydata;
 	u32 cmd;
 
-	ret = pm_runtime_resume_and_get(priv->device);
-	if (ret < 0)
-		return ret;
-
 	if (priv->plat->has_gmac4)
 		cmd = MII_GMAC4_WRITE;
 	else
 		cmd = MII_WRITE;
 
-	ret = stmmac_mdio_write(priv, phyaddr, phyreg, cmd, data);
-
-	pm_runtime_put(priv->device);
-
-	return ret;
+	return stmmac_mdio_write(priv, phyaddr, phyreg, cmd, phydata);
 }
 
 /**
@@ -384,22 +363,12 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 				 int devad, int phyreg, u16 phydata)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	int ret, data = phydata;
-	u32 cmd;
-
-	ret = pm_runtime_resume_and_get(priv->device);
-	if (ret < 0)
-		return ret;
-
-	cmd = MII_GMAC4_WRITE | MII_GMAC4_C45E;
+	u32 cmd = MII_GMAC4_WRITE | MII_GMAC4_C45E;
+	int data = phydata;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
-	ret = stmmac_mdio_write(priv, phyaddr, devad, cmd, data);
-
-	pm_runtime_put(priv->device);
-
-	return ret;
+	return stmmac_mdio_write(priv, phyaddr, devad, cmd, data);
 }
 
 /**
-- 
2.47.2


