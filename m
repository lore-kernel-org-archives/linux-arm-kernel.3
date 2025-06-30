Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAEBC83038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ykkdq5dP0u/etXS+eO5X0bCbRkZdQiuVu7/uLxddAZg=; b=T0XeV9aGaubyyiUW0M150N4+wu
	KxO1jG8ncVHUxFpYb1xeMoe5duWhuZEiRENfenQ3K70blBvIz+ckENiPM9jTiHD6tOoXwbrlrJ2N/
	tqciiEYSwIYdXFtS+lSVA/uehNDK2lXqiB99kxOyuiM8SXUBhpUUfBAr36ZizCSNmM9W+fWPstC3x
	W0S8WAs/PmkY/iQNexCBhab3yB0oEfPmxEPaIMLhEpTxztblrz8b+//Vx6HidGpSNfs9OBOfGIzrA
	C6OgdvQcNAGu6IPpQFKIZRr7H+3ZT2FhXwZPjTXwzlwXsI3kL2qUJoR2R/LsIvXlT0EM8GManNCox
	URonQEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKI8-00000003J16-2J5I;
	Mon, 30 Jun 2025 19:35:48 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ6u-00000003BNu-0Hy4;
	Mon, 30 Jun 2025 18:20:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWJ6Y-000000006fR-2UuI;
	Mon, 30 Jun 2025 18:19:46 +0000
Date: Mon, 30 Jun 2025 19:19:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Simon Horman <horms@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
Message-ID: <aGLVPo9M-RhTowmw@makrotopia.org>
References: <cover.1751229149.git.daniel@makrotopia.org>
 <61897c7a3dcc0b2976ec2118226c06c220b00a80.1751229149.git.daniel@makrotopia.org>
 <20250630162959.GA57523@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630162959.GA57523@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_112008_105967_7B46F012 
X-CRM114-Status: GOOD (  26.76  )
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

On Mon, Jun 30, 2025 at 05:29:59PM +0100, Simon Horman wrote:
> On Sun, Jun 29, 2025 at 11:22:44PM +0100, Daniel Golle wrote:
> > Use a dedicated "mmio-sram" and the genpool allocator instead of
> > open-coding SRAM allocation for DMA rings.
> > Keep support for legacy device trees but notify the user via a
> > warning to update.
> > 
> > Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v2: fix return type of mtk_dma_ring_alloc() in case of error
> > 
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 120 +++++++++++++-------
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   4 +-
> >  2 files changed, 84 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> 
> ...
> 
> > @@ -5117,16 +5148,27 @@ static int mtk_probe(struct platform_device *pdev)
> >  			err = -EINVAL;
> >  			goto err_destroy_sgmii;
> >  		}
> > +
> >  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
> > -			if (mtk_is_netsys_v3_or_greater(eth)) {
> > -				res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > -				if (!res_sram) {
> > -					err = -EINVAL;
> > -					goto err_destroy_sgmii;
> > +			eth->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> > +			if (!eth->sram_pool) {
> > +				if (!mtk_is_netsys_v3_or_greater(eth)) {
> > +					/*
> > +					 * Legacy support for missing 'sram' node in DT.
> > +					 * SRAM is actual memory and supports transparent access
> > +					 * just like DRAM. Hence we don't require __iomem being
> > +					 * set and don't need to use accessor functions to read from
> > +					 * or write to SRAM.
> > +					 */
> > +					eth->sram_base = (void __force *)eth->base +
> > +							 MTK_ETH_SRAM_OFFSET;
> > +					eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
> > +					dev_warn(&pdev->dev,
> > +						 "legacy DT: using hard-coded SRAM offset.\n");
> > +				} else {
> > +					dev_err(&pdev->dev, "Could not get SRAM pool\n");
> > +					return -ENODEV;
> 
> Hi Daniel,
> 
> Rather than returning, should this
> jump to err_destroy_sgmii to avoid leaking resources?

Yes, you are right. I'll fix that in v3.

