Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4EC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPS30Jv9cRb4uYl2poK0GjlXU7PLmPRp81EYBgJcYDs=; b=jAJCSKvzz5pMcNFqiwCyAux+5t
	MeknwSodPOXnEsFR/1EqB6YvBpAncGOd431ALtFDKPlWQu9/2fv6DldWs9P5IIwOupCN1nuERNUej
	eHCAHoe3I0961EudbtPLZvvlq3U0OCWRnQoFZg3uTp9uUfTXbqALJ89F7lWyVx3cQNZNn0lS4ZfZ7
	MOWymJp3EuEqXV4nqCaugVsdpJNXTfXpZ4NqMG3jokpzkxdzcd5lNLwrmRvmvJgzLMDdNcix3PmMg
	BHV+/MUxDn2imY2VQXqd/OGBf1Kre03Hc077FvwUdY8lhuNr9hUdh+lVoS3PNzmCr9v+k4IBHNVyH
	jMviU2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H5B-00000007Lvu-3L4R;
	Wed, 23 Sep 2026 07:07:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H57-00000007LvB-4ANW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790147273; x=1821683273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=orzSAAp/TYdSyiSlITswyr5ZI6KYw8GybSx0o1i2fYw=;
  b=djzuZwi1gFmAMQkdNt/qcWV7IbJwu2ApYDOnbmutNaYkVeNogNm0LaiH
   3yifCt6MQhRf5762ss1o65KSAoMBurTMYDQtI7Roy//A5BJUhvRHSAJOy
   K36gGoPU6seE2gP4C0KsbJ4YMHHPpc1GAifOg1oLUoUY8lpDhSUVRec/0
   eT2xnVJ0gvFDOeX3Wg9I7LAtej0EiPWAFHiC3xFKT5d1YBrvv0kgKS4F1
   7IhpOLokccUVtxVw57FXqCXW2fQb9NHYmlshV/9FPkRB+N9gy0xG3EwWP
   BLQwWaOGwP9G1hkmJwyqjTiIa50Ed+t4k2YHhY4dLOaIoTRG2SFztxzkt
   A==;
X-CSE-ConnectionGUID: UUQhEpgOQGa3bB9ahQY9fg==
X-CSE-MsgGUID: /seKL8cbTGKmGzzU0oUv6A==
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="231145174"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:07:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Wed, 23 Sep 2026 00:07:52 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 23 Sep 2026 00:07:48 -0700
Date: Wed, 23 Sep 2026 09:07:47 +0200
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
Subject: Re: [PATCH net-next v7 04/14] net: lan966x: add FDMA LLP register
 write helper
Message-ID: <20260923070747.sunyth2nbmi6hq3h@DEN-DL-M70577.microsemi.net>
References: <20260918-lan966x-pci-fdma-v7-4-0ecc179c8a2c@microchip.com>
 <179008204609.2160803.35249597205544955@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179008204609.2160803.35249597205544955@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_000754_307970_111D298B 
