Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCCC1099B31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMAwl75HKNDbj5ZNfCoVlvOAZudKVS7YfwFm4MVhr08=; b=FrW4Sh3EDq6Lx2Z5sJis6rg6xy
	mHf4fvgBfVj8G1ZOs55IzAijMbz0B44v3g+z9YBU86K4M0i2sTbt520D9CKJ85HJfI/9iw41UKCpD
	mccaphMMp/Hk9g2vVr1LFrmlBpGHrHEltlshI3i8ADJ4kYCBr+JkX3NAiaIC6WND89A21cbDmPYwt
	J4+MmderZXWz1y6EWRW8wimSFZmo+O3bWNhelvYWncmNXtHcTKq4c34et23JJRBMFSYQfEJaaJKlm
	frghuQAIASxwuwRGNEgjsHnvTx47EGqU4I8i8OgYDKjsf9FH7NFPN4zbCnKQWNkh6oV8RtVswI3Gt
	kihz/9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dlz-0000000DH2x-0YJN;
	Fri, 20 Mar 2026 17:36:35 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dlx-0000000DH2B-2frI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:36:34 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8cfcb045909so108197285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028192; x=1774632992; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xMAwl75HKNDbj5ZNfCoVlvOAZudKVS7YfwFm4MVhr08=;
        b=TpFus4WGI2kStBaEeYtLFL1BwLDaOorWFLF/rDHG4VtCWusWXzeDGkS/o4mbCNURpT
         65iio4SbUkq3A/xuvOKBdlEq/Jsc1LvLAIE5sEiSQQOBxdHpuPcXtX3Cxyof3CUsvDyG
         upLVLIfYnGsTaWiHtthHdsMjppV1R0nDSRvwtW6YdYkUBRtJqhzBux5kJFzBT3rTf1zd
         Qpw68u9NkrxmcePuV/4Tgmu1aTcGE3o2qYVl8T64g7MYDAXFbaWExCLHyoLDFTUu1/K+
         3UfElPrWmeP3vLL4DBS0G4+Td7oV5s/XiEVHoLM1yUiX3CsUwoRUbqc7yRSPZbtxf7EO
         hvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028192; x=1774632992;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMAwl75HKNDbj5ZNfCoVlvOAZudKVS7YfwFm4MVhr08=;
        b=aJjWUcLIEMCdxF5BV12/yiBSuoF6ZhGRqcbkbvQYGNyaPG4XVJZ/TLlpx/8sBVqwwU
         fVF4K5vh3r+8TtlCQYcflvnDtCeqYj+qJTgpvxtQVh11z9v0c5L2nCjSmkKPXWPoHgHi
         XcGq3wHZnQrQIUG3hv9ls5HpmKOrdOu0C+8uKIq7b0fmal32O9OIRwzhCZS4r5Jho3lT
         tmtQW2ttL7HegLxExhQKL6cQX695hQjfWsUVmlAppf+irQQEzcxqZCOaE2m720wNsngP
         p8759Mtksst4EXzNGMxo+AdXQq6P42yFH9MMmol2wpyHaCB3PN+ePBIWS31y0YHMGSOn
         A4fg==
X-Forwarded-Encrypted: i=1; AJvYcCUDvtYmXwQLGr6KBXELdjSbUlfeyqDwa7oB4Kt5d0dUzYCiBrC2rXdQkX3HbWpWhZASDgcjb3qDSLQJ7R6yVocg@lists.infradead.org
X-Gm-Message-State: AOJu0YyWu9Ykm4z367wVxSNLnaPvxeiu249Wqc7inL23fAH6mR46/N77
	8mU3pROqIjXEKVRIk6jYE4IaaBefzerfWGMmJC1qreKBH1c7rYXJlB3qpyQ4/YMcCg0=
X-Gm-Gg: ATEYQzwMJc7aDsMiIQYhI100ewAO0tLWCcrJFXwk80W9HWZEFEi98SCGTkt5xFBA4ZG
	7MQ8XK0vhHn5xG34Kxso5c9aaZRnrRK/WXAGWZCGAaPWfG2OwftZSvqRD+ceQmJcj8LKJ0JefZ0
	um0Aqp5cTUP8Kq6+eSUU1RzSrjaU8wYS6KyFTdpiE6Z2Ryk6arN28tWnLJlwccve7fvDPrRVL1Q
	uAz2FjUU4rJmea2122GcpSGypWcQ6EeZSWWbsWTDGk2uNiTt5zknp5PXFgP71tFmU86Z31ojDvO
	J8gO0cRlJZc8yB18hj7z+mxtRTX6MtriFrvQW9luaM4O4d0+Jtqei5vJw/8P7c4jv0KTctfY7do
	cFOB+Rle3x+kYztnZcK89qoeOKE5oQtQY0HxSTTyrqAk5arpQOf/jowaoGF90gSVlGrmXd8SaGu
	DSUxWTUhnodlQ3i9Z8KZPkQ8SQ291I
