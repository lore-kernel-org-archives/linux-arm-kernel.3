Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105DEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 01:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cy57ya/GMRkoNPQ27o02jqVC0oevcgJ37yw2d20zGA=; b=H9ehfJsXwPhyXIwx4OsObdksxI
	iX30gDk820qnQ7rtPZo298J17QkSlb6MzRZq126XVuo8z77HUivx9G3Q1HavACFZuJnfaQlE12Oye
	jUlukV6noBxQkFziwzdfxzeXS06QOXAbySlAHLOcxfin13pdBYC+9IExiFTeBJ94XUGs0Si/AkHnf
	U8EuXCtlQoTNJ99FzBUmDgmMmGUnNjc7kLRO1yPju47uAi8pzBlD4RQdVOlL+fizOLwxE30EDsixz
	QLjQVzJRAd7r2aY0ADVXHjuCcHFNDrnz/uHhT2WQYTBYtYloNp+cwMfQcu/3BL9zjZGT8UPpmIJjN
	IHu/roWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8UUy-00000001GVp-0qFA;
	Sat, 26 Apr 2025 01:38:32 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8UT5-00000001GMV-17k5;
	Sat, 26 Apr 2025 01:36:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u8UNB-000000007iz-3kmJ;
	Sat, 26 Apr 2025 01:36:25 +0000
Date: Sat, 26 Apr 2025 02:36:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Chad Monroe <chad@monroe.io>, Felix Fietkau <nbd@nbd.name>,
	Bc-Bocun Chen <bc-bocun.chen@mediatek.com>,
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
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix SER panic with 4GB+
 RAM
Message-ID: <aAw4lsGc_5HwBeiK@makrotopia.org>
References: <995df78417d6f117062d1d7ef63228426b97a26e.1745630570.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995df78417d6f117062d1d7ef63228426b97a26e.1745630570.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_183635_302338_8E1BA1DA 
X-CRM114-Status: GOOD (  19.73  )
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

On Sat, Apr 26, 2025 at 02:25:23AM +0100, Daniel Golle wrote:
> From: Chad Monroe <chad@monroe.io>
> 
> If the mtk_poll_rx() function detects the MTK_RESETTING flag, it will
> jump to release_desc and refill the high word of the SDP on the 4GB RFB.
> Subsequently, mtk_rx_clean will process an incorrect SDP, leading to a
> panic.
> 
> Add patch from Mediatek SDK to resolve this.
> 
> Fixes: 2d75891ebc09 ("net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988")
> Link: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/11857ce2f90bf065b5e53211d182622d999a4542

The above link has to be replaced by
Link: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/71f47ea785699c6aa3b922d66c2bdc1a43da25b1

> Signed-off-by: Chad Monroe <chad@monroe.io>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 47807b202310..7bac5ccfb79c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2252,14 +2252,17 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		ring->data[idx] = new_data;
>  		rxd->rxd1 = (unsigned int)dma_addr;
>  release_desc:
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
> +			if (unlikely(dma_addr == DMA_MAPPING_ERROR))
> +				addr64 = FIELD_GET(RX_DMA_ADDR64_MASK, rxd->rxd2);
> +			else
> +				addr64 = RX_DMA_PREP_ADDR64(dma_addr);
> +		}
> +
>  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
>  			rxd->rxd2 = RX_DMA_LSO;
>  		else
> -			rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
> -
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA) &&
> -		    likely(dma_addr != DMA_MAPPING_ERROR))
> -			rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
> +			rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size) | addr64;
>  
>  		ring->calc_idx = idx;
>  		done++;
> -- 
> 2.49.0
> 
> 

