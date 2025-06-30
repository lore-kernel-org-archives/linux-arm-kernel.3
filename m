Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECA8C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awZjfbKFfxqOGQ7r6snUTi/ikRJxrFTKlvF1V0NogYU=; b=uwRZPJNCofW4j/vRtuBB7/z0A/
	khSuH8x4izh4dpvJY3y+1jU8HLtCJuw2XoY51QAPinEmEPkR2YA87syJMHLlaQ7OU+x/rmr+98TTA
	XsunYYnQd+2UuyzJLtCPKzNH4um86HjBpotbn3BvgAF8qJmBHH6RPK2fbUTX2eTP3zCY9ZnFNEskH
	Njm7Sf8DfguR1sbPKeIfq+Ei3E857760fIKEtWzdvAWkNajpk/DDEhTX2Pvwn58yHTsLY+Qqy4WoK
	3DUIuMQABzSNnMn22vPwbI6JTI5sRw5NxlZyjPbc7jqfXuoELBVy/4FNa7fBQEv89dHHTNqIwn26H
	gMZTqnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIZx-000000036eU-1hFq;
	Mon, 30 Jun 2025 17:46:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHOT-00000002vm8-0jWA;
	Mon, 30 Jun 2025 16:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0A3F61126;
	Mon, 30 Jun 2025 16:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B14FC4CEE3;
	Mon, 30 Jun 2025 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751301006;
	bh=0HxkYgJxPovw38S/ncV1y0Tb+2e4bvKdNpiGuJwX7+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWS6p1ZqJY1wyPDCa5Q+4k7uUZFH7e1dhC6M0vVyKzT0AWn1SyJC1X1g/4Hqu/63a
	 3WJAloRinPotqkJKcJxkD7KgWvhkyIcaKT8cfy6pTMBVbKyFRUTqRrNd51K/P+gy3G
	 8Yp58LunVtmh0MFDS+s35dAS32ijVX60vAV6hmVTY0b2dHAbKmPBb7v1XH58A29SGo
	 H3hoDDjwJ5fUR/VD9TgSokq65t0ANmV6I8CsnYSpRaJmBF/i7wY3OS+jRqqxRiefw/
	 qzfYVjeL+W/AC+4ihwgUS1oDXrhHGh9KWunYqEVkUDgyXYkIoQDFOg+b98ZAZmbje9
	 Vdsgs/5TwzvlQ==
Date: Mon, 30 Jun 2025 17:29:59 +0100
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
Message-ID: <20250630162959.GA57523@horms.kernel.org>
References: <cover.1751229149.git.daniel@makrotopia.org>
 <61897c7a3dcc0b2976ec2118226c06c220b00a80.1751229149.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61897c7a3dcc0b2976ec2118226c06c220b00a80.1751229149.git.daniel@makrotopia.org>
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

On Sun, Jun 29, 2025 at 11:22:44PM +0100, Daniel Golle wrote:
> Use a dedicated "mmio-sram" and the genpool allocator instead of
> open-coding SRAM allocation for DMA rings.
> Keep support for legacy device trees but notify the user via a
> warning to update.
> 
> Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: fix return type of mtk_dma_ring_alloc() in case of error
> 
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 120 +++++++++++++-------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   4 +-
>  2 files changed, 84 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c

...

> @@ -5117,16 +5148,27 @@ static int mtk_probe(struct platform_device *pdev)
>  			err = -EINVAL;
>  			goto err_destroy_sgmii;
>  		}
> +
>  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
> -			if (mtk_is_netsys_v3_or_greater(eth)) {
> -				res_sram = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -				if (!res_sram) {
> -					err = -EINVAL;
> -					goto err_destroy_sgmii;
> +			eth->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +			if (!eth->sram_pool) {
> +				if (!mtk_is_netsys_v3_or_greater(eth)) {
> +					/*
> +					 * Legacy support for missing 'sram' node in DT.
> +					 * SRAM is actual memory and supports transparent access
> +					 * just like DRAM. Hence we don't require __iomem being
> +					 * set and don't need to use accessor functions to read from
> +					 * or write to SRAM.
> +					 */
> +					eth->sram_base = (void __force *)eth->base +
> +							 MTK_ETH_SRAM_OFFSET;
> +					eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
> +					dev_warn(&pdev->dev,
> +						 "legacy DT: using hard-coded SRAM offset.\n");
> +				} else {
> +					dev_err(&pdev->dev, "Could not get SRAM pool\n");
> +					return -ENODEV;

Hi Daniel,

Rather than returning, should this
jump to err_destroy_sgmii to avoid leaking resources?

Flagged by Smatch.

>  				}
> -				eth->phy_scratch_ring = res_sram->start;
> -			} else {
> -				eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
>  			}
>  		}
>  	}

