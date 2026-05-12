Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E6ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1GJZ3i503zdsckWYgIltPX4s+TXFKGqeqpxW9ex+gs=; b=X6fIcF5gsxeLCAa7AsrVGO3gnp
	ResRv8cXqkjMbFrFS8gYXkGlSRxcU06kwTkND407bX4GSi5DJFOX0TureDrxsmMTMrbuYkBDFuW/L
	5niIMrqAIk4v+ldn94en4DViHnIrRybRD1aYVbFcSXfjAbi1DQEu5H3tTfys/rPCZ5tLnVRGguvSj
	daC4v6Nu8BDTh0fJRehqTi9I1PB+N2iUjXB3A7OqY6z45h5yVwQzLrM3onjt4H2xHvQwFrvN8CsCS
	GNLrNF+32zzc2rP2ygWZ/RIqmA9qI60FYQIa3mxonVlqEY8TsrlJpYo4UVVZFDGigAd0eNvUn5hsf
	+739nQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMojv-0000000HA7i-3hSN;
	Tue, 12 May 2026 15:09:44 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMojs-0000000HA6U-2DvP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:09:42 +0000
Received: by mail-qt1-x844.google.com with SMTP id d75a77b69052e-51306c36c3eso51720631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778598579; x=1779203379; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e1GJZ3i503zdsckWYgIltPX4s+TXFKGqeqpxW9ex+gs=;
        b=NrTLTUeY/m9CFrQmIZLz7FvpF7dhAWIS6gyVV5rIjqx+JKxGySwAyDF334yY+gKM64
         q/oB7O8D/2auAMAxR7NP1iqMlm6Y49/imwkHN8od4a9tiaOAagBmDajtAgTtzpzq9io2
         G6iRgO3n5N3CWVhEszmLHtEz33My3zyrzGUcNWGMK1ZeokgIlZHa3X4m7Oru02AuD3qg
         R2af7ZTp1F9vBPej9Jv1VlDmRDnQPqQmIeclXX0AXoo4p74NLfd8lCwkLN3qg5o9wP9P
         ztrZTRwCVqJ+J1gJOGtcAUY3W6Y+t3w0deiM8mAK65cJBrS9CZBGqQ3kjFg5ZGXI3KzQ
         tP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598579; x=1779203379;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1GJZ3i503zdsckWYgIltPX4s+TXFKGqeqpxW9ex+gs=;
        b=lYxcni066Nv1plVG28XlE1pmC9jtpKzD7h9CjmJs4LQhXMpIdNCPKNiyRwd4w9H+N6
         jzDpkKGth04d59Iz512Hl42l8dpLprEJ4PlX9LgycefnJeoycuWyp6DTXoLP9js5qA2t
         sUTgQTbSHcMW9KtKuxNPm2EQEqdsMBOLACOfBuLFH6tHQ/Tk77DHTVaY4Lvae3qNEqPm
         OeHcoLC/ywdIwZW6/CmBGyHufI2ScLqxAS2OrM2iOCU551p5wbtewkop5v0+7JAoiPEb
         Uisn9K2tD1GJSFRwuQ4YCTvMRfdzdorjr4rxvF5tV9NPQj9/eSpk7g/IOpChCiqJPDYC
         z7OA==
X-Forwarded-Encrypted: i=1; AFNElJ8tcWHaR8hgYeznHrogZF78QfQEHpH57pgxqzHjFI0m5UA9B0980JeC7no4ChZpGYEgOAmdDjZL84KTKIk7MFbi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyj1NkeMwFIcttBt/uBIjRFaHs2EwjV18MN8MMNknzyQgxkYOL
	4EbKY1KNACXQ/xFDjYTcOVlqPYEfJDeSbRH+0NPrJnMbXhvOlr8/vPgDGVIOza+8YoQ=
X-Gm-Gg: Acq92OE+3t+Rq0EhNfL84XM1SvngGe/eYWuy3VcZs++jZyvT7r9mr3KWD1Uch0p1XXM
	9EvI3KAO/HEiG18AHB0ukz3UomTOoq/4tT33LOGQNG+CVTZjKfAIu88YQlUB9MupShaa41GtBSa
	5ei0uMc01qJPxs9OV+bOtchnLIYd6gr3UZvdA/gmHPsraNHUFMh6RA2m1I4VEDL6hEEDeJY+PGS
	KN/qyUjNYDiprGWZn42YgiF28D6fVxZVHIYBwa+bPMy1NgYnrRMzvQo4DYw6SCJlFVeK4W0j4qa
	X8uUianhQA0YVlxBGL5UzRZIWdMm+3VARMhE3iCy7zW4PS+FP1C6Eo2z4OAvxJE4z8oxLI/ZsXp
	nI3/scDFOKJP72lfsVQvBLBns3HBBEEh00NJCbuo7IzBhTMj0/kOx+r9SA4R95lH+sRHvKSpf69
	Xl57OkJkCNU/xX/H2KAKTNUN+JbGxy8rJqPq1aseg=
X-Received: by 2002:a05:622a:341:b0:510:138e:b83c with SMTP id d75a77b69052e-514d20e0341mr47122861cf.33.1778598578821;
        Tue, 12 May 2026 08:09:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e656452sm136800971cf.7.2026.05.12.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:09:37 -0700 (PDT)
