Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3034C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25+mkLRndeOdmJwbwwvoxe2245VKxPIbbYFLpXOrTFw=; b=VYqmcDcextAvC+Dd+frWoZqL/0
	F0QRstcL8gecSWxuS6vrSaZlkxKNA1RURpoXap+VYbBg9IX9/WhkhYsdmZiFQFjHXvYR1vsb0w5VK
	9aJYjy8NG4vQqZ9iHsjvS75b1v7y1LmE4X1wPHs0PcqoE5i7i9Vq6XElnRxJQ3frZF6GEqT3jZ8Y+
	GR4It2+CkLxBeH9tQ4j94Y5JGvhVKs1a/WNwSaVAfM4oVcN8MW9qnn8o46re6sNm411bCvt+mcZSE
	fbSnxy2MK2tuKZoSFhutLmyVtW1vJj6Ca3CsjviWgfhvZ8zeS/eK4og27H1BOBirRaGPUmgNcvqWv
	XzJgwqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZbH-0000000GdAx-2tm8;
	Thu, 16 Jan 2025 23:48:35 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZJZ-0000000GT6v-2Rsx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:30:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737070216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=25+mkLRndeOdmJwbwwvoxe2245VKxPIbbYFLpXOrTFw=;
	b=f90bRRy94WysqIuayhH84THPDBWsqOOxICX2yomJ+HXx0yFWPLtuKKI5+73Uh+OOyw0TIb
	JzD4ifODg/GIoiW+sy3uZbXJCsocu8KrRB8ep5PUBLOhmvRu54vq/0FaZlCU7Fbv10VnYe
	abPeWDTTig7SDDqnwapKymKhU3C1xns=
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
	Sean Anderson <sean.anderson@linux.dev>,
	Heng Qi <hengqi@linux.alibaba.com>
Subject: [PATCH net-next v4 6/6] net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM
Date: Thu, 16 Jan 2025 18:29:54 -0500
Message-Id: <20250116232954.2696930-7-sean.anderson@linux.dev>
In-Reply-To: <20250116232954.2696930-1-sean.anderson@linux.dev>
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_153017_769452_304DE2CA 
X-CRM114-Status: GOOD (  34.12  )
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

The default RX IRQ coalescing settings of one IRQ per packet can represent
a significant CPU load. However, increasing the coalescing unilaterally
can result in undesirable latency under low load. Adaptive IRQ
coalescing with DIM offers a way to adjust the coalescing settings based
on load.

This device only supports "CQE" mode [1], where each packet resets the
timer. Therefore, an interrupt is fired either when we receive
coalesce_count_rx packets or when the interface is idle for
coalesce_usec_rx. With this in mind, consider the following scenarios:

Link saturated
    Here we want to set coalesce_count_rx to a large value, in order to
    coalesce more packets and reduce CPU load. coalesce_usec_rx should
    be set to at least the time for one packet. Otherwise the link will
    be "idle" and we will get an interrupt for each packet anyway.

Bursts of packets
    Each burst should be coalesced into a single interrupt, although it
    may be prudent to reduce coalesce_count_rx for better latency.
    coalesce_usec_rx should be set to at least the time for one packet
    so bursts are coalesced. However, additional time beyond the packet
    time will just increase latency at the end of a burst.

Sporadic packets
    Due to low load, we can set coalesce_count_rx to 1 in order to
    reduce latency to the minimum. coalesce_usec_rx does not matter in
    this case.

Based on this analysis, I expected the CQE profiles to look something
like

	usec =  0, pkts = 1   // Low load
	usec = 16, pkts = 4
	usec = 16, pkts = 16
	usec = 16, pkts = 64
	usec = 16, pkts = 256 // High load

Where usec is set to 16 to be a few us greater than the 12.3 us packet
time of a 1500 MTU packet at 1 GBit/s. However, the CQE profile is
instead

	usec =  2, pkts = 256 // Low load
	usec =  8, pkts = 128
	usec = 16, pkts =  64
	usec = 32, pkts =  64
	usec = 64, pkts =  64 // High load

