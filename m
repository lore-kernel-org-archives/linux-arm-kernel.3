Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CBCCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eS+NwR91Hkmm18M+nsKO2Y244NFaHIMfanAPyooegnU=; b=J65r6QxHoFcrd6iED71vLsL2tA
	poNC7/WC4in1O6mX8NvyOvA6Y2xM9pPPNnyyM4ENOlnik4RlPo1ads1MGa4oN/XYYCTOXpzTP3G4c
	2Pw5xYU74Eq/nWYYUb2E2Fn5oMOnzvfIq0BwRqYGApiNJoxnEvGRrtzut0dlIcdyzaM7ZHF0mykai
	sZz0+dX0lZuZuxPuZlyuQb9FJgKba8iLev7UGYksON8Zh0tDw7ZpG3JpkdkmGVWeOwwJJ7t87u3xS
	At02xH5IvmCQu8pxo+XPUFBLltA21Ke5loDtnp2Wzi3VzSCbf2ELwXRel9WtYEjo4O3WJieMWQnL8
	Arilkx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtJ-0000000EwwU-3uza;
	Mon, 15 Jun 2026 23:38:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtI-0000000Ewvg-3i2K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C71D42E0C;
	Mon, 15 Jun 2026 23:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9835D1F00A3A;
	Mon, 15 Jun 2026 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566732;
	bh=eS+NwR91Hkmm18M+nsKO2Y244NFaHIMfanAPyooegnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CyRu2n6w+7LIYU32FnB97O2VbcDfLtYUvT1Mx/W7SsBhrIp+9kgODMcE4p5Pi4nC7
	 92Otwb1SE61Cf2XR6PDQUDPZtpKG5fd7KU3u4D7cWhRj8KonRyedUbuD6uNtCTael3
	 xhv4GPoNQahewJdkSeOryN+5oIrXREdJLZGBv7JSoiGojyG3nY6iDcSkaP4wBkdv7q
	 sylXtGG+I3iAK9Es4xkNn7d5bz9LIEKeU5rBcZfJ84vZxCfHq9AglCdwwbSE9iH8oa
	 zXMxsJX2nJanEcNxqVvuYaRVd0JHHtimfLyZj0KX0RJ09+A85tLHYJOapJadITygul
	 W8vrn9dy34gOg==
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
Subject: Re: [PATCH net-next 7/9] net: sparx5: add L3 router infrastructure and leg management
Date: Mon, 15 Jun 2026 16:38:50 -0700
Message-ID: <20260615233850.1042323-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-sparx5_l3_routing-v1-7-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-7-fc3c10160f49@microchip.com>
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
Subject: net: sparx5: add L3 router infrastructure and leg management

This commit adds L3 router infrastructure and leg management to the
Microchip Sparx5 switch driver. It handles netdevice and inetaddr events
to intercept VLAN uppers of a bridge device, associating them with router
legs (VMIDs) for hardware offloading.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
> new file mode 100644
> index 0000000000000..03923d91fdfb8
> --- /dev/null
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c

[ ... ]

