Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F80C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkBUrQix1fWtLAB3zeHSac3u/CyYN27zbs3C8IheJ94=; b=WAFLVtNDxirCw3eRGZ8hViyFMI
	CoXylt+/JMve57beHm1GCbRFuv0aq274DUVYkPe/743QvXT/bGyxIcdTsQs+hy1n06YRJ/iauIl+7
	6CLmca4ochbr30YpBaERKi9NhLou1JV2sVupBpYwLwf15rJQ7jfBUtxtnGBzye/xD5KD1NFwwDkNE
	Hs8P67fFEn0m2VXD19OKu45hJA7awMxVyTsP812z9ji4Cowj6Ir4fqHaedNGQAzeyMQ++5ZECrdAB
	W1MhiV9zAn9TWD7x1WoRZ/nUTepbe+7fRuBfDvsdlxvl0/HdT2ywbSs/CnYI3ZKKTyZkc7uOJr5rn
	54vwbhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8db6-00000001vBp-2fom;
	Sat, 26 Apr 2025 11:21:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dZE-00000001v4E-3vjG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 11:19:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66F55A4CFD8;
	Sat, 26 Apr 2025 11:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C245FC4CEE2;
	Sat, 26 Apr 2025 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745666370;
	bh=WD7l31tTK78CVAokxpQ9pdADeNBxjT8XEmfXKrkLxoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HVtT9cygcnh+KdWQfuD5PONAV2X6EbSyoywQMvxrjED7lwBdEZ/cQ0wsQmkLmGkFR
	 xP27R48qRFp66MOdrHgFaNLwNJdqaQYl51S5dFxl0Q2crm0QEOLibA9IN7LiKpTW9Q
	 T+hJ77t3fCPmq7ebIch7GTVAqQmd6uY2ZBLEtnAychE+L0vaKwll4btCwf6cTmiJ2R
	 v72qun0n5wLf4iMr18CS2Errw2uVNR/nl78j8OnzQ/pXltDxVvdcO23JRUmWIcd2CD
	 bVhqbGEoPAh5ttcJG1i04AEBNcDywQ2auEdCD1BuK2j6/regJJw3cz//eQx2VVZfp5
	 a2knJb6AzboZg==
Date: Sat, 26 Apr 2025 12:19:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Eugen
 Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Message-ID: <20250426121921.24c89212@jic23-huawei>
In-Reply-To: <b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
	<20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
	<701bfc6a715046044dbc789f1c11c7f85395c7a8.camel@gmail.com>
	<b4218efe-3785-4065-a3f7-57824e882f09@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_041933_110046_B3828B25 
X-CRM114-Status: GOOD (  27.78  )
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

On Wed, 23 Apr 2025 09:51:25 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/23/25 4:18 AM, Nuno S=C3=A1 wrote:
> > Hi David,
> >=20
> > Nice patch, I really think these will be very helpful... Just one comme=
nt bellow
> >=20
> > On Tue, 2025-04-22 at 17:07 -0500, David Lechner wrote: =20
> >> Add new macros to help with the common case of declaring a buffer that
> >> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> >> to do correctly because of the alignment requirements of the timestamp.
> >> This will make it easier for both authors and reviewers.
> >>
> >> To avoid double __align() attributes in cases where we also need DMA
> >> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.
> >>
> >> Signed-off-by: David Lechner <dlechner@baylibre.com>
> >> ---
> >> =C2=A0include/linux/iio/iio.h | 36 ++++++++++++++++++++++++++++++++++++
> >> =C2=A01 file changed, 36 insertions(+)
> >>
> >> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> >> index
> >> 638cf2420fbd85cf2924d09d061df601d1d4bb2a..4dd811e3530e228a6fadbd80cfb2=
f5068c3d
> >> 6a9a 100644
> >> --- a/include/linux/iio/iio.h
> >> +++ b/include/linux/iio/iio.h
> >> @@ -7,6 +7,7 @@
> >> =C2=A0#ifndef _INDUSTRIAL_IO_H_
> >> =C2=A0#define _INDUSTRIAL_IO_H_
> >> =C2=A0
> >> +#include <linux/align.h>
> >> =C2=A0#include <linux/device.h>
> >> =C2=A0#include <linux/cdev.h>
> >> =C2=A0#include <linux/compiler_types.h>
> >> @@ -777,6 +778,41 @@ static inline void *iio_device_get_drvdata(const =
struct
> >> iio_dev *indio_dev)
> >> =C2=A0 * them safe for use with non-coherent DMA.
> >> =C2=A0 */
> >> =C2=A0#define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
> >> +
> >> +#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> >> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) /
> >> sizeof(type)]
> >> +
> >> +/**
> >> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
> >> + * @type: element type of the buffer
> >> + * @name: identifier name of the buffer
> >> + * @count: number of elements in the buffer
> >> + *
> >> + * Declares a buffer that is safe to use with iio_push_to_buffer_with=
_ts().
> >> In
> >> + * addition to allocating enough space for @count elements of @type, =
it also
> >> + * allocates space for a s64 timestamp at the end of the buffer and e=
nsures
> >> + * proper alignment of the timestamp.
> >> + */
> >> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> >> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
> >> +
> >> +/**
> >> + * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer wi=
th
> >> timestamp
> >> + * @type: element type of the buffer
> >> + * @name: identifier name of the buffer
> >> + * @count: number of elements in the buffer
> >> + *
> >> + * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses
> >> __aligned(IIO_DMA_MINALIGN)
> >> + * to ensure that the buffer doesn't share cachelines with anything t=
hat
> >> comes
> >> + * before it in a struct. This should not be used for stack-allocated=
 buffers
> >> + * as stack memory cannot generally be used for DMA.
> >> + */
> >> +#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
> >> +	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count)
> >> __aligned(IIO_DMA_MINALIGN)
> >> +
> >> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) =3D=3D 0,
> >> +	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp
> >> alignment");
> >> =20
> >=20
> > I wonder about the usefulness of the above assert... AFAICT, the defaul=
t =20
>=20
> Jonathan seemed minorly concerned that a strange new architecture might h=
ave
> IIO_DMA_MINALIGN is < 8 some day, so I threw it in there. But agree, it s=
eems
> highly unlikely to actually happen.

Yeah, it's unlikely.  Architectures using small sizes is not about cacheline
length any more but rather than they guarantee that the system will work fi=
ne irrespective
of the cacheline length.  (e.g. x86_64 where the min align has been 8 for a=
 long
time - possibly always? and cachelines are generally 64 bytes)  It seems ve=
ry unlikely
anyone will care about smaller than that so such a macro is really just
paranoia!

The ARCH_DMA_MINALIGN fallback is sizeof(unsigned long long).

Basically I want the assert so I don't have to pay attention to weird new a=
rchitectures.
I'm not that fussed though if it is hard to do for some reason.

Jonathan

