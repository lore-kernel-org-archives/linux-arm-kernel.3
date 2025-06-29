Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF09EC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Myxtx+Y7/VaI8ABGRupGWXUe5PVGaahjgE4X+AhP3TM=; b=Ypz0NYmIBQbrx68GxDTI/JWEmc
	zFOwEJoJ1JC9Mh/EJQwttOoWZumk3TuBlzyjkcSU4oRy8vsptW1I+dplXBwIo3z41EnNz1Lsqpv6J
	6I5qhrSg9x2/QcpRfgrlm20k16yoVfKMRi6GT/qCfq8A6hoshTeKBegzDCukGIJCzAbMHfxzDqZov
	PcOwrjR0DhPDIPiqt4f+Bv++Ug2YXf5ziLI+rG9t5nUE3ve/yi3Oxq69ZIVbl+HDBFDA75+tNoBvL
	AQVyOS1lOe2RcYTc21GbDThjELPtHfolPuSw0kR8r/pO3H4fJeA1TnnsgqmUgEQ3txOAA7AxT3PJR
	5VD5cMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwjD-00000000ZoY-1LNX;
	Sun, 29 Jun 2025 18:26:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwgt-00000000ZY0-34fU;
	Sun, 29 Jun 2025 18:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Myxtx+Y7/VaI8ABGRupGWXUe5PVGaahjgE4X+AhP3TM=; b=2BExNKnzg/xdwxUfR70MEs+omD
	rWHPQp6QwjrGMrAaY5LVF0Yq8UVGDbvUgH7dP/sK9feaCAJs8J+aY4XPYsaMRVQBMHNxAcqKrrvSA
	p4Tq1D+srrUj+fQc/tZ1J6T7lq8RjAAXTAHbHI11eNajevRsOL3fbUkQP8gNsiHoIdzo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uVwgi-00HIEC-Uz; Sun, 29 Jun 2025 20:23:36 +0200
Date: Sun, 29 Jun 2025 20:23:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <ea30ed46-b0b5-4ade-8267-f6f4a45fdd5d@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
 <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
 <aGFM1UQ1P3IQjoex@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGFM1UQ1P3IQjoex@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_112347_775631_05FCA756 
X-CRM114-Status: GOOD (  17.66  )
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

On Sun, Jun 29, 2025 at 03:25:25PM +0100, Daniel Golle wrote:
> On Sat, Jun 28, 2025 at 10:13:51AM +0200, Andrew Lunn wrote:
> > > +static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
> > > +				dma_addr_t *dma_handle)
> > > +{
> > > +	void *dma_ring;
> > > +
> > > +	if (WARN_ON(mtk_use_legacy_sram(eth)))
> > > +		return -ENOMEM;
> > > +
> > > +	if (eth->sram_pool) {
> > > +		dma_ring = (void *)gen_pool_alloc(eth->sram_pool, size);
> > > +		if (!dma_ring)
> > > +			return dma_ring;
> > > +		*dma_handle = gen_pool_virt_to_phys(eth->sram_pool, (unsigned long)dma_ring);
> > 
> > I don't particularly like all the casting backwards and forwards
> > between unsigned long and void *. These two APIs are not really
> > compatible with each other. So any sort of wrapping is going to be
> > messy.
> > 
> > Maybe define a cookie union:
> > 
> > struct mtk_dma_cookie {
> > 	union {
> > 		unsigned long gen_pool;
> > 		void *coherent;
> > 	}
> > }
> 
> I've implemented that idea and the diffstat grew quite a lot. Also,
> it didn't really make the code more readable (see below why).

O.K, thanks for trying. Please keep with the casts back and forth.

	Andrew

