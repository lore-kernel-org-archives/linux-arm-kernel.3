Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB5AC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZfmH2oLEIOE6DPQC7FCKkWVrUs1J98qkZ1U/7z55Tw=; b=eMrrfzwCq6li9D7m8jXK2QZlcS
	HKwruF3wUDJLRdNQXn4JwZXUlO6e3PxjlqIJy5ueYBJ4bMJXu87ZqLJYExrVP1W8atS/Jrl4b9J0c
	TCb2QGCSKNQUZbNfuX+L3hJsJNC2K7tkII2w3MhmUew80RnrFGx7kCDjBnQ07qPEPFWE5xpQxEDdm
	Rgy9bJkO+RfV9YDUvan8TISp2OGLA90sL43z3d7BlzPL1lSt4hf4XTyRtpjEMldAhqAhQv6jZeeRc
	tK5jiG6aLvWjrMJOivR1jKUjQhQl04VpO9/Mq5nFEYPbCIo1ZLnRSKIlWpMmvgDTwdMn2ynuLN+YY
	rFjTOdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Lo-0000000DUYu-3TfL;
	Fri, 25 Sep 2026 13:52:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Lk-0000000DUXD-04rJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:52:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 900EB43B4F;
	Fri, 25 Sep 2026 13:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E821F000FF;
	Fri, 25 Sep 2026 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344347;
	bh=sZfmH2oLEIOE6DPQC7FCKkWVrUs1J98qkZ1U/7z55Tw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OPD5U/0HdtJEreoltO5AGbQ3HW0bwrvKy2VLdnvzS+SC+EI1w4BMeKq6zZCVk0uZc
	 Tg1Pw4BVCWPIqORzeCHaNdn3iqEqi2G+ekO1p6VC9Iqu8N+lzwHjeBNsS6CKA/9RDV
	 snzhlrsLYf7qJ6NQhkJEu91PWQjg8SDDsSV+Pzu4s5pWj/+HDLGx2+dQr6kn/zpYO7
	 oaKRrC+P5lr5fFxV2WLglL6vsEwArqLNLnPrS9xJN0WtuvWrrAwjOe1z/7ss63pJVB
	 iTjyGZJXKCgvXulARK8dHZMlTaA9+Ho3Axt4SAwUZ6yEx2n/w358u1/IgSUgshMFgX
	 t5Z4qy/cEmn/A==
Subject: Re: [PATCH net v2 3/4] net: axienet: quiesce the TX queue across a
 DMA error reset
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 daniel@iogearbox.net, andybnac@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 13:52:26 +0000
Message-ID: <179034434627.2160803.6267070638261269960@kernel.org>
In-Reply-To: <20260924135116.185161-4-maimon.sagi@gmail.com>
References: <20260924135116.185161-4-maimon.sagi@gmail.com>
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
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 (2) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not fully close the race it sets out to fix:
  axienet_start_xmit() can still run while the TX ring is being torn…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but axienet_open()
  ignores the return value of axienet_device_reset() and can reach…
