Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA472CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7Lmlbu+YmCAxc8rc0XIoRafkz4YiUG7iD7DFMOHVi0=; b=r9Y0MkzmxCX2uJLGwH8rfNQ5rj
	prDOOjNIR33w/QDsCFSeQjT9ttx9xx+usgJFz+lTIYrmhDFajwSx7+nYNItSIWaYYVSGZWooUxEVL
	bVLtVr8DEOGKteBCQh0ECrn2Mn0heXJ5n5hXaXP3Pu/vqNAcN+InBmsRhJTDQFRDBVrdXMnijPPna
	PZ/rLNht6ydR+gRgP4bAMSviTNZpmtc7uyj+5dA0ytTNwgIeiPKgk8Gpmll+L/V8vUzw/ted0lhRO
	qPfdV3XycwrvPrD//JAy1Y0MMvuZhMrccd/5DaCaufGpy9zg57dkkMjp02Qh6e4F36TySlvixliDK
	u55qdjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTH9-0000000EARD-48g0;
	Mon, 11 May 2026 16:14:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTH2-0000000EAQK-3zkB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:14:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F26040936;
	Mon, 11 May 2026 16:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0977C2BCB0;
	Mon, 11 May 2026 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516066;
	bh=loApl5z4gNMlxHcs5ARDnO2c3Zo1516aXOntv1kkSOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AEeA/6RZ7YTpM/mMfohIkUuAPJCtp2QiDJuGU1bgB1m4w8DDqNIsJvjjEdg1yis6w
	 WRBNHSyhHo6FBHW1PFoyBgzmhB543o/db/XweILflbtXmveiTQFmmBR7Y7eIK4qNsq
	 jIjY90qth83Pt21QXi90Ffm3xgQYlnrBz6htplTsPUb94t5K3gJtlyZWyaQpMY/W8D
	 nPq5l4OHunZThPbuUnqwORsQZJMmx2n/MsXXPnhNPcLne9U8Lk2JIMxsdG/l1oOhfw
	 JNLxfqx/ld2gvmmvouQNRubK0Lk+HGJktszx3mEqeMMByX/R3I+vI/xJQqI7ninEbm
	 uL/GzsKtc0pag==
From: Simon Horman <horms@kernel.org>
To: arnd@kernel.org
Cc: 'Simon Horman' <horms@kernel.org>,
	netdev@vger.kernel.org,
	arnd@arndb.de,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	brgl@kernel.org,
	bcousson@baylibre.com,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	balbi@kernel.org,
	kuba@kernel.org,
	johannes@sipsolutions.net,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linusw@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	rogerq@kernel.org,
	tony@atomide.com,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 2/3] [v5 net-next] p54spi: convert to devicetree
Date: Mon, 11 May 2026 17:12:45 +0100
Message-ID: <20260511161243.49098-3-horms@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507212451.3333185-3-arnd@kernel.org>
References: <20260507212451.3333185-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_091429_149634_328442DB 
X-CRM114-Status: GOOD (  21.85  )
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

From: 'Simon Horman' <horms@kernel.org>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
p54spi: convert to devicetree

This commit converts the Prism54 SPI driver from using hardcoded GPIO
module parameters to using the GPIO descriptor interface and device tree
probing.

> diff --git a/drivers/net/wireless/intersil/p54/p54spi.c b/drivers/net/wireless/intersil/p54/p54spi.c
> index 9d66dcae54e02..d18be25450285 100644
> --- a/drivers/net/wireless/intersil/p54/p54spi.c
> +++ b/drivers/net/wireless/intersil/p54/p54spi.c

[ ... ]

> @@ -30,19 +31,6 @@
>  MODULE_FIRMWARE("3826.arm");
>  MODULE_FIRMWARE("3826.eeprom");
>  
> -/* gpios should be handled in board files and provided via platform data,
> - * but because it's currently impossible for p54spi to have a header file
> - * in include/linux, let's use module parameters for now
> - */
> -
> -static int p54spi_gpio_power = 97;
> -module_param(p54spi_gpio_power, int, 0444);
> -MODULE_PARM_DESC(p54spi_gpio_power, "gpio number for power line");
> -
> -static int p54spi_gpio_irq = 87;
> -module_param(p54spi_gpio_irq, int, 0444);
> -MODULE_PARM_DESC(p54spi_gpio_irq, "gpio number for irq line");
> -
>  static void p54spi_spi_read(struct p54s_priv *priv, u8 address,
>  			      void *buf, size_t len)
>  {

Simon says: As a pre-existing issue I don't think we need to be concerned
            about this in the scope of this patch-set. But it may
	    be a potential for follow-up.

This problem wasn't introduced by this patch, but I noticed a pre-existing
issue in the context here. Does the p54spi_spi_read() function perform an SPI
transfer using a stack-allocated buffer?

Looking at p54spi_spi_read(), the addr variable is allocated on the stack and
passed as a transfer buffer to spi_sync(). The SPI framework maps transfer
buffers for DMA. Passing a stack-allocated buffer is illegal, particularly with
CONFIG_VMAP_STACK enabled, because stack memory resides in vmalloc space and
cannot be safely DMA-mapped.

Could this cause memory corruption or a kernel panic during the transfer?

[ ... ]

> @@ -608,31 +596,20 @@ static int p54spi_probe(struct spi_device *spi)
>  		goto err_free;
>  	}
>  
> -	ret = gpio_request(p54spi_gpio_power, "p54spi power");
> -	if (ret < 0) {
> -		dev_err(&priv->spi->dev, "power GPIO request failed: %d", ret);
> +	priv->gpio_powerdown = gpiod_get_optional(&spi->dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->gpio_powerdown)) {
> +		ret = dev_err_probe(&priv->spi->dev, PTR_ERR(priv->gpio_powerdown),
> +				    "powerdown GPIO request failed\n");
>  		goto err_free;
>  	}
>  
> -	ret = gpio_request(p54spi_gpio_irq, "p54spi irq");
> -	if (ret < 0) {
> -		dev_err(&priv->spi->dev, "irq GPIO request failed: %d", ret);
> -		goto err_free_gpio_power;
> -	}
> -
> -	gpio_direction_output(p54spi_gpio_power, 0);
> -	gpio_direction_input(p54spi_gpio_irq);
> -
> -	ret = request_irq(gpio_to_irq(p54spi_gpio_irq),
> -			  p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi",
> -			  priv->spi);
> +	ret = request_irq(spi->irq, p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi", priv->spi);

Simon says: This one seems more concerning in the context of this patch-set.

Is there missing validation for spi->irq before calling request_irq()?

If the device tree node lacks an interrupts property, the SPI core may set
spi->irq to 0 or a negative error code.

Passing this directly to request_irq() without validation can successfully
hijack a core system interrupt like the system timer on some architectures,
leading to system instability or deadlocks.

Should there be a check like if (spi->irq <= 0) to fail the probe gracefully?

>  	if (ret < 0) {
>  		dev_err(&priv->spi->dev, "request_irq() failed");
> -		goto err_free_gpio_irq;
> +		goto err_free_gpio_power;
>  	}

