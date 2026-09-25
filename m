Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB6BC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPYdGvaeqKfsakbhab7FT3Z4eB6jIblMd/9b4ZAI5Y4=; b=j8AwFZbTWvTxN4AAtzr2PA25Vk
	R9zOnC9qrq+z7B0dASk4jLz54LVa37CDIV+/ScU4e2i9qzh/f2ADvCqPzrqoNkOubvu78X5qA3MoS
	bpyiUjMXLhm6vPUeCJwH8jRhRBT7/0nmelyle1FD36HcmxWie0BvojTX6ZqT23IPMlJeYIKF69JMM
	91RnPNc30jPG1F+zfLFRR2jClKdewHGQaC3urbF8GAHFL2bKBeoCWpE419x225OlM0XwQYQt93ebR
	GX885kzyE484PmtQRXPzcMA8gh0U9ebYGDtBQrLxS+gyrAhHAhAVp8JYB5E6XUSJfG+LH6rWRN/2F
	v+dlwKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Lo-0000000DUYU-2zyI;
	Fri, 25 Sep 2026 13:52:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Li-0000000DUWg-2q5g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:52:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 374D0438D8;
	Fri, 25 Sep 2026 13:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D711F00893;
	Fri, 25 Sep 2026 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344346;
	bh=OPYdGvaeqKfsakbhab7FT3Z4eB6jIblMd/9b4ZAI5Y4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VwcBmS8sHlMG3/7lChWi5p+y2gyB89Cx+uQE20O1NGf3Q+3OJStlLP9ZCdQiCL/Vm
	 m75b9xtZ0fxvF7vpl4ZJbswK8Z2Xznt04s6oKhyUUyO0kawakRvZbaoZBTz78PtkY8
	 7qLtbm8QpHW7oLPN0bloqzXIkDFkr5xZ4HHlKv2Pi9R7JZ9H/q/gzamYKqxcxrYnhT
	 bxQyTqPwDRAVJv/vnrG2fc+z+OoGtoFxnnP+3XACA1/IkUqY8fubOgQIxWvQYuh49/
	 97aPgihCGkaoe+OuRR6Py7UQaFhcHkSvvl7NjTKhdMXQF3Xe/XDhl5dqXsODd4N3gQ
	 wl5o/wxXa0+9Q==
Subject: Re: [PATCH net v2 2/4] net: axienet: quiesce the TX path before
 axienet_stop() tears it down
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 daniel@iogearbox.net, andybnac@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 13:52:25 +0000
Message-ID: <179034434500.2160803.13601294298532568960@kernel.org>
In-Reply-To: <20260924135116.185161-3-maimon.sagi@gmail.com>
References: <20260924135116.185161-3-maimon.sagi@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch only works when the previous commit in the series,
  "net: axienet: start the TX queue in axienet_open()", is also applied.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is still
  reachable after the whole series: on the dmaengine backend,…
- [High] This problem wasn't introduced by this patch, but it can undo
  the new TX quiesce and cause use-after-free, oops or hang after an…
- [Medium] This problem wasn't introduced by this patch, but the legacy-
  DMA axienet_stop() leaks outstanding TX skbs and their streaming DMA…

--

net: axienet: quiesce the TX path before axienet_stop() tears it down

This commit adds netif_tx_disable() to the legacy DMA branch of
axienet_stop(). The call comes after TX NAPI is disabled and the error
work is flushed, so a transmit still in progress when axienet_suspend()
runs finishes before the TX ring is freed. The dmaengine path is left
unchanged on purpose.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index fb26d2e39faca..6d448d0b523d3 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1739,6 +1739,14 @@ static int axienet_stop(struct net_device *ndev)
>  
>  		napi_disable(&lp->napi_tx);
>  		napi_disable(&lp->napi_rx);
> +
> +		/* Nothing can wake the queue now: the error work returns early
> +		 * once lp->stopping is set, and TX NAPI is disabled.  Stop it and
> +		 * wait out any transmit in progress before the ring goes away.
> +		 * dev_close() has already done this, but axienet_suspend() calls
> +		 * us directly.
> +		 */
> +		netif_tx_disable(ndev);

[Severity: Low]
This netif_tx_disable() runs on every legacy DMA stop, not only from
axienet_suspend(). That includes the normal dev_close() -> ndo_stop path.
So after each ifdown, __QUEUE_STATE_DRV_XOFF stays set on every TX queue.

