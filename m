Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C565E776C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiGYt2Trw6aOY7rbzO3mfzoHGdriI8ME2f3sKP9W65A=; b=fikTkITNBoYm4K2fL029QVsVWO
	AonSub1BVk5dej/wo8cdGsnk1y9+5KkY780O1g4eWxim/9m7672A0nprI3cEyTVrUVdJidDPsGqHP
	vNLYey3ochQ3v3RE8PBAdYVeUL/ykkL4dyrwrmfVQCrBFDlNOAFvBBkqvnRxZINjzb8XT7UkPb+j0
	05YPOwtYv/8LgMuFApdDNHkawIF0D5/JLJst2H/3Db6isd2pj0yRIhNTYrdx90ydFz5w9MXNRBtaU
	Z5+rCUxy2H991gsMGY/T8LKJpes5SSpHEMD7N+wzSG7qXlik6106HWDUbv2N6IhvSIc87C1QR+EmT
	ewnLA3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRMS-0000000HC97-364K;
	Wed, 24 Dec 2025 16:05:16 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRMO-0000000HC8J-3NBj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:05:13 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-940c539de8fso3495483241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766592311; x=1767197111; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UiGYt2Trw6aOY7rbzO3mfzoHGdriI8ME2f3sKP9W65A=;
        b=LXjJKGK93U5t2CtrNprrbVB8au+ctAgw8OZq9p1mCwcArsdwWz5z8KC+HP45M4n268
         OPbwJSwyXJHcla/akhkUVQ5HNkLcK4jP4wWiGDlJNzpFXPaTWFIIUH6WMQRCSS73Fhqk
         nQYb6vNj2c6UJCSWGNV1hufuSqWU3qto5lzsmMhMBKTDCMr48mKLC0073Ndnla+dczMC
         2UiE0JCihKOmyUB07aVmeLg19y5ZTgqGVCPBbHD9GZN1th/n4+06pDgworewrVP8bQ4C
         9l8duImhRARSRA9MqSuE5iHw5Q6hfxR1gRSk/lAzHRnDleznZoj1629MQT5/shXtfKKv
         UFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766592311; x=1767197111;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiGYt2Trw6aOY7rbzO3mfzoHGdriI8ME2f3sKP9W65A=;
        b=PyqUgTQhbHI65/63LdkC9dW2CTdpJ2Fs96mSY6I0Qx8IkbgWXIcMympx5Q17rrm15s
         9sjsSmAVQ6PL2GcstBYFIlltmW+1uUXwPejuD7QCQuOs3SGaEN95eHbAmXffCi4I2tQA
         m2O1rO64zorKBga8xsLJi8YQy8j5pxWDhi6k5Jb2v94AttoXuzad5huxTrt5PxtHZ6nm
         9UIPGE71QKzsvKQe1HhJ6aHSTjyvgfv+FfYS3waw1aBY2G6AHXMEkIOnFKxFTevfBEug
         N50+zTgukaB7OKDAaE0RedTiW6CipYPnqaADpmXZI811joZQ5qPrx1gYHFYEaFAbC/59
         BZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDFeMLgSqH2ordxWoFtk/PpINToWcXJ3Oa7fxuZ0pyol+jg8XdN3GluIyK/O7YyX0FJtsK0MYMmpgz6GiHSG1J@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2sUUB+IMuJ+q1jAjRQzFf+GfCzWrSAFhQBeEoAX3s8Lujlgfs
	0DpfR7rSfmWS6flW6r6fu1DtcKCVEtOcfsVYVyGMyXfWdBx8UiiQMoasMJ1ZZnMyPFdTLablQ4T
	x7TUxRaw=
