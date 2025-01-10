Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6620FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ateup/EpmtYL1wb6zywcHPq8m/pLH9ESWMDb+5wN2Q=; b=PqXWL/WKaLXAyI4jlFCCNH9QE1
	vjKf9WsPfKmmeDBV22ivNd9zjRSIa3CoS1tkVbKhlb3G/m8sBTpIru/8Ecnaj10gLERp8pIB5jVLe
	V56qycOCYeXfNsckU3GFaEfWNoBZr3mkIgnla0eCD5lyhMDEnpMz3QyXMzGtBfGoY+aTxHu0sbZh7
	ky3/BOUym062828l+iC11FLKHk3crTmRlbjr5Mpa8R+Bamj2wYhhBZLJA6bDLhRn2RwwvjUTWrkae
	XuD5HZK6ZwlxN84cx0TyOJ4B5X7nkgqW2Bqzyu76uf06gNOuG4dYehxXphiYHTCMa/gCMouKWHpsU
	gNJHdjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKlU-0000000GmGi-3Pe2;
	Fri, 10 Jan 2025 19:33:52 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKeQ-0000000Gkux-2z0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:26:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736537193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ateup/EpmtYL1wb6zywcHPq8m/pLH9ESWMDb+5wN2Q=;
	b=eS/wZ2BdXIzFER/rNUESvXpXzFFpBP/H7RKiUMdpBi31mdM5XDpW4UvrKQG0pubJtR5+Z+
	DnXJY5tvFA4JdMCjM5pQTmoBeXgAkqRJ34K7LAE6EthnsZu386uVGXrWUypObPYXZ70wrp
	Camz1IJ5fJnCwUQCOJM+zXQYfXKNR3Y=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v3 5/6] net: xilinx: axienet: Get coalesce parameters from driver state
Date: Fri, 10 Jan 2025 14:26:15 -0500
Message-Id: <20250110192616.2075055-6-sean.anderson@linux.dev>
In-Reply-To: <20250110192616.2075055-1-sean.anderson@linux.dev>
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112634_895546_2B4271DF 
X-CRM114-Status: GOOD (  15.99  )
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

The cr variables now contain the same values as the control registers
themselves. Extract/calculate the values from the variables instead of
saving the user-specified values. This allows us to remove some
bookeeping, and also lets the user know what the actual coalesce
settings are.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
---

(no changes since v2)

Changes in v2:
- New

 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  8 ---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 70 +++++++++++++------
 2 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 6b8e550c2155..45d8d80dbb1a 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -533,10 +533,6 @@ struct skbuf_dma_descriptor {
  *		  supported, the maximum frame size would be 9k. Else it is
  *		  1522 bytes (assuming support for basic VLAN)
  * @rxmem:	Stores rx memory size for jumbo frame handling.
- * @coalesce_count_rx:	Store the irq coalesce on RX side.
- * @coalesce_usec_rx:	IRQ coalesce delay for RX
- * @coalesce_count_tx:	Store the irq coalesce on TX side.
- * @coalesce_usec_tx:	IRQ coalesce delay for TX
  * @use_dmaengine: flag to check dmaengine framework usage.
  * @tx_chan:	TX DMA channel.
  * @rx_chan:	RX DMA channel.
@@ -615,10 +611,6 @@ struct axienet_local {
 	u32 max_frm_size;
 	u32 rxmem;
 
-	u32 coalesce_count_rx;
-	u32 coalesce_usec_rx;
-	u32 coalesce_count_tx;
-	u32 coalesce_usec_tx;
 	u8  use_dmaengine;
 	struct dma_chan *tx_chan;
 	struct dma_chan *rx_chan;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index e00759012894..8ba42cebffb4 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -223,6 +223,13 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 			  lp->rx_bd_p);
 }
 
+static u64 axienet_dma_rate(struct axienet_local *lp)
+{
+	if (lp->axi_clk)
+		return clk_get_rate(lp->axi_clk);
+	return 125000000; /* arbitrary guess if no clock rate set */
+}
+
 /**
  * axienet_calc_cr() - Calculate control register value
  * @lp: Device private data
@@ -242,12 +249,9 @@ static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
 	 * the first packet. Otherwise leave at 0 to disable delay interrupt.
 	 */
 	if (count > 1) {
-		u64 clk_rate = 125000000; /* arbitrary guess if no clock rate set */
+		u64 clk_rate = axienet_dma_rate(lp);
 		u32 timer;
 
-		if (lp->axi_clk)
-			clk_rate = clk_get_rate(lp->axi_clk);
-
 		/* 1 Timeout Interval = 125 * (clock period of SG clock) */
 		timer = DIV64_U64_ROUND_CLOSEST((u64)usec * clk_rate,
 						XAXIDMA_DELAY_SCALE);
@@ -260,6 +264,23 @@ static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
 	return cr;
 }
 
