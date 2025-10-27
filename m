Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0206CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Cc:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3VJ7H3mv1YxTO1d2vcS2gaz+TdBB1m7YyBgtwfkcvA=; b=ajMRGKfq8+AA7crWE8z5LDu5Bp
	vIueIBQoXVtlmNSckr6gwMZEkrdxaF1zjpPWTuf8Y7a+2Hf+RkFf13RXAc+HlbvrBfSWiDSow7kXG
	l123Lh6CLPqqjpJwcu9GHcO1dx5hZhQaMahmi2/lHlkTMswnWHbuV/mtZFy2t4sjbT+ir5kHp5FbX
	Z3AcVhSXYtNUP12TbOKKqvbYDa+w8a/xfG7atZFsFj6RET60vQzvU2fI5XDZOu6N1aMM9Col4LS19
	eAapsz0S189QEA6Lt8srU3gw51VX0F2uywNgsf1ZBOoSO+MmrR1e/l+Gk/p+JZ6k8KPDFnaZD7fKQ
	5TSVOyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTTO-0000000Ehn7-3mqK;
	Mon, 27 Oct 2025 20:05:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTTN-0000000Ehmm-2Vi1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08A70611E1;
	Mon, 27 Oct 2025 20:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1EFC116B1;
	Mon, 27 Oct 2025 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761595544;
	bh=cNDDtH0hky+OllvZrPvk4rMF2qkS6qWh+tOSm96kfl8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M0cPGwKtUiiHM1cQ12FCFRnPV5QRohX5P4Cvv4u6b5PQWmkuFNY9eNlvSd5g3GX/j
	 cAHQMWexMV1aDYvC+LQ/BF2LghJuXUhCE2XKdkKkZswyF/SmhKOMZN1XDJhivbA7Ta
	 jM8u0ikgpR2bu16ket//ruPNPNQlRG4c9/Tuwp69WykprwISoonzbEhAysXKhaGgm+
	 L/tkXrmOxnM5O1SyBUL1ipKzhnxw7UYBTJVkWotmldh6Rw1qVUTsrEo1KEJi2qSUAs
	 QxonblxXEVM12B61nQ4INW+s3Le4OnyRswLDzWkJLhnpLItEp48pv8LzngP0lhhH0P
	 55PHen4erJnmA==
Subject: [PATCH net V2 2/2] veth: more robust handing of race to avoid txq
 getting stuck
From: Jesper Dangaard Brouer <hawk@kernel.org>
To: netdev@vger.kernel.org,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ihor.solodrai@linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>, makita.toshiaki@lab.ntt.co.jp,
 toshiaki.makita1@gmail.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-team@cloudflare.com
Date: Mon, 27 Oct 2025 21:05:39 +0100
Message-ID: <176159553930.5396.4492315010562655785.stgit@firesoul>
In-Reply-To: <176159549627.5396.15971398227283515867.stgit@firesoul>
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

Commit dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to
reduce TX drops") introduced a race condition that can lead to a permanently
stalled TXQ. This was observed in production on ARM64 systems (Ampere Altra
Max).

The race occurs in veth_xmit(). The producer observes a full ptr_ring and
stops the queue (netif_tx_stop_queue()). The subsequent conditional logic,
intended to re-wake the queue if the consumer had just emptied it (if
(__ptr_ring_empty(...)) netif_tx_wake_queue()), can fail. This leads to a
"lost wakeup" where the TXQ remains stopped (QUEUE_STATE_DRV_XOFF) and
traffic halts.

This failure is caused by an incorrect use of the __ptr_ring_empty() API
from the producer side. As noted in kernel comments, this check is not
guaranteed to be correct if a consumer is operating on another CPU. The
empty test is based on ptr_ring->consumer_head, making it reliable only for
the consumer. Using this check from the producer side is fundamentally racy.

This patch fixes the race by adopting the more robust logic from an earlier
version V4 of the patchset, which always flushed the peer:

(1) In veth_xmit(), the racy conditional wake-up logic and its memory barrier
are removed. Instead, after stopping the queue, we unconditionally call
__veth_xdp_flush(rq). This guarantees that the NAPI consumer is scheduled,
making it solely responsible for re-waking the TXQ.

(2) On the consumer side, the logic for waking the peer TXQ is moved out of
veth_xdp_rcv() and placed at the end of the veth_poll() function. This
placement is part of fixing the race, as the netif_tx_queue_stopped() check
must occur after rx_notify_masked is potentially set to false during NAPI
completion.
 This handles the race where veth_poll() consumes all packets and completes
NAPI before veth_xmit() on the producer side has called netif_tx_stop_queue().
In this state, the producer's __veth_xdp_flush(rq) call will see
rx_notify_masked is false and reschedule NAPI. This new NAPI poll, even if it
processes no packets, is now guaranteed to run the netif_tx_queue_stopped()
check, see the stopped queue, and wake it up, allowing veth_xmit() to proceed.

