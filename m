Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C97C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSsnV19R3euCe7A+mmLLwP9bRWysONanwRs/f83625E=; b=3WAWkeIOVhikcu2bW4FrA+Qyvg
	GNHmKTiKEO/XxCkfOimYrlBsVHTqipu4arA0v4e2fmodQxC3UIXo8bDk/hZhLEQ26gJnH25XOtJTs
	Lq8d9yecpukDlw4cwCoBk6vC1Ekn5Cnz02e5492ey+mIR0DiSi7/HqShOzPgdNNb6tfHs9xZEjGuU
	l/4TSk8Ua7gVjE1q9QrECIekKMUuKM/nMKZle1YvQUEiGw1pQSnHiWNBKqEKCz71TReszL+eKrJOI
	XQUrdU2yh+kUDAKfq90M/WyvjV/vuhg96OTx9Ep2U2xInhPIDLLmWF5RuWH58xQY/ZUBosld6Elcq
	k/fqGMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkGv-0000000D02J-1JD8;
	Wed, 19 Feb 2025 13:37:53 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkFQ-0000000CzbW-2cPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 13:36:21 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30797730cbdso70356421fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 05:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739972179; x=1740576979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSsnV19R3euCe7A+mmLLwP9bRWysONanwRs/f83625E=;
        b=a77Bk3CAwNMxQIquGsG/o5a40aoLxpuLUK5ZG3hGba2MVCGXV18rACup6N/RZRADNX
         zD+ME+0f4qPuXsyVvRRFgc6c8wdL3ZlqZh1JKlxjwSBmYmOR13/yxJ5mQi2NZ/3uDWrw
         1cqa/Yfh5b0uL0URKTNbV37QOdyFu+nwdwrIfNMq07hg8t99YLi4QLaDRujOur3YA3Cl
         gaNzqBAOuSQ7vFPo/sjbJ1j+6CbaN38tQjYhKjRF20aOEts701cWiOqTdljSTBeJGlJy
         HhrsLeFSoLCRKGwVbD20ZDXmcJJHb0hlqdrRTgOe0Se2Bfh2V7O4v14uqQtdGsp0geh0
         O1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972179; x=1740576979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSsnV19R3euCe7A+mmLLwP9bRWysONanwRs/f83625E=;
        b=FRb2F2OXKrTdtc9kSjRQljyTMnfZBLY/UW4TOEJaOMksvOIVuO0h9eXBCjBBNONfj5
         zr2EOOQwrEAHI7LDFtdbpphx3GcnCgxDd/Xh/97lEbzuNBtugPQq0OrYbV1wHYn4ZpLW
         Z7cZkynuPIZA968n3d9kS4c06FsPJ9Gm3mLxexl+J0pcL/1B8IrRz5Di+jOJ6PaP++mh
         qs4td3179NnC4D/coTkYFaCn0aG77SdSxDCdSbxr9zzTO7N3LC1TnEPA3Pg1DoJJmnaF
         mT2BUpUzhTFQDGWqEjHLdmilLKW/HbBvppOg/4ZvwrxgVQ9naYOou16RP54oXUlDRtox
         FwRw==
X-Forwarded-Encrypted: i=1; AJvYcCUZS//xV4/aQHI+lkHDxaYw7QSJX0OEGV06vlblyCY/LKjO9/xIaKyj52OQ2769udlD72TytDSph7xv+L/NTTLl@lists.infradead.org
X-Gm-Message-State: AOJu0YwzklMBGdA9uk/H8yBE0eDbi3kQzglATkOkdfqrmVl6eTOCSMAD
	HiuZTZO5qz48oNYMt3FVG7GNT0VHwY7ihw23rSv+5xtkj4+VnTJv
X-Gm-Gg: ASbGncu4r651l8+Gi8C1la1s+TUHaqbsX7gS5i3oAzWy6+0yUrZwVOaRs8Ys0qF0W7N
	oNLNSu33PdD9X19gBh1M5q23fPlsGrgfxTOd5RX3k6ky89eIWKueKZtCe03imCLglATNvD3aULj
	R3X7tr90CHAGCKMeUWmgXvMfQywtZP47F38SK7JNi9pR2b8VQpUGaTj8azUMEbrMaeLMG8+4Gd0
	3K4ZaCKkjrCK7B0oyycMwK49bWuC02azXespeZgG78e1SyW0ODV3BJpnWxTo7BYw/uoxo3qpSJz
	ti7tUO9xgNKR6hY+21Ho3a/bxF2jKYxN3C3/o1rZWl/hPkUXhsGFXEGHyebHBONRjIGfCjDI
X-Google-Smtp-Source: AGHT+IECONOuwKIydK//bT3AGqnTWMmCdF2rv/KJJHD8I1175BIY8l67zp+r+qNFr42gMLhOkEmBmA==
X-Received: by 2002:a05:651c:2222:b0:308:f4cc:951b with SMTP id 38308e7fff4ca-30a45035a2fmr14037951fa.23.1739972178597;
        Wed, 19 Feb 2025 05:36:18 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a258703c9sm13795701fa.7.2025.02.19.05.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:36:16 -0800 (PST)
Message-ID: <f1c6078e-39bf-499f-b7ab-17526b3e60a9@gmail.com>
Date: Wed, 19 Feb 2025 15:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_053620_670596_4F557EC4 
X-CRM114-Status: GOOD (  24.08  )
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

On 19/02/2025 14:31, Matti Vaittinen wrote:
> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
> drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg",
> "diff-channels", "single-channel" and the "common-mode-channel" to
> channel identification numbers used in the struct iio_chan_spec.
> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> othervice. Also, same grep shows all the .dts seem to have channel IDs
> between 0..num of channels.
> 
> Use the new helper.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v2 => v3:
>   - New patch
> 
> I picked the rzg2l_adc in this series because it has a straightforward
> approach for populating the struct iio_chan_spec. Only other member
> in the stuct besides the .channel, which can't use a 'template' -data,
> is the .datasheet_name. This makes the rzg2l_adc well suited for example
> user of this new helper. I hope this patch helps to evaluate whether these
> helpers are worth the hassle.
> 
> The change is compile tested only!! Testing before applying is highly
> appreciated (as always!).
> ---
>   drivers/iio/adc/rzg2l_adc.c | 41 ++++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> index cd3a7e46ea53..3e1c74019785 100644
> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -11,6 +11,7 @@

...

>   
> +static const struct iio_chan_spec rzg2l_adc_chan_template = {
> +	.type = IIO_VOLTAGE,

I just rebased this to v6.14-rc3 and noticed the channel type can no 
longer come from the template. There are also some other minor changes. 
I'll fix this in v4 if this same approach is kept.

> +	.indexed = 1,
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> +};
> +

Yours,
	-- Matti

