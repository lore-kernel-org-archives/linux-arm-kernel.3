Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765CDC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 01:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fc/KEcEpePX8jQDme+fWQ04KtaWAl60QQBLlVHiy7uw=; b=XzZRsM2CWw+JTXTsCHfb9jPteI
	bcwBn+Y/FVKJ4UP7Tp4uifEpiCbgKnQRGM0EbTXkEvIXy+V8+R6kjhuw5nJ/Wdv9NwWpQq5t521hs
	D85Xp+gbw/b81FqxLCoSf+J+nEVMDXdFfZxZKKp3mPv1VmsXwACThREcf/qukG2H64Za3PGsfma9R
	UJlZOXhvaT/O4PArhB6NJ9qBBwFeHGPSOc3m7iOLHqa/unOyghO5jehCp2/W969vN0OW6btPhPEmD
	4edTUZuv64uTp2JB9Cl0LW/lxcbTaZJ8MZ/CcPOw8GOhQeoj7jFGjFIESiHmm2hh+rD3yGV0XHOGT
	1cOOIRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6eHy-000000089Rq-0SSo;
	Wed, 16 Sep 2026 01:18:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6eHv-000000089Rk-4BBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 01:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4900743A19;
	Wed, 16 Sep 2026 01:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BCD1F000FF;
	Wed, 16 Sep 2026 01:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789521495;
	bh=Fc/KEcEpePX8jQDme+fWQ04KtaWAl60QQBLlVHiy7uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FNtgh9fDxH8JeM8YBWXHATb5KHD5TagJYZLPIxf0lhUydsQ3+FHSIPB61e1Ye2uzJ
	 qjTSn36WE/iNZ0+l12XZguvkY+BHcIDKhSokDiUyZBF8aPAUnwA0hjSTMp5grSS+uf
	 m4cV6t3ZGjrDveXPdhRkeveX9/Hrs2eMVF/pt1DY9P8WfSeyZjHCJ7fshRt2XaHaz/
	 w/ViKNEQigfGPi2AB0UPbJK7VrTxSg9aQu7KQWyE2/aqvir/szxt1dlDjZxzF/45f9
	 yL+MqWZ+DQSFEgcdbXrQFwxlGpBcXxX94VjpKqB0uORPXNiCZouNuKeBXfxaM15AY9
	 VMwRfTNwAjJww==
From: Jakub Kicinski <kuba@kernel.org>
To: suraj.gupta2@amd.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	radhey.shyam.pandey@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop
Date: Tue, 15 Sep 2026 18:17:38 -0700
Message-ID: <20260916011737.1638482-2-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910141946.3017164-1-suraj.gupta2@amd.com>
References: <20260910141946.3017164-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Let's fix what AI is pointing out in another patch in the same series?
Or please explain in the commit msg why the issue is not real,
I'm not very familiar with the DMA engine API, TBH.

AI review:
---
net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop

This adds clearing of the ring slot skb pointer in the TX and RX dmaengine
completion callbacks, and makes axienet_stop() walk the TX and RX rings
after terminating the channels to unmap and free any slot that still has a
non-NULL skb, instead of only kfree()ing the ring shells.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 1722b7038f340..7828fbb09dc87 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -1171,6 +1172,7 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  						       &meta_max_len);
>  	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
>  			 DMA_FROM_DEVICE);
> +	skbuf_dma->skb = NULL;
>  
>  	if (IS_ERR(app_metadata)) {
>  		if (net_ratelimit())

> @@ -1752,16 +1754,40 @@ static int axienet_stop(struct net_device *ndev)
>  		free_irq(lp->rx_irq, ndev);
>  		axienet_dma_bd_release(ndev);
>  	} else {
> +		struct skbuf_dma_descriptor *skbuf_dma;
> +
>  		dmaengine_terminate_sync(lp->tx_chan);
>  		dmaengine_synchronize(lp->tx_chan);
>  		dmaengine_terminate_sync(lp->rx_chan);
>  		dmaengine_synchronize(lp->rx_chan);
>  
> -		for (i = 0; i < TX_BD_NUM_MAX; i++)
> -			kfree(lp->tx_skb_ring[i]);
> +		/* dmaengine_terminate_sync() aborts the descriptors still owned
> +		 * by the DMA engine without running their completion callbacks.
> +		 * A ring slot owns a live, DMA-mapped SKB iff its skb pointer is
> +		 * non-NULL (the callbacks clear it on completion), so unmap and
> +		 * free those here. Otherwise every outstanding TX/RX SKB and its
> +		 * DMA mapping is leaked on ifdown.
> +		 */

[ ... TX ring loop snipped ... ]

> +
> +		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++) {
> +			skbuf_dma = lp->rx_skb_ring[i];
> +			if (skbuf_dma && skbuf_dma->skb) {
> +				dma_unmap_single(lp->dev, skbuf_dma->dma_address,
> +						 lp->max_frm_size, DMA_FROM_DEVICE);
> +				dev_kfree_skb_any(skbuf_dma->skb);
> +			}
> +			kfree(skbuf_dma);
> +		}
>  		kfree(lp->rx_skb_ring);
>  
>  		dma_release_channel(lp->rx_chan);

