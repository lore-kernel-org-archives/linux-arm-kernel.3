Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D75FC98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kIYBZYHbSuff3l7sAHhcXWX3iDvTERmwHuTeLbzpX8M=; b=m5DpdB9CDIa9aMR4K2W/d7e1w3
	inIBY2Udy7VSv5u1CCsI3yz2xfzl5EMOLGc0mb5DCuGk1RwDkkrK4/PZ7PdBGCPet5m13J98a96IT
	Tc6tgkjOGsj5jxXnTX0z5FD6fq1POJBFYCThb4wBnE/+e+5xhtW6Chod3pr2HDGDVe92TkVtcDtON
	VbHmyDN0OqItIAaZ3VClNe9tC5W5y3vA4lMWmFENIipuEOaYWjU0lZPdNSmgMdPYT2S6cMv7ZbqnX
	ppWTsQvlC9a0O/zgXWU3OirpFG+NzhaWcE6Ui1DHxF0nGef8gZj1fyfbmMJ00HYt8x0n9jHrqxHzV
	NEwDzX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtBk-0000000F0bE-0v1a;
	Fri, 16 Jan 2026 23:25:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtBh-0000000F0ab-3iUh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kIYBZYHbSuff3l7sAHhcXWX3iDvTERmwHuTeLbzpX8M=; b=dpHIgoZQ4tpA8MPgX8U/cCNmEx
	KNNxBIgSO4gK7dP/F5e2CUKYtRIsD3BB3+ccG5ZSvu4Tao6OVcDQ6DT8LfOwcbwwxgtZEW5pb2GAQ
	b8qJ7gxL58jll05fvRI5itD2bhGmYLP6o6qjM1TkD+KdDq7r1dxWfCxUKHB1WDKJ0OOlL/aHEkZyZ
	9h246Y8yIrmN4rTzefaHapns2KyoEAp1NUVqYmLriYXyJLtRTwbIu/a3I1MsE01Gx3zN4V1vDCyX5
	OTh+OoF+VlpAsjuwRlfEZHt89Hjhj1Y2XnhDYiliuKYUYQhO+e83eNuv+xEdC2CakuTfA49aq5dFc
	LNJGraWA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52834 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vgtBc-000000002lj-3N0W;
	Fri, 16 Jan 2026 23:25:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vgtBc-00000005D6v-040n;
	Fri, 16 Jan 2026 23:25:00 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
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
Subject: [PATCH RFC net-next] net: stmmac: enable RPS and RBU interrupts
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
Date: Fri, 16 Jan 2026 23:25:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_152505_943892_770CF71D 
X-CRM114-Status: UNSURE (   9.61  )
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

Enable receive process stopped and receive buffer unavailable
interrupts, so that the statistic counters can be updated.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Maxime,

You may find this patch useful, as it makes the "rx_buf_unav_irq"
and "rx_process_stopped_irq" ethtool statistic counters functional.
This means that the lack of receive descriptors can still be detected
even if the receive side doesn't actually stall.

I'm not sure why we publish these statistic counters if we don't
enable the interrupts to allow them to ever be non-zero.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 9d9077a4ac9f..d7f86b398abe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -99,6 +99,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 #define DMA_CHAN_INTR_ENA_NIE_4_10	BIT(15)
 #define DMA_CHAN_INTR_ENA_AIE_4_10	BIT(14)
 #define DMA_CHAN_INTR_ENA_FBE		BIT(12)
+#define DMA_CHAN_INTR_ENA_RPS		BIT(8)
+#define DMA_CHAN_INTR_ENA_RBU		BIT(7)
 #define DMA_CHAN_INTR_ENA_RIE		BIT(6)
 #define DMA_CHAN_INTR_ENA_TIE		BIT(0)
 
@@ -107,6 +109,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_ABNORMAL		(DMA_CHAN_INTR_ENA_AIE | \
+					 DMA_CHAN_INTR_ENA_RPS | \
+					 DMA_CHAN_INTR_ENA_RBU | \
 					 DMA_CHAN_INTR_ENA_FBE)
 /* DMA default interrupt mask for 4.00 */
 #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
@@ -119,6 +123,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_ABNORMAL_4_10	(DMA_CHAN_INTR_ENA_AIE_4_10 | \
+					 DMA_CHAN_INTR_ENA_RPS | \
+					 DMA_CHAN_INTR_ENA_RBU | \
 					 DMA_CHAN_INTR_ENA_FBE)
 /* DMA default interrupt mask for 4.10a */
 #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \
-- 
2.47.3


