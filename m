Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA49C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1aSEKZ9GPjDBpZIq0+eebFymFhGTQv6JnpJUamgLSU=; b=NT6xSMd/eAScSmxi+Z+St2tfUB
	RtA9hKY9y0Dm1HJWW0w/+BHByOQ6+j3pUVieqVgAli1o8Rvb5P3Q4MQtVm795wJaHaCAv2+vYHonR
	RCjZMyR2eE3nhOO1CIkYsEgfgPvKchNHs1JsqGP0w7b+mxO6NLZ4Za+l3qmd3A5bBz7jy3hEnHwF6
	+kCIwz5PZhADboGiVeA2Y2/uNCjwiGpCvaQ1POW8P4Tr4qKtbWonkA4GteVaI+uWxgN+FDzVK92CF
	Un9zEFR6GvlIkFLClfj55Klt5uFrtQhjqEQMEcCNjwe4UQZbwUzW71qK4damZJ1XGSpZuKq6++zqw
	N93AmjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHl-00000004mZw-09Mc;
	Fri, 09 May 2025 20:25:33 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQG8-00000004Di9-3Ylg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:07:37 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad221f77bfaso14398466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806855; x=1747411655; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1aSEKZ9GPjDBpZIq0+eebFymFhGTQv6JnpJUamgLSU=;
        b=m3LSkJnaR16Key6QFsW/F/qyVmMUGlgpH+fZzGPt125/bHVQF1I/WT6cvgKOPDBH6H
         fJldQONtEWRBzJfO3fYGor6T0DMEJUmoLA+cjhujk9f3Od/w7cVfuwVfDp245twcT/ln
         PO5qo9Qt+8ay6HttrNRRwtFjAVDPyLCScehD90AIGXvXI681z+8oLNxuv1yjxUK5EO73
         hz+iC7IGdTIXvNVJN6JortdKZd9KOn3koVr4z1D31Nv1WcrZLN4GXTTF+bkV2AvpTQu7
         9/ui4a8c80IDOLL4i7mh0Xi1fa+CD7BKV/i3ZEMqb5wrM9GwPp4LfWk9MtrDrDUnt2is
         PTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806855; x=1747411655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1aSEKZ9GPjDBpZIq0+eebFymFhGTQv6JnpJUamgLSU=;
        b=LdOFgTmnapsmr4+O/wBS/bnJbsCduFDq6pgFmHJkG63kw9kcVmDS4CfAOpAQb5Qd7s
         WLazJfchs3zE+NdEutgSj+yq4okciTPxH1Hiylz4g8OSiwr7pySQk8tjQ202WAXvejn6
         ZEkn7uDOgVjk+wZJDqBPSXJMHAvqz3q/HxMom587UWClsTWQzVKbXb79hJajNdwrQaqy
         W1Z7grYBMguloyTlEmQ6Eanq6MrAziByxolk8tufEfG/xVmy6qf4nILx+6lsDSyu4LR1
         eVMaCNe6i3WlBAMBBn3lx1jH1SfnM0AK3FMXitSr+7w0mj2QPp8i49c4nuvZ0FlhONbb
         rg0g==
X-Forwarded-Encrypted: i=1; AJvYcCXMEEYgQErd3e6DZyQCSYWuatyudUAtM2OcyFDBfqohQNDGdDjBevM9htrnICG9w1edX+gLgtgsIToCtWjziu+b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8aooPJti4ZRU/lQ3H6qzXxTsIDAeb/4c8znRStMoEdbUPIAX1
	+44cvvy8lBXdRS62gf0TtiDxf/Puh6P4wCJurSzz/ZKvMH7OOFe2
X-Gm-Gg: ASbGncsfzWL8Ya0jIDu0h3c2LjtENp1iZFVoKpGU6ZvAMAJ34eU2uG42rKIvSGVZwOM
	FxHYDM5o6gxajppEj+Y6GJBXgI6fXtRz6x6Z9N/nofgx9iCyg58N+J4PUZuZ0kekJxZ07rO6C10
	aLIrEIWuNwiydud89VliEspL/KWj+KElb71EYxOzVKBjFfxri87Rc9eOw/XKmz7uo4aiRV5o0Fc
	CkZen8yGvN+wF4l5lH25JafzUJBl6wUtVVv6EI5dsqB7otQn1WbJ/k4gInRhcZQVdrvePUXLc7K
	BoFMFbUIEqDmONDQtMw2g+/HhwIR
X-Google-Smtp-Source: AGHT+IFfblZ5zyybW8Zc1JXlu3gaLC6XU1AeC2AshGGFeE3SDeA+ieQda1+l7upR9+VJ3d7Jl2trlg==
X-Received: by 2002:a17:906:84ef:b0:ad1:e9fb:e78 with SMTP id a640c23a62f3a-ad219121b47mr132183266b.10.1746806854983;
        Fri, 09 May 2025 09:07:34 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22562ed61sm84950466b.31.2025.05.09.09.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:07:34 -0700 (PDT)
Date: Fri, 9 May 2025 19:07:31 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
Message-ID: <20250509160731.wibhaumyialjloz3@skbuf>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_090736_888283_C16F5E54 
X-CRM114-Status: GOOD (  20.57  )
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

On Fri, May 09, 2025 at 12:05:49PM +0100, James Clark wrote:
> max_register overrides anything in the volatile ranges, so we can get
> away with sharing the same one for both types. In a later commit we'll
> add more devices and also read/write ranges which also override volatile
> ranges so this avoids adding even more duplication.
> 
> No functional changes.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/spi/spi-fsl-dspi.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 31ea8ce81e98..cb0e55a49eea 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -141,6 +141,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
>  	regmap_reg_range(SPI_MCR, SPI_TCR),
>  	regmap_reg_range(SPI_SR, SPI_SR),
>  	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> +	regmap_reg_range(SPI_SREX, SPI_SREX)

Same idea, don't take the review tag as a sign that I don't have any
change request here.

>  };
>  
>  static const struct regmap_access_table dspi_volatile_table = {
> @@ -148,18 +149,6 @@ static const struct regmap_access_table dspi_volatile_table = {
>  	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
>  };
>  
> -static const struct regmap_range dspi_xspi_volatile_ranges[] = {
> -	regmap_reg_range(SPI_MCR, SPI_TCR),
> -	regmap_reg_range(SPI_SR, SPI_SR),
> -	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> -	regmap_reg_range(SPI_SREX, SPI_SREX),
> -};
> -
> -static const struct regmap_access_table dspi_xspi_volatile_table = {
> -	.yes_ranges	= dspi_xspi_volatile_ranges,
> -	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
> -};
> -
>  enum {
>  	DSPI_REGMAP,
>  	DSPI_XSPI_REGMAP,
> @@ -179,7 +168,7 @@ static const struct regmap_config dspi_regmap_config[] = {
>  		.val_bits	= 32,
>  		.reg_stride	= 4,
>  		.max_register	= 0x13c,
> -		.volatile_table	= &dspi_xspi_volatile_table
> +		.volatile_table	= &dspi_volatile_table
>  	},
>  	[DSPI_PUSHR] = {
>  		.name		= "pushr",
> 
> -- 
> 2.34.1
> 

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

