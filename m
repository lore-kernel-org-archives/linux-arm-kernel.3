Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43545CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YClLX0yEzKDd8bl1cK6HeZnm+stLvAtsb923iZjql8k=; b=vWR/paTOgx1ptdkaepd+osFk7+
	64tyny8yR16yVVRRJMS8ec2BaJUJbngAuOsGbZM25L79E8EyGKUGa3Knc3+yg6suk/k8UxAvCS6sr
	Rc516rSrX9WqhL0WSJ7Owhdd69yU8NYMXrS9y54GE60Zhf7D1l70AI2CR00znYSOdZmYBgwxCsUC0
	ZyBYZ2mqYvotBgxqtL3lqyDe00tV0BGxIi8+7pG/9IyEzKFT4F+cb8ooElm32MlVGSoxyC//Dx4l2
	vPCZnX1KILgy9/SD2ur83J2agS3sf1JKxtiIljcHjt92CzrudjzwiooDUIVqKLMkrOyaDdtzCRKUL
	nDA0eu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYRR3-0000000CQPe-1FcF;
	Sat, 13 Jun 2026 16:42:17 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYRR0-0000000CQOx-3U6L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 16:42:16 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e701435806so1859302a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781368933; x=1781973733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YClLX0yEzKDd8bl1cK6HeZnm+stLvAtsb923iZjql8k=;
        b=VsEl+rD2qxm1in3Aq5lgAj7xv39tWLrVEV7eDICNnMMHvXErGTAAumm2SBCNBn0gyT
         mNdAjkfOh4nDp1mV9+Y2tOF82WRy4oth0aadrkbiHX04hQtGYSljS8RJa3Zs5G6Kr9o+
         7fBPDuimxS4P/kCrjtIY73Tzodz3BbI9UqILMYsXD9SlMc33Nad3blk4hFcKxoi5B4SS
         /u1KSgek3t8tx1hoVckNYYNQgozRN79PTbJ+xe5rDMkmIU72rSu8APwJB6CGKhdGYHne
         5LZ8NHzK/3udut7ex1LE0k6sg1yig51hWMy5wtGHXRbFxfQE8q4LcrhJ/JYh7ZfxV6Gn
         Ditg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781368933; x=1781973733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YClLX0yEzKDd8bl1cK6HeZnm+stLvAtsb923iZjql8k=;
        b=KCwQFCvthW4rioQ+qSVANiPIV0FWF6lMipYy0FGMCFuwCaJGWgcl8C19cR9tEmvGgw
         0sRvx/hpxrdRghq/HbqqMGSN6fQH1ns4K+/mYwr5+8Bk4vg2T2/Kb8yyDq83om3N2lTZ
         R/NB9Y7WfoMpF7UVCj+Q00Va703mxrF2faaFIzUHNYVrM2CbV8wJcAARZKllI2bQm1rX
         3IY9ui/j5mpuROt9bAHcVVHcxn2L0P5/CbbyW3K4QnSZ1RYIYu/eJ0Z6yDBKVq4b6mcy
         Hg6Vv+MJm70unYkOt6RTExiwjatzWcUHjl62GJX+lbbZFjWT9EwLuQNKALFufZoCdSqy
         edRg==
X-Forwarded-Encrypted: i=1; AFNElJ95BetOhAsPD1daIEutJs1El+RoIKQnHSZ41kkKDTa3PZDuWCwNUASskuMUQ+zZIhGWSek5D3irNKIXTsbnYVA1@lists.infradead.org
X-Gm-Message-State: AOJu0YxqpAp84gxkZDxwjkcYUKsusJJT39/DikCRM0jfHJQVqj9G5dBv
	1IyL3iPUNyDivlcFtdAkkLTm3qwinuaJ6esE6PrifnoDA0KwQFWl1yYfbPrAs2q30+c=
