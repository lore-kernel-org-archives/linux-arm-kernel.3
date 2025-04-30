Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B79DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5S9e1DWGqEFvpNpYn3bjcrfQGdDQ4Z+tozseIJJX8Y=; b=k2BwZTZv0b1NF9hJIwDgWy8LBT
	JW3Jh/C5LE5QAeaUpnJL3tlCEBWN0A60Xi38iwOoWLtmL2kH/BYAROujq4n0lCwXP7LDXo7hFmv8U
	5IKUsZH3NgY0hv/dEnozjOcUo5Y2/oMhi7CM8D45vEnjrxXXZK0zglJcO71HoYZ5iQVxgd/SNM6J1
	tBFUhaYUOXJhHYZVgwR8EuWjMT4xIbOCUaq7/f/Gqsmr0DLMh6V+7qmdOcKQMRyYMV33u76sd8GZG
	Zw3clY5S7iW5IxdnLVF5+IeahpWo38WtV+e4efxziH/ARVN04KVCiRomrgdG6pQQxYMY4IoxzVDKG
	nNN7iyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9zT-0000000DO0m-35gc;
	Wed, 30 Apr 2025 16:08:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9wJ-0000000DNZi-1A5L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:05:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ede096d73so50368275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746029137; x=1746633937; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D5S9e1DWGqEFvpNpYn3bjcrfQGdDQ4Z+tozseIJJX8Y=;
        b=U06HzpSypOEOv1vv14o1PE3IdRZvycvUWrZKKoFr+AiXsdH869V/nvdK3nv7Giocp2
         9KBf9PheCi9pUNyBqw8GOFuuLQUhC4hVk+kalaZanSePk/1dGhxpCnPV6P+JKlTy20Zl
         JBvvNWTX0CpGSbenYn/sIWZZKEK/2rVkky7DuSemY/r/2/1ZGOIKQGoQsGS4XKrZSQ+1
         ioACdno0Aq0j6Lpn3L3zzME0RTA0U/AU56eH1bE9yxSy1IEhYNftpqS3isf+L5+U7ywd
         Phgce3BDio4FVqfxcQpen4uH9PGRuX5OdpB/x7D5tg1gYFuda5drIG/nhFX996KYbpcB
         ZyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029137; x=1746633937;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5S9e1DWGqEFvpNpYn3bjcrfQGdDQ4Z+tozseIJJX8Y=;
        b=jXMYUkI2SghARRird2Ze0VEB26LUlHaVVcXotUIkDXEpioJzsDz1bV+gUiknU63nYM
         B1/1FQg+wt1Rt4+XnQRkCAbLjaK+2GIU1Ec/KdygSWdfGW1UUPu20rI9s///nN7hQBe+
         awzldk1dyJxFPsYTKEKL1L14vbxjmb+mya5lxI72nhjYiTPxO0NEQipCC+2Qdkq8Y4aS
         J4Ss+66139vboum77JtX06GC9ZbS7pAsg08hqiFW8uT7DRI5Ex8HbBvNpG/X0hCOER+Y
         OWCR/Q9mJPf0ka1xMHlC3NLSkI7F0DtRCqHzN3IpeKjA+OL16IlQY6lu/QDO5sOzdKpN
         T3mA==
X-Forwarded-Encrypted: i=1; AJvYcCV3zrwUJ+LAcQVgO08Ewq1OJu5HW9AQ64nPZzeXb4PAQ3HF0/bTrXXF6UhzKwotKjRBDEJvvQXxXkNYtFIZ0aXV@lists.infradead.org
X-Gm-Message-State: AOJu0YwI3akKa4hsA9orm8irLCiQvPePuwSecSDAvhY2nkuyrEJSRrQ/
	ZX11MuJ+L7EvqIKINfmgmhgUoeqe92eYKZOJYxbsf2L2VNndLaEeyiRx4aDIU3Q=
