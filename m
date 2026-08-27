Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802BBC61DC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/kFqdpFZSwPzQqusnyk7y7C5VwpYTcR6sHuyk5hNzA=; b=wI7gBjRivCqmbBQYaXzWgGl/A4
	VxHea8sQLKPF9WnV2wATw43uzaOLqJD71gX4YyMex9LdU/NDWkDXYo5PG2EFPwZIipoOvZq/uCW5j
	aPsuyM+E4rNX4k6FGMzehH1eO8kuwgexKKAsH1mENC09Nme5YWyfgElkZ4UiJ6fAi4DTj5KK2ukqY
	arXqs7n5gf9dwgDB8zdkPHD5qTUFQrX4JDjrj6Tdhb8zKo880b8vnCjZtpuwDwshw124jOpx3ZfPe
	fXrhMg+TIU4qmE3Jui/aUYJLaMd/s18FzsSL3ye2WubHdrocnrOT3oJrgJdPKd8T1c30B+OHECVkM
	UwZCz+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWt0-00000003nDK-2k9W;
	Thu, 27 Aug 2026 09:59:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWsx-00000003nCx-3QCC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787824743; x=1819360743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9zWHX1koS7Y08c8z6OqdIcI8jre+mu/ZH79BynCwR7I=;
  b=Itl4AuM6e60al3p0syyEcI/Ya7CL2MJreD9GcrJe40zP0aMjtyQcqCX9
   mz93Jwh4sVXq/AjuGi/5/DeEtrX9XsBVjpYPqOIJTrSyCCxexTZDWO5f8
   2g8AQv4f1NpVqED26R49tME2K7g2WDCMK4BUx+TbBDN6wNKrtTecvo8QT
   YBLX/Gz/+l06NM3IzJt/gl8UV8TSZ6cdjC8Qe5u26VPjZ9vCTaZ40LZfW
   pAglL7q15p2F41kBp4J21qQ6NPdl6dG4J4aZ/81ViJ0k4rfeboutQCqLb
   PwwdIsykXaC/xSgpvwvO6MxAI9MnRgrQz92vsKBekzdvrcIedighVuKrv
   g==;
X-CSE-ConnectionGUID: TKd9ukl7SMmUnG5Q+MYsKQ==
X-CSE-MsgGUID: Wh+SSoq1RgyeT1qOVKnEPA==
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="294132463"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2026 02:59:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 27 Aug 2026 02:59:01 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 27 Aug 2026 02:58:57 -0700
Date: Thu, 27 Aug 2026 11:58:57 +0200
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
Subject: Re: [PATCH net-next v5 09/13] net: lan966x: add PCIe FDMA support
Message-ID: <20260827095857.nt2zngzhoq777qou@DEN-DL-M70577.microsemi.net>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
 <20260520-lan966x-pci-fdma-v5-9-ca56197ae05b@microchip.com>
 <20260522185637.1fe72213@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522185637.1fe72213@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_025903_865372_A973F6A7 
X-CRM114-Status: GOOD (  26.65  )
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

> On Wed, 20 May 2026 10:12:21 +0200 Daniel Machon wrote:
> > Add PCIe FDMA support for lan966x. The PCIe FDMA path uses contiguous
> > DMA buffers mapped through the endpoint's ATU, with memcpy-based frame
> > transfer instead of per-page DMA mappings.
> >
> > With PCIe FDMA, throughput increases from ~33 Mbps (register-based I/O)
> > to ~620 Mbps on an Intel x86 host with a lan966x PCIe card.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/Makefile b/drivers/net/ethernet/microchip/lan966x/Makefile
> > index 4cdbe263502c..ac0beceb2a0d 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/Makefile
> > +++ b/drivers/net/ethernet/microchip/lan966x/Makefile
> > @@ -18,6 +18,10 @@ lan966x-switch-objs  := lan966x_main.o lan966x_phylink.o lan966x_port.o \
> >  lan966x-switch-$(CONFIG_LAN966X_DCB) += lan966x_dcb.o
> >  lan966x-switch-$(CONFIG_DEBUG_FS) += lan966x_vcap_debugfs.o
> >
> > +ifdef CONFIG_MCHP_LAN966X_PCI
> 
> ifeq ()
> 
> would be more common in a Makefile?

