Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF26109190B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta0Bls4LF9tYg574T6lcpobqW1L62AjgULjqoIMqOa4=; b=ru2ewBlzLfLsJvIGEtc7rf1g/i
	rcoW83ba74GRqc0Wdx0MtIzXvOow7GaVXaetzPDJ7MnO1LNfV3c97Fxgx0NmQ92QSCjn4ZtxXM3eO
	Fge362dk4ff5ZiXj5mr/wvlBgbbZhYGP155n7dOrVGqOk4k3XuzH4M6D1hVmRFKTt0W4FcvhqtqBS
	EzzHtX0182c4Ct1PTnW3lv2IJhtnozoJ4QqgQVAOIe6o9+u4uWyx7NqY9qfODPvqje7/SR2dwWE5F
	DkAPFwYKZFVNjohJtJ/k96PqaaFDGTFxfwlO9f0O/2VTHxE80Gxv+S3+dFvrBzRip1rOdk5zHCNIt
	28p8WwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IUw-0000000BPTz-2W3O;
	Thu, 19 Mar 2026 18:53:34 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IUu-0000000BPSr-0Vbl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:53:33 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8c6f21c2d81so136148785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773946411; x=1774551211; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta0Bls4LF9tYg574T6lcpobqW1L62AjgULjqoIMqOa4=;
        b=ywINBI9+Xt8ctO9ykk7HQSeMGGKjhbhS69cY8LNK8yLYHHNrpfTaoofkVdpwVcveJe
         cd61O8wOGMKWziZ/o8X7KmJVihQn6PBryv5kKk+GOpVmEdwWPGYQ1TIC1tzA75QsrhYK
         P0b3AL+y0YdDoADTc0r4E0xDmTlEjOM4LOlS08FUoEhmROdQm9ldSgD6gSqB83wcWUxA
         BVQEGrmVF+H3Uf5aGdWw88ToLrHP4CgJcdvZYq9nqS5ym9BvClksAFpjybdpyyKPqi7p
         Gq7hc4rEkUhrR+pwBKkG8b6mwCQpYfNOu3PP1/kyDy+SoPYLYYcoUGVtxwpHX10+tdzC
         mBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946411; x=1774551211;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta0Bls4LF9tYg574T6lcpobqW1L62AjgULjqoIMqOa4=;
        b=S9NhRB1Qu10MbzPQHGmDHjsYastSJ5IXclTPgpBU3tNUA10saRa2aI+b32QNHWVaa/
         u7mE5F/THN0trEAQ5Emx1eMKOEgaXEl4e3A16ow1Y9hfhXXcMNmq1JGgezCw0jSeNmmm
         Da245OPXknC5qrPV+OY9jBrlRtWRwKlqIRSpcIaEgqRRhQ1XaPKgEbVHde1Haqzu+qrW
         0cBFFVAETxdELocznY1fYB8JO8UR6rChlZc3RnBZC7ra7rIVfrpvY7A8HxZG5VodNUwm
         298MbRlN+uV+ugDFaRGIwtlPJqDdLTt1mr764yF7BpL9jkXtTLIcEeLJGr7m33UnAd1f
         uFhg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Jrf+T56fprB9Mw4Ra1VcRthKrdjOuCA9bvHV6W+0Xqd8EHmec7kMDmo+Zzpfip8j7EECnFK9pxRRRsMFDaP4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6TR7jU3MYrEGauom1tqEEGvaCRsGqxL7BA45XOhChC6K/jbai
	pCmcezOmfbPHqr3iQbRhOJnmVgdrmpfwJ8fjmGdQ6oA6HC8DsSE4ZfX6yK3fTahn8OA=
X-Gm-Gg: ATEYQzxdvIYCkQSgwgvqp900mmY1AJrIAU5nmO5TpyEVcDA6uWTj11B+g+5bBWr3uE2
	AcRD2dDaLm4zFlWZFJjjLrP+yflle6u0Cu8Sam2s+xCBwunXgqDUDjkypnK+3b6krZNMIp+eyyM
	tDyaJRUeD60jSX+Q1F3jWWd9yWddNfc5VJTNrQcl8ChjCKGsLQxlTgnjVHz6DqAXIq/gQCuQasQ
	A+aqRVcOqSWwHFFsPOULD3Owy7RSb3niDnAjrDAOJ8/US69hcs9nh907ScX0tz9zr0cvwdzGHmV
	kcPW9heUdIwQo3EtuIOz1BCYFDiXGyOIwhtM+QzY83p2WRWJSL76+6+gcSnvL3LV7TKtQrCUP7+
	yPvBW5f0TrJOdTZHyVUord5HALMKGdEJmBv+LA+v3AfBU4u9B2Qv/AbIujXXvA+dPYOJnG3EWIK
	W7GXEUC8I68anUb/2/I+wP4UOE+ab+
