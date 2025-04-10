Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC61BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 23:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba/Cj+VJ7TUHdepKTsLH0t5CQjwA3NZ1qptVTOAwGOI=; b=B4AsGJ43szf/WHr5lbK31uicE6
	sxN2apzbyNZx8F85TYOQ1YqH6UPMaC8otcuO/9DMT+8Yk8L5wyzTSlsSAfmXiK8c1sDAEpVSytT93
	9ViYjnVIXYK6MUsMPwRCx6FgWw8TYXmMBwEKKhfAqveCN9Ik+V4mbkq2ZM1ktsYDR5Up9TE/sUeBH
	zM+9VZaCwhzditOtRaUCnVmA2x09XtxQ0oHw+wjM2VW4DjPsU++alCmhsp/zXtbXvu3irZ7UvOyX0
	2a/XEhJonuqXzq7yZzAR7OxeZDaiNI9iRjnwnEwoBetDKDZNGMVJ4WU7HAAEOK1H8FnuARDmArzDo
	hZwe0RXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31K1-0000000C3NN-2jBQ;
	Thu, 10 Apr 2025 23:28:37 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Gd-0000000C2hx-3zol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 23:25:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u31GX-0004GK-7Y; Fri, 11 Apr 2025 01:25:01 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u31GX-004LKx-08;
	Fri, 11 Apr 2025 01:25:01 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u31GW-00AVe0-32;
	Fri, 11 Apr 2025 01:25:00 +0200
Date: Fri, 11 Apr 2025 01:25:00 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel@pengutronix.de,
	"vkoul@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] dmaengine: imx-sdma: drop legacy device_node np
 check
Message-ID: <20250410232500.fnk2puzykihkcbna@pengutronix.de>
References: <20250410232247.1434659-1-m.felsch@pengutronix.de>
 <20250410232247.1434659-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410232247.1434659-2-m.felsch@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_162507_994265_C63CF50B 
X-CRM114-Status: GOOD (  19.12  )
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

On 25-04-11, Marco Felsch wrote:
> The legacy 'if (np)' was required in past where we had pdata and dt.
> Nowadays the driver binds only to dt platforms. So using a new kernel
> but still use pdata is not possible, therefore we can drop the legacy
> 'if' code path.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Please ignore this patch, I had issues with my mail setup.

Regards,
  Marco


> ---
>  drivers/dma/imx-sdma.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 3449006cd14b..699f0c6b5ae5 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -2326,11 +2326,9 @@ static int sdma_probe(struct platform_device *pdev)
>  			vchan_init(&sdmac->vc, &sdma->dma_device);
>  	}
>  
> -	if (np) {
> -		sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
> -		if (sdma->iram_pool)
> -			dev_info(&pdev->dev, "alloc bd from iram.\n");
> -	}
> +	sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
> +	if (sdma->iram_pool)
> +		dev_info(&pdev->dev, "alloc bd from iram.\n");
>  
>  	ret = sdma_init(sdma);
>  	if (ret)
> @@ -2370,21 +2368,19 @@ static int sdma_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	if (np) {
> -		ret = of_dma_controller_register(np, sdma_xlate, sdma);
> -		if (ret) {
> -			dev_err(&pdev->dev, "failed to register controller\n");
> -			goto err_register;
> -		}
> +	ret = of_dma_controller_register(np, sdma_xlate, sdma);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register controller\n");
> +		goto err_register;
> +	}
>  
> -		spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> -		ret = of_address_to_resource(spba_bus, 0, &spba_res);
> -		if (!ret) {
> -			sdma->spba_start_addr = spba_res.start;
> -			sdma->spba_end_addr = spba_res.end;
> -		}
> -		of_node_put(spba_bus);
> +	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> +	ret = of_address_to_resource(spba_bus, 0, &spba_res);
> +	if (!ret) {
> +		sdma->spba_start_addr = spba_res.start;
> +		sdma->spba_end_addr = spba_res.end;
>  	}
> +	of_node_put(spba_bus);
>  
>  	/*
>  	 * Because that device tree does not encode ROM script address,
> -- 
> 2.39.5
> 
> 
> 

