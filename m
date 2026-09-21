Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B6C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjqV+TvColuL7thiwxFD+nBjPJWTQXK8oe4bjQxOgFs=; b=mUbBKgVmevNlRPOtvc2+P3wdRG
	X34MPN1IZUJeSdEtWFXsHUIi3nfF0riZyG9LX9enoW++W6jZOErzqZ/wcnwCGc0TCz7ZsOkuFIC4e
	J3bO2BX6RIDsSGtSY1IhAeNEgt5wWt34r35EaBl2RSCcQvkjgtVxecCAqmN9vXnU8rj+tANtelUcv
	l6p15ImtqPLiWgb53YuYvN56r7c+Mom1d5qabk64XzqJmxpbbBVfiFgFdc/1cSbwUu8eCY6RUEX+e
	tykdxgZDmdbtItRdkpqmpYKZqPk5KWHpr754Ql4tkbZRJo8/1a7ObAHnB5GHTnE+8DOyn6fTE4riz
	ELAvf4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ctz-000000021TJ-0eu7;
	Mon, 21 Sep 2026 12:13:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ctx-000000021So-3JuM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:13:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3845343457;
	Mon, 21 Sep 2026 12:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BD91F000FF;
	Mon, 21 Sep 2026 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992821;
	bh=LjqV+TvColuL7thiwxFD+nBjPJWTQXK8oe4bjQxOgFs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=miLnFg2IaPJSF4LsGYJvDXYcjUcR8Vx3QjfQYwf1T319tiegKxUFgp3swWagkg1Jy
	 x2lZ3mAoBMS1XZgOkMU2cdheE12g7fNQeAviHRM++1wcdOCQWuGwlHIKW0V/xzGCRs
	 GDU3Qr/Nf2Mt0kmxM6EPK7xY2DiRMYwHT0lZ9+iQzwgKY+UxX84gTqEoE7UQMW5lTg
	 edYYQvkmbp7UQuKGKBImgSIXsTZedsCnqNv+e2KVtxPsGp5GYYVJt/K8aMIwDm0R4U
	 DcESYPLN8lNSPvMABmkfnYb3rcrU70kbcOO3fY/No32hgDfS0yPDz1fyxGKzGYLkbO
	 qNERqLjtrjb/g==
Subject: Re: [PATCH net] net: axienet: restart the TX queue after a DMA error reset
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, daniel@iogearbox.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Sep 2026 12:13:40 +0000
Message-ID: <178999282007.2160803.6952878199943822549@kernel.org>
In-Reply-To: <20260917121306.23499-1-maimon.sagi@gmail.com>
References: <20260917121306.23499-1-maimon.sagi@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 (2) · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The netif_wake_queue() added at the end of
  axienet_dma_err_handler() is not serialized against…
- [High] The unconditional netif_wake_queue() added at the end of
  axienet_dma_err_handler() can undo the TX stop that axienet_suspend()…
- [Medium] The added in-code comment in axienet_dma_err_handler() and the
  commit message assert a TX-watchdog failure that cannot happen in this…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  axienet_dma_err_handler() unmaps, frees and clears every TX descriptor…
- [High] This problem wasn't introduced by this patch, but
  axienet_dma_err_handler() performs a full AXI Ethernet core reset…
- [Low] Concern that the newly added unconditional netif_wake_queue() in
  axienet_dma_err_handler() re-enables transmission even when the…

--

net: axienet: restart the TX queue after a DMA error reset

The patch adds netif_trans_update() and netif_wake_queue() at the end of
axienet_dma_err_handler(), so that a queue stopped by axienet_start_xmit()
is restarted after the DMA error reset has reinitialised the descriptor
ring.  No Link: tags are present in the commit header.

A few questions below about the new wake and about the surrounding recovery
sequence.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 1722b7038f340..814d92fcb4fda 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2778,6 +2778,15 @@ static void axienet_dma_err_handler(struct work_struct *work)
>  	napi_enable(&lp->napi_rx);
>  	napi_enable(&lp->napi_tx);
>  	axienet_setoptions(ndev, lp->options);
> +
> +	/* The ring is empty again, so let the stack transmit.  The queue may
> +	 * have been stopped by axienet_start_xmit(); netdev_reset_queue()
> +	 * above clears only __QUEUE_STATE_STACK_XOFF, and nothing at all
> +	 * without CONFIG_BQL.  Refresh the transmit timestamp first, or the
> +	 * watchdog fires again on the next tick.
> +	 */

