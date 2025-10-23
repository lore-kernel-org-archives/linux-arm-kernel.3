Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596D3CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZxI4ElVQRDHDwUjNlzEzvtgHXaIDyFC91nvXTxngLA=; b=L0u/rv96o3PsW8UkiwbCpU2RzP
	B4YvniTBmqm736YGJusqcZp/neLUz+9uQ4MVTvjDJR9vRhgwmnz0UsBQIZiEeQyMrHlkEL1kgPkW2
	Xj8BmcOKtG3ztDPpnE3qSLX79n1s+h2yz4G/9KUoAw7vk8uKDSn2M4Wu9JHOcXF/7NguLt3caNZDv
	wni9iOOY3iEh/4zU2Zdy+Xec4pWj0gVbp+MsPzhbwrVeoKa/0eih90YiaXQHhvP3EW0i0Ios/wKes
	yEtd48hyjiF09aaDERj2welHZItEtqRWjMgmxJHQ3E8qEQc4j5Xd69nslLy3AjHyw3TTAt6B0hXeZ
	Qk+u3tCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrtz-00000005mt6-3g3Z;
	Thu, 23 Oct 2025 09:46:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrtx-00000005mrv-0Sgl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lZxI4ElVQRDHDwUjNlzEzvtgHXaIDyFC91nvXTxngLA=; b=zENATkq4Lcm2pf3+N7P2MW0EL8
	u8Tiyx32llIGBSopm7LSyxe6V20ZVXf5Nsrm7are6QqBII3VMhPrqG/FaWOZTSqBM+xyS3/2hDRj5
	BRkXhq40cbDtG/t+FcoW/V8z5LfEUho6ubQOIL6ACKd9FK5sV/qM4aOhaIpL/XZVbyci8DTLU28BV
	1BPAZ2TGzKF3gSjbeVWTcUxDU+4KNyyuK8J5B4+cQMeKMHWB3AIg9GkHnqRNS7toyAI4TT0VTfIgt
	REYio8ixamC2hpEQx81FY6h3BAHCLZSXoXE+W9VuH4VGPRf6B8vaz7o5FxZQ/VZFkt2yX5pflIEq8
	63YMfYTw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60232 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrtq-0000000068s-3iZF;
	Thu, 23 Oct 2025 10:46:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrtp-0000000BMYs-3bhI;
	Thu, 23 Oct 2025 10:46:25 +0100
In-Reply-To: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/2] net: stmmac: add support for controlling PCS
 interrupts
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrtp-0000000BMYs-3bhI@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:46:25 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_024633_794589_6EB08905 
X-CRM114-Status: GOOD (  16.01  )
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

Add support to the PCS instance for controlling the PCS interrupts
depending on whether the PCS is used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  7 +++---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 11 ++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  2 --
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 10 +++------
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 22 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  4 +++-
 6 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 8f3002d9de78..697bba641e05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -38,11 +38,10 @@
 #define	GMAC_INT_DISABLE_PCSAN		BIT(2)
 #define	GMAC_INT_DISABLE_PMT		BIT(3)
 #define	GMAC_INT_DISABLE_TIMESTAMP	BIT(9)
-#define	GMAC_INT_DISABLE_PCS	(GMAC_INT_DISABLE_PCSLINK | \
-				 GMAC_INT_DISABLE_PCSAN)
 #define	GMAC_INT_DEFAULT_MASK	(GMAC_INT_DISABLE_RGMII | \
-				 GMAC_INT_DISABLE_TIMESTAMP | \
-				 GMAC_INT_DISABLE_PCS)
+				 GMAC_INT_DISABLE_PCSLINK | \
+				 GMAC_INT_DISABLE_PCSAN | \
+				 GMAC_INT_DISABLE_TIMESTAMP)
 
 /* PMT Control and Status */
 #define GMAC_PMT		0x0000002c
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 2ca94bfd3f71..a2ae136d2c0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -27,7 +27,9 @@ static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
+					  GMAC_INT_DISABLE_PCSLINK |
+					  GMAC_INT_DISABLE_PCSAN);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
@@ -48,12 +50,7 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
-	value = GMAC_INT_DEFAULT_MASK;
-
-	if (hw->pcs)
-		value &= ~GMAC_INT_DISABLE_PCS;
-
-	writel(value, ioaddr + GMAC_INT_MASK);
+	writel(GMAC_INT_DEFAULT_MASK, ioaddr + GMAC_INT_MASK);
 
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Tag detection without filtering */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 6dd84b6544cc..3cb733781e1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -106,8 +106,6 @@
 #define GMAC_INT_LPI_EN			BIT(5)
 #define GMAC_INT_TSIE			BIT(12)
 
-#define	GMAC_PCS_IRQ_DEFAULT	(GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE)
-
 #define	GMAC_INT_DEFAULT_ENABLE	(GMAC_INT_PMT_EN | GMAC_INT_LPI_EN | \
 				 GMAC_INT_TSIE)
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6269407d70cd..a4282fd7c3c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,7 +27,8 @@ static int dwmac4_pcs_init(struct stmmac_priv *priv)
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
+					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
@@ -46,12 +47,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	writel((clk_rate / 1000000) - 1, ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
 
 	/* Enable GMAC interrupts */
-	value = GMAC_INT_DEFAULT_ENABLE;
-
-	if (hw->pcs)
-		value |= GMAC_PCS_IRQ_DEFAULT;
-
-	writel(value, ioaddr + GMAC_INT_EN);
+	writel(GMAC_INT_DEFAULT_ENABLE, ioaddr + GMAC_INT_EN);
 
 	if (GMAC_INT_DEFAULT_ENABLE & GMAC_INT_TSIE)
 		init_waitqueue_head(&priv->tstamp_busy_wait);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 50ea51d7a1cc..e2f531c11986 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -2,6 +2,22 @@
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 
+static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
+
+	return 0;
+}
+
+static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
+}
+
 static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
@@ -23,11 +39,14 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_enable = dwmac_integrated_pcs_enable,
+	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
 	.pcs_config = dwmac_integrated_pcs_config,
 };
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
+			       u32 int_mask)
 {
 	struct stmmac_pcs *spcs;
 
@@ -37,6 +56,7 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
 
 	spcs->priv = priv;
 	spcs->base = priv->ioaddr + offset;
+	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 64397ac8ecab..cda93894168e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -52,6 +52,7 @@ struct stmmac_priv;
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
+	u32 int_mask;
 	struct phylink_pcs pcs;
 };
 
@@ -61,7 +62,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct stmmac_pcs, pcs);
 }
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset);
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
+			       u32 int_mask);
 
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
-- 
2.47.3


