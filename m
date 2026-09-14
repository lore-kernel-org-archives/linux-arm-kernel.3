Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B51C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeT61f5KjTlMC7e2D2bdiWi0CND2YLqU8klgO5OWV6I=; b=t6LUy6T/IJr3SurbZV5X48TVq9
	pFRrm9Zn8x7bZEZdO04aIrrG038ItHDCxZkm393ax4gStYwSFOwaC/R8daoIqagEKBfO2g3V6LFqY
	wk3jFZgcSfsPwm/bITDO7sbGh5XrHaPfTnPDCzC/isjltEttAv8ViwpNZaw0UKBr07SQf0+PCnwK+
	MirXDEhV73O9BUZ4SKLG5f57DaMrhTn0Eq/57509pg9Ijwd0dSGeDMBKEF/VFn8euIbgNbmePaDSP
	1h+Ph9XQDZvOSjk0jPJHYqIpeVJoOzzgJzXymvSYtr7vffOnEJNPzRN8SC4sv6YjK6t5MbaHFcxOA
	RzH/CYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Gc-000000046RR-1mNW;
	Mon, 14 Sep 2026 15:06:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68GZ-000000046QV-264T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789398403; x=1820934403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fmenwVUAMa91rvpD7BU7UcpFVBrUKP40ANNId5F0GeA=;
  b=1CAH18WF6PaNrZy9sm0vqYbzOMVsHsITxzKTw08MnCML1a/jjmD0QLmp
   TBRKnX8a+JJ1SVaZ8+nJWLF162hyZjizW/7LRpkK7rSn4WPD1XGlpMt4T
   gHm/oUNCXTk8ocp2/DoOKkCIs2CYGAdACG2IpmyHWyKQMj6ZuoZtU8Fr4
   25liAh5RBpu/2NJeDFg6yyTXMyKlqVuMSV8aHuHidlPKa52ccBEHOPJRJ
   XXZBO4hO5MLtVLZP1CTF0K2FiOj9CKvgsTa/nE9G/fZQdacTL5sQ9XV55
   o2MNrK7bSElP7U6zBoMENDYZI33IsMYEr85oJrRsdoOG33lrYvede325r
   g==;
X-CSE-ConnectionGUID: cPo+wIh8TTWrm/ZWbs2A/g==
X-CSE-MsgGUID: 7ufFRskPQxKVKA18P6VCeA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="62645476"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2026 08:06:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 14 Sep 2026 08:06:41 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 14 Sep 2026 08:06:37 -0700
Date: Mon, 14 Sep 2026 17:06:36 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horatiu.vultur@microchip.com>,
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
	<john.fastabend@gmail.com>, <sdf@fomichev.me>, <herve.codina@bootlin.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <mohsin.bashr@gmail.com>,
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v6 09/14] net: lan966x: add shutdown callback to
 stop FDMA on reboot
Message-ID: <20260914150636.e3zebmyrnkdclgag@DEN-DL-M70577>
References: <20260909-lan966x-pci-fdma-v6-9-6f48dab9d671@microchip.com>
 <178904554582.219967.5262957308315602780@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178904554582.219967.5262957308315602780@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080643_604285_505AFA36 
X-CRM114-Status: GOOD (  46.91  )
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

> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 4 · Low: 1
> 
> - [Medium] lan966x_shutdown() leaves the shared NAPI permanently disabled
>   (napi_disable() with no napi_enable() and no state marker) while the…
> - [Medium] lan966x_shutdown() quiesces TX only with napi_disable() +
>   netif_tx_disable() and then manipulates FDMA TX state…
> - [Medium] lan966x_shutdown() masks the analyzer source with a plain
>   lan_wr(0, ANA_ANAINTR) while the ANA interrupt is still requested and…
> - [Medium] The new shutdown path relies on
>   lan966x_fdma_rx_disable()/lan966x_fdma_tx_disable() to prove the…
> - [Low] Claim: the `if (!lan966x->fdma) return;` guard in
>   lan966x_shutdown() skips the ANA_ANAINTR mask, which lan966x_init()…
> 
> --
> 
> net: lan966x: add shutdown callback to stop FDMA on reboot
> 
> Adds a platform shutdown() callback that disables NAPI, stops the netdev
> TX queues, disables the RX and TX FDMA channels and masks FDMA_INTR_ENA,
> FDMA_INTR_DB_ENA and ANA_ANAINTR so a card that survives a host reboot
> does not assert the shared PCIe INTx before re-probe.  FDMA_INTR_ENA is
> also re-armed in lan966x_fdma_rx_start().
> 
> A few questions about the new shutdown path below.

