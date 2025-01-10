Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nqsS23S1ZE0Yrqz90EkFP93PqM6ow0hWqaRecNgzN4=; b=aTYCgIHN/zvarC3OPvjnVF7pdG
	0aOWzC81fVmU3zpmPk4iJX9nMm8uLPu3Fd+gj1fraoJgl8iSBCyf7RpyrOMbuoTc0wWF7bpHuxh0h
	d9JxvLhjBd6SSLZpLFlPbVdkyZKb68f3/Q+2IDeLVGL2HTiM2ww+NKnDIDvSnzTQENv/iPclsENwM
	f02map/khqynEzyAQH0JjWUNlujdwZBQUONTGdVG/q1uFspAYCWGOUp30FIVDmloJr1V8oYf6CDr0
	HBKWzJuArm4aFvlWntZrwQViTiS+50Gj6eQrvPsDx/3tpo1/eBdy5khdDJgiQxgJv5c9pFQAkmw8f
	V2wbITzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKj7-0000000Glyu-27Me;
	Fri, 10 Jan 2025 19:31:25 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKeM-0000000GktN-0g4o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:26:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736537188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nqsS23S1ZE0Yrqz90EkFP93PqM6ow0hWqaRecNgzN4=;
	b=sPw32/XYCfMKj/SYyx5OeEDbOlgKK5Hx8KA7z39V8JkJyDPHGC3pBvYFo+Ae5XulrGX2vZ
	U/O1AeP81htMjH723qY3BO8pJX/jtXxm2uA0maEqife7FK61eOqJS9FnWsB0vROmXMLvEd
	mr4mPqaWYkrnsqtG9qJ0qCI6UmB7iVw=
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
Subject: [PATCH net-next v3 3/6] net: xilinx: axienet: Combine CR calculation
Date: Fri, 10 Jan 2025 14:26:13 -0500
Message-Id: <20250110192616.2075055-4-sean.anderson@linux.dev>
In-Reply-To: <20250110192616.2075055-1-sean.anderson@linux.dev>
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112630_611952_2C300D60 
X-CRM114-Status: GOOD (  14.79  )
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

Combine the common parts of the CR calculations for better code reuse.
While we're at it, simplify the code a bit.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v3:
- Fix mismatched parameter name documentation for axienet_calc_cr
- Integrate some cleanups originally included in
  https://lore.kernel.org/netdev/20240909230908.1319982-1-sean.anderson@linux.dev/

Changes in v2:
- Split off from runtime coalesce modification support

 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  3 -
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 64 ++++++++++---------
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index a3f4f3e42587..8fd3b45ef6aa 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -112,9 +112,6 @@
 #define XAXIDMA_DELAY_MASK		0xFF000000 /* Delay timeout counter */
 #define XAXIDMA_COALESCE_MASK		0x00FF0000 /* Coalesce counter */
 
-#define XAXIDMA_DELAY_SHIFT		24
-#define XAXIDMA_COALESCE_SHIFT		16
-
 #define XAXIDMA_IRQ_IOC_MASK		0x00001000 /* Completion intr */
 #define XAXIDMA_IRQ_DELAY_MASK		0x00002000 /* Delay interrupt */
 #define XAXIDMA_IRQ_ERROR_MASK		0x00004000 /* Error interrupt */
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index ccc4a1620015..961c9c9e5e18 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -224,22 +224,40 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 }
 
 /**
- * axienet_usec_to_timer - Calculate IRQ delay timer value
- * @lp:		Pointer to the axienet_local structure
- * @coalesce_usec: Microseconds to convert into timer value
+ * axienet_calc_cr() - Calculate control register value
+ * @lp: Device private data
+ * @count: Number of completions before an interrupt
+ * @usec: Microseconds after the last completion before an interrupt
+ *
+ * Calculate a control register value based on the coalescing settings. The
+ * run/stop bit is not set.
  */
-static u32 axienet_usec_to_timer(struct axienet_local *lp, u32 coalesce_usec)
+static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
 {
-	u32 result;
-	u64 clk_rate = 125000000; /* arbitrary guess if no clock rate set */
+	u32 cr;
 
-	if (lp->axi_clk)
-		clk_rate = clk_get_rate(lp->axi_clk);
+	cr = FIELD_PREP(XAXIDMA_COALESCE_MASK, count) | XAXIDMA_IRQ_IOC_MASK |
+	     XAXIDMA_IRQ_ERROR_MASK;
+	/* Only set interrupt delay timer if not generating an interrupt on
+	 * the first packet. Otherwise leave at 0 to disable delay interrupt.
+	 */
+	if (count > 1) {
+		u64 clk_rate = 125000000; /* arbitrary guess if no clock rate set */
+		u32 timer;
 
-	/* 1 Timeout Interval = 125 * (clock period of SG clock) */
-	result = DIV64_U64_ROUND_CLOSEST((u64)coalesce_usec * clk_rate,
-					 XAXIDMA_DELAY_SCALE);
-	return min(result, FIELD_MAX(XAXIDMA_DELAY_MASK));
+		if (lp->axi_clk)
+			clk_rate = clk_get_rate(lp->axi_clk);
+
+		/* 1 Timeout Interval = 125 * (clock period of SG clock) */
+		timer = DIV64_U64_ROUND_CLOSEST((u64)usec * clk_rate,
+						XAXIDMA_DELAY_SCALE);
+
+		timer = min(timer, FIELD_MAX(XAXIDMA_DELAY_MASK));
+		cr |= FIELD_PREP(XAXIDMA_DELAY_MASK, timer) |
+		      XAXIDMA_IRQ_DELAY_MASK;
+	}
+
+	return cr;
 }
 
 /**
@@ -249,27 +267,13 @@ static u32 axienet_usec_to_timer(struct axienet_local *lp, u32 coalesce_usec)
 static void axienet_dma_start(struct axienet_local *lp)
 {
 	/* Start updating the Rx channel control register */
-	lp->rx_dma_cr = (lp->coalesce_count_rx << XAXIDMA_COALESCE_SHIFT) |
-			XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_ERROR_MASK;
-	/* Only set interrupt delay timer if not generating an interrupt on
-	 * the first RX packet. Otherwise leave at 0 to disable delay interrupt.
-	 */
-	if (lp->coalesce_count_rx > 1)
-		lp->rx_dma_cr |= (axienet_usec_to_timer(lp, lp->coalesce_usec_rx)
-					<< XAXIDMA_DELAY_SHIFT) |
-				 XAXIDMA_IRQ_DELAY_MASK;
+	lp->rx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_rx,
+					lp->coalesce_usec_rx);
 	axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);
 
 	/* Start updating the Tx channel control register */
-	lp->tx_dma_cr = (lp->coalesce_count_tx << XAXIDMA_COALESCE_SHIFT) |
-			XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_ERROR_MASK;
-	/* Only set interrupt delay timer if not generating an interrupt on
-	 * the first TX packet. Otherwise leave at 0 to disable delay interrupt.
-	 */
-	if (lp->coalesce_count_tx > 1)
-		lp->tx_dma_cr |= (axienet_usec_to_timer(lp, lp->coalesce_usec_tx)
-					<< XAXIDMA_DELAY_SHIFT) |
-				 XAXIDMA_IRQ_DELAY_MASK;
+	lp->tx_dma_cr = axienet_calc_cr(lp, lp->coalesce_count_tx,
+					lp->coalesce_usec_tx);
 	axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
 
 	/* Populate the tail pointer and bring the Rx Axi DMA engine out of
-- 
2.35.1.1320.gc452695387.dirty


