Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DCC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK3jDNN57cOcYB2qd2k1oPSR5oRC9dvZDkaFcSv62Xg=; b=rtDEjW9QoLyLPWzfsaCVKqArj1
	enDG6EbuYI+BMXvHSdSjS+Zz02HrZry9CfFCeOsFz2L9/u3qxHu8wuyYKCpnjMIkTmJgxWWcrI4Ta
	xyhPxpH8tkYzFYgaVSNoyWtUu8Ed92U8YQAaHvJyy9r06Zma1R6DxOOXtuqsfZ2CSbSxvGeyBqPnd
	tRBxHukzsaX/Ko9nU6tNB/138+Gx54H0qLo/QGGpkjhm9Ux2HleN0RPl7iCQFXRHiyj+Ot0kWSRs7
	g84CoPAwd++sRx77997MOujPqJmA5tQxzpYM4LlQpR0e8y5LeqIwNcGwOwFvJHSM1BaO5BE/NaCqY
	QDxZE5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQc-00000007YyL-1Bry;
	Sun, 30 Aug 2026 07:58:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQZ-00000007YwK-3QGw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:58:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso25144605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076686; x=1788681486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lK3jDNN57cOcYB2qd2k1oPSR5oRC9dvZDkaFcSv62Xg=;
        b=Gb95niBUsj42idsdrrqcx/C5uxJMBht3LyVb/zbLAyKKJQAQ5rr+lGNZozJU/PDuDh
         48zfDXSYkPDW3gCSWewSw1SeMGAbucCPlXGM5dTaKxcyMLd/GukflEpP8gh3Ixox/O5M
         OB39TdtHZXUt4iQPEC7yRRM4eKpv6/4InrM3ANtt1CsiQseZm67GOzWvBg+qK4uQ5hve
         VJ0ryyHzpdAcikQ9nYfuxCdA2zHy608n6XXf6fYF8sd2iy1hiliIWpzTE+D7CqEB6cRV
         EPGRNVpMoFZHeJN6EMZutblxeEwfUGnsBhE/CCdTfF72kX6Q7DK6AYESyh6xs3tgukjp
         d0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076686; x=1788681486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lK3jDNN57cOcYB2qd2k1oPSR5oRC9dvZDkaFcSv62Xg=;
        b=lh+fPc95TPIbMUaSLVFD5q6oBVR1DlxIbUMhKlkZ5I/UwPiO9IoBGSI71sicZDUMhd
         zW7HS5h9cw5amuBE8qD2lTqSlUMJsqFkiVcUPr7i5nCCf8BDudaBvjTPsvj9+9P5Hzy3
         hBCUvDaUdiu/CyDXMC9fZYfVWeNLyt9jaMf1/eZv4vSrwZOwshLXYDLqnDjlmanNtEBy
         lEIsL2w68NArm8VvnFm3iJwubyM2RtmcapfqawiMTQ+dlsjWgaphINw76lhqsF/BL5wC
         eOW4LDWXJxSvNF5j0kjAMPxYOVbcwAJp6g013AfERoSwK4Sp2PYgbtlfRb7VLloUnPfE
         6f4w==
X-Forwarded-Encrypted: i=1; AHgh+RrbU/x+hqHxJf4/ibGnZC4H32GQTCV3BH9U/2JAneqiUMENhXPHenBdHCUj6h0sIni/g6WoRBld06FJ+ksu1uJR@lists.infradead.org
X-Gm-Message-State: AFuF++m2dgJi2VL8yAqnT62Jiy2ZS3cc6gaIRYmLHiCwM/EgHhdHpTun
	vx/Uoa/SFsxxabA2uN+shwGCG5MiZB8SqRgydprekbDh8YlZ8hzMv5w=
X-Gm-Gg: AR+sD10DhyhMn0YqEu+U2u5Hn/ShJtBDpPhhEymdbwIRxZxgaXg3S/FeYm0tTFM63Wo
	xUBwCQEoRnymPf9sjjX2DifnhrDoliLIfhZLTOs+uIcyS4e1DzxbmOQUGu+2iJKIQSxzevx9emJ
	oU5TXBi84gU91F/ustL5fv29BC3dpzJ6ToItz3vlFFwWifjDx9AbSCkYlGIJG9QuCXDBET14pcQ
	lKOaiutdK3bJEpC4uCiv5haWL5Wj9m/2cGQON0GtvYqk7Rcmslx5T9xH/TaXfxLcQUKLinf+dFB
	lY5Wm+X4Fv4Ze1/4uNKV2RMtMXJmETwpGb7RjQV25O4OibISPrqMEaqOUsORCUsBJInhNcIOH50
	yqhIpjieBGzddwW3abyr1gzJxpc5u4MM64qcVMHO5bjvMtsqzoO5sWArgZtWS0n23A3k/uvn6XR
	1zSk422+FXKz59aC6O4q1g76Zb92ljf9TOpVGqBflw6OfrnuSgB2zs7TyaN8MOTw==
