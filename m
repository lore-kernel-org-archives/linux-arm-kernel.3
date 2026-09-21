Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EF8C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0K2vgToZE2CglgABkp7jD6RfdHXj/wkxzKwvBvFmv9Y=; b=Biu52B3U6dYE+bf5ZWbKckllSu
	xD7OQK97tA0svcYGjZc5K3IiwvVuQp92U4mwmJtBi5aUhB3zi28uEfJWd7bfaz9WcfraADFqHZNnO
	NcrxO2FaveOmSUJFNLHjkrjmMS7nWyToND6BzELmsE1Pr+CC7Wcyx/n2kBNHEmR06HyadOCkBOAPg
	KHxrK4hK/h1pC7jr2lWzUrTWHATMlzstIsfrIyRjZCpvAkcHDLjLTNQiQlxJXj/2/SsHwoR8+rWHK
	GZewANfrGu1vLE8jjVTeLql1VZ8hy4wrlhmU+1ODSaQx/ZCeqSSSU0ExQkk6fY7OCy8NR2F1FKMG2
	MBnDYgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jw2-00000003G98-3Vna;
	Mon, 21 Sep 2026 19:44:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jw2-00000003G90-1gK4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:44:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C981A43F11;
	Mon, 21 Sep 2026 19:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA7D1F000FF;
	Mon, 21 Sep 2026 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790019857;
	bh=0K2vgToZE2CglgABkp7jD6RfdHXj/wkxzKwvBvFmv9Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kSlBuvtdV7wjqnb42jwSYMeukQpBTJYOBSu37+55tkiAe5NcNlpqNsUKmnLfJcg6L
	 koh5lny4XO0Fv5hAyDkpDAbQZ1Z/zkeerKzsHBpCfswn39R8pnBL0dDeXjEu1MntT3
	 Q1IX1iovCCrvjuCVo4uB9csr1WrN7C86m7ZReyZCRqb/gpiJx3rDANqSMhZ34a3WRp
	 843r4INLEX0Mn8IYHnlo3csFWhdukatT4m4xoIg+1Q1gzTLVOvi83IgIaUf6AU9RsE
	 5R7X99lEStaVqapc/mXjpXolOaQzFkoa7O/X3BowbSZpDcH7nArBTDbHAT9Nt25dzr
	 8F5TXXyxjxi9w==
Subject: Re: [PATCH] net: gemini: Free the shared queue after removing the ports
From: netdev-bot+sashiko@kernel.org
To: mhun512@gmail.com
Cc: linusw@kernel.org, ulli.kroll@googlemail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, ae878000@gmail.com
Date: Mon, 21 Sep 2026 19:44:16 +0000
Message-ID: <179001985660.2160803.5573342179556752795@kernel.org>
In-Reply-To: <20260917192835.58126-1-mhun512@gmail.com>
References: <20260917192835.58126-1-mhun512@gmail.com>
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

Critical: 0 · High: 1 (4) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The commit message states the goal of keeping the shared free
  queue from being "free[d] ... while a port or its threaded free-queue…

Pre-existing issues:
- [High] Stale free-queue state after a failed re-allocation:
  `geth_cleanup_freeq()`…
- [High] `gemini_port_remove()`
  (drivers/net/ethernet/cortina/gemini.c:2377-2384) calls…
