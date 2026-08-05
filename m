Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58E0C55838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 01:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JJ/OYnhVOBZIKikRwKUt+wRaQnZOVg4lBXuhaSvKoE=; b=sHVhRAVM1R1dY171kwomeNvDEh
	LRo0rSgP0q87V2nyraHcn3ZO6G5VSogMqCnKhZ58atKKVF9rFIU6Mg5rTrg3XZ9tVqyrCh7upioz7
	ugnVhp2qeJLSeyzRyd22Cw0+i0Re8sOPZ3dX5UWRkXJtiiPQtXF0jdwsnilelNJZShJ3fvnIA/bAw
	m2IxuQa21xCdgjFX2qrAy4W0wjk3k371uTkCvVMwWf1XgELXn0+PA0vBDi/zJ1I8vLIhIXVnnswfC
	RAkZ6jKV6ttWAc4X8NOWu01V5+S/h1pkdo6EgsXIfWXL+1OshPqroC1wqjh+MlrL8ZyYrcu7crmIv
	Fxht/k6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQ3Y-000000032HP-1nlt;
	Wed, 05 Aug 2026 01:04:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQ3X-000000032HI-1WYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 01:04:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EF6C600B1;
	Wed,  5 Aug 2026 01:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D8F1F000E9;
	Wed,  5 Aug 2026 01:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891866;
	bh=2JJ/OYnhVOBZIKikRwKUt+wRaQnZOVg4lBXuhaSvKoE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JHafTZQavESbS2/XBdfrpgromrnT1h5o53F8BQiNEDQ/AsN0czSakVtFwYgSHaNV7
	 t4xRBrLCPqC8RNz0svN8vo39+qBbkKwM/XD1KF21nIzK0pfBI8Ijy0MMJjO/lEEF0W
	 QItGuwpWNDQCZP49McuVqSHl/cTYiGFrcmGFwHlPX/3BZypMypXSA+T911esHeDrFz
	 oqiboMwew/6djnZ3H7ETJIYHu/bB/l/7oORFF7qwOzf0pMH7YRTUagAJeJsyiero5a
	 UjctBJnQWaTnC13+B2cgeP70+H5XrUjOpuKF+ZTdKbXZPNn80lxgxfQZhIsnXRIaMv
	 7KPCT1EO6/qmA==
Date: Wed, 5 Aug 2026 02:04:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Andy Shevchenko <andy@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Markus
 Elfring <Markus.Elfring@web.de>, Joshua Crofts <joshua.crofts1@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] iio: adc: bcm_iproc_adc: Introduce local device
 pointer
Message-ID: <20260805020420.783839fb@jic23-huawei>
In-Reply-To: <20260804170521.196393-3-mdshahid03@gmail.com>
References: <20260804170521.196393-1-mdshahid03@gmail.com>
	<20260804170521.196393-3-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue,  4 Aug 2026 22:35:20 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Introduce a local 'struct device *dev' variable in iproc_adc_probe()
> and use it for device-managed helper calls instead of repeatedly
> referencing '&pdev->dev'.
> 
> No functional change intended.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 7c2e2770cd61..312be7c12e58 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -506,10 +506,10 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  {
>  	struct iproc_adc_priv *adc_priv;
>  	struct iio_dev *indio_dev = NULL;
> +	struct device *dev = &pdev->dev;
>  	int ret;
>  
> -	indio_dev = devm_iio_device_alloc(&pdev->dev,
> -					sizeof(*adc_priv));
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc_priv));
>  	if (!indio_dev)
>  		return -ENOMEM;
>  
> @@ -528,10 +528,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
> +	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
>  	if (IS_ERR(adc_priv->adc_clk)) {
> -		dev_err(&pdev->dev,
> -			"failed getting clock tsc_clk\n");
> +		dev_err(&pdev->dev, "failed getting clock tsc_clk\n");

Don't do the line rewrap here. It is adding noise we don't want
given you are about to replace this line in the next patch.

>  		ret = PTR_ERR(adc_priv->adc_clk);
>  		return ret;
>  	}
> @@ -547,7 +546,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = devm_request_threaded_irq(&pdev->dev, adc_priv->irqno,
> +	ret = devm_request_threaded_irq(dev, adc_priv->irqno,
>  				iproc_adc_interrupt_handler,
>  				iproc_adc_interrupt_thread,
>  				IRQF_SHARED, "iproc-adc", indio_dev);


