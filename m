Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B393E77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbtXpYWxITg7AJr/Jwg+F1OWRFSMP1K1yS5iR5eqeGE=; b=rvrkvYJUMJ5ZRKGqn1iLIPJDx3
	MTFF6DeyR+jsC7NMnmxQmtucVCFiu719WlorVMGOudB/qF/B23xYU6RGdpQU0fFWBHx/95QxNTC/Q
	Xwxessfh7EsXesJM5GV36+VckUQVuMmRzahzvTSeukksmP2uI71m9T4kzep13iMbeb8nrx9sjW6U2
	PngtJvXA63vavEE50zfZKSXSAJXnUIh1s6k9reYzE+Ezmyd5lb8kchIWYt0DZcVJXbUFi9OUGw8Oa
	MAMGvCLMRGEm+g0G4DCW+Laqx7DNpQ5U4wgqWcTPFUMIiSI4QsBLChYWe6sAn5ovrIvPhUPv36hsW
	/q95ix5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPmv-0000000Gzux-0SGS;
	Wed, 24 Dec 2025 14:24:29 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPmq-0000000Gzu8-41LY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 14:24:27 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-88a34450f19so67070516d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 06:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766586263; x=1767191063; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sbtXpYWxITg7AJr/Jwg+F1OWRFSMP1K1yS5iR5eqeGE=;
        b=E/s8Wy5/5MuBO1yfhQot4PcKBLbGGc3F9PcO8ic6QchDweKdFA/UDTBBcRY+FGm9ye
         XZ61GIsKnEeRdUVNU+6pV4dVFtvSiVKTm2O8eQbX+Jh/T1Pd8ph6QO3rtBf1oT37+RF7
         YHPmNs9eZijzddSCqEM3XVa5kEEViBMc0TfGNvNhm93i5HCjkBx2s3kwlX5T/G5f56Zu
         PnHj/bI1Z3klm9dghrxkqHd0G3+Y0yrppBuGU6FoHBW9EY8TwST/7BQJmoOXYdgXxi2E
         VQh591XYXK4HIOBjaqeex7ga7yvr5KpbW+hMa2yVJCXLBZq/FrRg0Chpiv3TEHpK7SHW
         sYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766586263; x=1767191063;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbtXpYWxITg7AJr/Jwg+F1OWRFSMP1K1yS5iR5eqeGE=;
        b=szTMDzV3tjndWk2VJDRQqKjuBP0l7Rou43Ms5h3zka/LhHBdsRzKmt8Kg8MqecUBgd
         KMSrK7wK2UYWk+L7OooPJsiVvQ5x5WMqIUhTbFAVpHLNm8tRHjab04VkbvlnBrwZFY3O
         oMQKVxl4eJTaO5NkgVHJVs61I6Y1c5svMj1pGKe3V5d/dENS7rZkuYm3qrL6K/uOWBts
         qzXPNAOX1yyRXD1oEcb6ZQmwZRbKzuIKDs7348JZKDjNzdyj73UBRjgnf/oTJ23FPofs
         Am8CVdk9xfyh7O2jle24NnagKTCNO2hNvUNJUIPLVlpnDpSLWMZ6l7PoudlKrHn/svwI
         wpfw==
X-Forwarded-Encrypted: i=1; AJvYcCWYQPWOUj58dpGkRcUtPWOI016yLJoJCiDkoEKt8ctbYv740ayEg29mqTMIJQ+T5aDU4LjY19fDoFiyrsNylO5K@lists.infradead.org
X-Gm-Message-State: AOJu0Yzep3idvUkdJduS03C+jDK5DIEu/Uf5BATkP70quH5fVdi7Ksgm
	UiSUBahC94qXYe/OzVJQOhNYGtMf2L8LkImVzIECFm0llXRJVQTaPwkDFbdl2KvGjMw=
