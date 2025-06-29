Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA270C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsAnUNCeAQMgmRMgnpNuSgudOIjBf1HmAiS1Sp4b8qg=; b=Y9cu2Jhfh2ONGXQj0EEZWFs0vh
	2aI26TWv/gt5xCrKgZAhVpj2sW8rOi8JCUsOw+ASsd2BxoIgl4cspAUCk7pBC+d7HKguZo9vGYQDa
	cq6AE7YPPyK4Kdgi/wPOHZ7zqNhW3yZvMQ4gRBKWB9NJcwSoejWysjGFSlAdA5CrsW2WpKCkczE04
	zsSmjke4LZPXLYWw0FitB0/qTkqH7hhJ+mjKmbdAqFbynTMPiH2mtgVQDdP5IynjrBOrrkABBZDRS
	pwehhMuylCghz7zJh+BLCFIuJu6txd5YOXBDOqmUKmoTTibCeccxzK1l8Da0klPiigVmyvpCVfHqU
	+TtS8UDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVt0r-00000000MH4-360p;
	Sun, 29 Jun 2025 14:28:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVsyX-00000000Lzo-0fUg;
	Sun, 29 Jun 2025 14:25:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uVsyM-0000000015j-3WGk;
	Sun, 29 Jun 2025 14:25:34 +0000
Date: Sun, 29 Jun 2025 15:25:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sky Huang <skylake.huang@mediatek.com>, netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
Message-ID: <aGFM1UQ1P3IQjoex@makrotopia.org>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
 <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_072545_196988_4FFF7521 
X-CRM114-Status: GOOD (  18.48  )
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

On Sat, Jun 28, 2025 at 10:13:51AM +0200, Andrew Lunn wrote:
> > +static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
> > +				dma_addr_t *dma_handle)
> > +{
> > +	void *dma_ring;
> > +
> > +	if (WARN_ON(mtk_use_legacy_sram(eth)))
> > +		return -ENOMEM;
> > +
> > +	if (eth->sram_pool) {
> > +		dma_ring = (void *)gen_pool_alloc(eth->sram_pool, size);
> > +		if (!dma_ring)
> > +			return dma_ring;
> > +		*dma_handle = gen_pool_virt_to_phys(eth->sram_pool, (unsigned long)dma_ring);
> 
> I don't particularly like all the casting backwards and forwards
> between unsigned long and void *. These two APIs are not really
> compatible with each other. So any sort of wrapping is going to be
> messy.
> 
> Maybe define a cookie union:
> 
> struct mtk_dma_cookie {
> 	union {
> 		unsigned long gen_pool;
> 		void *coherent;
> 	}
> }

I've implemented that idea and the diffstat grew quite a lot. Also,
it didn't really make the code more readable (see below why).

> 
> Only dma_handle appears to be used by the rest of the code, so only
> the _alloc and _free need to know about the union.

That's not true. The void* ring->dma is used to access the RX and TX
descriptors, so keeping it void* is useful and using the struct you
are suggesting will make things even more messy than they already are.

See all the places in the code where we assume ring->dma being void*.
Converting all of those to use struct mtk_dma_cookie will not make things
better imho.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n1337

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n1345

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n1358

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n1804

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n2172

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n2490

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n2638

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n2668

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_eth_soc.c#n2904

I think keeping the two casts in mtk_dma_ring_alloc() and
mtk_dma_ring_free() is the better option.

