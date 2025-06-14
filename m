Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEE3C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnh3I6N2vwHaG7hUABhR7dRSMyHRGfDGJJx8tTRG/tU=; b=WDSorPEtDzrUl4XT0sIUlUXWqd
	36c3gcYAerAaPS8pdRghR7FomoRfMaKUwQ1Xgzzo275hcXjdoVYVgb/VbU+SYBbRizaIlnWinv3Zo
	4gL2RKv1nH24yuzSht6bxh5ckANscsLHZEq7QqUVUEj/kmxeqncbec8LTKffTXxFpNzEH512K88Q2
	A+KESRISBDZOGuLD3nrj7OD+8Mfo6r6SGXOskz13sSBRDdonhggc21XpxHaY9fscAFw4bm/z7jlVK
	7djxQWJeuEkJyCESr2m2WsYyTbeLb7F9jMBm+qrf8ahP2vGSrQtVQ1TH/nXVEIvn2iwaF5m8DmpUN
	9nUF20SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUlb-00000001aGi-1aaO;
	Sat, 14 Jun 2025 17:34:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUjQ-00000001a6A-431X;
	Sat, 14 Jun 2025 17:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E219743ED5;
	Sat, 14 Jun 2025 17:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57780C4CEEB;
	Sat, 14 Jun 2025 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749922311;
	bh=P+BrB0OUaNa56UdWZa5rw+h39uQANByq8vbDPUy1nj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEK2F54o22UzFG65tTbJ0eJGLwzvYnr6MZ41HqaI59pUgP2Zly4XuWFz69wDN8ulW
	 iKgkQs6AaOiwhD7ccKHcvA00mJNvfXunBjN3bqDjTLxiPUjaYgTTflO9iDVVlJPbsX
	 TjwJiRD7yjb5o/JIE94Rl6fdJkh2kgbjPsab8NyZX+qq3erJAulFWnyzf9WCSwcg3t
	 UU7buH17UGkxBTsAcPyLq5H0kHVyqrifUHUYfCCW48Shq1BI1us0m4dpFYMRRZbAJO
	 QcU9Hov5TXQq/rly29O/IfUeXEp+Ztik2FbHxoLOtkDqNHhTxJ/c0ewPG5KR6tHm0Y
	 mAQgU5wjymq8w==
Date: Sat, 14 Jun 2025 18:31:48 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org
Subject: Re: [net-next v1] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <20250614173148.GV414686@horms.kernel.org>
References: <20250613144525.53305-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613144525.53305-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_103153_023069_62766A42 
X-CRM114-Status: GOOD (  21.30  )
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

On Fri, Jun 13, 2025 at 04:45:23PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add named interrupts and keep index based fallback for exiting devicetrees.
> 
> Currently only rx and tx IRQs are defined to be used with mt7988, but
> later extended with RSS/LRO support.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 24 +++++++++++++--------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b76d35069887..fcec5f95685e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5106,17 +5106,23 @@ static int mtk_probe(struct platform_device *pdev)
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
> +	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
> +	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
> +	if (eth->irq[1] < 0 || eth->irq[2] < 0) {
> +		for (i = 0; i < 3; i++) {
> +			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> +				eth->irq[i] = eth->irq[0];
> +			else
> +				eth->irq[i] = platform_get_irq(pdev, i);
> +
> +			if (eth->irq[i] < 0) {
> +				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> +				err = -ENXIO;
> +				goto err_wed_exit;
> +			}
>  		}
>  	}
> +

Thanks Frank,

The above looks correct to me. But I do think it could be improved by moving
the irq lookup logic - either the unnamed portion or all of it - into a
helper.

That suggestion notwithstanding,
Reviewed-by: Simon Horman <horms@kernel.org>

>  	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
>  		eth->clks[i] = devm_clk_get(eth->dev,
>  					    mtk_clks_source_name[i]);
> -- 
> 2.43.0
> 
> 

