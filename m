Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81994C624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRjUZEJS6BcJ/ykufOuQV9s1kDgTbH3LbjoGvDl9y7s=; b=syg9UboxqdkEhGLpe7jETL6Hse
	DdDeBNUpxoT+1pGcRIRPSgWbBfSnt0yvoRB4gTHtRvs+hHAD7hbMXe+E+gXy+L93sc78V+vPZNtZM
	nRnPO9wMXnKxZH3rabBCE91DyagRsKFBp3E5+oclyzC84qBzM2l+wR1KRxSTA7qMGCDhJmHY4pWmX
	imHn5qhYoTPoP1yyssP+kCBlIqLYwpNuPKedvVQLv/F+ucH08wQ4+gEzsTHchGGYZ6focS2M+wQPg
	pxPyl3xpcYHXr+35hjL4wxr08KX1VJFX1WsBtHa+po0mofACNU+/YduT6ETOzUsDCbBSfFUIK+/F3
	k/eYuzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DzP-0000000AqoR-0S2e;
	Tue, 01 Sep 2026 02:12:43 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DzN-0000000Aqng-1isf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:12:42 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-856114a8247so4250117b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228759; x=1788833559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRjUZEJS6BcJ/ykufOuQV9s1kDgTbH3LbjoGvDl9y7s=;
        b=ggS9AQ3IhHJXI1qU0s8ZiB1OoN5B2xZamLMKOKWNMhjCmLKVYcewFc3p5fXD3eLSmI
         dNvsgsIyczJkQLBzlydMCLScP6zcynLYN4+yO90B80nojGjFz+DBX0Nd4BrgtgtfCRj4
         TZO6RfeigBdb0MOOJCMZ/7kAYbTA1TWZEnUBxqG8gR6n1z8gllJ00/21iCyMehf14JhI
         bai5ZEwhAQcJKg29P4LFkx7p9vOJ5bp5ogU6ulG4LOHvSv+Q1U3V1F1IHt1oFrGL8UCI
         kQgrbrJqgLxs5m20p+y32/ya190bELryD55l+A8rWXl9JueAAJvxOpAm2f1A1gtxN7Nm
         a5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228759; x=1788833559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRjUZEJS6BcJ/ykufOuQV9s1kDgTbH3LbjoGvDl9y7s=;
        b=iRsKLykdGiFQOVWAV4O8oW5mo9i/LVg/OntA5yVeiaCl2GuqITnboC0A8x0a52KAmF
         xD+/+SXnJcRboBHOesc2FqV8RGZWh23JQQcBaBztbzUV52AWzQx8dr4yjLamyTQOHFGP
         WF9HS39nymlxKbkC6klSUI9ePH1teckcK2jaauLeBrYrWDuLHj3sWn/XmWjlpXqbR81Q
         HsFcIA+eLxkjeL/ANeJL2ugRptJsf1PUUyvoQE7zQV3OTcxjqo3Ce1i6FHQwzHYMqS6O
         WJAxYseZOpThja6ZB4ZbGE2su2fQoMGwK7na7oI4a9Wp3nbnmmDNk0HxQ8uMOpXFoNMh
         F7Og==
X-Forwarded-Encrypted: i=1; AKwUvBxlhYAIfa1e1fruQYArcOJB8rwrSNPYsMIbTWYnwQxLR1J/5F/x6hqWAiq/Llw3oMg9zEShSRCpf6uLu+hRgjbg@lists.infradead.org
X-Gm-Message-State: AFuF++nLVwKDFrpaBz2YuHzLoL64NKYkNKZNpYmp0Ohg8/HQTqHOppIy
	KHEp1LOJF7flZFXHa2u7bKCsCeDlnx8R0WxGdTSTBU7H6rXFjpwLo0A2
X-Gm-Gg: AYBFou0YREYWvvtlBPwycmgQHksJJbBrwWaT/XPTwT+yQuXQ0BFzXCCbFylvmYwww6E
	eMJp1DF3VMzjzlUuc4QVDXRYTEOGl43k1LDesWAYx3ubwVPWjLDvEs1j/G/tPOfdr5TeCwFAr4w
	XGHLo3lmZY1ovi6fY+t0lvGNtHq5fZ5LhUQng3CTL/IVb9qxt2QfQFilMsTUXbRz+fV915Bb/0n
	NZSbeuR9uBch8z8bLVg1V37uJkGQA4WN37+ZHD2ZZqg6CrgRCAG/0vJ/fqMVz00o4EE+eQI7AuR
	9P60Ni5zhOLHx4oMmEp5IgERLHr7y6ur5x+DV41gsiTr2sOQhh4I5TAF+P1cGXCbV5EwwYjDW8l
	JhEshPDFirxpJvz+ZSx4aNYHlpIDoBhoFa2lLnwPhlnelVXuwB43ae66zvExGAHL2yuwo8LlxYL
	sTqtldTxWFocnsBmL6dzlD8iG5vBMSCnpFwN3olqJVRPEjEdw0xVl0JHV6m9H1oPGBdrK7
X-Received: by 2002:a05:690c:f14:b0:81e:9826:942c with SMTP id 00721157ae682-85d625bd769mr118991397b3.0.1788228759485;
        Mon, 31 Aug 2026 19:12:39 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146f8sm64998207b3.29.2026.08.31.19.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:12:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 23:13:28 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iio: adc: bcm_iproc_adc: use
 devm_iio_device_register()
Message-ID: <apY0yIA2EX-n3wl8@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-6-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830170919.470974-6-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_191241_455140_EFA1F81B 
X-CRM114-Status: GOOD (  20.36  )
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

Hello Mohammad,

This patch looks overall good.
Two minor things inline.

On 08/30, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Use `devm_iio_device_register()` to automatically unregister the IIO
> device when the device is detached.
> 
> This removes the manual `iio_device_unregister()` call and makes the
> `iproc_adc_remove()` callback unnecessary.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 11f2bc12c19a..38a153d6fc70 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -570,7 +570,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	indio_dev->channels = iproc_adc_iio_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
>  
> -	ret = iio_device_register(indio_dev);
> +	ret = devm_iio_device_register(dev, indio_dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "iio_device_register failed\n");
Optional change, the last return check can be skipped.
	return devm_iio_device_register(dev, indio_dev);
>  
> @@ -578,13 +578,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  }
>  
> -static void iproc_adc_remove(struct platform_device *pdev)
> -{
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> -
> -	iio_device_unregister(indio_dev);
> -}
> -
Now that we won't call platform_get_drvdata() anymore, another thing that can
be removed is platform_set_drvdata(pdev, indio_dev);

With that dropped,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

