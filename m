Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245B5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3COfOGWDm8regjwsJKyQtrQX6XIkJ8lH56frMtUERmQ=; b=HUD3JHgnCT/RdZTpviUl/lFoCw
	hso1j/WOlOhCXQUOw582edfclK9Ne+mRFjZ+IzeNMOaI+9rXWZHFjF/wYyABUZf4cAPN4ul3TvDk/
	7UhkbXhjdqsrqLGlMDXIGIuQEH0ylK6x678tiHVuBScZxdkkSTeGE9eDENi8r8ckiTKgrqm9i0zGf
	+LvBhV2YLQyV8qR7noMSUaL3CSolbzWlkDiMdfzDeHeucan0QItMS0H6Piy0G3HYhyVAf2+7bJ4XX
	5skFx3i5CxE6mUCIFFqYcUSAT4Senb3q/ykyd1E7lE9zdlNdQDqwVNW8nXcK7UTu8ewGHWxcJKPEy
	GLLIj4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTd5I-0000000CT8b-07KH;
	Fri, 03 Jan 2025 08:31:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTd45-0000000CT3y-1d7d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 152415C6217;
	Fri,  3 Jan 2025 08:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593F8C4CECE;
	Fri,  3 Jan 2025 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735892992;
	bh=NJIUi9yWwONAN4blHjHBMYlaQk8Lg/DXttoXfSi/gNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxd8C4tC2I8uagkE+gfa9sEyzxCicIrfybHNcx4774WjmwQLkBJPlc/Wb7HIWP9zP
	 M34IerU+IW+3NN0O87AZw6UFTonlOx4VmWk2VZC+vGZEuxp5NSD+F3gO3nYLc0vWNU
	 TXutekZWAA+3gwG5+LJsXqVXEERB1RR43tO2AMKHYgepadyIaVaOcCj5dARIYKuPCO
	 XPhFdnQvYcHbghZzOXYB+tDYrmRQlbwlpYPVDAIGlJ1AUXdJ19X4TaEwtgbrpusM3Y
	 q70pLYQSisYo5786bP7AH1wXoH5MCxsvE+MxR2R8fwaw785g9Hk7iID2uwvjlInkLa
	 L0yG9EC59sZqw==
Date: Fri, 3 Jan 2025 09:29:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] soc: samsung: usi: implement support for USIv1
Message-ID: <utew7byz6kulmet76ayuc4obwavm5g5q2m5gk4metqulcgi4as@eml3cfd3vfaq>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_002953_745114_296AB949 
X-CRM114-Status: GOOD (  15.75  )
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

On Thu, Jan 02, 2025 at 10:40:15PM +0200, Ivaylo Ivanov wrote:
>  /* USIv2: System Register: SW_CONF register bits */
>  #define USI_V2_SW_CONF_NONE	0x0
>  #define USI_V2_SW_CONF_UART	BIT(0)
> @@ -34,7 +46,8 @@
>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>  
>  enum exynos_usi_ver {
> -	USI_VER2 = 2,
> +	USI_VER1 = 1,
> +	USI_VER2,
>  };
>  
>  struct exynos_usi_variant {
> @@ -66,6 +79,16 @@ struct exynos_usi_mode {
>  	unsigned int val;		/* mode register value */
>  };
>  
> +static const struct exynos_usi_mode exynos_usi_v1_modes[] = {
> +	[USI_V1_NONE]		= { .name = "none", .val = USI_V1_SW_CONF_NONE },
> +	[USI_V1_I2C0]		= { .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
> +	[USI_V1_I2C1]		= { .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
> +	[USI_V1_I2C0_1]		= { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
> +	[USI_V1_SPI]		= { .name = "spi", .val = USI_V1_SW_CONF_SPI },
> +	[USI_V1_UART]		= { .name = "uart", .val = USI_V1_SW_CONF_UART },
> +	[USI_V1_UART_I2C1]	= { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },

Now I see why you duplicated the IDs... With my approach your code here
is even simpler. Allows to drop USI_VER1 as well.


> +};
> +
>  static const struct exynos_usi_mode exynos_usi_modes[] = {
>  	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>  	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
> @@ -83,11 +106,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
>  	.clk_names	= exynos850_usi_clk_names,
>  };
>  
> +static const struct exynos_usi_variant exynos8895_usi_data = {
> +	.ver		= USI_VER1,
> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
> +	.min_mode	= USI_V1_NONE,
> +	.max_mode	= USI_V1_UART_I2C1,
> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
> +	.clk_names	= exynos850_usi_clk_names,
> +};
> +
>  static const struct of_device_id exynos_usi_dt_match[] = {
>  	{
>  		.compatible = "samsung,exynos850-usi",
>  		.data = &exynos850_usi_data,
>  	},
> +	{
> +		.compatible = "samsung,exynos8895-usi",
> +		.data = &exynos8895_usi_data,
> +	},
>  	{ } /* sentinel */
>  };
>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
> @@ -105,18 +141,32 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>  {
>  	unsigned int val;
>  	int ret;
> +	const char *name;
>  
> +	usi->mode = mode;
>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>  		return -EINVAL;
>  
> -	val = exynos_usi_modes[mode].val;
> +	switch (usi->data->ver) {
> +	case USI_VER1:
> +		val = exynos_usi_v1_modes[mode].val;
> +		name = exynos_usi_v1_modes[usi->mode].name;
> +		break;
> +	case USI_VER2:
> +		val = exynos_usi_modes[mode].val;
> +		name = exynos_usi_modes[usi->mode].name;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>  				 usi->data->sw_conf_mask, val);
> +

No, why? Drop.

Best regards,
Krzysztof


