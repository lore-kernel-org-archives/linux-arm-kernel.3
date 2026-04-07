Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D15BEDB7EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaQqvztElhnaUNrSq4dQfMUXlHb2aPZeHeprvpEK5iI=; b=TlYtgcZUYRZ/TOQILaEq7DpPIZ
	4iFUTunhwLOJkZ+SfruWqgDeSIa3ABFIICqsAsa9J+ZQ3g8Dd/t1NzdPczB5C7HIeI62zJTnYgs5Z
	J5kTJOX7MiXSb8fHanD3nMnK7N5TWXQh/ZIeFqLddlsIQ3e9+2fegLwpV0m1FJUSHukUn6qWFyPPb
	yvSr2+EPhQ8S/FmdaTMrWS37Z9HhQ9uprvCSLUlORDMNow16+T9S+RjGrEoVJNjoDYBIqFWT3KfOF
	4hLLdgSDeTc9Bdcx4jT8BToOcILHAF+c4D7UjiJ7sYev1lcwiTru0IlezDizHyxpUz+d6Htt6N0J/
	cwwqrC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA43C-00000006LAE-1vFu;
	Tue, 07 Apr 2026 10:52:54 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA439-00000006L8r-2J2s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:52:53 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 07 Apr 2026 19:52:47 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id BDF0F2091483;
	Tue,  7 Apr 2026 19:52:47 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 7 Apr 2026 19:52:47 +0900
Received: from [10.212.247.199] (unknown [10.212.247.199])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 3618210A0BE;
	Tue,  7 Apr 2026 19:52:47 +0900 (JST)
Message-ID: <c5a88b29-9a2b-43e7-b75f-3c7f19cfaeaf@socionext.com>
Date: Tue, 7 Apr 2026 19:52:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: uniphier: Simplify clock handling with
 devm_clk_get_enabled()
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: broonie@kernel.org, mhiramat@kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <b2deeefd4ef1a4bce71116aabfcb7e81400f6d37.1775546948.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <b2deeefd4ef1a4bce71116aabfcb7e81400f6d37.1775546948.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_035251_751295_5300480E 
X-CRM114-Status: GOOD (  20.97  )
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

Hi,

On 2026/04/07 16:30, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.
> 
> Remove the now-unnecessary clk_disable_unprepare() calls from the probe
> error path and the remove callback. Adjust error labels accordingly.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/spi/spi-uniphier.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
> index 9e1d364a6198..1b815ee2ed1b 100644
> --- a/drivers/spi/spi-uniphier.c
> +++ b/drivers/spi/spi-uniphier.c
> @@ -666,28 +666,24 @@ static int uniphier_spi_probe(struct platform_device
> *pdev)
>   	}
>   	priv->base_dma_addr = res->start;
>   
> -	priv->clk = devm_clk_get(&pdev->dev, NULL);
> +	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(priv->clk)) {
>   		dev_err(&pdev->dev, "failed to get clock\n");
>   		ret = PTR_ERR(priv->clk);
>   		goto out_host_put;
>   	}
>   
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret)
> -		goto out_host_put;
> -
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0) {
>   		ret = irq;
> -		goto out_disable_clk;
> +		goto out_host_put;
>   	}
>   
>   	ret = devm_request_irq(&pdev->dev, irq, uniphier_spi_handler,
>   			       0, "uniphier-spi", priv);
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to request IRQ\n");
> -		goto out_disable_clk;
> +		goto out_host_put;
>   	}
>   
>   	init_completion(&priv->xfer_done);
> @@ -716,7 +712,7 @@ static int uniphier_spi_probe(struct platform_device
> *pdev)
>   	if (IS_ERR_OR_NULL(host->dma_tx)) {
>   		if (PTR_ERR(host->dma_tx) == -EPROBE_DEFER) {
>   			ret = -EPROBE_DEFER;
> -			goto out_disable_clk;
> +			goto out_host_put;
>   		}
>   		host->dma_tx = NULL;
>   		dma_tx_burst = INT_MAX;
> @@ -766,9 +762,6 @@ static int uniphier_spi_probe(struct platform_device
> *pdev)
>   		host->dma_tx = NULL;
>   	}
>   
> -out_disable_clk:
> -	clk_disable_unprepare(priv->clk);
> -
>   out_host_put:
>   	spi_controller_put(host);
>   	return ret;
> @@ -777,14 +770,11 @@ static int uniphier_spi_probe(struct platform_device
> *pdev)
>   static void uniphier_spi_remove(struct platform_device *pdev)
>   {
>   	struct spi_controller *host = platform_get_drvdata(pdev);
> -	struct uniphier_spi_priv *priv = spi_controller_get_devdata(host);
>   
>   	if (host->dma_tx)
>   		dma_release_channel(host->dma_tx);
>   	if (host->dma_rx)
>   		dma_release_channel(host->dma_rx);
> -
> -	clk_disable_unprepare(priv->clk);
>   }
>   
>   static const struct of_device_id uniphier_spi_match[] = {

Looks good to me.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

