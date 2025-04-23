Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D08C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvwv047VfCd6UZH9Jh21KmwpSxODx1nElqK+UFecJ5w=; b=m+ipAVPe0WfuOrkTWmbp3LDjPT
	nMWDqeC/vddIarq1uaV2or/k6Dyyw7KUFjAmkJJASFFRufK5bBHeeD27+Ug1znEruNbsRGG8/twAd
	fVyzebQambGa5xDsy7AY34lA+WzF8yqol1cUHQOYFcvSPVW/54646eaEIUN1R6UPPsdQmN3zDaYIV
	rD4O+F43D5K00wT2GZQmVNf+ZxxjH3Hye58yHmJn09t+5XtBLsr+Bb6IQ/oAFiGTBZCAtsrbAMEVh
	dxW78VLuCrMAtZJCDxb4MpyX1NZXKUfeqXSsea1F+N7dkJHlyR842jJEanQ8fAhrmVBX59YOaWOVF
	Xxry+H7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5n-0000000BJ1W-3x2M;
	Wed, 23 Apr 2025 17:41:04 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bRg-0000000AsRw-2QYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:51:30 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3fea67e64caso4182328b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745419887; x=1746024687; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvwv047VfCd6UZH9Jh21KmwpSxODx1nElqK+UFecJ5w=;
        b=JoB/H3z+d9ZeSOF8nsRRSuFMa656Hsu/6eCW75n6YUzAVa5SrXuqapOI0pEsnOWudv
         c/Thyz96llOkxb74VcEWX46k6PtkVSXTbeNrB8rkrEQtBf6oAeR6c6PxTHhtMXFKGziq
         JMg0h9kyCA+OokSV8U/lTuGLmZJL9T4S8KPjxWcdZszKKJPZeND6H5GtbBfCUL088QOe
         a4zHqVduCw0gq0epWoZKu+smqsfeAN3uiC4bACmjzhYoLwaruyNZO/ZprRIaiYb9O18q
         451trmUUoFqdC7ha6djHpB6fS5bGQ9wCQAANe0UZOz9UM6ozOfmUP4AIxbwaA3cX4mFv
         LCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419887; x=1746024687;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvwv047VfCd6UZH9Jh21KmwpSxODx1nElqK+UFecJ5w=;
        b=IJa9CarW8Z8ihdZvQ1dBR2HAY8aJ4FeoJlcAF+0ijAAyPmmg3KijMvGk9OqYSbufvf
         px8KSkhmGpaulmW6QVLLRTIZsBB+GbiYG5HjdB4PhLlol3WDPWTsgjH4YxwDA5wwBBL4
         PcfMJ0JZnF7I+PQMERPLoyf5TKMjUgXIjm1d/Maywlvg22v9oS8IR4sAL4u6qNHA9x9S
         GDbAMzoFwLGhPl8HkoaLHDQfbsGplHqDOL01VoZO32LJ7tRaKY5YHy4lXNOeVi8rWLag
         WNVV/knspfkkTqNL0CRlfVFUAXfNmahKkNcJ5n5M+mw8p4wqtjAYRCrwOGDqytTBsVzw
         HOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQE7OlhScrf5nGjCnEW48NG5AAVoe+WvmnR718rdHhT9IR8MZ8xuCwGN0qUyhLGc2V63jQQTnQK9Gto3bSU5OH@lists.infradead.org
X-Gm-Message-State: AOJu0YwPBnDRfwpMiL0NlP5z13r2qrkQUDVoPUSJgdZDMHwWEsmjLNiI
	lxqOLrLZaEUFGH8BQ10eYs20XrdbbpmR3LVtwGif+Vw6zPZ17YCwbFWjVGyjeKY=
X-Gm-Gg: ASbGncslFmXRxkDaPLrKA1EAx7f/LRg7f0JnaVtXJLDv3qRRflnrk+L/EagWNKgg8AN
	8vqR+IcEo1W8TCVI15ggl425NfYT53kYdCNXCTBQ04p3JsxXc0qxlz9qJL9pXlL3BGWHinNpYfz
	hVeZK1QXbMSBi+0aQHgVlqcNP8j2CJrakr57Bn7Pkn4W2vi7Tm0KpA21KMAXFYTN3EydicCCyl/
	1bu/Ez9cowWJHBvauO7UtPejToQ37abwb2dZQd9aqEZhTDBrgPYA5U8YHSfyaEUIrs+/GIkmW5P
	x3mejj9aFJROXC5KCv+Cu0FSQTQ8FF7re+ixj1gKY/vVvLPl+L4+kHnm4UEoB1IlMwrxSXbyt6v
	0j+hnpu3TBCXemEI=
