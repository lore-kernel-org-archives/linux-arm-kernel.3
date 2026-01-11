Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510EBD2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFhtn4p2FlQEd+TUlXbxYtPvgidB34TfUAa+AKEK7tM=; b=hz2U2yS7AtdSJP0Peoti70oq/Q
	lYm7ywQRPIntg+w9tUm0/G97NOVi/SRvWeJgF/QscvymtZM/flQfNddt+kVxeIsR8Iekg5CRVG+U8
	StTzs7pgIa2K5sHursFkwtugZyElnbN1ixek0hxGjMq1qkcBDD6V+eQhM4TVZbokhuIqf8lRBAypS
	m1PYByyLyL0IwwQptu7ovBwV9jale8KORGk2Sa//12MajKshIrUrZxIgfj7lGLmtn+B9t6obZ8oDK
	cSJNb94tSObSmhrG1mrFgyFAuhsafuOFO9pLL+p/Z/lauyoWJKKE74vNX1ep8fvwVt4cP1kTe+Yys
	3R5I6zYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevI3-00000004Eyz-1eCb;
	Sun, 11 Jan 2026 13:15:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevHx-00000004EwE-3GPJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 13:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nFhtn4p2FlQEd+TUlXbxYtPvgidB34TfUAa+AKEK7tM=; b=rObUxIlRUz6EjvirtkvPfk5VHv
	qWD3FPbpdEGqh1t7DtQCcH8EcB/yCVadLWMuzO0X89WddFRDRymo5DHYO1ZiKhIKC8rRt3DztLXMW
	hDAH5V0Kv+N0Zb65TP5oEr0oOIq4A5gv0aEWKA1+QBjjrNztADfa4KJe6NIui8isI0wQLNwJWtwLq
	zjBTP53wW25ojSlBR8upJm6rt66tuc8lYkgj1stEPoZ79IpiwnHSA1tx+1dayDEzr8Di8OX4ig3lE
	gbi76pEuoBB3aP5kyn1zj6B0UJITevIxetDsHvXkkBBjwOxs3DKprYYu0oYULstgPSgtdVlv+aMuB
	prkb/yVw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42248 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vevHs-000000005US-2b8Z;
	Sun, 11 Jan 2026 13:15:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vevHr-00000002YoY-2X2i;
	Sun, 11 Jan 2026 13:15:19 +0000
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/5] net: stmmac: pass struct stmmac_priv to
 host_irq_status() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vevHr-00000002YoY-2X2i@rmk-PC.armlinux.org.uk>
Date: Sun, 11 Jan 2026 13:15:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_051527_414420_BC7A2B68 
X-CRM114-Status: GOOD (  12.81  )
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

Rather than passing struct mac_device_info to the host_irq_status()
method, pass struct stmmac_priv so that we can pass the integrated
PCS to the PCS interrupt handler.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c  | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c  | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 9cc8f38e7e45..b01815a28280 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -265,10 +265,10 @@ static void dwmac1000_pmt(struct mac_device_info *hw, unsigned long mode)
 	writel(pmt, ioaddr + GMAC_PMT);
 }
 
-static int dwmac1000_irq_status(struct mac_device_info *hw,
+static int dwmac1000_irq_status(struct stmmac_priv *priv,
 				struct stmmac_extra_stats *x)
 {
-	void __iomem *ioaddr = hw->pcsr;
+	void __iomem *ioaddr = priv->hw->pcsr;
 	u32 intr_status = readl(ioaddr + GMAC_INT_STATUS);
 	u32 intr_mask = readl(ioaddr + GMAC_INT_MASK);
 	int ret = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 14e847c0e1a9..cd2928c05550 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -53,7 +53,7 @@ static int dwmac100_rx_ipc_enable(struct mac_device_info *hw)
 	return 0;
 }
 
-static int dwmac100_irq_status(struct mac_device_info *hw,
+static int dwmac100_irq_status(struct stmmac_priv *priv,
 			       struct stmmac_extra_stats *x)
 {
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 2a531c3c2e14..e7ca181e8e76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -615,10 +615,10 @@ static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
 	return ret;
 }
 
-static int dwmac4_irq_status(struct mac_device_info *hw,
+static int dwmac4_irq_status(struct stmmac_priv *priv,
 			     struct stmmac_extra_stats *x)
 {
-	void __iomem *ioaddr = hw->pcsr;
+	void __iomem *ioaddr = priv->hw->pcsr;
 	u32 intr_status = readl(ioaddr + GMAC_INT_STATUS);
 	u32 intr_enable = readl(ioaddr + GMAC_INT_EN);
 	int ret = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index b40b3ea50e25..6724a3f866fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -298,10 +298,10 @@ static void dwxgmac2_dump_regs(struct mac_device_info *hw, u32 *reg_space)
 		reg_space[i] = readl(ioaddr + i * 4);
 }
 
-static int dwxgmac2_host_irq_status(struct mac_device_info *hw,
+static int dwxgmac2_host_irq_status(struct stmmac_priv *priv,
 				    struct stmmac_extra_stats *x)
 {
-	void __iomem *ioaddr = hw->pcsr;
+	void __iomem *ioaddr = priv->hw->pcsr;
 	u32 stat, en;
 	int ret = 0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index df6e8a567b1f..0db96a387259 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -354,7 +354,7 @@ struct stmmac_ops {
 	/* Dump MAC registers */
 	void (*dump_regs)(struct mac_device_info *hw, u32 *reg_space);
 	/* Handle extra events on specific interrupts hw dependent */
-	int (*host_irq_status)(struct mac_device_info *hw,
+	int (*host_irq_status)(struct stmmac_priv *priv,
 			       struct stmmac_extra_stats *x);
 	/* Handle MTL interrupts */
 	int (*host_mtl_irq_status)(struct stmmac_priv *priv,
@@ -453,7 +453,7 @@ struct stmmac_ops {
 #define stmmac_dump_mac_regs(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, dump_regs, __args)
 #define stmmac_host_irq_status(__priv, __args...) \
-	stmmac_do_callback(__priv, mac, host_irq_status, __args)
+	stmmac_do_callback(__priv, mac, host_irq_status, __priv, __args)
 #define stmmac_host_mtl_irq_status(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, host_mtl_irq_status, __priv, __args)
 #define stmmac_set_filter(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b3730312aeed..c2589f02ff7e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6137,7 +6137,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 
 	/* To handle GMAC own interrupts */
 	if (priv->plat->core_type == DWMAC_CORE_GMAC || xmac) {
-		int status = stmmac_host_irq_status(priv, priv->hw, &priv->xstats);
+		int status = stmmac_host_irq_status(priv, &priv->xstats);
 
 		if (unlikely(status)) {
 			/* For LPI we need to save the tx status */
-- 
2.47.3


