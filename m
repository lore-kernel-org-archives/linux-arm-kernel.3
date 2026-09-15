Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0901C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYEOX3WMRRxE/NH//NIVYJcTHl86cEZcTnqyLXzohG4=; b=D3RF+RIRoSRWbm3GY8wzUJ3eXt
	1EHDI1TtUrudND8bGvyJGph50UuggxijBjK6f+nKXLDfs+U/zKONh72x0p5IL/XoZHIrIPyuSFGjJ
	ZCZSGCsfYcCmkF8u8LzLoFe+3h2Sa9ws78PBxhIzB/3s1lSGJQVUq2dJFIMem6wa+JXv/+QS4TixI
	gGhjFxWrFEifBMwQ6nH8XSHMfh3a9yzQCm5YcNqVY8/h0RJvokZLEysHDuWwno86PrE9ht9bI852m
	NSsWv0fhhm7oqr6Tz5npFX32sKtCK3xQHM92VSzQ7J4ds9jgi6ZNmL3uivRoaYXUMffacv6k5MO5n
	pxsNJsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OwR-00000005hjU-2Ddj;
	Tue, 15 Sep 2026 08:55:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OwP-00000005hj0-3bAW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LYEOX3WMRRxE/NH//NIVYJcTHl86cEZcTnqyLXzohG4=; b=JiYMa/QLvQUH7g+NqZbjVxZQLk
	UzolbDCwOZhnG4+PLTSjcErC2VYF5mSix8V44Qbu8MCQi7Vf+KgVSKgIkYaK7dteRIW734sp4G7k7
	CCnk4QiynXfM/UBBNcRFuxbndZZqV5KhNgRiTNvJEycsCL9xXtDbLMQrVvvd5+irseY8uOmQ3tn6A
	kxzWmu3Ru1QRU8aAUe2ogSe1Ob2Gkh+b53okay8xe16UY/U8bU2Uip1Ltbzz/HqAH9Sk9E18RwmO7
	cZKVfq8K4J9nlgEcXhMhSUCvqIJByHR1n2AoOBrE/yQFm+S3ea24sUlh+gGAX3vIQcDdkwd0Y7Ng9
	Iw4JLm9Q==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OwL-00000006Shs-0UQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789462497; x=1820998497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g/XQZFRhvArqwyhYQQsYV1oxzReIaJfAkZh939ydge0=;
  b=koyWAffA10UcKGtUA4drArV/B1DM0SjBFUPb2tnEdvQgzTX4/cxkYfAK
   gUnWgDshPH9b5AttqtFHpWNMx5+CtguvyEOu7ysIIMBezL+HLskraGgtC
   B5sITU3f4ud/ArQHRRcOAHRYKJeMLxRzA/hpmYYFhHFWWkepugj2IDH8R
   AhuxnaZpsLE1qRgH/AP5A/Ut0bk242Cg8SbUe5J3XL5rWsifcDZoWgPnx
   UbOYaxgiX6nzgwQcyWhCX3gIkA86AzRy9Y2h78pk0EHO0Sq5upurwpPvl
   lm8mFlYyVur7YIRuS4XKZtL1PzwNCZGMoOd+eoZ2mTsHz57T2TAjJR7OL
   A==;
X-CSE-ConnectionGUID: BntAm97SSBGPRL8iNTiP5w==
X-CSE-MsgGUID: 3Byspm3MRBS9EZyigKLLFA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="63612037"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:54:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 15 Sep 2026 01:54:49 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 15 Sep 2026 01:54:46 -0700
Date: Tue, 15 Sep 2026 10:54:45 +0200
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
Subject: Re: [PATCH net-next v6 10/14] net: lan966x: add PCIe FDMA support
Message-ID: <20260915085445.sajcj75jexgkkrvj@DEN-DL-M70577.microsemi.net>
References: <20260909-lan966x-pci-fdma-v6-10-6f48dab9d671@microchip.com>
 <178904554750.219967.2010862453597890441@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178904554750.219967.2010862453597890441@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_095458_123742_49D74EA9 
X-CRM114-Status: GOOD (  31.74  )
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

> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 (1) · Medium: 1 (1) · Low: 3
> 
> - [Medium] DISCARDED — fixed later in the series.
> - [Low] DISCARDED — fixed later in the series.
> - [Low] DISCARDED — fixed later in the series.
> - [Low] DISCARDED — fixed later in the series.
> 
> Pre-existing issues:
> - [High] Use-after-free in the new PCIe receive path:
>   `lan966x_fdma_pci_rx_get_frame()`…
> - [Medium] DISCARDED — pre-existing shared-library ordering weakness.
> 
> --
> 
> net: lan966x: add PCIe FDMA support
> 
> Adds a second FDMA backend for lan966x used when the switch is reached over
> PCIe, using contiguous ATU-mapped DMA buffers and memcpy-based frame
> transfer instead of per-page mappings. XDP and PTP are not advertised or
> allowed on this path.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > new file mode 100644
> > index 000000000000..f1f3c789d3a6
> > --- /dev/null
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > @@ -0,0 +1,404 @@
> 
> [ ... ]
> 
> > +/* Return true if blockl is a valid RX frame size. */
> > +static bool lan966x_fdma_pci_rx_size_fits(struct fdma *fdma, u32 blockl)
> > +{
> > +     return blockl >= IFH_LEN_BYTES + ETH_HLEN + ETH_FCS_LEN &&
> > +            blockl <= fdma->db_size - XDP_PACKET_HEADROOM;
> > +}
> 
> [ ... ]
> 
> > +     skb->protocol = eth_type_trans(skb, skb->dev);
> > +
> > +     if (lan966x->bridge_mask & BIT(src_port)) {
> > +             skb->offload_fwd_mark = 1;
> > +
> > +             skb_reset_network_header(skb);
> > +             if (!lan966x_hw_offload(lan966x, src_port, skb))
> > +                     skb->offload_fwd_mark = 0;
> > +     }
> > +
> > +     skb->dev->stats.rx_bytes += skb->len;
> > +     skb->dev->stats.rx_packets++;
> > +
> > +     return skb;
> > +}
> 
> [Severity: High]
> This isn't a bug introduced by this patch - lan966x_fdma_rx_get_frame() in
> lan966x_fdma.c has the same caller pattern - but can lan966x_fdma_pci_rx_get_frame()
> touch skb after lan966x_hw_offload() has already freed it?

Yes, but pre-existing. I think this deserves a proper fix through net and
updates for all callers.

> 
> lan966x_hw_offload() replaces the buffer and reports only a boolean:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_main.c:lan966x_hw_offload() {
>         ...
>         if (eth_type_vlan(skb->protocol)) {
>                 skb = skb_vlan_untag(skb);
>                 if (unlikely(!skb))
>                         return false;
>         }
>         ...
> }
> 
> and skb_vlan_untag() frees the caller's skb on failure:
> 
> net/core/skbuff.c:skb_vlan_untag() {
>         ...
>         if (unlikely(!pskb_may_pull(skb, VLAN_HLEN + sizeof(unsigned short))))
>                 goto err_free;
>         ...
> err_free:
>         kfree_skb(skb);
>         return NULL;
> }
> 
> So on the false return the caller's pointer is dangling, and
> lan966x_fdma_pci_rx_get_frame() then does:
> 
>         skb->offload_fwd_mark = 0;
>         skb->dev->stats.rx_bytes += skb->len;
>         skb->dev->stats.rx_packets++;
>         return skb;
> 
> with the returned skb going to napi_gro_receive() in
> lan966x_fdma_pci_napi_poll().
> 
> Is the new lower bound in lan966x_fdma_pci_rx_size_fits() wide enough to let
> this happen? IFH_LEN_BYTES + ETH_HLEN + ETH_FCS_LEN is 46, so a BLOCKL of
> 46..51 is accepted, and after skb_pull(IFH_LEN_BYTES),
> skb_trim(skb->len - ETH_FCS_LEN) and eth_type_trans() there are only 0..5
> bytes left. For a frame with h_proto 0x8100 on a bridged port that has IGMP
> or MLD redirection enabled, the pskb_may_pull(VLAN_HLEN + 2) inside
> skb_vlan_untag() then fails and the buffer is freed.
> 
> Would it make sense to have lan966x_hw_offload() take a struct sk_buff **,
> or to have the caller stop using skb once it returns false?
> 
> >  static int lan966x_fdma_pci_xmit(struct sk_buff *skb, __be32 *ifh,
> 
> [ ... ]
> 
> --
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

