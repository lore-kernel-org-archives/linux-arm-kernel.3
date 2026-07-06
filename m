Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAhivCzCc5imdzAsAJR6CIv8LmWf45kJCVdZMw3xeVg=; b=UaX3FUn+h11wHgYQNu34EHhBM7
	sMuRD3SF1q66cl+U2WrreVbjcaq5KpuPcrWLAeqPtRyEvzrzYps9OihOld31HugXn9thcuvWi9k9A
	y8wGBaEwkdccFTAxI4Q0isMdqCTH5vmxUzdql6qyGX/KREM5de9s0t1kwY0QCge0QTlfQqCgl9xBK
	OIFpt0LWQA4uR/bXmVerFFlT41PKyMK6tgItRCKn0spQtBbZQcEMK+Jipzwswx8WSVJuDRibUPIo0
	028lgxfjDlVYuuRy3CR7V4ha+8oRucqPyE2W+LjNZ6MycNMAazlf1OwrTk6mNbB9pa+7CjKrgR9ax
	Lbw0W60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgh2F-0000000CHrz-0bRG;
	Mon, 06 Jul 2026 10:58:47 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgh2B-0000000CHrB-0yI0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:58:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B349148CF67;
	Mon,  6 Jul 2026 12:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1783335520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=WAhivCzCc5imdzAsAJR6CIv8LmWf45kJCVdZMw3xeVg=;
	b=Iy5YxAKwatmbE0VSdGw3rI0EtsFCJN+rdqhnBjbwinLR8bwcc8fnTBoisLY8SVhFC47ZNr
	l6Pq4OHnpGCX02+D4Q/N9LBo2Xz/K337Rjcj+x5Ti+E+wnDbq2VX4aTawC6BXLa7/Ox3xN
	PnN3zYCzmYQzR+p5br8wmNiv0+1HDtK5S5WpeTFSYDmkY9HXDFMC5cW5fBHgnt2CgIoNQk
	HED0hk6ZwU3qkTgIUV+oK/PcZAWx61Zuz+n9Zsocff7IGV3f1tvfzE1WvzEr24DXKt/4oc
	IaAFxblx6Rov+7c8eO0LRWVEPXyKiwjkXYqk6GBrtgQeGlVW4IWz02q0mJLWhg==
Date: Mon, 6 Jul 2026 12:58:31 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: atmel-quadspi: Simplify probe() with local
 'dev' variable
Message-ID: <20260706-plunder-fencing-b9ca15ef05ae@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_035843_906250_8CCE89B5 
X-CRM114-Status: GOOD (  21.53  )
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

Hello Krzysztof,

I think you missed some.  At least the two outlined below, but maybe
more which are not part of the lines covered by the patch?

Am Sun, Jul 05, 2026 at 07:27:38PM +0200 schrieb Krzysztof Kozlowski:
> Instead of multiple '&pdev->dev' dereferences, just use a local 'dev'
> variable which makes multiple function calls shorter thus easier to
> follow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/spi/atmel-quadspi.c | 37 +++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index aaf7f4c46b22..8d9c77f5de43 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -1347,20 +1347,21 @@ static const struct atmel_qspi_ops atmel_qspi_sama7g5_ops = {
>  
>  static int atmel_qspi_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct spi_controller *ctrl;
>  	struct atmel_qspi *aq;
>  	struct resource *res;
>  	int irq, err = 0;
>  
> -	ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(*aq));
> +	ctrl = devm_spi_alloc_host(dev, sizeof(*aq));
>  	if (!ctrl)
>  		return -ENOMEM;
>  
>  	aq = spi_controller_get_devdata(ctrl);
>  
> -	aq->caps = of_device_get_match_data(&pdev->dev);
> +	aq->caps = of_device_get_match_data(dev);
>  	if (!aq->caps) {
> -		dev_err(&pdev->dev, "Could not retrieve QSPI caps\n");
> +		dev_err(dev, "Could not retrieve QSPI caps\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1387,31 +1388,31 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	/* Map the registers */
>  	aq->regs = devm_platform_ioremap_resource_byname(pdev, "qspi_base");
>  	if (IS_ERR(aq->regs))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(aq->regs),
> +		return dev_err_probe(dev, PTR_ERR(aq->regs),
>  				     "missing registers\n");
>  
>  	/* Map the AHB memory */
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mmap");
> -	aq->mem = devm_ioremap_resource(&pdev->dev, res);
> +	aq->mem = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(aq->mem))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(aq->mem),
> +		return dev_err_probe(dev, PTR_ERR(aq->mem),
>  				     "missing AHB memory\n");
>  
>  	aq->mmap_size = resource_size(res);
>  	aq->mmap_phys_base = (dma_addr_t)res->start;
>  
>  	/* Get the peripheral clock */
> -	aq->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +	aq->pclk = devm_clk_get_enabled(dev, "pclk");
>  	if (IS_ERR(aq->pclk))
> -		aq->pclk = devm_clk_get_enabled(&pdev->dev, NULL);
> +		aq->pclk = devm_clk_get_enabled(dev, NULL);
>  
>  	if (IS_ERR(aq->pclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(aq->pclk),
> +		return dev_err_probe(dev, PTR_ERR(aq->pclk),
>  				     "missing peripheral clock\n");
>  
>  	if (aq->caps->has_qspick) {
>  		/* Get the QSPI system clock */
> -		aq->qspick = devm_clk_get_enabled(&pdev->dev, "qspick");
> +		aq->qspick = devm_clk_get_enabled(dev, "qspick");
>  		if (IS_ERR(aq->qspick)) {
>  			dev_err(&pdev->dev, "missing system clock\n");

Here.

>  			err = PTR_ERR(aq->qspick);
> @@ -1420,7 +1421,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  
>  	} else if (aq->caps->has_gclk) {
>  		/* Get the QSPI generic clock */
> -		aq->gclk = devm_clk_get(&pdev->dev, "gclk");
> +		aq->gclk = devm_clk_get(dev, "gclk");
>  		if (IS_ERR(aq->gclk)) {
>  			dev_err(&pdev->dev, "missing Generic clock\n");

Here.

>  			err = PTR_ERR(aq->gclk);
> @@ -1439,15 +1440,15 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	err = devm_request_irq(&pdev->dev, irq, atmel_qspi_interrupt,
> -			       0, dev_name(&pdev->dev), aq);
> +	err = devm_request_irq(dev, irq, atmel_qspi_interrupt,
> +			       0, dev_name(dev), aq);
>  	if (err)
>  		return err;
>  
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> -	pm_runtime_use_autosuspend(&pdev->dev);
> -	devm_pm_runtime_set_active_enabled(&pdev->dev);
> -	devm_pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(dev, 500);
> +	pm_runtime_use_autosuspend(dev);
> +	devm_pm_runtime_set_active_enabled(dev);
> +	devm_pm_runtime_get_noresume(dev);
>  
>  	err = atmel_qspi_init(aq);
>  	if (err)
> @@ -1457,7 +1458,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	pm_runtime_put_autosuspend(&pdev->dev);
> +	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
>  }

Greets
Alex


