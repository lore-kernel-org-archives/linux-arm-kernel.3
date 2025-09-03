Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D33CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqYxTQI+DGW4jWLwQ5AzqVwMKT+E7RNgsllxaToWBcE=; b=Eg9U6u+G71330owtrJaa9aR1Zk
	o7o8WYHoLqmqXMJ7nmLpy/QSxPgIwNCx0spHgah7NgKbEle0MVuNaIu5THakSMz5azfhvkox6h2Zz
	q9cMpoGCMjxTIYivW01xsisx2Wdth5Oy5tQUCp2bbdgTqM+044jkxHZs9Us4bu/2PckaTi84AcPi8
	PPDc5pThmjIcOkAeW7fgt2YtlUtaKV+49MWJllIEnneiTKTYlh9OvHu7//0ViVwtGW0NED3jyIZGp
	1bb6R7NBRcaZbJqMTWhaJwH4qjSylgxgdL2TXjqCtnlsXWnRpjMGN1hrloz5PCbaRyu2jZ2Y+2U+x
	yYy0b71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utome-00000006lbU-1AlK;
	Wed, 03 Sep 2025 14:48:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmm4-00000006Q59-2RFn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MqYxTQI+DGW4jWLwQ5AzqVwMKT+E7RNgsllxaToWBcE=; b=mmZD0HqNBi8Lu0/BA2PHa8SAN/
	8BPd8PL4BY2NDsJM0sHlAextIbdWKXCQK90h3VX5zoluYkENQny7QCpO5j/Vr5IG3A3bBPaI2cWRd
	lAO+dijV1+lCJ5UeaaqoOmdemB885MoqsQ15OVgWv/2iDx47gRLCH28goKKt6SdRafKPj3sb21YQB
	FvkMt909EqlY6mNBagOiFgJoIDzekey5UyPV842bNJMNYTwAXFOUG7Ivu38dh7PvDRTYuWp6nXwnR
	np53AFGwQluv9EaYoir8MEKp6cS5znnhdhhRxAV625X0OaXHwW5VK+NocxmpikbI5bizBa4VtQL3N
	sihS6LfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37360 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1utmlz-000000000Vd-0RSV;
	Wed, 03 Sep 2025 13:39:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1utmly-00000001s0I-1U6i;
	Wed, 03 Sep 2025 13:39:34 +0100
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
Subject: [PATCH net-next 04/11] net: stmmac: mdio: move
 stmmac_mdio_format_addr() into read/write
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1utmly-00000001s0I-1U6i@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:34 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_053940_627131_AABE0142 
X-CRM114-Status: GOOD (  12.03  )
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

Move stmmac_mdio_format_addr() into stmmac_mdio_read() and
stmmac_mdio_write().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 46 ++++++++++---------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 2267a93ce44d..dafe97a49d1f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -238,16 +238,20 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 	       MII_BUSY;
 }
 
-static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
+static int stmmac_mdio_read(struct stmmac_priv *priv, unsigned int pa,
+			    unsigned int gr, u32 cmd, int data)
 {
 	unsigned int mii_address = priv->hw->mii.addr;
 	unsigned int mii_data = priv->hw->mii.data;
+	u32 value;
 	int ret;
 
 	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
 	if (ret)
 		return ret;
 
+	value = stmmac_mdio_format_addr(priv, pa, gr) | cmd;
+
 	writel(data, priv->ioaddr + mii_data);
 	writel(value, priv->ioaddr + mii_address);
 
@@ -273,17 +277,18 @@ static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int data = 0;
-	u32 value;
+	u32 cmd;
 
 	data = pm_runtime_resume_and_get(priv->device);
 	if (data < 0)
 		return data;
 
-	value = stmmac_mdio_format_addr(priv, phyaddr, phyreg);
 	if (priv->plat->has_gmac4)
-		value |= MII_GMAC4_READ;
+		cmd = MII_GMAC4_READ;
+	else
+		cmd = 0;
 
-	data = stmmac_mdio_read(priv, data, value);
+	data = stmmac_mdio_read(priv, phyaddr, phyreg, cmd, data);
 
 	pm_runtime_put(priv->device);
 
@@ -306,29 +311,29 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int data = 0;
-	u32 value;
+	u32 cmd;
 
 	data = pm_runtime_resume_and_get(priv->device);
 	if (data < 0)
 		return data;
 
-	value = stmmac_mdio_format_addr(priv, phyaddr, devad);
-	value |= MII_GMAC4_READ;
-	value |= MII_GMAC4_C45E;
+	cmd = MII_GMAC4_READ | MII_GMAC4_C45E;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
-	data = stmmac_mdio_read(priv, data, value);
+	data = stmmac_mdio_read(priv, phyaddr, devad, cmd, data);
 
 	pm_runtime_put(priv->device);
 
 	return data;
 }
 
-static int stmmac_mdio_write(struct stmmac_priv *priv, int data, u32 value)
+static int stmmac_mdio_write(struct stmmac_priv *priv, unsigned int pa,
+			     unsigned int gr, u32 cmd, int data)
 {
 	unsigned int mii_address = priv->hw->mii.addr;
 	unsigned int mii_data = priv->hw->mii.data;
+	u32 value;
 	int ret;
 
 	/* Wait until any existing MII operation is complete */
@@ -336,6 +341,8 @@ static int stmmac_mdio_write(struct stmmac_priv *priv, int data, u32 value)
 	if (ret)
 		return ret;
 
+	value = stmmac_mdio_format_addr(priv, pa, gr) | cmd;
+
 	/* Set the MII address register to write */
 	writel(data, priv->ioaddr + mii_data);
 	writel(value, priv->ioaddr + mii_address);
@@ -357,19 +364,18 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
-	u32 value;
+	u32 cmd;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	value = stmmac_mdio_format_addr(priv, phyaddr, phyreg);
 	if (priv->plat->has_gmac4)
-		value |= MII_GMAC4_WRITE;
+		cmd = MII_GMAC4_WRITE;
 	else
-		value |= MII_WRITE;
+		cmd = MII_WRITE;
 
-	ret = stmmac_mdio_write(priv, data, value);
+	ret = stmmac_mdio_write(priv, phyaddr, phyreg, cmd, data);
 
 	pm_runtime_put(priv->device);
 
@@ -390,19 +396,17 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
-	u32 value;
+	u32 cmd;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	value = stmmac_mdio_format_addr(priv, phyaddr, devad);
-	value |= MII_GMAC4_WRITE;
-	value |= MII_GMAC4_C45E;
+	cmd = MII_GMAC4_WRITE | MII_GMAC4_C45E;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
-	ret = stmmac_mdio_write(priv, data, value);
+	ret = stmmac_mdio_write(priv, phyaddr, devad, cmd, data);
 
 	pm_runtime_put(priv->device);
 
-- 
2.47.2


