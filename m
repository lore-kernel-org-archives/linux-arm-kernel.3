Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C758FC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 21:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4rrgleRHs8E8J9lRvZx/vc/Mrq/nsr1SKG+kIWRs0Y=; b=DE4iiQoZ5zhu5IstQpjUWjYTGg
	jypxlsmQiDpIwIqyWLi4cmit+WqdP6NOn14gz5BadFb8+bWSyfXiGaxJelUSqNG8m3WgVg8dddknl
	3jnvHGhMq2QYc8oo5R6sylj8UJNWk9tD9dSUrb7cTgNp7mTaVVrK0CY+P3sOYeLa2xUy7m+EjFymv
	3i8N6BJDrlhh2HznAtFkiJr+TtrQqHeYLrLREsjbOXJKt9yUTHRsNxHCchEJhedrZTkuXOLY9wWh6
	jnDMV/ffg+sSltEQUnPthlM+JmKfVhn9EfPy06NiAyTsYFtnnpsvFgyfBkBDAXMgi3bc/jeUIKFS2
	0qBmx5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD94S-00000001rhn-25Of;
	Thu, 08 May 2025 21:46:24 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD92S-00000001rLL-3nFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 21:44:22 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-72c16e658f4so845521a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746740659; x=1747345459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4rrgleRHs8E8J9lRvZx/vc/Mrq/nsr1SKG+kIWRs0Y=;
        b=e1WwlCQxZbsyBCp9rwOlvAzHPMuBCOiYh8wqQJXYSmMa/WU/yslLUcMIPvYzMAqy+R
         HSxGBCNo+QZxPmROX6IIbs2UUcpm8yshO0+oCgzxF+h5VmTU9PW8D8TNVIhmXMDQKaFY
         R74z8TW2aT1jnPJp+Yw1bcRI6WTABRnqRvvsPhNXUwpxHbfhLfH1Q7GCK9CJiUqG+Fzh
         9i9WaQK5Te+ZM0v0vzFsrpFxCGmjA9yq9YjxX2n9Oi9lS5DKTlCU5WjqHH9brDTlbX/k
         eEEGkImOWWulZL8ZIbmGlP9G8HzN/ErupS+hQzQQm07iMWx5dcUkbRpMlpNO2dg07nA1
         5qIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746740659; x=1747345459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4rrgleRHs8E8J9lRvZx/vc/Mrq/nsr1SKG+kIWRs0Y=;
        b=R5lA31AsbZxmvQSVSUgl8yhNPjuD2SNFmEMBCAnBOzHg4ZLUEuOx8tg6qcDNRvQ0+y
         F8d4Mt4ovNJNHMd6mH+/mkyix/PoZzRwe75dPPpQ7oz4VmhY8xjARom7DrlnWFuf67RS
         9MjZbJG+ujfs7OoRO5Oi76B+7aLSfkk/2LxZZW7L1GqjdRP4fcIGJU7ps/IC+VgpHhY5
         z9fS5IusxGZ8zuGRMHzf4wKzIdgu2BTv4SCFN/WgsI9EF7gjOt8NkB9Xb/lXfvjJCpGi
         w0zjWQ+QuH31IF4JXp6IBle/ymNOQQRgyqp6PrKYNQUdNDd7nIDsVbR1WYwluFxEL1uU
         rdrA==
X-Forwarded-Encrypted: i=1; AJvYcCX/GgXYbU2HjpraqgIrbbXit72lU7gkCXsybAgfdofVwYIM3LoBpBCzkDdHrIOwgNZf3CRjcGhFD9kM1BPXNkf2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvq/UdX323ZQTJS/QcbzaC9GOvAA3ZmcSCqUEeYAM3CiyZ933v
	xyQXmzWGrVyhb74NxptOEYHWRiD8+p7k5gxCdgfEQ4bRNPl8vGl1jJyPMoE40BY=
