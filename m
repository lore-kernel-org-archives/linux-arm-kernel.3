Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFC7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrGROsqZIwKCgrOnIO0opoKDeXx0qHVFUxais3JjiPU=; b=k25D6zLGZNuHAKmjjYrRjEFHcx
	X6nqgW78QLTd2wVWKElpsRkULfHYJcQGcdBz2MIZwai6YLS9TUMetr+Fe4W/js5HO+rWySz8dsFBm
	5qOufUB2DmpHqcDTVAR92pZVklewhehOnFqQFq92oS0C7t+NCDxrJQEvYj75ES1dBJtqd+tA/tHSq
	oaBGKSdErAbAnETxiNy3nrHj+lRb8arShsccdrx9SvjiMRkndv873NvsvTk/nF5Q4F+fCznPogebT
	kmubZfF9iHHHJYktfCsgQMkjIek4usQ0G8zW1eGwBvLYWQ92s3uy9LLVTmIUL2fAlkGyXNuZeXGgQ
	wBykNX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YMR-0000000AMWh-0pMp;
	Wed, 23 Apr 2025 11:33:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WFr-00000009vRo-2rOh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:18:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so5285735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745399933; x=1746004733; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VrGROsqZIwKCgrOnIO0opoKDeXx0qHVFUxais3JjiPU=;
        b=MLZZE1LZK/QZf/PtWPPvDUee8c0NWw7JGEs0L3jHbTnjTSYvWSo4I+7P1FRwIu/ebd
         rOG5N4X5dMlCNf4K9fmkw0H77taESrBx890SsCTrx6UwzMg9luVauOjqp3dY0J+c+wlS
         IM12pMdXqk1/U9ibfPBUo40TsYGNnVaB4/U4gkLiCRkMn9k+Ni0480GzkMRBSrt5CJqH
         t3l/CDsc5AQiiaMt8RTOlK18IJBmL2v8Xmbvl7/QNij2RE1wXBKGBTgHGFaN6yqq2XUK
         PJv7bD/eaKL80OmFhYY04PYSyEo1C+fLV5ZpwwnUvgV0VmW9uuBO7sa1oknkC5A7dVbc
         obUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399933; x=1746004733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrGROsqZIwKCgrOnIO0opoKDeXx0qHVFUxais3JjiPU=;
        b=MGyRU4VnIgFv25IdVeQLuJlPUTLRjg53MuIQEcPAbtsWsKSQ4gg5//bEtLlJJfzUmz
         MP/THnDmMsP1OwHsLuJTCVGCAhTMCPFDJ0XfaUjLC+mp+kuU7pn14D9MNUOOnEvbL0wO
         6LTusheAe7Mv3cqPmJiDhbX1IdwnYtNrJHUcALUc9Jd4Zh8Vu67io9tp+yWsaE6//8y8
         x7c4rfHpezxIAy6Qj8zxPWBMzNJ4WDVhXsfkkHfGpJb3Uek7IavZi79Uu6/x4k0J21hR
         mp5ckDANHzGfZdM/tMywkJA0WjV0OmlW7BhwDTWLx/alwFQ1STiGjHd90zEa0N8JjHoK
         pNJg==
X-Forwarded-Encrypted: i=1; AJvYcCV8oe19aYpdeINefI1L5eL0SGFj7YEjiBCdMjoMFuE3SDl9P/yUFX3pdI8fSApGF0UHZL1W7YwXntQudStx+Y3S@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4EyM2fJbd1wj21ytPT5Sqx2f46jpN1GLmUaCv992WQK+2YfN
	Z/InromlloUIFAg/kejMDDykmFcR8XiSU3tAiBzH0xnDkqoIrjYx
X-Gm-Gg: ASbGncvbejaAzRagZJj8CVjnagqiPzcp+IIoKmod5XLPiBrNHFR21Nric3EMEBCmApx
	DjN0cb5Je4RhdtxbYOa7pSUV7vp2VMlGj7TxIXQrzgj9vaTrg7gXwTe6z3tMDjMjQx2TBQLjrxE
	Cdw/WBFhh4ujkYVoiKpeL50JvYLjxCabn0obh/nnIQki+Ko58TlXg9nmI4ux381jn9qI20224/r
	0rGG3og24yRkbYFu/EZKSFsL16Bh+SojQAXNdx+1PC/6Uz2WcikahiInAJ30phI+NB2wmUxNk1o
	QDXVmUdXZA1EB/kddWIPPZeLKEjNDQXN7nh8CcSEQlKDt0ixJpTwJ1xCiq1j19G04Di2LypxY+1
	TCPL5eeu1N15h