In this tree the next open clears it again. That happens through the
netif_start_queue() added by the previous commit, 718829c2b094 ("net:
axienet: start the TX queue in axienet_open()"):

axienet_open() {
    ...
	netif_start_queue(ndev);

	return 0;
    ...
}

Without that commit, nothing in the driver clears DRV_XOFF on reopen, and
__dev_open()/dev_activate() don't clear it either. The ring is empty after
reopen, so axienet_tx_poll() never reaches netif_wake_queue().

This patch has a Fixes: tag, and its hunk context doesn't overlap with the
prerequisite. If it is backported on its own, would TX stay stopped for
good after the first down/up cycle? Could the commit message mention the
dependency on the previous patch, so that stable picks up both?

Related to this, the commit message says:

    On the dev_close() path this is covered by the core:
    dev_deactivate_many() has already quiesced the qdisc and waited for
    in-flight transmits with synchronize_net().

The new comment also says "dev_close() has already done this".
dev_deactivate_many() waits for in-flight transmits but doesn't set
DRV_XOFF. So on the close path the new call does change the queue state.
Could the commit message and the comment say so?

>  	}

[Severity: High]
This isn't a bug introduced by this patch, but the dmaengine branch of
axienet_stop() looks open to the same race from axienet_suspend(). It is
still unchanged at the end of the series.

axienet_suspend() calls netif_device_detach() and then calls
axienet_stop() directly. The dmaengine branch then does this without
netif_tx_disable() or any TX lock barrier:

	dmaengine_terminate_sync(lp->tx_chan);
	...
	for (i = 0; i < TX_BD_NUM_MAX; i++)
		kfree(lp->tx_skb_ring[i]);
	kfree(lp->tx_skb_ring);
	...
	dma_release_channel(lp->tx_chan);

Until the TX channel is terminated, axienet_dma_tx_cb() can still run:

	netif_txq_completed_wake(txq, 1, len,
				 CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
				 2);

That wakes the stopped queue, clears the DRV_XOFF set by
netif_device_detach(), and reschedules the qdisc. On this path the qdisc
is never deactivated, and netif_running() stays true.

Can axienet_start_xmit_dmaengine() then run during or after the teardown?
It does:

	dma_dev = lp->tx_chan->device;
	...
	skbuf_dma = axienet_get_tx_desc(lp, lp->tx_ring_head);
	...
	sg_init_table(skbuf_dma->sgl, sg_len);

That would write into the freed skbuf_dma and tx_skb_ring. It would also
submit descriptors to a terminated or released channel.

Nothing waits for an xmit that was already past the stopped check when
netif_device_detach() ran, either.

>  
>  	cancel_work_sync(&lp->rx_dim.work);

[Severity: High]
This is a pre-existing issue, but can the resume path undo the TX quiesce
added here? axienet_resume() ignores the return value of axienet_open()
and always attaches:

	rtnl_lock();
	axienet_open(ndev);
	rtnl_unlock();

	netif_device_attach(ndev);

netif_running() is still true, so netif_device_attach() calls
netif_tx_wake_all_queues() even when open failed.

axienet_open() also overwrites the result of the reset:

	ret = axienet_device_reset(ndev);
	axienet_unlock_mii(lp);

	ret = phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);

axienet_device_reset() fails if __axienet_device_reset() times out. It
also fails if axienet_dma_bd_init() can't allocate and takes its error
path:

out:
	axienet_dma_bd_release(ndev);
	return -ENOMEM;

In either case open keeps going. lp->tx_bd_v is then freed, or still stale
from the suspend-time axienet_dma_bd_release(). Open reaches
netif_start_queue() and returns 0.

Would axienet_start_xmit() then write BDs into a freed or NULL tx_bd_v,
and program a stale tx_bd_p into XAXIDMA_TX_TDESC?

On the dmaengine path, axienet_init_dmaengine() can fail during resume.
Its error path releases the channels and frees tx_skb_ring, or tx_chan is
left holding an ERR_PTR. netif_device_attach() still wakes the queue.
axienet_start_xmit_dmaengine() would then dereference lp->tx_chan->device
and the freed ring.

A later dev_close() -> axienet_stop() would then call
dmaengine_terminate_sync() on the bad channel and kfree() tx_skb_ring a
second time.

On the legacy path, phylink_of_phy_connect() or request_irq() can fail on
resume. In that case napi_tx and napi_rx stay disabled from the suspend.
Would a later dev_close() -> axienet_stop() -> napi_disable() then spin
forever in napi_disable_locked() while holding RTNL?

[Severity: Medium]
This isn't a bug introduced by this patch, but does the legacy DMA stop
path leak outstanding TX skbs and their DMA mappings?

With this change an in-flight axienet_start_xmit() can finish publishing
its BDs. Then axienet_dma_stop() resets the engine, and
axienet_dma_bd_release() only frees the descriptor array:

	dma_free_coherent(lp->dev,
			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
			  lp->tx_bd_v,
			  lp->tx_bd_p);

Any BD that axienet_tx_poll() had not reclaimed keeps its
dma_map_single() mapping and cur_p->skb. The next axienet_dma_bd_init()
allocates a fresh ring, so nothing can reach those mappings any more.

axienet_dma_err_handler() does walk the TX BDs, calling dma_unmap_single()
and dev_kfree_skb_irq() for each one. Should axienet_stop() do the same
before it releases the ring?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924135116.185161-1-maimon.sagi%40gmail.com