Seems like the shutdown() introduced in this patch is racy because netdevs are
left registered and FDMA/ATU is kept alive. Let me rework this in v7 to ensure
the netdevs are unregistered/detached, to avoid races with MTU/XDP etc and tear
down FDMA/ATU.

> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > index 2695bc41e52a..5793a83268fc 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> 
> [ ... ]
> 
> > @@ -325,6 +329,21 @@ static void lan966x_fdma_stop_netdev(struct lan966x *lan966x)
> >       }
> >  }
> >
> > +/* Drain in-flight xmit callers and stop all TX queues on every port. */
> > +void lan966x_fdma_tx_disable_netdev(struct lan966x *lan966x)
> > +{
> > +     struct lan966x_port *port;
> > +     int i;
> > +
> > +     for (i = 0; i < lan966x->num_phys_ports; ++i) {
> > +             port = lan966x->ports[i];
> > +             if (!port)
> > +                     continue;
> > +
> > +             netif_tx_disable(port->dev);
> > +     }
> > +}
> 
> [Severity: Medium]
> 
> Does netif_tx_disable() really drain every in-flight xmit caller here?
> lan966x also registers .ndo_xdp_xmit = lan966x_xdp_xmit in
> lan966x_port_netdev_ops, and that entry point is dispatched from a foreign
> device's NAPI/softirq (bq_xmit_all()) without the netdev txq locks and
> without regard for the txq stopped state or lan966x's NAPI state:
> 
>   lan966x_xdp_xmit()
>     lan966x_fdma_xmit_xdpf()
>       spin_lock(&lan966x->tx_lock);
>       ...
>       /* Start the transmission */
>       lan966x_fdma_tx_start(tx);
> 
> lan966x_fdma_tx_start() calls lan966x_fdma_tx_activate() when
> tx->activated is false, and that re-sets BIT(channel_id) in
> FDMA_INTR_DB_ENA and writes FDMA_CH_ACTIVATE.  lan966x_fdma_tx_disable()
> in the new shutdown path sets tx->activated = false, and lan966x_shutdown()
> touches FDMA_CH_DISABLE, tx->activated and FDMA_INTR_DB_ENA without taking
> lan966x->tx_lock.
> 
> If an XDP program on another interface redirects into a lan966x port in the
> reboot window, can the TX channel end up re-activated (and the DB enable
> bit re-set) after shutdown() returns?  The shutdown path deliberately keeps
> the DCB rings mapped, so a re-activated channel would keep fetching DCBs
> from and writing DCB status into host memory that the next kernel reuses,
> which is the state the commit message says it eliminates.

Will unregister netdevs in v7.

> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index 11094a381ec2..d6ce1e3e373f 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -1324,9 +1324,35 @@ static void lan966x_remove(struct platform_device *pdev)
> >       debugfs_remove_recursive(lan966x->debugfs_root);
> >  }
> >
> > +static void lan966x_shutdown(struct platform_device *pdev)
> > +{
> > +     struct lan966x *lan966x = platform_get_drvdata(pdev);
> > +
> > +     if (!lan966x->fdma)
> > +             return;
> > +
> > +     /* The reload paths disable this NAPI under rtnl; serialize with them. */
> > +     rtnl_lock();
> > +
> > +     if (lan966x->fdma_ndev)
> > +             napi_disable(&lan966x->napi);
> 
> [Severity: Medium]
> 
> The NAPI is disabled here and never re-enabled, and no state is recorded to
> say the device has been shut down.  After rtnl_unlock() the netdevs are
> still registered and their ndo callbacks are still live.
> 
> Can a later MTU change on any port hang?
> 
>   lan966x_port_change_mtu()          /* .ndo_change_mtu */
>     lan966x->ops->fdma_resize()
>       lan966x_fdma_change_mtu()
>         __lan966x_fdma_reload()
>           lan966x_fdma_reload()
>             napi_synchronize(&lan966x->napi);
>             napi_disable(&lan966x->napi);
> 
> The second napi_disable() lands in napi_disable_locked(), which spins:
> 
>         while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
>                 usleep_range(20, 200);
>                 val = READ_ONCE(n->state);
>         }
> 
> NAPIF_STATE_SCHED was set by the napi_disable() in lan966x_shutdown() and
> is only cleared by napi_enable(), which shutdown() never calls.
> 
> Wouldn't the netlink task then loop with no timeout and no alternative wake
> condition, while holding rtnl_mutex, blocking any later rtnl user in the
> reboot sequence (including a second instance's lan966x_shutdown(), which
> also takes rtnl_lock())?  device_shutdown() runs from
> kernel_restart_prepare() with userspace still runnable, and an XDP attach
> reaches the same napi_disable() through lan966x_xdp_setup() ->
> lan966x_fdma_reload_page_pool() -> __lan966x_fdma_reload().
> 