I found this very surprising. The number of coalesced packets
*decreases* as load increases. But as load increases we have more
opportunities to coalesce packets without affecting latency as much.
Additionally, the profile *increases* the usec as the load increases.
But as load increases, the gaps between packets will tend to become
smaller, making it possible to *decrease* usec for better latency at the
end of a "burst".

I consider the default CQE profile unsuitable for this NIC. Therefore,
we use the first profile outlined in this commit instead.
coalesce_usec_rx is set to 16 by default, but the user can customize it.
This may be necessary if they are using jumbo frames. I think adjusting
the profile times based on the link speed/mtu would be good improvement
for generic DIM.

In addition to the above profile problems, I noticed the following
additional issues with DIM while testing:

- DIM tends to "wander" when at low load, since the performance gradient
  is pretty flat. If you only have 10p/ms anyway then adjusting the
  coalescing settings will not affect throughput very much.
- DIM takes a long time to adjust back to low indices when load is
  decreased following a period of high load. This is because it only
  re-evaluates its settings once every 64 interrupts. However, at low
  load 64 interrupts can be several seconds.

Finally: performance. This patch increases receive throughput with
iperf3 from 840 Mbits/sec to 938 Mbits/sec, decreases interrupts from
69920/sec to 316/sec, and decreases CPU utilization (4x Cortex-A53) from
43% to 9%.

[1] Who names this stuff?

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
---
Heng, maybe you have some comments on DIM regarding the above?

Changes in v4:
- Fix incorrect function name in doc comment for axienet_coalesce_params

Changes in v3:
- Adjust axienet_local doc comment order to match the members

Changes in v2:
- Don't take the RTNL in axienet_rx_dim_work to avoid deadlock. Instead,
  calculate a partial cr update that axienet_update_coalesce_rx can
  perform under a spin lock.
- Use READ/WRITE_ONCE when accessing/modifying rx_irqs

 drivers/net/ethernet/xilinx/Kconfig           |  1 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  | 10 ++-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 82 +++++++++++++++++--
 3 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/Kconfig b/drivers/net/ethernet/xilinx/Kconfig
index 35d96c633a33..7502214cc7d5 100644
--- a/drivers/net/ethernet/xilinx/Kconfig
+++ b/drivers/net/ethernet/xilinx/Kconfig
@@ -28,6 +28,7 @@ config XILINX_AXI_EMAC
 	depends on HAS_IOMEM
 	depends on XILINX_DMA
 	select PHYLINK
+	select DIMLIB
 	help
 	  This driver supports the 10/100/1000 Ethernet from Xilinx for the
 	  AXI bus interface used in Xilinx Virtex FPGAs and Soc's.
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 45d8d80dbb1a..5ff742103beb 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -9,6 +9,7 @@
 #ifndef XILINX_AXIENET_H
 #define XILINX_AXIENET_H
 
+#include <linux/dim.h>
 #include <linux/netdevice.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
@@ -123,8 +124,7 @@
 /* Default TX/RX Threshold and delay timer values for SGDMA mode */
 #define XAXIDMA_DFT_TX_THRESHOLD	24
 #define XAXIDMA_DFT_TX_USEC		50
-#define XAXIDMA_DFT_RX_THRESHOLD	1
-#define XAXIDMA_DFT_RX_USEC		50
+#define XAXIDMA_DFT_RX_USEC		16
 
 #define XAXIDMA_BD_CTRL_TXSOF_MASK	0x08000000 /* First tx packet */
 #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
