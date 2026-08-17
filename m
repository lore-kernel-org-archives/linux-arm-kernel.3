Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3249FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCkUaJwsiIx2/8B6UmuqctR4tL1PfcLhtviHSxv/jPY=; b=WlBqENhFPPagzNTTL3ot0BrYqw
	9m1pM2OvVO1/TJNFHZ/szx+EcDJVE36FNw9Ikwf6V1YcC16QNiy1fcQWhwkhfFeu6N5kbiM9E4JRX
	X33Wd9hOEO+d3X2YytBAWOud49o2N0MFdwlrj5zLXazB18SX5NLAvkODH+Th2GZUCujy5iWcK6WpZ
	RhZk1qaOB9dWcSOguxHsymwmPE9s2Yx8wMJWTC9UVgqW+W6TSnG//Jewuthq96MeLK5TAB0PavWY5
	5C1qjOOtqw066khxg70OQVZuecE29QeuanhGaRBjvdUPgEQ6mI0bMGSiuC+484hZEg+xtNUjsmlyK
	zTgMll/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvw0L-000000065p3-1WRW;
	Mon, 17 Aug 2026 11:59:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvw0J-000000065of-0Bo2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:59:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4994c49f588so29684405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786967985; x=1787572785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCkUaJwsiIx2/8B6UmuqctR4tL1PfcLhtviHSxv/jPY=;
        b=M+1wJ8pqpwEIkpfOpUe4TPVYpVPEGusUctJZfM81ynx8Y4vE9ZRhLpYBoCJBGeQsoA
         iDovSwtuUdR/3NgEYhTz7A8QR726rLGWJbTHcE+jo3P6cG1C70tEGlpdqYJR5/R6ubWl
         S/h7TEDh7QYZx5qjTVI9iP7HEw0oWmuN2snEFR7ILglzkXtX2HhojTpbrbCZWH7ByP16
         GNbmkJCOQSQBiqBzNx5vXSTlVj6GsrmWvlFw2ePZMITHewS8MPZrNNoZRxqkO8wRN7lI
         5hRvyOYwPbHoISHSowhrzbe7Z/pt2BJTnGScYLh/+z1gnQ+zzyCY6AeSQ8bVgxeugFmB
         28CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967985; x=1787572785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCkUaJwsiIx2/8B6UmuqctR4tL1PfcLhtviHSxv/jPY=;
        b=PIX3a2b9Z4EwWWtoOFdBQe2LdwwKjDZA4xQIx4TnCX7Ad+wQnmtPUKPLOowSGdc0jG
         Kk2ba+FHO/Rqk8LwWJbclXE/+cQlVxoHi82dSkaeaEDGfSlq3f1pq02DvyMCL4/jW6Cm
         L9E+R5I+NVyoDylfy6F6s5ckM2T+QbIqj0AihCA1jgmgdVULgOzrP0i0w8LaOKYu0zFS
         OR/N8HapwsJl8fUFUPBaafBlH9+TkAKqmzek2qWxzJ6aCG1VOSLRau4DL0SDlA/uKmxN
         fBBOeRmoHfTkGjdaT9PhZsPO8qkHy4twfuXmLgQAFDNv7aMnFZ3ZD0biu98J6AGWD7jT
         xQ3g==
X-Forwarded-Encrypted: i=1; AHgh+Rrf1+D55foqbkTLwTmBw5forDQn7zi9Dg8Wj1X+f6y9vBkEZtNnE6WaBAz4NT3gxETiNY2Cj8KoPnsFrAWzxAGk@lists.infradead.org
X-Gm-Message-State: AOJu0YyHqBQvi9MOXAGAAhN1MxAbrQDtmICTm75S1Gltc7thU3qcnkyH
	g9KlkGx+Rs84DaFvbvM2TNw/JSdeZrA0fWMikl4lPR8OEqqLZn9bAu38
