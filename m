Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC509CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx+cIhNFbytMcZVMSFDTNPjoD4jGqQcNILJcA51HUIY=; b=ktTcrwFR7nYAC0pK2SX8HcrKL4
	WUB/f9txC+m4BSsFPqaiYd1yaiLH7NoUJOlHwiZvKRVMEkgIq55WJN75KAm6hHPHMYjKOWWb/nrAR
	CMSWwlCrNh6zFQWnZ+iiSCZvYkI5PPLEUZ01VJtsB8xdFC74u1v+AVyRAbkWkkYXefkWaQB0KYQmn
	TG+ylmyieG3Qv8W9XE9WuGMolahLvTxwpeSVYzF2KMaepEbx+hDp0V3Tw0BuYBqcmPbJnkpFfpqRP
	8yMzO5mR+bMpQoxoDx1ScWe3zDYAF/RKqM2DEI+tC4coMPNKvdpn12mHdR7PPWe419Byd3wncKwFZ
	gE8xGzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomk-00000006lml-3IzU;
	Wed, 03 Sep 2025 14:48:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmmJ-00000006QA4-38hm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lx+cIhNFbytMcZVMSFDTNPjoD4jGqQcNILJcA51HUIY=; b=Tx+1w+mhyZ2tk6KiNHfSWcQ07w
	mXkqcuUPlUFmE/QjXnraxnee9GKKxI6y0UaW8X8xImXaBy81uJRguU+MskQ22w6qaXwcKTjkXoaXc
	pmIodrGIIPctHfaW2zYzUZzlQYeFfLuAq+cWR20H8/9iHucbl98qi/HyBdu7nbg+mlabZQzKWH++4
	4H3laV9nygevZyYuE4mmSS69T/K1DjI9PJ6CNgqYvRaMREwq1s8Z3m8YfC5t3LIJahPu81aBSKqub
	yD0EYqymzKbhiNs3EAGWOo7DkkD4PKFCis4/zsxY/E/lGkhrIaXzpms065F/dYA1AzrJchAJLtFTk
	jw4+7WpA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55354 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1utmmF-000000000WQ-0h0c;
	Wed, 03 Sep 2025 13:39:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1utmmD-00000001s0f-2yUs;
	Wed, 03 Sep 2025 13:39:49 +0100
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
Subject: [PATCH net-next 07/11] net: stmmac: mdio: improve mdio register field
 definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1utmmD-00000001s0f-2yUs@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:49 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_053955_787935_4B2A8766 
X-CRM114-Status: GOOD (  12.48  )
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

Include the register name in the definitions, and use a name which
more closely resembles that used in documentation, while still being
descriptive.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 2d6a5d40e2c1..4d0de3c269a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -23,9 +23,9 @@
 #include "dwxgmac2.h"
 #include "stmmac.h"
 
-#define MII_BUSY 0x00000001
-#define MII_WRITE 0x00000002
-#define MII_DATA_MASK GENMASK(15, 0)
+#define MII_ADDR_GBUSY			BIT(0)
+#define MII_ADDR_GWRITE			BIT(1)
+#define MII_DATA_GD_MASK		GENMASK(15, 0)
 
 /* GMAC4 defines */
 #define MII_GMAC4_GOC_SHIFT		2
@@ -235,7 +235,7 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
 	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
 	       priv->gmii_address_bus_config |
-	       MII_BUSY;
+	       MII_ADDR_GBUSY;
 }
 
 static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
@@ -250,7 +250,7 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 	if (ret < 0)
 		return ret;
 
-	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_ADDR_GBUSY);
 	if (ret)
 		goto out;
 
@@ -259,12 +259,12 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 	writel(data, mii_data);
 	writel(addr, mii_address);
 
-	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_ADDR_GBUSY);
 	if (ret)
 		goto out;
 
 	/* Read the data from the MII data register if in read mode */
-	ret = read ? readl(mii_data) & MII_DATA_MASK : 0;
+	ret = read ? readl(mii_data) & MII_DATA_GD_MASK : 0;
 
 out:
 	pm_runtime_put(priv->device);
@@ -345,7 +345,7 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 	if (priv->plat->has_gmac4)
 		cmd = MII_GMAC4_WRITE;
 	else
-		cmd = MII_WRITE;
+		cmd = MII_ADDR_GWRITE;
 
 	return stmmac_mdio_write(priv, phyaddr, phyreg, cmd, phydata);
 }
-- 
2.47.2


