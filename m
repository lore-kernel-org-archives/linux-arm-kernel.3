Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA6CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTGQLtk2Sz9sJZfxveMtPbe8gYcHCytlxvM4OEIC5Oc=; b=m6aZmR/GkRacVjmBhQOAHCfV1h
	oBaBCia3KJR23Jdw+d8N3/AOiz6EY6jt5l5V4sBNwZKpfxVD5UlKvdpXAOOsyTRKJDD1mwBp6235B
	9rUqHLdjP9iSN0XoYgddRliwdi42FzdtQFEX7hT/JWLSt+p2P3sYzWoD0nWFJag1V0thQvrZ11aPU
	CLxu4hInfA2JUbAfT73t4OY2o+HNS0cKx9b7ANl7mjiQsi3+tEJsNCXmzAeral6vXy+Dqpcx8bGrh
	bWOLmlbmguXEz4VJE2CxMS/BUBpnYzIjOu4i+H4JEJKIWBJtPZDbZvJw70WtZWie/uBaWr1njCQ+5
	Dt2mRDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLvi-0000000BPAk-0wd9;
	Mon, 12 Oct 2026 19:43:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLve-0000000BP9t-47L0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791834204; x=1823370204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46e1U6DavjbOemIRYpekVuACQIQhaJ1HQ/H/m0zwm8Y=;
  b=YrZ/LvGctT8SpELxuehys1Ll8mGcHVrWJswWFxP4MJYXbBOAtiK1Qu2k
   +bdfROJJTQmEyGbBDFv3VKPJ3VepwfluntCbwg8+pPlnMRY0pyqoz0YfR
   S8a/evSOEpUwSZHEtQZdfbhu8H9O8yG1mSU539TiVgcBJZkCdfLRiHg8e
   PnJ+U9r8BKXn+QGXZdEQtGdSpfG2G0kJ6qy1JnpjElcnc95vSz7QvrHoP
   RpAtY0PrclGKeuOOMKLvV/ECgEXZRXFbG6Ka6DPQVqUe2FX6njnd5/th7
   9kzK1LF7vFcOCU5Ajo3KOStKKSYZvSHTUuINOjE9WL5IWTHjEqJxC34GU
   g==;
X-CSE-ConnectionGUID: Z5px7yJ/SWqdbS/RQmR7RQ==
X-CSE-MsgGUID: ri7xwyZNQO+xB8N1XTZv9A==
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="75255144"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:43:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Mon, 12 Oct 2026 12:43:21 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 12 Oct 2026 12:43:18 -0700
Date: Mon, 12 Oct 2026 21:43:17 +0200
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
Message-ID: <20261012194317.o642ym7ddsmny25x@DEN-DL-M70577.microsemi.net>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_124323_252280_72E9AAA1 
X-CRM114-Status: GOOD (  23.50  )
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

> When RX buffers are compound pages (order > 0), only the head page
> carries the DMA address programmed by the page pool
> (page_pool_get_dma_addr()). stmmac_xdp_xmit_xdpf() computed the head
> buffer's bus address from the page that happens to contain the data:
> 
> 	page = frag ? skb_frag_page(frag)
> 		    : virt_to_page(xdpf->data);
> 	dma_addr = page_pool_get_dma_addr(page);
> 	...
> 
> RX pages become compound as soon as dma_buf_sz needs more than one page
> (pp_params.order = order_base_2(num_pages) > 0), which happens from an
> MTU around 3000 bytes once dma_buf_sz reaches 4096. If an XDP program
> moves the data forward with bpf_xdp_adjust_head() by more than about a
> page, xdpf->data points into a tail page whose struct page has no DMA
> address: page_pool_get_dma_addr() then returns a bogus bus address, and
> dma_sync_single_for_device() together with the TX descriptor transmit
> from the wrong location.

Looks to me like mtu > ETH_DATA_LAN is rejected when setting a prog, and also
on mtu change when a prog is attached. So can this even happen today?

> 
> Use virt_to_head_page() to read the DMA base of the buffer and keep the
> offset relative to the head page (sizeof(*xdpf) + xdpf->headroom), which
> is correct no matter which page the data ends up in.

I think the fix looks correct.

> 
> Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b8b4de4c5b1a..ca61ab449e32 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5301,7 +5301,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  			struct page *page;
>  
>  			page = frag ? skb_frag_page(frag)
> -				    : virt_to_page(xdpf->data);
> +				    : virt_to_head_page(xdpf->data);
>  			dma_addr = page_pool_get_dma_addr(page);
>  			if (frag)
>  				dma_addr += skb_frag_off(frag);
> 
> -- 
> 2.56.0
> 

/Daniel

