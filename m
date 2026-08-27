Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1681DC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnCFqI3enGf82CC8ee67RNK1TvPq1HK1vb51kNXC1KQ=; b=Ieq34TIjA+RiSDvOXHZ9gmI9FX
	nJl2ClQGcT40555G9/WiwPuQf9YaAP5z/o0byLBKhq8jjUbTZlksGKWflKcYAh7NzkOgeLKhMpofD
	Z2cK65OiakaY2ShqaRHEulo3YCCRC1qm7yxQ7V2PdawfJRPMwUc41ErckRhScglPfCtFWY5E1Uj63
	11MozkJ3nk/L+W6A8iTDP/Vno3PPKu6Asnfp1K14te+L3BRW15B6Qrmkcm1BSztVjlHz4XeZJcaAv
	b1rjF8Lx6u6UEO44Y6S24AnCvW5GPc8svLGGUfByKdJSfXk4inr9ntWHpMorLkIYDkvKoMpCI754H
	ItWxo9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXgW-00000003r5G-1AI0;
	Thu, 27 Aug 2026 10:50:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXgT-00000003r3y-0Lww
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787827816; x=1819363816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKikv7UDh0swUxIskP5m5gbLAwHhjW6fwJWJtfX2mOM=;
  b=AsHVFGSQjxdIhNPh73Z/ArgCYdJEkYW0CGc4IQlayZtxxgwDoltAEqZ7
   1nhy2RdMSVTSmrZ/Du2hFYn+kHiSHzcQpLL0uS8D1dXAMuvj07PalYo39
   nGHKDu0jPpp0Mw1PINom6jOCzkh2+WMUHa8QT29AbtLReRs/+qcdwmT1d
   hOMwROVWY2QjahYY/lg5sDVfGKlvoJEXUAlpb9p0Y5azwqBJSB7xinxQw
   LwUCxVB2WHXvwqbtTX2xmXyscOJ4pyH7cedRg5MeVNRVtEWDPgAIkyz10
   YE4R8dD1b1BbyqwIfkHj6ilk2gjWMxBeGeDs6FAiPhoExCPHDOQgAm7+6
   Q==;
X-CSE-ConnectionGUID: On+VD9zvSDyogEdmr1ElXg==
X-CSE-MsgGUID: oJikmRcNRw6C4o8l2jsrCA==
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="61843423"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 03:50:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 27 Aug 2026 03:50:11 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 27 Aug 2026 03:50:07 -0700
Date: Thu, 27 Aug 2026 12:50:07 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, "Steen
 Hegelund" <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, "Herve
 Codina" <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v5 11/13] net: lan966x: add PCIe FDMA XDP support
Message-ID: <20260827105007.ghfhbfhko3dkr37n@DEN-DL-M70577.microsemi.net>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
 <20260520-lan966x-pci-fdma-v5-11-ca56197ae05b@microchip.com>
 <20260522190126.0f2d6587@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260522190126.0f2d6587@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_035013_410122_1B421D22 
X-CRM114-Status: GOOD (  18.87  )
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

> On Wed, 20 May 2026 10:12:23 +0200 Daniel Machon wrote:
> >  #if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> >  extern const struct lan966x_fdma_ops lan966x_fdma_pci_ops;
> > +
> > +static inline bool lan966x_is_pci(struct lan966x *lan966x)
> > +{
> > +     return lan966x->ops == &lan966x_fdma_pci_ops;
> 
>         return IS_ENABLED(CONFIG_MCHP_LAN966X_PCI) &&
>                 lan966x->ops == &lan966x_fdma_pci_ops;
> 
> compiler will eliminate the reference to the ops as dead code
> and linker will not complain that its object is missing.

Ack. Will change in v6.

> 
> > +}
> > +#else
> > +static inline bool lan966x_is_pci(struct lan966x *lan966x)
> > +{
> > +     return false;
> > +}
> >  #endif
> >
> >  int lan966x_lag_port_join(struct lan966x_port *port,
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
> > index 9ee61db8690b..b470f731e25c 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c
> > @@ -24,6 +24,16 @@ static int lan966x_xdp_setup(struct net_device *dev, struct netdev_bpf *xdp)
> >       old_prog = xchg(&port->xdp_prog, xdp->prog);
> >       new_xdp = lan966x_xdp_present(lan966x);
> >
> > +     /* PCIe FDMA uses contiguous buffers, so no page_pool reload
> > +      * is needed. Drain NAPI before freeing the old program so
> > +      * no in-flight poll holds a stale pointer.
> > +      */
> 
> Not sure what this does. BPF programs are under RCU, they are not
> immediately freed (if that's that you mean..)
> 

It was added to stop NAPI from reading a NULL xdp_prog during a concurrent
program swap, however that issue was closed using READ_ONCE in an earlier
version. napi_synchronize() and the comment will be dropped in v6.

> > +     if (lan966x_is_pci(lan966x)) {
> > +             if (old_prog)
> > +                     napi_synchronize(&lan966x->napi);
> > +             goto out;
> > +     }

/Daniel