X-Received: by 2002:a05:600c:4f49:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49cd52b2c93mr18490055e9.0.1788076685856;
        Sun, 30 Aug 2026 00:58:05 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:58:05 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net-next 2/4] net: airoha: recover RX ring after hw completion race
Date: Sun, 30 Aug 2026 10:57:15 +0100
Message-ID: <20260830095717.37218-3-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_005807_920884_13334BD5 
X-CRM114-Status: GOOD (  34.54  )
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

On AN7583, hardware can write a completed RX descriptor past the
software-posted boundary (q->head) before airoha_qdma_fill_rx_queue()
has actually posted a fresh buffer there, as if hardware advances its
own completion pointer independently of software's posting
bookkeeping. Since airoha_qdma_rx_process() consumes the ring strictly
sequentially starting at q->tail, the consumer stalls forever waiting
on a descriptor that hardware never writes, even though real,
completed frames are sitting further along in the ring. In practice
this is reachable during PPPoE/DHCP negotiation bursts on the small
shared "force to CPU" ring, and the interface silently stops receiving
on it.

Detect this without inspecting ring/descriptor memory content at all:
REG_RX_DMA_IDX is hardware's own completion counter, independent of
what has or hasn't been posted. If it keeps advancing across polls
while the software consumer (tail) does not move, hardware is making
progress the consumer can never observe - the ring is stuck. Idle
rings, where hardware isn't advancing either, are correctly left
alone. An earlier version of this recovery instead scanned ahead in
the ring for a DONE descriptor and trusted its content; that caused a
real OOM panic once it wandered into genuinely uninitialized DMA
memory that coincidentally had the DONE bit set. Comparing a hardware
register cannot misfire that way.

Once a stall is confirmed, defer to a work item (register access here
can sleep) that disables RX DMA, waits for it to actually go idle,
resyncs the ring via the existing cleanup_rx_queue()/fill_rx_queue()
pair - which only ever touches the software-owned [tail, head) window
and rewrites both RX_CPU_IDX and RX_DMA_IDX from it - and re-enables
RX DMA. This deliberately drops whatever was in flight on the ring
rather than trying to identify and preserve the specific descriptor
hardware used; a prior attempt at the latter caused a page_pool
double-free when the assumptions about which page was safe to free
turned out not to hold in all cases.

GLOBAL_CFG_RX_DMA_EN_MASK in REG_QDMA_GLOBAL_CFG is per-QDMA-instance,
not per-ring, so recovering one ring briefly pauses RX DMA on every
ring behind that QDMA (bounded by the 50ms busy-wait below). No
per-ring equivalent exists in the register map; this is the same bit
airoha_qdma_start()/stop() already use for whole-device up/down. Log
the actual measured duration of that pause alongside the recovery
message, rather than just citing the 50ms read_poll_timeout() upper
bound: that's the real cost paid by every other ring on the same QDMA
instance each time recovery fires, and it's worth having the real
number instead of the theoretical ceiling.

One cost worth calling out explicitly: airoha_qdma_rx_check_stall()
adds an uncached MMIO read of RX_DMA_IDX on the RX path, once per
airoha_qdma_rx_process() call that ends via the non-DONE break - i.e.
essentially every poll, on every ring, even though the condition it
detects is rare and specific to one ring. Gating the read on whether
the *previous* poll for this ring also reaped zero descriptors would
keep it off rings that are actively receiving, and I traced that
through for correctness: once the race actually happens, q->tail
freezes permanently (consumption here is strictly sequential), so
`done` is 0 on every poll after that point, not just some - the gate
would only cost about one extra poll before AIROHA_RX_STALL_THRESHOLD
is reached, not a suppression or false-negative risk. I haven't
implemented that gating here for lack of profiling data justifying the
added per-queue state against the (also unmeasured) cost of the
current unconditional read; happy to add it if it turns out to matter
in practice.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 135 ++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h |  16 +++
 2 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index a3e5aaeb75b3..b53fe5b17653 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3,12 +3,14 @@
  * Copyright (c) 2024 AIROHA Inc
  * Author: Lorenzo Bianconi <lorenzo@kernel.org>
  */
