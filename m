Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14944C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvIOZT2VYu7y+RdBaIv6mX2SRmgY5WZxbNwzrGyQ1XQ=; b=RBf7xYwXcqpY9hBL4ypsIxPipT
	4rGy4OhlFaTv2NdzaU1JY+4u1NFkYnyZ9gxs/vvS9mJea8ys2CTPCqmeHzGYeBAjwbTWeyXHsU16K
	/nkIwScH48jS5wGmfpr1wbjequ3TXhRJl6yd5M/pddjqniZ2xM+ug3O+ZHiH2MloiXABcSu1DLrky
	7S15RQOZCeMghPFRKQr+ph3ghKMe574sdv4jhLm970KgxHEtqtFRei8sFOmLOElPR2JnHBgpxbDIR
	iK+mYJmr6QJ9UZpWtTNePNwJguAmkk0rsiFvdKJLwSPzqhx2/nSYd16y/3rzTwJx4QLkm/b55Jg28
	+vaCmZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd0R-00000005i5D-1zAE;
	Sun, 04 May 2025 17:19:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBcyW-00000005huU-3PYs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4356A61126;
	Sun,  4 May 2025 17:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E156C4CEE7;
	Sun,  4 May 2025 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746379079;
	bh=xN/UhnYZvA8bqFUTBIzPLHgfDCJcKLVH31XKcoauZwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cZBhADz8LGQJIOY0/6Co3GLbELT0YZ6cx/72kXDSyoGXppqn3YdSFL5G2UuKPGEXU
	 boef0+PndSalbZGpo4uax6JS6/+J1HtAvt+mfQ8UMAX5oPMx2PR6b54Ctwtkd5q2zD
	 1rtAT0hfzXd3LB7v37MO+IYhYFOZLdqquLOkQ+olBr98iKM7WAm9nVmXtKqFhjRobI
	 lxWaEhS484I9GMSkk1tPiZnrdjqPf76zUqccIFqlb00hA3aXZrP+WSjWoXtvjnLkkZ
	 wX9kikVPJLDYySP1i3gKczodzVriItRdZ7B18jC/xF87gCjE+3F+0PuJ9TdPFYVkt/
	 VeERNLNRN856w==
Date: Sun, 4 May 2025 18:17:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Eugen
 Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Message-ID: <20250504181749.67d0d92e@jic23-huawei>
In-Reply-To: <38e243b0-e81b-4d4d-97fe-91ea2bec6270@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
	<20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
	<1d90fae5-9c58-4a77-b81c-2946e7cc74d4@baylibre.com>
	<5c762653-b636-45bd-8800-e804ad8dfda5@baylibre.com>
	<CAHp75VfcmvLhBDjbu6x46wGyzG+i7=rVypzSm11qzWN9Qq_rew@mail.gmail.com>
	<38e243b0-e81b-4d4d-97fe-91ea2bec6270@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 29 Apr 2025 14:47:41 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/29/25 2:36 PM, Andy Shevchenko wrote:
> > On Tue, Apr 29, 2025 at 10:31=E2=80=AFPM David Lechner <dlechner@baylib=
re.com> wrote: =20
> >> On 4/28/25 9:12 PM, David Lechner wrote: =20
> >>> On 4/28/25 3:23 PM, David Lechner wrote: =20
> >>>> Add new macros to help with the common case of declaring a buffer th=
at
> >>>> is safe to use with iio_push_to_buffers_with_ts(). This is not trivi=
al
> >>>> to do correctly because of the alignment requirements of the timesta=
mp.
> >>>> This will make it easier for both authors and reviewers.
> >>>>
> >>>> To avoid double __align() attributes in cases where we also need DMA
> >>>> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS(). =20
> >=20
> > ...
> >  =20
> >>>> +/**
> >>>> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer =
with timestamp
> >>>> + * @type: element type of the buffer
> >>>> + * @name: identifier name of the buffer
> >>>> + * @count: number of elements in the buffer
> >>>> + *
> >>>> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_=
DMA_MINALIGN)
> >>>> + * to ensure that the buffer doesn't share cachelines with anything=
 that comes
> >>>> + * before it in a struct. This should not be used for stack-allocat=
ed buffers
> >>>> + * as stack memory cannot generally be used for DMA.
> >>>> + */
> >>>> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)   \
> >>>> +    __IIO_DECLARE_BUFFER_WITH_TS(type, name, count)         \
> >>>> +    /* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */  \
> >>>> +    __aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64))) =20
> >>>
> >>> I just realized my logic behind this is faulty. It assumes sizeof(s64=
) =3D=3D
> >>> __alignof__(s64), but that isn't always true and that is what caused =
the builds
> >>> to hit the static_assert() on v3.
> >>>
> >>> We should be able to leave this as __aligned(IIO_DMA_MINALIGN)
> >>>
> >>> And have this (with better error message):
> >>>
> >>> static assert(IIO_DMA_MINALIGN % __alignof__(s64) =3D=3D 0); =20
> >>
> >> I was working late yesterday and should have saved that reply until mo=
rning
> >> to think about it more!
> >>
> >> We do want to align to to sizeof(s64) instead of __alignof__(s64) to a=
void
> >> issues with, e.g. 32-bit kernel and 64-bit userspace (same reason that
> >> aligned_s64 exists and always uses 8-byte alignment).
> >>
> >> So I think this patch is correct as-is after all. =20
> >=20
> > I'm wondering, shouldn't it be better just to make sure that
> > IIO_DMA_MINALIGN is always bigger or equal to sizeof(s64)?
> >  =20
>=20
> Sounds reasonable to me. From what I have seen while working on this is t=
hat
> there are quite a few drivers using IIO_DMA_MINALIGN expecting it to be
> sufficient for timestamp alignment, which as it seems is not always the c=
ase.
>=20
> I'll wait for Jonathan to weigh in though before spinning up a new patch.
>=20
It would be very odd if we ever see a platform with a DMA alignment require=
ment
that is not a multiple of sizeof(s64) just forcing IIO_DMA_MINALIGN to max
of the arch constraint and sizeof(s64) seems fine to me and fixes up
all those other drivers that were assuming this was true already...
I thought it was and only got fussy for this macro :(


Jonathan



