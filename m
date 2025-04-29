Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95483C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNMUgH5uNY4IqYIYRqaJEMyg/HY2VEe42NNCO90DOAc=; b=Q0VtIpfhptYDX+GKMV+iavaetF
	w+1szswh0R27zGVidy4T0VYMPcLvcfGHrchGbTQNEg3IEPIClRc85oIR8kpsIgf2bF3tIRTyGBixD
	SceJVhe8ajI/5t5r3o59cZShOEDM1mw6UVIN7zAstdU5cuEDR6ymkFxxq9Tw5uF6325t+tApPnnUA
	+nClZe7QCclTh9jw6kWcxhhZ7OGjDXzgBTpkBKAZJq4+RCMhGcfnSEKlHSDeZke9x7gEnW/uxKnSl
	Tbh0mjBWXOpWzJ/03BOjim30hP+SQ4Y+IjjWEGtxxOuQ2SWhBT36FDp9gTzbjPhepkJKxkN2EjxE6
	mKrDyzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qxx-0000000AgU9-0OxE;
	Tue, 29 Apr 2025 19:50:05 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qvg-0000000Ag5g-29nb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 19:47:46 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-72ecc0eeb8bso1460666a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745956063; x=1746560863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNMUgH5uNY4IqYIYRqaJEMyg/HY2VEe42NNCO90DOAc=;
        b=Pm86WOPAH7sp+zWoGyDS4MuKd5DuzaJVyBtgAmSUQTefhRwOnGNFCycwiz+/+h2Li8
         djFb0joDqM1cs3pYjlsI0YUen1ocsZ45osIk29BOKoLuXfjv4h5XSq4gmpQvzi8d+Pr7
         oHTgDhP7VzUg6yfEapjw4L6DzOkzNHnisoEJL//XMgNCoIFF0+jljLmDIzoO7cj5ez7+
         5ce7My0xIZoPY4bwYzkjFzVxDE4GAGSxMkSoL4QzNMl4N8kE9axGLeS5WdyXSd4mQqRR
         mZDIncfxzM1QGzr+7RYPBzB+YPXoNHJIYqvQx43xCrGQuqzQcnAvwrPDnRley20Ubx8L
         u+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956063; x=1746560863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNMUgH5uNY4IqYIYRqaJEMyg/HY2VEe42NNCO90DOAc=;
        b=O84DnDQEkP1xDtzPNlYb8g27PuVXpxgt0zOZxRAsHwt+Rcwz6GEfLIpSfwSrd+DtR3
         njEiPxw4tnGoaDbFl8O17izpGacUiO3MStOigy2p2VEUaSGkEjWTSaMGJuay+2zGs8P7
         YpGCOuCyELaJ7QLHnL2yf6UPID7hRargTK/3p7SEWDYiJaNwRv70xu4R2Dj11IDjsw3m
         k8P+5oSrLpkjU2F7GAAOhvexCj+FpyftvkPaoMe3WDJGeF//5FT8XyDilJ0AFdhJLaoP
         7iPTQgwVY2gr6jhhgQragB90FFG/FbT8fvk4Osd7GjnThowwIfav0pG0UVdPbYzz93U9
         KRGw==
X-Forwarded-Encrypted: i=1; AJvYcCUnshFLPLSG31Do5Nq8UiKm8PLl/FRM7xGtVuGdQXWLzjBD602RIB16eesTvbCcj334WfqsfdPAH6iPjbbEZJco@lists.infradead.org
X-Gm-Message-State: AOJu0YzRUy1oRrA0wG0ZAbY+NbJzXCCvwNCudVdawX4Xl+KgbgnGsiSn
	zv3/9BuwQeQ8eRkcUGHhtp9wkUTrqAux4YaD+504z2UpRqgt/XV+BhXQHid14i4k61kDf66ad07
	P
