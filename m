Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F356C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 02:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6S4GKpAtROTwbGLe6u4eJsWSI5xTeTy32z267OBAd5w=; b=paxJaSJQYp+oH6TFKjL10l8Jgs
	2EU8lA6LzGaoJ3wYLi0g75IJbZDp8t6NSlhItPD4tu/ruAfMN8MHLTJ0nMJ2LJsafOiTsLGIcPgnl
	EQmlNgrOtWGBhch40jwS4Z1J67JHVEBBCtDkN6rrx0oHoj7Eo6VdI3rpWwTqLn1f4HMT23v73MxMG
	ZgP8AT3PCAQOUHH36OG2420KHC7kNzvk+6tO694dq+XlemVk5Ba7OvLeIeWDJd5jV83zNt9sfzEb3
	cPGLVbl9wHWoeaaW+W0gR+ixmxAF/NYhuyhqd6P03bhehpV2x7QhxTxjLejTXUXyNnGUiLtoafLVF
	UnSPy3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aUs-000000084Io-2muj;
	Tue, 29 Apr 2025 02:14:58 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aSq-000000083mD-0D0H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 02:12:53 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2d9b61e02d1so758759fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 19:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745892770; x=1746497570; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6S4GKpAtROTwbGLe6u4eJsWSI5xTeTy32z267OBAd5w=;
        b=Pev7RWyeqB8o2PCNoGGU3XX1OR3wfxzMe6JlTT6Bu7r4lKG5eYc0ZN31LEF/K6mqoj
         Wei1sSAOUnYoPnl1FOJmgcoTqDbGUVBX5PoOQKaOpO7fVjcJROCXbhm4tHoG3bDgXZSL
         H2xUSEl+jZXwDGpECfsm7qMAAl3j3zo3S9XSIGvLWfrC+X0+4Xbm3hRftkrO+LWNbxls
         dysfHbG6sH6tZaSfbd74k8FLN5aCDxSQw9FPY3AVF2Qvn+fIwVSjo2OS4U5UvFdhhkKJ
         ZRoyA6IAu5sYOwdOv4HP88+zKbj6Ks15uqkZ1tFkPVRczYSgcd0JsQUgXMN2Bn/QdOWA
         HDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745892770; x=1746497570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S4GKpAtROTwbGLe6u4eJsWSI5xTeTy32z267OBAd5w=;
        b=QpLyKK3Sk8lnPiVdCP9rAS7dEySQIIDVLuazeYTWvkQpUBT2zDBava5R3bmM2Ojl2F
         WBRS0AbI3IBj+aJOayXmG483QL/iRAr+5NcFG4WytLCqgWybL0Dz5SsiN/Rs6bXFKtJ9
         3xcZOFhljG3kKlklvKqBawgegyhU/YAjOiXhnUoVERFea0ElBhkh19HJ4W5qwz6qfxx6
         xHLHqNxv0LgyUKrlYOJvV7EyiQ0ad1HE6WpdmhG6sp5VWxLXZE111DxMYEU21CKuSCeH
         g6xPVQreMJWqBoQXUkV+EyZyhetSl/1hWvyQKSW1yEnwl+DxhKZbYBOallOzUuleXFla
         o8qA==
X-Forwarded-Encrypted: i=1; AJvYcCVElqGg20p6PSEFKv41VMytdWT4XK0YHWA5nEIsN3vmLqUrZ00kpZMU4tpJWfzcaiWdQpQQeEHxVHHVmw80t5j6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp+dmGHuCJJxfpsZptgpkhj8zkibZbyeyZtpgQKQiksdJ0qB5o
	NSH55iw54LQSvpCYZx7dv5rNANG2xnYWCNyDvaKXoq/d/pqZUjb9TBExK2m9iaE=
X-Gm-Gg: ASbGncsW7hR9Vv4k5eKaDONyZsXOCPtkBQEIm8nZPp+GKsq+Jr0AdB368qaJDp7dwHT
	EuffRzUztJO9FdgYiNu1jdAZft0OSMj0IZDGiMM/K/rJD+SVfeoY7tk5lbQaSG+Wt4m57FtLIRh
	Af/IOaqvuA3SrNHtUl2dd+W+kV2DP2Tax0Xo/tAYEHciUFwpJy6FobNLfeAA4psU9S0JUaWhjxW
	F5vZnv7WdHFBx5Yhs6dtey6loHiVEflraqD6jni3T5w/hKGzhjq4i0XprnnaWbpZsmU99eAOfnj
	tS+cRh+qIABcSqmMgSuG1KiUipiyaigZP+OzJ1zBlx4h+rZbsuzddfOsqdXCHRqhIhovkb4OHIa
	6UnqKlmzVOVsqCQgDLw==
X-Google-Smtp-Source: AGHT+IE6FyjOxAKnVS0+MaJeSBNlFo7Z99elkvia9LCPi2NOJelDK6TnHtRbBBkq8ITYn9LPKBUkkg==
X-Received: by 2002:a05:6870:718e:b0:29e:43ce:a172 with SMTP id 586e51a60fabf-2d9be84dc03mr6759663fac.28.1745892770447;
        Mon, 28 Apr 2025 19:12:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9? ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d973c196e8sm2551773fac.46.2025.04.28.19.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 19:12:49 -0700 (PDT)
Message-ID: <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
Date: Mon, 28 Apr 2025 21:12:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_191252_097331_60E7BD9B 
X-CRM114-Status: GOOD (  17.77  )
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

On 4/28/25 3:23 PM, David Lechner wrote:
> Add new macros to help with the common case of declaring a buffer that
> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> to do correctly because of the alignment requirements of the timestamp.
> This will make it easier for both authors and reviewers.
> 
> To avoid double __align() attributes in cases where we also need DMA
> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

...

> +/**
> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
> + * @type: element type of the buffer
> + * @name: identifier name of the buffer
> + * @count: number of elements in the buffer
> + *
> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
> + * to ensure that the buffer doesn't share cachelines with anything that comes
> + * before it in a struct. This should not be used for stack-allocated buffers
> + * as stack memory cannot generally be used for DMA.
> + */
> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
> +	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
> +	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))

I just realized my logic behind this is faulty. It assumes sizeof(s64) ==
__alignof__(s64), but that isn't always true and that is what caused the builds
to hit the static_assert() on v3.

We should be able to leave this as __aligned(IIO_DMA_MINALIGN)

And have this (with better error message):

static assert(IIO_DMA_MINALIGN % __alignof__(s64) == 0);