X-Google-Smtp-Source: AGHT+IG4usbOo5npOeZN1xbvBwncAj7wxo11cJLpW32A6dZWurXCH49f3H3MAKTcb59zIVTdCG5IiQ==
X-Received: by 2002:a05:600c:2d46:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-44091ee7a72mr12670515e9.5.1745399933033;
        Wed, 23 Apr 2025 02:18:53 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d16dc0sm18664225e9.6.2025.04.23.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:18:52 -0700 (PDT)
Message-ID: <701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
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
Date: Wed, 23 Apr 2025 10:18:55 +0100
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
	 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_021855_722560_A63EC9CD 
X-CRM114-Status: GOOD (  27.74  )
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

Hi David,

Nice patch, I really think these will be very helpful... Just one comment b=
ellow

On Tue, 2025-04-22 at 17:07 -0500, David Lechner wrote:
> Add new macros to help with the common case of declaring a buffer that
> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> to do correctly because of the alignment requirements of the timestamp.
> This will make it easier for both authors and reviewers.
>=20
> To avoid double __align() attributes in cases where we also need DMA
> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> =C2=A0include/linux/iio/iio.h | 36 ++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 36 insertions(+)
>=20
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index
> 638cf2420fbd85cf2924d09d061df601d1d4bb2a..4dd811e3530e228a6fadbd80cfb2f50=
68c3d
> 6a9a 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -7,6 +7,7 @@
> =C2=A0#ifndef _INDUSTRIAL_IO_H_
> =C2=A0#define _INDUSTRIAL_IO_H_
> =C2=A0
> +#include <linux/align.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/cdev.h>
> =C2=A0#include <linux/compiler_types.h>
> @@ -777,6 +778,41 @@ static inline void *iio_device_get_drvdata(const str=
uct
> iio_dev *indio_dev)
> =C2=A0 * them safe for use with non-coherent DMA.
> =C2=A0 */
> =C2=A0#define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
> +
> +#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) /
> sizeof(type)]
> +
> +/**
> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
> + * @type: element type of the buffer
> + * @name: identifier name of the buffer
> + * @count: number of elements in the buffer
> + *
> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts=
().
> In
> + * addition to allocating enough space for @count elements of @type, it =
also
> + * allocates space for a s64 timestamp at the end of the buffer and ensu=
res
> + * proper alignment of the timestamp.
> + */
> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
> +
> +/**
> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with
> timestamp
> + * @type: element type of the buffer
> + * @name: identifier name of the buffer
> + * @count: number of elements in the buffer
> + *
> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses
> __aligned(IIO_DMA_MINALIGN)
> + * to ensure that the buffer doesn't share cachelines with anything that
> comes
> + * before it in a struct. This should not be used for stack-allocated bu=
ffers
> + * as stack memory cannot generally be used for DMA.
> + */
> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count)
> __aligned(IIO_DMA_MINALIGN)
> +
> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) =3D=3D 0,
> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp
> alignment");
>=20

I wonder about the usefulness of the above assert... AFAICT, the default
alignment is 8 bytes and I could not find any arch defining ARCH_DMA_MINALI=
GN
smaller than that (would be very odd to have a cacheline smaller than that =
these
days). For bigger values, nowadays they are all power of 2 and I would be
surprised otherwise. But the more important question to me is what if the a=
bove
assert fails? Will we not allow IIO or some drivers to be used in that
architecture? It can become a very "painful" situation (assuming these macr=
os
get widely used). So, IMHO, either we assume the above can happen and rewor=
k the
macros to make it work for that hypotetical case or we assume the above is
always true and drop the assert. TBH, I think it would be a fair assumption=
...

On top of that the assertion is wrong:

sizeof(IIO_DMA_MINALIGN) !=3D IIO_DMA_MINALIGN :)

On the other hand, as I mentioned in V1, I think that an assertion or
BUILD_BUG_ON_MSG for making sure 'count' is a compile time constant express=
ion
would be helpful. Sure, we'll get -Wvla but some developers might still ign=
ore
the warning and send patches with these arrays. So, it would be neater if w=
e
fail to build and force them to fix their code.

- Nuno S=C3=A1

