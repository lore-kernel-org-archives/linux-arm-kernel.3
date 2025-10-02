Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9651CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p541rxmb4NTJ3zK+jdMrAbP4PuUbxpsXgirt6z/FgyM=; b=JJBPgVhuYYOuevVRDfHXIAfky+
	cwLFky9mgZRjwSStNgAH2GII+IIov80fGM8XNkb1MO1UBkahpFwGx2tft1DZ8rtscpMCRQUxdMZ50
	RoewkEL+geVpbHm+AHjzXBcY7d0If7nKfKlxj9kHtYW9TcZRyOYMCA4ZM6ULdcLgds7DmvXtwcBkm
	f3tL2jLjWcP9z9MkpxQL7YxQRTCLUKJJaH7i5RuvQkfJLBdgKuC4lZz/AcDVXoz8v1KpET7c5cUhY
	riLmA2hK8EjqvaRmDd38728EPAzEO/DBQvEqF6sK+fqOPvqKoUnwWj7z5R27MexV5yv5WAVvnB0/r
	zb0Dhzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4PdE-0000000B9gx-218S;
	Thu, 02 Oct 2025 20:10:28 +0000
Received: from smtp-65.smtpout.orange.fr ([80.12.242.65] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4PdA-0000000B9fR-1kZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 20:10:27 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 4Pd2vGIoXKUOX4Pd2vw55W; Thu, 02 Oct 2025 22:10:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1759435819;
	bh=p541rxmb4NTJ3zK+jdMrAbP4PuUbxpsXgirt6z/FgyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=mqrvZs0/GJVIsSsTT/xyhVFH3DlBOMHg5jMuGqM9Scd1cH6BTFiiLML4IvdKrK3E0
	 SN1z+dwKwmcuFyZG4qSK7OSjnZ7cT0Fl5277HXnNWX1ZUlCmEex+DbUHCr6kCUTIsk
	 H5K9XBY3m1oH7encXKlcjaZ3S2h+5IKMzKzV49Rj7tb5TcZm+WRkQ0bhCBw59QDlEc
	 AlD3vIxa1Sqtgy1Q9MNatcaywkMx7qcelGsEI27Ivs80d+9BFqhsBE3978/d2y+k6i
	 QbYi2y20FCZtrQYkHs89q8tfmD4NpvNNEKUZpdh+LkiOjEhflLlfaDs2t15zSE/byL
	 h7hUO7BbrWxDg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 02 Oct 2025 22:10:19 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <3c07c2f0-d069-46d1-b2a6-e2c071198cb6@wanadoo.fr>
Date: Thu, 2 Oct 2025 22:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
References: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
 <20251002-dma_chan_free-v1-2-4dbf116c2b19@nxp.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251002-dma_chan_free-v1-2-4dbf116c2b19@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_131025_658219_C61DAD97 
X-CRM114-Status: GOOD (  15.28  )
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

Le 02/10/2025 à 21:49, Frank Li a écrit :
> Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..b1d035ca8002e9648b67bfe4d674578373394710 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
>   
>   static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>   {
> -	struct dma_async_tx_descriptor *rx_cmd_desc;
> +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
>   	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
>   	struct dma_chan *txchan = dma->chan_tx;
>   	dma_cookie_t cookie;
> @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>   	cookie = dmaengine_submit(rx_cmd_desc);
>   	if (dma_submit_error(cookie)) {
>   		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
> -		goto submit_err_exit;
> +		return dma_submit_error(cookie);

I don't know if it matters or not, but this may change the returned 
value in this error handling path.

>   	}
>   
>   	dma_async_issue_pending(txchan);
> +	retain_and_null_ptr(rx_cmd_desc);
>   
>   	return 0;
>   
> @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>   	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>   			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>   	return -EINVAL;
> -
> -submit_err_exit:
> -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);

dma_unmap_single() is not needed anymore?

> -	dmaengine_desc_free(rx_cmd_desc);
> -	return -EINVAL;
>   }
>   
>   static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> 