X-Received: by 2002:a05:620a:2981:b0:8cd:8751:2b3a with SMTP id af79cd13be357-8cfc7ee4434mr51276185a.31.1773946410775;
        Thu, 19 Mar 2026 11:53:30 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad164b0asm482593285a.31.2026.03.19.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:53:30 -0700 (PDT)
Message-ID: <e2be41832cb2f97668acc2f033d42aee69630329.camel@ndufresne.ca>
Subject: Re: [PATCH v3 04/27] media: v4l2-common: add has_alpha to
 v4l2_format_info
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
Date: Thu, 19 Mar 2026 14:53:28 -0400
In-Reply-To: <20260127-spu-rga3-v3-4-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-4-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-jNGlwzXGp4sLitvNSztE"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_115332_233751_B4F42C6D 
X-CRM114-Status: GOOD (  15.58  )
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


--=-jNGlwzXGp4sLitvNSztE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add a has_alpha value to the v4l2_format_info struct to indicate if the
> format contains an alpha component. This information can currently not
> be queried in a generic way, but might be useful for potential drivers
> to properly setup alpha blending to copy or set the alpha value.
> The implementation is based on the drm_format_info implementation.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 32 ++++++++++++++++--------=
--------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 58a4b372cf5be..2b5ccedeb6841 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -248,26 +248,26 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> =C2=A0		/* RGB formats (1 or 2 bytes per pixel) */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB332,=C2=A0=C2=A0 .pixel_enc =3D V4L=
2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0,=
 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB444,=C2=A0=C2=A0 .pixel_enc =3D V4L=
2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0,=
 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ARGB444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XRGB444,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBA444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX444,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ABGR444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XBGR444,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGRA444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_BGRA444,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGRX444,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB555,=C2=A0=C2=A0 .pixel_enc =3D V4L=
2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0,=
 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ARGB555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XRGB555,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBA555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX555,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ABGR555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XBGR555,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGRA555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_BGRA555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGRX555,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB565,=C2=A0=C2=A0 .pixel_enc =3D V4L=
2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0,=
 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB555X,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB555X, .pixel_enc =3D V4L2_PIXEL_ENC_RGB=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ARGB555X, .pixel_enc =3D V4L2_PIXEL_ENC_RGB=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XRGB555X, .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB565X,=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0
> @@ -276,24 +276,24 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGR24,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =
=3D 1, .bpp =3D { 3, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .=
vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB24,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =
=3D 1, .bpp =3D { 3, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .=
vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =
=3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .=
vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_ABGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, =
.has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XBGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGRA32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_BGRA32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, =
.has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGRX32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =
=3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .=
vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_RGBA32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, =
.has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_ARGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, =
.has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XRGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX1010102, .pixel_enc =3D V4L2_PIXEL=
_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .=
bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB2101010, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> +		{ .format =3D V4L2_PIX_FMT_ARGB2101010, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0
> =C2=A0		/* RGB formats (6 or 8 bytes per pixel) */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGR48_12,=C2=A0 .pixel_enc =3D V4L2_PI=
XEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }=
, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGR48,=C2=A0=C2=A0=C2=A0=C2=A0 .pixel_=
enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D=
 { 6, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB48,=C2=A0=C2=A0=C2=A0=C2=A0 .pixel_=
enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D=
 { 6, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0
> =C2=A0		/* HSV formats */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_HSV24, .pixel_enc =3D V4L2_PIXEL_ENC_R=
GB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index f8b1faced79c8..401d8506c24b5 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -520,6 +520,7 @@ enum v4l2_pixel_encoding {
> =C2=A0 * @vdiv: Vertical chroma subsampling factor
> =C2=A0 * @block_w: Per-plane macroblock pixel width (optional)
> =C2=A0 * @block_h: Per-plane macroblock pixel height (optional)
> + * @has_alpha: Does the format embeds an alpha component?
> =C2=A0 */
> =C2=A0struct v4l2_format_info {
> =C2=A0	u32 format;
> @@ -532,6 +533,7 @@ struct v4l2_format_info {
> =C2=A0	u8 vdiv;
> =C2=A0	u8 block_w[4];
> =C2=A0	u8 block_h[4];
> +	bool has_alpha;
> =C2=A0};
> =C2=A0
> =C2=A0static inline bool v4l2_is_format_rgb(const struct v4l2_format_info=
 *f)

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

--=-jNGlwzXGp4sLitvNSztE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxGKAAKCRDZQZRRKWBy
9FlOAP9It84CqjbHg5xzL/vRPNhSv9t9+099qDdLk7YU46+l3wEA2DpYOpsZdRvn
ztlMXR8j4EHUFNdOr0LbefqEh6vORgQ=
=uqDg
-----END PGP SIGNATURE-----

--=-jNGlwzXGp4sLitvNSztE--

