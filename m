Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333E6F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TWPZWgjMflG60hVdURSGE4ETIH+Z1lgrcFU4tilmE4=; b=OOIjnwjhBzDZD0DCUsPtWqKBop
	hgyj83aNnu/HJzeIEdXARak+B7rgi4FZ3fGawnkRDK9RIYNZNFPH+3043iYsxnIBaMgMa60tsQd92
	pRzCASM0G5As8iELYieGFMSoePneUpmfUI6HdUpsWL4MUROI+CYxZxYVQiFg9X/YP7dIUAR5GoSU9
	nqktg+06UGH4ObPCSyARo/NUxOxTvVh7hY5y18SxFDH6NLdtVIkpMzTDjuyLHndWnrGOqyWuTjGPl
	ThyGZn7ECLvCgZfSddmTOkbZ2ubeboR+0xppzOZpknJ7GHs4HPNvF9HDslQhl4HSVdsh2P1PtUqhZ
	7S/eJfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AW-00000001bX7-13SY;
	Thu, 05 Mar 2026 10:43:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AS-00000001bUC-41WQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7TWPZWgjMflG60hVdURSGE4ETIH+Z1lgrcFU4tilmE4=; b=rnYTDL+VPPXkxkx3fywXg0xsQs
	rsT4M8x8rF/inmBpp17f971/cy+VhazhiDS6M/sP8dBQQeZ25GQ7z986P58LD9yIiy32wPt+RzZ9Y
	pxVig1uAuwYpXZJf7wKgvfOxwNed7EGOJy/4QrOf1Jnv6+6nkt5wE59+cQnaVeRdeFQqSts+F5AJQ
	YFNXf0pmBeHzJiIsKN4iQmgVUixKbNMWoBLOUUeY8gjURpdzizI2h8qzJ0VUI9g4/vHf0lZ9MfCMm
	9DAdnRdFY/fz5CD58lnwgoxeG4wH7DRjCriKW2qogf5HbPVuZX6bY0d48UvFRZg6l+pVjSXzQKjFN
	wdu1pK2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58682 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vy6AK-000000007nu-37rd;
	Thu, 05 Mar 2026 10:42:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vy6AJ-0000000Btx1-1teC;
	Thu, 05 Mar 2026 10:42:47 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next v2 5/8] net: stmmac: use u32 for MDIO register field
 masks
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vy6AJ-0000000Btx1-1teC@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024257_153230_5895DDC7 
X-CRM114-Status: GOOD (  12.57  )
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

MDIO registers are 32-bit, so use u32 to describe the masks for these
registers. Convert the GENMASK() initialisers to GENMASK_U32() for
type compatibility.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h         |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c    |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c  | 12 ++++++------
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 978f90065681..46454e2886ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -608,9 +608,9 @@ struct mac_link {
 struct mii_regs {
 	unsigned int addr;	/* MII Address */
 	unsigned int data;	/* MII Data */
-	unsigned int addr_mask;		/* MII address mask */
-	unsigned int reg_mask;		/* MII reg mask */
-	unsigned int clk_csr_mask;
+	u32 addr_mask;		/* MII address mask */
+	u32 reg_mask;		/* MII reg mask */
+	u32 clk_csr_mask;
 };
 
 struct mac_device_info {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 6dfccc969d0e..a6f8e78856aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -369,7 +369,7 @@ static int loongson_dwmac_setup(void *apriv, struct mac_device_info *mac)
 	mac->mii.data = GMAC_MII_DATA;
 	mac->mii.addr_mask = 0x0000F800;
 	mac->mii.reg_mask = 0x000007C0;
-	mac->mii.clk_csr_mask = GENMASK(5, 2);
+	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6b18072112db..3ce03b059277 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1063,9 +1063,9 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->link.duplex = EMAC_DUPLEX_FULL;
 	mac->mii.addr = EMAC_MDIO_CMD;
 	mac->mii.data = EMAC_MDIO_DATA;
-	mac->mii.reg_mask = GENMASK(8, 4);
-	mac->mii.addr_mask = GENMASK(16, 12);
-	mac->mii.clk_csr_mask = GENMASK(22, 20);
+	mac->mii.reg_mask = GENMASK_U32(8, 4);
+	mac->mii.addr_mask = GENMASK_U32(16, 12);
+	mac->mii.clk_csr_mask = GENMASK_U32(22, 20);
 	mac->unicast_filter_entries = 8;
 
 	/* Synopsys Id is not available */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 10acca806f4f..4ea55be04c5c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -498,7 +498,7 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	mac->mii.data = GMAC_MII_DATA;
 	mac->mii.addr_mask = 0x0000F800;
 	mac->mii.reg_mask = 0x000007C0;
-	mac->mii.clk_csr_mask = GENMASK(5, 2);
+	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 911753b9889e..7c91ea2775d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -186,7 +186,7 @@ int dwmac100_setup(struct stmmac_priv *priv)
 	mac->mii.data = MAC_MII_DATA;
 	mac->mii.addr_mask = 0x0000F800;
 	mac->mii.reg_mask = 0x000007C0;
-	mac->mii.clk_csr_mask = GENMASK(5, 2);
+	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 0e87590c806b..602771e19d0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1030,9 +1030,9 @@ int dwmac4_setup(struct stmmac_priv *priv)
 	mac->link.speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS;
 	mac->mii.addr = GMAC_MDIO_ADDR;
 	mac->mii.data = GMAC_MDIO_DATA;
-	mac->mii.addr_mask = GENMASK(25, 21);
-	mac->mii.reg_mask = GENMASK(20, 16);
-	mac->mii.clk_csr_mask = GENMASK(11, 8);
+	mac->mii.addr_mask = GENMASK_U32(25, 21);
+	mac->mii.reg_mask = GENMASK_U32(20, 16);
+	mac->mii.clk_csr_mask = GENMASK_U32(11, 8);
 	mac->num_vlan = stmmac_get_num_vlan(priv->ioaddr);
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index ba98e22f1c12..915e7c2ab11f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1551,9 +1551,9 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	mac->mii.addr = XGMAC_MDIO_ADDR;
 	mac->mii.data = XGMAC_MDIO_DATA;
-	mac->mii.addr_mask = GENMASK(20, 16);
-	mac->mii.reg_mask = GENMASK(15, 0);
-	mac->mii.clk_csr_mask = GENMASK(21, 19);
+	mac->mii.addr_mask = GENMASK_U32(20, 16);
+	mac->mii.reg_mask = GENMASK_U32(15, 0);
+	mac->mii.clk_csr_mask = GENMASK_U32(21, 19);
 	mac->num_vlan = stmmac_get_num_vlan(priv->ioaddr);
 
 	return 0;
@@ -1591,9 +1591,9 @@ int dwxlgmac2_setup(struct stmmac_priv *priv)
 
 	mac->mii.addr = XGMAC_MDIO_ADDR;
 	mac->mii.data = XGMAC_MDIO_DATA;
-	mac->mii.addr_mask = GENMASK(20, 16);
-	mac->mii.reg_mask = GENMASK(15, 0);
-	mac->mii.clk_csr_mask = GENMASK(21, 19);
+	mac->mii.addr_mask = GENMASK_U32(20, 16);
+	mac->mii.reg_mask = GENMASK_U32(15, 0);
+	mac->mii.clk_csr_mask = GENMASK_U32(21, 19);
 
 	return 0;
 }
-- 
2.47.3