X-CRM114-Status: GOOD (  48.99  )
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

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] By moving the FDMA_DCB_LLP/LLP1 writes out of
>   lan966x_fdma_tx_activate() into lan966x_fdma_tx_alloc()…
> - [Low] The patch deletes the comment 'When activating a channel, first
>   is required to write the first DCB address and then to activate it'…
> 
> Pre-existing issues:
> - [High] lan966x_fdma_rx_alloc() (lan966x_fdma.c:135) and
>   lan966x_fdma_tx_alloc() (line 217) discard the return value of…
> 
> --
> 
> net: lan966x: add FDMA LLP register write helper
> 
> This moves the FDMA_DCB_LLP/LLP1 register writes out of
> lan966x_fdma_rx_start() and lan966x_fdma_tx_activate() into the RX/TX
> allocation functions, adding a shared lan966x_fdma_llp_configure() helper
> plus one extra call in the lan966x_fdma_reload() restore path.  The stated
> motivation is that the upcoming PCIe FDMA path programs ATU-translated
> addresses into these registers.
> 
> A few questions below.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > index 41d4ec7f2f57..b8344fd5e5ad 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > @@ -109,6 +109,13 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
> >       return 0;
> >  }
> >
> > +static void lan966x_fdma_llp_configure(struct lan966x *lan966x, u64 addr,
> > +                                    u8 channel_id)
> > +{
> > +     lan_wr(lower_32_bits(addr), lan966x, FDMA_DCB_LLP(channel_id));
> > +     lan_wr(upper_32_bits(addr), lan966x, FDMA_DCB_LLP1(channel_id));
> > +}
> > +
> >  static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
> >  {
> >       struct lan966x *lan966x = rx->lan966x;
> > @@ -128,6 +135,8 @@ static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
> >       fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
> >                      FDMA_DCB_STATUS_INTR);
> >
> > +     lan966x_fdma_llp_configure(lan966x, fdma->dma, fdma->channel_id);
> > +
> >       return 0;
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since the new LLP write now
> sits right after it: should lan966x_fdma_rx_alloc() check the return value
> of fdma_dcbs_init() before arming the channel?
> 
> fdma_dcbs_init() is fallible and stops at the first failing descriptor:
> 
> drivers/net/ethernet/microchip/fdma/fdma_api.c:fdma_dcbs_init() {
>         for (i = 0; i < fdma->n_dcbs; i++) {
>                 err = fdma_dcb_add(fdma, i, info, status);
>                 if (err)
>                         return err;
>         }
> }
> 
> and lan966x_fdma_rx_dataptr_cb() returns -ENOMEM when
> page_pool_dev_alloc_pages() fails, without updating rx->page[dcb][db] or
> *dataptr.  So under memory pressure the chain is left truncated, the
> remaining DB dataptrs stay 0, and rx->page[] keeps its previous contents
> while this function still returns 0 and now also programs the LLP.
> 
> In lan966x_fdma_reload() the success branch then runs, which releases every
> page in old_pages to the old pool and calls page_pool_destroy(page_pool)
> while rx->page[] still references those pages.  A later
> lan966x_fdma_rx_free_pages() at deinit, or on the next MTU change, would
> then call page_pool_put_full_page() on pages already returned to a
> destroyed pool.  In the probe path the same suppressed failure leaves NULL
> entries in rx->page[] that lan966x_fdma_rx_free_pages() dereferences
> unconditionally.
> 
> RX would also stall, since the software dcb_index wraps modulo n_dcbs while
> the hardware only walks the truncated part of the ring.
> 
> Interestingly the PCIe variant added later in this series does check the
> same call, so would it make sense to propagate the error here as well?
> 
> > @@ -137,14 +146,6 @@ static void lan966x_fdma_rx_start(struct lan966x_rx *rx)
> >       struct fdma *fdma = &rx->fdma;
> >       u32 mask;
> >
> > -     /* When activating a channel, first is required to write the first DCB
> > -      * address and then to activate it
> > -      */
> > -     lan_wr(lower_32_bits((u64)fdma->dma), lan966x,
> > -            FDMA_DCB_LLP(fdma->channel_id));
> > -     lan_wr(upper_32_bits((u64)fdma->dma), lan966x,
> > -            FDMA_DCB_LLP1(fdma->channel_id));
> > -
> >       lan_wr(FDMA_CH_CFG_CH_DCB_DB_CNT_SET(fdma->n_dbs) |
> >              FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY_SET(1) |
> >              FDMA_CH_CFG_CH_INJ_PORT_SET(0) |
> 
> [Severity: Low]
> This isn't a bug, but the comment documenting the hardware ordering rule
> ("first is required to write the first DCB address and then to activate
> it") is removed from both lan966x_fdma_rx_start() and
> lan966x_fdma_tx_activate(), and is not restated at
> lan966x_fdma_llp_configure() or at either FDMA_CH_ACTIVATE site.
> 
> The requirement becomes an implicit contract between the allocation and
> activation functions, which is what forces the extra open-coded call in the
> lan966x_fdma_reload() restore path below.  Could the rule be documented at
> the helper, or near the FDMA_CH_ACTIVATE writes?
> 
> All activation paths in the current tree do have a matching LLP write
> before them, so this is only about the lost documentation.
> 
> Also, the commit message says the writes are moved "into the allocation
> functions", but a third call site is added in lan966x_fdma_reload(), which
> is not an allocation function.  Could that be mentioned as well?
> 
> > @@ -215,6 +216,8 @@ static int lan966x_fdma_tx_alloc(struct lan966x_tx *tx)
> >
> >       fdma_dcbs_init(fdma, 0, 0);
> >
> > +     lan966x_fdma_llp_configure(lan966x, fdma->dma, fdma->channel_id);
> > +
> >       return 0;
> >
> >  out:
> 
> [Severity: High]
> This is the same pre-existing unchecked fdma_dcbs_init() described above,
> on the TX side; it is not introduced by this patch, but the new LLP write
> and the unconditional "return 0" now follow it directly.
> 
> > @@ -236,14 +239,6 @@ static void lan966x_fdma_tx_activate(struct lan966x_tx *tx)
> >       struct fdma *fdma = &tx->fdma;
> >       u32 mask;
> >
> > -     /* When activating a channel, first is required to write the first DCB
> > -      * address and then to activate it
> > -      */
> > -     lan_wr(lower_32_bits((u64)fdma->dma), lan966x,
> > -            FDMA_DCB_LLP(fdma->channel_id));
> > -     lan_wr(upper_32_bits((u64)fdma->dma), lan966x,
> > -            FDMA_DCB_LLP1(fdma->channel_id));
> > -
> >       lan_wr(FDMA_CH_CFG_CH_DCB_DB_CNT_SET(fdma->n_dbs) |
> >              FDMA_CH_CFG_CH_INTR_DB_EOF_ONLY_SET(1) |
> >              FDMA_CH_CFG_CH_INJ_PORT_SET(0) |
> 
> [Severity: Medium]
> Can the injection channel now be activated before the LLP has been
> programmed during probe?
> 
> lan966x_probe() sets lan966x->fdma = true before the port loop that calls
> lan966x_probe_port() -> register_netdev(), and only calls
> lan966x_fdma_init() afterwards.  lan966x_port_xmit() dispatches purely on
> that flag:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_main.c:lan966x_port_xmit() {
>         spin_lock(&lan966x->tx_lock);
>         if (port->lan966x->fdma)
>                 err = lan966x_fdma_xmit(skb, ifh, dev);
>         ...
> }
> 
> lan966x_fdma_init() sets tx.fdma.n_dcbs/n_dbs and the ops before calling
> lan966x_fdma_tx_alloc(), and lan966x_fdma_tx_alloc() does not take
> tx_lock.  So an xmit landing between fdma_dcbs_init() and the new
> lan966x_fdma_llp_configure() would find a valid dcbs_buf and DCB ring and
> go:
> 
> lan966x_fdma_xmit() -> lan966x_fdma_tx_start() -> lan966x_fdma_tx_activate()
> 
> which after this patch writes FDMA_CH_ACTIVATE without programming the
> LLP, so the engine would fetch its first DCB from the post-reset LLP value
> of 0.  tx->activated is latched true there, so the LLP would never be
> programmed for that channel afterwards:
> 
>         if (likely(lan966x->tx.activated)) {
>                 lan966x_fdma_tx_reload(tx);
>         } else {
>                 /* Because it is first time, then just activate */
>                 lan966x->tx.activated = true;
>                 lan966x_fdma_tx_activate(tx);
>         }
> 
> Before this patch tx_activate() wrote the LLP immediately before the
> activate bit, so this ordering was not possible.  Note the same probe
> window already exposes a pre-existing tx->dcbs_buf == NULL dereference in
> lan966x_fdma_get_next_dcb() while n_dcbs is already set, so would
> registering the netdevs after lan966x_fdma_init() be the better fix?

Netdev registration should be done last, yes - and that is the fix that should
go to net (as mentioned in v6). The probe window is real, but not something
introduced by this series.

> 
> > @@ -876,6 +871,9 @@ static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
> >                                          MEM_TYPE_PAGE_POOL, page_pool);
> >       }
> >
> > +     lan966x_fdma_llp_configure(lan966x, lan966x->rx.fdma.dma,
> > +                                lan966x->rx.fdma.channel_id);
> > +
> >       lan966x_fdma_rx_start(&lan966x->rx);
> >
> >       lan966x_fdma_wakeup_netdev(lan966x);
> 
> --
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c%40microchip.com

