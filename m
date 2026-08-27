Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C966C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96YJaQc2pzB5NOnZxs78bcj2ZxFny2Qu9mlA0kh0hMM=; b=KNmK7Ja0GEtDmv3OAYSz08+0sz
	9OLyArtz+DVFqAiW7Vzvi0MqWl2TKrxKQTACSEuLlgvEsloxW/KB44AomxTTBDb1cxXNlcrkRPCOH
	fq5rQJPChWKOCayyWOaPQcM05miREWzcjkDsR3y1T0ZcKYEP9L3z/NIGJC/cbQ6Nvg9LDFweKVHNr
	p28xo/PYl9DsxKi/IEAPq0JM0B/vop9C8UPMAHrJWEGLpGvwr6P4n8NbJuVUDz86QS9xKm4NXU2vd
	0DKIryzFliPjmgCTO86/tYZf4h3APBbRRwNTXk0W+pLOmlqI3EAQaRx1GlzUCDOscnPnaGKojHna4
	rHMgqkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbM6-00000004Bor-2q0O;
	Thu, 27 Aug 2026 14:45:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbM2-00000004BnU-2z8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787841926; x=1819377926;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=L9z+EaQEeXZMaM2pN88T3doI8eQzCVfKOB3Yihhri6Y=;
  b=i2pWPaE/Zh+bNpkoJvOKcu+crR1M4GGyriXgFlpaOMu2VZUdMTqODVwM
   xt/naJjN7JcrPg3WV8/7+2m0VBnUJRylfkfQmnaGJuyWtpezfbvlGF3HG
   yErbm8+RlCcQI3JVs7lAEvxZFwOKdJaoLeirGIiAGQuWKp0NltxZUjHGy
   2r82308BAZHgU27iAW2YPmlaOy1X9dWffRkGLK0DHNvmzckTWuKRF0atS
   nIoTB8Mqd3j1QOaaVSU0HX4Gcmk0kixzZ/33pQzkPgKoXBnNPHX12neLd
   8LhUUfq4Kk62/P6Y9l0moWdQQQRd5QM+/1KsLKJ+r8MvVnnm/WCpY4IQP
   g==;
X-CSE-ConnectionGUID: vfzIX0CYQ3WihH8YEI9y1Q==
X-CSE-MsgGUID: T6sNDYpHQ5OMT17ggktxpA==
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="63063015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:45:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 27 Aug 2026 07:44:46 -0700
Received: from DEN-DL-M77643.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 27 Aug 2026 07:44:43 -0700
Message-ID: <42e89af07b691122dcd91666da3571a30260d03c.camel@microchip.com>
Subject: Re: [PATCH net-next v2 9/9] net: sparx5: add neighbour event
 handling for L3 routing
From: Jens Emil Schulz Ostergaard <jensemil.schulzostergaard@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <horatiu.vultur@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <daniel.machon@microchip.com>,
	<Steen.Hegelund@microchip.com>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-hardening@vger.kernel.org>
Date: Thu, 27 Aug 2026 16:44:43 +0200
In-Reply-To: <20260817211400.3633528-1-kuba@kernel.org>
References: <20260810-sparx5_l3_routing-v2-9-59e68cc8c8ca@microchip.com>
	 <20260817211400.3633528-1-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_074523_153285_6A5AD09F 
X-CRM114-Status: GOOD (  47.30  )
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

