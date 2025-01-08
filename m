Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A14E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vgCrtOmP3fMOm81ZkcP04u4uUigFjMyWEu/8yFPY2c=; b=QM07UDDHYBhQ2ezAX0r7hILcnM
	p3CvYj9Sk9QmTd8X6gYyTQdKfLkaGF4Gl7QGI1mZyOCPQjMtWJyurydtz+rLQZpuOWcjfBK0ytIS/
	wL1nIHUXt3T86GD7a5gdkVn1HYDNhRLoOc9pzSF8jFF0Es9g05ROHXufKRHXKk0aDl4ZlMu3VqVKQ
	z4ngC2WrWStvaXsPj+IDYbbJykEdqn2Fs+ECqFn5LlU5lSlLayberkQiVwH8KomlH0rQKJJr4nCM0
	maERdPiqjVFglVlB4L/8DTLSQ46s/Cn80fxnJuphB3PN5o1lHQTivLhMduOIFk26JdEguW4e6ehop
	vmiW0Z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSDn-00000007kZS-07Zk;
	Wed, 08 Jan 2025 09:19:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSCR-00000007k68-2d08
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:18:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso13786489f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327882; x=1736932682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vgCrtOmP3fMOm81ZkcP04u4uUigFjMyWEu/8yFPY2c=;
        b=OO90idiWKVhZ0wC86TXODTp7HwC5U3a15+BGe+B4A+R3nR9x7PRXCVE+8wdWuKesPX
         Nqa8g2U/wy+DN0t6JaEzVzcU0N7ILLeymVUw65VYXDOmaIVGMuAkPImmQezTok0DQNXh
         U8WqWeLP3+4JkgszFp+3Xz+iaj5YY/1cjdoHVfCh80L/JxBKQGW1oNgF0gw2wp+6RVaG
         l1BCV7dXWXXwdQeaxJTTL/0BFKGW5cLh1f9aKYw/v+DTWdvUXMoy9iosYMjTgNZ6kDZT
         Yl5G0VCwipSPXefgzP+xlYLrTYDbBDsUMpXXxWTz4aUBfEtnH/Lk11FUMfk8F2wklpPq
         7qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327882; x=1736932682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vgCrtOmP3fMOm81ZkcP04u4uUigFjMyWEu/8yFPY2c=;
        b=mZqqrMDIdVhV/rS/vciAPM1APcm7toV8stkXTvFZE+jvn7mtwwtQW7s7/3Hrli8N+6
         z4tYH9zWjKQhCJR77w/awCmnUl2MjuNtA1vAkBL76NRxqB6FZ691e1VfwCPFoZwP7dWB
         wgPou9ncdbEEG3tZ4QAAoE5IaPRARanYAC+T7O01DUfA4v2Zgj4g/YuPXiqj88dpU46h
         JelpV0xcOjOhYgmZznJXZkkBTWApk5xHzO0QgMDPNAozud/N87XwDKKAx6HgJEplrMVt
         jAw/rJUB04Jua067eaGr0eYqI4rMaA4xWN5Mbo2amuB5tXLhGRJum2YKL4zp+drPo9Vz
         /Z4g==
X-Forwarded-Encrypted: i=1; AJvYcCWza9bFCQiw6yiluo+NbI+YQgKy2cfzNGmjrbWATC03kgS2uu+RP+PIoh9prLbvVzmDHubVCyMJG6mIgZ0lIeEW@lists.infradead.org
X-Gm-Message-State: AOJu0YydIaVv43LB71Z7b5nYuIntELolYt4k+bISNUdMZuIpuJCLAjpz
	ooy2vvrlf5ATEnN5ZsOCykPoJpOMR3FK5/kDwUcCIlUy1Rv8YNRtLWA0mA==
X-Gm-Gg: ASbGncsJS9YhFBGW1mkMt7EjdAp/TJ8d6ijFj+fP7U7uWEdmG+0pj20QtUUTlXF63LU
	JCK1S1e1RNnOLkFpXbM9U1zUlgxRMDdn9RCttaivQlXtYXh6moYzhV4rtuldgAqG8k9bf1xfIW7
	lyTjIlD5ZEYk8Tuxkvk8uyoAAHdnJlT8JRMrVCJWnu5GM0lC3YrU02VKtcqRILwRCex+SvWhdb+
	Yz0aJskereUWa0xRijqqEcv6e/1oVqHyiTs0RiDhZ7j1X4sNXOVrKK4l8eZoO3CZto9bGDySzvB
	UxNGXBAAhiA5qkcdVfDBwA==