(3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
about to complete (napi_complete_done), it now also checks if the peer TXQ
is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
reschedule itself. This prevents a new race where the producer stops the
queue just as the consumer is finishing its poll, ensuring the wakeup is not
missed.

Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")
Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
---
 drivers/net/veth.c |   43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 7b1a9805b270..828b62916f50 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -392,14 +392,12 @@ static netdev_tx_t veth_xmit(struct sk_buff *skb, struct net_device *dev)
 		}
 		/* Restore Eth hdr pulled by dev_forward_skb/eth_type_trans */
 		__skb_push(skb, ETH_HLEN);
-		/* Depend on prior success packets started NAPI consumer via
-		 * __veth_xdp_flush(). Cancel TXQ stop if consumer stopped,
-		 * paired with empty check in veth_poll().
-		 */
 		netif_tx_stop_queue(txq);
-		smp_mb__after_atomic();
-		if (unlikely(__ptr_ring_empty(&rq->xdp_ring)))
-			netif_tx_wake_queue(txq);
+		/* Makes sure NAPI peer consumer runs. Consumer is responsible
+		 * for starting txq again, until then ndo_start_xmit (this
+		 * function) will not be invoked by the netstack again.
+		 */
+		__veth_xdp_flush(rq);
 		break;
 	case NET_RX_DROP: /* same as NET_XMIT_DROP */
 drop:
@@ -900,17 +898,9 @@ static int veth_xdp_rcv(struct veth_rq *rq, int budget,
 			struct veth_xdp_tx_bq *bq,
 			struct veth_stats *stats)
 {
-	struct veth_priv *priv = netdev_priv(rq->dev);
-	int queue_idx = rq->xdp_rxq.queue_index;
-	struct netdev_queue *peer_txq;
-	struct net_device *peer_dev;
 	int i, done = 0, n_xdpf = 0;
 	void *xdpf[VETH_XDP_BATCH];
 
-	/* NAPI functions as RCU section */
-	peer_dev = rcu_dereference_check(priv->peer, rcu_read_lock_bh_held());
-	peer_txq = peer_dev ? netdev_get_tx_queue(peer_dev, queue_idx) : NULL;
-
 	for (i = 0; i < budget; i++) {
 		void *ptr = __ptr_ring_consume(&rq->xdp_ring);
 
@@ -959,11 +949,6 @@ static int veth_xdp_rcv(struct veth_rq *rq, int budget,
 	rq->stats.vs.xdp_packets += done;
 	u64_stats_update_end(&rq->stats.syncp);
 
-	if (peer_txq && unlikely(netif_tx_queue_stopped(peer_txq))) {
-		txq_trans_cond_update(peer_txq);
-		netif_tx_wake_queue(peer_txq);
-	}
-
 	return done;
 }
 
@@ -971,12 +956,20 @@ static int veth_poll(struct napi_struct *napi, int budget)
 {
 	struct veth_rq *rq =
 		container_of(napi, struct veth_rq, xdp_napi);
+	struct veth_priv *priv = netdev_priv(rq->dev);
+	int queue_idx = rq->xdp_rxq.queue_index;
+	struct netdev_queue *peer_txq;
 	struct veth_stats stats = {};
+	struct net_device *peer_dev;
 	struct veth_xdp_tx_bq bq;
 	int done;
 
 	bq.count = 0;
 
+	/* NAPI functions as RCU section */
+	peer_dev = rcu_dereference_check(priv->peer, rcu_read_lock_bh_held());
+	peer_txq = peer_dev ? netdev_get_tx_queue(peer_dev, queue_idx) : NULL;
+
 	xdp_set_return_frame_no_direct();
 	done = veth_xdp_rcv(rq, budget, &bq, &stats);
 
@@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int budget)
 	if (done < budget && napi_complete_done(napi, done)) {
 		/* Write rx_notify_masked before reading ptr_ring */
 		smp_store_mb(rq->rx_notify_masked, false);
-		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
+		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
+			     (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
 			if (napi_schedule_prep(&rq->xdp_napi)) {
 				WRITE_ONCE(rq->rx_notify_masked, true);
 				__napi_schedule(&rq->xdp_napi);
@@ -998,6 +992,13 @@ static int veth_poll(struct napi_struct *napi, int budget)
 		veth_xdp_flush(rq, &bq);
 	xdp_clear_return_frame_no_direct();
 
+	/* Release backpressure per NAPI poll */
+	smp_rmb(); /* Paired with netif_tx_stop_queue set_bit */
+	if (peer_txq && netif_tx_queue_stopped(peer_txq)) {
+		txq_trans_cond_update(peer_txq);
+		netif_tx_wake_queue(peer_txq);
+	}
+
 	return done;
 }
 