Message-ID: <b354afdfd28ec3736791755d9ce8cae49a744a96.camel@ndufresne.ca>
Subject: Re: [PATCH v5 12/29] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Tue, 12 May 2026 11:09:35 -0400
In-Reply-To: <e6d562e7-a9d2-4a1a-a139-c6e05eb4aaef@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
	 <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
	 <e6d562e7-a9d2-4a1a-a139-c6e05eb4aaef@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-qN1+gvfnAtUxv/ubnzMi"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_080940_590221_B233EC00 
X-CRM114-Status: GOOD (  33.45  )
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


--=-qN1+gvfnAtUxv/ubnzMi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 mai 2026 =C3=A0 16:56 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 5/8/26 11:18 PM, Nicolas Dufresne wrote:
> > Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9cr=
it=C2=A0:
> > > Avoid odd frame sizes for YUV formats, as they may cause undefined
> > > behavior. This is done in preparation for the RGA3, which hangs when =
the
> > > output format is set to 129x129 pixel YUV420 SP (NV12).
> > >=20
> > > This requirement is documented explicitly for the RGA3 in=C2=A0 secti=
on 5.6.3
> > > of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> > > (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions th=
e
> > > x/y offsets and stride aligning requirements. But the vendor driver f=
or
> > > the RGA2 also contains checks for the width and height to be aligned =
to
> > > 2 bytes.
> > >=20
> > > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > > ---
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++=
++++-----
> > > =C2=A0=C2=A01 file changed, 14 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/medi=
a/platform/rockchip/rga/rga.c
> > > index f599c992829dd..77b8c7ab74274 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga.c
> > > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > > @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, voi=
d *priv, struct v4l2_format *f)
> > > =C2=A0=C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> > > =C2=A0=C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> > > =C2=A0=C2=A0	struct rga_fmt *fmt;
> > > +	struct v4l2_frmsize_stepwise frmsize =3D {
> > > +		.min_width =3D hw->min_width,
> > > +		.max_width =3D hw->max_width,
> > > +		.min_height =3D hw->min_height,
> > > +		.max_height =3D hw->max_height,
> > > +		.step_width =3D 1,
> > > +		.step_height =3D 1,
> > > +	};
> > > +
> > > +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> > > +		frmsize.step_width =3D 2;
> > > +		frmsize.step_height =3D 2;
> > I think its fine like this, so let's start with:
> >=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > But it does not feel like a hardware alignment to me. When we process i=
n
> > software these things, the minimum alignment is bound to the subsamplin=
g, since
> > there is no way to store half or quarter pixels, the padded width/heigh=
t
> > requires a step that follow the subsampling, something like:
> >=20
> > 		frmsize.step_width =3D finfo->hdiv;
> > 		frmsize.step_height =3D finfo->vdiv;
>=20
> I agree that this looks better. My main intention is to be more=20
> conservative, as the Rockchip related code/docs seem to always ensure a=
=20
> 2 pixel alignment in both directions even for formats like YUV422, where=
=20
> we shouldn't have an alignment requirement in the height. Besides the=20
> vendor driver and TRM mentioned in the datasheet, the librga and it's=20
> docs also mention an alignment of 2 (pixels?!) for all YUV formats (see=
=20
> format alignment list in [1] and Q2.5 in [2]).
>=20
> Given that the driver currently doesn't have any way to get the cores=20
> unstuck/reset in case of a hang, I'd like to play it more safely by=20
> adhering to what the vendor does instead of trying to do more and=20
> therefore allowing some potential breaking format. E.g. I've also=20
> experimented with sizes of=C2=A068x2, which the librga allows as input/ou=
tput=20
> of the RGA3 (whereas the TRM specifies a min size of 128x128), but=20
> quickly dropped it as it produced some interesting broken outputs.

Agreed, simply preserve my Rb in next version.

cheers,
Nicolas

>=20
> Sincerely
> =C2=A0=C2=A0 =C2=A0 Sven
>=20
>=20
> [1]=20
> https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Deve=
loper_Guide_RGA_EN.md#image-format-alignment-instructions
>=20
> [2]=20
> https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_FAQ_=
RGA_EN.md
>=20
> >=20
> > Nicolas
> >=20
> >=20
> > > +	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> > > =C2=A0=C2=A0		const struct rga_frame *frm;
> > > @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, voi=
d *priv, struct v4l2_format *f)
> > > =C2=A0=C2=A0	if (!fmt)
> > > =C2=A0=C2=A0		fmt =3D &hw->formats[0];
> > > =C2=A0=20
> > > -	pix_fmt->width =3D clamp(pix_fmt->width,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width=
);
> > > -	pix_fmt->height =3D clamp(pix_fmt->height,
> > > -				hw->min_height, hw->max_height);
> > > -
> > > +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &=
frmsize);
> > > =C2=A0=C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width=
, pix_fmt->height);
> > > =C2=A0=C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> > > =C2=A0=20

--=-qN1+gvfnAtUxv/ubnzMi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagNCsAAKCRDZQZRRKWBy
9C0fAP457K60/ZJ3ZLSyjkjg60UiJKpqRH2brs1rrxHPVXniJgEA9cbujVJ5Cbin
Jn9LmlNpceZNGbjSuImEtMjHkEqw3AU=
=l7Hh
-----END PGP SIGNATURE-----

--=-qN1+gvfnAtUxv/ubnzMi--