X-Gm-Gg: AY/fxX45fdpQZjSISfoFLsiaS5uyP77oFPUeL6KXshBXu+J2a09Nn7hseJJGw45UZzj
	RvU01KGZLLTXZlcACJ28DcsX6r76CFz1zKSyYp/VBzTjU9s0u3Sq3d789xdsANP3y8z51KZgrx/
	HFcZw85oknOkUojDMxsHUQ+zlAl3eYumGr2+tlK0W3bsbnETyxCN3IDjqSFL6W5g3RSranflpro
	gSQrUROOfs6WzecjpxLuYCLUW1C20+aKsEAEz3i1+BlBHLEzYLWbEgZuDEBYOOeMcYzfJl7tFhX
	KJWAxxqGCCA3+jixODyUVQIob7iqfPJ9qVbixgoyT9COBBLtNZlmqCfxNiHlfspTansluB3YSJM
	yZ8CsXc+2J9PnafpRimlrUkmxHSdXH5ODcCfQ9EmIKCQSr+PkXxydDh4n38nDrvG/RTqMSS3ZIC
	AdMAn1V8ZgXfzs5nrf
X-Google-Smtp-Source: AGHT+IGebZddQ8VX3LjiShOfzCrPFeoXWdSBlfpw1bc3/JHloqsxtB5PQ9x3Qd+zgdsLgdkWbLrorg==
X-Received: by 2002:a05:620a:2a07:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8c08f67f576mr2769968885a.34.1766591779394;
        Wed, 24 Dec 2025 07:56:19 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783657sm1518342885a.1.2025.12.24.07.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:56:18 -0800 (PST)
Message-ID: <b84b59d5b190edfce326df824f453464c00812ac.camel@ndufresne.ca>
Subject: Re: [PATCH v2 17/22] media: rockchip: rga: remove stride from
 rga_frame
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
Date: Wed, 24 Dec 2025 10:56:17 -0500
In-Reply-To: <20251203-spu-rga3-v2-17-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-17-989a67947f71@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ealEtQA9iLKBqBXgu9KM"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_080512_861117_844E24D2 
X-CRM114-Status: GOOD (  19.67  )
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


--=-ealEtQA9iLKBqBXgu9KM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Remove the stride variable from rga_frame. Despite the comment it
> didn't involve any calculation and is just a copy of the
> plane_fmt[0].bytesperline value. Therefore avoid this struct member
> and use the bytesperline value directly in the places where it is
> required.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

This I believe was the only user of fmt->x_div / fmt->y_div, please cleanup=
 the
structure definition.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 20 ++++++++++++-----=
---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 +----
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 3 ---
> =C2=A03 files changed, 13 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index fb0389ae8e132..4dee33d8f7206 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -43,7 +43,7 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_=
addrs
> *addrs,
> =C2=A0	struct rga_corners_addrs corner_addrs;
> =C2=A0	struct rga_addrs *lt, *lb, *rt, *rb;
> =C2=A0	unsigned int x_div =3D 0,
> -		=C2=A0=C2=A0=C2=A0=C2=A0 y_div =3D 0, uv_stride =3D 0, pixel_width =3D=
 0;
> +		=C2=A0=C2=A0=C2=A0=C2=A0 y_div =3D 0, y_stride =3D 0, uv_stride =3D 0,=
 pixel_width =3D 0;