[Severity: Medium]
Can the watchdog actually fire for this device?  The comment says:

	 * without CONFIG_BQL.  Refresh the transmit timestamp first, or the
	 * watchdog fires again on the next tick.

and the commit message states it as a fact:

    The transmit timestamp is not refreshed either, so on a kernel with a
    TX timeout handler the watchdog condition stays true and the reset can
    be retried indefinitely.

Neither axienet_netdev_ops nor axienet_netdev_dmaengine_ops installs
.ndo_tx_timeout, and the driver never assigns ndev->watchdog_timeo
(a grep for both symbols in drivers/net/ethernet/xilinx/ matches only
xilinx_emaclite.c).  The core refuses to arm the timer in that case:

net/sched/sch_generic.c:netdev_watchdog_up() {
	if (!dev->netdev_ops->ndo_tx_timeout)
		return;
	...
}

So dev_watchdog() never runs for axienet and netif_trans_update() is a
timestamp store with no in-tree consumer.  The note below the --- line
mentions this depends on a separate TX timeout patch, but that note does
not reach git history, and the Fixes: tag invites a stable backport of a
watchdog retry loop no in-tree axienet can produce.  Could the comment and
the commit message be reworded to say the timestamp refresh is preparation
for a TX timeout handler rather than a fix for observed behaviour?

> +	netif_trans_update(ndev);
> +	netif_wake_queue(ndev);

[Severity: High]
Can this wake be lost, leaving the queue stopped for good?

axienet_dma_err_handler() runs in process context and never calls
netif_tx_disable() or netif_tx_lock_bh(), and it sleeps for tens of
milliseconds inside axienet_dma_stop().  An axienet_start_xmit() that
entered before the teardown can therefore finish after the worker has
reset the indices:

axienet_dma_err_handler()
	lp->tx_bd_ci = 0;
	lp->tx_bd_tail = 0;
	...
	netif_wake_queue(ndev);

axienet_start_xmit() then runs its own stop protocol:

	if (axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1)) {
		netif_stop_queue(ndev);

		/* Matches barrier in axienet_tx_poll */
		smp_mb();

If that netif_stop_queue() lands after the worker's netif_wake_queue(),
__QUEUE_STATE_DRV_XOFF is set again with nothing left to clear it.  The
only other wake is inside the 'if (packets)' branch of axienet_tx_poll():

		if (!axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1))
			netif_wake_queue(ndev);

and the commit message already explains axienet_free_tx_chain() cannot
return a non-zero packet count once the handler has zeroed every status
word.

The existing queue-state protocol is a two-party smp_mb() handshake
between axienet_start_xmit() and axienet_tx_poll(); this adds a third
writer from a different context that does not take part in it.  Would
quiescing the transmit path at the top of the handler (netif_tx_disable())
and waking at the end make the wake unloseable?

Related: lp->tx_bd_ci and lp->tx_bd_tail are written with plain stores by
the worker while axienet_start_xmit() reads them unlocked
(orig_tail_ptr = lp->tx_bd_tail) and WRITE_ONCEs them, so is the comment's
premise that "the ring is empty again" guaranteed to hold at the instant
of the wake?

[Severity: High]
Can this wake undo the transmit stop that suspend installed?

The worker checks lp->stopping only at its entry.  If a suspend starts
after that check:

axienet_suspend()
	netif_device_detach(ndev);

	rtnl_lock();
	axienet_stop(ndev);
	rtnl_unlock();

net/core/dev.c:netif_device_detach() {
	if (test_and_clear_bit(__LINK_STATE_PRESENT, &dev->state) &&
	    netif_running(dev)) {
		netif_tx_stop_all_queues(dev);
	}
}

