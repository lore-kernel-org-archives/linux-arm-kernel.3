Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FB1C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl5z/56z75RrAT7yDljKb5lJeoAsDKUD0n3oKRpJTBM=; b=AiGLQXQ4yHZplju63U+D60y7PZ
	tu0kebarawBu4uJQa2oFwSGibA8QSH7arXTDPK6ePyxhi13Qetc7PzC/ZD4jI5o+fUr/TsiN2oWaf
	H8L1TruKeuN6+vYKcBMKQR0+vq0sWN62YwSipY1JUTug9ZYX5yp0o3LMwuvZxIUvzFjJEyVI/jkvq
	qCQ7oK3L0yw3FLNfJktdy13hZfamZ9MkM8yl3o/+ZE5V0k3qozxBMmo9QQeocb+ldIM0fLHXjY7Q7
	U7RVkej3t2BV8HK3V6KhvuBBfIYl+pvAgJ4cF/+E2bOJiqcFtsZb60MSw6tktPCApSFwaPb3vzWl8
	Hn1zXowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoJK-00000009QyX-3uJv;
	Wed, 18 Jun 2025 08:38:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoH7-00000009Qgb-26Wk;
	Wed, 18 Jun 2025 08:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EA186112C;
	Wed, 18 Jun 2025 08:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB5BC4CEE7;
	Wed, 18 Jun 2025 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750235764;
	bh=d+shUg6FUAacuvyB+a/E5gAXYy54EFgD47YG339obCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAACJ5VGbewT2iH4WiWM4CRpfDLwZ//JkoBE2fWzj9QNwPi4H0FoxlbaXLXMxhJLb
	 0SGsCz05+82z4FmUhdHw2lhX8HPOaQqTkm0IHKQbz7IVf0/quFlfCdtHex0S+iG7XR
	 yVDrxC3RsKmU1+AwqWgGRZGxfV1ja1vKRzChyHtCWYgdVIVxon4yPxf0+eSEuhMXqs
	 KV4aK3gWWVSW9MZEazq4MzOUTwLxdCebp4qxw982dLi9aA8zYjbw/JH5ppN/qnC0H1
	 VaGZBjHgEaHYaWR6jTrUDbb8uVocrWfukYLOOxZwMW1YR2aXDfGklRp0M+j0HcrPe4
	 b+qO3zIIMy3hA==
Date: Wed, 18 Jun 2025 09:35:56 +0100
From: Simon Horman <horms@kernel.org>
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
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Subject: Re: [net-next v4 3/3] net: ethernet: mtk_eth_soc: change code to
 skip first IRQ completely
Message-ID: <20250618083556.GE2545@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616080738.117993-4-linux@fw-web.de>
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

On Mon, Jun 16, 2025 at 10:07:36AM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
> IRQ (eth->irq[0]) was read but never used. Do not read it and reduce
> the IRQ-count to 2 because of skipped index 0.

Describing the first IRQ as read seems a bit confusing to me - do we read
it? And saying get or got seems hard to parse. So perhaps something like
this would be clearer?

... platform_get_irq() is called for the first IRQ (eth->irq[0]) but
it is never used.

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - drop >2 condition as max is already 2 and drop the else continue
> - update comment to explain which IRQs are taken in legacy way
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++++----
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 3ecb399dcf81..f3fcbb00822c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3341,16 +3341,28 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
>  {
>  	int i;
>  
> +	/* future SoCs beginning with MT7988 should use named IRQs in dts */

Perhaps this comment belongs in the patch that adds support for named IRQs.

>  	eth->irq[MTK_ETH_IRQ_TX] = platform_get_irq_byname(pdev, "tx");
>  	eth->irq[MTK_ETH_IRQ_RX] = platform_get_irq_byname(pdev, "rx");
>  	if (eth->irq[MTK_ETH_IRQ_TX] >= 0 && eth->irq[MTK_ETH_IRQ_RX] >= 0)
>  		return 0;
>  
> +	/* legacy way:
> +	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken from
> +	 * devicetree and used for rx+tx.
> +	 * On SoCs with non-shared IRQ the first was not used, second entry is
> +	 * TX and third is RX.

Maybe I am slow. But I had a bit of trouble parsing this.
Perhaps this is clearer?

        * devicetree and used for both RX and TX - it is shared.
	* On SoCs with non-shared IRQs the first entry is not used,
        * the second is for TX, and the third is for RX.

> +	 */
> +
>  	for (i = 0; i < MTK_ETH_IRQ_MAX; i++) {
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
> -		else
> -			eth->irq[i] = platform_get_irq(pdev, i);
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
> +			if (i == 0)
> +				eth->irq[MTK_ETH_IRQ_SHARED] = platform_get_irq(pdev, i);
> +			else
> +				eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
> +		} else {
> +			eth->irq[i] = platform_get_irq(pdev, i + 1);
> +		}
>  
>  		if (eth->irq[i] < 0) {
>  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);

...