@@ -484,6 +484,9 @@ struct skbuf_dma_descriptor {
  * @regs:	Base address for the axienet_local device address space
  * @dma_regs:	Base address for the axidma device address space
  * @napi_rx:	NAPI RX control structure
+ * @rx_dim:     DIM state for the receive queue
+ * @rx_dim_enabled: Whether DIM is enabled or not
+ * @rx_irqs:    Number of interrupts
  * @rx_cr_lock: Lock protecting @rx_dma_cr, its register, and @rx_dma_started
  * @rx_dma_cr:  Nominal content of RX DMA control register
  * @rx_dma_started: Set when RX DMA is started
@@ -566,6 +569,9 @@ struct axienet_local {
 	void __iomem *dma_regs;
 
 	struct napi_struct napi_rx;
+	struct dim rx_dim;
+	bool rx_dim_enabled;
+	u16 rx_irqs;
 	spinlock_t rx_cr_lock;
 	u32 rx_dma_cr;
 	bool rx_dma_started;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 81224b672eb0..0673b2694e4c 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -265,7 +265,7 @@ static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
 }
 
 /**
- * axienet_cr_params() - Extract coalesce parameters from the CR
+ * axienet_coalesce_params() - Extract coalesce parameters from the CR
  * @lp: Device private data
  * @cr: The control register to parse
  * @count: Number of packets before an interrupt
@@ -1283,6 +1283,18 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
 		axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, tail_p);
 
 	if (packets < budget && napi_complete_done(napi, packets)) {
+		if (READ_ONCE(lp->rx_dim_enabled)) {
+			struct dim_sample sample = {
+				.time = ktime_get(),
+				/* Safe because we are the only writer */
+				.pkt_ctr = u64_stats_read(&lp->rx_packets),
+				.byte_ctr = u64_stats_read(&lp->rx_bytes),
+				.event_ctr = READ_ONCE(lp->rx_irqs),
+			};
+
+			net_dim(&lp->rx_dim, &sample);
+		}
+
 		/* Re-enable RX completion interrupts. This should
 		 * cause an immediate interrupt if any RX packets are
 		 * already pending.
@@ -1375,6 +1387,7 @@ static irqreturn_t axienet_rx_irq(int irq, void *_ndev)
 		/* Disable further RX completion interrupts and schedule
 		 * NAPI receive.
 		 */
+		WRITE_ONCE(lp->rx_irqs, READ_ONCE(lp->rx_irqs) + 1);
 		if (napi_schedule_prep(&lp->napi_rx)) {
 			u32 cr;
 
@@ -1676,6 +1689,7 @@ static int axienet_open(struct net_device *ndev)
 	if (lp->eth_irq > 0)
 		free_irq(lp->eth_irq, ndev);
 err_phy:
+	cancel_work_sync(&lp->rx_dim.work);
 	cancel_delayed_work_sync(&lp->stats_work);
 	phylink_stop(lp->phylink);
 	phylink_disconnect_phy(lp->phylink);
@@ -1705,6 +1719,7 @@ static int axienet_stop(struct net_device *ndev)
 		napi_disable(&lp->napi_rx);
 	}
 
+	cancel_work_sync(&lp->rx_dim.work);
 	cancel_delayed_work_sync(&lp->stats_work);
 
 	phylink_stop(lp->phylink);
@@ -2077,6 +2092,31 @@ static void axienet_update_coalesce_rx(struct axienet_local *lp, u32 cr,
 	spin_unlock_irq(&lp->rx_cr_lock);
 }
 
