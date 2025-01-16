Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116A4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ucz8WHXHQrZmtX6zVFVqijClIEz/ncYXeQ0FMRGrxpQ=; b=3D9lnguY3FPWSuEFpM12V4w+w2
	uqBWFWvxUTjFVQzZ5/Xx2YopqMJaQiBxy6puNUvduFej9OnG6izAw5Bu1c7rhLsRLlJyQSoDrweay
	p+oKu8RcF+DIImqY5k05WKuPpmwN5vpAo1SL1u1+pT5DweO2XoDhdbWo2Tv9qGXpCXyof/m0XKQJv
	Jok17sSxt3qQmtJwodGEjE0xIs+oFjH7tt+hd6wtI63HWUINjmH0igk8624osB1j9tOE3MSkkSkUk
	geUuq3iRTJCu+kYQd6O4zBCB9Bqi7UCYbxhEcLJlIyuyUrRWbyApTQEAIqvCAGv4A4Y8g3wd36RTF
	NPAhN6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZYn-0000000GcDH-1jQT;
	Thu, 16 Jan 2025 23:46:01 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZJU-0000000GT3i-3Pgd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:30:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737070211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ucz8WHXHQrZmtX6zVFVqijClIEz/ncYXeQ0FMRGrxpQ=;
	b=q+Vcq6t9Fnyj+nAwV7yMgUJ7qBdgTmSBDXcJb0dZs647EIq5z+0CtQIKT0FSzSKQDcXRpf
	d/NG/YQmymagPXUTAKAIkMuZ9ceAZNViZ4OGWd+awRWpHOZtpgswBVeXhJ6RUXLgNh51mO
	+SZZ40nRZR4IM2YYJwpJilqG17IisfI=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v4 4/6] net: xilinx: axienet: Support adjusting coalesce settings while running
Date: Thu, 16 Jan 2025 18:29:52 -0500
Message-Id: <20250116232954.2696930-5-sean.anderson@linux.dev>
In-Reply-To: <20250116232954.2696930-1-sean.anderson@linux.dev>
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_153013_003771_403EF7F3 
X-CRM114-Status: GOOD (  26.83  )
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

In preparation for adaptive IRQ coalescing, we first need to support
adjusting the settings at runtime. The existing code doesn't require any
locking because

- dma_start is the only function that modifies rx/tx_dma_cr. It is
  always called with IRQs and NAPI disabled, so nothing else is touching
  the hardware.
- The IRQs don't race with poll, since the latter is a softirq.
- The IRQs don't race with dma_stop since they both just clear the
  control registers.
- dma_stop doesn't race with poll since the former is called with NAPI
  disabled.

However, once we introduce another function that modifies rx/tx_dma_cr,
we need to have some locking to prevent races. Introduce two locks to
protect these variables and their registers.

The control register values are now generated where the coalescing
settings are set. Converting coalescing settings to control register
values may require sleeping because of clk_get_rate. However, the
read/modify/write of the control registers themselves can't sleep
because it needs to happen in IRQ context. By pre-calculating the
control register values, we avoid introducing an additional mutex.

Since axienet_dma_start writes the control settings when it runs, we
don't bother updating the CR registers when rx/tx_dma_started is false.
This prevents any issues from writing to the control registers in the
middle of a reset sequence.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Shannon Nelson <shannon.nelson@amd.com>
---

(no changes since v3)

Changes in v3:
- Move spin (un)locking in IRQs inside the if condition of
  napi_schedule_prep. This lets us hold the lock just for the rmw.
- Fix function name in doc comments for axienet_update_coalesce_rx/tx

Changes in v2:
- Don't use spin_lock_irqsave when we know the context
- Split the CR calculation refactor from runtime coalesce settings
  adjustment support for easier review.
- Have axienet_update_coalesce_rx/tx take the cr value/mask instead of
  calculating it with axienet_calc_cr. This will make it easier to add
  partial updates in the next few commits.
