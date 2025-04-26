Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A298C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYVVUGhcXIwOLu06TILyWFwu4mq3jXrLLzPklRAXR6Q=; b=uIfi7Du5P5ROXlVxYr+kQVFA3G
	SKtDcPe3TTsoROCohIFrLntv3vIpl07Z3g6cwwLPx+e8j5luykH+knkSvqVDQWrykPNkRSqpvvy2T
	sYXcwGo4XnHEhSm2+y/Kz35hBybsI08CgF4Wvyus2k2XsQRBarxQsSHuwEZIiBkphqC7+aAQTvSrK
	7I0h1ggcoaJJTJs0iAFgUONAUa6aKCNNUVfJGVGvWRPK2svM0IrNQSGkzgVDPkOBzoF/Cud2JzuOT
	+YLSatedJnCT25QU4rdqCRzajagh/gc60l8K2k8dwcD5z6aCqpeFG3vDtifS7XigrUAlGa+80ntYH
	1ImtM0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8o84-00000002aIK-2zij;
	Sat, 26 Apr 2025 22:36:12 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8o6B-00000002a9A-1x4M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 22:34:17 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3fea67e64caso2984749b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745706853; x=1746311653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYVVUGhcXIwOLu06TILyWFwu4mq3jXrLLzPklRAXR6Q=;
        b=a29dE27JvenLbWxByIX4xvOhMhpSRuOChcwYJB9jlVxjRVYa1R7D7WKShlnj/1mLYY
         kDYQjtV6vUI/GL+R65Njrde5vb3WbUmpXP0zwiDiwGoIL8f56jhn4SchVTO9BPAJsKRr
         DcqiH++UI6FmiOvqm8h9MQpw406FCKHGhjeul6YSheT3OziFg7hfNElfgrXcFHD+mdfC
         wHf84Qn7B1PMRlR+vJwuDR8274lnSfx/LzmSwk7MNZ7ZB9nAsu1AI6NA6gP5qKez2M/i
         DCgt7xAV8xBiG6gmNC47ppIgr8/xjkJJhmoZbqCqnVlgoKYTpY9Ee7zO7zWajGR+1x2z
         LCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745706853; x=1746311653;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYVVUGhcXIwOLu06TILyWFwu4mq3jXrLLzPklRAXR6Q=;
        b=vtLI0Gf1uGYMtNV0obIjsneAUcfS+7ujz7FDUAZ/LQullhOivyW0p5gKaf8lxL4l5N
         TiVn6lYgm1sNPoxWnU7x9VT8moAdQuvD/AqFTWmf1vwPSsvHXCGo2Ap9EDT6Ujxa2Xjm
         opVI3qXiaoZZ2QJ4U0bWixomk/mAJu6AAldKX5YtDQyfeH1XUndQRgA7Cydp4amPQekM
         AOg5Qk8SMZoT9pdY7S54rhUvmzxP4oBg7i7pLO3XxEhzoXuSSUBi80LyrVJF/3rpWIj2
         rT5eTl8zlN6IaeXhKlnqrcRSzU0r0lg4Dx/QJeyl/AkzrInGvJZstwXOZRlQpFcnwaDC
         6t3g==
X-Forwarded-Encrypted: i=1; AJvYcCV3F5VtZrPPCP3ZT61CZPzVz9GaSLhyeGakHhoMf0IESLr+czLKn5OkX2ANrvKIf+Uork0BDJPsjzd2wzfE02oq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7AV9mDNt53eQdn+iXROgiA9nMsDvPACXIYmTnhA86gDnUsvI0
	dxFxzqsS/7EBtCU1pZn0DTJOx+tJxNXgxrCs3d1U4mj6YS+5PRiWlPbmdYK+zYM=
