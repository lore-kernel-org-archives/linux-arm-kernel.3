Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A67C369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faVLB6aAgIxJJSh0PLoK+cqTr7k6BU7rIZfDV24ECRU=; b=s4SFmluURr2Fh1rpuTyC80vn+p
	OL+0ZOKXXBzB7SLH1q/tJ5OuFmiN8u1oC0x/Y+SMQvUFJtycDsDFgyHPmJxuo8ITi20i78W+wVoC2
	MMy/bFQBq2btIov3tIFa4pkea2MD4pmNieiOSoNrFhsbubRlDvRFGOuu/PVcWkQKNNtwB5i1dsigM
	WNeTQIIs2wk99Omwqdf6/hvyhmmwZXBC0i1jET/jjt8yDnepTfrDW0ubb/6A5p0B8lBSLYcIgAMF3
	C5uSYwGpIqZ+v2WqRpNPPEg8tYtBQReUToVt0ReRwMVpNYSE74IPATwP6Y27r9Z4OZ9jc51tGbjjH
	j41gp9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n2k-0000000GVSO-0dn8;
	Fri, 18 Apr 2025 14:50:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mzU-0000000GUlK-0XCw;
	Fri, 18 Apr 2025 14:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99D1A4A615;
	Fri, 18 Apr 2025 14:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF95C4CEE2;
	Fri, 18 Apr 2025 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744987611;
	bh=5a8es+dGqoWzvZRG72BP+Tii3vAYyV3WD+yVJH2N8VY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u0lo+pyc59zklEQ1VhjL78cRV7IzRREb/PqeQuX7c7lN1UI0U6opronFmJqw03IFH
	 qhi8w8Su/KbAxKHSZSa0TpDLoOvOxJ+q+O903X156V/QOUV6EHHmknLm6gx9BdoxuS
	 ji+0epLMGJXSShNJPDKLkl5C1xs8gaMvEzQ0T5XXmdtMu16L6id8bUerk/6I1F3FuE
	 JiNdpRIth/fye2jEFhLedT419xj3EpRh6aLgzPLwemKjy4m0WNq9U8RPROR86x1hMu
	 8lAQbXPKqNGautan0WAWHrXvdxsYUwAXsiWLj+BOOS2Q50XhhrX7UBBT6dEjMsiqeH
	 puBa/EeMfdF/Q==
Date: Fri, 18 Apr 2025 15:46:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin
 Tanislav <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] iio: addac: ad74413r: use aligned_s64 for timestamp
Message-ID: <20250418154642.41cb9d80@jic23-huawei>
In-Reply-To: <057bec6375819c3a4cd227c20a60ec1dbb7405c3.camel@gmail.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-3-eafac1e22318@baylibre.com>
	<057bec6375819c3a4cd227c20a60ec1dbb7405c3.camel@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_074652_217366_327F5CD3 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, 18 Apr 2025 09:57:38 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> > Follow the pattern of other drivers and use aligned_s64 for the
> > timestamp. Technically there was no issue here since
> > AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX =3D=3D 16 and IIO_DMA_MINALI=
GN
> > is always a multiple of 8. But best to conform in case someone copies
> > this to new code and then tweaks something.
> >=20
> > Also move the unaligned.h header while touching this since it was the
> > only one not in alphabetical order.
> >=20
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > --- =20
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
Applied.
>=20
> > =C2=A0drivers/iio/addac/ad74413r.c | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
> > index
> > f0929616ab899cb374f00869787321eed4ccde16..a0bb1dbcb7ad9d02337d0990e5a3f=
90be7eaa4ac
> > 100644
> > --- a/drivers/iio/addac/ad74413r.c
> > +++ b/drivers/iio/addac/ad74413r.c
> > @@ -4,7 +4,6 @@
> > =C2=A0 * Author: Cosmin Tanislav <cosmin.tanislav@analog.com>
> > =C2=A0 */
> > =C2=A0
> > -#include <linux/unaligned.h>
> > =C2=A0#include <linux/bitfield.h>
> > =C2=A0#include <linux/cleanup.h>
> > =C2=A0#include <linux/crc8.h>
> > @@ -24,6 +23,8 @@
> > =C2=A0#include <linux/regmap.h>
> > =C2=A0#include <linux/regulator/consumer.h>
> > =C2=A0#include <linux/spi/spi.h>
> > +#include <linux/types.h>
> > +#include <linux/unaligned.h>
> > =C2=A0
> > =C2=A0#include <dt-bindings/iio/addac/adi,ad74413r.h>
> > =C2=A0
> > @@ -84,7 +85,7 @@ struct ad74413r_state {
> > =C2=A0	 */
> > =C2=A0	struct {
> > =C2=A0		u8 rx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];
> > -		s64 timestamp;
> > +		aligned_s64 timestamp;
> > =C2=A0	} adc_samples_buf __aligned(IIO_DMA_MINALIGN);
> > =C2=A0
> > =C2=A0	u8	adc_samples_tx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX=
];
> >  =20
>=20


