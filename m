Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD7E7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cJOp3Zboju26ptOSTfN4m6v5W2HkANfWbhd+iDMpdY=; b=1mNnPMAU2/Lml5b5C7F3EwIyDk
	qli+vrk61LDqbx5YktPGR++U0gSmTAHzzv0PqFhTpfoDQxwo0WUlJKXx2NlbiPP3uoWA0frLqvmvV
	BULR/2nC7/IQ+kHlzvcSzZ4NPgqZlGSxpCmRFmhCTfsKSlAA666H87Jry51LKrLmZhYDC/J6WPefL
	HFzBI1FX+vi/fJirxabsFonKVNZa1kZTYltac+piPa7VW2hMIWpeisS/WkmjTe7abSr/LGaL0QIkw
	Sxz8hNsG1xmHHQG2YaFGhxQEOoorOL6xqnYPNplzt/WnLlwJ+iXNpYLKac2XNJjJGlUSbe+Tqwa1/
	MpwHSAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQzm-0000000H8QJ-2ICX;
	Wed, 24 Dec 2025 15:41:50 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQzj-0000000H8Ov-2dZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:41:49 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-88fca7bce90so46571256d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766590906; x=1767195706; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4cJOp3Zboju26ptOSTfN4m6v5W2HkANfWbhd+iDMpdY=;
        b=2u13ZQfpgkQBI8EION+F6nYxoAmWmm3JuYLLwan3o8WEDSTWy8a4ML7Bs2UyFFfewb
         CcMc0NTOY4TgKf29I0epWyUOf9gzBd8f7sBpP84ELvU9mWMYWMEIr1KanpXmSDSwnBJc
         sKMnkm7lQPqjea6i7iwgmY++OzChZKTHq+pPrPRX/xAEh3bKBIiQciSTiEi7BDSFN+6g
         mtLf/2OfHjBuNkZhI6B7rFZq8EgIH1xAG1dxWlbRKU8lh527ZaexP0lyb8X6NzRp5kQn
         qE1zfVjZa5n4us9SFtWkK3+PIOL+frkLa/u/xGyfbNT2GbTkMIyE2OcrCCBDaI9cOr9C
         LHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590906; x=1767195706;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cJOp3Zboju26ptOSTfN4m6v5W2HkANfWbhd+iDMpdY=;
        b=tGTh35x2FDHwyBxZzZVJiEE7P+ZYQMOweW7W8WuryGdSRjjTcigyP0QukxwYZgKnS0
         s/0uFlN4e/D6bPVa97nIoKsTB/bb7rJTmf1LQQyKob9oIiK3JZN6TR3PE8YjZasRligi
         CR7hPkE+Y4YfT+p2AW2wwbLFz56x5lFLdOA6Z5Glp89ujQQDOnk84Z530qJCYiFdhK/J
         5EaIVW/nYbxj9J+vBq6Dm8jf8d8WS/Qx9bOOtNbsVtV0zLq+ig5ULYTCvJRIwDxaWH1z
         IsAW5oqczd8bxRJNf6KdaZM4jVNOSbaSJGBldLgz5Kwe9XzLg7x8NdaUhmSKaXIz+9tg
         9sbg==
X-Forwarded-Encrypted: i=1; AJvYcCVEF16P3FOCRUC5VSd1HrKDop7xrluhbbUtOM66Pb0yPSuvdZOciyfc2DfqVi3h4UYQ9gO4PSnzK+A5uuJb47UB@lists.infradead.org
X-Gm-Message-State: AOJu0YzT907vKGphdOj4rmrNTibcuhlutT75Bu50J0IgL15aqlagFELz
	mgf4NTa91C4u/0fS0z02DuE+OI1FILEcbYfNB1zDIh5/ah6Z2jnS1EjGi2IHDzEi6gs=
