Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSVSPrih3MzHiW4irYSyioG1xeCu7b4RyBIot2dvKWc=; b=lx7rf4xEA9Q3tSseHZV4IxPwis
	D6wIWC7QJHrKjXbQi8dNddomW0Ntcd/fZkof6sTvhDlqP4jJeFH6JVlYjXDRzkAfK/Cj9T3ZEr4dK
	2gWfbuxagep04RBM/N1tutSJ+gKbhjdtazACjuosPaP1ivZNSZpDfvzef0cmgfYKVnluoH3Vo3LOE
	b3rx1M8oDooXMYCgUAi7vhqnM/SlAER+4P1HxWUNBLMGzZwxSfMw4xKHMBHlFcYCh2BIflc2x1Q0D
	7Luyry2jxWl7jB28bro5K0pCjG99sRcx+PbapZNtFBkDbcBVluaMKZ886lTWpQDrBBP3r82vZxEvl
	XYCyxfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClF-0000000CqUt-3t6H;
	Thu, 04 Sep 2025 16:24:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8oN-0000000BTEe-1ov1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fSVSPrih3MzHiW4irYSyioG1xeCu7b4RyBIot2dvKWc=; b=Kpy0H3PWnemy4ECY3h8c5nQEHO
	fEyyptf7BpHvGJiBMULTwlaSY3tsqxwe0zzvmWVSNYuxK5m/7P4guIJsEIbMpvPxMDJ6mfJ+jQco7
	oZVLuz8VeSDsdcPfJlKzT6HMVRNzHRvTDNDVae2CPKfRjwg1iQOVI1d2Ipvi1vRyMowLdHPoPR3B+
	VPQZdmx0tXvQDKoJtQ3QTF22oKNNek8GOGZHKkUeNJgYleE55ampeUEqHSn661COj10AMbSFnFIIw
	VOOwjFv3KIlYao5kp2/G/bL5Zn8O16e/aqFIxPV7VDYVpvv9S1wSFBq9XIVRwddrRrJ9yW+PFqIBF
	xaujJRuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36328 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uu8oI-000000001yN-1nSG;
	Thu, 04 Sep 2025 13:11:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uu8oH-00000001voy-2jfU;
	Thu, 04 Sep 2025 13:11:25 +0100
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
Subject: [PATCH net-next v2 06/11] net: stmmac: mdio: move runtime PM into
 stmmac_mdio_access()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uu8oH-00000001voy-2jfU@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:25 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051131_475438_65B3F192 
X-CRM114-Status: GOOD (  12.92  )
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
index 4e2eb206a234..c95e9799273f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -248,9 +248,13 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
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
 
@@ -259,10 +263,15 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 
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
@@ -290,23 +299,14 @@ static int stmmac_mdio_write(struct stmmac_priv *priv, unsigned int pa,
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
@@ -324,22 +324,10 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
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
@@ -354,23 +342,14 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
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
@@ -386,22 +365,12 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
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


