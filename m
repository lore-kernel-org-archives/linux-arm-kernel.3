Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B8CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrMWG5cWBmM+XR+/vkLCxhlAh3UTzPrNoo8dEeCIYHM=; b=VGQLKOf5kMFersUMFwTi2WPj04
	7Qap/S+UF2VASLxg5omNfsS5I+Ar0oFAbtOecihW2K8UiOdAX8dgKUM984TJlywHNZy1SBrrNPcbR
	Y7lrlFBrMstioS0vKNUAaR8/szO5GIWppFee4iaRBpZ2VDUKtPqLmk2NRAnpCWkgYXHoey53MsYmD
	kkz/y1aawNgIBwdfZ/nSaiXVzEvWUMWf9Z5NhPL5p/R+mMxhRzR4Ra1LjiZojv4AlScdwHhs6t+v0
	X8u2d6wvTpOLeF3/h5ksPQfhdQPRf8buYNLOViT5WHH23A/M5diUizXIhkpDKbfAkca4FhE5Z4I9d
	m/mobA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClF-0000000CqUH-1IU1;
	Thu, 04 Sep 2025 16:24:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8oI-0000000BTBd-0O5a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RrMWG5cWBmM+XR+/vkLCxhlAh3UTzPrNoo8dEeCIYHM=; b=hoFnOagACWv2EH9UbaNPdQunoc
	2k5STtElXx5ZSXnvrSY+H6X8Qw/P6T3DpKVEbboy2cbEGRh/j6sV/LYTAvifugyjqqxIL9taaF3UK
	W8yskkiAsjWTlJCLVr7EoilgVPRnps/T4zFDg4Fpsm6o22AXCgNKZZPcfeqy6ruOCcjFkazQSBr/l
	0+vm+P6/pq95LqNMm+ms6uOUx9RvdmqWNr6UKg9LQSwEj8yKyGYZbcHGbhvCdNNpj2+0W1Dc2SqLh
	k2w2CwecGBrzFz56nhzQmIZbL5+XfviJ6MOykNHrGAz2yIcP4S4ElA1CDVtw+RO6w+hAPKDPVPKCG
	+Y3ka4Yg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36312 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uu8oD-000000001y6-1lGM;
	Thu, 04 Sep 2025 13:11:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uu8oC-00000001vos-2JnA;
	Thu, 04 Sep 2025 13:11:20 +0100
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
Subject: [PATCH net-next v2 05/11] net: stmmac: mdio: merge stmmac_mdio_read()
 and stmmac_mdio_write()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uu8oC-00000001vos-2JnA@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:20 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051126_131135_1F6B1111 
X-CRM114-Status: GOOD (  12.64  )
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

stmmac_mdio_read() and stmmac_mdio_write() are virtually identical
except for the final read in the stmmac_mdio_read(). Handle this as
a flag.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 59 ++++++++-----------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index d588475b4279..4e2eb206a234 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -240,29 +240,41 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 	       MII_BUSY;
 }
 
-static int stmmac_mdio_read(struct stmmac_priv *priv, unsigned int pa,
-			    unsigned int gr, u32 cmd, int data)
+static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
+			      unsigned int gr, u32 cmd, u32 data, bool read)
 {
-	unsigned int mii_address = priv->hw->mii.addr;
-	unsigned int mii_data = priv->hw->mii.data;
-	u32 value;
+	void __iomem *mii_address = priv->ioaddr + priv->hw->mii.addr;
+	void __iomem *mii_data = priv->ioaddr + priv->hw->mii.data;
+	u32 addr;
 	int ret;
 
-	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
 	if (ret)
 		return ret;
 
-	value = stmmac_mdio_format_addr(priv, pa, gr) | cmd;
+	addr = stmmac_mdio_format_addr(priv, pa, gr) | cmd;
 
-	writel(data, priv->ioaddr + mii_data);
-	writel(value, priv->ioaddr + mii_address);
+	writel(data, mii_data);
+	writel(addr, mii_address);
 
-	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
 	if (ret)
 		return ret;
 
-	/* Read the data from the MII data register */
-	return readl(priv->ioaddr + mii_data) & MII_DATA_MASK;
+	/* Read the data from the MII data register if in read mode */
+	return read ? readl(mii_data) & MII_DATA_MASK : 0;
+}
+
+static int stmmac_mdio_read(struct stmmac_priv *priv, unsigned int pa,
+			    unsigned int gr, u32 cmd, int data)
+{
+	return stmmac_mdio_access(priv, pa, gr, cmd, data, true);
+}
+
+static int stmmac_mdio_write(struct stmmac_priv *priv, unsigned int pa,
+			     unsigned int gr, u32 cmd, int data)
+{
+	return stmmac_mdio_access(priv, pa, gr, cmd, data, false);
 }
 
 /**
@@ -330,29 +342,6 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 	return data;
 }
 
-static int stmmac_mdio_write(struct stmmac_priv *priv, unsigned int pa,
-			     unsigned int gr, u32 cmd, int data)
-{
-	unsigned int mii_address = priv->hw->mii.addr;
-	unsigned int mii_data = priv->hw->mii.data;
-	u32 value;
-	int ret;
-
-	/* Wait until any existing MII operation is complete */
-	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
-	if (ret)
-		return ret;
-
-	value = stmmac_mdio_format_addr(priv, pa, gr) | cmd;
-
-	/* Set the MII address register to write */
-	writel(data, priv->ioaddr + mii_data);
-	writel(value, priv->ioaddr + mii_address);
-
-	/* Wait until any existing MII operation is complete */
-	return stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
-}
-
 /**
  * stmmac_mdio_write_c22
  * @bus: points to the mii_bus structure
-- 
2.47.2