X-Gm-Gg: AY/fxX7az5/Dpl02R9B3IwMMrz6iRJku8S/DQUKBmlKb2FZ1+CHbgjEB6+tGLXArZIE
	Xun8RJdCUTYBPJpGHkAuNFlMBGPd9gFBMZxi2xSfz84JE8YAgHytctp7s/8nDXyYAxuXcDoOZhP
	L2MbDPAVlueYPwgx1hUOZ+3PZ+u5j7Y7UCYru333KPwk5vSCssHB5tioAOAOexDbtMOEoFMWREO
	CkxD6QJ2fiH+qYgrGmpRin4DbELkOtR4B++2IGbhZvZzaaLEcq1w2evWsCpu+Jj+S79/gBNPhIS
	RNVxNQ9nwkzAjImS33wvnVoy4w7Zf8TlgmyStn9qgzr/piJTSzjfOsY+unJQAas0cw/4LmnjCWZ
	4PekE9WM7EZNzfZN4/t2FJYkPBih8l7vpONMOy9h2NX3VxXYgI3yQ0fY8+ZspZVwjKbSMw5cLSe
	FXB2qeZ7RXSA3Cqrqg
X-Google-Smtp-Source: AGHT+IFRtbG+elw5PxYXalq9TAz4TzE+scokfylcO9+kWGqouFNI8oSQuaZmk5NwD0U1SvtgeX582A==
X-Received: by 2002:a0c:c3d0:0:b0:889:b6f1:1f30 with SMTP id 6a1803df08f44-88d825257f0mr266398716d6.18.1766590906084;
        Wed, 24 Dec 2025 07:41:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a741365sm131235296d6.53.2025.12.24.07.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:41:45 -0800 (PST)
Message-ID: <32a69cd80152bb7f52743a609a4c15cb56d008a2.camel@ndufresne.ca>
Subject: Re: [PATCH v2 13/22] media: rockchip: rga: change offset to
 dma_addresses
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
Date: Wed, 24 Dec 2025 10:41:44 -0500
In-Reply-To: <20251203-spu-rga3-v2-13-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-13-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-XzIQ9JAoskxiG+mb7m7O"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_074147_702324_75F0BDCF 
X-CRM114-Status: GOOD (  23.28  )
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


