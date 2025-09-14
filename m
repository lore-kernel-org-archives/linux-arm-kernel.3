Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7B0CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17ifI2mYE1NgbBTyTNuir4pDtVCiq8BMt8N76nRgoes=; b=uA8az0Cn4RIi7Oqdqid8hHeC5S
	f0YYVWVcxOExTO/ebBgDmiMZ1voP5BTStoEpIFR3t7C41rEyH90cqTZNvFUsr5DmpOwdtt0No9g4k
	Eue1ER0YyiJYzDCenNel3NWeJ5cZiNcurASO6QjcjMH3C2SGCDZVSe/MOdbTWix6li/Yh37KVA0/4
	W6FBaHX8Sfl3BJ+KyZLKnwDZVFVJaYPIt7rMRzR+1Iszsy/Ro8vBWOSuX/6OMa88u5RPygnVpASbi
	NpvnGJaG4xkZwSaFO9HhfKc4u2oISge8CKS5A/YN53ld+4cJUcyvcTBOXHfKWxAJL8+15LkLTN4CL
	oTIYkfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxotX-00000001jWa-2uDq;
	Sun, 14 Sep 2025 15:44:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxotU-00000001jVr-3OX5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 15:44:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ea115556b2so278465f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757864639; x=1758469439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=17ifI2mYE1NgbBTyTNuir4pDtVCiq8BMt8N76nRgoes=;
        b=W9XMQ2TMuiJmLS0zTb5Nz+YYaxnPdg9lyAFkm03ke2LDFg/U7GHieCJ/bfML3cFogX
         YkXEcp2b8PtoL9WVEJCsdnsPPp+bTB4BBnb2qrOc1z2F0+XDx2Z0o1MeqTW3AnUIOTSA
         VjX9jxGzX9UKHjkwX9XX3YgF854Bn+WaA0zMEgTliqDZ2TimAC7BKyGY7tP97xMwgjhQ
         J04LzAlS9rCMHfBJiZvAdKBkAmj8xfKvQBLKST773n7Y82zKfhpJx/9L6r/bKrNMRgB9
         x0iub7hxptpFdTK6XK0w/FVhVkYzTbrWMK8PYDwMkQq+DRliBD/iVf1twm3USpByLD7R
         zAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757864639; x=1758469439;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17ifI2mYE1NgbBTyTNuir4pDtVCiq8BMt8N76nRgoes=;
        b=XiRjxg60OTX0ARazK/Rg8Fm04fVfGhY8HboRZ8HdKvwAJbGZiJT0N3lPsou8VMk/8j
         mYWjV0vqQVYllJitao4phziYaRbZbGo8SAftFAkjYNtwz0GNw08E7ZAfG4omLyRDnv7w
         gyUBKAfw+Wn/gGtt5GR2Ovh0wTZv3AZZ8HbOLV0+BZiMvuyBp/XuChPRQrZth3FcFZd3
         ANbyjsqxWJPB6aU/esVMI1UhcsyjYoo35L+loq7XBvLWgZxp5d3K8HBDAMxHDuPrq64n
         K45awzNunjf+8E9eHVl0JeIAjB1kr6lb+nfN5g1QFptz4WXYlt3/Ewt060dGqfpHznzt
         kRgg==
X-Forwarded-Encrypted: i=1; AJvYcCWcoGDq2Lk7kxnZcQ2YcEIirjA6YStpfBGO7CMb++rOi/OfAClQjy3K9HoTuXYQBpuRz5RwDBZv8XogWBcSdegU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2G2h6cqAsmzIhYmsgrcvsJL97gdYrJE08lyI23D1vXEFoZphZ
	nY1Wb7I9+1Rudry6QKatBXB3q67lrwTV3PCf82BKE+IrnV4lk217q21z6MiBHjtiYAQ=