+/**
+ * axienet_cr_params() - Extract coalesce parameters from the CR
+ * @lp: Device private data
+ * @cr: The control register to parse
+ * @count: Number of packets before an interrupt
+ * @usec: Idle time (in usec) before an interrupt
+ */
+static void axienet_coalesce_params(struct axienet_local *lp, u32 cr,
+				    u32 *count, u32 *usec)
+{
+	u64 clk_rate = axienet_dma_rate(lp);
+	u64 timer = FIELD_GET(XAXIDMA_DELAY_MASK, cr);
+
+	*count = FIELD_GET(XAXIDMA_COALESCE_MASK, cr);
+	*usec = DIV64_U64_ROUND_CLOSEST(timer * XAXIDMA_DELAY_SCALE, clk_rate);
+}
+
 /**
  * axienet_dma_start - Set up DMA registers and start DMA operation
  * @lp:		Pointer to the axienet_local structure
@@ -2104,11 +2125,21 @@ axienet_ethtools_get_coalesce(struct net_device *ndev,
 			      struct netlink_ext_ack *extack)
 {
 	struct axienet_local *lp = netdev_priv(ndev);
+	u32 cr;
 
-	ecoalesce->rx_max_coalesced_frames = lp->coalesce_count_rx;
-	ecoalesce->rx_coalesce_usecs = lp->coalesce_usec_rx;
-	ecoalesce->tx_max_coalesced_frames = lp->coalesce_count_tx;
-	ecoalesce->tx_coalesce_usecs = lp->coalesce_usec_tx;
+	spin_lock_irq(&lp->rx_cr_lock);
+	cr = lp->rx_dma_cr;
+	spin_unlock_irq(&lp->rx_cr_lock);
+	axienet_coalesce_params(lp, cr,
+				&ecoalesce->rx_max_coalesced_frames,
+				&ecoalesce->rx_coalesce_usecs);
+
+	spin_lock_irq(&lp->tx_cr_lock);
+	cr = lp->tx_dma_cr;
+	spin_unlock_irq(&lp->tx_cr_lock);
+	axienet_coalesce_params(lp, cr,
+				&ecoalesce->tx_max_coalesced_frames,
+				&ecoalesce->tx_coalesce_usecs);
 	return 0;
 }
 
@@ -2155,15 +2186,12 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 		return -EINVAL;
 	}
 
-	lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
-	lp->coalesce_usec_rx = ecoalesce->rx_coalesce_usecs;
-	lp->coalesce_count_tx = ecoalesce->tx_max_coalesced_frames;
-	lp->coalesce_usec_tx = ecoalesce->tx_coalesce_usecs;
-
-	cr = axienet_calc_cr(lp, lp->coalesce_count_rx, lp->coalesce_usec_rx);
+	cr = axienet_calc_cr(lp, ecoalesce->rx_max_coalesced_frames,
+			     ecoalesce->rx_coalesce_usecs);
 	axienet_update_coalesce_rx(lp, cr, ~XAXIDMA_CR_RUNSTOP_MASK);
 
-	cr = axienet_calc_cr(lp, lp->coalesce_count_tx, lp->coalesce_usec_tx);
+	cr = axienet_calc_cr(lp, ecoalesce->tx_max_coalesced_frames,
+			     ecoalesce->tx_coalesce_usecs);
 	axienet_update_coalesce_tx(lp, cr, ~XAXIDMA_CR_RUNSTOP_MASK);
 	return 0;
 }
@@ -2945,14 +2973,10 @@ static int axienet_probe(struct platform_device *pdev)
 
 	spin_lock_init(&lp->rx_cr_lock);
 	spin_lock_init(&lp->tx_cr_lock);
-	lp->coalesce_count_rx = XAXIDMA_DFT_RX_THRESHOLD;
-	lp->coalesce_count_tx = XAXIDMA_DFT_TX_THRESHOLD;
-	lp->coalesce_usec_rx = XAXIDMA_DFT_RX_USEC;
-	lp->coalesce_usec_tx = XAXIDMA_DFT_TX_USEC;
-	lp->rx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_rx,
-					lp->coalesce_usec_rx);
-	lp->tx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_tx,
-					lp->coalesce_usec_tx);
+	lp->rx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_RX_THRESHOLD,
+					XAXIDMA_DFT_RX_USEC);
+	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
+					XAXIDMA_DFT_TX_USEC);
 
 	ret = axienet_mdio_setup(lp);
 	if (ret)
-- 
2.35.1.1320.gc452695387.dirty