+#include <linux/ktime.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
+#include <linux/workqueue.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
 #include <net/pkt_cls.h>
@@ -657,6 +659,47 @@ airoha_qdma_get_gdm_dev(struct airoha_eth *eth, struct airoha_qdma_desc *desc)
 	return port->devs[d] ? port->devs[d] : ERR_PTR(-ENODEV);
 }
 
+/* number of consecutive polls where hw completion (RX_DMA_IDX) advances
+ * while the sw consumer (tail) doesn't, before declaring the ring stuck
+ */
+#define AIROHA_RX_STALL_THRESHOLD	3
+
+/* Detect an RX ring where hw's own completion pointer (RX_DMA_IDX) keeps
+ * moving while the sw consumer (q->tail) doesn't - i.e. hw has written
+ * further descriptors somewhere in the ring, but the strictly sequential
+ * consumer can never reach them because the one at q->head, which it is
+ * waiting on, was never marked DONE. This happens when hw writes a
+ * completed descriptor past q->head before airoha_qdma_fill_rx_queue()
+ * has posted a fresh buffer there, decoupled from sw's own posting
+ * bookkeeping.
+ *
+ * Deliberately does not inspect ring/descriptor memory content to detect
+ * this: an earlier version scanned ahead for a DONE descriptor and trusted
+ * its content, which caused a real OOM panic after it wandered into
+ * genuinely uninitialized DMA memory that coincidentally had the DONE bit
+ * set. RX_DMA_IDX is a hw register with a well-defined value regardless of
+ * ring content, so this can't misfire on garbage memory, and idle rings
+ * (no hw progress either) are naturally left alone.
+ */
+static void airoha_qdma_rx_check_stall(struct airoha_queue *q)
+{
+	struct airoha_qdma *qdma = q->qdma;
+	int qid = q - &qdma->q_rx[0];
+	u32 dma_idx = airoha_qdma_get(qdma, REG_RX_DMA_IDX(qid),
+				      RX_RING_DMA_IDX_MASK);
+
+	if (q->stall_tail == q->tail && dma_idx != q->stall_dma_idx) {
+		if (++q->stall_count >= AIROHA_RX_STALL_THRESHOLD &&
+		    !test_and_set_bit(qid, qdma->rx_recover_mask))
+			schedule_work(&qdma->rx_recover_work);
+	} else {
+		q->stall_count = 0;
+	}
+
+	q->stall_tail = q->tail;
+	q->stall_dma_idx = dma_idx;
+}
+
 static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 {
 	enum dma_data_direction dir = page_pool_get_dma_dir(q->page_pool);
@@ -675,8 +718,10 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		struct page *page;
 
 		desc_ctrl = le32_to_cpu(READ_ONCE(desc->ctrl));
-		if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
+		if (!(desc_ctrl & QDMA_DESC_DONE_MASK)) {
+			airoha_qdma_rx_check_stall(q);
 			break;
+		}
 
 		dma_rmb();
 
@@ -894,6 +939,75 @@ static void airoha_qdma_cleanup_rx_queue(struct airoha_queue *q)
 			FIELD_PREP(RX_RING_DMA_IDX_MASK, q->tail));
 }
 
