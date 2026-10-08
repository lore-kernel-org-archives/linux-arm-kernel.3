Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A6ECA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJYDfNAj0KDl7mxejEI6hnmQ6v31S1CH9lSfUhIOadA=; b=RMNfjIG5M0FJztr/jItDG0a0hG
	/q/bHEEl1O9IM5TbaxrCXjl4/HAXx+Ruwmj6simm1CFCqEIuWe6+6P1tv7R1b15gR4G0qpFlpQmij
	2R09oz5StCTc7LEejrzILew0d/abmY0zA+YMFEGn6eZGCW5EL5k/FnGVTrshCSvo552OgXYu0ddZk
	I7+qKaCEk+1Oh+owazSmyeWFnsf7V/K40oQfrTcb+lcKLeqqomUuqJZULS4dVYGSBVnMZH9zYJpQR
	I6tZCj/p65vsGlyQ4XJf3dMldZFdl3cuCzyGDjEbLKIh6JfdsKBVYAxnqo6LDswt4w79x3TxiupJ4
	I6AseErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqLU-00000004dMD-0yFa;
	Thu, 08 Oct 2026 15:47:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqLS-00000004dLw-3jTS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 15:47:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F9AF43B0B;
	Thu,  8 Oct 2026 15:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4021F000FF;
	Thu,  8 Oct 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791474466;
	bh=ZJYDfNAj0KDl7mxejEI6hnmQ6v31S1CH9lSfUhIOadA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GcY6q5A837cFkxa//lxOz/7TgBJMZnedILQeLoZveHMG7XuMCQNCjTUGy/cyvxCel
	 F4f7xDDMzR6aN9A3uNN7ncFaPME1seGMvua7k8y0hLcVgLRheROrAhLBP73pAylDHc
	 Ha6nXPJy2l6HxDRnrhCQ+ULkHWCnF/u3bNioF9LYacYPcQDcXN5l0jt8eEESkSOsTP
	 CIU+exSw1diQILV4SVqpz5M5bLPRtO49osLfY2oQtSUkx39iu2YfF48oFXFds2r9yz
	 9bC0r1IHZTJzu54yN1c1LFU4W63D+PDHL83cEBt3hIdlrAECI6D4o2dZjVVhf5YH12
	 dBF0h4jMD+HDQ==
Subject: Re: [PATCH net v4] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, daniel@iogearbox.net,
 jacob.e.keller@intel.com, joe@dama.to, suraj.gupta2@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 15:47:44 +0000
Message-ID: <179147446494.434549.11428994399896260897@kernel.org>
In-Reply-To: <20261007034620.1360542-1-maimon.sagi@gmail.com>
References: <20261007034620.1360542-1-maimon.sagi@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 (3) · Medium: 1 (3) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: axienet: RX buffer leak in axienet_dma_bd_release
- [Medium] axienet_free_tx_bufs() loops over the current lp->tx_bd_num
  entries of lp->tx_bd_v, reading cntrl/skb and storing zeros into every…
- [Low] axienet_free_tx_bufs() walks the TX ring in index order
  0..tx_bd_num-1 and, at each descriptor that has an skb attached, frees…
- [Low] axienet_dma_stop() ignores both the timeouts of its HALT polls
  and the return value of __axienet_device_reset(), which is -ETIMEDOUT…

Pre-existing issues:
- [High] axienet_open() ignores the result of axienet_device_reset().
- [High] In the RX walk of axienet_dma_bd_release(), each RX skb is freed
  with dev_kfree_skb() (line 254) before its DMA_FROM_DEVICE streaming…
- [High] axienet_dma_err_handler() runs from a workqueue and does not
  stop or lock the TX queue: there is no netif_tx_disable(),…
- [Medium] In the sibling Xilinx driver ll_temac, temac_dma_bd_release()
  unmaps and frees the RX skbs but frees the TX descriptor ring with…
- [Medium] The RX walk in axienet_dma_bd_release() stops (`break`) at the
  first descriptor with a NULL skb, on the assumption in its comment…
- [Medium] If phylink_of_phy_connect() or axienet_init_legacy_dma() fails
  after axienet_device_reset() has succeeded, axienet_open() returns…

--

net: axienet: free outstanding TX buffers in axienet_dma_bd_release()

