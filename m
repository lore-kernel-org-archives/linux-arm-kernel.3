Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E584C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEA9coPSR+RXT/e6kG1IdF6r8oRJJfl6KimXKU4XDp0=; b=fSRZnfdc/gpXpMAg7sX4bG19tA
	ttYqyEGQflU8OX/6nkV1WOirug2chdG9y6jRJ100soTFIJ2Z4x3cM/hg+oGswQdPHjtxyxam+X+j2
	JWDarBEOP9wErLdzgIt6otmVRFqG2+/RvHzdjQMvwpXKWBz+Hr5GSBcNaYlHfpTrFdIRlDVosMwmp
	WT6ezWj36u+rFgXKSuQ0QvVCCzYwTw7u9wuzGSbQji9Ek8Sz0CS3ES6KC3AkCbcceAFxgOgcYOzAF
	CnULQ8qNtE7QEa5vqsioSt2Ts/d/GTbFKN8KRulbHUUr58Yxfd117vv8i7c6aO9fn+cTT0MYiqi8Q
	0RTu355g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qhV-0000000AfDY-35mu;
	Tue, 29 Apr 2025 19:33:05 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qfY-0000000Af0E-1vbh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 19:31:06 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7306482f958so2580241a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745955063; x=1746559863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEA9coPSR+RXT/e6kG1IdF6r8oRJJfl6KimXKU4XDp0=;
        b=rk8zT7PkBSb5NVgnxA0BDsx9HvP51ECemtV9qisGV5CaNHMsphR9hPGm2+Fw8G66Xn
         WmbwDMUoynshONlEw7s2htzygvhByaEeChsqOm2r9RxKly73GtGFUQZAVQV3CkjWStWK
         LCB0Kn7thbl4NV4g62BB2/Ccqsf0vYkIXI0BB3sKDeY8pQsLR25TN8SPHhW0PPuY56J+
         DmtjpHKCgLbRxlLqUGb9JJ+w55SdQAAP1IKKSb7MvuJSMbwlJVfpSdoP+Z5ZflBDp/mu
         OUeE7PpfH0uWcsWiW2JOpgQuUzeMz8aGyWpDgiQiKAmFC8itgUvVYg8YZ/YEvo87SwTG
         rtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955063; x=1746559863;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEA9coPSR+RXT/e6kG1IdF6r8oRJJfl6KimXKU4XDp0=;
        b=fyivkd2y2wtv2tP24QIVbvvW+Sh9+Y7XamPrmWp8bx+7lLPTFXlQJJIpcoCm12YykA
         zSmj/JviLZ7xTs+TzD28wk2MUqN8IyLBesHDpte4PC6kD/CgfVqU6MSSkQ31GD6si/8C
         PRnHifpiDc0CQnHJ83/CdJELEu7q0aBX3O0iLq6DC7aA9JQVqiEZwdtg9LYR2WWL1+bs
         fLDKVbhaXUUoLqJSp9spaP+2Vmjfa1aJSCfGCk27OZfbfbEAiT7KZg7yYoP03rTo3oBX
         0pSr05OPGV8r1XICQNMRaldSgOgdcmhVZNk/3IBgRQNjD2/3okDVz23xmKn5NqZTC/Oi
         R7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXqIoD5Tq9k9B0MXFg2VKalOVHuVsPQQzAdlGcniN292Z5+bC1ERObWdeenZ9zZH4xwDTwJ1lDoNUbPTFQ9l7dU@lists.infradead.org
X-Gm-Message-State: AOJu0YykibK3wp7hAtsahPtDIqOZPA0H1d07fpCGfp3mDNo2+snPLL7i
	5BXMCctb7BKisu99ZuwCXhvCwbThQ4Bll7WZz62dLcrTb1NHypnr816+gSI6Pqs=
X-Gm-Gg: ASbGnctWZLaiTCXmSug7aEnCNlZtKhMB8+6N26PvsAP/9Zpkmw7+0GdZVbd0/pVhlza
	E/BrSHSDqBkct+il8E4fC55JHeSio2/cSCLFQHWQT9W3s3hyoaFTxSi3oTetJDR0FAw7hvrbhw+
	7ipcTWSCt2AKL2DATMxV9qoF/aL6o3DNNU0C5B+/GvptOv0DyAii0Kt4FcZ8eq6QmGgahF2wGOa
	B2R2RS21DInWqs4lhy8BdWhG/p6Bu12sRJ/vvu+8tDjTSEZ925fnqsFfjeWet7DPfs0SYeL62Or
	UhvULo6quWg3m95JqMm7LnTwhXZtPwdReAozkg/ylOlgK5WYIzmgTY/Vsqh6ctk1zemgatWl6XQ
	aq+UkZF0OKXA16QOwnw==
X-Google-Smtp-Source: AGHT+IEaVlZVZe+jb2HlViK5TnZL0Nc4jro3bTaGV2+pNP/R765+0tJ8r0OzgrEjBUiZuFEMIPtr+g==
X-Received: by 2002:a05:6830:4420:b0:727:42aa:e888 with SMTP id 46e09a7af769-731c0ab2949mr234320a34.27.1745955063337;
        Tue, 29 Apr 2025 12:31:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0f35b0sm444024a34.11.2025.04.29.12.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:31:02 -0700 (PDT)
Message-ID: <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
Date: Tue, 29 Apr 2025 14:31:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
From: David Lechner <dlechner@baylibre.com>
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
 <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
Content-Language: en-US
In-Reply-To: <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_123104_501626_2C4278A1 
X-CRM114-Status: GOOD (  22.46  )
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

On 4/28/25 9:12 PM, David Lechner wrote:
> On 4/28/25 3:23 PM, David Lechner wrote:
>> Add new macros to help with the common case of declaring a buffer that
>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
>> to do correctly because of the alignment requirements of the timestamp.
>> This will make it easier for both authors and reviewers.
>>
>> To avoid double __align() attributes in cases where we also need DMA
>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
> 
> ...
> 
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
>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
>> +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
>> +	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
>> +	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
> 
> I just realized my logic behind this is faulty. It assumes sizeof(s64) ==
> __alignof__(s64), but that isn't always true and that is what caused the builds
> to hit the static_assert() on v3.
> 
> We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
> 
> And have this (with better error message):
> 
> static assert(IIO_DMA_MINALIGN % __alignof__(s64) == 0);

I was working late yesterday and should have saved that reply until morning
to think about it more!

We do want to align to to sizeof(s64) instead of __alignof__(s64) to avoid
issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
aligned_s64 exists and always uses 8-byte alignment).

So I think this patch is correct as-is after all.

