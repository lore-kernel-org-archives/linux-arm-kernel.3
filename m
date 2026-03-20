Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949E61099B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=; b=nnRdND0phWAW4Zu5erknMt4o4P
	m70ECvWh/26nMY+LHbsxJuugtT36wsDxFz29NafYVnJ+k+oq1BoUuN8OVC501z0Ps/sU7CnYbRI6/
	2gj2h8vrxP27Lz/GoqkoASxBOCyo77RFt1jS1tO0LDNHdBGAsPwouCyibkbDvas7cigT14OsY1oGw
	r3vTo3KKmjKuw5EygvZ1bMgVfAMMLfWafYeVolCmpkEEnO8P05I3LsE+EzLXp8vnGbDytLddzY3um
	aE4geEk/ldFNOqQFoNFoRUGomGI8x3KtW4oegK/oIBc1XVpOhxzbruVMIjYND9Tt1WRiP3WeqhoJH
	DM+JYCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dx6-0000000DJlG-17Ec;
	Fri, 20 Mar 2026 17:48:04 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dx3-0000000DJkQ-0BjI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:48:02 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8ca01dc7d40so253167185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028880; x=1774633680; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=;
        b=CDloIU9H2fxvdr/RDqYIdaBugTs7TSCoOkJJBjrN/VYEFfyWDN8C3mAwJcmHnWSuKf
         YRYgw3BbLMe1NOPsgmU2MfhM4J+mD8YYyMOlu1yKKMsWDcijoZIbFnbgMT48EtdKUVNu
         FxBtx+DN6zk7w5eKViUlfhjfazWVYSrTVoR1sy/ex8C0VMn6dx6ZY/wBJq9mqms5UjMP
         dnfdRCqLEODOPNw4MTMIoLvmW8W0y5Xt4sUWmjUnzi0LP3UKNTuxqVp0r93a0jZvH+Hy
         piadtMaUBKWPIjzgDBfkoulUTgqvgTVSON+Ek9MrC9zVrHVIdbveYgaVycPXaLLAuOqK
         PCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028880; x=1774633680;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=;
        b=oVfTzGJZtbib8d9+CsJWEbZfqENJoSVDudzmfe96m69QeUEMmFLW3knahQgzENK/5T
         prVlwRn6hACFqOCj27M0F4nle602XkhO2PUnQ2VhMxOU2SqE6fNOQ56i8c5+Zrjnacg1
         Oh0ERiLN0hyYgQ0uOHnpNU0g9X75sbeb44z+sXiFw1PhBjRDvZRjw7LdsajY1bGTJ4cU
         bP/VHVA44wASE9x1y9oeWxZZNX2RAUzY0VeGUZC82hTc4e2QGxf2/O6/L0Zq0xwAwqBz
         BVRJjKhVa98t72827yugM/F6TSULJzgIsNyG5tjW+Y9BCynP89NGbGsIsZ3IxE4jEJX7
         1hgw==
X-Forwarded-Encrypted: i=1; AJvYcCVQrZCJjfFnkZ2wrK1B9pb9iSFayt0wEC26ZA0dreBzV5O7JYzMYSOrk9rJxSjamB2xD1YCG6hd7kGaPfxh2089@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5xAMv+sAI3VQXqqX2KR4aYNTaueZ9S8QAXLPwq9l7aDhKs3fi
	CEy4IHFBVTNL4oQ/E043kFF1sI/dC07PxWYsuf6mmOdZaArW0/WVthAByf7+OpgfffB3e6C8ZfG
	pVb/SziIPLw==
X-Gm-Gg: ATEYQzw4brWMjzMDx9uKy1Zj1TtpyzHvQB/JAHF+7Tj6I0ZvC5SZnvsLee7DYcisH1z
	jn1fbl/q40TlSZ8zSW6s782PbuyNmKfkQ4TQKHF9fkzjVpSf1egX6Hg7PLFFqhA5A8jQKZb+yAi
	uQexJV1Y5BGUjySES+ujXYFr+9w+so7o8VI9k6M6/b/82qKZtYXHty1GM3eImYhSBgrRiENqI0M
	G/Nh3DmtBoL+Wfrl23LqqjKDRefE2uY2/PzZyoENbwj0kJiUlStT5eQIITED5GuqUuzqcCShNyA
	VgEpVq5d/yZyKRq9r0dB2RDF/Bn9E2PZZT71TZLH/a0s9eqn6f7udkUZ7UTgOvBCClECJ2yjkiO
	TSbw4QxVzI6tQ9PGDD4UD/UxwlFzLhyrfj2dkhcrkoOHrPZJmdMdB8I5gJ3BCdhZocoiQ2Ij6Xk
	ZRUZcAO1bGPj00IBlUsemUUf6J/GzbDs3fYvvUX3E=
X-Received: by 2002:a05:620a:1a29:b0:8cd:982d:411d with SMTP id af79cd13be357-8cfc7f6c676mr563879485a.52.1774028879543;
        Fri, 20 Mar 2026 10:47:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85214a43sm25647846d6.6.2026.03.20.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:47:58 -0700 (PDT)
Message-ID: <c154098ce7fd5d6bfcb44066b7c1f0cde07ff81d.camel@ndufresne.ca>
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
Date: Fri, 20 Mar 2026 13:47:57 -0400
In-Reply-To: <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-aiCC/tPL3UyCTVFf/HVn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104801_863612_6EABA2C8 
X-CRM114-Status: GOOD (  18.99  )
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


--=-aiCC/tPL3UyCTVFf/HVn
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
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 21a3c6cd38dbc..4fa6adb10b7ee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
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

For V4L2_PIX_FMT_YUV422P and NV16 this is 2/1. I believe you can generalize=
 this
with the format info, and skip this conditions:

		.step_with =3D info->vdiv,
		.step_height =3D info->hdiv

Though, I'm saying that from a pixel format perspective, if the HW needs 2/=
2 for
all YUV formats, let me know, I'll give my Rb.

Nicolas

> +	}
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> =C2=A0		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frms=
ize);
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-=
>height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0

--=-aiCC/tPL3UyCTVFf/HVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2ITQAKCRDZQZRRKWBy
9FnHAP9MXGaIWpolRasMrqQ7Y5bXCM/vLXshxf2/etb9oydBUwD+KLxgWdY37E/D
WBZ3ODJn/aS23VsB+5pnmZYe6avkqgI=
=XjGb
-----END PGP SIGNATURE-----

--=-aiCC/tPL3UyCTVFf/HVn--

