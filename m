Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568E3CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8TejqfIZEXjHrTsJ/7Fvs/0Ztw1Ie0aEXTMD/PuGEA=; b=u8kz6cZgHcCPGll+6TRBV+pV8a
	+XTKign7hWZu4i1LBhFmPpVu7Er9LoypIVIgEYX6IScLDHzyQf6o66O1NZuJEbNTWPWubzxOm8uip
	VlqkUfkfTuCDK8eqGLOAPAZ+4im1MyDAXkbv6CnX5Rr0Qr3AhlhhxBX/nYHjQzdgHem04cwO95zvG
	7ZWozvO5pcQzY5j4CpisUsebuhkdMDjBn3hKpZp9lK4mXz4ObIRQahTzEhULVrK+OM5kLWl6WGa9U
	CRxIv7VcgRGMIBXo3YFdIWWR82PU/2xJJtHduFA95SBNEAggOBvaBfzxmTfrA4uuSaEhcTeOmUXPn
	YRI7v4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtW-0000000Ex3a-1Jid;
	Mon, 15 Jun 2026 23:39:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtO-0000000EwzK-23ys
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:38:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE82C6008A;
	Mon, 15 Jun 2026 23:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B378A1F00A3A;
	Mon, 15 Jun 2026 23:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566737;
	bh=a8TejqfIZEXjHrTsJ/7Fvs/0Ztw1Ie0aEXTMD/PuGEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FSLgP3u0As7J28bw0zEtsu5W82TvwySmTMKe/QdElfDsbosAISEek6WrfbNcevFck
	 Lcn+nd8PZJO19DDcbGAWOBKph5bp7H6EGXzAA8rBNJnu0HD7p6foW72FVm1DY6VuFk
	 hdKB0hBtUgt8a86yehidT9FaG/eX497A+bRQYZEXddHCqYHfIHcwzGqP5KrbV5L5Qg
	 52lU1KIzTJi+qf68QEu3ar7hD0EJQPRCb6XibV2HLRUwQM+6M+ijpdn75+Q/s7pRRj
	 fYpx4fuPuRkxvWYtnlTR1iTwgqleE8AHPOZ49DwVPp+wFkzc51tonaspyGWCFl+VNU
	 bhgexD8mNhS0w==
From: Jakub Kicinski <kuba@kernel.org>
To: jensemil.schulzostergaard@microchip.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	daniel.machon@microchip.com,
	Steen.Hegelund@microchip.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next 9/9] net: sparx5: add neighbour event handling for L3 routing
Date: Mon, 15 Jun 2026 16:38:55 -0700
Message-ID: <20260615233855.1042401-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-sparx5_l3_routing-v1-9-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-9-fc3c10160f49@microchip.com>
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: sparx5: add neighbour event handling for L3 routing

Register a netevent notifier to handle NETEVENT_NEIGH_UPDATE events.
This completes the L3 unicast forwarding data path by updating hardware
ARP table entries and linked nexthops when neighbours are resolved.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c

[ ... ]

> @@ -2525,6 +2525,104 @@ static int sparx5_rr_fib_event(struct notifier_block *nb, unsigned long event,
> +static void sparx5_rr_neigh_event_work(struct work_struct *work)
> +{

[ ... ]

> +	if (entry->connected && entry_connected &&
> +	    ether_addr_equal(entry->hwaddr, hwaddr))
> +		goto out_mutex;
> +
> +	ether_addr_copy(entry->hwaddr, hwaddr);
> +	sparx5_rr_neigh_entry_update(sparx5, entry, entry_connected);

[Severity: High]
Does this code risk re-offloading an orphaned neighbour entry with a stale
VMID?

When a subnet route is deleted, the fib_entry is destroyed. This unlinks the
neigh_entries, sets neigh_entry->fib_entry to NULL, and un-offloads them.
However, if another nexthop still references this neighbour,
sparx5_rr_neigh_entry_put() skips destruction.

The interface's router leg might then be destroyed, freeing its VMID for
reuse.

If an ARP update arrives later, this code finds the orphaned neigh_entry and
calls sparx5_rr_neigh_entry_update() to offload it again. This could apply a
hardware VCAP rule using the potentially reassigned VMID.

Also, because this sets vrule_id_valid to true, when the referencing nexthop
is eventually deleted, sparx5_rr_neigh_entry_put() will refuse to destroy it.
Since fib_entry is NULL, it won't be found during module unload, permanently
leaking the memory and the netdevice tracker reference.

> +	sparx5_rr_nexthops_update_notify(sparx5, entry, entry_connected);
> +	if (!entry_connected)
> +		sparx5_rr_neigh_entry_put(sparx5, entry);
> +
> +out_mutex:
> +	mutex_unlock(&sparx5->router->lock);
> +out:
> +	neigh_release(n);
> +	kfree(net_work);
> +}

[ ... ]

> +static int sparx5_rr_netevent_event(struct notifier_block *nb,
> +				    unsigned long event, void *ptr)
> +{

[ ... ]

> +	switch (event) {
> +	case NETEVENT_NEIGH_UPDATE:
> +		n = ptr;
> +
> +		if (n->tbl->family != AF_INET && n->tbl->family != AF_INET6)
> +			return NOTIFY_DONE;
> +
> +		port = sparx5_port_dev_lower_find(n->dev);
> +		if (!port)
> +			return NOTIFY_DONE;
> +
> +		net_work = kzalloc_obj(*net_work, GFP_ATOMIC);
> +		if (!net_work)
> +			return NOTIFY_BAD;

[Severity: High]
Could returning NOTIFY_BAD on allocation failure interrupt the global
notification chain?

The NETEVENT_NEIGH_UPDATE event is broadcast to all registered listeners via
the netevent_notif_chain atomic notifier chain. Returning NOTIFY_BAD from the
notifier callback prematurely aborts the chain traversal.

If this allocation fails, it appears this driver will silently prevent all
subsequent subsystems and drivers from receiving the neighbour update, which
might cause system-wide stale ARP/NDP caches.

Should this return NOTIFY_DONE instead?

> +
> +		INIT_WORK(&net_work->work, sparx5_rr_neigh_event_work);
> +		net_work->sparx5 = router->sparx5;
> +		net_work->neigh = neigh_clone(n);

