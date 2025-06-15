Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1C9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGR1ebY5b7ykaUSpY2RBO2NN/C5bzKKRJIMKZny/e1M=; b=Te9oohr+9dlsrMmcCK2sO/Tywu
	NpdqtC8d/5yAEOjIAkuMHpFEHg8uXxMvwtv7hl+s5ckVNJ+qXf5HrK29fp1jhVWICvpjbZXD+bGRo
	W2NwOllHSOXXri3oqSeVSsgZ+8/Ci82bal3ULNl3YMMXGY0FEjgrovHLf6BundS47xhLXzbZcyxoC
	gwhiPT2/fSikYaX/McGNMwIwltzV11TfFfLWOfkQGVnPK5K6gpYNPMJeWKYZYj0cYs1cGNuQhHS9Q
	uz7402csvvuvbR+YDtY5WC6GZW3hVO5uz4t1MumrQxlb1TSJcIcrLUddFfOdVC4jyklQchtWKj7+R
	VFGs48IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQjgE-00000002On0-2fyP;
	Sun, 15 Jun 2025 09:29:34 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQje2-00000002Ogi-3KNP;
	Sun, 15 Jun 2025 09:27:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uQjVM-0000000014M-10eE;
	Sun, 15 Jun 2025 09:27:02 +0000
Date: Sun, 15 Jun 2025 11:26:39 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <aE6Rz1l3kfeCFNdY@pidgin.makrotopia.org>
References: <20250615084521.32329-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615084521.32329-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_022718_831822_4F588624 
X-CRM114-Status: GOOD (  28.29  )
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

On Sun, Jun 15, 2025 at 10:45:19AM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add named interrupts and keep index based fallback for exiting devicetrees.
> 
> Currently only rx and tx IRQs are defined to be used with mt7988, but
> later extended with RSS/LRO support.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Simon Horman <horms@kernel.org>
> ---
> v2:
> - move irqs loading part into own helper function
> - reduce indentation
> - place mtk_get_irqs helper before the irq_handler (note for simon)
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 39 +++++++++++++++------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b76d35069887..81ae8a6fe838 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3337,6 +3337,30 @@ static void mtk_tx_timeout(struct net_device *dev, unsigned int txqueue)
>  	schedule_work(&eth->pending_work);
>  }
>  
> +static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
> +{
> +	int i;
> +
> +	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
> +	eth->irq[2] = platform_get_irq_byname(pdev, "rx");

In addition to Lorenzo's comment to reduce the array to the actually used
IRQs, I think it would be nice to introduce precompiler macros for the irq
array index, ie. once the array is reduce to size 2 it could be something
like

#define MTK_ETH_IRQ_SHARED 0
#define MTK_ETH_IRQ_TX 0
#define MTK_ETH_IRQ_RX 1
#define __MTK_ETH_IRQ_MAX MTK_ETH_IRQ_RX

That would make all the IRQ code more readable than having to deal with
numerical values.

> +	if (eth->irq[1] >= 0 && eth->irq[2] >= 0)
> +		return 0;
> +
> +	for (i = 0; i < 3; i++) {
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> +			eth->irq[i] = eth->irq[0];
> +		else
> +			eth->irq[i] = platform_get_irq(pdev, i);
> +
> +		if (eth->irq[i] < 0) {
> +			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t mtk_handle_irq_rx(int irq, void *_eth)
>  {
>  	struct mtk_eth *eth = _eth;
> @@ -5106,17 +5130,10 @@ static int mtk_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	for (i = 0; i < 3; i++) {
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] = eth->irq[0];
> -		else
> -			eth->irq[i] = platform_get_irq(pdev, i);
> -		if (eth->irq[i] < 0) {
> -			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> -			err = -ENXIO;
> -			goto err_wed_exit;
> -		}
> -	}
> +	err = mtk_get_irqs(pdev, eth);
> +	if (err)
> +		goto err_wed_exit;
> +
>  	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
>  		eth->clks[i] = devm_clk_get(eth->dev,
>  					    mtk_clks_source_name[i]);
> -- 
> 2.43.0
> 