X-Gm-Gg: ASbGncv0bDfE01y7qwWDfKCMnazFqvsRZ7rXdUJeUf4rCuyh01vBmC6Us9QjpmBzW+8
	uFaksnSJnIkzKNddYnfJgiuW+xSo3VeSSTl2Pbf8rz23mMIODj3/fKjJM10M8iUJ3MavCQlpIz1
	68KMhZBJzQEB0Edju2JO8McXyRGgIpWhmUTZwY5ibznIlx4TUKSKJw+dKUsjFpfTgllCgjcbyX3
	nCySIAWkLH5u/SDiaE/0zPcJM02vEd0j9brteEmQYS+SjiohEthqXjCcZUn3RbzxxdRTtHc8+aN
	fAGlFzbdEobYiLhdIq6+ipHt9XGGGlpqo6APlxjHH40TKPXf6sEajS4gHht28R8UhaJ+Rp+dSR0
	cwGNt/OEw+hEcUqvRgDs2Yf2srSpP
X-Google-Smtp-Source: AGHT+IF2u4BGVcklS8e42c3uNUIrh7aRuex4nRoeOZeNBykrvHleyFegxvqc61saZCq3sjivYkKrMA==
X-Received: by 2002:a05:6871:358f:b0:2d0:3078:e72f with SMTP id 586e51a60fabf-2da6a2b0b6fmr225244fac.26.1745956063148;
        Tue, 29 Apr 2025 12:47:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d973c18da5sm2955704fac.47.2025.04.29.12.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:47:42 -0700 (PDT)
Message-ID: <38e243b0-e81b-4d4d-97fe-91ea2bec6270@baylibre.com>
Date: Tue, 29 Apr 2025 14:47:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
 <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
 <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
 <CAHp75VfcmvLhBDjbu6x46wGyzG+i7=rVypzSm11qzWN9Qq_rew@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VfcmvLhBDjbu6x46wGyzG+i7=rVypzSm11qzWN9Qq_rew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_124744_552050_A25748DE 
X-CRM114-Status: GOOD (  21.81  )
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

On 4/29/25 2:36 PM, Andy Shevchenko wrote:
> On Tue, Apr 29, 2025 at 10:31 PM David Lechner <dlechner@baylibre.com> wrote:
>> On 4/28/25 9:12 PM, David Lechner wrote:
>>> On 4/28/25 3:23 PM, David Lechner wrote:
>>>> Add new macros to help with the common case of declaring a buffer that
>>>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>>>> to do correctly because of the alignment requirements of the timestamp.
>>>> This will make it easier for both authors and reviewers.
>>>>
>>>> To avoid double __align() attributes in cases where we also need DMA
>>>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
> 
> ...
> 
>>>> +/**
>>>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
>>>> + * @type: element type of the buffer
>>>> + * @name: identifier name of the buffer
>>>> + * @count: number of elements in the buffer
>>>> + *
>>>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
>>>> + * to ensure that the buffer doesn't share cachelines with anything that comes
>>>> + * before it in a struct. This should not be used for stack-allocated buffers
>>>> + * as stack memory cannot generally be used for DMA.
>>>> + */
>>>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)   \
>>>> +    __IIO_DECLARE_BUFFER_WITH_TS(type, name, count)         \
>>>> +    /* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */  \
>>>> +    __aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
>>>
>>> I just realized my logic behind this is faulty. It assumes sizeof(s64) ==
>>> __alignof__(s64), but that isn't always true and that is what caused the builds
>>> to hit the static_assert() on v3.
>>>
>>> We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
>>>
>>> And have this (with better error message):
>>>
>>> static assert(IIO_DMA_MINALIGN % __alignof__(s64) == 0);
>>
>> I was working late yesterday and should have saved that reply until morning
>> to think about it more!
>>
>> We do want to align to to sizeof(s64) instead of __alignof__(s64) to avoid
>> issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
>> aligned_s64 exists and always uses 8-byte alignment).
>>
>> So I think this patch is correct as-is after all.
> 
> I'm wondering, shouldn't it be better just to make sure that
> IIO_DMA_MINALIGN is always bigger or equal to sizeof(s64)?
> 

Sounds reasonable to me. From what I have seen while working on this is that
there are quite a few drivers using IIO_DMA_MINALIGN expecting it to be
sufficient for timestamp alignment, which as it seems is not always the case.

I'll wait for Jonathan to weigh in though before spinning up a new patch.