X-Gm-Gg: ASbGnctiJftPHU3n8oLyorDOxCDQseEEkXNF0i8BGkHcRsihRp3KjbSUuGzbIP4R1p5
	AyZJqHpzEy2hQxixarrFo6syKacvgFZ7exikHzGpG3X3+x63vRQd4XrusUzNYShabt060Qk1Po1
	ObtgLJ0Ju/CQNx01SKqXxPsqed6mmjtYsUrJMNTudV0AHRZf1aZC1wXWUnG7TVmP0cPjUEdxaWk
	bMzbgG4wAjwrWyTC+QAz4m182olYZq3xrKgIweDsX7t1c/ElToY6PIBwoN4MkWYgW0Lm4WFHWi5
	pYkRdDokhRAKEb8xA0+/VasaXf/Jl+EsSZRPV8bHUhi1+xeAmQBWf8UKaJ/KJw6G0fSO4OMzmDC
	v0vdkokKLfCzdwzOICuY/oMNQ3Ztj3CPHxvxB6xkvrA==
X-Google-Smtp-Source: AGHT+IHL6egG0n/SaYA5xvNQA+X+v1J8Dbx8go0tlT2XCBBZEzMIXumDBUCMKSubOS2pVf3FdBCGfA==
X-Received: by 2002:a05:6000:2510:b0:3e4:ea11:f7df with SMTP id ffacd0b85a97d-3e7659db441mr8532807f8f.40.1757864638550;
        Sun, 14 Sep 2025 08:43:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0153fbd5sm74655275e9.5.2025.09.14.08.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 08:43:57 -0700 (PDT)
Message-ID: <038ea3e7-53d5-4e49-ad35-cc2a58e4d808@tuxon.dev>
Date: Sun, 14 Sep 2025 18:43:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] iio: adc: at91-sama5d2_adc: update calibration
 index, validation condition
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-5-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250804100219.63325-5-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_084400_868089_B2608CF2 
X-CRM114-Status: GOOD (  21.16  )
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

Hi, Varshini,

On 8/4/25 13:02, Varshini Rajendran wrote:
> Add additional condition for validating the calibration data read from
> the OTP through nvmem device interface. Adjust the calibration indexes
> of sama7g5 according to the buffer received from the OTP memory.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index c3450246730e..d952109a64a9 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -445,6 +445,14 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  #define at91_adc_writel(st, reg, val)					\
>  	writel_relaxed(val, (st)->base + (st)->soc_info.platform->layout->reg)
>  
> +/*
> + * The calibration data has a TAG to recognize the packet
> + * The tag has a constant value "ACST" with the ASCII
> + * equivalent 0x41435354. This is used to validate the
> + * calibration data obtained from the OTP.
> + */
> +#define AT91_TEMP_CALIB_TAG	0x41435354
> +
>  /**
>   * struct at91_adc_platform - at91-sama5d2 platform information struct
>   * @layout:		pointer to the reg layout struct
> @@ -504,10 +512,10 @@ struct at91_adc_temp_sensor_clb {
>   * @AT91_ADC_TS_CLB_IDX_MAX: max index for temperature calibration packet in OTP
>   */
>  enum at91_adc_ts_clb_idx {
> -	AT91_ADC_TS_CLB_IDX_P1 = 2,
> -	AT91_ADC_TS_CLB_IDX_P4 = 5,
> -	AT91_ADC_TS_CLB_IDX_P6 = 7,
> -	AT91_ADC_TS_CLB_IDX_MAX = 19,
> +	AT91_ADC_TS_CLB_IDX_P1 = 1,
> +	AT91_ADC_TS_CLB_IDX_P4 = 4,
> +	AT91_ADC_TS_CLB_IDX_P6 = 6,
> +	AT91_ADC_TS_CLB_IDX_MAX = 18,
>  };
>  
>  /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
> @@ -2281,7 +2289,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  		dev_err(dev, "Failed to read calibration data!\n");
>  		return PTR_ERR(buf);
>  	}
> -	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
> +	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4  || buf[0] != AT91_TEMP_CALIB_TAG) {

Can buf[0] != AT91_TEMP_CALIB_TAG with the new code?


>  		dev_err(dev, "Invalid calibration data!\n");
>  		ret = -EINVAL;
>  		goto free_buf;


