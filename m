Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B86E109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyxr2cT76xTmVXlGS1w9Azu54H6E559HX/Y7oAdioW8=; b=Sw0J5tXiDIMbX2TWCpVt+FbwPV
	tHFD1ywDpCIk/J65UZE7ScAPvhIGLeyFMm7FLzg/ca82PLUqGsAJ6Ytgjr6o9BWeWE8eZ1BEsqDj+
	diPlQqy4+2FZj15vpcDQQ7Uv8Zu0PdYewPIdq17uH9ebN51brrC8mQ3SiKW9Ki1yceYPJkHoea5y8
	g8CbaqbtpAEkeXyjRFV3kO/IiHvDwA0T60sM9fVGqksm+Vnc5WHMTQesGB+ax7zbGcssgWlc/9/3o
	nDjyvF9yVKSspDJlhgUlvj7el5b6xIEMBHCMylCBn3viJbz+KugkKxpQUPoPTDK8ZhJSpTnayjlK1
	pa+LOskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3INQ-0000000BOd9-2Iqs;
	Thu, 19 Mar 2026 18:45:48 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3INO-0000000BOcm-3Hnl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:45:47 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8cbb6d5f780so145704785a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773945945; x=1774550745; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fyxr2cT76xTmVXlGS1w9Azu54H6E559HX/Y7oAdioW8=;
        b=1Z3/zaDBNwP+Dfvua8RS1N3ysBWoZFKQrUTsh1iXo5f5QpBg03LH/NVXmUw4TTWbrg
         Liia79GJn0AbY8T24ZbnePS9Jhe21/VsY4eZOw81WCiFz2IHCHwRMZ5RsOr6HdqFZ/r/
         99yYt/be87IxsjSEbuSCyHqfOPeKJtbwQpcjOivfz4JXpuRQvY+IR98eGuVB2ybSHUQI
         3DjOCrxapGuc8CTNqBM35hUYfs/C6sWFw/lKzHoeXPyljCgB4WaGtw2tsS6j7NvGugw4
         Doilw0noj/Posj0rD6LuL91P3JPQhswFhWCB3Bx7Nu8pylyQ912q8QDQz1uY7wtW95xu
         pwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945945; x=1774550745;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyxr2cT76xTmVXlGS1w9Azu54H6E559HX/Y7oAdioW8=;
        b=kYPweQDf+6+jQwUZ9BbDZUDn1p3xgrppLkJ9brnjBpHyc1tec/VhVRaPigAsdeYLXN
         F1RfG8CS6i4fYBRQDMLQGfNCHVYLZHxvbfEnGo1VK1r+SHhL4zSh1IZ62AUY+vRL34Er
         7kzTXccnZmqWV+MJvRtQGYhd9tqMNSHkcem3eSpauQ+L/+1TnTP7uvEZ0isCMxXlYjJy
         QP6OsrhG4ZttOCsoDN84nganCNMMRTpmf4/5BqyfAjmrl/77w7M7THRRyr0ipwBivWy3
         29KcU0PGsj1vwAgxdn4K1TnwtLvTTG9jnkyH+XTDtk/7Ac2a+SMY59jTojZKZ7lMdWt3
         QDSw==
X-Forwarded-Encrypted: i=1; AJvYcCWdhgO4r4HGepN8of1oiZABXSXGtFYkTNRcUZ1FLsq0mrs1eVYdjY8VhTNimjY1ySSVGGCRDPGfJrI3gyHnx/+R@lists.infradead.org
X-Gm-Message-State: AOJu0YxZWcagAynHYLS5156+/lLuxawPYbujKTcXrYvsqEr3dhK405Fn
	kSbS9enSmZb6WOwfIOHQ+akW8Qtt11gxY+sKvTiJkBnv5jvfHCxpSnktmLsSONIrCRw=
X-Gm-Gg: ATEYQzxfiy3kQridlo7JFTLmCG02UGb86hOt62UNOLKd1sQt+svO6NLqFk5tP463uMA
	JoN0Kweyq4hzPSfmiyTCCeR1cnWRhYP1OEdW//1zCe8BGgW6Q3fU5ouDx7Egxcealm5+zY6QKyR
	iJsytSt7itMRtKGsy4WU7GvzfnNSvCxCgFbjJFPVoxzfFoUcpuhW4rSH+6Op4/KOuAIE5uyrIlX
	j7cR6nHBY6XyP6VBMdkRcqnMF9AisaIDKAJFaDAmTElmZIwWhYfPcmSJJcvtQbId04yEJWIuwhu
	zxGwaHaAQTT0CCDhPQlnH8JvtXMAmA2oUVvYpUVyj47nkfMjO9R9V8+uxwQq91t6Y+jkGEI7sT9
	KwEqpWsU64mKQDGok1Dhxq9UwVnUK/ODJjnuNvS4F7M6KSJuRnzvo1S3Kn/3oaOBo+V5Fq6TtmF
	ubjhn1Ve2qUB7sdkriM3+RwPRgVfGG
