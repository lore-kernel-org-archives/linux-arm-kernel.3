Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27255CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVCEaUKn6RAX5yJ7iBZGClhEyIFmUGc/TMZ8yV3lLl0=; b=3QL65No7EVhpsB0lKcjO0L+70Q
	Q5k02EI8gg0QFJONrLq+WGZvvjmPHCJvQWNI9amWb0oq4ypFLUW/1M8URQq+b0RLGbhkjpS7KFqqo
	GYgvhg7bJ2ofUtJQuMuWXye0/NjjGi1PJUS3zvrGi2LUKO7w7Ajo+iPR3GLb4PsGEuNPubYaBf7Wr
	QMHQ25G9PD+1Trj972N9U1Y7oas2WEYr+scJxejC9wgV4YrKqEq7SRGvsw16lsz6EFEghHcplGBDo
	z7k0a3rMBEVh9z77xk44T+UuiOiYG8annCmUQbSbIIwNI+AiPJZKtULlOu88pbz7LnurIZ4f+N0bZ
	hXQsSIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXLM-0000000CGiI-0DHt;
	Tue, 13 Oct 2026 07:54:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXLI-0000000CGh8-0bWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791878076; x=1823414076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HZBlcHp/BWFoEMR6Fp47RlBLZKIgW549n1fkDUHGAXU=;
  b=S3/c4Xc6vMyvAh1Ry+O+Dn4ECBE+QoH7SfG1J/+jpNR6uRwl2w3IhPKh
   VE+EBfJO2uaqPNMokLv2A19TU9+lra6OSoVhVMD26hxs8V65FY7x1X72R
   6kVy5/6DZVTEchLOo7NBmQmNPbdQpPW2vxPX+7x/6fIYrsRo74qD/qplT
   lW+vjzZJJXu606hO/0059VnuMeMDo1by5wWY9c4iqF8wROWKJWdcha3Lu
   /jV3A85XLEo9cyPDPUxA2TTXdUPe6HvLZCoMojN00W4POLp6m/VRrtbKk
   F/9BOGsp3HIhHxDY0KFC/D5KUO7mH5i5myhAdAQcwFEdTIb2s+bM79Qzb
   Q==;
X-CSE-ConnectionGUID: h3CEN31aTviRUZfHx3weuQ==
X-CSE-MsgGUID: R/KshpZzRGqazUOD0C6WAQ==
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="75296097"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:54:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 13 Oct 2026 00:54:34 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 00:54:31 -0700
Date: Tue, 13 Oct 2026 09:54:30 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
CC: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
	<hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Ong Boon Leong <boon.leong.ong@intel.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<bpf@vger.kernel.org>
Subject: Re: [PATCH net-next 1/2] net: stmmac: fix XDP TX DMA address for
 compound RX pages
Message-ID: <20261013075430.cptcdk3ra6ordhd5@DEN-DL-M70577.microsemi.net>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
 <20261012194317.o642ym7ddsmny25x@DEN-DL-M70577.microsemi.net>
 <as1HVdDa4yN4yp11@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <as1HVdDa4yN4yp11@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_005436_413656_28CA9EBD 
X-CRM114-Status: GOOD (  32.37  )
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

Hi Lorenzo,

> > Hi Lorenzo,
> 
> Hi Daniel,
> 
> > 
> > > When RX buffers are compound pages (order > 0), only the head page
> > > carries the DMA address programmed by the page pool
> > > (page_pool_get_dma_addr()). stmmac_xdp_xmit_xdpf() computed the head
> > > buffer's bus address from the page that happens to contain the data:
> > > 
> > > 	page = frag ? skb_frag_page(frag)
> > > 		    : virt_to_page(xdpf->data);
> > > 	dma_addr = page_pool_get_dma_addr(page);
> > > 	...
> > > 
> > > RX pages become compound as soon as dma_buf_sz needs more than one page
> > > (pp_params.order = order_base_2(num_pages) > 0), which happens from an
> > > MTU around 3000 bytes once dma_buf_sz reaches 4096. If an XDP program
> > > moves the data forward with bpf_xdp_adjust_head() by more than about a
> > > page, xdpf->data points into a tail page whose struct page has no DMA
> > > address: page_pool_get_dma_addr() then returns a bogus bus address, and
> > > dma_sync_single_for_device() together with the TX descriptor transmit
> > > from the wrong location.
> > 
> > Looks to me like mtu > ETH_DATA_LAN is rejected when setting a prog, and also
> > on mtu change when a prog is attached. So can this even happen today?
> 
> yes, these issues are real but at the moment we can't trigger them since we
> have the MTU limitation in stmmac_change_mtu()/stmmac_xdp_set_prog().
> These are preliminary fixes in order to remove this limitation.
> There is a leftover issue we still need to fix about jumbo frames in
> stmmac_xdp_xmit_xdpf().

Thanks for clarifying.

> 
> Regards,
> Lorenzo
> 
> > 
> > > 
> > > Use virt_to_head_page() to read the DMA base of the buffer and keep the
> > > offset relative to the head page (sizeof(*xdpf) + xdpf->headroom), which
> > > is correct no matter which page the data ends up in.
> > 
> > I think the fix looks correct.
> > 
> > > 
> > > Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index b8b4de4c5b1a..ca61ab449e32 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -5301,7 +5301,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
> > >  			struct page *page;
> > >  
> > >  			page = frag ? skb_frag_page(frag)
> > > -				    : virt_to_page(xdpf->data);
> > > +				    : virt_to_head_page(xdpf->data);
> > >  			dma_addr = page_pool_get_dma_addr(page);
> > >  			if (frag)
> > >  				dma_addr += skb_frag_off(frag);
> > > 
> > > -- 
> > > 2.56.0
> > > 
> > 
> > /Daniel

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