X-Gm-Gg: ASbGnctp15B46NMFAoT6Op++oI1Km3+6YdFx1BPg2aPUfg1WGtlud1EpKCgK3dnnkEQ
	FjETyMMxGXOgyxLxSq9ZqiboL8UNSm6WdhPx8Opltv9TYXIRJCLk6Y8GsZGvCB+3ydkjhMBeFbw
	LZWDJTjH5wLNZS2nSRZoG3jlsqgy/SjdaQPDobqwAqPqTzNI1wYXxmqn3X7ATlaFE32asyv/Acp
	DYQrhi4GEQ0h6pR9ioByFbJ+vqRXzc7RyQgMjd91kdlVFkmnn4on99OPL+srCPWvuIniERsbsya
	oSd3enC5dpMjydPq+9ydq+hYbEA0L/R4Ac0GBdKZ8YYWHW8bxBgpT1sum6Pb7hqPz0TnCRujFlh
	oWMXK0MFgmSQg+mRBHg==
X-Google-Smtp-Source: AGHT+IEWxrdM7guJzCtW5zB5Io/5M/nAEqa1rWAlUXg+L9OfIUY/bZAREYTnD85qHAKnzpkD1d9V+g==
X-Received: by 2002:a05:6830:380c:b0:72a:45bf:18d6 with SMTP id 46e09a7af769-73226ab0459mr938322a34.18.1746740659405;
        Thu, 08 May 2025 14:44:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264b479asm273544a34.27.2025.05.08.14.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 14:44:19 -0700 (PDT)
Message-ID: <43fd5216-9577-4773-86c3-e3035f3934b7@baylibre.com>
Date: Thu, 8 May 2025 16:44:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] iio: make IIO_DMA_MINALIGN minimum of 8 bytes
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
 <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-1-814b72b1cae3@baylibre.com>
 <20250508223959.70e909d2@pumpkin>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250508223959.70e909d2@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_144421_212819_BCD8EAAE 
X-CRM114-Status: GOOD (  19.21  )
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

On 5/8/25 4:39 PM, David Laight wrote:
> On Mon, 05 May 2025 11:31:42 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> Add a condition to ensure that IIO_DMA_MINALIGN is at least 8 bytes.
>> On some 32-bit architectures, IIO_DMA_MINALIGN is 4. In many cases,
>> drivers are using this alignment for buffers that include a 64-bit
>> timestamp that is used with iio_push_to_buffers_with_ts(), which expects
>> the timestamp to be aligned to 8 bytes. To handle this, we can just make
>> IIO_DMA_MINALIGN at least 8 bytes.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  include/linux/iio/iio.h | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..7e1e3739328d103262071bd34ba5f6631163c122 100644
>> --- a/include/linux/iio/iio.h
>> +++ b/include/linux/iio/iio.h
>> @@ -775,8 +775,18 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
>>   * to in turn include IIO_DMA_MINALIGN'd elements such as buffers which
>>   * must not share  cachelines with the rest of the structure, thus making
>>   * them safe for use with non-coherent DMA.
>> + *
>> + * A number of drivers also use this on buffers that include a 64-bit timestamp
>> + * that is used with iio_push_to_buffer_with_ts(). Therefore, in the case where
>> + * DMA alignment is not sufficient for proper timestamp alignment, we align to
>> + * 8 bytes instead.
>>   */
>> +#if ARCH_DMA_MINALIGN < sizeof(s64)
>> +#define IIO_DMA_MINALIGN sizeof(s64)
>> +#else
>>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
>> +#endif
> 
> Did you actually test this?
> You can't use sizeof() in a pre-processor conditional.

Pretty sure I did, but maybe I was asleep at the wheel. Anyway, this got caught
by a build bot and I realized the mistake.

> 
> 	David
> 
>> +
>>  struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
>>  
>>  /* The information at the returned address is guaranteed to be cacheline aligned */
>>
> 