> +static void sparx5_rr_inet6_make_mask_le(int logmask, u8 *mask)
> +{
> +	/* Caller must ensure 0 <= logmask <= 128 */
> +	int rem, byte_prefix = logmask;
> +
> +	rem = do_div(byte_prefix, BITS_PER_BYTE);

[Severity: High]
Will this do_div() call cause a build failure or stack corruption?

The do_div() macro expects a 64-bit unsigned integer for the dividend. Passing
byte_prefix, which is a 32-bit int, causes a compiler error on architectures
like x86. On architectures like ARM, it can overwrite stack memory since the
macro assumes the pointer points to a 64-bit value.

Could byte_prefix be defined as a u64, or could this use a standard division
operation instead?

[ ... ]

> +static bool
> +sparx5_rr_router_leg_addr_list_empty_rcu(struct sparx5_rr_router_leg *leg)
> +{
> +	struct inet6_dev *inet6_dev;
> +	struct in_device *in_dev;
> +
> +	in_dev = __in_dev_get_rcu(leg->dev);
> +	if (in_dev && in_dev->ifa_list)
> +		return false;

[Severity: Medium]
Does this code miss an RCU pointer annotation?

The ifa_list pointer in struct in_device is annotated with __rcu, so accessing
it directly violates RCU rules and can cause sparse warnings.

Could this be updated to use rcu_access_pointer() since it's just doing a
boolean check?

[ ... ]

> +/* Called in atomic context. */
> +static int sparx5_rr_inet6addr_event(struct notifier_block *nb,
> +				     unsigned long event, void *ptr)
> +{
> +	struct inet6_ifaddr *if6 = (struct inet6_ifaddr *)ptr;
> +	struct sparx5_rr_inet6addr_event_work *work;
> +	struct net_device *dev = if6->idev->dev;
> +	struct sparx5_router *router;
> +
> +	if (event != NETDEV_DOWN)
> +		return NOTIFY_DONE;
> +
> +	work = kzalloc_obj(*work, GFP_ATOMIC);
> +	if (!work)
> +		return NOTIFY_BAD;

[Severity: High]
Does returning NOTIFY_BAD during a NETDEV_DOWN event illegally abort the atomic
notification chain?

The inet6addr_chain is an atomic notifier chain, so returning NOTIFY_BAD stops
chain traversal. Because NETDEV_DOWN is a post-action event indicating the
address has already been removed, halting the chain prevents subsequent
notifiers (e.g., routing tables, IPsec) from observing the removal. This
leaves stale state that can cause use-after-free or routing blackholes.

Should this driver log an error and return NOTIFY_DONE or NOTIFY_OK instead
if memory allocation fails?

[ ... ]

> +/* Called with RTNL. */
> +static int sparx5_rr_inetaddr_valid_event(struct notifier_block *nb,
> +					  unsigned long event, void *ptr)
> +{
> +	struct in_validator_info *ivi = (struct in_validator_info *)ptr;
> +	struct net_device *dev = ivi->ivi_dev->dev;
> +	struct sparx5_router *router;
> +
> +	ASSERT_RTNL();
> +
> +	if (event != NETDEV_UP)
> +		return NOTIFY_DONE;
> +
> +	router = container_of(nb, struct sparx5_router, inetaddr_valid_nb);
> +
> +	return sparx5_rr_inetaddr_event_handle(router->sparx5, dev, event);
> +}

[Severity: High]
Does allocating hardware resources in the validator chain cause a leak?

The driver allocates a hardware router leg (VMID) via
sparx5_rr_router_leg_create() and takes a netdev_hold reference during the
NETDEV_UP validation phase.

If a downstream validator rejects the address addition, or if the addition
natively fails, NETDEV_DOWN is never fired. Because there is no rollback hook
handling this failure, the VMID and net_device tracker reference are leaked. A
leaked reference permanently prevents the net_device from being unregistered,
hanging unregister_netdevice() in netdev_wait_allrefs().

[ ... ]

> +/* Called with RTNL. */
> +static int sparx5_rr_netdevice_event(struct notifier_block *nb,
> +				     unsigned long event, void *ptr)
> +{
> +	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> +	unsigned char mac[ETH_ALEN] __aligned(2);
> +	struct sparx5_router *router;
> +	struct sparx5 *sparx5;
> +
> +	ASSERT_RTNL();
> +
> +	router = container_of(nb, struct sparx5_router, netdevice_nb);
> +	sparx5 = router->sparx5;
> +
> +	/* Allow single bridge. Global router leg MAC tracks bridge mac. */
> +	if (!netif_is_bridge_master(dev))
> +		return NOTIFY_OK;
> +
> +	switch (event) {
> +	case NETDEV_CHANGEADDR:
> +		ether_addr_copy(mac, dev->dev_addr);
> +		sparx5_rr_leg_base_mac_set(sparx5, mac);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}

[Severity: High]
Does this notifier miss network namespace and offload ownership checks?

The netdevice and inetaddr notifiers process events globally. In
sparx5_rr_netdevice_event(), it only checks netif_is_bridge_master(dev). The
driver doesn't verify if the bridge actually contains Sparx5 physical ports or
if it is inside the target network namespace (init_net).

An unprivileged user inside a user or network namespace could create dummy
VLAN-aware bridges and change their MAC addresses or assign IPs. This would
trigger these global notifiers, causing the driver to program physical
hardware registers, overwrite the global router leg MAC, and exhaust the
finite 511 VMID slots, potentially leading to a denial of service.

