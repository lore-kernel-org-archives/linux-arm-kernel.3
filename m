Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1A0CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vQXLaG2kcpMi6zISzeFWytxG/6ZsxQ37Uw+pok3HOE=; b=jcFIqoLFp492BnkGHcDnb9EMt3
	+AF2C+iqLPndgi+ux9g3CMC6YncNEkAwqCTbDZ21jmGNmQfkzZuC2q/dLi00lw/AEYv3WzfodWVmM
	zd2hcUmDyWg1BAdTiU0YebehurhhSMDNSTm7otAfglB/EoqS+sRK7j0XDvE53ojetX0yvhoL595+u
	q/7qntK2uTgiHlzr7Ns+9LpnNVEgV/7G2eVX42XmH3PysDjEDeO36YJ44QSI/UmPFH6paLEHYv3mk
	5NdvwGBAwMVIN65sLSDIjA2UsnhzY87bB8Nd8UKwFE/hHKjazPVxYQ6VD/SnV87Q/FALrLtKC4db6
	Rx7J5Mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNUv-0000000831B-2ROC;
	Sat, 30 Aug 2025 15:28:09 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNSA-000000082kl-0wXz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 15:25:19 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b30f73caa3so12536871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756567517; x=1757172317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQXLaG2kcpMi6zISzeFWytxG/6ZsxQ37Uw+pok3HOE=;
        b=GiiRIrYFsf5Bnky89T8kk7mVQe44ELaA6hiQ1HG6v1n5p6AlKmjBfIkXs6aaasyN+D
         6v8+f9eiBIeq83MLxIvh1NAKS+XWN+yHneJ9CJ4naHSC+rwj04w8RBfOWuyvWzgHf/zx
         0ZNDOoExPQ/h+ywN68zWmmq3iZxkrqOkScfsEDHfjLLZ/3l7qyg4F4Blaun6ExLd8wTd
         KvH5HLylNUoOB26C8JmvjYzjfJ3P/ZUlugltdC2z8oyck+RhtoQKM/Zj4+TZ9a0WFDpt
         +o8U3WOx3VA/vlc3cwKhLtrxI+H5TiJDIY7DrAMVj4uYA4odXIFaEjnAYw2ntW4LUNMR
         mvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756567517; x=1757172317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vQXLaG2kcpMi6zISzeFWytxG/6ZsxQ37Uw+pok3HOE=;
        b=U0Gr5fIPzsCdHDz8hv/b/ogEQzNNCdsoyNXrirZRpAsxOaosRkjaT5+wScYohr9Mii
         CxLPzUpEzJo/GZ1JP+1AFbWzrTHdtkE3rPwzF6b8R+kEC5yUYwcHLcPio3UBce5Lp0ug
         L3RsCcx5hL09U7ks2Vpo0nalmh3VQWAyxs9nZfIN1l75p1qzCq44C5DCYzofrm58IPgQ
         vPj8zOFPWT7gTmPGKfZ0ukFyU5z8OHtI9YAMrNtY0CTSnTrCHO9X6a3hleoqWjpHdyVZ
         T0lUjMHzmBNFxA6uJU8NmaiZdhISVNk9cTzv2hRG8nqxF8mcttCVh9gr/7MBiWwU2dd9
         K7xA==
X-Forwarded-Encrypted: i=1; AJvYcCWrhyMwp40y3qMp4j1p5F/2u/9X2e5sZtTASBuynxh0L2JXBdOebrdz+ldFZ/2pN50CtL+85sNqWZyz+TNbxAwu@lists.infradead.org
X-Gm-Message-State: AOJu0YwwZ62cDO+nFv9v8CzoC73uX+AjYT7c7WBeiDsL3vo/UWlSW1aM
	Dljuo14J0r53hIafJrMTJwJ2pNVSw3idUgoKHQ0Ktv+wJIycnH4oVYd9ysXB8xx/0Q==
X-Gm-Gg: ASbGncvg6OBIv+n3czsc/oQhHo1exygdKI9g3DKWTlReottNMuJsjybz8CZbCQ/Z35o
	2Q1hNNQ7hPnkmPTqS0E8ZopwmN0cvH9kKpmeL/EJwLfWUXHdbicVjNaM8gS8R9NochBUCsQTctP
	UtshHs22OZQbEdrEPU4RSrbIRS/KyfpXXBfoqDTXdxWBDgQrC/vndultwXpc1ZvZQK1aqsBTIta
	rAZuSjHYuEBk7DyZaBweIPzwICPz1fcQUvITgUfc0zPDs1FySlzKE0kFcHFW2Z9tC8+pNDPfEze
	QjVeKxRW2/04yfJSkU/Lm9BmAkPWfjLuBxvktW6XgZByhqnQR1f/SkZu5AqjlrjhoiVizb7pSps
	cyPQILUegyUmTCXyg0bXVoNh+4gEPXasdeta58UiI
X-Google-Smtp-Source: AGHT+IFqTzpp+i1c8d9FlbmpErvbAswo/o1qSIXruitHS83JpeUiodcPTxO3zJSo4ZrC4TsBR6h8EA==
X-Received: by 2002:a05:622a:448:b0:4ae:f8bb:7c6a with SMTP id d75a77b69052e-4b31dcceb72mr20637521cf.54.1756567514656;
        Sat, 30 Aug 2025 08:25:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fd35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc1605fb27sm363814885a.62.2025.08.30.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 08:25:14 -0700 (PDT)
Date: Sat, 30 Aug 2025 11:25:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: ohci: s3c2410: Drop support for S3C2410
Message-ID: <fc4ec548-9a1a-44c3-9958-b6778e37d910@rowland.harvard.edu>
References: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_082518_535146_FC43A046 
X-CRM114-Status: GOOD (  24.22  )
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

On Sat, Aug 30, 2025 at 03:01:02PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> The driver is still being used via platform code for S3C64xx platforms.

This title and description are a bit confusing.  I gather that while the 
S3C24xx chipsets are not longer supported, the S3C24xx OHCI controller 
is still being used in S3C64xx systems.

So what the patch does is drop support for S3C2410 _systems_ while 
retaining support for S3C2410 _controllers_.  Is that right?  If so, can 
we change $SUBJECT to say "usb: ohci: Drop DT support for S3C2410 
systems"?

Alan Stern

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/usb/host/ohci-s3c2410.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
> index 66d970854357..e623e24d3f8e 100644
> --- a/drivers/usb/host/ohci-s3c2410.c
> +++ b/drivers/usb/host/ohci-s3c2410.c
> @@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
>  	.resume		= ohci_hcd_s3c2410_drv_resume,
>  };
>  
> -static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
> -	{ .compatible = "samsung,s3c2410-ohci" },
> -	{ /* sentinel */ }
> -};
> -
> -MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
> -
>  static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.probe		= ohci_hcd_s3c2410_probe,
>  	.remove		= ohci_hcd_s3c2410_remove,
> @@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.driver		= {
>  		.name	= "s3c2410-ohci",
>  		.pm	= &ohci_hcd_s3c2410_pm_ops,
> -		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
>  	},
>  };
>  
> -- 
> 2.48.1
> 