axienet_stop() then sets lp->stopping and blocks:

		WRITE_ONCE(lp->stopping, true);
		flush_work(&lp->dma_err_task);
		...
		axienet_dma_bd_release(ndev);

The already-running worker reaches the new netif_wake_queue(), clearing
the DRV_XOFF that detach set and scheduling the qdisc.  Suspend calls
axienet_stop() directly without dev_deactivate(), so the qdisc is still
active, and the transmit path does not consult netif_device_present().
Can backlogged traffic then enter axienet_start_xmit() after flush_work()
returns, while axienet_stop() proceeds through napi_disable(),
axienet_dma_stop(), free_irq() and axienet_dma_bd_release(), so that the
in-flight transmit writes into lp->tx_bd_v as it is being dma_free'd and
kicks XAXIDMA_TX_TDESC on a torn-down engine?

Before this patch the detach-installed DRV_XOFF stayed set, so no xmit
could run.  Would re-checking lp->stopping (or netif_device_present())
before the wake close this?

[Severity: Low]
This isn't a bug introduced by this patch, but the hardware reset result
is discarded on this path.  __axienet_device_reset() returns -ETIMEDOUT
when the DMA reset bit never clears or PhyRstCmplt never arrives:

	if (ret) {
		dev_err(lp->dev, "%s: timeout waiting for PhyRstCmplt\n", __func__);
		goto out;
	}

but axienet_dma_stop() drops it:

	/* Do a reset to ensure DMA is really stopped */
	axienet_lock_mii(lp);
	__axienet_device_reset(lp);
	axienet_unlock_mii(lp);

so the handler cannot tell a recovered device from one still in reset, and
it unconditionally re-enables XAE_OPTION_TXEN via
axienet_setoptions(ndev, lp->options) just above the new wake.  The added
netif_wake_queue() does not make this worse - transmits already reached the
possibly-unreset engine in the common case where the queue was not stopped
when the error hit - but should axienet_dma_stop() propagate the reset
failure instead of returning void?

[Severity: High]
This is a pre-existing issue, but the ring teardown earlier in this same
handler has no exclusion against axienet_start_xmit(), which the commit
message acknowledges below the --- line.  The handler does, for every TX
descriptor:

		if (cur_p->skb)
			dev_kfree_skb_irq(cur_p->skb);
		cur_p->phys = 0;
		...
		cur_p->skb = NULL;

while the transmitter publishes the skb and then dereferences it:

	cur_p->skb = skb;
	...
	WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
	netdev_sent_queue(ndev, skb->len);

Disabling TX NAPI excludes completion processing, not ndo_start_xmit.  If
the worker frees that skb between the two, is the skb->len read a
use-after-free, and does the following tail publication plus
XAXIDMA_TX_TDESC kick submit descriptors whose mappings the worker already
released?

[Severity: High]
This isn't a bug introduced by this patch, but is the MAC fully
reprogrammed at the point where the queue is now woken?

axienet_dma_stop() runs __axienet_device_reset(), which resets the
Ethernet core, and the recovery sequence restores RCW1, IS/IE, FCC (FCRX
only), the MAC address, the multicast filter and lp->options.  It never
rewrites XAE_EMMC_OFFSET.  The only writer of the LINKSPEED field and of
the negotiated pause bits is axienet_mac_link_up():

	emmc_reg &= ~XAE_EMMC_LINKSPEED_MASK;
	...
	axienet_iow(lp, XAE_EMMC_OFFSET, emmc_reg);

and phylink will not call it again because the link state has not changed
(axienet_mac_link_down() is a no-op and the handler does not re-trigger
phylink).  axienet_options[] has no XAE_EMMC_OFFSET entry either, so
axienet_setoptions() cannot repair it.

On a 10/100 link, does the MAC keep its reset-default link speed after
this recovery while software still believes the negotiated rate is in
effect, so that the frames the new netif_wake_queue() lets through are
clocked at the wrong rate until an unrelated link flap re-runs
axienet_mac_link_up()?  The open path escapes this only because
axienet_open() runs phylink_start() after axienet_device_reset().

>  }
>  
>  /**

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917121306.23499-1-maimon.sagi%40gmail.com

