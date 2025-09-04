Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D8CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/7lQhTrFsM5wfoxKtbA8wclhlUecEUrj1EveL4J1o8=; b=Ck8KYdJbRs6H2q/WCZWavOwcgA
	8T5JEtNBNlAogCvAw0RQjHQS/8YjYbFANzNd7s4CEvU6wU3R1w/S82KDvlzxCTNwo27ly4gAaa4v2
	9/Y88+oP268I3DYjW6t6tG4SPp3y81oLRR6KqjHV1gcF8Bf9CbnC042MA4NwOfMOSbGjAooOHcoRd
	CpQ0tUBmASo5Ug5qDLVnrAkZdhLx+WQ6jGqgx25MQDJft1dIOSX76oIAaNTRwys/6YfC2vn6oHR/T
	+Q8c0IVFzWgdXJaRBJbLpC6Z7VlPC16q2P6UMQw/HrPWAmGJmf7VpH4TLRXChcp0LkxcY4cIb3LYh
	yefgWl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClG-0000000CqWH-3Wwx;
	Thu, 04 Sep 2025 16:24:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8oT-0000000BTIe-19JE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l/7lQhTrFsM5wfoxKtbA8wclhlUecEUrj1EveL4J1o8=; b=WewQF6i6LL+vxLYydpzfZHk7um
	qFsGDuALTh46qh1LZgmV6QQUFEklTE6a0iznzr+IyECjYPrDlDxRaOsekLXprgOKK50mDORkikHAg
	dPAmZKBth5ZS8wxtESWAstXXqWP9cLRKccSGVxpe30S9QbEkkBKQVHNeZO0025Kla5DNpOhChtrgu
	r+YR65Qkea9M06zgcz3fD3GACMsT3aNeOVpdhERmC6SGOD0B5ohNXSKHPwpsx0jkyLNhCr+Sxs3bh
	0UCbnD9xKD4c1tpEW9/K77ITCt0UUEMrhXtSTf7Nw3QwhapNfYjtLwKboEEqDUUASrMM6Yz5rdGFG
	WEO/wjbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48236 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uu8oN-000000001ye-2e1e;
	Thu, 04 Sep 2025 13:11:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uu8oM-00000001vp4-3DC5;
	Thu, 04 Sep 2025 13:11:30 +0100
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
Subject: [PATCH net-next v2 07/11] net: stmmac: mdio: improve mdio register
 field definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uu8oM-00000001vp4-3DC5@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051137_311537_0A80AAA1 
X-CRM114-Status: GOOD (  12.27  )
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
index c95e9799273f..f2b4c1b70ef5 100644
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
@@ -237,7 +237,7 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
 	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
 	       priv->gmii_address_bus_config |
-	       MII_BUSY;
+	       MII_ADDR_GBUSY;
 }
 
 static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
@@ -252,7 +252,7 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 	if (ret < 0)
 		return ret;
 
-	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_ADDR_GBUSY);
 	if (ret)
 		goto out;
 
@@ -261,12 +261,12 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
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
@@ -347,7 +347,7 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 	if (priv->plat->has_gmac4)
 		cmd = MII_GMAC4_WRITE;
 	else
-		cmd = MII_WRITE;
+		cmd = MII_ADDR_GWRITE;
 
 	return stmmac_mdio_write(priv, phyaddr, phyreg, cmd, phydata);
 }
-- 
2.47.2