X-Google-Smtp-Source: AGHT+IEBGwoz+Ahwpfgm/4AVjbIfHM/ADajlJxdstdyq4SXFSdYnpTORxWm+CfhjvRe0zr/nrusBmw==
X-Received: by 2002:a05:6808:2f17:b0:3f8:c486:9b27 with SMTP id 5614622812f47-401c0a8cc72mr14379361b6e.22.1745419887508;
        Wed, 23 Apr 2025 07:51:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:581:f155:b9de:68de? ([2600:8803:e7e4:1d00:581:f155:b9de:68de])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beed73e9sm2630018b6e.12.2025.04.23.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:51:27 -0700 (PDT)
Message-ID: <b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
Date: Wed, 23 Apr 2025 09:51:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
 <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_075128_834020_9FB9BD98 
X-CRM114-Status: GOOD (  32.56  )
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

On 4/23/25 4:18 AM, Nuno Sá wrote:
> Hi David,
> 
> Nice patch, I really think these will be very helpful... Just one comment bellow
> 
> On Tue, 2025-04-22 at 17:07 -0500, David Lechner wrote:
>> Add new macros to help with the common case of declaring a buffer that
>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>> to do correctly because of the alignment requirements of the timestamp.
>> This will make it easier for both authors and reviewers.
>>
>> To avoid double __align() attributes in cases where we also need DMA
>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  include/linux/iio/iio.h | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index
>> 638cf2420fbd85cf2924d09d061df601d1d4bb2a..4dd811e3530e228a6fadbd80cfb2f5068c3d
>> 6a9a 100644
>> --- a/include/linux/iio/iio.h
>> +++ b/include/linux/iio/iio.h
>> @@ -7,6 +7,7 @@
>>  #ifndef _INDUSTRIAL_IO_H_
>>  #define _INDUSTRIAL_IO_H_
>>  
>> +#include <linux/align.h>
>>  #include <linux/device.h>
>>  #include <linux/cdev.h>
>>  #include <linux/compiler_types.h>
>> @@ -777,6 +778,41 @@ static inline void *iio_device_get_drvdata(const struct
>> iio_dev *indio_dev)
>>   * them safe for use with non-coherent DMA.
>>   */
>>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
>> +
>> +#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) /
>> sizeof(type)]
>> +
>> +/**
>> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts().
>> In
>> + * addition to allocating enough space for @count elements of @type, it also
>> + * allocates space for a s64 timestamp at the end of the buffer and ensures
>> + * proper alignment of the timestamp.
>> + */
>> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
>> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
>> +
>> +/**
>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with
>> timestamp
>> + * @type: element type of the buffer
>> + * @name: identifier name of the buffer
>> + * @count: number of elements in the buffer
>> + *
>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses
>> __aligned(IIO_DMA_MINALIGN)
>> + * to ensure that the buffer doesn't share cachelines with anything that
>> comes
>> + * before it in a struct. This should not be used for stack-allocated buffers
>> + * as stack memory cannot generally be used for DMA.
>> + */
>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
>> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count)
>> __aligned(IIO_DMA_MINALIGN)
>> +
>> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
>> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp
>> alignment");
>>
> 
> I wonder about the usefulness of the above assert... AFAICT, the default

Jonathan seemed minorly concerned that a strange new architecture might have
IIO_DMA_MINALIGN is < 8 some day, so I threw it in there. But agree, it seems
highly unlikely to actually happen.

> alignment is 8 bytes and I could not find any arch defining ARCH_DMA_MINALIGN
> smaller than that (would be very odd to have a cacheline smaller than that these
> days). For bigger values, nowadays they are all power of 2 and I would be
> surprised otherwise. But the more important question to me is what if the above
> assert fails? Will we not allow IIO or some drivers to be used in that
> architecture? It can become a very "painful" situation (assuming these macros
> get widely used). So, IMHO, either we assume the above can happen and rework the
> macros to make it work for that hypotetical case or we assume the above is
> always true and drop the assert. TBH, I think it would be a fair assumption...
> 
> On top of that the assertion is wrong:
> 
> sizeof(IIO_DMA_MINALIGN) != IIO_DMA_MINALIGN :)

Doh!

> 
> On the other hand, as I mentioned in V1, I think that an assertion or
> BUILD_BUG_ON_MSG for making sure 'count' is a compile time constant expression
> would be helpful. Sure, we'll get -Wvla but some developers might still ignore
> the warning and send patches with these arrays. So, it would be neater if we
> fail to build and force them to fix their code.

BUILD_BUG_ON_MSG() won't work because it expands to a do/while loop which won't
work in static struct declarations. But I can try to see if we can come up with
something that works.


