Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38535CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Cc:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1LGOntoEu0cxPEqR0tV9/u3NS4FCAxFw3gQ0WhdtQM=; b=WHuuJugIPBnFdZ0Vw8RY4nUp0l
	fBwblGsTEVQe6xwsPIodFysSndSsUcVHszlDQx21GMvOOZfDV+aw65Ua1kZPRi5S6jBxBMBMLfccI
	CIuACeKViVme+1ojFIm9NFOHEVfW//yirU+0MGvl1HyQ3w5c5cECZCmJEovNM4ZeezrDC+5uqq/IF
	TT1RPQsHx73IZ4KwcR7mM4+7tJeSgRILS6cP3JtljNsS4rCIPDTHVRSatf90S63FJEKoKr/O0WrHm
	HYpVtX4zkxkINDnfIgcx/yp/Gxhm5OcvxbEpUbN5qjF6HEIBEfTgm7S/R+K/g7jXr3CNLSS8plIx/
	gQSugUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTTI-0000000EhlU-2ZhR;
	Mon, 27 Oct 2025 20:05:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTTH-0000000EhlD-2OQS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DDB2601E9;
	Mon, 27 Oct 2025 20:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBBCC4CEF1;
	Mon, 27 Oct 2025 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761595538;
	bh=EUK7JGUWTWfdNiotQollFORwLt46wRvRSTbgHKwFAOo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SSLGDk3RVIxaE6pzGZRvsYpTQhWbqhNBAFAqtmjaPCZQJ6dydoSP3I2NiVjKaxZzy
	 aHoSzcDgHCOsbJh3YYIJU+W5NNCWAgAhYFoeVE48mrDMR/j/l3rz1zKTjcG0yOSeAT
	 500surejLOEeieh0Hui8L9gh7Bx+6JvqUnFl3O9kYKzEm8SCaXkvult9NFXipVTIAO
	 HPkyi4o4y4v4u+ILlEHaCUFQMIfRtXmd9IaxQ+Zm5jXbxbzq3A5KAq1FfE0j2aI0iY
	 bxQrKkytSckMJCvO7TJOlLKkgnCj1jPgJmhGYwQvwZsY0eLw7gUweqYNcm9FmOUQmR
	 M+8uM0HynfpeQ==
Subject: [PATCH net V2 1/2] veth: enable dev_watchdog for detecting stalled
 TXQs
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
Date: Mon, 27 Oct 2025 21:05:32 +0100
Message-ID: <176159553266.5396.10834647359497221596.stgit@firesoul>
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

The changes introduced in commit dc82a33297fc ("veth: apply qdisc
backpressure on full ptr_ring to reduce TX drops") have been found to cause
a race condition in production environments.

Under specific circumstances, observed exclusively on ARM64 (aarch64)
systems with Ampere Altra Max CPUs, a transmit queue (TXQ) can become
permanently stalled. This happens when the race condition leads to the TXQ
entering the QUEUE_STATE_DRV_XOFF state without a corresponding queue wake-up,
preventing the attached qdisc from dequeueing packets and causing the
network link to halt.

As a first step towards resolving this issue, this patch introduces a
failsafe mechanism. It enables the net device watchdog by setting a timeout
value and implements the .ndo_tx_timeout callback.

If a TXQ stalls, the watchdog will trigger the veth_tx_timeout() function,
which logs a warning and calls netif_tx_wake_queue() to unstall the queue
and allow traffic to resume.

The log message will look like this:

 veth42: NETDEV WATCHDOG: CPU: 34: transmit queue 0 timed out 5393 ms
 veth42: veth backpressure stalled(n:1) TXQ(0) re-enable

This provides a necessary recovery mechanism while the underlying race
condition is investigated further. Subsequent patches will address the root
cause and add more robust state handling.

Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")
Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
---
 drivers/net/veth.c |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index a3046142cb8e..7b1a9805b270 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -959,8 +959,10 @@ static int veth_xdp_rcv(struct veth_rq *rq, int budget,
 	rq->stats.vs.xdp_packets += done;
 	u64_stats_update_end(&rq->stats.syncp);
 
-	if (peer_txq && unlikely(netif_tx_queue_stopped(peer_txq)))
+	if (peer_txq && unlikely(netif_tx_queue_stopped(peer_txq))) {
+		txq_trans_cond_update(peer_txq);
 		netif_tx_wake_queue(peer_txq);
+	}
 
 	return done;
 }
@@ -1373,6 +1375,16 @@ static int veth_set_channels(struct net_device *dev,
 	goto out;
 }
 
+static void veth_tx_timeout(struct net_device *dev, unsigned int txqueue)
+{
+	struct netdev_queue *txq = netdev_get_tx_queue(dev, txqueue);
+
+	netdev_err(dev, "veth backpressure stalled(n:%ld) TXQ(%u) re-enable\n",
+		   atomic_long_read(&txq->trans_timeout), txqueue);
+
+	netif_tx_wake_queue(txq);
+}
+
 static int veth_open(struct net_device *dev)
 {
 	struct veth_priv *priv = netdev_priv(dev);
@@ -1711,6 +1723,7 @@ static const struct net_device_ops veth_netdev_ops = {
 	.ndo_bpf		= veth_xdp,
 	.ndo_xdp_xmit		= veth_ndo_xdp_xmit,
 	.ndo_get_peer_dev	= veth_peer_dev,
+	.ndo_tx_timeout		= veth_tx_timeout,
 };
 
 static const struct xdp_metadata_ops veth_xdp_metadata_ops = {
@@ -1749,6 +1762,7 @@ static void veth_setup(struct net_device *dev)
 	dev->priv_destructor = veth_dev_free;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 	dev->max_mtu = ETH_MAX_MTU;
+	dev->watchdog_timeo = msecs_to_jiffies(5000);
 
 	dev->hw_features = VETH_FEATURES;
 	dev->hw_enc_features = VETH_FEATURES;