Switching to ifneq ($(CONFIG_MCHP_LAN966X_PCI),) in v6.

> 
> > +lan966x-switch-y += lan966x_fdma_pci.o
> > +endif
> > +
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index cc3c7b6c65ae..7036b1d937d5 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/ip.h>
> >  #include <linux/of.h>
> >  #include <linux/of_net.h>
> > +#include <linux/pci.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> > @@ -49,6 +50,9 @@ struct lan966x_main_io_resource {
> >  static const struct lan966x_main_io_resource lan966x_main_iomap[] =  {
> >       { TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
> >       { TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
> > +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> 
> why config option being enabled changes the targets?
> Can someone with a non-PCI device enable that option too
> (sure it would be useless but given that/if they can guarding
> with an #if seems like a waste of LoC)
> 

Rationale was to only map in the PCIE_DBI target if actually needed. Sure, can
drop the conditional in v6.

> > +     { TARGET_PCIE_DBI,             0x400000, 0 }, /* 0xe0400000 */
> > +#endif
> >       { TARGET_ORG,                         0, 1 }, /* 0xe2000000 */
> >       { TARGET_GCB,                    0x4000, 1 }, /* 0xe2004000 */
> >       { TARGET_QS,                     0x8000, 1 }, /* 0xe2008000 */
> > @@ -1100,6 +1104,13 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
> >
> >  static const struct lan966x_fdma_ops *lan966x_get_fdma_ops(struct device *dev)
> >  {
> > +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> > +     for (struct device *p = dev->parent; p; p = p->parent) {
> > +             if (dev_is_pci(p))
> 
> If the PCIe devices also use an intermediate platform device for
> probing, can't they explicitly have some flag / state to indicate
> they are PCIe? The device walk in such a constrained env seems
> like an overkill
> 

I think it could be possible to pass some state between lan966x_pci and the
switch driver, however that seems like a much more complex solution than this.
The parent bus node already implies the same — the switch device only ever sits
under a PCI-created bus in the PCIe case, so an explicit flag/state would just
restate what the topology already tells us. The walk itself is deliberate, v1
checked dev->parent->parent directly, and I opened it up to a walk so PCIe
detection keeps working if the overlay's DT topology gains or loses an
intermediate bus node. I'd like to keep as it.

> > +                     return &lan966x_fdma_pci_ops;
> > +     }
> > +#endif
> > +
> >       return &lan966x_fdma_ops;
> >  }
> >
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
> > index 5f4dbeda17cd..e7fdd4447fb6 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
> > @@ -17,6 +17,9 @@
> >  #include <net/xdp.h>
> >
> >  #include <fdma_api.h>
> > +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> > +#include <fdma_pci.h>
> > +#endif
> 
> Conditional #includes make build testing harder, better to avoid them
> 

Ack.

> >  #include <vcap_api.h>
> >  #include <vcap_api_client.h>
> >
> > @@ -288,6 +291,10 @@ struct lan966x {
> >
> >       void __iomem *regs[NUM_TARGETS];
> >
> > +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> > +     struct fdma_pci_atu atu;
> > +#endif
> > +
> >       int shared_queue_sz;
> >
> >       u8 base_mac[ETH_ALEN];
> > @@ -586,6 +593,10 @@ void lan966x_fdma_wakeup_netdev(struct lan966x *lan966x);
> >  int lan966x_fdma_get_max_frame(struct lan966x *lan966x);
> >  int lan966x_qsys_sw_status(struct lan966x *lan966x);
> >
> > +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> > +extern const struct lan966x_fdma_ops lan966x_fdma_pci_ops;
> > +#endif
> 
> There should be no need to wrap extern in an #if

Ack.


/Daniel