> =C2=A0
> =C2=A0	lt =3D &corner_addrs.left_top;
> =C2=A0	lb =3D &corner_addrs.left_bottom;
> @@ -52,14 +52,15 @@ rga_get_corner_addrs(struct rga_frame *frm, struct
> rga_addrs *addrs,
> =C2=A0
> =C2=A0	x_div =3D frm->fmt->x_div;
> =C2=A0	y_div =3D frm->fmt->y_div;
> -	uv_stride =3D frm->stride / x_div;
> -	pixel_width =3D frm->stride / frm->pix.width;
> +	y_stride =3D frm->pix.plane_fmt[0].bytesperline;
> +	uv_stride =3D y_stride / x_div;
> +	pixel_width =3D y_stride / frm->pix.width;
> =C2=A0
> -	lt->y_addr =3D addrs->y_addr + y * frm->stride + x * pixel_width;
> +	lt->y_addr =3D addrs->y_addr + y * y_stride + x * pixel_width;
> =C2=A0	lt->u_addr =3D addrs->u_addr + (y / y_div) * uv_stride + x / x_div=
;
> =C2=A0	lt->v_addr =3D addrs->v_addr + (y / y_div) * uv_stride + x / x_div=
;
> =C2=A0
> -	lb->y_addr =3D lt->y_addr + (h - 1) * frm->stride;
> +	lb->y_addr =3D lt->y_addr + (h - 1) * y_stride;
> =C2=A0	lb->u_addr =3D lt->u_addr + (h / y_div - 1) * uv_stride;
> =C2=A0	lb->v_addr =3D lt->v_addr + (h / y_div - 1) * uv_stride;
> =C2=A0
> @@ -160,6 +161,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ct=
x)
> =C2=A0	union rga_src_act_info src_act_info;
> =C2=A0	union rga_dst_vir_info dst_vir_info;
> =C2=A0	union rga_dst_act_info dst_act_info;
> +	u32 in_stride, out_stride;
> =C2=A0
> =C2=A0	src_h =3D ctx->in.crop.height;
> =C2=A0	src_w =3D ctx->in.crop.width;
> @@ -282,13 +284,15 @@ static void rga_cmd_set_trans_info(struct rga_ctx *=
ctx)
> =C2=A0	 * Calculate the framebuffer virtual strides and active size,
> =C2=A0	 * note that the step of vir_stride / vir_width is 4 byte words
> =C2=A0	 */
> -	src_vir_info.data.vir_stride =3D ctx->in.stride >> 2;
> -	src_vir_info.data.vir_width =3D ctx->in.stride >> 2;
> +	in_stride =3D ctx->in.pix.plane_fmt[0].bytesperline;
> +	src_vir_info.data.vir_stride =3D in_stride >> 2;
> +	src_vir_info.data.vir_width =3D in_stride >> 2;
> =C2=A0
> =C2=A0	src_act_info.data.act_height =3D src_h - 1;
> =C2=A0	src_act_info.data.act_width =3D src_w - 1;
> =C2=A0
> -	dst_vir_info.data.vir_stride =3D ctx->out.stride >> 2;
> +	out_stride =3D ctx->out.pix.plane_fmt[0].bytesperline;
> +	dst_vir_info.data.vir_stride =3D out_stride >> 2;
> =C2=A0	dst_act_info.data.act_height =3D dst_h - 1;
> =C2=A0	dst_act_info.data.act_width =3D dst_w - 1;
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index 0d7b0bcac950e..7e30fafb25fab 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -220,8 +220,6 @@ static int rga_open(struct file *file)
> =C2=A0		.fmt =3D &rga->hw->formats[0],
> =C2=A0	};
> =C2=A0
> -	def_frame.stride =3D (def_width * def_frame.fmt->depth) >> 3;
> -
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> =C2=A0		return -ENOMEM;
> @@ -428,7 +426,6 @@ static int vidioc_s_fmt(struct file *file, void *priv=
,
> struct v4l2_format *f)
> =C2=A0	if (IS_ERR(frm))
> =C2=A0		return PTR_ERR(frm);
> =C2=A0	frm->fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> -	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> =C2=A0	/* Reset crop settings */
> =C2=A0	frm->crop.left =3D 0;
> @@ -442,7 +439,7 @@ static int vidioc_s_fmt(struct file *file, void *priv=
,
> struct v4l2_format *f)
> =C2=A0		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
> =C2=A0		=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
> =C2=A0		=C2=A0 &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
> -		=C2=A0 frm->stride);
> +		=C2=A0 pix_fmt->plane_fmt[0].bytesperline);
> =C2=A0
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++) {
> =C2=A0		v4l2_dbg(debug, 1, &rga->v4l2_dev,
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 466d568b9e614..a7f891b94a478 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -34,9 +34,6 @@ struct rga_frame {
> =C2=A0	/* Image format */
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0	struct v4l2_pix_format_mplane pix;
> -
> -	/* Variables that can calculated once and reused */
> -	u32 stride;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_dma_desc {

--=-ealEtQA9iLKBqBXgu9KM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwNIQAKCRDZQZRRKWBy
9NfgAQCY3P1Jm+Z2ETGJw3X0IdCCoCwmMgri4PEtpzjWn1gDGwEAkezdHOTz/8Nj
QGqVH2v2tAZfHZCqeogKR1262K1oxw8=
=bH0x
-----END PGP SIGNATURE-----

--=-ealEtQA9iLKBqBXgu9KM--