- Split off CR calculation merging into another patch

 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   8 ++
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 134 +++++++++++++++---
 2 files changed, 119 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 8fd3b45ef6aa..6b8e550c2155 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -484,7 +484,9 @@ struct skbuf_dma_descriptor {
  * @regs:	Base address for the axienet_local device address space
  * @dma_regs:	Base address for the axidma device address space
  * @napi_rx:	NAPI RX control structure
+ * @rx_cr_lock: Lock protecting @rx_dma_cr, its register, and @rx_dma_started
  * @rx_dma_cr:  Nominal content of RX DMA control register
+ * @rx_dma_started: Set when RX DMA is started
  * @rx_bd_v:	Virtual address of the RX buffer descriptor ring
  * @rx_bd_p:	Physical address(start address) of the RX buffer descr. ring
  * @rx_bd_num:	Size of RX buffer descriptor ring
@@ -494,7 +496,9 @@ struct skbuf_dma_descriptor {
  * @rx_bytes:	RX byte count for statistics
  * @rx_stat_sync: Synchronization object for RX stats
  * @napi_tx:	NAPI TX control structure
+ * @tx_cr_lock: Lock protecting @tx_dma_cr, its register, and @tx_dma_started
  * @tx_dma_cr:  Nominal content of TX DMA control register
+ * @tx_dma_started: Set when TX DMA is started
  * @tx_bd_v:	Virtual address of the TX buffer descriptor ring
  * @tx_bd_p:	Physical address(start address) of the TX buffer descr. ring
  * @tx_bd_num:	Size of TX buffer descriptor ring
@@ -566,7 +570,9 @@ struct axienet_local {
 	void __iomem *dma_regs;
 
 	struct napi_struct napi_rx;
+	spinlock_t rx_cr_lock;
 	u32 rx_dma_cr;
+	bool rx_dma_started;
 	struct axidma_bd *rx_bd_v;
 	dma_addr_t rx_bd_p;
 	u32 rx_bd_num;
@@ -576,7 +582,9 @@ struct axienet_local {
 	struct u64_stats_sync rx_stat_sync;
 
 	struct napi_struct napi_tx;
+	spinlock_t tx_cr_lock;
 	u32 tx_dma_cr;
+	bool tx_dma_started;
 	struct axidma_bd *tx_bd_v;
 	dma_addr_t tx_bd_p;
 	u32 tx_bd_num;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index bd95f2ba3bae..b70e65757454 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -266,16 +266,12 @@ static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
  */
 static void axienet_dma_start(struct axienet_local *lp)
 {
+	spin_lock_irq(&lp->rx_cr_lock);
+
 	/* Start updating the Rx channel control register */
-	lp->rx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_rx,
-					lp->coalesce_usec_rx);
+	lp->rx_dma_cr &= ~XAXIDMA_CR_RUNSTOP_MASK;
 	axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);
 
-	/* Start updating the Tx channel control register */
-	lp->tx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_tx,
-					lp->coalesce_usec_tx);
-	axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
-
 	/* Populate the tail pointer and bring the Rx Axi DMA engine out of
 	 * halted state. This will make the Rx side ready for reception.
 	 */
@@ -284,6 +280,14 @@ static void axienet_dma_start(struct axienet_local *lp)
 	axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);
 	axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, lp->rx_bd_p +
 			     (sizeof(*lp->rx_bd_v) * (lp->rx_bd_num - 1)));