- [Medium] At this commit, axienet_dma_err_handler() wakes the TX queue
  after a reset that also reset the AXI Ethernet core (per the comment…
- [Medium] This problem wasn't introduced by this patch, but
  axienet_dma_stop() discards the return value of…

--

net: axienet: quiesce the TX queue across a DMA error reset

This adds a netif_tx_disable() call to axienet_dma_err_handler(), right
after TX NAPI is disabled, so no transmit can run while the TX ring is
torn down. Once the reset is complete, the queue is woken again, unless
the interface is stopping or the device has been detached for suspend.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 6d448d0b523d3..f16dbfc7dc933 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2724,6 +2724,11 @@ static void axienet_dma_err_handler(struct work_struct *work)
>  	napi_disable(&lp->napi_tx);
>  	napi_disable(&lp->napi_rx);
>  
> +	/* With TX NAPI disabled nothing else can wake the queue.  Stop it and
> +	 * wait out any transmit in progress, so the ring can be torn down.
> +	 */
> +	netif_tx_disable(ndev);

[Severity: High]
Is the comment accurate that nothing else can wake the queue here? Two
other paths seem able to clear the DRV_XOFF bit set by netif_tx_disable()
while the handler is still running.

The first path is axienet_open(). axienet_init_legacy_dma() calls
request_irq() for tx_irq and rx_irq, so dma_err_task can be scheduled from
that point on. RX DMA is already running with the error interrupt enabled,
via axienet_device_reset() -> axienet_dma_bd_init() -> axienet_dma_start().
After that, axienet_open() does:

	/* Nothing else clears a stop left over from before the last close:
	 * the ring is empty, so no TX completion will wake the queue.
	 */
	netif_start_queue(ndev);

__dev_open() then calls dev_activate() once ndo_open returns. This driver
does not use the netdev instance lock, so the handler's napi_disable() does
not wait for open to finish.

The second path is axienet_resume():

	rtnl_lock();
	axienet_open(ndev);
	rtnl_unlock();

	netif_device_attach(ndev);

When the device was not present and is running, netif_device_attach()
calls netif_tx_wake_all_queues(). Nothing orders this against
dma_err_task.

Suppose either wake lands while the handler sleeps in axienet_dma_stop().
Can axienet_start_xmit() then publish an skb into lp->tx_bd_v[] that the
handler's loop frees with dev_kfree_skb_irq(), and then read skb->len in
netdev_sent_queue()? The same window would also allow a XAXIDMA_TX_TDESC
kick with a tail that the handler is about to rewind to 0.

That would mean the statement in the commit message, "the handler now
owns the queue state for its whole duration", does not hold on the open
and resume paths.

Would it make sense to start the queue in axienet_open() before the DMA
IRQs are requested, and to order the attach in axienet_resume() against
dma_err_task? The later patch in the series, "net: axienet: reprogram the
link settings after a DMA error reset", does not change this code.

> +
>  	axienet_setoptions(ndev, lp->options &
>  			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
>  
> @@ -2791,6 +2796,13 @@ static void axienet_dma_err_handler(struct work_struct *work)
>  	napi_enable(&lp->napi_rx);
>  	napi_enable(&lp->napi_tx);
>  	axienet_setoptions(ndev, lp->options);
> +
> +	/* Leave the queue stopped if the interface is going down or the
> +	 * device was detached for suspend: axienet_stop() and axienet_open()
> +	 * own the queue state then.
> +	 */
> +	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev))
> +		netif_wake_queue(ndev);

[Severity: Medium]
This is a pre-existing issue, but at this commit the queue is woken
without the link settings being reprogrammed.

The DMA reset in __axienet_device_reset() also resets the AXI Ethernet
core. The handler does not restore the XAE_EMMC link speed. It also writes
XAE_FCC to XAE_FCC_FCRX_MASK, which drops the negotiated TX pause setting.

Only axienet_mac_link_up() programs those registers, and phylink sees no
link change, so it does not call it again. Does transmission then resume
with the MAC at its reset-default speed and pause configuration, for
example on 10/100 Mb/s links?

The final patch in the series, "net: axienet: reprogram the link settings
after a DMA error reset", resolves this. It adds
phylink_mac_change(lp->phylink, false) before netif_wake_queue(), inside
the same condition.

[Severity: Medium]
This isn't a bug introduced by this patch, but the wake here happens
whether or not the reset actually succeeded. axienet_dma_stop() discards
the result of the reset:

	axienet_lock_mii(lp);
	__axienet_device_reset(lp);
	axienet_unlock_mii(lp);

It also continues after the HALTED polling loops expire.
__axienet_device_reset() returns -ETIMEDOUT when XAXIDMA_CR_RESET_MASK
never clears or XAE_INT_PHYRSTCMPLT_MASK is never set.

Even so, axienet_dma_err_handler() unmaps and clears every descriptor,
rewinds the ring indices, calls axienet_dma_start(), re-enables TX/RX and
now wakes the queue.

If the engine never really halted, can outstanding DMA still reach the
buffers that were just unmapped? And would new transmits be posted to an
engine that never completes them?

>  }
>  
>  /**

[Severity: High]
This is a pre-existing issue in axienet_open(), not introduced by this
patch. The same open path is involved in the race above.

The return value of axienet_device_reset() is overwritten before anything
checks it:

	axienet_lock_mii(lp);
	ret = axienet_device_reset(ndev);
	axienet_unlock_mii(lp);

	ret = phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);

axienet_device_reset() can fail in three ways:

- __axienet_device_reset() times out before axienet_dma_bd_init() runs.
- The tx_bd_v dma_alloc_coherent() fails and leaves it NULL.
- The RX allocation fails. axienet_dma_bd_init() then calls
  axienet_dma_bd_release(), which frees tx_bd_v with dma_free_coherent()
  but does not clear the pointer.

In every case axienet_open() still registers the IRQs, calls
netif_start_queue() and returns 0.

The next transmit then reaches axienet_check_tx_bd_space():

	cur_p = &lp->tx_bd_v[(READ_ONCE(lp->tx_bd_tail) + num_frag) %
			     lp->tx_bd_num];
	if (cur_p->cntrl)

Can this dereference a NULL or freed tx_bd_v? And could a later
axienet_stop() -> axienet_dma_bd_release() call dma_free_coherent() on
tx_bd_v a second time?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924135116.185161-1-maimon.sagi%40gmail.com