[Severity: High]

Is the invariant described in the comment, "A ring slot owns a live,
DMA-mapped SKB iff its skb pointer is non-NULL", guaranteed to hold once
the terminate calls have returned?

axienet_dma_rx_cb() re-arms the RX channel unconditionally at the end of
every completion, with no check against a stopping flag or
netif_running():

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_rx_cb() {
	...
rx_submit:
	for (i = 0; i < CIRC_SPACE(lp->rx_ring_head, lp->rx_ring_tail,
				   RX_BUF_NUM_DEFAULT); i++)
		axienet_rx_submit_desc(lp->ndev);
	dma_async_issue_pending(lp->rx_chan);
}

Note lp->stopping is only set in the !lp->use_dmaengine branch of
axienet_stop(), so it does not fence this path.

The callback runs from the provider tasklet with chan->lock dropped, so it
can run on another CPU while axienet_stop() is between the terminate and
the free loop:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_chan_desc_cleanup() {
	...
	spin_unlock_irqrestore(&chan->lock, flags);
	dmaengine_desc_get_callback_invoke(&desc->async_tx, &result);
	spin_lock_irqsave(&chan->lock, flags);
}

If the callback wins that race, axienet_rx_submit_desc() maps a fresh
buffer, installs it in the slot and submits it:

	skbuf_dma->skb = skb;
	skbuf_dma->dma_address = sg_dma_address(skbuf_dma->sgl);
	skbuf_dma->desc = dma_rx_desc;
	...
	lp->rx_ring_head++;
	dmaengine_submit(dma_rx_desc);

and xilinx_dma_tx_submit() queues it and clears the provider's guard:

	append_desc_queue(chan, desc);
	...
	chan->terminating = false;

The following dma_async_issue_pending() then restarts the channel.
dmaengine_synchronize() is only tasklet_kill() here:

drivers/dma/xilinx/xilinx_dma.c:
static void xilinx_dma_synchronize(struct dma_chan *dchan)
{
	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);

	tasklet_kill(&chan->tasklet);
}

so it waits for the callback to return but does not abort the descriptor the
callback just submitted.

In that case the new RX loop sees skbuf_dma->skb != NULL for that slot and
performs dma_unmap_single() plus dev_kfree_skb_any() on a buffer the engine
still owns.  Can this let the hardware write into a freed, unmapped skb, or
trigger an IOMMU fault?

There is also the ordering of kfree(lp->rx_skb_ring) before
dma_release_channel(lp->rx_chan).  If the late descriptor completes in that
window, axienet_dma_rx_cb() does:

	skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
	skb = skbuf_dma->skb;

Is that a use-after-free of lp->rx_skb_ring?

Before this change the same window only leaked the buffer.  Would it make
sense to fence resubmission first, for example by setting the stopping flag
for the dmaengine path before the terminate calls and checking it in
axienet_dma_rx_cb() before the rx_submit loop, and to release the channels
before freeing the rings?

Note also that dmaengine_terminate_sync() already ends with
dmaengine_synchronize(), so the explicit dmaengine_synchronize() calls that
follow it here are redundant, though harmless.
-- 
pw-bot: cr