X-Google-Smtp-Source: AGHT+IF25RyfmHYR8rxHUwWamhEEYdeAEyyzo+cfrf76RzBh0JsXJhCzQDdi/Yez7lnMabSTGdWjVQ==
X-Received: by 2002:a05:6000:1acb:b0:385:edd1:2249 with SMTP id ffacd0b85a97d-38a87316a81mr1314020f8f.50.1736327881617;
        Wed, 08 Jan 2025 01:18:01 -0800 (PST)
Received: from [172.16.20.210] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e150sm52311147f8f.66.2025.01.08.01.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:18:01 -0800 (PST)
Message-ID: <907e1169-ceea-4d41-93bb-925041de005e@gmail.com>
Date: Wed, 8 Jan 2025 11:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1 and
 exynos8895
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
 <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_011803_683489_D08E49E4 
X-CRM114-Status: GOOD (  36.48  )
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

On 1/8/25 10:30, Krzysztof Kozlowski wrote:
> On Tue, Jan 07, 2025 at 01:35:11PM +0200, Ivaylo Ivanov wrote:
>> USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
>> provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
>> SPI, UART, UART_HSI2C1).
>>
>> USIv1, unlike USIv2, doesn't have any known register map. Underlying
>> protocols that it implements have no offset, like with Exynos850.
>> Desired protocol can be chosen via SW_CONF register from System
>> Register block of the same domain as USI.
>>
>> In order to select a particular protocol, the protocol has to be
>> selected via the System Register. Unlike USIv2, there's no need for
>> any setup before the given protocol becomes accessible apart from
>> enabling the APB clock and the protocol operating clock.
>>
>> Modify the existing driver in order to allow USIv1 instances in
>> Exynos8895 to probe and set their protocol. While we're at it,
>> make use of the new mode constants in place of the old ones
>> and add a removal routine.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
>>  1 file changed, 95 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
>> index 114352695..43c17b100 100644
>> --- a/drivers/soc/samsung/exynos-usi.c
>> +++ b/drivers/soc/samsung/exynos-usi.c
>> @@ -16,6 +16,18 @@
>>  
>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>  
>> +/* USIv1: System Register: SW_CONF register bits */
>> +#define USI_V1_SW_CONF_NONE		0x0
>> +#define USI_V1_SW_CONF_I2C0		0x1
>> +#define USI_V1_SW_CONF_I2C1		0x2
>> +#define USI_V1_SW_CONF_I2C0_1		0x3
>> +#define USI_V1_SW_CONF_SPI		0x4
>> +#define USI_V1_SW_CONF_UART		0x8
>> +#define USI_V1_SW_CONF_UART_I2C1	0xa
>> +#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
>> +					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
>> +					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
>> +
>>  /* USIv2: System Register: SW_CONF register bits */
>>  #define USI_V2_SW_CONF_NONE	0x0
>>  #define USI_V2_SW_CONF_UART	BIT(0)
>> @@ -34,7 +46,8 @@
>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>  
>>  enum exynos_usi_ver {
>> -	USI_VER2 = 2,
>> +	USI_VER1 = 1,
> Is this assignment=1 actually now helping? Isn't it creating empty item
> in exynos_usi_modes array? Basically it wastes space in the array for
> no benefits.

I wanted to keep the USIv2 enum the same.

>
>> +	USI_VER2,
>>  };
>>  
>>  struct exynos_usi_variant {
>> @@ -66,19 +79,39 @@ struct exynos_usi_mode {
>>  	unsigned int val;		/* mode register value */
>>  };
>>  
>> -static const struct exynos_usi_mode exynos_usi_modes[] = {
>> -	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>> -	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
>> -	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
>> -	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
>> +#define USI_MODES_MAX (USI_MODE_UART_I2C1 + 1)
>> +static const struct exynos_usi_mode exynos_usi_modes[][USI_MODES_MAX] = {
>> +	[USI_VER1] = {
>> +		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
>> +		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
>> +		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V1_SW_CONF_SPI },
>> +		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V1_SW_CONF_I2C0 },
>> +		[USI_MODE_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
>> +		[USI_MODE_I2C0_1] =	{ .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
>> +		[USI_MODE_UART_I2C1] =	{ .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
>> +	}, [USI_VER2] = {
>> +		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>> +		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
>> +		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
>> +		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
>> +	},
>>  };
>>  
>>  static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
>>  static const struct exynos_usi_variant exynos850_usi_data = {
>>  	.ver		= USI_VER2,
>>  	.sw_conf_mask	= USI_V2_SW_CONF_MASK,
>> -	.min_mode	= USI_V2_NONE,
>> -	.max_mode	= USI_V2_I2C,
>> +	.min_mode	= USI_MODE_NONE,
>> +	.max_mode	= USI_MODE_I2C,
>> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>> +	.clk_names	= exynos850_usi_clk_names,
>> +};
>> +
>> +static const struct exynos_usi_variant exynos8895_usi_data = {
>> +	.ver		= USI_VER1,
>> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
>> +	.min_mode	= USI_MODE_NONE,
>> +	.max_mode	= USI_MODE_UART_I2C1,
>>  	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>>  	.clk_names	= exynos850_usi_clk_names,
>>  };
>> @@ -88,6 +121,10 @@ static const struct of_device_id exynos_usi_dt_match[] = {
>>  		.compatible = "samsung,exynos850-usi",
>>  		.data = &exynos850_usi_data,
>>  	},
>> +	{
> These two are in oone line.
>
>> +		.compatible = "samsung,exynos8895-usi",
>> +		.data = &exynos8895_usi_data,
>> +	},
>>  	{ } /* sentinel */
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
>> @@ -109,14 +146,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>>  		return -EINVAL;
>>  
>> -	val = exynos_usi_modes[mode].val;
>> +	val = exynos_usi_modes[usi->data->ver][mode].val;
>>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>>  				 usi->data->sw_conf_mask, val);
>>  	if (ret)
>>  		return ret;
>>  
>>  	usi->mode = mode;
>> -	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
>> +	dev_dbg(usi->dev, "protocol: %s\n",
>> +		exynos_usi_modes[usi->data->ver][usi->mode].name);
>>  
>>  	return 0;
>>  }
>> @@ -160,6 +198,30 @@ static int exynos_usi_enable(const struct exynos_usi *usi)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * exynos_usi_disable - Disable USI block
>> + * @usi: USI driver object
>> + *
>> + * USI IP-core needs the reset flag cleared in order to function. This
>> + * routine disables the USI block by setting the reset flag. It also disables
>> + * HWACG behavior. It should be performed on removal of the device.
>> + */
>> +static void exynos_usi_disable(const struct exynos_usi *usi)
>> +{
>> +	u32 val;
>> +
>> +	/* Make sure that we've stopped providing the clock to USI IP */
>> +	val = readl(usi->regs + USI_OPTION);
>> +	val &= ~USI_OPTION_CLKREQ_ON;
>> +	val |= ~USI_OPTION_CLKSTOP_ON;
>> +	writel(val, usi->regs + USI_OPTION);
>> +
>> +	/* Set USI block state to reset */
>> +	val = readl(usi->regs + USI_CON);
>> +	val |= USI_CON_RESET;
>> +	writel(val, usi->regs + USI_CON);
>> +}
>> +
>>  static int exynos_usi_configure(struct exynos_usi *usi)
>>  {
>>  	int ret;
>> @@ -169,9 +231,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
>>  		return ret;
>>  
>>  	if (usi->data->ver == USI_VER2)
>> -		return exynos_usi_enable(usi);
>> +		ret = exynos_usi_enable(usi);
>> +	else
>> +		ret = clk_bulk_prepare_enable(usi->data->num_clks,
>> +					      usi->clks);
>>  
>> -	return 0;
>> +	return ret;
>>  }
>>  
>>  static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
>> @@ -253,10 +318,26 @@ static int exynos_usi_probe(struct platform_device *pdev)
>>  
>>  	ret = exynos_usi_configure(usi);
>>  	if (ret)
>> -		return ret;
>> +		goto fail_probe;
>>  
>>  	/* Make it possible to embed protocol nodes into USI np */
>>  	return of_platform_populate(np, NULL, NULL, dev);
> This also needs error handling.
>
>> +
>> +fail_probe:
> err_unconfigure:
>
>> +	if (usi->data->ver != USI_VER2)
>> +		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
> Move it to its own callback exynos_usi_unconfigure(), so naming will be
> symmetric. The probe does not prepare clocks directly, so above code is
> not that readable. The most readable is to have symmetrics calls -
> configure+unconfigure (or whatever we name it).

Alright.

>
>> +
>> +	return ret;
>> +}
>> +
>> +static void exynos_usi_remove(struct platform_device *pdev)
>> +{
>> +	struct exynos_usi *usi = platform_get_drvdata(pdev);
>> +
>> +	if (usi->data->ver == USI_VER2)
>> +		exynos_usi_disable(usi);
> This is not related to the patch and should be separate patch, if at
> all.

Well I though that since didn't have any removal routine before it'd be good
to introduce that and not leave USIv2 with hwacg set.

Best regards,
Ivaylo

>> +	else
>> +		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
> So the easiest would be to add devm reset action and then no need for
> goto-err handling and remove() callback.
>
> Best regards,
> Krzysztof
>