X-Gm-Gg: AR+sD10Snej07aOhLpi0BNKK98suKoCjoqADTdnw8RdtZpwFF1v4ziJ0Km81XpQE43T
	fLDaODfoXrG/Iq+QP7nDpc3C0Ek8SnOAmi1ItKltHyQiMNF7fbYIAEMmR6VtiC7hS8pxtlw8C/c
	uIww6k1+3U7lQrI4/mYN3ahbxX3a5EZBrF4WX7+zzIagFKEbAg5MQHoOHwoueU1bq1XqHIUwcjc
	kyUTE3Yth/sY4+WQCdbAIUKp5k9mmo9Csfd0NBOKg2Nweewn5A8NMbpnvXcCtNVaPmhziabMi/O
	hWkfnr0XAu36kXJw+fXGmvuCWHWbvaTLTBZhzXHqGUwjUId5PMu0rCk6xkC2FayLxhenkcgXu3E
	GfR2MBm7TPRvJBNPfAOGzYIDnB4q3vSaeV3UghnO8iKm1RZuKwuoRsCv33nt+8faL6BtwgTiYYW
	ktPF+qQp79+tpP6rMuqItkBjy7CDdW9ySq+JyuQWqCuG8nBVzjzUM8bpx0ZllmdZhMeBZxD6Dq9
	BVg8ZSytzY+6cBCVjNdeYry5rMs7B5JXG7pNyS8ttzj8xoEwaWvVMKvOX0FtLESdQl6M2NUPMnS
	SyFdxyXM47qtSzzSVsYJNLU1DgeGFKN6Q1kIYMh8JeHIrtb/M0j1ku4llMrENG6uM2EhHO0Kjg9
	vxUBrRkRuWyW1RZE/Rb+ZwFhzgRzwiCkqGT/yXY/G8wyuvSqFk0ZWNvoDQdmrIhfTlBSAlQ==
X-Received: by 2002:a05:600c:3b90:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49987a4f131mr325063325e9.1.1786967985143;
        Mon, 17 Aug 2026 04:59:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499961098cdsm162556715e9.6.2026.08.17.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:59:45 -0700 (PDT)
Date: Mon, 17 Aug 2026 13:59:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Petar Stepanovic
 <pstepanovic@axiado.com>, Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit Shah
 <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260817135920.0000461d@gmail.com>
In-Reply-To: <20260817034541.053dac28@jic23-huawei>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
	<20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
	<anoYDi-bt-t6ZeeD@ashevche-desk.local>
	<20260817034541.053dac28@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_045947_131484_C38FC096 
X-CRM114-Status: GOOD (  36.09  )
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