X-Gm-Gg: AY/fxX5isxJUCqvaPYsObpfmqWpCA+CSsX9XZxJJpkD9D3kgCzU6NlaGXVfzVLMW+eK
	5+4uILLU27AHud01+h/JRPM5zAP9LPE7tX40YZIji0+1k94j2hzmljJ5FDAQIy5R/2vNc6KQg3p
	uP+Zcg8QEwCxmkBC2pXL0ED/ibzpdNZRCu/MQr2KwFWqUWlT6zqyMDEsEzKwuph1A96mlNcsshn
	ZeY2oVXT3JiAsrb+AmHrmmvSPE3pxpe6eG4zi/hazVa9gndVfnyR4vfwPvO4T0BG0ZSyzor0V6i
	ap3P3izlV7hOkNPXy1MS0bFu+fQOU9j9igDWNmIUAZAqYFuzoApUBXkc8snzAF2YD3HOSDJRH4P
	PaIqMxzRID3PaissjL9AtC5tJ7pSuL+NYmNz2xhJHA217oRxIa+GFmXwsZegL+l9mytK9ho0eR8
	Z1MCnXWjIi36aQJJTn
X-Google-Smtp-Source: AGHT+IFBXBD3jYFaArbbRnknDps/xO8oWwhKezx3DwQgqGe5GqPW6vUGgcAoj4hZpaaBRbI7eNh78Q==
X-Received: by 2002:a05:6214:d04:b0:88f:a4ff:454e with SMTP id 6a1803df08f44-88fa4ff4642mr190361976d6.10.1766586262889;
        Wed, 24 Dec 2025 06:24:22 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9680dc3bsm128036936d6.14.2025.12.24.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:24:22 -0800 (PST)
Message-ID: <fffbec0dbb95fe0aa34e847c89499e91ebc1df43.camel@ndufresne.ca>
Subject: Re: [PATCH v2 02/22] media: v4l2-common: add has_alpha to
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
Date: Wed, 24 Dec 2025 09:24:20 -0500
In-Reply-To: <20251203-spu-rga3-v2-2-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-2-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-fmKYZ+5/CD21oWsxEXAZ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_062425_267886_C13FA9FF 
X-CRM114-Status: GOOD (  16.63  )
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


--=-fmKYZ+5/CD21oWsxEXAZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Add a has_alpha value to the v4l2_format_info struct to indicate if the
> format contains an alpha component. The implementation is based on the
> drm_format_info implementation.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 14 +++++++-------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e11133..2c7ac70c0f486 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -256,10 +256,10 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_XRGB32,=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX32,=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_HSV32,=C2=A0=C2=A0 .pixel_enc =3D V4L2=
_PIXEL_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
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
> +		{ .format =3D V4L2_PIX_FMT_ARGB32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> +		{ .format =3D V4L2_PIX_FMT_RGBA32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> +		{ .format =3D V4L2_PIX_FMT_ABGR32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> +		{ .format =3D V4L2_PIX_FMT_BGRA32,=C2=A0 .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB565,=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB565X, .pixel_enc =3D V4L2_PIXEL_ENC=
_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB555,=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> @@ -267,10 +267,10 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGR48_12, .pixel_enc =3D V4L2_PIXEL_EN=
C_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_BGR48, .pixel_enc =3D V4L2_PIXEL_ENC_R=
GB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGB48, .pixel_enc =3D V4L2_PIXEL_ENC_R=
GB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> +		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_RGBX1010102, .pixel_enc =3D V4L2_PIXEL=
_ENC_RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .=
bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_ARGB2101010, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ARGB2101010, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1, .has_alpha =3D true },
> =C2=A0
> =C2=A0		/* YUV packed formats */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUYV,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
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

--=-fmKYZ+5/CD21oWsxEXAZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUv3lAAKCRDZQZRRKWBy
9ITFAP0SuxSrmoVrRQQArsjL7nVuYkwcZ8G4yi0itFrxxipp4gEAmtXbIy/6hv8m
dQE9yLNIZrBWsXb+HsoBsrQZxSooGwc=
=w5st
-----END PGP SIGNATURE-----

--=-fmKYZ+5/CD21oWsxEXAZ--

