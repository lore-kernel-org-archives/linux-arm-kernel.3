Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3454CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89Pirc1gdz/+FhXD1SYe0RDV3wF24KaWnBhuIYtR8Co=; b=wIj1859YSOwfWteIilEiVx2dIe
	JpkS/QyWzzeKk5Ax32j1hvlQTr5PVohkIXDwq1aSNnmHUZr5FOIkRY8uW2jjkxFAq2tyK68eoLwA7
	wKiQ3L2Qimqgp2fvDS1ueZrD91r9I+sfIClPPoLsKIkPiQmjmhoxMnKUr2oaO8hjXhGB6MuA8algv
	1HIzLi1s5ZugO6AiC2ZCmbQJO7EF9k7ybIQ3ASumhaChctWCQyN//RGjPC7ASBw7yDXyPT2c1+HoI
	imN0NXuS/wsAbQFb1E+qPxlZOldm2r2j9IoUUk07i0G3MdksXmVMQp1eCW3AHtMCchLXJ+oVPoXtt
	mJFVvNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomZ-00000006lWM-1pYu;
	Wed, 03 Sep 2025 14:48:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmly-00000006Q3N-16w4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=89Pirc1gdz/+FhXD1SYe0RDV3wF24KaWnBhuIYtR8Co=; b=ZOr1+w81C3EMXtHncCOJtem4OH
	MSoE5NPA8lIJhTDeQKockj6T+Z1FMeYkS503DajJJDx9c2LMuNRcwXF7tLpx9qxv7tC6Psdp1pJoa
	iFvZ2KcAT0LMfysV38HiE07U2UpyAIkTWsnhNvE6C/cKKU5zfNI0yajJu+0SbSXhPU2emx1LgeoIV
	saJChiZbnEGxFPl41upIpCq+8Uef4olMv/qhyRSWo5To45VfcRFVbioxEMRlQdMounJWDsBFWpAg1
	Y1SOArjxCNQdozPGp0gJXIJOQUFOF9QEmep9KoceLjaMFrpXHGL/axvhoXfvWca+RBM4S2r9wiKjp
	GtM3yWJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37348 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1utmlt-000000000VL-4439;
	Wed, 03 Sep 2025 13:39:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1utmlt-00000001s0C-0wac;
	Wed, 03 Sep 2025 13:39:29 +0100
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
Subject: [PATCH net-next 03/11] net: stmmac: mdio: provide
 priv->gmii_address_bus_config
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1utmlt-00000001s0C-0wac@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:29 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_053934_305014_D14C36F1 
X-CRM114-Status: GOOD (  12.98  )
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

Provide a pre-formatted value for the MDIO address register fields
which remain constant across the various different transactions
rather than recreating the register value from scratch every time.
Currently, we only do this for the CR (clock range) field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 26 ++++++++++++-------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 78d6b3737a26..4d5577935b13 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -290,6 +290,7 @@ struct stmmac_priv {
 	int wolopts;
 	int wol_irq;
 	int clk_csr;
+	u32 gmii_address_bus_config;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
 	u32 tx_lpi_timer;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7887340ae7b6..2267a93ce44d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -104,9 +104,7 @@ static int stmmac_xgmac2_mdio_read(struct stmmac_priv *priv, u32 addr,
 	if (ret)
 		goto err_disable_clks;
 
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
-	value |= MII_XGMAC_READ;
+	value |= priv->gmii_address_bus_config | MII_XGMAC_READ;
 
 	/* Wait until any existing MII operation is complete */
 	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
@@ -174,10 +172,7 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 	if (ret)
 		goto err_disable_clks;
 
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
-	value |= phydata;
-	value |= MII_XGMAC_WRITE;
+	value |= priv->gmii_address_bus_config | phydata | MII_XGMAC_WRITE;
 
 	/* Wait until any existing MII operation is complete */
 	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
@@ -239,8 +234,7 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 
 	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
 	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
-	       ((priv->clk_csr << mii_regs->clk_csr_shift) &
-		mii_regs->clk_csr_mask) |
+	       priv->gmii_address_bus_config |
 	       MII_BUSY;
 }
 
@@ -515,6 +509,18 @@ void stmmac_pcs_clean(struct net_device *ndev)
 	priv->hw->xpcs = NULL;
 }
 
+static void stmmac_mdio_bus_config(struct stmmac_priv *priv, u32 value)
+{
+	value <<= priv->hw->mii.clk_csr_shift;
+
+	if (value & ~priv->hw->mii.clk_csr_mask)
+		dev_warn(priv->device,
+			 "clk_csr value out of range (0x%08x exceeds mask 0x%08x), truncating\n",
+			 value, priv->hw->mii.clk_csr_mask);
+
+	priv->gmii_address_bus_config = value & priv->hw->mii.clk_csr_mask;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -535,6 +541,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (!mdio_bus_data)
 		return 0;
 
+	stmmac_mdio_bus_config(priv, priv->clk_csr);
+
 	new_bus = mdiobus_alloc();
 	if (!new_bus)
 		return -ENOMEM;
-- 
2.47.2