X-Gm-Gg: ASbGncuX6XgYYyz0BAd7Y7N2VkHtYTMj6Mk8ZfGhY5frThmSc/HkOqMjs2aREa0bnte
	UIVx3a8w+D0LXq1qGND5Rbcnldb7Qyq5bOdweC7lquFJEIrDZzkDUB5mqGkwqxHMA53n1vYLykX
	r44HfgF/zRtmYVN8bS+IFudZWh/Rdb9i6dbUulkNnS497UVEQ6vnATYkDBBwxYYzTCBxyUnrrDb
	EGAWG9B3yMDacQJgLlpxlHUCmejmZavY+P83YpUSP8a0qp8dWJ076YbYzhQnlQTROZfGSuMWNEd
	e9a+yYvof5AudjXEC1D77WvtgnTgS3i315l+oLxw/yd5zG0pm1r34Ry1fwi9eilTpsdUSFVLmCB
	RwWJlQfFZfL7sXVLPMw==
X-Google-Smtp-Source: AGHT+IEWcdgjh8/VjhINgT8GfioFVGPqEFDg87O6EIU4BE5z/R9+CNVDT1w95ttosllom+MZY3JBMQ==
X-Received: by 2002:a05:6808:338a:b0:3f9:3de3:c8de with SMTP id 5614622812f47-401f289161fmr3985703b6e.12.1745706853626;
        Sat, 26 Apr 2025 15:34:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:96ff:7f79:37f3:5c67? ([2600:8803:e7e4:1d00:96ff:7f79:37f3:5c67])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec977dafsm1329187b6e.41.2025.04.26.15.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 15:34:13 -0700 (PDT)
Message-ID: <8a57a332-c2a6-4825-a5f7-d765ea15bd6f@baylibre.com>
Date: Sat, 26 Apr 2025 17:34:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
 <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-1-f12df1bff248@baylibre.com>
 <20250426123509.0b04f0f9@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250426123509.0b04f0f9@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_153415_782280_4A516587 
X-CRM114-Status: GOOD (  18.29  )
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

On 4/26/25 6:35 AM, Jonathan Cameron wrote:
> On Fri, 25 Apr 2025 16:08:43 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 

...

>> @@ -777,6 +779,42 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
>>   * them safe for use with non-coherent DMA.
>>   */
>>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
>> +
>> +#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	static_assert(count); \
> 
> Why do we care if count is 0?  Or is intent to check if is constant?
> If the thought is we don't care either way about 0 (as rather nonsensical)
> and this will fail to compile if not constant, then perhaps a comment would
> avoid future confusion?

I would be inclined to just leave out the check. But yes, it is just checking
that count is constant and we don't expect 0.

> 
>> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
>> +
>> +/**
>> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
>> + * addition to allocating enough space for @count elements of @type, it also
>> + * allocates space for a s64 timestamp at the end of the buffer and ensures
>> + * proper alignment of the timestamp.
>> + */
>> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
>> +
>> +/**
>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
>> + * to ensure that the buffer doesn't share cachelines with anything that comes
>> + * before it in a struct. This should not be used for stack-allocated buffers
>> + * as stack memory cannot generally be used for DMA.
>> + */
>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
>> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
>> +
>> +static_assert(IIO_DMA_MINALIGN % sizeof(s64) == 0,
> That message isn't super helpful if seen in a compile log as we aren't reading the code here
> "IIO_DECLARE_DMA_BUFFER_WITH_TS() assumes that ...
> 
>> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
>> +

Seems we actually have an arch (openrisc) that triggers this [1]. This arch
doesn't define ARCH_DMA_MINALIGN so it falls back to:

#define ARCH_DMA_MINALIGN __alignof__(unsigned long long)

Apparently this is only of those 32-bit arches that only does 4 byte alignment.
From the official docs [2]:

	Current OR32 implementations (OR1200) do not implement 8 byte alignment,
	but do require 4 byte alignment. Therefore the Application Binary
	Interface (chapter 16) uses 4 byte alignment for 8 byte types. Future
	extensions such as ORVDX64 may require natural alignment.

[1]: https://lore.kernel.org/linux-iio/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com/T/#m91e0332673438793ff76949037ff40a34765ca30
[2]: https://openrisc.io/or1k.html


It looks like this could work (it compiles for me):

	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))

If that is OK we could leave out the static_assert(), unless we think there
could be an arch with IIO_DMA_MINALIGN not a power of 2?!