This patch moves the TX ring walk out of axienet_dma_err_handler() into a
new helper, axienet_free_tx_bufs(). axienet_dma_bd_release() now calls it,
so TX skbs still in flight and their DMA mappings are freed when the
interface goes down. The patch also clears tx_bd_v and rx_bd_v once their
rings are freed, skips the TX walk when tx_bd_v is NULL, and frees skbs
with dev_kfree_skb_any() instead of dev_kfree_skb_irq().

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 09443623a3e2a..318ff03b04e69 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -173,6 +173,46 @@ static dma_addr_t desc_get_phys_addr(struct axienet_local *lp,

[ ... ]

> +static void axienet_free_tx_bufs(struct axienet_local *lp)
> +{
> +	struct axidma_bd *cur_p;
> +	u32 i;
> +
> +	for (i = 0; i < lp->tx_bd_num; i++) {
> +		cur_p = &lp->tx_bd_v[i];

[Severity: Medium]
Can this loop run past the end of the allocated ring? The loop bound is
the current lp->tx_bd_num. The only guard in axienet_dma_bd_release() is
the NULL check on lp->tx_bd_v, and that says nothing about how many
entries the ring was allocated with.

This sequence seems to reach that state:

axienet_open()
  axienet_device_reset() succeeds, axienet_dma_bd_init() allocates N entries
  phylink_of_phy_connect() or axienet_init_legacy_dma() fails
  returns without axienet_dma_bd_release(), so tx_bd_v stays non-NULL

axienet_ethtools_set_ringparam()
  the interface is down, so lp->tx_bd_num = M with M > N is accepted

axienet_open()
  __axienet_device_reset() times out and axienet_dma_bd_init() is skipped
  the failure is ignored and open returns 0

axienet_stop()->axienet_dma_bd_release()->axienet_free_tx_bufs()
  walks M entries of an N-entry ring

For i >= N, the loop reads cntrl and skb from beyond the coherent buffer.
It may call dma_unmap_single() or dev_kfree_skb_any() on garbage values,
and it writes zeros past the end of the allocation.

On this path the following dma_free_coherent() already passes the wrong
size, so the path itself isn't new. The walk adds out-of-bounds writes to
it. Fixing the unchecked reset and the missing unwind in axienet_open()
would cover this too.

> +		if (cur_p->cntrl) {
> +			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);
> +
> +			dma_unmap_single(lp->dev, addr,
> +					 (cur_p->cntrl &
> +					  XAXIDMA_BD_CTRL_LENGTH_MASK),
> +					 DMA_TO_DEVICE);
> +		}
> +		/* not reclaimed by axienet_free_tx_chain(), so a drop */
> +		if (cur_p->skb)
> +			dev_kfree_skb_any(cur_p->skb);

[Severity: Low]
Is the skb freed here before all of its mappings have been unmapped?

axienet_start_xmit() puts the head at orig_tail_ptr and the fragments at
the following indices, wrapping to 0. Only the last descriptor gets
cur_p->skb:

	for (ii = 0; ii < num_frag; ii++) {
		if (++new_tail_ptr >= lp->tx_bd_num)
			new_tail_ptr = 0;
	...
	cur_p->skb = skb;

Take an in-flight packet whose head is at tx_bd_num - 1 and whose last
fragment wrapped to index 0. This loop frees the skb at index 0. It only
calls dma_unmap_single() on the head and fragment descriptors at the top
of the ring later in the walk.

With DMA_TO_DEVICE and the engine stopped there may be no visible effect.
Would unmapping every descriptor first and then freeing the skbs, or
walking from tx_bd_ci in chain order, keep the usual unmap-before-free
order? The error handler loop had the same order, and this patch adds it
to normal teardown.

> +		cur_p->phys = 0;

[ ... ]

> @@ -186,11 +226,18 @@ static void axienet_dma_bd_release(struct net_device *ndev)
>  	int i;
>  	struct axienet_local *lp = netdev_priv(ndev);
>  
> -	/* If we end up here, tx_bd_v must have been DMA allocated. */
> +	/* tx_bd_v is NULL if axienet_dma_bd_init() did not get as far as
> +	 * allocating it, and is cleared below once the ring is freed;
> +	 * dma_free_coherent() accepts NULL.
> +	 */
> +	if (lp->tx_bd_v)
> +		axienet_free_tx_bufs(lp);

[Severity: Low]
This code assumes the DMA engine has stopped. axienet_dma_stop() ignores
the HALT poll timeouts and also the return value of the reset:

	/* Do a reset to ensure DMA is really stopped */
	axienet_lock_mii(lp);
	__axienet_device_reset(lp);
	axienet_unlock_mii(lp);

Suppose __axienet_device_reset() returns -ETIMEDOUT ("DMA reset timeout!")
while an AXI read is still outstanding. Could the device then read TX
buffers after they were unmapped and freed here, for example causing an
IOMMU fault?

axienet_stop() clears TXEN before this point, so freed data shouldn't
reach the wire, and teardown has to proceed anyway. This is more a
hardening question about faulty hardware.

> +
>  	dma_free_coherent(lp->dev,
>  			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
>  			  lp->tx_bd_v,
>  			  lp->tx_bd_p);
> +	lp->tx_bd_v = NULL;

[Severity: High]
This isn't a bug introduced by this patch. The commit message notes that
axienet_open() does not check the reset result, and the transmit path
still uses the ring when the reset fails:

axienet_open() {
	...
	ret = axienet_device_reset(ndev);
	axienet_unlock_mii(lp);

	ret = phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);
	...
}

The reset can fail in two ways: __axienet_device_reset() times out, or
axienet_dma_bd_init() fails with -ENOMEM and calls
axienet_dma_bd_release(). Either way, open still runs
axienet_init_legacy_dma() and returns 0 with no TX or RX ring.

The first transmit then does this:

axienet_start_xmit()
	cur_p = &lp->tx_bd_v[orig_tail_ptr];
	...
axienet_check_tx_bd_space()
	cur_p = &lp->tx_bd_v[(READ_ONCE(lp->tx_bd_tail) + num_frag) %
			     lp->tx_bd_num];
	if (cur_p->cntrl)

Now that this patch clears tx_bd_v, that is a NULL pointer dereference.
Before the patch, after an earlier close, it was a write into the freed
coherent ring.

axienet_dma_err_handler() also calls axienet_free_tx_bufs() and walks
rx_bd_v, without the NULL check that axienet_dma_bd_release() now has.

Should axienet_open() check the result of axienet_device_reset() and
unwind on failure?

[Severity: Medium]
This is a pre-existing issue. The axienet_open() error exits that come
after a successful reset never release the rings or stop the DMA engine:

	ret = phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);
	if (ret) {
		dev_err(lp->dev, "phylink_of_phy_connect() failed: %d\n", ret);
		return ret;
	}

The err_phy path, taken when axienet_init_legacy_dma() fails, does the
same.

By that point axienet_dma_bd_init() has allocated both coherent rings,
allocated and mapped rx_bd_num RX skbs, and started the DMA engine. Do
these leak, with the DMA engine still running?

The next open's axienet_dma_bd_init() then overwrites tx_bd_v and rx_bd_v
without freeing the old allocations.

>  
>  	if (!lp->rx_bd_v)
>  		return;

[Severity: High]
This isn't a bug introduced by this patch, but the RX walk just below
leaks in the same way the TX side did. It stops at the first
descriptor with a NULL skb:

	if (!lp->rx_bd_v[i].skb)
		break;

That only works if the populated descriptors form a prefix of the
ring. That holds on the axienet_dma_bd_init() error path, but not once
the ring has been running.

axienet_rx_poll() takes the skb from a completed descriptor and sets
cur_p->skb to NULL before refilling it. If napi_alloc_skb() or
dma_map_single() then fails, the poll loop breaks. That leaves a NULL
slot at rx_bd_ci in the middle of an otherwise populated ring.

If the interface is closed before a later poll refills that slot,
axienet_stop()->axienet_dma_bd_release() stops there. The skb and
DMA_FROM_DEVICE mapping of every descriptor after it are then leaked.
Depending on where rx_bd_ci sits, that can be most of the ring. A
system under memory pressure is the one most likely to hit this.

It also contradicts the commit message, which says this walk frees
every receive buffer.

Would continue instead of break be enough? A slot emptied by
axienet_rx_poll() still has a non-zero cntrl, and its phys points at
the buffer that was already unmapped. So the skip has to cover the
unmap as well, which a continue at that point does. The zeroed,
never-filled slots on the axienet_dma_bd_init() error path would be
skipped the same way.

This patch is about making axienet_dma_bd_release() release everything
the rings still hold. Could the RX side be fixed here as well, or in a
separate patch?

[Severity: High]
This isn't a bug introduced by this patch. The RX walk below frees each
skb before it unmaps the skb's DMA_FROM_DEVICE mapping:

		dev_kfree_skb(lp->rx_bd_v[i].skb);
		...
		if (lp->rx_bd_v[i].cntrl) {
			phys = desc_get_phys_addr(lp, &lp->rx_bd_v[i]);
			dma_unmap_single(lp->dev, phys,
					 lp->max_frm_size, DMA_FROM_DEVICE);
		}

With swiotlb bouncing, can the unmap copy up to max_frm_size bytes back
into the skb data that was just freed? On non-coherent platforms the
unmap also invalidates cache lines of memory that may already belong to a
new owner.

Bouncing looks realistic here. Probe uses a 32-bit DMA mask unless 64-bit
DMA is detected, so a 32-bit AXI DMA on a host with RAM above 4 GiB would
bounce, as could the PCIe card from the commit message.

The new TX helper unmaps before it frees. Would swapping the order in
this loop make the two walks consistent?

[Severity: Medium]
This is also pre-existing. The same RX walk stops at the first NULL skb:

		/* A NULL skb means this descriptor has not been initialised
		 * at all.
		 */
		if (!lp->rx_bd_v[i].skb)
			break;

axienet_rx_poll() sets cur_p->skb = NULL and exits its loop if
napi_alloc_skb() or dma_map_single() fails. That leaves a NULL slot at
rx_bd_ci in the middle of a populated ring.

Would a close after such a refill failure leak every RX skb and mapping
after that slot? That would also contradict the commit message, which
says the RX walk frees "every receive buffer".

> @@ -221,6 +268,7 @@ static void axienet_dma_bd_release(struct net_device *ndev)
>  			  sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
>  			  lp->rx_bd_v,
>  			  lp->rx_bd_p);
> +	lp->rx_bd_v = NULL;
>  }