X-Gm-Gg: ASbGnctmDO9OmwBjLGNF74q6UDzN45z5ui9FLfhEM+7pJ6Zp02M3esUKWxh8BkrnuBt
	nLqnAXF7zJmzTHc8uwIrOypgHt4NbQayM6GJkO9XIDV+jvIWPSyII3q3WYIk3tizDBNql7mGUH6
	CFEU/fY5OiiycLyHeVA66LyVGyFfSob10PeU3+jhJJNMQW6LEgAZgo0Fm5kq2AbmoQOMMfmJdyC
	51gLNxb9U9FkfaMF+BrV2hBDgIo9eZty6G0g+iU6YUakjAXSVjT6d2BjnDzFY1kKcgiia+1Y11g
	Co6g/RARzBJ8DS92y8Inij3/Kz3Jd7LFu7ehlm1+3efzRcI4V1nW+jy2t5LMyieIDEhTFJs09Y0
	qwlzJd6nM61QA
X-Google-Smtp-Source: AGHT+IF+0FsUtiZZIFNQGFEeJHnqBv2psnote9Irpa5eEjYMg2hfFzoB8Ru87RV07vlOJ5l+POqEug==
X-Received: by 2002:a05:600c:1e20:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-441b1f35c86mr45681905e9.10.1746029136799;
        Wed, 30 Apr 2025 09:05:36 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b209a4sm29411885e9.30.2025.04.30.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:05:36 -0700 (PDT)
Message-ID: <633ae10805f20a7c4c56d0197c200411f480c374.camel@gmail.com>
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen	 <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 30 Apr 2025 17:05:41 +0100
In-Reply-To: <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
	 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
	 <1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
	 <5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_090539_314908_F25D438A 
X-CRM114-Status: GOOD (  29.61  )
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

On Tue, 2025-04-29 at 14:31 -0500, David Lechner wrote:
> On 4/28/25 9:12 PM, David Lechner wrote:
> > On 4/28/25 3:23 PM, David Lechner wrote:
> > > Add new macros to help with the common case of declaring a buffer tha=
t
> > > is safe to use with iio_push_to_buffers_with_ts(). This is not trivia=
l
> > > to do correctly because of the alignment requirements of the timestam=
p.
> > > This will make it easier for both authors and reviewers.
> > >=20
> > > To avoid double __align() attributes in cases where we also need DMA
> > > alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().
> > >=20
> > > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > > ---
> >=20
> > ...
> >=20
> > > +/**
> > > + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer w=
ith
> > > timestamp
> > > + * @type: element type of the buffer
> > > + * @name: identifier name of the buffer
> > > + * @count: number of elements in the buffer
> > > + *
> > > + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses
> > > __aligned(IIO_DMA_MINALIGN)
> > > + * to ensure that the buffer doesn't share cachelines with anything =
that
> > > comes
> > > + * before it in a struct. This should not be used for stack-allocate=
d
> > > buffers
> > > + * as stack memory cannot generally be used for DMA.
> > > + */
> > > +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
> > > +	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
> > > +	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
> > > +	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
> >=20
> > I just realized my logic behind this is faulty. It assumes sizeof(s64) =
=3D=3D
> > __alignof__(s64), but that isn't always true and that is what caused th=
e
> > builds
> > to hit the static_assert() on v3.
> >=20
> > We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
> >=20
> > And have this (with better error message):
> >=20
> > static assert(IIO_DMA_MINALIGN % __alignof__(s64) =3D=3D 0);
>=20
> I was working late yesterday and should have saved that reply until morni=
ng
> to think about it more!
>=20
> We do want to align to to sizeof(s64) instead of __alignof__(s64) to avoi=
d
> issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
> aligned_s64 exists and always uses 8-byte alignment).

What issues could we have? In your inner macros I think you still make sure=
 we
pad everything up to sizeof(s64) right? Am I missing any subtle issue?

but...

>=20
> So I think this patch is correct as-is after all.

FWIW, I do prefer this approach or what Andy suggest (min as sizeof(s64)).

- Nuno S=C3=A1

