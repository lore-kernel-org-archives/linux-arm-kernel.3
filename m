Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA62CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bihIApHcFbRhbTUK4wRBPWHxR7KZ+DKiKn+Vf9wc+CE=; b=JfrPSFjTcZ/JHHmIfyuLPwauMb
	49VcCkOSZeOzsuvzTxi/OxcJfs6POahLwlqjQd1w5+/1Z/YtC3R2Gt69JBWiSzsX3dQfYLqxror5+
	KBCvzf6BwPyCJoMLTbO29jIuxLkk1hCssg0UPkyzjuwrNX/50hnofgBLa094PgsL3YKqBDxcvzPkC
	MGN59UrQJbbvXNl1SrnHd9e+cDF0lI3KQ0n+Jqj/1PwqN5v2tdr4mAxaOhh+zwTDKSIVYzyf8bTje
	XraWd92Gx+gTzTI6tLuMT4Wlt03QbJRfeT1nwgu9kaqWdFeHm1njWttBWsa1k6FpSkLyQ7N6P7VNS
	CNMwtVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHW9-0000000AzLr-0Jpu;
	Sat, 16 May 2026 16:05:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHW8-0000000AzLh-0ORa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 16:05:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAAEA60138;
	Sat, 16 May 2026 16:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D80DC19425;
	Sat, 16 May 2026 16:05:27 +0000 (UTC)
Message-ID: <b272b786-75d5-42f2-9622-ae4659722c44@tuxon.dev>
Date: Sat, 16 May 2026 19:05:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: atmel: fix resource leak on DMA buffer
 allocation failure
To: Felix Gu <ustc.gu@gmail.com>, Ryan Wanner <ryan.wanner@microchip.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Radu Pirea <radu.pirea@microchip.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Wenyou Yang <wenyou.yang@atmel.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mark Brown <broonie@opensource.wolfsonmicro.com>
References: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
 <20260516-atmel-v1-1-674fb4707af6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260516-atmel-v1-1-674fb4707af6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Felix,

On 5/15/26 20:20, Felix Gu wrote:
> The original code set use_dma to false when dma_alloc_coherent() fails,
> so DMA channels allocated earlier were never freed, causing a resource
> leak.
> 
> Fix by moving the bounce buffer allocation into
> atmel_spi_configure_dma() and extending atmel_spi_release_dma() to
> also free the bounce buffers. Any allocation failure in the DMA
> configuration path now rolls back both channels and buffers through
> the same release function.
> 
> Fixes: a9889ed62d06 ("spi: atmel: Implements transfers with bounce buffer")
> Signed-off-by: Felix Gu<ustc.gu@gmail.com>
> ---
>   drivers/spi/spi-atmel.c | 113 ++++++++++++++++++++++++------------------------
>   1 file changed, 57 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
> index 25aa294631c8..e519a86a2b45 100644
> --- a/drivers/spi/spi-atmel.c
> +++ b/drivers/spi/spi-atmel.c
> @@ -559,6 +559,34 @@ static int atmel_spi_dma_slave_config(struct atmel_spi *as, u8 bits_per_word)
>   	return err;
>   }
>   
> +static void atmel_spi_release_dma(struct spi_controller *host,
> +				  struct atmel_spi *as)
> +{
> +	if (host->dma_rx) {
> +		dma_release_channel(host->dma_rx);
> +		host->dma_rx = NULL;
> +	}
> +	if (host->dma_tx) {
> +		dma_release_channel(host->dma_tx);
> +		host->dma_tx = NULL;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
> +		if (as->addr_tx_bbuf) {
> +			dma_free_coherent(&as->pdev->dev, SPI_MAX_DMA_XFER,
> +					  as->addr_tx_bbuf,
> +					  as->dma_addr_tx_bbuf);
> +			as->addr_tx_bbuf = NULL;
> +		}
> +		if (as->addr_rx_bbuf) {
> +			dma_free_coherent(&as->pdev->dev, SPI_MAX_DMA_XFER,
> +					  as->addr_rx_bbuf,
> +					  as->dma_addr_rx_bbuf);
> +			as->addr_rx_bbuf = NULL;
> +		}
> +	}
> +}
> +
>   static int atmel_spi_configure_dma(struct spi_controller *host,
>   				   struct atmel_spi *as)
>   {
> @@ -569,7 +597,8 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
>   	if (IS_ERR(host->dma_tx)) {
>   		err = PTR_ERR(host->dma_tx);
>   		dev_dbg(dev, "No TX DMA channel, DMA is disabled\n");
> -		goto error_clear;
> +		host->dma_tx = NULL;
> +		return err;
>   	}
>   
>   	host->dma_rx = dma_request_chan(dev, "rx");
> @@ -580,12 +609,31 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
>   		 * requested tx channel.
>   		 */
>   		dev_dbg(dev, "No RX DMA channel, DMA is disabled\n");
> -		goto error;
> +		host->dma_rx = NULL;
> +		goto err_release_dma;
>   	}
>   
>   	err = atmel_spi_dma_slave_config(as, 8);
>   	if (err)
> -		goto error;
> +		goto err_release_dma;
> +
> +	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
> +		as->addr_tx_bbuf = dma_alloc_coherent(dev, SPI_MAX_DMA_XFER,
> +						      &as->dma_addr_tx_bbuf,
> +						      GFP_KERNEL | GFP_DMA);
You could use dmam_alloc_coherent() and avoid bulking the failure path.

Thank you,
Claudiu

