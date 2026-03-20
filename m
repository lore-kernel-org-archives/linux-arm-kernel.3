Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4A21099B33
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNtWoywhtCaqax/SX3aYBQWP55sIgtAc6Qsui+MU2Nk=; b=4Ze3XO+5DVQYx6scNhQcvdiw7o
	YTLsw+IM9nnIXChrfvkW6gn9dIsAxTceBkXA4wlbLYM/wpGB45UBW/5vYgUofmUYZCkoJHYh7fg5n
	XyQkP8ZgDtbYA5Qxpvinifizko3uo9t/NzapssDSTpOIDNZDgS9j4C1OYwbS7XVpn03xg+/s6ZYhI
	X1ZgW0Xs6VQ71IW86FfCcxAkv0YSVvKo3vYUJGevZ6xu6pYztGYjHTg9raUpmKpb5YzdmyjtvQPwr
	0EkR+iGiW+J8wQGeDFjer6HNm3nvdHczj6m3tT8eLNjf+h1+JX8WZ/oS2SPp9t4Eq5Fw7h5OtU2Ji
	O8yW9Z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eNd-0000000DMN6-3dwo;
	Fri, 20 Mar 2026 18:15:29 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eNW-0000000DMLm-01cG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 18:15:25 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-89c4468686dso24117666d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774030520; x=1774635320; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TNtWoywhtCaqax/SX3aYBQWP55sIgtAc6Qsui+MU2Nk=;
        b=eo6O7s0Th2MQe88IfHw/ydBCn28iUgF4y63FkGxaj0iXcoSoAaSoABNvuxwRrDoxOS
         H84q3OBfu+aQ1dQpeiVw/8epz2KV45H71Bd6CPyf6p+QHm8ql0v+sJj6TAaxODlqTA3A
         mbPgzgK/RNQMEvUEu8dIUZCqwAo/+bNw60WQnNxj/ARuex+Ym8Go0vgWBq8vZJ3qnwaf
         Mk20oC00eJHkw4mbHDqXgvjeNb2bSKhQXOFa921x4+/W2lbGYJ8itxiMjDsaCfWC0jU+
         eseILaV9oDgS4Sy4TiRQTkPYzpWnyIyP6n5l6FMn2dASYCPz63NEZNFujtPFS16IBYUT
         BZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030520; x=1774635320;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNtWoywhtCaqax/SX3aYBQWP55sIgtAc6Qsui+MU2Nk=;
        b=DC9bE4CjiOSv5AHeg6X5OdUJXqHy9vXHx8in9YyBXLWM0xAoowUOU292zeWdw6U+1c
         LUqKWOrwE3PmlrMQXkw+2LbZgTYhT5Q+XsTMa+eOR3eedvCCcGcdJ1WRj82WyF7R02R6
         T01rggvlykwwn2z7RhlLghquH22jbLlGg44xzi2lU9kLHM25vXFHYFIjKNwph6YYYKX/
         NASfd1qdd3HKW4GMipU8lnymcrLHrIhCctqUeH+iNYwngKGpMjlLUU7T5iV1EilQPTiQ
         7wLEF/rktgZOm+0yOWNoGehXRJMPLrp/4CgbJUHcksDnRZJDw/X+FW8T4pCmtl+XnNtg
         Ki+g==
X-Forwarded-Encrypted: i=1; AJvYcCXO+syd7Rar57q7L7YrW07CEnPnCjB04k4paCnGgLKeS2KAtWbs3hdbnB9qamOAga9Rhq9utkRjdtW2aN0hT5US@lists.infradead.org
X-Gm-Message-State: AOJu0YyMWys5zsywUEo55OgG41QR5Ose+4GhHW1GRbAvq3z7gpAX37k1
	r8j2SP/vcOFDJ8+iV1JU0zWqieOE9qNkluelFsqrcscfHN1In3iydorkuQ3dVxX0FureoPSIs6n
	VSMgvC8Sogg==
X-Gm-Gg: ATEYQzydk+DyzvXeHIWlDntcWevAOpPCkHVLB17ycecnl300LpybWlbUcXgPnEDq/ai
	niE01sAQWFSEikFZW1hn3nUILy8AhT7OI6iYihiwWm5LcjnFjh6kjgW5DZOA5PpIPfGmV00gJ3N
	Vv0jJTtCxxX9VHDhyM19Ih4jsg7tr7N+R++Ul5Js7yA5nISNU7KYfstbxc7+QdCGrgJeO5lmqgg
	KxulixEmmgoaZ0y9y6uD3Qv6zuDcCkg+RuYUFNgAwQ78QwPxT60gQgo7ZI8vcUCjwu15JaEr2gu
	iUvjn0Yor0D8IzCORjrJZe7ANNT0qIHL76rY9YY9V+TGT69XOPulV0O1Qe+4j0C3SiLm6HczCNw
	pWDCNB8WAr1XYT4z5A7SD4xekELOXgzNqZMwtTB8mkzW3iET49pI7Wu2bzBMaLop87hw/EPzjzU
	07QCQfz+fpvAzEo1wjMFINl7/6z6/Q
X-Received: by 2002:a05:6214:411a:b0:89c:55c1:4234 with SMTP id 6a1803df08f44-89c859cb38dmr62852066d6.2.1774030519860;
        Fri, 20 Mar 2026 11:15:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85257c9bsm27152706d6.20.2026.03.20.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:15:19 -0700 (PDT)
Message-ID: <a3f116c4077fb32d7fce757c2013719ed34165b7.camel@ndufresne.ca>
Subject: Re: [PATCH v3 11/27] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
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
Date: Fri, 20 Mar 2026 14:15:16 -0400
In-Reply-To: <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-t3BfNkZ1XvbTv4YhgNLe"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_111523_488469_35B1F2FC 
X-CRM114-Status: GOOD (  19.69  )
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


--=-t3BfNkZ1XvbTv4YhgNLe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Avoid odd frame sizes for YUV formats, as they may cause undefined
> behavior. This is done in preparation for the RGA3, which hangs when the
> output format is set to 129x129 pixel YUV420 SP (NV12).
>=20
> This requirement is documented explicitly for the RGA3 in=C2=A0 section 5=
.6.3
> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
> x/y offsets and stride aligning requirements. But the vendor driver for
> the RGA2 also contains checks for the width and height to be aligned to
> 2 bytes.

Note that this patch does not apply cleanly anymore on media tree.

Nicolas

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index 21a3c6cd38dbc..4fa6adb10b7ee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv,
> struct v4l2_format *f)
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> +	struct v4l2_frmsize_stepwise frmsize =3D {
> +		.min_width =3D hw->min_width,
> +		.max_width =3D hw->max_width,
> +		.min_height =3D hw->min_height,
> +		.max_height =3D hw->max_height,
> +		.step_width =3D 1,
> +		.step_height =3D 1,
> +	};
> +
> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> +		frmsize.step_width =3D 2;
> +		frmsize.step_height =3D 2;
> +	}
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> =C2=A0		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv,
> struct v4l2_format *f)
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height,
> &frmsize);
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-
> >height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0

--=-t3BfNkZ1XvbTv4YhgNLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2OtAAKCRDZQZRRKWBy
9MmQAQCrq5Bi/y1zl0zHwVIxfCHjsZqGNHwbHIIvV4A/z7/XcAD9G0Q42e3zcsrV
sPuu16CRCrqR+Iovo2HHd2w2m9G1xQc=
=mCI6
-----END PGP SIGNATURE-----

--=-t3BfNkZ1XvbTv4YhgNLe--

