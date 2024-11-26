Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B053D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgMZeNej62lgZWssUg2CqXm8bohYFgA129C49u0oPGY=; b=z+QMli/DdcoVfe2KbtqzJhTkM7
	hXbQnoBlM0VfT7WmNPn1QV+QrBJH7ledOKyRHNm5q+Ybx11B9VV3ou201aQ5sGKiLTHDu9ekSBY2P
	JmnUGavx4Sfs+drowx3UZEHRUCd4Vt9qoHh2m4VgEiEGbzLZNynP18k4BmgyHI8CPH8OoiUvhCZ9w
	QylOTT7q9rydKTNGj8eiom3i1aCNAeQMxdqM9hMAWYR0dAbBPDHDKQP7E0E7WUwAReLghRL9DeEdk
	TNF/dGa3DnCc3zSM8yQqz0vpUETKw8bFeL8uoN5XwCgkOSvDQ9ZW3q4ZHLJqG2ck35mBjRQJgX4Bq
	lL9mBbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsK6-0000000AEQ3-1XPz;
	Tue, 26 Nov 2024 09:57:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsJ7-0000000AEJt-3ALA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:56:35 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tFsIv-00011x-Vm; Tue, 26 Nov 2024 10:56:22 +0100
Message-ID: <19a43db4-db5c-4638-9778-d94fb571a206@pengutronix.de>
Date: Tue, 26 Nov 2024 10:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
To: carlos.song@nxp.com, frank.li@nxp.com, o.rempel@pengutronix.de,
 kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241126082535.1878554-1-carlos.song@nxp.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241126082535.1878554-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_015633_795074_EB5D9C9E 
X-CRM114-Status: GOOD (  29.01  )
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

Hello Carlos,

On 26.11.24 09:25, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
> have not ready yet.
> 
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
> 
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.

Wouldn't this break probe for all i2c-imx users who have CONFIG_IMX_SDMA
disabled?

Also I am wondering on what kernel version and what configuration
(CONFIG_I2C_IMX=?, CONFIG_IMX_SDMA=?) you have that made you run into
this situation.

I'd have expected that with fw_devlink enabled, the I2C controller wouldn't
be probed before the DMA provider is available.

Cheers,
Ahmad

> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> Change for V2:
> - According to Frank's comments, wrap at 75 char and Simplify fix code
>   at i2c_imx_dma_request().
> - Use strict patch check, fix alignment warning at i2c_imx_dma_request()
> ---
>  drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..4e5633166a1e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
>  }
>  
>  /* Functions for DMA support */
> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> -						dma_addr_t phy_addr)
> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t phy_addr)
>  {
>  	struct imx_i2c_dma *dma;
>  	struct dma_slave_config dma_sconfig;
> -	struct device *dev = &i2c_imx->adapter.dev;
> +	struct device *dev = i2c_imx->adapter.dev.parent;
>  	int ret;
>  
>  	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>  	if (!dma)
> -		return;
> +		return -ENOMEM;
>  
>  	dma->chan_tx = dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
>  		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
>  
> -	return;
> +	return 0;
>  
>  fail_rx:
>  	dma_release_channel(dma->chan_rx);
> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  	dma_release_channel(dma->chan_tx);
>  fail_al:
>  	devm_kfree(dev, dma);
> +
> +	return ret;
>  }
>  
>  static void i2c_imx_dma_callback(void *arg)
> @@ -1803,6 +1804,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	if (ret == -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
>  
> +	/* Init DMA config if supported */
> +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret == -EPROBE_DEFER) {
> +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> +		goto clk_notifier_unregister;
> +	}
> +
>  	/* Add I2C adapter */
>  	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
>  	if (ret < 0)
> @@ -1817,9 +1825,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		i2c_imx->adapter.name);
>  	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
>  
> -	/* Init DMA config if supported */
> -	i2c_imx_dma_request(i2c_imx, phy_addr);
> -
>  	return 0;   /* Return OK */
>  
>  clk_notifier_unregister:


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

