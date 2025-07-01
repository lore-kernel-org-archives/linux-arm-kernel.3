Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BC9C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dd7QkhhLgybTvngS3Mt0OP4YTQvR8YV4zvUQV+Qq/k=; b=GAnHbYrbNw/bckdvuTzdoUrJX4
	vHNOEaJEP9AvYHvdXoh8PoQFuqv+ayLlYhclqnRzgZaXcKBBs17m6hlp7HPmaESFiv04hZBpi3d1x
	9YReSXTjuRmIc8vNW7UgN6Qpo1AAP93lR8WSLzVAwE7xVxQPYZxxT8ZUmpHiYnBrh6cORmg9fovlH
	hRtpmMEX/2AyvKffnVUNZq4dN4qmtt+eL2tooEzvl8AY7FDhS/SGiU46EhvMjIcZoJysySoSntPFo
	3DUcY0/HExXBNIRB6iPRYuIZuq75pWJpouKApivst09M8OB26WpNKrDuBYeKItxQ0ujodiDPEGYx4
	OnKcMjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbsn-00000005gd5-19ag;
	Tue, 01 Jul 2025 14:22:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaSa-00000005NyI-3qil;
	Tue, 01 Jul 2025 12:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F5B45C48DB;
	Tue,  1 Jul 2025 12:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4D2C4CEEB;
	Tue,  1 Jul 2025 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751374299;
	bh=hcZz3rU5GXHb1XwGjVGR0cCvs4ggRLDrLsKOp0GI6yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCT9E9CLG+oV0efdzT66es8TgBeQDw2n0sCcdC9KxaF1ZLQzoYQ6GnJvF6RMqQS0K
	 7R+00L0purFY8aNvakdp5I99wV3JQDUTdjkzerSV3+1EPEjcO9hF8c6cwu8twaJiTe
	 m4L1MjY28l4vQOP9Ar039RGk1iOO/fsOdMJ1a0QkN/HiY9Bv9iJ6rmSmGi0b39kAGU
	 84YZjvF9TeD2lgpnLgaK/+93PNTYwMPNJZMxsL0TkJS4XAroV7hcQug1Kj695cizYC
	 Uqi0ChRgr8gx5BrC8Q5LpmSSoBpuwe8Wz7BfeL5zyH2FWcnJeF3J5Am/gbAhPAYBiE
	 hQYb5J+AIgeew==
Date: Tue, 1 Jul 2025 13:51:33 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <20250701125133.GQ41770@horms.kernel.org>
References: <cover.1751229149.git.daniel@makrotopia.org>
 <61897c7a3dcc0b2976ec2118226c06c220b00a80.1751229149.git.daniel@makrotopia.org>
 <20250630162959.GA57523@horms.kernel.org>
 <aGLVPo9M-RhTowmw@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGLVPo9M-RhTowmw@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_055141_041052_F1F30740 
X-CRM114-Status: GOOD (  29.54  )
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

On Mon, Jun 30, 2025 at 07:19:42PM +0100, Daniel Golle wrote:
> On Mon, Jun 30, 2025 at 05:29:59PM +0100, Simon Horman wrote:
> > On Sun, Jun 29, 2025 at 11:22:44PM +0100, Daniel Golle wrote:
> > > Use a dedicated "mmio-sram" and the genpool allocator instead of
> > > open-coding SRAM allocation for DMA rings.
> > > Keep support for legacy device trees but notify the user via a
> > > warning to update.
> > > 
> > > Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > ---
> > > v2: fix return type of mtk_dma_ring_alloc() in case of error
> > > 
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 120 +++++++++++++-------
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   4 +-
> > >  2 files changed, 84 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > 
> > ...
> > 
> > > @@ -5117,16 +5148,27 @@ static int mtk_probe(struct platform_device *pdev)
> > >  			err = -EINVAL;
> > >  			goto err_destroy_sgmii;
> > >  		}
> > > +
> > >  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
> > > -			if (mtk_is_netsys_v3_or_greater(eth)) {
> > > -				res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > -				if (!res_sram) {
> > > -					err = -EINVAL;
> > > -					goto err_destroy_sgmii;
> > > +			eth->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> > > +			if (!eth->sram_pool) {
> > > +				if (!mtk_is_netsys_v3_or_greater(eth)) {
> > > +					/*
> > > +					 * Legacy support for missing 'sram' node in DT.
> > > +					 * SRAM is actual memory and supports transparent access
> > > +					 * just like DRAM. Hence we don't require __iomem being
> > > +					 * set and don't need to use accessor functions to read from
> > > +					 * or write to SRAM.
> > > +					 */
> > > +					eth->sram_base = (void __force *)eth->base +
> > > +							 MTK_ETH_SRAM_OFFSET;
> > > +					eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
> > > +					dev_warn(&pdev->dev,
> > > +						 "legacy DT: using hard-coded SRAM offset.\n");
> > > +				} else {
> > > +					dev_err(&pdev->dev, "Could not get SRAM pool\n");
> > > +					return -ENODEV;
> > 
> > Hi Daniel,
> > 
> > Rather than returning, should this
> > jump to err_destroy_sgmii to avoid leaking resources?
> 
> Yes, you are right. I'll fix that in v3.

Thanks.

