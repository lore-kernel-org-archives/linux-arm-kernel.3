Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE68E776C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8GfNqjtHl5a4gr/qUWpYa+PaGpekfTXC3faii3jufs=; b=kmyzMJWWXc1pu5Pojs6xGLBzvE
	dCv2pZJh28sfG8TynoiwX+5SioT5uV+kEIp3ZHiPh2i9rKPlU7y1KI85A75ggxTXUy9OcC2KvLcSW
	9V+MOFTbQcKDEFDYmhj+NQ8JVnRBjzHrebnA7QWgjdPAze1WmmG350dKAa94xP4eOMP3zXGh1NDLm
	cCLIL+mxAWx0HYwNhOmCrlbsekKjEQEFaPzY844YoT9gq0PuNeMKuyQnd/+CFeZp/vaz0dXvmzFaq
	Oqnf68ZlKOODx8/xczQYYR8jN8dBwyRnAnt0MIaCtih8bEqYNke2A1ySM4Z2EJ0Y26X+tKdxh+TJq
	zCCQI8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRIi-0000000HBEW-1qVw;
	Wed, 24 Dec 2025 16:01:24 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRI0-0000000HB7S-2yXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:01:11 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ee1939e70bso59573771cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 08:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766592039; x=1767196839; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8GfNqjtHl5a4gr/qUWpYa+PaGpekfTXC3faii3jufs=;
        b=Xehkv5nqse25PbJrMns2KETU/LjB2e8wPyaJhRBft5QZhD/LPeZhhFYuhBYrKjzA/o
         2mlKsGEjWuT22uv7tXWdCcHGKhIB9LpEZnUsdvpzc04jfyvmC5Uqm+bJaO8Y6ZA/9Poc
         2fT9JgXwmSY3pXfqXCtI6w6LzXWzHG0rcpyGgX3u1KA1jHK3RnNseanpzbGznkd02iW0
         UyrFgSH730CIDDgrefWcukj9sgWiqvePdZ4qXjERCDAGRL2p4g9sFL08lcbwe7P9TaqV
         sLBUejS5jqsWBQeVjAcjtaV9izPzWtX6SUsmTII5hTnctvKMBxzZF7c+sG2Tw2wxxUvn
         HhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766592039; x=1767196839;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8GfNqjtHl5a4gr/qUWpYa+PaGpekfTXC3faii3jufs=;
        b=so77Gm3BCfkHPHPK0OLCV2po0EXeMqMQDYNA7g2oIYL4oJT0ShAkZko23jd6kcf8Zi
         0COMM3nownQ8zRsD6TtmeDENKfnXhajPSN6gVM6X4oTGApjyN5QvUMC6ZrsZXGSYAuK2
         9l0iyrH4U/mPLFxUdFr+HaFcbdLHg0e+9JW9/NRmo6Spqyrq5QNpxcpOohLGNBNVhw56
         HC+mTULvskGQipal+Glovu9e6xXTR3ZDLcUayfBHFgaJ/UJlAb+6KxESmE5gWj5hZ08I
         k7Vuetoy2tYHwq6oL6OCb5h2gmYuROHAFiUVJhQyL5fRMYNiVq/uG8AwrNZKeKx9zN8l
         kf1g==
X-Forwarded-Encrypted: i=1; AJvYcCVBCajPSpkpB6IsNu75Q2coQK8kPCsF8VEfaGydCEzxkI97iTdG7dnCPmEF7nyFVSG4yIABq++Vm1hMFJrYasuv@lists.infradead.org
X-Gm-Message-State: AOJu0YyTM2t+ulnEH4bDnWErzllrQfkMq87QGUCqdBPWSWsoDX0HOIXv
	TD3yrR3j576bmkNDJByBnNzMAVd+A/WaaQuKx2kQI2i/Lub7ohZotjrMyySwgddjRpc=
X-Gm-Gg: AY/fxX7YgoJmt325zISTjlg+U1w9NgDYIB/kIAmXbuY/QIKvpoOppSgk30losJ1cCeZ
	KWdBtnAWi125foNYMZNJC8GHwUi+rcYzknxPpIVTiN8AS5ZnhU1Ptc9nV+5bdtOteyOvh0/DN1U
	jiN8WzQvGsLKC6rk30+iRhZaI2OmT1H7oTFIx7JysmoMmML7dI4glNayGnLI1Cr17Akv7H1tB5r
	YBZ++FqL5YIH2Nnn82Ac7+oHjSQNLR+wA3u1PzxZWYt/bM4UnH4HnzyAlgh0Q35gfLD8wr+LBZF
	oOw+iavxNM5zv0lYCTXk9ltPJzCErS87tEVnHf9+ujOz/eWJTX1xhRzTi+gZgiXYC4916/3SimK
	nDah5jDaORg2/lQEzmcM4XOA1Rrxz7BxzpIq+DZKMrit//lXhpv7T+fUiUnJy/KkxRSFo6HkGYL
	KZUiGJ79coV5Hyaijx