X-Gm-Gg: Acq92OGT+aBG6/EptKfWzganyAts1GVyBBf1vX2ch/00eOMNnCbcmBmJMWAUeFdGlMz
	RtZELALPEwMz0tj0I2R/1VH3HaGSYSg2fNiymTegOGXNu6Efar8UNBmWXIpCUWBhlvCc9OMGm5Y
	/vNwtRH2mgYkJ3xXR6ktgVbfu3V12FpGjxEWBYxOBdGf/kmKA090x7gjJ6t05nLAqwnbzQiCsL3
	G75FUiMYCE8OJqT2+m7HDgyQnYd8MmOAWmuGFOV5aXmEFp9oYDIUeD0wi+q/gC8akqh7LMlGhzf
	nexAbezjCSTQDIUSdF/ozXIJ/2qzpkMKadgAEibAK0eR1zelUPbLOXH2ZZQ5YOXK34opJt3zEEz
	XevQB4jbu3pN0PeO2sv+4aiQvKI4TpDjKFBKNmSeI03f65/ilb73GkFuOT8A5unE3yjtZ1HYrPs
	6X51nqM2ycaTZN85VKR7dexSWROXN/1pJ1VGIsy5DoEJLtGMDvqO0zwu4ws6mUajx5MKho/L4+c
	w==
X-Received: by 2002:a05:6830:6e1f:b0:7e7:9493:dc3e with SMTP id 46e09a7af769-7e794a32092mr1230912a34.3.1781368932957;
        Sat, 13 Jun 2026 09:42:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:cb9a:87cc:1314:fef5? ([2600:8803:e7e4:500:cb9a:87cc:1314:fef5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e78125d3e3sm4346652a34.0.2026.06.13.09.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 09:42:12 -0700 (PDT)
Message-ID: <8ddb4c1e-d105-49be-a6e0-30c220af98c3@baylibre.com>
Date: Sat, 13 Jun 2026 11:42:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
To: Roman Vivchar <rva333@protonmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
 <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
 <2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com>
 <RRvh9UBBrqdfKoCLaqgfcQ06UY-BSM2hQ0F6F1YkdB2k2RXYMQmlCG4phXk72oGY03t1g1kDI4z-SDeKlYkUv84-AjNLaWK7tDQlpEFQVKk=@protonmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <RRvh9UBBrqdfKoCLaqgfcQ06UY-BSM2hQ0F6F1YkdB2k2RXYMQmlCG4phXk72oGY03t1g1kDI4z-SDeKlYkUv84-AjNLaWK7tDQlpEFQVKk=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_094214_988536_304BC146 
X-CRM114-Status: GOOD (  18.51  )
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

On 6/3/26 6:24 AM, Roman Vivchar wrote:
> Hi Nuno,
> 
> On Tuesday, June 2nd, 2026 at 7:42 PM, Nuno Sá <noname.nuno@gmail.com> wrote:
> 
>> On Tue, 2026-06-02 at 15:46 +0300, Roman Vivchar via B4 Relay wrote:
> 
> ...
> 
>>>
>>> +MEDIATEK MT6323 PMIC AUXADC DRIVER
>>> +M:	Roman Vivchar <rva333@protonmail.com>
>>> +L:	linux-iio@vger.kernel.org
>>> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>>> +S:	Maintained
>>> +F:	drivers/iio/adc/mt6323-auxadc.c
>>> +F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
>>
>> The above file was not added in this patch
> 
> The header file is added in patch 1 (dt-bindings). Following Krzysztof's
> feedback on the previous version, I squashed the MAINTAINERS into this patch.
> Please let me know if I misunderstood anything.

Usually, we want the MAINTAINERS entry in the same patch that
the file was added. It is fine to include MAINTAINERS changes
in the dt-bindings patch.

>>> +	case IIO_CHAN_INFO_RAW:
>>> +		scoped_guard(mutex, &auxadc->lock) {

We can avoid extra indent by making this:

	case IIO_CHAN_INFO_RAW: {
		guard(mutex)(&auxadc->lock);

		...
		
		return IIO_VAL_INT;
	}

>>> +			ret = mt6323_auxadc_prepare_channel(auxadc);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			ret = mt6323_auxadc_request(auxadc, chan->channel);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			/* Hardware limitation: the AUXADC needs a delay to become
>>> ready. */
>>> +			fsleep(300);
>>> +
>>> +			ret = mt6323_auxadc_read(auxadc, chan, val);
>>> +			if (ret)
>>> +				return ret;
>>
>> Could be return mt6323_auxadc_read(...)
> 
> The mt6323_auxadc_read returns 0, while IIO expects IIO_VAL_INT (defined as 1).
> Should the mt6323_auxadc_read function return 1 for success?

mt6323_auxadc_read() would need to return IIO_VAL_INT.