+	lp->rx_dma_started = true;
+
+	spin_unlock_irq(&lp->rx_cr_lock);
+	spin_lock_irq(&lp->tx_cr_lock);
+
+	/* Start updating the Tx channel control register */
+	lp->tx_dma_cr &= ~XAXIDMA_CR_RUNSTOP_MASK;
+	axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
 
 	/* Write to the RS (Run-stop) bit in the Tx channel control register.
 	 * Tx channel is now ready to run. But only after we write to the
@@ -292,6 +296,9 @@ static void axienet_dma_start(struct axienet_local *lp)
 	axienet_dma_out_addr(lp, XAXIDMA_TX_CDESC_OFFSET, lp->tx_bd_p);
 	lp->tx_dma_cr |= XAXIDMA_CR_RUNSTOP_MASK;
 	axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
+	lp->tx_dma_started = true;
+
+	spin_unlock_irq(&lp->tx_cr_lock);
 }
 
 /**
@@ -627,14 +634,22 @@ static void axienet_dma_stop(struct axienet_local *lp)
 	int count;
 	u32 cr, sr;
 
-	cr = axienet_dma_in32(lp, XAXIDMA_RX_CR_OFFSET);
-	cr &= ~(XAXIDMA_CR_RUNSTOP_MASK | XAXIDMA_IRQ_ALL_MASK);
+	spin_lock_irq(&lp->rx_cr_lock);
+
+	cr = lp->rx_dma_cr & ~(XAXIDMA_CR_RUNSTOP_MASK | XAXIDMA_IRQ_ALL_MASK);
 	axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, cr);
+	lp->rx_dma_started = false;
+
+	spin_unlock_irq(&lp->rx_cr_lock);
 	synchronize_irq(lp->rx_irq);
 
-	cr = axienet_dma_in32(lp, XAXIDMA_TX_CR_OFFSET);
-	cr &= ~(XAXIDMA_CR_RUNSTOP_MASK | XAXIDMA_IRQ_ALL_MASK);
+	spin_lock_irq(&lp->tx_cr_lock);
+
+	cr = lp->tx_dma_cr & ~(XAXIDMA_CR_RUNSTOP_MASK | XAXIDMA_IRQ_ALL_MASK);
 	axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, cr);
+	lp->tx_dma_started = false;
+
+	spin_unlock_irq(&lp->tx_cr_lock);
 	synchronize_irq(lp->tx_irq);
 
 	/* Give DMAs a chance to halt gracefully */
@@ -983,7 +998,9 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 		 * cause an immediate interrupt if any TX packets are
 		 * already pending.
 		 */
+		spin_lock_irq(&lp->tx_cr_lock);
 		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
+		spin_unlock_irq(&lp->tx_cr_lock);
 	}
 	return packets;
 }
@@ -1249,7 +1266,9 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
 		 * cause an immediate interrupt if any RX packets are
 		 * already pending.
 		 */
+		spin_lock_irq(&lp->rx_cr_lock);
 		axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);
+		spin_unlock_irq(&lp->rx_cr_lock);
 	}
 	return packets;
 }
@@ -1287,11 +1306,14 @@ static irqreturn_t axienet_tx_irq(int irq, void *_ndev)
 		/* Disable further TX completion interrupts and schedule
 		 * NAPI to handle the completions.
 		 */
-		u32 cr = lp->tx_dma_cr;
-
-		cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 		if (napi_schedule_prep(&lp->napi_tx)) {
+			u32 cr;
+
+			spin_lock(&lp->tx_cr_lock);
+			cr = lp->tx_dma_cr;
+			cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 			axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, cr);
+			spin_unlock(&lp->tx_cr_lock);
 			__napi_schedule(&lp->napi_tx);
 		}
 	}
@@ -1332,11 +1354,15 @@ static irqreturn_t axienet_rx_irq(int irq, void *_ndev)
 		/* Disable further RX completion interrupts and schedule
 		 * NAPI receive.
 		 */
-		u32 cr = lp->rx_dma_cr;
-
-		cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 		if (napi_schedule_prep(&lp->napi_rx)) {
+			u32 cr;
+
+			spin_lock(&lp->rx_cr_lock);
+			cr = lp->rx_dma_cr;
+			cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 			axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, cr);
+			spin_unlock(&lp->rx_cr_lock);
+
 			__napi_schedule(&lp->napi_rx);
 		}
 	}
@@ -2002,6 +2028,62 @@ axienet_ethtools_set_pauseparam(struct net_device *ndev,
 	return phylink_ethtool_set_pauseparam(lp->phylink, epauseparm);
 }
 
