Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09013C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmAUpyL8zz8kuHDd9d/+aHBvbVJnej1uVNgN9e4kMlo=; b=CvBK0dyj1+D+XU9kKnP0gJXZ0g
	vnInvs9ME11lz94RLh2xkegO6Bx7yWaYMi+c64Hw8VgRwT90+kEIagv8xfovfn1XMNEAATreQoIAR
	iXrpD9xuePQJOTuaFSljbWSzeq0xxSL9ingV1NFQGM6853pCsXdnb3+Ril1qIbDKn/Xj0zlsF43WO
	GCkpgHirXacNHn0WvuHY9RjQHlqA/cQSSjJ5LGkxH3rNQzaN9s8s0yD/up+0nl5G3CGvwWHrb/jUm
	smgLRrEXYzPVJOgzyajkE+hHmUU2fO4bQDaZlKrSPxp7Roz9PfQy05mdTdtdG/QqG1VteZs0NalKb
	BUkc1k1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Lg-0000000DUWE-1Hu1;
	Fri, 25 Sep 2026 13:52:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Lf-0000000DUVs-1gMO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9A16022F;
	Fri, 25 Sep 2026 13:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7661F000FF;
	Fri, 25 Sep 2026 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344342;
	bh=XmAUpyL8zz8kuHDd9d/+aHBvbVJnej1uVNgN9e4kMlo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ilQGJYzajpyZtBUZTmma8ZmROziK6Vc+sTs+GD9T4zqOtjyQrvRfMmLU9gAKDL+9m
	 i73nkcUxQwSXDGGKZnjOG19jTt+Ia3X7ZjfqLqZ3DjkZ1gtI0Jdf7Y2Ptvx6zRFRup
	 Vksp1LtnhVhP2OQWgKecFZL3QjELnFn/CjEPD0gnIrUlwzuzSLX61pWhQytXmZaO79
	 6/9923oFniELnNu42ghxbkL8+5emfr9SyOo5NBj9s3kHl1U3r+XL8xZpHdzrrLqqvo
	 CPyF0qznquzJN1ZoEmGhTdycBXD8S5YjG8OtcCJQk3FWJ8IifQ/S9by4MrHssS7KBM
	 4bgFFxv285K0w==
Subject: Re: [PATCH net v3] net: axienet: bound TX completion cleanup by the
 NAPI budget
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robert.hancock@calian.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 13:52:21 +0000
Message-ID: <179034434119.2160803.4103857237545092058@kernel.org>
In-Reply-To: <20260924135052.185129-1-maimon.sagi@gmail.com>
References: <20260924135052.185129-1-maimon.sagi@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new budget break in axienet_free_tx_chain() (line 801)
  leaves completed descriptors in lp->tx_bd_v.
- [Low] Wrong Fixes: tag.
- [Low] The kernel-doc for axienet_tx_poll() no longer matches its
  behaviour.

--

net: axienet: bound TX completion cleanup by the NAPI budget

This patch stops the TX completion loop in axienet_free_tx_chain() once
the NAPI budget has been used up. The check is skipped on the force path.
A budget of 0 is treated as no limit, and axienet_tx_poll() now returns
0 for a budget of 0, so the netpoll WARN_ONCE() in poll_one_napi() is not
triggered.

> Fixes: 9e2bc267e780 ("net: axienet: Use NAPI for TX completion path")

[Severity: Low]
Is this the right commit for the Fixes: tag?

In 9e2bc267e780, axienet_tx_poll() passed budget as nr_bds, and the
helper returned i, the number of descriptors walked:

    axienet_free_tx_chain(lp, lp->tx_bd_ci, budget, false, &size, budget)

That return value is bounded by budget. With a netpoll budget of 0 the
loop runs zero times, so poll_one_napi() could not warn either.

The call that passes lp->tx_bd_num and returns a packet count comes from
5a6caa2cfabb ("net: xilinx: axienet: Fix packet counting"). git blame on
the baseline points there:

    packets = axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num, false,
                                    &size, budget);

Should the tag be the following instead?

    Fixes: 5a6caa2cfabb ("net: xilinx: axienet: Fix packet counting")

The sentence "which the unbounded loop could already do before this
change" also describes the loop added by 5a6caa2cfabb.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 782f903d318f3..7fd77f8cb57c6 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -788,6 +792,16 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>  	dma_addr_t phys;
>  
>  	for (i = 0; i < nr_bds; i++) {
> +		/* A NAPI poll must not return more than its budget.  Stop on a
> +		 * packet boundary once it is spent - cur_p->skb is only set on
> +		 * a packet's last descriptor, so no packet is left half-freed.
> +		 * A zero budget means no limit: netpoll polls with a budget of
> +		 * 0 to reclaim the TX path, so the ring must still be drained;
> +		 * axienet_tx_poll() reports no work to it.
> +		 */
> +		if (!force && budget && packets >= budget)
> +			break;

[Severity: Medium]
Can this break leak the TX skbs and DMA mappings still in the ring when
the interface is brought down?

Completed descriptors left behind after the break still have cur_p->skb
set and a live dma_map_single() mapping. The commit message relies on
NAPI rescheduling the poll to reclaim them. That does not happen while
napi_disable() is pending.

axienet_stop() calls napi_disable(&lp->napi_tx) while TX DMA is still
running. If the TX poll finds more than budget completions, it returns
budget, and __napi_poll() takes this branch:

net/core/dev.c:__napi_poll() {
    ...
	if (unlikely(napi_disable_pending(n))) {
		napi_complete(n);
		return work;
	}
    ...
}

Nothing polls again after that, and axienet_stop() continues:

axienet_stop()
  napi_disable(&lp->napi_tx)
  axienet_dma_stop(lp)
  free_irq(lp->tx_irq, ndev)
  axienet_dma_bd_release(ndev)
    dma_free_coherent(lp->dev,
                      sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
                      lp->tx_bd_v, lp->tx_bd_p)

axienet_dma_bd_release() does not unmap the TX buffers or free
tx_bd_v[i].skb. The only TX ring skb cleanup loop is in
axienet_dma_err_handler(), and the normal stop path does not run it. The
remaining skbs are never freed. Their sk_wmem_alloc charge is never
released, and their streaming DMA mappings are leaked.

Before this patch, a poll running during napi_disable() drained every
descriptor completed by then. ndo_stop already had no TX reclaim for
descriptors still in flight, so that gap predates this patch. The budget
break adds a new way to hit it.

Would it work to drain the ring without the budget bound and clamp only
the return value? Another option is to reclaim all TX descriptors in
axienet_stop() or axienet_dma_bd_release().

[ ... ]

> @@ -1027,7 +1041,11 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
>  		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
>  		spin_unlock_irq(&lp->tx_cr_lock);
>  	}
> -	return packets;
> +
> +	/* netpoll polls with a budget of 0 to reclaim the TX path and expects
> +	 * no work to be reported; see poll_one_napi().
> +	 */
> +	return budget ? packets : 0;
>  }

[Severity: Low]
Should the kernel-doc above axienet_tx_poll() be updated too? It still
says:

 * @budget:	Max number of TX packets to process.
 *
 * Return: Number of TX packets processed.

With this patch a budget of 0 means no limit. For that case the function
returns 0 even after it has reclaimed packets and passed them to
netdev_completed_queue() and the u64 stats.

The new @budget text for axienet_free_tx_chain() also contradicts itself.
It first says 0 is used "when not called from NAPI poll", then says
"netpoll polls with it". The netpoll call is a NAPI ->poll() call, since
poll_one_napi() calls napi->poll(napi, 0).

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924135052.185129-1-maimon.sagi%40gmail.com