On Mon, 17 Aug 2026 03:45:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 10 Aug 2026 21:27:26 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Mon, Aug 10, 2026 at 07:49:36AM -0700, Petar Stepanovic wrote:  
> > > Add support for the SARADC controller found on Axiado AX3000 and
> > > AX3005 SoCs.
> > > 
> > > The driver supports single-shot voltage reads through the IIO
> > > subsystem. The number of available input channels is selected from
> > > the SoC match data, allowing AX3000 and AX3005 variants to use the
> > > same driver.    
> > 
> > ...
> >   
> > > +/* MANUAL_CTRL register fields */    
> > 
> > ^^^
> >   
> > > +#define AX_SARADC_MANUAL_CTRL_ENABLE	BIT(0)
> > > +#define AX_SARADC_MANUAL_CTRL_CH_SEL_MASK	GENMASK(4, 1)
> > > +
> > > +#define AX_RESOLUTION_BITS	10
> > > +#define AX_SARADC_CONV_CYCLES	13
> > > +#define AX_SARADC_CONV_DELAY_MARGIN_US	10
> > > +
> > > +struct axiado_saradc {
> > > +	struct regmap *regmap;
> > > +	struct mutex lock; /* Serializes ADC conversions. */    
> > 
> > Choose the same style for all single-line comments (here is a period present
> > while in the above, for instance, there is none).  
> 
> Hmm. It is inconsistent in other places, but those two are arguably
> correct. The second is a sentence, the first is not (no verb)
> 
> Anyhow, I did a sweep for other sentences and not all of them have
> periods.  Given the rest of the driver looked fine to me and the other
> suggestions Andy made are easy to apply.
> 
> Applied with the following diff to the testing branch of iio.git
> Note I'm fine with rebasing that (and will do on rc1 once that's available)
> so extra tags or review comments are easy to add for a few weeks at least.
> 
> Mostly I did this just to reduce how many patch sets were undergoing
> revisions... I'm still over a 100 emails to read and run out of
> time for today.
> 
> Jonathan
> 
> 
> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_saradc.c
> index daa98dd2f176..699ee31616fc 100644
> --- a/drivers/iio/adc/axiado_saradc.c
> +++ b/drivers/iio/adc/axiado_saradc.c
> @@ -34,10 +34,10 @@
>  #define AX_SARADC_GLOBAL_CTRL_PD               BIT(2)
>  #define AX_SARADC_GLOBAL_CTRL_ENABLE           BIT(0)
>  
> -/* GLOBAL_CTRL SAMPLE_MASK field value: 0 selects 16 samples */
> +/* GLOBAL_CTRL SAMPLE_MASK field value: 0 selects 16 samples. */
>  #define AX_SARADC_GLOBAL_CTRL_SAMPLE_16        0
>  
> -/* GLOBAL_CTRL MODE_MASK field value: 1 selects manual mode */
> +/* GLOBAL_CTRL MODE_MASK field value: 1 selects manual mode. */
>  #define AX_SARADC_GLOBAL_CTRL_MODE_MANUAL      1
>  
>  /* MANUAL_CTRL register fields */
> @@ -76,16 +76,15 @@ static int axiado_saradc_conversion(struct axiado_saradc *info,
>  
>         guard(mutex)(&info->lock);
>  
> -       /* Select the channel to be used and trigger conversion */
> +       /* Select the channel to be used and trigger conversion. */
>         ret = regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
>                            AX_SARADC_MANUAL_CTRL_ENABLE |
>                            FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
>         if (ret)
>                 return ret;
>  
> -       /* Hardware requires 13 conversion cycles at clk_rate */
> -       usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> -                            info->clk_rate);
> +       /* Hardware requires 13 conversion cycles at clk_rate. */
> +       usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC, info->clk_rate);
>         fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);
>  
>         ret = regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);
> @@ -220,7 +219,7 @@ static int axiado_saradc_probe(struct platform_device *pdev)
>  
>         soc_data = device_get_match_data(dev);
>         if (!soc_data)
> -               return dev_err_probe(dev, -EINVAL, "failed to get match data\n");
> +               return dev_err_probe(dev, -ENODATA, "failed to get match data\n");
> >   
> > > +	unsigned long clk_rate;
> > > +	int vref_uV;
> > > +};    
> > 
> > ...
> >   
> > > +static int axiado_saradc_conversion(struct axiado_saradc *info,
> > > +				    struct iio_chan_spec const *chan, int *val)
> > > +{
> > > +	unsigned long usecs;
> > > +	unsigned int regval;
> > > +	int ret;
> > > +
> > > +	guard(mutex)(&info->lock);
> > > +
> > > +	/* Select the channel to be used and trigger conversion */
> > > +	ret = regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG,
> > > +			   AX_SARADC_MANUAL_CTRL_ENABLE |
> > > +			   FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, chan->channel));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Hardware requires 13 conversion cycles at clk_rate */    
> >   
> > > +	usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> > > +			     info->clk_rate);    
> > 
> > I think it's okay to have this on a single line (83 characters).
> >   
> > > +	fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);
> > > +
> > > +	ret = regmap_read(info->regmap, AX_SARADC_DOUT_REG, &regval);
> > > +
> > > +	/* Best effort to stop manual conversion. */
> > > +	regmap_write(info->regmap, AX_SARADC_MANUAL_CTRL_REG, 0);
> > > +
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*val = regval & GENMASK(AX_RESOLUTION_BITS - 1, 0);
> > > +
> > > +	return 0;
> > > +}    
> > 
> > ...
> >   
> > > +	soc_data = device_get_match_data(dev);
> > > +	if (!soc_data)
> > > +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");    
> > 
> > -ENODATA
> >   
> 
> 

With the diff Jonathan sent in mind,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

