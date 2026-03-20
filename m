Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90671099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b7bHDEHMNg+ZOh92aXYeYMSzd5GgyCONDythGrcDzA=; b=k1dSNB7SmCnKBlGrVOOUGg4PBE
	r9ZUjh238G9n9+13VQogIdId4meCy6LyCdiE1NHhVhowrLOSBigbHaRGlWy9kcf/ORXbD7/EKqA8c
	ck+AkfOJoXgvRT1qkGHbbJ6TR8LnPPRBaHuAJf/84pWnuVxZl/Ti4I9ZbfKU5SDIQ5dpkXezi+qpy
	HK/kV8IxigylpwRyEQvHTTX5oeGhHewVdQtOOpfR2gWV/MEeyWXpfwUx9vHKgCeIxn2XtXQYJy/IO
	ZsJ9i6dmHcwh331zK5R6H0PYtLWi55aBZKSQv6soFN5dWeWOBHVM9rYL4XB1TXUiPD5pW9GnBWwpy
	AL4XzDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsF-0000000DHi6-01Su;
	Fri, 20 Mar 2026 17:43:03 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsB-0000000DHh9-1vWD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:00 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cfc137464dso204033485a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028578; x=1774633378; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4b7bHDEHMNg+ZOh92aXYeYMSzd5GgyCONDythGrcDzA=;
        b=htMTxA86opxGW2Hp2SK5ss906LY2k789Z4I7dQB1Iik0iDZcLsw5ruELf6QmgZGQgb
         YU0yNp1B1q4yeVj4CcnsH03Wn3ELT2r/mFtqbAvwYaFzg5bueCbFcMGBYqjyGzosuLg5
         dG+NvsZL8varDnQtPYGVft+3+oG9U7xmkEkUyo79f3JHoVho0pUYkJ0VxxWRulwO2awF
         NB+vR0EVuRcO6qL7yaPROcXWD4DwiBHs7gTKUO1k6O6zKlQ4bshDCybncEu/fP0y0Yrp
         zSqdXqxA8PB8jkE9Nxny4mVqyuNNRhNwY8aaAyUZTJe2yTCMVwBlbCDRb2piC6edlMJS
         qbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028578; x=1774633378;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4b7bHDEHMNg+ZOh92aXYeYMSzd5GgyCONDythGrcDzA=;
        b=Mi5ULd1IzLM8eFwvboYyM56Ekpc+L8wVfLjhUCe9HbNQMDlbdNxOn6VWM1ecPeXe/L
         vsSlC7hJSKQ/CwSIulFrODVIzl+fY4FVz1Hc+U5pqqNTapaSwVwhfUYw5lFVa2ls4cUA
         NpxMDwhGtpF9JnaX3BKwPfMUXfCCbUsiF/LFP80cDHYIfD1TbRjjH98lLZFs2QxJIGmv
         FDSODGy8UOaXEssTRTObKOw8ES4Cut9z3sc/D8PDW+OQgl7bjNoSzPu0rBRqebtnQ5ON
         ZCC1FGBJi3IYOHJr9Nk16c5KT0V6tH3opDtbty9QsdCfiAb/EdxGlK1LWvHjW5CNWlBk
         aXZg==
X-Forwarded-Encrypted: i=1; AJvYcCWsDYdu3wLSdfNVoVhulTV6qQ7YagYUGNDMN1cxUIKRDEr7OP5jG1VrlF5cI5HuG8Gc6mVj1Mvp/dDDukx/AkeI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz0t0WRGsAj/xpKWDn4E6sUJUj0nBPRJ11feeQOKOpd8R0YSPd
	jXVCV3PwgJrHvrbyhDL9xz3kDc84fWY3UQxIZJUU1dyl8uywi/UDV7/gnUthEYk9ptk=