X-Received: by 2002:a05:620a:288d:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cfc7f8adb8mr551611885a.72.1774028192036;
        Fri, 20 Mar 2026 10:36:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fa74c1sm203629185a.18.2026.03.20.10.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:36:31 -0700 (PDT)
Message-ID: <8e1e1d54371e1eb43405ebe315dc646f15e495d8.camel@ndufresne.ca>
Subject: Re: [PATCH v3 07/27] media: rockchip: rga: use stride for offset
 calculation
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
Date: Fri, 20 Mar 2026 13:36:30 -0400
In-Reply-To: <20260127-spu-rga3-v3-7-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-7-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-IktT+5Q5ygBqkaZSvy5d"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_103633_704513_4BAB964F 
X-CRM114-Status: GOOD (  20.17  )
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


--=-IktT+5Q5ygBqkaZSvy5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Use the stride instead of the width for the offset calculation. This
> ensures that the bytesperline value doesn't need to match the width
> value of the image.
>=20
> Furthermore this patch removes the dependency on the uv_factor property
> and instead reuses the v4l2_format_info to determine the correct
> division factor.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 16 ----------------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 -
> =C2=A03 files changed, 9 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index bb575873f2b24..65fc0d5b4aa10 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -14,7 +14,6 @@
> =C2=A0#include <media/videobuf2-dma-sg.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> -#include "rga-hw.h"
> =C2=A0#include "rga.h"
> =C2=A0
> =C2=A0static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t m=
ax_desc,
> @@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int get_plane_offset(struct rga_frame *f, int plane)
> +static int get_plane_offset(struct rga_frame *f,
> +			=C2=A0=C2=A0=C2=A0 const struct v4l2_format_info *info,
> +			=C2=A0=C2=A0=C2=A0 int plane)
> =C2=A0{
> +	u32 stride =3D f->pix.plane_fmt[0].bytesperline;
> +
> =C2=A0	if (plane =3D=3D 0)
> =C2=A0		return 0;
> =C2=A0	if (plane =3D=3D 1)
> -		return f->width * f->height;
> +		return stride * f->height;
> =C2=A0	if (plane =3D=3D 2)
> -		return f->width * f->height + (f->width * f->height / f->fmt->uv_facto=
r);
> +		return stride * f->height +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stride * f->height / info->hdiv =
/ info->vdiv);
> =C2=A0
> =C2=A0	return -EINVAL;
> =C2=A0}
> @@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	/* Fill the remaining planes */
> =C2=A0	info =3D v4l2_format_info(f->fmt->fourcc);
> =C2=A0	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] =3D get_plane_offset(f, i);
> +		offsets[i] =3D get_plane_offset(f, info, i);
> =C2=A0
> =C2=A0	rbuf->offset.y_off =3D offsets[0];
> =C2=A0	rbuf->offset.u_off =3D offsets[1];
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 338c7796490bc..da4d5bec7a0a5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -190,7 +190,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> =C2=A0		.depth =3D 32,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -199,7 +198,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> =C2=A0		.depth =3D 32,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -208,7 +206,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> =C2=A0		.depth =3D 32,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -217,7 +214,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_RGB888,
> =C2=A0		.depth =3D 24,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -226,7 +222,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_RGB888,
> =C2=A0		.depth =3D 24,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -235,7 +230,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -244,7 +238,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -253,7 +246,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_BGR565,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -262,7 +254,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -271,7 +262,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 2,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -280,7 +270,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -289,7 +278,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -298,7 +286,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 2,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -307,7 +294,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 2,
> =C2=A0	},
> @@ -316,7 +302,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 2,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 2,
> =C2=A0	},
> @@ -325,7 +310,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 2,
> =C2=A0	},
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 2db10acecb405..477cf5b62bbb2 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -17,7 +17,6 @@
> =C2=A0struct rga_fmt {
> =C2=A0	u32 fourcc;
> =C2=A0	int depth;
> -	u8 uv_factor;
> =C2=A0	u8 y_div;
> =C2=A0	u8 x_div;
> =C2=A0	u8 color_swap;

--=-IktT+5Q5ygBqkaZSvy5d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2FngAKCRDZQZRRKWBy
9BloAPsHKgr+KaFyY9VVUNheC4oagzZIVyhFpCYJn5gTmsLnQQEAowO96Dv+27KK
DpZZJP6AXY9axehC4NQNZaqzyQAtGAE=
=aIWY
-----END PGP SIGNATURE-----

--=-IktT+5Q5ygBqkaZSvy5d--