+/**
+ * axienet_dim_coalesce_count_rx() - RX coalesce count for DIM
+ * @lp: Device private data
+ */
+static u32 axienet_dim_coalesce_count_rx(struct axienet_local *lp)
+{
+	return min(1 << (lp->rx_dim.profile_ix << 1), 255);
+}
+
+/**
+ * axienet_rx_dim_work() - Adjust RX DIM settings
+ * @work: The work struct
+ */
+static void axienet_rx_dim_work(struct work_struct *work)
+{
+	struct axienet_local *lp =
+		container_of(work, struct axienet_local, rx_dim.work);
+	u32 cr = axienet_calc_cr(lp, axienet_dim_coalesce_count_rx(lp), 0);
+	u32 mask = XAXIDMA_COALESCE_MASK | XAXIDMA_IRQ_IOC_MASK |
+		   XAXIDMA_IRQ_ERROR_MASK;
+
+	axienet_update_coalesce_rx(lp, cr, mask);
+	lp->rx_dim.state = DIM_START_MEASURE;
+}
+
 /**
  * axienet_update_coalesce_tx() - Set TX CR
  * @lp: Device private data
@@ -2127,6 +2167,8 @@ axienet_ethtools_get_coalesce(struct net_device *ndev,
 	struct axienet_local *lp = netdev_priv(ndev);
 	u32 cr;
 
+	ecoalesce->use_adaptive_rx_coalesce = lp->rx_dim_enabled;
+
 	spin_lock_irq(&lp->rx_cr_lock);
 	cr = lp->rx_dma_cr;
 	spin_unlock_irq(&lp->rx_cr_lock);
@@ -2163,7 +2205,9 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 			      struct netlink_ext_ack *extack)
 {
 	struct axienet_local *lp = netdev_priv(ndev);
-	u32 cr;
+	bool new_dim = ecoalesce->use_adaptive_rx_coalesce;
+	bool old_dim = lp->rx_dim_enabled;
+	u32 cr, mask = ~XAXIDMA_CR_RUNSTOP_MASK;
 
 	if (ecoalesce->rx_max_coalesced_frames > 255 ||
 	    ecoalesce->tx_max_coalesced_frames > 255) {
@@ -2177,7 +2221,7 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 		return -EINVAL;
 	}
 
-	if ((ecoalesce->rx_max_coalesced_frames > 1 &&
+	if (((ecoalesce->rx_max_coalesced_frames > 1 || new_dim) &&
 	     !ecoalesce->rx_coalesce_usecs) ||
 	    (ecoalesce->tx_max_coalesced_frames > 1 &&
 	     !ecoalesce->tx_coalesce_usecs)) {
@@ -2186,9 +2230,27 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 		return -EINVAL;
 	}
 
-	cr = axienet_calc_cr(lp, ecoalesce->rx_max_coalesced_frames,
-			     ecoalesce->rx_coalesce_usecs);
-	axienet_update_coalesce_rx(lp, cr, ~XAXIDMA_CR_RUNSTOP_MASK);
+	if (new_dim && !old_dim) {
+		cr = axienet_calc_cr(lp, axienet_dim_coalesce_count_rx(lp),
+				     ecoalesce->rx_coalesce_usecs);
+	} else if (!new_dim) {
+		if (old_dim) {
+			WRITE_ONCE(lp->rx_dim_enabled, false);
+			napi_synchronize(&lp->napi_rx);
+			flush_work(&lp->rx_dim.work);
+		}
+
+		cr = axienet_calc_cr(lp, ecoalesce->rx_max_coalesced_frames,
+				     ecoalesce->rx_coalesce_usecs);
+	} else {
+		/* Dummy value for count just to calculate timer */
+		cr = axienet_calc_cr(lp, 2, ecoalesce->rx_coalesce_usecs);
+		mask = XAXIDMA_DELAY_MASK | XAXIDMA_IRQ_DELAY_MASK;
+	}
+
+	axienet_update_coalesce_rx(lp, cr, mask);
+	if (new_dim && !old_dim)
+		WRITE_ONCE(lp->rx_dim_enabled, true);
 
 	cr = axienet_calc_cr(lp, ecoalesce->tx_max_coalesced_frames,
 			     ecoalesce->tx_coalesce_usecs);
@@ -2430,7 +2492,8 @@ axienet_ethtool_get_rmon_stats(struct net_device *dev,
 
 static const struct ethtool_ops axienet_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_MAX_FRAMES |
-				     ETHTOOL_COALESCE_USECS,
+				     ETHTOOL_COALESCE_USECS |
+				     ETHTOOL_COALESCE_USE_ADAPTIVE_RX,
 	.get_drvinfo    = axienet_ethtools_get_drvinfo,
 	.get_regs_len   = axienet_ethtools_get_regs_len,
 	.get_regs       = axienet_ethtools_get_regs,
@@ -2974,7 +3037,10 @@ static int axienet_probe(struct platform_device *pdev)
 
 	spin_lock_init(&lp->rx_cr_lock);
 	spin_lock_init(&lp->tx_cr_lock);
-	lp->rx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_RX_THRESHOLD,
+	INIT_WORK(&lp->rx_dim.work, axienet_rx_dim_work);
+	lp->rx_dim_enabled = true;
+	lp->rx_dim.profile_ix = 1;
+	lp->rx_dma_cr = axienet_calc_cr(lp, axienet_dim_coalesce_count_rx(lp),
 					XAXIDMA_DFT_RX_USEC);
 	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
 					XAXIDMA_DFT_TX_USEC);
-- 
2.35.1.1320.gc452695387.dirty


