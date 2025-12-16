Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0A8D637D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=; b=oMKZC1oh5DfZnahfWjmNufDPpU
	1/6dLcjvGHW/hM18mznjjs4PVGw7Bi3vjuT2WlocCkra8dMB9vtf55X0AvJa4zXnYjxr+NrXkBDU1
	KKWm89o1NMxtOtpnP1W+Di+lvwo6ptyHaZznyDn2N1idxl/IM5kFmnmwt+NSyM+iNkQihFS4H1Zj7
	Rm0ofaanQeVeon2GtGuKlutrLxyZaDeDkwR0YLeLOGDytTY02cb4m2uWWvmucI2cxj+2K6b/WC7Qt
	cWrh2w+uK3k3DAh0PNl+Cv/qoRMprKiHB/NUCirJ1wZaAxg2Qo1qzgeRLRJjLj7q7OmLubM30RhEQ
	+X12ehJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcv3-00000005rYr-2T7I;
	Tue, 16 Dec 2025 21:49:21 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcux-00000005rXs-2JXA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:49:19 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-88888d80590so26528076d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921754; x=1766526554; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=;
        b=pE9i4ggL9W7aJUfR6S9Zhew4CYHemH2EYoLi4FWLwcZ1T6CeEwoUBXTZwc8M97Ihvc
         OBOnKHyQRbXr7fViKzI7NOwmcqota0OhDaoKelnigTFARjL0WYxbBEBErWKQMVw/wWqa
         VZ5yTd9n9mYp5Ulp5HOCTQRguoplIzSttk2yA25ShfYHar91AC8KBsG6JJDJKMyyiH3f
         1qXydzc6p8+5Dk2H2uzTVw/zcSQltAvx46qabq5mjHY9OJeoHHcnz0rzk4OYgRJzC7SO
         M6braiUCSzIALxUziGCNtFihOJu/O/WHEQwIeLemXWGqcd9Gi9xca7IAbJWyY/KME4wE
         wvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921754; x=1766526554;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=;
        b=GH1g6twDPNDrkcqrmlPAR2W6E4n82dL9hEOw970VRkU8HmBBpBlA4Vpe66DI3lb3RS
         nvT7ABQOtwLhR71hlbnJxzOAoeKcLcR/a9M9a62RaUsiSsC7DHBfnMdVzsPyfpGNPJA3
         VCi72egWcO/DZuzHETXjkD2pQoWwwxKgBgONhMoFW0IpX++S4tFSFbWPYXe3HugvZBle
         NchfaFEv1HUZVNX1IOITKsK4TmP9lY1zogdumZbLcGfaGj0J5pBbLr2NZhl9JGrzY6PP
         sFXZWT7Wf1ZclUyuNwH34treXxqSfHSQB5r+wouRcd8Jiz32378HBc0P6GHfR53kQ3ma
         P6OA==
X-Forwarded-Encrypted: i=1; AJvYcCUzqeS8omFac2fUoyVJv/75wsXo4BDJ1WlbwvbdD5b4zNB7iEg6uMVo3TehYKRWlgTdQQA2su6nWrFSI/aiJPvp@lists.infradead.org
X-Gm-Message-State: AOJu0YzIXfGQQ+5TrqCGK1Y9trQdrpCiVq/YVjt4iW9JMctSUiDZE37G
	I2DIKvYe3hBGjztF8jqr0Bw5tIEtK4GLZdE3LWydVJjxwAYpQLmbQc5Bk8074k86RI4=
X-Gm-Gg: AY/fxX4B+aMYKu5HIkG9R2qYpZSTv1ShKDDKDIZsOSQxjtkhVSVC5F9HutDj9L7/u2G
	yagXVaheRmZlTEzA0V4vYOxjXi6i1nHbkQHlKJqcHKOIWUdrsa5VIkS8UL3zGsHhVOrxwAWJK5i
	+EWIHSoq6g5ayaX2UCOykWmCdgqgeb+fH/W4/oB35D63jje3fX0HIK/aE7c5nZiVtT9OCW2YcOV
	QJKJ30CQ0gU72VB8sURO2x1SqXZ2xLSUEk6U13y3N4VgzryTlnqhxa7ujrY6U2i6ecNQGw/yaq5
	80fE0G6Vrg/8vq38Dk+UJesEfZeRaYUHbrhmhGstvK3AoHLlqdZevXLwd2AbHMGvKHY69Ezsyjk
	0wavBZCv0TPFZLloIGvJfPPNpajK53Fdag/+XPEu70/r50H2dXPUh+Vy01fiq3B+/wLYHsYdQ47
	y6aX11zbq/JxAaIWQ1
X-Google-Smtp-Source: AGHT+IH+V/Mr5+CqGLcI3EzYLOmPSV6tSlboBRvR5DbANVmIdH9NhazPVg8f1thYKYgGBLLqtCy2dA==
X-Received: by 2002:a05:622a:1b88:b0:4ec:f073:4239 with SMTP id d75a77b69052e-4f1d04787c8mr198004211cf.6.1765921754277;
        Tue, 16 Dec 2025 13:49:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c7dfbfsm21515751cf.31.2025.12.16.13.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:49:13 -0800 (PST)
Message-ID: <3dd2c364f84725a68823f13a9f2b1f0499abaed5.camel@ndufresne.ca>
Subject: Re: [PATCH v11 11/12] media: mediatek: jpeg: add jpeg compatible
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:49:12 -0500
In-Reply-To: <20251202094800.6140-12-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-12-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-YBjB4a/FKYc454GerwhG"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134917_941348_6256B78E 
X-CRM114-Status: GOOD (  14.26  )
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


--=-YBjB4a/FKYc454GerwhG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Add jpeg dec and enc compatible for mt8196
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 34 +=
++++++++++++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 |=C2=A0 3 ++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 |=C2=A0 3 ++
> =C2=A03 files changed, 40 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index da1ca494ed4b..10a588b92e76 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1932,6 +1932,19 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drv=
data
> =3D {
> =C2=A0	.jpeg_worker =3D mtk_jpegenc_worker,
> =C2=A0};
> =C2=A0
> +static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata =3D {
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegenc_worker,
> +};
> +
> =C2=A0static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata =3D {
> =C2=A0	.formats =3D mtk_jpeg_dec_formats,
> =C2=A0	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> @@ -1945,6 +1958,19 @@ static const struct mtk_jpeg_variant
> mtk8195_jpegdec_drvdata =3D {
> =C2=A0	.jpeg_worker =3D mtk_jpegdec_worker,
> =C2=A0};
> =C2=A0
> +static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata =3D {
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegdec_worker,
> +};
> +
> =C2=A0static const struct of_device_id mtk_jpeg_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8173-jpgdec",
> @@ -1966,6 +1992,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgdec",
> =C2=A0		.data =3D &mtk8195_jpegdec_drvdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc",
> +		.data =3D &mtk8196_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec",
> +		.data =3D &mtk8196_jpegdec_drvdata,
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index b3142dc9be85..e453a1634f33 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] =
=3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgdec-hw",
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec-hw",
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 82c971936c4d..b30c728c3712 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] =
=3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgenc-hw",
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc-hw",
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);

--=-YBjB4a/FKYc454GerwhG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHT2AAKCRDZQZRRKWBy
9IZqAPkBoSLa+bFdlDtR1FQo5Uc5A2dt+rMGU51H/CGtt205EAEAqnmGw/ine3cr
vP6MeovY8uQj7THLju96VbvCAKmDCQY=
=jQmg
-----END PGP SIGNATURE-----

--=-YBjB4a/FKYc454GerwhG--