+/**
+ * axienet_update_coalesce_rx() - Set RX CR
+ * @lp: Device private data
+ * @cr: Value to write to the RX CR
+ * @mask: Bits to set from @cr
+ */
+static void axienet_update_coalesce_rx(struct axienet_local *lp, u32 cr,
+				       u32 mask)
+{
+	spin_lock_irq(&lp->rx_cr_lock);
+	lp->rx_dma_cr &= ~mask;
+	lp->rx_dma_cr |= cr;
+	/* If DMA isn't started, then the settings will be applied the next
+	 * time dma_start() is called.
+	 */
+	if (lp->rx_dma_started) {
+		u32 reg = axienet_dma_in32(lp, XAXIDMA_RX_CR_OFFSET);
+
+		/* Don't enable IRQs if they are disabled by NAPI */
+		if (reg & XAXIDMA_IRQ_ALL_MASK)
+			cr = lp->rx_dma_cr;
+		else
+			cr = lp->rx_dma_cr & ~XAXIDMA_IRQ_ALL_MASK;
+		axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, cr);
+	}
+	spin_unlock_irq(&lp->rx_cr_lock);
+}
+
+/**
+ * axienet_update_coalesce_tx() - Set TX CR
+ * @lp: Device private data
+ * @cr: Value to write to the TX CR
+ * @mask: Bits to set from @cr
+ */
+static void axienet_update_coalesce_tx(struct axienet_local *lp, u32 cr,
+				       u32 mask)
+{
+	spin_lock_irq(&lp->tx_cr_lock);
+	lp->tx_dma_cr &= ~mask;
+	lp->tx_dma_cr |= cr;
+	/* If DMA isn't started, then the settings will be applied the next
+	 * time dma_start() is called.
+	 */
+	if (lp->tx_dma_started) {
+		u32 reg = axienet_dma_in32(lp, XAXIDMA_TX_CR_OFFSET);
+
+		/* Don't enable IRQs if they are disabled by NAPI */
+		if (reg & XAXIDMA_IRQ_ALL_MASK)
+			cr = lp->tx_dma_cr;
+		else
+			cr = lp->tx_dma_cr & ~XAXIDMA_IRQ_ALL_MASK;
+		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, cr);
+	}
+	spin_unlock_irq(&lp->tx_cr_lock);
+}
+
 /**
  * axienet_ethtools_get_coalesce - Get DMA interrupt coalescing count.
  * @ndev:	Pointer to net_device structure
@@ -2050,12 +2132,7 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 			      struct netlink_ext_ack *extack)
 {
 	struct axienet_local *lp = netdev_priv(ndev);
-
-	if (netif_running(ndev)) {
-		NL_SET_ERR_MSG(extack,
-			       "Please stop netif before applying configuration");
-		return -EBUSY;
-	}
+	u32 cr;
 
 	if (ecoalesce->rx_max_coalesced_frames > 255 ||
 	    ecoalesce->tx_max_coalesced_frames > 255) {
@@ -2083,6 +2160,11 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 	lp->coalesce_count_tx = ecoalesce->tx_max_coalesced_frames;
 	lp->coalesce_usec_tx = ecoalesce->tx_coalesce_usecs;
 
+	cr = axienet_calc_cr(lp, lp->coalesce_count_rx, lp->coalesce_usec_rx);
+	axienet_update_coalesce_rx(lp, cr, ~XAXIDMA_CR_RUNSTOP_MASK);
+
+	cr = axienet_calc_cr(lp, lp->coalesce_count_tx, lp->coalesce_usec_tx);
+	axienet_update_coalesce_tx(lp, cr, ~XAXIDMA_CR_RUNSTOP_MASK);
 	return 0;
 }
 
@@ -2862,10 +2944,16 @@ static int axienet_probe(struct platform_device *pdev)
 		axienet_set_mac_address(ndev, NULL);
 	}
 
+	spin_lock_init(&lp->rx_cr_lock);
+	spin_lock_init(&lp->tx_cr_lock);
 	lp->coalesce_count_rx = XAXIDMA_DFT_RX_THRESHOLD;
 	lp->coalesce_count_tx = XAXIDMA_DFT_TX_THRESHOLD;
 	lp->coalesce_usec_rx = XAXIDMA_DFT_RX_USEC;
 	lp->coalesce_usec_tx = XAXIDMA_DFT_TX_USEC;
+	lp->rx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_rx,
+					lp->coalesce_usec_rx);
+	lp->tx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_tx,
+					lp->coalesce_usec_tx);
 
 	ret = axienet_mdio_setup(lp);
 	if (ret)
-- 
2.35.1.1320.gc452695387.dirty