X-Gm-Gg: ATEYQzwUOBN9DgM09CGFmpp36baAGcBBnvR5beZKvUhl2mTtbbO6kQ1GMpqI2d58NNz
	XvHvATtcuDotOq/Mekqc/tXQnvT830aqapGiJDWDAuAgT/31xh9NmgzytL9JvTxbpCBC7Z12WKU
	3qa2t/Jfa5MOilHn24b6Xzd0eETpJrQc0mpsuzvDO0DIO9/ALkRbydaj5OQLpiNzPsIeqER3ROG
	ZpUi+PcuAXsiCxTN5y9iz8W50l6sLjqeMArbSCyxxrP1m7BeuxO/FWKQhTZ1c0CGL1B6fbTPJ7n
	WgJkdXM2jAPEecA2E2mqCChtRzcEA1/VRsWFuXikeAnl6BVvcYke0fN8zFK1mVx/3s8wgRS/WAA
	0hULvY7fLCtFtLae2tFtT+hSnWp76oUzw7RNNmlFP2W0ZCSaqEgxlUENjdX0Jx8RIP83lrCQWXz
	MMFtsfTIOVFcTrwQqmSM7DYywu14hm
X-Received: by 2002:a05:620a:4606:b0:8cd:b2e9:7d88 with SMTP id af79cd13be357-8cfc7f4df71mr539139685a.44.1774028577988;
        Fri, 20 Mar 2026 10:42:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5d128sm210466385a.8.2026.03.20.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:42:57 -0700 (PDT)
Message-ID: <baeafc597ae5b49e34481c4c2704ec242344ffe4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 09/27] media: rockchip: rga: announce and sync
 colorimetry
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
Date: Fri, 20 Mar 2026 13:42:56 -0400
In-Reply-To: <20260127-spu-rga3-v3-9-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-9-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oe7RpPV93eR3PfJ/4+yO"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104259_539043_EA9B0C2D 
X-CRM114-Status: GOOD (  20.96  )
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


--=-oe7RpPV93eR3PfJ/4+yO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Announce the capability to adjust the quantization and ycbcr_enc on the
> capture side and check if the SET_CSC flag is set when the colorimetry
> is changed. Furthermore copy the colorimetry from the output to the
> capture side to fix the currently failing v4l2-compliance tests, which
> expect exactly this behavior.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 37 ++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 20d1d9cb7625d..cf9d5702598fa 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *=
priv, struct v4l2_fmtdesc *f
> =C2=A0	fmt =3D &formats[f->index];
> =C2=A0	f->pixelformat =3D fmt->fourcc;
> =C2=A0
> +	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	=C2=A0=C2=A0=C2=A0 f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return 0;
> +
> +	/* allow changing the quantization and xfer func for YUV formats */
> +	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +		f->flags |=3D V4L2_FMT_FLAG_CSC_QUANTIZATION |
> +			=C2=A0=C2=A0=C2=A0 V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
> =C2=A0static int vidioc_try_fmt(struct file *file, void *priv, struct v4l=
2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> +	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		const struct rga_frame *frm;
> +
> +		frm =3D rga_get_frame(ctx, f->type);
> +		if (IS_ERR(frm))
> +			return PTR_ERR(frm);
> +
> +		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +			pix_fmt->quantization =3D frm->pix.quantization;
> +			pix_fmt->ycbcr_enc =3D frm->pix.ycbcr_enc;
> +		}
> +		/* disallow values not announced in vidioc_enum_fmt */
> +		pix_fmt->colorspace =3D frm->pix.colorspace;
> +		pix_fmt->xfer_func =3D frm->pix.xfer_func;
> +	}
> +
> =C2=A0	fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &formats[0];
> @@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
> =C2=A0	frm->fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> +	/*
> +	 * Copy colorimetry from output to capture as required by the
> +	 * v4l2-compliance tests
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		ctx->out.pix.colorspace =3D pix_fmt->colorspace;
> +		ctx->out.pix.ycbcr_enc =3D pix_fmt->ycbcr_enc;
> +		ctx->out.pix.quantization =3D pix_fmt->quantization;
> +		ctx->out.pix.xfer_func =3D pix_fmt->xfer_func;
> +	}
> +
> =C2=A0	/* Reset crop settings */
> =C2=A0	frm->crop.left =3D 0;
> =C2=A0	frm->crop.top =3D 0;

--=-oe7RpPV93eR3PfJ/4+yO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2HIAAKCRDZQZRRKWBy
9Px4AQChjkhhOucaVISHeRAYH5X7ODkjIye5JGejpkeHL63PSQEAk4KAcyPF14o8
SuHYOv4/KXqhuyvwujnnCWprB/iW7QE=
=HbxP
-----END PGP SIGNATURE-----

--=-oe7RpPV93eR3PfJ/4+yO--

