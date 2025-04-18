Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F99C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeMXPCW6TtDJ4cFR2Kle8bCj36s9jefzNZQA0ULSlQw=; b=XO135zVv7YR4zNblCwnjUV81MX
	LPE389FznVkbhnuyc+JoSdgMAN0Pwu5nuc1CS354Oc4Xjrj0+A736qZkb7jhppha+N3r9mbLFbiT6
	O4VhUABaHmvhNc1wt5z2Q/KxrnuFBAzfo9QZL0Ijr/RqZVDV/8lZJKlfq1s6Sd0Cr+JzjgyEfX3ON
	zfttehpkDrCgYgSa88fxzzKUHNA5tyjKHF0Hf1vKnZAyYVw+IHrbXXHcbm9FLvwCeXQup2OtNkOzA
	C345RkDBA0IU5b9xH13drdKSN44oyR6Mssi7w2dvAbO6L3CO4OGMQe2HlfaPbyb2+/O9wd99UwN8i
	ZWMN3esA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n0p-0000000GV0s-3Mh5;
	Fri, 18 Apr 2025 14:48:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mxt-0000000GUMc-06Ys;
	Fri, 18 Apr 2025 14:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BE6544206;
	Fri, 18 Apr 2025 14:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5757DC4CEE2;
	Fri, 18 Apr 2025 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744987512;
	bh=utxZwt7Wqzcm1s9IdpF2wgbei9+hqt0bzhTr8EybsA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NAoiXPqFDjte5rVJPYd2xgnWlRBcPl9S9IdtCaKbaKffdzN9+vkyRSTF5AE55fopF
	 sAyZfZqOybSZ/+h/4hUwnlVyyZdhPVSgQFmEXF4GRi5kvsyVBevhRDA4FcN+McPul+
	 tUwlCdiicfmhqYODJMbCxQQMeOudrwuOSpSRiO/D4SGQnF00TpClePd+K7ax6lYuKv
	 p3V+UEU2/Gl4qVH2dIatScCsjuk1sHO84LuL+j3NZyWWXSlqluHrcRDNUWEW13I2xZ
	 /SgxgHnZdtaXzKHdCzWDm4tZhgWQQ97QMnoonE2+4ilw3n3II+xIbZffE5EDYNa04M
	 yK7dg2a2DKEXg==
Date: Fri, 18 Apr 2025 15:45:01 +0100
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
Subject: Re: [PATCH 2/8] iio: adc: mt6360-adc: use aligned_s64 for timestamp
Message-ID: <20250418154501.566138e3@jic23-huawei>
In-Reply-To: <d3800b1fc2430d897750541219e39fd43216b199.camel@gmail.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-2-eafac1e22318@baylibre.com>
	<d3800b1fc2430d897750541219e39fd43216b199.camel@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_074513_093289_900045C5 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, 18 Apr 2025 09:57:09 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> > Follow the pattern of other drivers and use aligned_s64 for the
> > timestamp. This will ensure that the timestamp is correctly aligned on
> > all architectures. It also ensures that the struct itself it also 8-byte
> > aligned so we can drop the explicit __aligned(8) attribute.
> >=20
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > --- =20
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
Applied.
>=20
> > =C2=A0drivers/iio/adc/mt6360-adc.c | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
> > index
> > 4eb2455d6ffacb8f09a404df4490b5a11e49660d..f8e98b6fa7e923c6b73bedf9ca1c4=
66e7a9c3c47
> > 100644
> > --- a/drivers/iio/adc/mt6360-adc.c
> > +++ b/drivers/iio/adc/mt6360-adc.c
> > @@ -263,8 +263,8 @@ static irqreturn_t mt6360_adc_trigger_handler(int i=
rq, void *p)
> > =C2=A0	struct mt6360_adc_data *mad =3D iio_priv(indio_dev);
> > =C2=A0	struct {
> > =C2=A0		u16 values[MT6360_CHAN_MAX];
> > -		int64_t timestamp;
> > -	} data __aligned(8);
> > +		aligned_s64 timestamp;
> > +	} data;
> > =C2=A0	int i =3D 0, bit, val, ret;
> > =C2=A0
> > =C2=A0	memset(&data, 0, sizeof(data));
> >  =20
>=20


