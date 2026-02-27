Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9EFD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf1QswQcmBvRnk87FFzbebb6xULLTXkeOFLe8YFoLoI=; b=E1rw8kreg4s6A/Y8jWxMjt2w/F
	JowpgrY7brQ7+bTlAfw5Tkiqu5VC6uzFXOVBT1kMJHDAsZczutYIq9DUwjBJOE+dH7ZO53hmA8af1
	dKMU/OfwwNmqL7ORyf2C3JqFn6gYbpoPO3/Ou3LJV/c7fa2tRDijtBDrOkn1XJ8TDpecDxtGZ9hvl
	d3Zl8l95gPhhSPbZ/l3E1uTedl3aT36bnlf/IfOz8IS53bvjzBvQxk08IuXYRTcbb44EktHtAiGUL
	RytP/iTCl4XnJ1XcIEgaYwoji4khpJTjHP1O2HrT4uHYF2scenWuI/gDn2coQ4jX6CF3kA1Lli3p0
	kBfjqjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXj-00000008BNf-2jVG;
	Fri, 27 Feb 2026 09:53:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXg-00000008BIZ-2JEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bf1QswQcmBvRnk87FFzbebb6xULLTXkeOFLe8YFoLoI=; b=XqXR5twb4rZe3u9oLt6RA55jd9
	jXevEjJ0eoiN9U4uU1Y3YEP4k7rMz11sWq/UU3JIOUWaMl0uNHu2LUsv2otP8HbZsoCqF5YrzrKDh
	HVlfh+005MnqpRN2buhaq9DYbwBStJ2Qyw4G77cO3ecI7syU9nJBoBeDxNQJ2hQHq6UVbn7Pr0zHI
	QS12+yT2gU+2rj+FbnxvEfUkANxx9s95Uwn8FfqUT881JQVqrQz6LNIY3vc2GH/QBZaZKNjfMA7Pl
	ii7pFzOEqxJZ6u95pTSNlDyzS8L/ExLOzhdNCr1tFOOBshdevl51XSC21ENj8OCpLwCK7+tFO1dQO
	KH46cFKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42698 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXV-000000000dR-1zvu;
	Fri, 27 Feb 2026 09:53:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXT-0000000Avn9-29US;
	Fri, 27 Feb 2026 09:53:39 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 07/14] net: stmmac: remove
 dwmac410_(enable|disable)_dma_irq
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXT-0000000Avn9-29US@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015352_595689_248BF0E5 
X-CRM114-Status: GOOD (  11.09  )
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

As a result of the previous cleanup, it is now obvious that there are
no differences between the dwmac4 and dwmac410 versions of the DMA
interrupt enable/disable functions.

Moreover, dwmac410_disable_dma_irq() is completely unused; instead,
dwmac4_disable_dma_irq() is used to disable the interrupts for v4.10a
cores while dwmac410_enable_dma_irq() was being used to enable these
same same interrupts.

Remove the unnecessary v4.10a functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  4 ---
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 28 -------------------
 3 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 60b880cdd9da..28728271fbc9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -582,7 +582,7 @@ const struct stmmac_dma_ops dwmac410_dma_ops = {
 	.dump_regs = dwmac4_dump_dma_regs,
 	.dma_rx_mode = dwmac4_dma_rx_chan_op_mode,
 	.dma_tx_mode = dwmac4_dma_tx_chan_op_mode,
-	.enable_dma_irq = dwmac410_enable_dma_irq,
+	.enable_dma_irq = dwmac4_enable_dma_irq,
 	.disable_dma_irq = dwmac4_disable_dma_irq,
 	.start_tx = dwmac4_dma_start_tx,
 	.stop_tx = dwmac4_dma_stop_tx,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 7fbd02a8119f..af6580332d49 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -170,12 +170,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 int dwmac4_dma_reset(void __iomem *ioaddr);
 void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			   u32 chan, bool rx, bool tx);
-void dwmac410_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			     u32 chan, bool rx, bool tx);
 void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			    u32 chan, bool rx, bool tx);
-void dwmac410_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			      u32 chan, bool rx, bool tx);
 void dwmac4_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			 u32 chan);
 void dwmac4_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 9217308bfd38..8c87a20880c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -123,20 +123,6 @@ void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
-void dwmac410_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			     u32 chan, bool rx, bool tx)
-{
-	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
-	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-
-	if (rx)
-		value |= DMA_CHAN_INTR_ENA_RIE;
-	if (tx)
-		value |= DMA_CHAN_INTR_ENA_TIE;
-
-	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-}
-
 void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			    u32 chan, bool rx, bool tx)
 {
@@ -151,20 +137,6 @@ void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
-void dwmac410_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			      u32 chan, bool rx, bool tx)
-{
-	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
-	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-
-	if (rx)
-		value &= ~DMA_CHAN_INTR_ENA_RIE;
-	if (tx)
-		value &= ~DMA_CHAN_INTR_ENA_TIE;
-
-	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-}
-
 int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 			 struct stmmac_extra_stats *x, u32 chan, u32 dir)
 {
-- 
2.47.3


