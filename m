Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A891C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjgLSw2MeL5vGjW/rbVSbpNes7RvuqTBrpBub5QjU2E=; b=bNo1bTDboK0tTxR7keQ8A2FsKT
	qVp9RXLukmuvUVgx8S67Iwu8X7dpq450qrJAfpMwSNiD3RZGIJdvDKQWa3/yWU+pOc66KD+aEGZLH
	lZ6PUJrFHQ6YxQ/N1VFaSNNyhu1pnFwj5GQAqVArzFhGuP9pWrpVsJHlYogBI7M9QprUyrfyxGY3Q
	CAlNXM5NoBwtJaBZMsSzXzuN2mGEn+Y5Q6rUONsIPi30IjvIldXH6FUw2bW36/CYlGG42gaUwBbu8
	uqZNavdnwd203eFaBcwGTeXlHgKvxguHhB7EBn4M0K6oaMrWams/7HnwYat0Ol7GbIWcVkt1kBzFx
	qdR0DRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6o9G-0000000973c-3CQF;
	Wed, 16 Sep 2026 11:49:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6o9F-0000000973R-0Ald
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:49:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB6EF4082A;
	Wed, 16 Sep 2026 11:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DCB1F000FF;
	Wed, 16 Sep 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789559396;
	bh=LjgLSw2MeL5vGjW/rbVSbpNes7RvuqTBrpBub5QjU2E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V5d9o3/Q56q/nqPu66WlLzFTSH6eWM2fvDyPPX8s53fRCK2Q4O8mXKdFR0+sbs4IM
	 2Uwtw0HbQW92rHuVl1BRdMmS+JBi+A53ws4jhb/0x8xMqEmbrJRf1ez2/gq+XxywCD
	 sX0MDaUpqS4H6oIy3MWelsBGsGl3NISxAI19FIlqC/bHydqGRsQbF4m/Ge31FLNRqo
	 i93OKRE2fMcVSlBPlRY6NsueMZQiQDCdiSR0GDDp/8Gg/gaWIhL75hrID+CApdizns
	 VfNMFIbiltLrr+zVODBlxTccoWGyG6MiEPtm8myDzVO+ORhK8XGt/eg9J6VtSngcQX
	 FKcxG7AGCUPOA==
Subject: Re: [PATCH net] net: axienet: bound TX completion cleanup by the NAPI budget
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
 robert.hancock@calian.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 11:49:55 +0000
Message-ID: <178955939540.22033.11518643324722820075@kernel.org>
In-Reply-To: <20260914114821.55503-1-maimon.sagi@gmail.com>
References: <20260914114821.55503-1-maimon.sagi@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 · Low: 1

- [High] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:795 — the
  newly added `if (!force && packets >= budget) break;` is evaluated at…
- [Low] The kernel-doc block of axienet_free_tx_chain()
  (drivers/net/ethernet/xilinx/xilinx_axienet_main.c:768-781) was not…

--

net: axienet: bound TX completion cleanup by the NAPI budget

This adds a break in axienet_free_tx_chain() so the TX completion loop
stops once the NAPI budget has been spent, instead of being bounded only
by the TX ring size.  The check is skipped when @force is set.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 1722b7038f340..4381643227139 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -788,6 +788,13 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>  	dma_addr_t phys;
>  
>  	for (i = 0; i < nr_bds; i++) {
> +		/* A NAPI poll must not return more than its budget.  Stop on a
> +		 * packet boundary once it is spent - cur_p->skb is only set on
> +		 * a packet's last descriptor, so no packet is left half-freed.
> +		 */
> +		if (!force && packets >= budget)
> +			break;
> +

[Severity: High]
What happens on this path when budget is 0 and force is false?  The test
is evaluated before any descriptor is looked at, and 0 >= 0 is true, so
the loop breaks at i == 0.

netpoll calls the poll function with a budget of exactly 0:

net/core/netpoll.c:poll_one_napi() {
	...
	/* We explicitly pass the polling call a budget of 0 to
	 * indicate that we are clearing the Tx path only.
	 */
	work = napi->poll(napi, 0);
	...
}

lp->napi_tx is registered with netif_napi_add() in axienet_probe(), so it
is on dev->napi_list and poll_napi() reaches axienet_tx_poll(), which
forwards the budget unchanged with force = false:

	packets = axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num, false,
					&size, budget);

With the new break taken at i == 0, does this turn the netpoll TX reclaim
into a no-op?  No dma_unmap_single() or napi_consume_skb() runs, and
lp->tx_bd_ci += i leaves the consumer index unchanged.

Since packets is then 0, axienet_tx_poll() also skips the if (packets)
block containing netdev_completed_queue() and netif_wake_queue(), and
packets < budget (0 < 0) is false, so napi_complete_done() and the
re-write of lp->tx_dma_cr that re-enables TX completion interrupts are
skipped too.

Can this stall netconsole/kgdboe output when interrupts are disabled, for
example during an oops, where the TX completion interrupt and the NAPI
softirq will never run?  Ring-full detection depends only on software
clearing cur_p->cntrl:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_check_tx_bd_space() {
	...
	if (cur_p->cntrl)
		return NETDEV_TX_BUSY;
	...
}

and cur_p->cntrl is cleared solely by axienet_free_tx_chain(), so
netif_xmit_stopped(txq) stays true and __netpoll_send_skb()'s bounded
retry loop, which calls netpoll_poll_dev() to "tickle device maybe there
is some cleanup", exhausts its tries with the skbs still pinned on the
ring.

Before this patch the same call cleaned every completed descriptor, with
budget only used as the napi_consume_skb() bulk-free hint, and
napi_consume_skb(skb, 0) degrades to dev_consume_skb_any().

Would it work to make budget 0 mean "clean everything, report no work",
for instance:

	if (!force && budget && packets >= budget)
		break;

or alternatively leave the loop unbounded and clamp the value returned by
axienet_tx_poll() to the budget?

The commit message reasons about budget 0 only for the force path:

  "The check is skipped on the @force path, which cleans up
   after a DMA mapping failure with a @budget of 0."

Could the netpoll caller be covered as well, since it uses budget 0 with
force = false?

[Severity: Low]
Should the kernel-doc block just above axienet_free_tx_chain() be updated
in the same patch?  It still reads:

 * @nr_bds:	Max number of descriptors to clean up
 ...
 * @budget:	NAPI budget (use 0 when not called from NAPI poll)

@nr_bds is no longer the only cleanup bound for the !force path, and
@budget is no longer just a napi_consume_skb() hint.  A caller that
follows the documented advice of passing 0 outside NAPI poll with
force = false now reclaims nothing and does not advance lp->tx_bd_ci.
Could the @budget line state that cleanup stops after @budget completed
packets when @force is false?

>  		cur_p = &lp->tx_bd_v[(first_bd + i) % lp->tx_bd_num];
>  		status = cur_p->status;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914114821.55503-1-maimon.sagi%40gmail.com

