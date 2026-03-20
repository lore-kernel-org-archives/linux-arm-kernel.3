Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C4E1099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSyQfSfJLUM1m6GIB6OZuhr10E00mTg3LMvm+W8lDOs=; b=AgGEQzsJ8MI3pQP22oi+xbMalW
	p9ZRQBLj2Yvh/JcQfLVJyOou3MrChLXpURVIL8YRJxU+T+ajjIHHaLF/jkI+2Dts3pdxxy97Gvmtu
	Sypub7HzvoDSFasjZV4r5t5Jay7pqTgrJZLjND5gc3CvEgPr7docmVlhaNBBUjJacKaKdw1JvB4tE
	NfpOcP3yWPEEQUDxcXt4U8nMeVfzU+BZj5fk/ap80PjOzd8SOWD9Bfqe6I71qWIv6dBWxSnxk7rrC
	sLH4wz9RZJ8tkXJiC+jITkmVwgyfmSrnxmoqK09lorzL9TeLQeX9imOWf8zzChAy/el8aoCzxfBj7
	AjrEcoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e1e-0000000DKCw-3FrH;
	Fri, 20 Mar 2026 17:52:46 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e1c-0000000DKCH-2RDB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:52:45 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-50b392f1846so12283861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029163; x=1774633963; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qSyQfSfJLUM1m6GIB6OZuhr10E00mTg3LMvm+W8lDOs=;
        b=RikjDn+oxYgmbP1FXh2StbITp+ew3dm8KF1szb+qIOmjZ9+0ITnFHTeoE89foDB/HW
         o1Dqs+LmYobDffy6pNTsdiNtqPkoOFnA+2BYjF+WXvKaNYg1b+DRTdwM04QHy+944mGb
         l6t/Jr5aLPWR9JW/1hC+Sl4MbU3DvKSqQp+ImoUB5wVV9Inv+ffu6EUB2Q8IlOVlIFWL
         LzDLOtTRevvEEnfusFCV9bUAOnXtCrn7lTPIPNTzNGNm9eRfPJVsiBQ+kTGpByyP0OVg
         M5rk9Bj2mmrks+aQUiPeApTHyv6dIom9fnXEw2A21Qd9dpxo148Rh0AMRgJS7xWNDTBG
         4ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029163; x=1774633963;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSyQfSfJLUM1m6GIB6OZuhr10E00mTg3LMvm+W8lDOs=;
        b=hxSph1YA5Khwrid7aCzgngilenxrU4shXMTgWGAMwCdg/7XsuDzDpuhqkE+t9eMoUm
         vUD/WdiSO2/w1jOlj3qauWCSER7tWZaMzcQmZ3buA4zpoFRoYmLl0TwS2M0xgoX/pUmf
         dVIamWYvYg0XVLBPbFo0QUHNqX1ScCUv2N+Lq9epJ1Bm8SUVkA6dmUNeoe7pt+gCmDBI
         ULsCxZSYquBTQ8WmZAkKhbCwwI9aLjYjd15d13HSGfOWE6/G7hGsDdjktYG8rHiMXdwh
         Hzc1dDkZ+/JfYs8vY5lrk5fD0iycsH4CiGO6JRvq1nDBqLdwbqy+RiulbKRyomPEWnCO
         9ZMA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yUzxTI0TKZbbXalyXs6LNT2gYUEM954HwnDA0Ovb0vsnMopNiD67tttz3x6GpDw7aA9I88v3SbjHhNszFmVw@lists.infradead.org
X-Gm-Message-State: AOJu0YwX1jZ+bv8w+6PK9XX4HdCXRwFHHqlgvl15FA4leYuJoshAKi26
	EIQulkTNYorsr6Al5DgDjheaKo6kCYDbpEqp4Bv2bkZPUDlWw7gb/wkenK4Wjy1+W0g=