Will unregister netdevs in v7.

> > +
> > +     lan966x_fdma_tx_disable_netdev(lan966x);
> > +
> > +     lan966x_fdma_rx_disable(&lan966x->rx);
> > +     lan966x_fdma_tx_disable(&lan966x->tx);
> 
> [Severity: Medium]
> 
> The commit message says "fdma_deinit() disables both channels and waits for
> them to go idle", and shutdown() relies on the same two helpers for that
> guarantee.  Both of them drop the poll result though:
> 
> lan966x_fdma_rx_disable() and lan966x_fdma_tx_disable() {
>         readx_poll_timeout_atomic(lan966x_fdma_channel_active, lan966x,
>                                   val, !(val & BIT(fdma->channel_id)),
>                                   READL_SLEEP_US, READL_TIMEOUT_US);
> }
> 
> Is a timeout on FDMA_CH_ACTIVE distinguishable from a channel that really
> went idle here?  lan966x_fdma_tx_disable() sets tx->activated = false
> regardless, and shutdown() then masks FDMA_INTR_ENA/FDMA_INTR_DB_ENA, which
> hides the error sources that would report the still-active channel, and
> returns.
> 
> Unlike the unbind path, shutdown() keeps the RX pages, the coherent DCB
> rings and (on the PCIe backend) the outbound ATU window mapped, so a
> channel that never reached the idle state keeps write access to memory the
> next kernel will reuse.  Would it make sense to check the poll return and
> at least report it?
> 

Will rework shutdown in v7.

> > +
> > +     lan_wr(0, lan966x, FDMA_INTR_ENA);
> > +     lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
> > +     lan_wr(0, lan966x, ANA_ANAINTR);
> 
> [Severity: Medium]
> 
> Can the ANA_ANAINTR mask be undone right after it is written?  The ANA irq
> is still requested and enabled at this point, and it is a threaded handler
> (devm_request_threaded_irq() with lan966x_ana_irq_handler and IRQF_ONESHOT
> in lan966x_probe()), whose tail does an unlocked read-modify-write of the
> same register:
> 
> lan966x_mac_irq_handler() {
>         ...
>         lan_rmw(ANA_ANAINTR_INTR_SET(0),
>                 ANA_ANAINTR_INTR,
>                 lan966x, ANA_ANAINTR);
> }
> 
> lan_rmw() is readl() -> modify -> writel() and preserves ANA_ANAINTR_INTR_ENA
> from the value it read.  If the handler thread has already done its readl()
> (with INTR_ENA still 1) when shutdown() writes 0, wouldn't its write-back
> restore ANA_ANAINTR_INTR_ENA = 1?
> 
> shutdown() holds only rtnl, which the threaded handler never takes, and it
> neither disable_irq()s nor frees the ANA irq, so the source stays mapped
> and unmasked.  The switch keeps learning and forwarding after the host
> reboots, so MAC-table sync events keep arriving.  Would a
> disable_irq()/synchronize_irq() on lan966x->ana_irq before the mask, or a
> shared lock with the handler, close that window?

Seems legit. Sashiko complained that the ANAINTR could cause the same splats
that this patch tries to fix. Therefore ANAINTR was masked in v6. Seems correct
to also disable it, to make sure that the interrupt is not unmasked again.

> 
> > +
> > +     rtnl_unlock();
> > +}
> > +
> >  static struct platform_driver lan966x_driver = {
> >       .probe = lan966x_probe,
> >       .remove = lan966x_remove,
> > +     .shutdown = lan966x_shutdown,
> >       .driver = {
> >               .name = "lan966x-switch",
> >               .of_match_table = lan966x_match,
> 
> [ ... ]
> 
> --
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