- [High] `geth_cleanup_freeq()` force-drops every reference on the RX
  pages: `while (page_ref_count(gpage->page) > 0)…
- [High] `gemini_port_remove()`
  (drivers/net/ethernet/cortina/gemini.c:2377-2384) never clears the…

--

net: gemini: Free the shared queue after removing the ports

This moves ownership of the shared software free queue to the parent
device: the per-port remove callback no longer calls geth_cleanup_freeq(),
and gemini_ethernet_remove() depopulates its children first, masks the
free-queue interrupt, and only frees the queue if freeq_ring is set.

A few questions about the surrounding teardown paths below.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 2dd2fa801829c..498285caebe3d 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -2381,7 +2381,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
>  		unregister_netdev(port->netdev);
>  	}
>  	clk_disable_unprepare(port->pclk);
> -	geth_cleanup_freeq(port->geth);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but since the new
devm_of_platform_depopulate() call makes the parent drive this path, is the
ordering in gemini_port_remove() safe when the interface is still up?

phy_disconnect() runs before unregister_netdev():

	if (port->netdev) {
		phy_disconnect(port->netdev->phydev);
		unregister_netdev(port->netdev);
	}

phy_disconnect() -> phy_detach() clears the back pointer:

drivers/net/phy/phy_device.c:phy_detach() {
	...
		phydev->attached_dev->phydev = NULL;
		phydev->attached_dev = NULL;
	...
}

If the device is still IFF_UP, unregister_netdev() ->
unregister_netdevice_many_notify() -> netif_close_many() calls ndo_stop,
which is gmac_stop():

	phy_stop(netdev->phydev);

and phy_stop() dereferences it right away:

drivers/net/phy/phy.c:phy_stop() {
	struct net_device *dev = phydev->attached_dev;
	...
}

Can this oops on phy_stop(NULL) when a port is unbound (or the parent is
removed) while the interface is up?  Would calling unregister_netdev()
before phy_disconnect() avoid it?

[Severity: High]
This is a pre-existing issue, but the new depopulate sequence widens the
window: gemini_port_remove() never clears geth->port0 / geth->port1 (or
geth->initialized).  The port structure is netdev_priv() of a netdev
allocated on the child device with devm_alloc_etherdev_mqs(), so it is
released by the child's devres as soon as its remove() returns, while the
parent keeps the pointer.

geth_resize_freeq() then dereferences the sibling unconditionally:

	if (netdev->dev_id == 0)
		other_netdev = geth->port1->netdev;
	else
		other_netdev = geth->port0->netdev;

	if (other_netdev && netif_running(other_netdev))
		return -EBUSY;
	...
	if (other_netdev) {
		other_port = netdev_priv(other_netdev);
		new_size += 1 << (other_port->rxq_order + 1);

Does this read freed memory after unbinding one gemini-ethernet-port child
while the parent stays bound, and then bringing the surviving port up
(gmac_open() -> geth_resize_freeq()) or calling gmac_set_ringparam()?  The
rxq_order value read from the freed structure also feeds new_order, which
sizes the dma_alloc_coherent() ring and the freeq_pages array.  The same
half-removed state exists inside the new devm_of_platform_depopulate()
window, where one child's devres is already released while the other netdev
is still registered and openable.  Should gemini_port_remove() also clear
the parent's port0/port1 pointer?

>  
>  static void gemini_ethernet_init(struct gemini_ethernet *geth)

[ ... ]

> @@ -2673,7 +2672,10 @@ static void gemini_ethernet_remove(struct platform_device *pdev)
>  {
>  	struct gemini_ethernet *geth = platform_get_drvdata(pdev);
>  
> -	geth_cleanup_freeq(geth);
> +	devm_of_platform_depopulate(&pdev->dev);
> +	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> +	if (geth->freeq_ring)
> +		geth_cleanup_freeq(geth);
>  	geth->initialized = false;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but the new freeq_ring sentinel
relies on an invariant that the free path does not maintain.
geth_cleanup_freeq() frees both allocations and leaves the pointers stale:

	kfree(geth->freeq_pages);

	dma_free_coherent(geth->dev,
			  sizeof(*geth->freeq_ring) << geth->freeq_order,
			  geth->freeq_ring, geth->freeq_dma_base);

Only geth_setup_freeq()'s error path clears one of them:

	kfree(geth->freeq_pages);
err_freeq:
	dma_free_coherent(...);
	geth->freeq_ring = NULL;
	return -ENOMEM;

so after a failed re-allocation freeq_pages still points at the kfree()d
array and num_freeq_pages keeps the new count.  geth_resize_freeq() then
re-arms the interrupt without looking at ret:

	ret = geth_setup_freeq(geth);
	...
	en |= SWFQ_EMPTY_INT_BIT;
	writel(en, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);

and because freeq_order was already set to new_order before the failed
setup, every later call returns early:

	if (geth->freeq_order == new_order)
		return 0;

Does that leave the interface openable with no free queue while the
free-queue interrupt is armed, so gemini_port_irq_thread() ->
geth_fill_freeq() reads the freed array:

		gpage = &geth->freeq_pages[pn];
		page = gpage->page;

and geth_freeq_alloc_map_page() writes through the NULL freeq_ring?  Would
it make sense for geth_cleanup_freeq() to clear freeq_ring, freeq_pages and
num_freeq_pages so the new "if (geth->freeq_ring)" test actually reflects
allocation state?

[Severity: High]
This is a pre-existing issue, but it is the cleanup the patch now calls
after unregistering the children.  geth_cleanup_freeq() force-drops every
reference on the RX pages:

		gpage = &geth->freeq_pages[pn];
		while (page_ref_count(gpage->page) > 0)
			put_page(gpage->page);

Those pages are handed to the stack as SKB fragments in gmac_rx():

		skb_fill_page_desc(skb, frag_nr, page, page_offs, frag_len);

and geth_fill_freeq() explicitly avoids reusing entries whose page is still
referenced elsewhere:

		if (page_ref_count(page) > 1) {

Can this loop drop references owned by live SKBs, returning the page to the
allocator while an SKB queued in a socket or in GRO still maps it?
Unregistering the netdevs first drains NAPI, but does it end the lifetime of
SKBs already delivered to sockets?

[Severity: High]
The commit message says the goal is to avoid "free[ing] the queue while a
port or its threaded free-queue IRQ handler still uses it", but is that true
for the other free site?

geth_resize_freeq() performs the identical free, protected only by masking
the enable bit:

	spin_lock_irqsave(&geth->irq_lock, flags);
	en = readl(geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
	en &= ~SWFQ_EMPTY_INT_BIT;
	writel(en, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
	spin_unlock_irqrestore(&geth->irq_lock, flags);

	/* Drop the old queue */
	if (geth->freeq_ring)
		geth_cleanup_freeq(geth);

geth_cleanup_freeq() holds neither freeq_lock nor irq_lock and there is no
synchronize_irq().  Since gemini_port_irq() masks the same bit itself and
returns IRQ_WAKE_THREAD, an already-dispatched gemini_port_irq_thread() ->
geth_fill_freeq() can run concurrently, take only geth->freeq_lock (a lock
the cleanup path never takes), walk the freed freeq_ring[]/freeq_pages[],
and then re-enable the interrupt the resize path just masked.

The freeq threaded IRQ is registered at probe independent of netif state, so
can this race be hit on a sibling port's gmac_open() or on
gmac_set_ringparam() for a down port, leaving the bug the commit claims to
close still reachable?  Should the resize path get the same drain treatment,
or should the queue free be serialized against freeq_lock?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917192835.58126-1-mhun512%40gmail.com