X-Gm-Gg: ATEYQzzbjCJ8sbnpw64QxuUEZKIwI5gi5PtnM4pjJagX8wQiLJJ5V00sxFM88APuZkB
	V30QEI5NeaOmoY8NdFCKppI5Hwuh2brzXtmMI9pULO/6RWNYPk7OalYXTPc4licVE1bgM+RQZZ4
	oX54nkCul9jocwN4G5R91n0iXuQej1WjFPpM8TMCDJ5w5R8WTDh4am9N9hU8zepAkzCTKR91XY3
	umbRcXg8QXqzgcoqZHkZb5qiM4oSvzmxF6pKeQ/YmnsvUZ1QUyMssnqvmo9y+nmqOdJoMenoitn
	d01/6/Wxh9zlAJG3OwsEBbRUqJC0bdEn4WFQbNdWsXrL2lwnpCOXYro3clKALdwQU3Rtkq3AgnH
	Hup6ArVZVRDp78AiAOusyQZYRwaBE6mGGjllvkb6E8zsVDFW3K+YCG0ysdB6r6eRCNr7k67ZLGO
	05Qqw4V4jBi0P6dYXpA0Obqtrqpsam
X-Received: by 2002:a05:622a:354:b0:506:9bea:3229 with SMTP id d75a77b69052e-50b375d6367mr54273481cf.69.1774029163156;
        Fri, 20 Mar 2026 10:52:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d07d87sm24300111cf.12.2026.03.20.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:52:42 -0700 (PDT)
Message-ID: <b258faaf3bd1d105392dad009b7a90a135a04ad6.camel@ndufresne.ca>
Subject: Re: [PATCH v3 14/27] media: rockchip: rga: align stride to 4 bytes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 13:52:40 -0400
In-Reply-To: <20260127-spu-rga3-v3-14-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-14-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-93/oSoScL+hduou17nI9"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_105244_658858_6283824E 
X-CRM114-Status: GOOD (  19.79  )
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


--=-93/oSoScL+hduou17nI9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add an alignment setting to rga_hw to set the desired stride alignment.
> As the RGA2 register for the stride counts in word units, the code
> already divides the bytesperline value by 4 when writing it into the
> register. Therefore fix the alignment to a multiple of 4 to avoid
> potential off by one errors due from the division.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 11 ++=
++++-----
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A03 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index caf2424962351..16380be598e4a 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -580,6 +580,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index ac42e905a88cd..2920efe65082a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -234,10 +234,10 @@ static int rga_open(struct file *file)
> =C2=A0	ctx->in =3D def_frame;
> =C2=A0	ctx->out =3D def_frame;
> =C2=A0
> -	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->in.fmt->fourcc, def_width, def_height);
> -	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, def_width, def_height);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
> +				=C2=A0=C2=A0=C2=A0 def_width, def_height, rga->hw-
> >stride_alignment);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
> +				=C2=A0=C2=A0=C2=A0 def_width, def_height, rga->hw-
> >stride_alignment);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> =C2=A0		ret =3D -ERESTARTSYS;
> @@ -393,7 +393,8 @@ static int vidioc_try_fmt(struct file *file, void *pr=
iv,
> struct v4l2_format *f)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> =C2=A0	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height,
> &frmsize);
> -	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-
> >height);
> +	v4l2_fill_pixfmt_mp_aligned(pix_fmt, pix_fmt->pixelformat,
> +				=C2=A0=C2=A0=C2=A0 pix_fmt->width, pix_fmt->height, hw-
> >stride_alignment);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0
> =C2=A0	return 0;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 04aeb7b429523..38518146910a6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);

--=-93/oSoScL+hduou17nI9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2JaQAKCRDZQZRRKWBy
9H8xAP4ji1uPU6SE7iMSdNHZu8eGZY3VyZKoBhLFSX+IwNq3VAEAvKVWq1bPjoO7
EuZSodlv8pmIQjBM1Zwsfw6U8R7Exg4=
=SFI0
-----END PGP SIGNATURE-----

--=-93/oSoScL+hduou17nI9--

