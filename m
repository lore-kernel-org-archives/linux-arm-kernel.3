Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA05FD5327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZorrloPfemvcsYMgP1UDQkKbx9xEkj+9egNHECL/Qqg=; b=RSGy51fiT10EK89ec2DZvhER8Z
	Xkcms9ZQJm3jI73EN2zoPNASbJz0//NSPS4zUXyP4FjU+yrwsWv+ZYKKRQBYO91lsEQE058RETGpK
	4TZ6YkJ5lHhMCQmdJ5A41Fm5Qbz4m2JbehqMojiWf5dvkq40nMhw0eUW4mJD3nx81h6OPKoy/mK6H
	He1VT+0NCXzlLaTUruG9v/9SuNaNoFP6mUQ0qIUpy6N2pgRMKaUXYIRqXvhL+uAA9eaNgxn78weFN
	Xxif+zPezs8/VZpDuLhCcJUfcMqRXRlWOWf97yNCBSaMu4m2BheeMO7lQ+heeTIP9S7hDkmyIJzyx
	ebqM9UMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXf-00000008BJv-1UiE;
	Fri, 27 Feb 2026 09:53:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXd-00000008BGo-0hzo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZorrloPfemvcsYMgP1UDQkKbx9xEkj+9egNHECL/Qqg=; b=R8Po7Hch/KhNtzaCZT60T0Y3ir
	EPgq+7WWGaRNmkBre2NyYLee0Sm+f+SYRcBIJ08F/2taBoHPvNL82+lm9gy+kpsw7SnDYUEkOpPHx
	sbwDOt7NtAWEihZzVaYxaC+ObcZX16mlOVjdE/PyP0gTRtrplV3PnwofOwM5pqrprpU85g9QVI1Tn
	MRki8njPwfE3vzfSurL2eBBSCAXzMYVlEEFZuEGHYU3ShGiARGLncYlq50EjzJQskJ8wRBKx+YvlR
	FWtQ5W0aqaJe4obO5Z/8DRRofJaSFTb0zlCvdlq3ECseGtg+gji0R2YRTiCkQ7lEtfKFds25Am08r
	RKDfr6tQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43986 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXS-000000000d9-0S0K;
	Fri, 27 Feb 2026 09:53:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXO-0000000Avn3-1hhD;
	Fri, 27 Feb 2026 09:53:34 +0000
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
Subject: [PATCH net-next 06/14] net: stmmac: remove dwmac4
 DMA_CHAN_INTR_DEFAULT_[TR]X*
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXO-0000000Avn3-1hhD@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015349_225251_9F082E5A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Remove the DMA_CHAN_INTR_DEFAULT_[TR]X* definitions, which are aliases
of their respective DMA_CHAN_INTR_ENA_[TR]IE definitions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h |  4 ----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 16 ++++++++--------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 9d9077a4ac9f..7fbd02a8119f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -111,8 +111,6 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 /* DMA default interrupt mask for 4.00 */
 #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
 					 DMA_CHAN_INTR_ABNORMAL)
-#define DMA_CHAN_INTR_DEFAULT_RX	(DMA_CHAN_INTR_ENA_RIE)
-#define DMA_CHAN_INTR_DEFAULT_TX	(DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_NORMAL_4_10	(DMA_CHAN_INTR_ENA_NIE_4_10 | \
 					 DMA_CHAN_INTR_ENA_RIE | \
@@ -123,8 +121,6 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 /* DMA default interrupt mask for 4.10a */
 #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \
 					 DMA_CHAN_INTR_ABNORMAL_4_10)
-#define DMA_CHAN_INTR_DEFAULT_RX_4_10	(DMA_CHAN_INTR_ENA_RIE)
-#define DMA_CHAN_INTR_DEFAULT_TX_4_10	(DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_RX_WATCHDOG(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x38)
 #define DMA_CHAN_SLOT_CTRL_STATUS(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x3c)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index c098047a3bff..9217308bfd38 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -116,9 +116,9 @@ void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 
 	if (rx)
-		value |= DMA_CHAN_INTR_DEFAULT_RX;
+		value |= DMA_CHAN_INTR_ENA_RIE;
 	if (tx)
-		value |= DMA_CHAN_INTR_DEFAULT_TX;
+		value |= DMA_CHAN_INTR_ENA_TIE;
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
@@ -130,9 +130,9 @@ void dwmac410_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 
 	if (rx)
-		value |= DMA_CHAN_INTR_DEFAULT_RX_4_10;
+		value |= DMA_CHAN_INTR_ENA_RIE;
 	if (tx)
-		value |= DMA_CHAN_INTR_DEFAULT_TX_4_10;
+		value |= DMA_CHAN_INTR_ENA_TIE;
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
@@ -144,9 +144,9 @@ void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 
 	if (rx)
-		value &= ~DMA_CHAN_INTR_DEFAULT_RX;
+		value &= ~DMA_CHAN_INTR_ENA_RIE;
 	if (tx)
-		value &= ~DMA_CHAN_INTR_DEFAULT_TX;
+		value &= ~DMA_CHAN_INTR_ENA_TIE;
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
@@ -158,9 +158,9 @@ void dwmac410_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 
 	if (rx)
-		value &= ~DMA_CHAN_INTR_DEFAULT_RX_4_10;
+		value &= ~DMA_CHAN_INTR_ENA_RIE;
 	if (tx)
-		value &= ~DMA_CHAN_INTR_DEFAULT_TX_4_10;
+		value &= ~DMA_CHAN_INTR_ENA_TIE;
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
-- 
2.47.3