X-Google-Smtp-Source: AGHT+IFIZF2H0HnNmQiOGLnklkzBl2kWriBVm1AimimcWBGx+3cCd1NWu6NStzB4+jVjvScDMa6lZg==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr277964811cf.39.1766592039264;
        Wed, 24 Dec 2025 08:00:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a544ba9sm128813236d6.50.2025.12.24.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:00:38 -0800 (PST)
Message-ID: <a5abd83b62220e86fd5ce627aa67c7236efb57e3.camel@ndufresne.ca>
Subject: Re: [PATCH v2 19/22] media: rockchip: rga: add feature flags
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
Date: Wed, 24 Dec 2025 11:00:37 -0500
In-Reply-To: <20251203-spu-rga3-v2-19-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-19-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-ZZ4kMHEmgfVAsTpDFN2e"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_080106_661350_7F0E0B24 
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


--=-ZZ4kMHEmgfVAsTpDFN2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> In preparation to the RGA3 addition add feature flags, which can limit
> the exposed feature set of the video device, like rotating or selection
> support. This is necessary as the RGA3 doesn't initially implement the
> full feature set currently exposed by the driver.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 4 ++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 23 ++=
+++++++++++++--------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 7 +++++++
> =C2=A03 files changed, 26 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index a868a34a1452e..0d1cf911af0d5 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -658,6 +658,10 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_height =3D MAX_HEIGHT,
> =C2=A0	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> +	.features =3D RGA_FEATURE_FLIP
> +		=C2=A0 | RGA_FEATURE_ROTATE
> +		=C2=A0 | RGA_FEATURE_BG_COLOR
> +		=C2=A0 | RGA_FEATURE_SELECTION,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> =C2=A0	.start =3D rga_hw_start,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index c991cc64b4b7f..3958e71b8987d 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -162,17 +162,21 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =C2=A0
> =C2=A0	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
> =C2=A0
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			=C2=A0 V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (rga->hw->features & RGA_FEATURE_FLIP) {
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				=C2=A0 V4L2_CID_HFLIP, 0, 1, 1, 0);
> =C2=A0
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			=C2=A0 V4L2_CID_VFLIP, 0, 1, 1, 0);
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				=C2=A0 V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	}
> =C2=A0
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			=C2=A0 V4L2_CID_ROTATE, 0, 270, 90, 0);
> +	if (rga->hw->features & RGA_FEATURE_ROTATE)
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				=C2=A0 V4L2_CID_ROTATE, 0, 270, 90, 0);
> =C2=A0
> -	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> -			=C2=A0 V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
> +	if (rga->hw->features & RGA_FEATURE_BG_COLOR)
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
> +				=C2=A0 V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
> =C2=A0
> =C2=A0	if (ctx->ctrl_handler.error) {
> =C2=A0		int err =3D ctx->ctrl_handler.error;
> @@ -489,6 +493,9 @@ static int vidioc_s_selection(struct file *file, void
> *priv,
> =C2=A0	struct rga_frame *f;
> =C2=A0	int ret =3D 0;
> =C2=A0
> +	if (!(rga->hw->features & RGA_FEATURE_SELECTION))
> +		return -EINVAL;
> +
> =C2=A0	f =3D rga_get_frame(ctx, s->type);
> =C2=A0	if (IS_ERR(f))
> =C2=A0		return PTR_ERR(f);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 980f70f842317..b9c75b5fda4dc 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef __RGA_H__
> =C2=A0#define __RGA_H__
> =C2=A0
> +#include <linux/bits.h>
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> @@ -132,6 +133,11 @@ static inline void rga_mod(struct rockchip_rga *rga,=
 u32
> reg, u32 val, u32 mask)
> =C2=A0	rga_write(rga, reg, temp);
> =C2=A0};
> =C2=A0
> +#define RGA_FEATURE_FLIP	BIT(0)
> +#define RGA_FEATURE_ROTATE	BIT(1)
> +#define RGA_FEATURE_BG_COLOR	BIT(2)
> +#define RGA_FEATURE_SELECTION	BIT(3)
> +
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> =C2=A0	bool has_internal_iommu;
> @@ -140,6 +146,7 @@ struct rga_hw {
> =C2=A0	u32 max_width, max_height;
> =C2=A0	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> +	u8 features;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);
> =C2=A0	void (*start)(struct rockchip_rga *rga,

--=-ZZ4kMHEmgfVAsTpDFN2e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwOJQAKCRDZQZRRKWBy
9BMlAP9wheqN0kV9AGOEcLeIGF3jdIvsKyUQd/a18l7/P2R5GgEA2QE1kyL14SMl
UIwibdNY/yvhzXGSYKqEEEF8yKlUfwo=
=K5xI
-----END PGP SIGNATURE-----

--=-ZZ4kMHEmgfVAsTpDFN2e--