+static void airoha_qdma_rx_recover_work(struct work_struct *work)
+{
+	struct airoha_qdma *qdma = container_of(work, struct airoha_qdma,
+						 rx_recover_work);
+	int qid;
+
+	for_each_set_bit(qid, qdma->rx_recover_mask, AIROHA_NUM_RX_RING) {
+		struct airoha_queue *q = &qdma->q_rx[qid];
+		ktime_t rx_dma_off_ts;
+		s64 rx_dma_off_us;
+		u32 status;
+
+		if (!q->ndesc)
+			goto next;
+
+		napi_disable(&q->napi);
+
+		/* GLOBAL_CFG_RX_DMA_EN_MASK is per-QDMA, not per-ring, so
+		 * this pauses every RX ring on this QDMA instance, not just
+		 * the stalled one - track how long for, since that's the
+		 * real-world cost of recovery on unrelated rings.
+		 */
+		rx_dma_off_ts = ktime_get();
+
+		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
+				  GLOBAL_CFG_RX_DMA_EN_MASK);
+		if (read_poll_timeout(airoha_qdma_rr, status,
+				      !(status & GLOBAL_CFG_RX_DMA_BUSY_MASK),
+				      USEC_PER_MSEC, 50 * USEC_PER_MSEC, true,
+				      qdma, REG_QDMA_GLOBAL_CFG))
+			dev_warn(qdma->eth->dev,
+				 "qid=%d RX DMA busy timeout during recovery\n",
+				 qid);
+
+		/* Drop whatever is currently in flight on this ring and
+		 * re-arm it from a known-clean state. cleanup_rx_queue()
+		 * only ever touches the sw-owned [tail, head) window and
+		 * resyncs both RX_CPU_IDX and RX_DMA_IDX to it, which is
+		 * what un-wedges a ring where hw wrote past the sw head
+		 * without the consumer ever advancing - no need to figure
+		 * out which descriptor hw actually used.
+		 */
+		airoha_qdma_cleanup_rx_queue(q);
+		if (q->skb) {
+			/* discard whatever scatter-gather frame was
+			 * mid-assembly when the stall was hit, cleanup_rx_queue()
+			 * above only resyncs the ring, not this
+			 */
+			dev_kfree_skb(q->skb);
+			q->skb = NULL;
+		}
+		airoha_qdma_fill_rx_queue(q);
+
+		airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
+				GLOBAL_CFG_RX_DMA_EN_MASK);
+		rx_dma_off_us = ktime_us_delta(ktime_get(), rx_dma_off_ts);
+
+		q->stall_count = 0;
+		napi_enable(&q->napi);
+		napi_schedule(&q->napi);
+
+		dev_warn_ratelimited(qdma->eth->dev,
+				     "qid=%d RX ring recovered after hw stall (RX DMA paused for %lld us on this QDMA instance)\n",
+				     qid, rx_dma_off_us);
+next:
+		clear_bit(qid, qdma->rx_recover_mask);
+	}
+}
+
 static int airoha_qdma_init_rx(struct airoha_qdma *qdma)
 {
 	int i;
@@ -1594,6 +1708,8 @@ static void airoha_qdma_cleanup(struct airoha_eth *eth,
 {
 	int i;
 
+	cancel_work_sync(&qdma->rx_recover_work);
+
 	if (test_bit(DEV_STATE_INITIALIZED, &eth->state)) {
 		u32 status;
 
@@ -1651,6 +1767,15 @@ static int airoha_hw_init(struct platform_device *pdev,
 	if (err)
 		return err;
 
+	/* INIT_WORK() every instance up front, before any of them can fail
+	 * init and jump to the error path below, since that path tears down
+	 * every eth->qdma[] slot unconditionally, including ones this loop
+	 * never reached.
+	 */
+	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
+		INIT_WORK(&eth->qdma[i].rx_recover_work,
+			  airoha_qdma_rx_recover_work);
+
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++) {
 		err = airoha_qdma_init(pdev, eth, &eth->qdma[i]);
 		if (err)
@@ -1699,6 +1824,14 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
 {
 	int i;
 
+	/* Make sure rx_recover_work is neither running nor able to re-arm
+	 * before any napi_disable() below: it also calls napi_disable()/
+	 * napi_enable() on q_rx[].napi, and napi_disable() on an
+	 * already-disabled NAPI spins in napi_disable_locked() forever,
+	 * since only napi_enable() clears the state it waits on.
+	 */
+	disable_work_sync(&qdma->rx_recover_work);
+
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
 		napi_disable(&qdma->q_tx_irq[i].napi);
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fa9a8edce22f..483d6b59c351 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -207,6 +207,15 @@ struct airoha_queue {
 	bool txq_stopped;
 	bool flushing;
 
+	/* RX hw stall detection: last REG_RX_DMA_IDX/tail snapshot taken
+	 * whenever the head-of-line descriptor isn't DONE, and how many
+	 * consecutive times hw made progress (DMA_IDX moved) while the
+	 * consumer (tail) didn't. See airoha_qdma_rx_check_stall().
+	 */
+	u32 stall_dma_idx;
+	u16 stall_tail;
+	u8 stall_count;
+
 	struct napi_struct napi;
 	struct page_pool *page_pool;
 	struct sk_buff *skb;
@@ -567,6 +576,13 @@ struct airoha_qdma {
 	struct airoha_queue q_tx[AIROHA_NUM_TX_RING];
 	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
 
+	/* recovery for RX rings whose hw completion pointer (RX_DMA_IDX)
+	 * keeps moving while the sw consumer is stuck; see
+	 * airoha_qdma_rx_check_stall() and airoha_qdma_rx_recover_work().
+	 */
+	struct work_struct rx_recover_work;
+	DECLARE_BITMAP(rx_recover_mask, AIROHA_NUM_RX_RING);
+
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
-- 
2.55.0