[Severity: Medium]
This isn't a bug introduced by this patch, but the sibling ll_temac
driver seems to have the same TX leak. temac_dma_bd_release() in
drivers/net/ethernet/xilinx/ll_temac_main.c frees only the TX ring:

	if (lp->tx_bd_v)
		dma_free_coherent(ndev->dev.parent,
				  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
				  lp->tx_bd_v, lp->tx_bd_p);

temac_start_xmit() attaches the skb to the last TX BD via ptr_to_txbd(),
and only temac_start_xmit_done() reclaims it.

Does temac_stop()->temac_dma_bd_release() leak in-flight TX skbs and
their DMA_TO_DEVICE mappings? It may be worth a separate fix.

[ ... ]

> @@ -2749,29 +2797,7 @@ static void axienet_dma_err_handler(struct work_struct *work)
>  	axienet_dma_stop(lp);
>  	netdev_reset_queue(ndev);
>  
> -	for (i = 0; i < lp->tx_bd_num; i++) {

[ ... ]

> -	}
> +	axienet_free_tx_bufs(lp);

[Severity: High]
This is a pre-existing issue, since the loop was moved rather than newly
written. What stops axienet_start_xmit() from running at the same time as
this code?

axienet_dma_err_handler() runs from a workqueue. It disables NAPI, the
MAC TX/RX enables and the DMA engine, but it never calls
netif_tx_disable(), netif_tx_lock() or netif_stop_queue(). The TX queue
stays awake for the up to ~250 ms spent in axienet_dma_stop().

Meanwhile, on another CPU:

axienet_start_xmit()
	cur_p->skb = skb;
	...
	WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
	netdev_sent_queue(ndev, skb->len);

If axienet_free_tx_bufs() frees that skb between the store and the read
of skb->len, can start_xmit read a freed skb?

The two paths also race on tx_bd_tail, which the handler later resets to
0, on BQL state (netdev_reset_queue() against netdev_sent_queue()), and
on descriptor contents. The restarted DMA could therefore fetch zeroed
descriptors.

dev_kfree_skb_irq() deferred the free to NET_TX softirq. With
dev_kfree_skb_any(), this process-context worker now frees the skb
immediately, so the freed memory can be reused sooner.

The helper's kernel-doc lists only "The DMA engine must be stopped" as a
precondition. Should it also require the TX queue to be quiesced?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007034620.1360542-1-maimon.sagi%40gmail.com