X-Received: by 2002:a05:620a:4050:b0:8cf:c08e:5f43 with SMTP id af79cd13be357-8cfc8097225mr45589685a.63.1773945944917;
        Thu, 19 Mar 2026 11:45:44 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad16691asm485652985a.23.2026.03.19.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:45:44 -0700 (PDT)
Message-ID: <82eaf7e33273ab2f68ff6720244be2f268e52cb2.camel@ndufresne.ca>
Subject: Re: [PATCH v3 02/27] media: v4l2-common: sort RGB formats in
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
Date: Thu, 19 Mar 2026 14:45:42 -0400
In-Reply-To: <20260127-spu-rga3-v3-2-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-2-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Wsz88yXF6Ple/ZN0Bspp"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114546_874247_B374D866 
X-CRM114-Status: GOOD (  17.13  )
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


--=-Wsz88yXF6Ple/ZN0Bspp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Sort the RGB formats in v4l2_format_info to match the format definitions
> in include/uapi/linux/videodev2.h . Also introduce the same sections to
> partition the list of formats and align the format info in each section.
>=20
> The alignment of the 1 or 2 bytes RGB formats contains an additional
> space in preparation of adding the missing formats to the list, as for
> V4L2_PIX_FMT_ARGB555X an additional space is necessary.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++++++-----=
-----------
> =C2=A01 file changed, 30 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e11133..49c1ec08e2eb3 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -245,33 +245,39 @@ EXPORT_SYMBOL_GPL(v4l2_s_parm_cap);
> =C2=A0const struct v4l2_format_info *v4l2_format_info(u32 format)
> =C2=A0{
> =C2=A0	static const struct v4l2_format_info formats[] =3D {
> -		/* RGB formats */
> -		{ .format =3D V4L2_PIX_FMT_BGR24,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGB24,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_HSV24,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGR32,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_XBGR32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGRX32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGB32,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_XRGB32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBX32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_HSV32,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGRA32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGB565,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGB565X, .pixel_enc =3D V4L2_PIXEL_ENC_RGB,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGB555,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGR666,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGR48_12, .pixel_enc =3D V4L2_PIXEL_ENC_RGB=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_BGR48, .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .=
mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_div =3D=
 { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGB48, .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .=
mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_div =3D=
 { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		/* RGB formats (1 or 2 bytes per pixel) */
> +		{ .format =3D V4L2_PIX_FMT_RGB555,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGB565,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIX=
EL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 },=
 .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGB565X,=C2=A0 .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +
> +		/* RGB formats (3 or 4 bytes per pixel) */
> +		{ .format =3D V4L2_PIX_FMT_BGR666,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_BGR24,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 3, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGB24,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 3, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> +		{ .format =3D V4L2_PIX_FMT_BGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> +		{ .format =3D V4L2_PIX_FMT_ABGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_XBGR32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_BGRA32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_BGRX32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_RGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pixel_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .=
bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D=
 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBA32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_RGBX32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_ARGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> +		{ .format =3D V4L2_PIX_FMT_XRGB32,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pixe=
l_enc =3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 4, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 }=
,
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX1010102, .pixel_enc =3D V4L2_PIXEL=
_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .=
bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_ARGB2101010, .pixel_enc =3D V4L2_PIXEL=
_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .=
bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0
> +		/* RGB formats (6 or 8 bytes per pixel) */
> +		{ .format =3D V4L2_PIX_FMT_BGR48_12,=C2=A0 .pixel_enc =3D V4L2_PIXEL_E=
NC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_BGR48,=C2=A0=C2=A0=C2=A0=C2=A0 .pixel_enc =
=3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6=
, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGB48,=C2=A0=C2=A0=C2=A0=C2=A0 .pixel_enc =
=3D V4L2_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6=
, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +
> +		/* HSV formats */
> +		{ .format =3D V4L2_PIX_FMT_HSV24, .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .=
mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, .bpp_div =3D=
 { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_HSV32, .pixel_enc =3D V4L2_PIXEL_ENC_RGB, .=
mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =3D=
 { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +
> =C2=A0		/* YUV packed formats */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUYV,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YVYU,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },

--=-Wsz88yXF6Ple/ZN0Bspp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxEVgAKCRDZQZRRKWBy
9No4AQD3/aAkAEwNjIOWQvIu1NDXoIuPzyXnLJ2iMFNMGp1u5wD/UwF3ZnJ1cn7m
BQCobwSyzvDMGTI14zeSx+a+Yoz9rwE=
=RVgQ
-----END PGP SIGNATURE-----

--=-Wsz88yXF6Ple/ZN0Bspp--

