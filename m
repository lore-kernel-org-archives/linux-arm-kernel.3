Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE0C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 21:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6iKxLNv8V7pETLeJH3poz4r78D0xk17zrhZAC6yXQY=; b=d032qy9h2jXYDP9zTks0TMKw4m
	/876HXKawrWFW0xtrdKT1phL1E/OdipmduxFK89ALMMY2RXtgXRBquDD2gsQmGRoLzd9mloSc4BZV
	Vt9+xcoTGGmZHB5pdK8MK32Jd68SUq+m9tOQ2UGSa4UM6p3NEnGESTzapnT3zz6whSbb8julH/m8j
	FY+IQrvPRuIr2Rg5hmuOD9lbEuw7eVX5G5uj7tdoc4TD/Ohx8CeQy9bjR+jznIc4hOwNf9PnTK+yb
	kesQbk9f7HS9ktJOZmf3c/yNR7zsJYpt/fjA3cmn0gF7Dv56xz4e8TG6dFRojSuicN79QmRngymiG
	Q+i5IRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD90J-00000001r1Q-2dKs;
	Thu, 08 May 2025 21:42:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD8yK-00000001qot-1dMY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 21:40:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so11273435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746740401; x=1747345201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6iKxLNv8V7pETLeJH3poz4r78D0xk17zrhZAC6yXQY=;
        b=IHERQSn1GVKGcQH+TsytePztHbE9AvqIemtYVYPQS+NBcOOZh9BC38G6jXi+jgOxvc
         nOJTP/hJgYquQcEo4OfvOJ0ek8iMx4mQoyXuuFb9OOqr15aZMCXsMIGv2rW8xGFQrIEK
         HctVFdfLcQX3MlYXtKaaUptcWRZQV4N23FPYvMe0bk9lxi7uOLX60e2sk99Og94/iqU9
         kNDsLXpev73eTfOezMrI04Kj60xL5PUwGyEDsJ6PnW1+jH4YvK/EgCUPF2s+LVKbUdlp
         ZrVkKiGqMuBxViC8UqC9Iub94BWM4y5Fg+ULK60mf4usXczOHp5myvFx28r1j/2hW1WY
         brFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746740401; x=1747345201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6iKxLNv8V7pETLeJH3poz4r78D0xk17zrhZAC6yXQY=;
        b=kOy3+Pv1/0MfWD7spcBEyGqngDdStFeBMj/2gfqZZUrGla5kuKHsWriLXxWDDo/Zfg
         w7kg+b5ncmrhyGqg5XjN1xivfJWFvkFhRjblSZBam+sPag5TJDmEz+cJrHP1Do0bTWYR
         s0MSrOBBl53g9OZaOGBGehi3MfQeVcUkLDIjjIJf6U4nmRIptbj2GlBg4vJHCk0ymNsC
         XugiOjmiKEXF7NYdriOb6hULCUNmdJtRJZij01ETnShoKj2YIoVTPU7XMajJJt1xKe05
         doITDrf5IpfblTTssKBcTuXyabJlW/pZux7kMmSw4mWNSkshQCxb0UpLklbBnVzIAZp0
         F2GA==
X-Forwarded-Encrypted: i=1; AJvYcCVC+cCdvloq3QiB0TpuHYMZmehaUxLI5IGXHKwfvMz+0NMLiymI3QtUjw/7IWorRBh+w2wnIYHIDyv7GKhetNJV@lists.infradead.org
X-Gm-Message-State: AOJu0YyYZ0Fed4S16zlAyMywWKQQe+eN9piMH2Xq6SPgFanDYBL0MtwW
	9k51SyOp1scGbTgPyZmC2r5nj95Mo/gUhD/iG2wFlpCaxhym2lne
X-Gm-Gg: ASbGncvwkEdUGDDstJO2JR93GreFiHjgx+hM/6aypGe54dlJ9hxtqHQKEvqjdVnnzyA
	GwoOm/QgmsHQMQEwiwuyxMjxRZjFN2MaKzZqqbAvRdirl1LkXNOo00ng7g/WNPHTDIu6Aa5Yy48
	zSHNw8BDINDCVYJHx1LkNXcEbCtx2mbMQmE27//y1CNNhTpqA7qeGqQE9yaSCyx7xxN/CydcCeC
	T5Je9u/s+CG/3kKZHDYfB8EDE3VkLadohd4IN20jwABlurRxldmc+zc9I5S/JMkioyu+GTtMy46
	u+s6rPBlg536qSheenvx/Sjkorq1JSJjSVAO8OQuQnDQRHrNpOBKljgCXMBMQY1xbKvsek3l4kX
	wHKABhevMWBGynQ==
X-Google-Smtp-Source: AGHT+IE0WPQ/O8hzBzdH+71zuXvnfTcTp1gVeC9FNstp3An7yRQmTACh7fhbKRYnp0MWiYuGxTvlCg==
X-Received: by 2002:a05:6000:4304:b0:3a0:b294:ccf2 with SMTP id ffacd0b85a97d-3a1f649cc02mr938659f8f.52.1746740401013;
        Thu, 08 May 2025 14:40:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a12sm1101305f8f.44.2025.05.08.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:40:00 -0700 (PDT)
Date: Thu, 8 May 2025 22:39:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Eugen
 Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] iio: make IIO_DMA_MINALIGN minimum of 8 bytes
Message-ID: <20250508223959.70e909d2@pumpkin>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-1-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
	<20250505-iio-introduce-iio_declare_buffer_with_ts-v5-1-814b72b1cae3@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_144004_431830_0A0E1AF8 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, 05 May 2025 11:31:42 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Add a condition to ensure that IIO_DMA_MINALIGN is at least 8 bytes.
> On some 32-bit architectures, IIO_DMA_MINALIGN is 4. In many cases,
> drivers are using this alignment for buffers that include a 64-bit
> timestamp that is used with iio_push_to_buffers_with_ts(), which expects
> the timestamp to be aligned to 8 bytes. To handle this, we can just make
> IIO_DMA_MINALIGN at least 8 bytes.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  include/linux/iio/iio.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..7e1e3739328d103262071bd34ba5f6631163c122 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -775,8 +775,18 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
>   * to in turn include IIO_DMA_MINALIGN'd elements such as buffers which
>   * must not share  cachelines with the rest of the structure, thus making
>   * them safe for use with non-coherent DMA.
> + *
> + * A number of drivers also use this on buffers that include a 64-bit timestamp
> + * that is used with iio_push_to_buffer_with_ts(). Therefore, in the case where
> + * DMA alignment is not sufficient for proper timestamp alignment, we align to
> + * 8 bytes instead.
>   */
> +#if ARCH_DMA_MINALIGN < sizeof(s64)
> +#define IIO_DMA_MINALIGN sizeof(s64)
> +#else
>  #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
> +#endif

Did you actually test this?
You can't use sizeof() in a pre-processor conditional.

	David

> +
>  struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
>  
>  /* The information at the returned address is guaranteed to be cacheline aligned */
> 


