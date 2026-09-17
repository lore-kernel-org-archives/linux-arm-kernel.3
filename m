Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E5CC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLWg4sL7FNW2rDlFnqytZS83Y8S4Uj0MO5EXiiPHF8s=; b=5AloXC51HrVh4eUfesyK0T75ly
	ae7dmFP0YF759uG0npKfDw3bpXZFeIH0sQ/x3VuMkpwpGrKT9BSfRfnJwxGfOn6AuDb23bFrLDQDy
	v1HsnH7wAYLY9ZEmmWpST0ggXxnWEhlNKbEe6fe8S/TzaFxq5qnNkv4z8EC6o4qgRUicOIqk0s2JL
	olVUik/R9tuK4hhbnSF/i+hO7Ky8SqBRlF3hitaEdyBkSPP/Ogsmzv67lojgdI6sD5lCvf57XUHcZ
	CMrEPctsUSnBrGxa4AyPiHt/gQGfmeFLs4aAdOMqjvjFwr/FolfSPNrEXlFNWB57F0Ko9hDyFG+rA
	MrxNTEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x764n-0000000AjaJ-1ZzB;
	Thu, 17 Sep 2026 06:58:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x764m-0000000AjaC-17Ye
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:58:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD0E960200;
	Thu, 17 Sep 2026 06:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACD81F000FF;
	Thu, 17 Sep 2026 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789628311;
	bh=CLWg4sL7FNW2rDlFnqytZS83Y8S4Uj0MO5EXiiPHF8s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LGBa6DIqAizDZ1bFoLiWZEl0unBIpybIlbDaE/bu+zdL8cIpgW2S+bvd0nKKaZoFE
	 Bi1NZQkLUSrIB5sapuD77goPfgXesOmwONY2dhQNVfSwRXmLZK4Cm4OiEjWaGzBjxR
	 ce9lLXF0hiCgIW6MPw+t2D6Xm6lg+RJs1S+ezw51smLTjXcyYWXnVWqQ75lZpkLfqK
	 Up+eZNAGRbU/qP+V28EwpvIJl6QC3SVoJ0YEnAUk9dxMxR65sZ1QPjfELG+D2uyjd2
	 xaPQoYfbq33dMrKQWVwWBxSaaExyVrdR1W+Ke+Cijn/ce6rijO2NxCxjYVI7LmHtaS
	 s5RZOAVZkHvpQ==
Subject: Re: [PATCH net-next] net: axienet: add a TX timeout handler to
 recover a lost DMA interrupt
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 06:58:30 +0000
Message-ID: <178962831034.22033.349240265456808212@kernel.org>
In-Reply-To: <20260915065534.102249-1-maimon.sagi@gmail.com>
References: <20260915065534.102249-1-maimon.sagi@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

- [High] The new .ndo_tx_timeout handler (axienet_tx_timeout(),
  drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1907-1913) only…

Pre-existing issues:
- [High] axienet_dma_err_handler()
  (drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2727-2810) tears…

--

net: axienet: add a TX timeout handler to recover a lost DMA interrupt

This adds an .ndo_tx_timeout handler to axienet_netdev_ops that queues
lp->dma_err_task, so the netdev watchdog can reach the existing DMA reset
path without depending on a DMA interrupt.  watchdog_timeo is set to 5 * HZ
in the legacy DMA branch of axienet_probe().

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 782f903d318f3..b5927e979c341 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -1884,6 +1888,30 @@ axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
>  	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
>  }
>  
> +/**
> + * axienet_tx_timeout - Driver TX timeout callback
> + * @ndev:	Pointer to net_device structure
> + * @txqueue:	Index of the transmit queue that stalled
> + *
> + * Called by the netdev watchdog when a transmit queue has made no progress for
> + * @ndev->watchdog_timeo.  axienet_dma_err_handler() is the driver's only reset
> + * path, and it is otherwise scheduled solely from axienet_tx_irq() and
> + * axienet_rx_irq() - so a completion interrupt that is never delivered leaves
> + * the queue stopped with descriptors unreclaimed and no way back short of
> + * unloading the driver.  Schedule the reset from here as well, so a lost
> + * interrupt is recoverable.
> + *
> + * This runs from a timer, so it only queues the work; the reset itself happens
> + * in process context in axienet_dma_err_handler().
> + */
> +static void axienet_tx_timeout(struct net_device *ndev, unsigned int txqueue)
> +{
> +	struct axienet_local *lp = netdev_priv(ndev);
> +
> +	netdev_err(ndev, "TX queue %u stalled, resetting DMA\n", txqueue);
> +	schedule_work(&lp->dma_err_task);
> +}

[Severity: High]
Does the queue actually get restarted after this reset?

dev_watchdog() only calls ndo_tx_timeout for a queue that is already
stopped:

net/sched/sch_generic.c:dev_watchdog() {
	...
			if (!netif_xmit_stopped(txq))
				continue;
	...
			dev->netdev_ops->ndo_tx_timeout(dev, i);
}

In the scenario the changelog describes (lost TX completion, descriptors
unreclaimed) the stop bit is __QUEUE_STATE_DRV_XOFF, set here:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit() {
	...
	if (axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1)) {
		netif_stop_queue(ndev);
	...
}

axienet_dma_err_handler() then resets DMA, zeroes every TX BD, sets
lp->tx_bd_ci = lp->tx_bd_tail = 0, re-enables NAPI and returns.  The only
queue-state clearing it does is netdev_reset_queue(), which touches
STACK_XOFF only, and nothing at all without CONFIG_BQL:

include/linux/netdevice.h:netdev_tx_reset_queue() {
#ifdef CONFIG_BQL
	clear_bit(__QUEUE_STATE_STACK_XOFF, &q->state);
	dql_reset(&q->dql);
#endif
}

There is no netif_wake_queue()/netif_tx_wake_all_queues() and no
netif_trans_update() anywhere in axienet_dma_err_handler().  The remaining
wake site in axienet_tx_poll() is gated on packets:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_tx_poll() {
	packets = axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num, false,
					&size, budget);

	if (packets) {
	...
		if (!axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1))
			netif_wake_queue(ndev);
	}
}

Can axienet_free_tx_chain() ever return non-zero after the handler cleared
cur_p->status for every descriptor?  And the wake in axienet_start_xmit()
cannot run while the queue is stopped.

If DRV_XOFF survives the reset, and txq->trans_start is never refreshed,
doesn't dev_watchdog()'s time_after(jiffies, trans_start + watchdog_timeo)
stay true, so the timeout path re-fires every 5 seconds, re-running
napi_disable() / axienet_dma_stop() / __axienet_device_reset() /
axienet_dma_start() and printing netdev_crit + netdev_err indefinitely
while the interface still cannot transmit?

The driver's other reset path does refresh the timestamp:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_device_reset() {
	...
	netif_trans_update(ndev);
}

Would adding netif_trans_update() plus a wake of the TX queue at the tail
of axienet_dma_err_handler() be needed for the recovery claimed in the
changelog ("the watchdog fires and the interface resumes passing traffic")
to hold for the DRV_XOFF case rather than only for a BQL-only stop?

[Severity: High]
This is a pre-existing issue and not introduced by this patch, but the new
trigger makes it much easier to reach: axienet_dma_err_handler() tears down
the TX ring with no exclusion against axienet_start_xmit().

The worker calls napi_disable() (which only excludes axienet_tx_poll()),
axienet_dma_stop(), then re-enables transmission for a BQL-only stop before
it starts freeing descriptors:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_err_handler() {
	axienet_dma_stop(lp);
	netdev_reset_queue(ndev);	/* clears __QUEUE_STATE_STACK_XOFF */

	for (i = 0; i < lp->tx_bd_num; i++) {
		cur_p = &lp->tx_bd_v[i];
		if (cur_p->cntrl) {
			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);

			dma_unmap_single(lp->dev, addr, ..., DMA_TO_DEVICE);
		}
		if (cur_p->skb)
			dev_kfree_skb_irq(cur_p->skb);
	...
	lp->tx_bd_ci = 0;
	lp->tx_bd_tail = 0;

	axienet_dma_start(lp);
}

It never takes the per-queue _xmit_lock and never calls
netif_tx_disable()/netif_device_detach(), and the core unfreezes the queues
as soon as ndo_tx_timeout() returns, long before the work runs:

net/sched/sch_generic.c:dev_watchdog() {
			netif_freeze_queues(dev);
			dev->netdev_ops->ndo_tx_timeout(dev, i);
			netif_unfreeze_queues(dev);
}

So while the teardown loop is running, can a transmit on another CPU enter

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit() {
	...
	WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
	netdev_sent_queue(ndev, skb->len);

	/* Start the transfer */
	axienet_dma_out_addr(lp, XAXIDMA_TX_TDESC_OFFSET, tail_p);
}

and write cur_p->cntrl/phys/skb into a descriptor the worker is about to
unmap and clear?  The outcomes look like an skb freed by the worker and
then re-referenced, a DMA mapping released while a fresh buffer is being
programmed into the same descriptor, and lp->tx_bd_tail/tx_bd_ci rewound to
0 out of step with the hardware tail pointer written by axienet_start_xmit().

Since this new .ndo_tx_timeout makes the reset a routine event (and, per the
comment above, potentially every 5 seconds), should the reset path be made
to exclude the xmit path, for example with netif_tx_disable() around the
descriptor teardown?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915065534.102249-1-maimon.sagi%40gmail.com