On Mon, 2026-08-17 at 14:14 -0700, Jakub Kicinski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e content is safe
>=20
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: sparx5: add neighbour event handling for L3 routing
>=20
> This adds a netevent notifier to sparx5 that queues NETEVENT_NEIGH_UPDATE
> events to the router ordered workqueue, where the resolved MAC is written
> into the driver neigh entry and pushed to the hardware ARP table and to
> all linked nexthops. Unreachable neighbours tear down the hardware ARP
> entry and mark the nexthops as unresolved.
>=20
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c b/dr=
ivers/net/ethernet/microchip/sparx5/sparx5_router.c
> > index 6d40d651180e6..5f6add84b0d6c 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
>=20
> [ ... ]
>=20
> > @@ -2419,6 +2430,107 @@ static int sparx5_rr_fib_event(struct notifier_=
block *nb, unsigned long event,
> >       return NOTIFY_BAD;
> >  }
> >=20
> > +static void sparx5_rr_neigh_event_work(struct work_struct *work)
> > +{
> > +     struct sparx5_rr_netevent_work *net_work =3D
> > +             container_of(work, struct sparx5_rr_netevent_work, work);
> > +     unsigned char hwaddr[ETH_ALEN] __aligned(2);
> > +     struct sparx5 *sparx5 =3D net_work->sparx5;
> > +     struct neighbour *n =3D net_work->neigh;
> > +     struct sparx5_rr_neigh_key key =3D { };
> > +     struct sparx5_rr_neigh_entry *entry;
> > +     bool entry_connected;
> > +     u8 nud_state, dead;
> > +
> > +     sparx5_rr_nb2neigh_key(n, &key);
> > +
> > +     /* Frames with link-local dip are trapped, so ignore the neighbou=
r. */
> > +     if (key.iaddr.version =3D=3D SPARX5_IPV6 &&
> > +         ipv6_addr_type(&key.iaddr.ipv6) & IPV6_ADDR_LINKLOCAL)
> > +             goto out;
>=20
> [Severity: Medium]
> Does the comment's justification cover neighbours that are used as
> gateways rather than as destinations?
>=20
> The trap rule installed by sparx5_rr_lpm_link_local_create() matches on
> destination fe80::/64 only, and sparx5_rr_fib_info_should_ignore() only
> skips routes whose destination is link-local:
>=20
>         return fi->version =3D=3D SPARX5_IPV6 &&
>                ipv6_addr_type(&fi->fe6_info.rt_arr[0]->fib6_dst.addr) &
>                        (IPV6_ADDR_MULTICAST | IPV6_ADDR_LINKLOCAL);
>=20
> A route such as "ip -6 route add 2001:db8::/64 via fe80::1 dev vlanX" is
> therefore still offloaded, and sparx5_rr_nexthop_init() sets
> nh->neigh_tbl =3D &nd_tbl for every AF_INET6 gateway without a link-local
> filter, so sparx5_rr_nexthop_neigh_init() creates a neigh entry for
> fe80::1.
>=20
> Since this work handler is the only writer of entry->hwaddr, can such a
> nexthop ever obtain a MAC?  sparx5_rr_nexthop_egress_derive() would keep
> nh->trapped set and program the zero MAC, so routes via a link-local
> gateway (including RA-derived default routes) stay trapped to the CPU
> while being reported as offloaded.
>=20


No, it does not cover that case. A link-local destination must not be
forwareded which the fe80::/64 trap rule takes care of. But a link-local
gateway must be resolved, because its MAC is what a nexthop egresses with.
Skipping the neighbour entirely satisfies the first and breaks the second.

> > +
> > +     /* If n changes after this read section, we will get another neig=
h
> > +      * event, which is processed after the current one.
> > +      */
> > +     read_lock_bh(&n->lock);
> > +     ether_addr_copy(hwaddr, n->ha);
> > +     nud_state =3D n->nud_state;
> > +     dead =3D n->dead;
> > +     read_unlock_bh(&n->lock);
> > +
> > +     mutex_lock(&sparx5->router->lock);
> > +
> > +     entry_connected =3D nud_state & NUD_VALID && !dead;
> > +     entry =3D sparx5_rr_neigh_entry_lookup(sparx5, &key);
> > +     if (!entry_connected && !entry)
> > +             goto out_mutex;
> > +
> > +     if (!entry) {
> > +             entry =3D sparx5_rr_neigh_entry_create(sparx5, &key);
> > +             if (IS_ERR(entry))
> > +                     goto out_mutex;
> > +     }
>=20
> [Severity: Medium]
> With this notifier being the only source of entry->hwaddr, how does an
> already-resolved kernel neighbour get synchronized into a newly created
> driver entry?
>=20
> sparx5_rr_nexthop_neigh_init() only kicks ARP/NDP when the kernel
> neighbour did not already exist, and never samples n->ha / n->nud_state:
>=20
>         n =3D neigh_lookup(nh->neigh_tbl, &nh->gw_addr, dev);
>         if (!n) {
>                 n =3D neigh_create(nh->neigh_tbl, &nh->gw_addr, dev);
>                 if (IS_ERR(n))
>                         return PTR_ERR(n);
>                 /* Start arp process */
>                 neigh_event_send(n, NULL);
>         }
>=20
> For a NUD_PERMANENT neighbour ("ip neigh add <gw> lladdr <mac> nud
> permanent dev vlanX") no further NETEVENT_NEIGH_UPDATE is generated -
> net/core/neighbour.c only emits netevents from __neigh_update(),
> neigh_timer_handler() and neigh_cleanup_and_release(), and permanent
> entries have no timer and are skipped by the GC work.  Does that leave
> entry->hwaddr zero forever, so sparx5_rr_nexthop_egress_derive() keeps
> nh->trapped set while the FIB entry is reported as offloaded?
>=20
> The same applies when the event arrives before a router leg exists:
> sparx5_rr_neigh_entry_create() returns ERR_PTR(-EINVAL) from
>=20
>         leg =3D sparx5_rr_leg_find_by_dev(sparx5, key->dev);
>         if (!leg)
>                 return ERR_PTR(-EINVAL);
>=20
> and the event is dropped with no replay when the leg later appears.
>=20
> For comparison, mlxsw_sp_nexthop_neigh_init() reads nud_state/dead under
> n->lock and calls __mlxsw_sp_nexthop_neigh_update() at init time:
>=20
>         read_lock_bh(&n->lock);
>         nud_state =3D n->nud_state;
>         dead =3D n->dead;
>         read_unlock_bh(&n->lock);
>         __mlxsw_sp_nexthop_neigh_update(nh, !(nud_state & NUD_VALID && !d=
ead));
>=20


It is right, nothing else writes entry->hwaddr, so it stays zero and the ne=
xthop
is trapped forever. I will fix this by sampling at init as mlxsw does, afte=
r the
nexthop is linked into neigh_entry->nexthop_list, so the update
reaches the nexthop that just attached.


> > +
> > +     if (entry->connected && entry_connected &&
> > +         ether_addr_equal(entry->hwaddr, hwaddr))
> > +             goto out_mutex;
>=20
> [Severity: Medium]
> Can this early exit permanently block a retry after a failed hardware
> write?
>=20
> sparx5_rr_neigh_entry_update() marks the entry connected before the
> fallible hardware apply and only downgrades the offload marking:
>=20
>         entry->connected =3D adding;
>=20
>         if (adding) {
>                 err =3D sparx5_rr_neigh_entry_hw_apply(sparx5, entry);
>                 if (err)
>                         offloaded =3D false;
>=20
> sparx5_rr_lpm_arp_entry_mod() can fail while the rule keeps the previous
> DMAC:
>=20
>         vrule =3D vcap_get_rule(vctrl, vrule_id);
>         if (IS_ERR(vrule))
>                 return -EINVAL;
>=20
> and sparx5_rr_lpm_arp_entry_create() can fail on rule allocation or
> vcap_val_add_rule().
>=20
> Since the new MAC has already been stored in entry->hwaddr and
> entry->connected is true, every following NUD_VALID confirmation
> (REACHABLE/STALE/DELAY) hits the test above and skips both the LPM/ARP
> update and sparx5_rr_nexthops_update_notify().  For an IP that moves to a
> new MAC (VRRP failover, VM migration), would hardware keep rewriting DMAC
> to the old MAC with no trap and no further retry?
>=20
> Would keying the skip on hw_route.vrule_id_valid (or propagating the
> error from sparx5_rr_neigh_entry_update()) avoid that?
>=20

Yes, it can. I will record the outcome rather than key on vrule_id_valid,
because that flag is not a reliable proxy any more. A link-local neighbour
now deliberately has no host route, so vrule_id_valid stays false for it
and the skip would never trigger. Recording the state enables the next
event to drive the retry.

> > +
> > +     ether_addr_copy(entry->hwaddr, hwaddr);
> > +     sparx5_rr_neigh_entry_update(sparx5, entry, entry_connected);
> > +     sparx5_rr_nexthops_update_notify(sparx5, entry, entry_connected);
> > +     if (!entry_connected)
> > +             sparx5_rr_neigh_entry_put(sparx5, entry);
>=20
> [Severity: High]
> Should the MAC be committed into entry->hwaddr on the disconnect path as
> well?
>=20
> The kernel does not clear n->ha when a neighbour goes to NUD_FAILED or
> dead - neigh_invalidate() only flushes arp_queue, and neigh->ha is only
> overwritten when a new lladdr is supplied.  So for !entry_connected this
> stores the last, now invalid MAC while entry->connected becomes false, an=
d
> nothing else ever zeroes entry->hwaddr.  sparx5_rr_neigh_entry_put() keep=
s
> the entry alive while a nexthop still references it.
>=20
> The only other consumer derives "resolved" purely from the MAC being
> non-zero and ignores entry->connected:
>=20
>         nh->trapped =3D !nh_neigh || is_zero_ether_addr(nh_neigh->hwaddr)=
;
>=20
>         if (nh_neigh) {
>                 memcpy(mac, nh_neigh->hwaddr, ETH_ALEN);
>=20
> On ordinary route churn, sparx5_rr_entry_nexthop_group_update() builds an=
d
> programs the new group before releasing the old one:
>=20
>         /* Prepare new group in SW representation */
>         new_nh_grp =3D sparx5_rr_nexthop_group_create(sparx5, fib_entry);
>         ...
>         err =3D sparx5_rr_fib_entry_hw_apply(sparx5, fib_entry);
>         ...
>         sparx5_rr_nexthop_group_put(sparx5, old_nh_grp);
>=20
> so sparx5_rr_nexthop_neigh_init() re-attaches to the surviving entry and
> sparx5_rr_nexthop_egress_derive() then clears nh->trapped and installs th=
e
> dead MAC.  Does that leave traffic forwarded to a host that no longer
> exists instead of trapped, with no path back to trapping since the kernel
> never sees the traffic?
>=20
> This also seems to differ from the commit message wording "mark linked
> nexthops as unresolved so traffic traps to the CPU".
>=20

No, it should not. In v3 I will only commit an address when told it is vali=
d.
And sparx5_rr_nexthop_egress_derive() no longer treats a non-zero hwaddr as
proof of resolution, not emits an address when it has decided the nexthop i=
s
trapped.

> > +
> > +out_mutex:
> > +     mutex_unlock(&sparx5->router->lock);
> > +out:
> > +     neigh_release(n);
> > +     kfree(net_work);
> > +}
> > +
> > +/* Handle neighbour update events. Used to manage neigh_entries. Calle=
d in
> > + * atomic context, with rcu_read_lock().
> > + */
> > +static int sparx5_rr_netevent_event(struct notifier_block *nb,
> > +                                 unsigned long event, void *ptr)
> > +{
>=20
> [ ... ]
>=20
> > +             net_work =3D kzalloc_obj(*net_work, GFP_ATOMIC);
> > +             if (!net_work)
> > +                     return NOTIFY_BAD;
>=20
> [Severity: Low]
> Would NOTIFY_DONE be a better return value here?
>=20
> NETEVENT_NEIGH_UPDATE is delivered over the single system-wide atomic
> chain:
>=20
> net/core/netevent.c:call_netevent_notifiers() {
>         return atomic_notifier_call_chain(&netevent_notif_chain, val, v);
> }
>=20
> and NOTIFY_BAD carries NOTIFY_STOP_MASK, which ends the traversal:
>=20
> kernel/notifier.c:notifier_call_chain() {
>         ...
>                 if (ret & NOTIFY_STOP_MASK)
>                         break;
>         ...
> }
>=20
> So a driver-private GFP_ATOMIC failure suppresses the notification for
> every listener registered after sparx5.  The same idiom exists in
> mlxsw_sp_router_schedule_work(), so this is minor, but the failure looks
> purely local and recoverable here.
>=20

Sure, I will change this to NOTIFY_DONE.

> > +
> > +             INIT_WORK(&net_work->work, sparx5_rr_neigh_event_work);
> > +             net_work->sparx5 =3D router->sparx5;
> > +             net_work->neigh =3D neigh_clone(n);
> > +             net_work->event =3D event;
> > +             sparx5_rr_schedule_work(router->sparx5, &net_work->work);
> > +
> > +             return NOTIFY_DONE;
> > +     }
> > +
> > +     return NOTIFY_DONE;
> > +};
> > +
>=20
> [ ... ]
>=20
> > @@ -2855,6 +2972,8 @@ int sparx5_rr_router_init(struct sparx5 *sparx5)
> >       unregister_inetaddr_notifier(&r->inetaddr_nb);
> >  err_unreg_fib_notifier:
> >       unregister_fib_notifier(&init_net, &r->fib_nb);
> > +err_unreg_netevent_notifier:
> > +     unregister_netevent_notifier(&r->netevent_nb);
> >  err_workqueue_destroy:
> >       destroy_workqueue(r->sparx5_router_owq);
> >       sparx5_rr_fib_flush(sparx5);
>=20
> [Severity: Low]
> While looking at this unwind path, the neighbour hashtable is destroyed
> before the legs that own entries in it are flushed:
>=20
> err_neigh_ht_destroy:
>         rhashtable_destroy(&r->neigh_ht);
> err_blackhole_destroy:
>         sparx5_rr_router_legs_flush(sparx5);
>=20
> sparx5_rr_router_leg_destroy() walks leg->neigh_list and reaches
> rhashtable_remove_fast() via sparx5_rr_neigh_entry_destroy() ->
> sparx5_rr_neigh_entry_remove(), on a table whose bucket table has already
> been freed.  sparx5_rr_router_deinit() uses the opposite order (legs
> flush, WARN_ON(nelems), then rhashtable_destroy).
>=20
> The dangerous state does not appear reachable today: neigh entries only
> exist once a device leg exists, and legs are only created from the
> inetaddr/inet6addr handlers registered after register_fib_notifier(),
> which is the only registration here that realistically fails;
> sparx5_rr_netdevice_event() always returns NOTIFY_OK, and the
> inet6addr registrations only fail on duplicate registration.  This
> ordering also comes from the earlier patch in the series that added the
> FIB/nexthop/neighbour entry management, not from this patch, which only
> adds one more producer of neigh entries.  Would it still be worth
> matching the deinit order defensively?

Yes, worth doing, and the reachability analysis matches mine. I will change
this.