--=-XzIQ9JAoskxiG+mb7m7O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Change the offset to dma_addresses, as the current naming is misleading.
> The offset naming comes from the fact that it references the offset in
> the mapped iommu address space. But from the hardware point of view this
> is an address, as also pointed out by the register naming
> (e.g. RGA_DST_Y_RGB_BASE_ADDR). Therefore also change the type to
> dma_addr_t, as with an external iommu driver this would also be the
> correct type.
>=20
> This change is a preparation for the RGA3 support, which uses an external
> iommu and therefore just gets an dma_addr_t for each buffer. The field
> renaming allows to reuse the existing fields of rga_vb_buffer to store
> these values.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c |=C2=A0 12 +--
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 | 105 ++++++++++=
+++------------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 +--
> =C2=A03 files changed, 64 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c
> b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 0c59a4d330888..8845e1f894f29 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -118,7 +118,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	size_t curr_desc =3D 0;
> =C2=A0	int i;
> =C2=A0	const struct v4l2_format_info *info;
> -	unsigned int offsets[VIDEO_MAX_PLANES];
> +	unsigned int dma_addrs[VIDEO_MAX_PLANES];
> =C2=A0
> =C2=A0	if (IS_ERR(f))
> =C2=A0		return PTR_ERR(f);
> @@ -142,18 +142,18 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0				 "Failed to map video buffer to RGA\n");
> =C2=A0			return n_desc;
> =C2=A0		}
> -		offsets[i] =3D curr_desc << PAGE_SHIFT;
> +		dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> =C2=A0		curr_desc +=3D n_desc;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Fill the remaining planes */
> =C2=A0	info =3D v4l2_format_info(f->fmt->fourcc);
> =C2=A0	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] =3D get_plane_offset(f, info, i);
> +		dma_addrs[i] =3D dma_addrs[0] + get_plane_offset(f, info, i);
> =C2=A0
> -	rbuf->offset.y_off =3D offsets[0];
> -	rbuf->offset.u_off =3D offsets[1];
> -	rbuf->offset.v_off =3D offsets[2];
> +	rbuf->dma_addrs.y_addr =3D dma_addrs[0];
> +	rbuf->dma_addrs.u_addr =3D dma_addrs[1];
> +	rbuf->dma_addrs.v_addr =3D dma_addrs[2];
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 8953960d33bc5..fe6f518aedd4e 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -16,11 +16,11 @@ enum e_rga_start_pos {
> =C2=A0	RB =3D 3,
> =C2=A0};
> =C2=A0
> -struct rga_corners_addr_offset {
> -	struct rga_addr_offset left_top;
> -	struct rga_addr_offset right_top;
> -	struct rga_addr_offset left_bottom;
> -	struct rga_addr_offset right_bottom;
> +struct rga_corners_addrs {
> +	struct rga_addrs left_top;
> +	struct rga_addrs right_top;
> +	struct rga_addrs left_bottom;
> +	struct rga_addrs right_bottom;
> =C2=A0};
> =C2=A0
> =C2=A0static unsigned int rga_get_scaling(unsigned int src, unsigned int =
dst)
> @@ -36,48 +36,47 @@ static unsigned int rga_get_scaling(unsigned int src,
> unsigned int dst)
> =C2=A0	return (src > dst) ? ((dst << 16) / src) : ((src << 16) / dst);
> =C2=A0}
> =C2=A0
> -static struct rga_corners_addr_offset
> -rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offse=
t,
> -		=C2=A0=C2=A0=C2=A0 unsigned int x, unsigned int y, unsigned int w, uns=
igned
> int h)
> +static struct rga_corners_addrs
> +rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int x, unsigned int y, unsigned int =
w, unsigned
> int h)
> =C2=A0{
> -	struct rga_corners_addr_offset offsets;
> -	struct rga_addr_offset *lt, *lb, *rt, *rb;
> +	struct rga_corners_addrs corner_addrs;
> +	struct rga_addrs *lt, *lb, *rt, *rb;
> =C2=A0	unsigned int x_div =3D 0,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 y_div =3D 0, uv_stride =3D 0, pixel_widt=
h =3D 0;
> =C2=A0
> -	lt =3D &offsets.left_top;
> -	lb =3D &offsets.left_bottom;
> -	rt =3D &offsets.right_top;
> -	rb =3D &offsets.right_bottom;
> +	lt =3D &corner_addrs.left_top;
> +	lb =3D &corner_addrs.left_bottom;
> +	rt =3D &corner_addrs.right_top;
> +	rb =3D &corner_addrs.right_bottom;
> =C2=A0
> =C2=A0	x_div =3D frm->fmt->x_div;
> =C2=A0	y_div =3D frm->fmt->y_div;
> =C2=A0	uv_stride =3D frm->stride / x_div;
> =C2=A0	pixel_width =3D frm->stride / frm->pix.width;
> =C2=A0
> -	lt->y_off =3D offset->y_off + y * frm->stride + x * pixel_width;
> -	lt->u_off =3D offset->u_off + (y / y_div) * uv_stride + x / x_div;
> -	lt->v_off =3D offset->v_off + (y / y_div) * uv_stride + x / x_div;
> +	lt->y_addr =3D addrs->y_addr + y * frm->stride + x * pixel_width;
> +	lt->u_addr =3D addrs->u_addr + (y / y_div) * uv_stride + x / x_div;
> +	lt->v_addr =3D addrs->v_addr + (y / y_div) * uv_stride + x / x_div;
> =C2=A0
> -	lb->y_off =3D lt->y_off + (h - 1) * frm->stride;
> -	lb->u_off =3D lt->u_off + (h / y_div - 1) * uv_stride;
> -	lb->v_off =3D lt->v_off + (h / y_div - 1) * uv_stride;
> +	lb->y_addr =3D lt->y_addr + (h - 1) * frm->stride;
> +	lb->u_addr =3D lt->u_addr + (h / y_div - 1) * uv_stride;
> +	lb->v_addr =3D lt->v_addr + (h / y_div - 1) * uv_stride;
> =C2=A0
> -	rt->y_off =3D lt->y_off + (w - 1) * pixel_width;
> -	rt->u_off =3D lt->u_off + w / x_div - 1;
> -	rt->v_off =3D lt->v_off + w / x_div - 1;
> +	rt->y_addr =3D lt->y_addr + (w - 1) * pixel_width;
> +	rt->u_addr =3D lt->u_addr + w / x_div - 1;
> +	rt->v_addr =3D lt->v_addr + w / x_div - 1;
> =C2=A0
> -	rb->y_off =3D lb->y_off + (w - 1) * pixel_width;
> -	rb->u_off =3D lb->u_off + w / x_div - 1;
> -	rb->v_off =3D lb->v_off + w / x_div - 1;
> +	rb->y_addr =3D lb->y_addr + (w - 1) * pixel_width;
> +	rb->u_addr =3D lb->u_addr + w / x_div - 1;
> +	rb->v_addr =3D lb->v_addr + w / x_div - 1;
> =C2=A0
> -	return offsets;
> +	return corner_addrs;
> =C2=A0}
> =C2=A0
> -static struct rga_addr_offset *rga_lookup_draw_pos(struct
> -		rga_corners_addr_offset
> -		* offsets, u32 rotate_mode,
> -		u32 mirr_mode)
> +static struct rga_addrs *rga_lookup_draw_pos(struct rga_corners_addrs
> *corner_addrs,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 u32 rotate_mode,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 u32 mirr_mode)
> =C2=A0{
> =C2=A0	static enum e_rga_start_pos rot_mir_point_matrix[4][4] =3D {
> =C2=A0		{
> @@ -94,18 +93,18 @@ static struct rga_addr_offset *rga_lookup_draw_pos(st=
ruct
> =C2=A0		},
> =C2=A0	};
> =C2=A0
> -	if (!offsets)
> +	if (!corner_addrs)
> =C2=A0		return NULL;
> =C2=A0
> =C2=A0	switch (rot_mir_point_matrix[rotate_mode][mirr_mode]) {
> =C2=A0	case LT:
> -		return &offsets->left_top;
> +		return &corner_addrs->left_top;
> =C2=A0	case LB:
> -		return &offsets->left_bottom;
> +		return &corner_addrs->left_bottom;
> =C2=A0	case RT:
> -		return &offsets->right_top;
> +		return &corner_addrs->right_top;
> =C2=A0	case RB:
> -		return &offsets->right_bottom;
> +		return &corner_addrs->right_bottom;
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -307,9 +306,9 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ct=
x)
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_cmd_set_src_info(struct rga_ctx *ctx,
> -				 struct rga_addr_offset *offset)
> +				 struct rga_addrs *addrs)
> =C2=A0{
> -	struct rga_corners_addr_offset src_offsets;
> +	struct rga_corners_addrs src_corner_addrs;
> =C2=A0	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int src_h, src_w, src_x, src_y;
> =C2=A0
> @@ -321,22 +320,22 @@ static void rga_cmd_set_src_info(struct rga_ctx *ct=
x,
> =C2=A0	/*
> =C2=A0	 * Calculate the source framebuffer base address with offset pixel=
.
> =C2=A0	 */
> -	src_offsets =3D rga_get_addr_offset(&ctx->in, offset,
> -					=C2=A0 src_x, src_y, src_w, src_h);
> +	src_corner_addrs =3D rga_get_corner_addrs(&ctx->in, addrs,
> +						src_x, src_y, src_w, src_h);
> =C2=A0
> =C2=A0	dest[(RGA_SRC_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
> -		src_offsets.left_top.y_off;
> +		src_corner_addrs.left_top.y_addr;
> =C2=A0	dest[(RGA_SRC_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
> -		src_offsets.left_top.u_off;
> +		src_corner_addrs.left_top.u_addr;
> =C2=A0	dest[(RGA_SRC_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
> -		src_offsets.left_top.v_off;
> +		src_corner_addrs.left_top.v_addr;
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
> -				 struct rga_addr_offset *offset)
> +				 struct rga_addrs *addrs)
> =C2=A0{
> -	struct rga_addr_offset *dst_offset;
> -	struct rga_corners_addr_offset offsets;
> +	struct rga_addrs *dst_addrs;
> +	struct rga_corners_addrs corner_addrs;
> =C2=A0	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int dst_h, dst_w, dst_x, dst_y;
> =C2=A0	unsigned int mir_mode =3D 0;
> @@ -370,15 +369,15 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ct=
x,
> =C2=A0	/*
> =C2=A0	 * Configure the dest framebuffer base address with pixel offset.
> =C2=A0	 */
> -	offsets =3D rga_get_addr_offset(&ctx->out, offset, dst_x, dst_y, dst_w,
> dst_h);
> -	dst_offset =3D rga_lookup_draw_pos(&offsets, rot_mode, mir_mode);
> +	corner_addrs =3D rga_get_corner_addrs(&ctx->out, addrs, dst_x, dst_y,
> dst_w, dst_h);
> +	dst_addrs =3D rga_lookup_draw_pos(&corner_addrs, rot_mode, mir_mode);
> =C2=A0
> =C2=A0	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
> -		dst_offset->y_off;
> +		dst_addrs->y_addr;
> =C2=A0	dest[(RGA_DST_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
> -		dst_offset->u_off;
> +		dst_addrs->u_addr;
> =C2=A0	dest[(RGA_DST_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
> -		dst_offset->v_off;
> +		dst_addrs->v_addr;
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_cmd_set_mode(struct rga_ctx *ctx)
> @@ -417,8 +416,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0
> =C2=A0	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
> =C2=A0
> -	rga_cmd_set_src_info(ctx, &src->offset);
> -	rga_cmd_set_dst_info(ctx, &dst->offset);
> +	rga_cmd_set_src_info(ctx, &src->dma_addrs);
> +	rga_cmd_set_dst_info(ctx, &dst->dma_addrs);
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index ee50f7f3ed601..772f7dff9a8e5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -98,10 +98,10 @@ struct rockchip_rga {
> =C2=A0	const struct rga_hw *hw;
> =C2=A0};
> =C2=A0
> -struct rga_addr_offset {
> -	unsigned int y_off;
> -	unsigned int u_off;
> -	unsigned int v_off;
> +struct rga_addrs {
> +	dma_addr_t y_addr;
> +	dma_addr_t u_addr;
> +	dma_addr_t v_addr;
> =C2=A0};
> =C2=A0
> =C2=A0struct rga_vb_buffer {
> @@ -113,8 +113,8 @@ struct rga_vb_buffer {
> =C2=A0	dma_addr_t dma_desc_pa;
> =C2=A0	size_t n_desc;
> =C2=A0
> -	/* Plane offsets of this buffer into the mapping */
> -	struct rga_addr_offset offset;
> +	/* Plane DMA addresses after the MMU mapping of the buffer */
> +	struct rga_addrs dma_addrs;
> =C2=A0};
> =C2=A0
> =C2=A0static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffe=
r *vb)

--=-XzIQ9JAoskxiG+mb7m7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwJuAAKCRDZQZRRKWBy
9C0sAQC7c89Ua60SBcVOxT2Qj8jM9tBwHZPJeIfiTWHDiHLo0QEA4pzupbY+wPXZ
x2kZ7zYoDcdYGsX+Hg8f2ELtK7LCfQ8=
=amzr
-----END PGP SIGNATURE-----

--=-XzIQ9JAoskxiG+mb7m7O--

