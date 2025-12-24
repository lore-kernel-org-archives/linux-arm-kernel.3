Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F084FE7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6glIL6eKp+kKBjZvK5n8WItuloB18dl6WGJ3uf/Wmj0=; b=NKLnX1JfC8hr6VmRxKe/W5GaAF
	RSaP2OsYEjZqLD0O2g8+6Qth8N93r73TblswDvbhPrr3w14fSsGgUQG5oUkksynpRNsjrIVBB45VP
	9F1GN5bMLB9o+PeHckbdRdaiIaUe6pQrTH87J28uObotvdhqxF+PgoY2VEAUjDGtlplD8jd6niDDa
	SvJlHFzqlaKjNtCNVitzZgKfC6CkCHCkynNyzLSR8UeVmPBMv4v5fDJNn9q+C1czyJ86/4LsMtZdz
	I65GNfNVu5KG2VgJq22oal9Rrb63ApIpvw9801/n7lq266WFYu1yTnzUV5oIwMNhcgvDnUSoMyA3h
	CYXqst/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQfx-0000000H5iz-01YK;
	Wed, 24 Dec 2025 15:21:21 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQfq-0000000H5h9-08yg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:21:17 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8888a1c50e8so76991036d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766589673; x=1767194473; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6glIL6eKp+kKBjZvK5n8WItuloB18dl6WGJ3uf/Wmj0=;
        b=qKbJqUoWpwiyUbQCDWiXXvHjAOINugN3jrkHWftjNL+y59cJ8cHZfV/uhK7YB2doQh
         gV54Zfhszxjo2UuV83yniujSuaCeUn/INygfzSwgukye/OinVV77tyKrw6mGwCjFeRnS
         c7ao0ErO3eJJMbbkBoUv1R0wD0soG/zhOFu1yUPncJIIdRiVhD5YpX5Bu7TXSZ2UhqiW
         EII8WVunP7lDH+Wt56yujGXUM4WBq66X7izzzUhZX8gcv9yBHU/h71y+j7j7JlJUz+d0
         55EPJt8L5Wsd9SedPnKIBKOHaOWO13ceuVyp/kEaRKB+Kzvga7sPzP07VeceMANqsVnz
         Fang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589673; x=1767194473;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6glIL6eKp+kKBjZvK5n8WItuloB18dl6WGJ3uf/Wmj0=;
        b=YQ4YY3qcSdtuf1YqqgRgqfleh9kuWHtuObfcOSPQ7DZb2K/SAznyHHMIbyIUojUDng
         v9NF2ThrP5mqVS9e8Guu0mp5QGoM0Gudi85JdjX+z1eGPORHDQEZFcTa1/7RC1M1hCzD
         5QVAQKouR7bXmd7E3crnsDw1qTOOYct59Hc08VOxhbv4lkDJeUxVj/14DCE9yM1xvwDO
         0KJhqW26LdG3FI5dINs9QIdP2nEjc06elYcLsolhUAo1mrlgRrWrApBVPqJAc5kHd9Ij
         56SobLI4DsVdRfH/NbdmzhEIcmdzxye8hFhGJG0+3T0oFr85TXwEh7CWDCXKkuKZV3PB
         nz4A==
X-Forwarded-Encrypted: i=1; AJvYcCULqIEHAVcbEEwSYhXbwf7NyJhy638MnsYVOBN4Wt2A+/WPeTkeOGVL+mh7pgYENDkwsgLUO7OGx6rjBVu2RjsS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wQaKZyD624Fc5X34fnnpq+NeB60bKkQpeX4YJ3Z/T0zSpQGL
	Rps6P77RdY3h/5HYSQi2l9tm/UvrRotPO3ig5nRvV0IjN4ya7AZeERQb30iylswLgz0=
X-Gm-Gg: AY/fxX5IqgUtuo84XrlE2vdKDcVwUCcYQAoRskH+SiM1DfVq5Xfeai8ddCjIc3u32xi
	I9ZSXPcFnl+P1r0djiJInAPwH8ZzH4GL7c5mcQ7QtkxH+x2A0IZRBSjUdNj6rTZiD24jgYSGK+l
	xCkpD6+j/S2e/UYaadNAFuFqzCwGKZhu7P5VoEEZz6HhIun1cA6sfswQ0iixreCcQEmPj1ugiH8
	csJ2fhvneM2uInMAdSQnjcgDXjzQGz9zpReu2IVfxqTYfGppR1LnNm89liqiohhM98qqDFqaJve
	xbDrrE912HjcC0YQsoabmnPoK25DSAGN70/RvKk//H2AHr8ABVYW2ElyqhIJS+ZJLc1EGQjkZpg
	/L/fzLM8MhFTMBoj+guwl3SwV3vHSRuBn2ItMW/7XALim3ZAOds4Sid/wcY37yIbizx4l3rwIad
	CBm/SHASZwR+L25IDECFyif1uVYFw=
X-Google-Smtp-Source: AGHT+IGnRKP+s7rGYiia4Dsfwen4EGHTYTBBqUpeqJ9Opguixy4B6Hh0+XAtrq5sDUYlC0VBSQ/LPA==
X-Received: by 2002:a05:622a:4813:b0:4f1:bacc:151 with SMTP id d75a77b69052e-4f4abdb66c2mr291705921cf.60.1766589672690;
        Wed, 24 Dec 2025 07:21:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64e43asm122304191cf.26.2025.12.24.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:21:12 -0800 (PST)
Message-ID: <b8dac5e182ed5142506ac730911c4158daeb4fd4.camel@ndufresne.ca>
Subject: Re: [PATCH v2 08/22] media: rockchip: rga: move cmdbuf to rga_ctx
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
Date: Wed, 24 Dec 2025 10:21:10 -0500
In-Reply-To: <20251203-spu-rga3-v2-8-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-8-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Nrb1QznaERS51PvTN0N7"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_072114_532395_B2A2FAC8 
X-CRM114-Status: GOOD (  26.95  )
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


--=-Nrb1QznaERS51PvTN0N7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Move the command buffer to the rga_ctx struct in preparation to reuse
> an already prepared command buffer. Having a command buffer per context
> allows to reuse the command buffer for other frames even when
> multiple applications are using the RGA in at the same time.

So the command buffer is only holding commands for a single render, and its=
 not
possible to append to it right ? It has no sync point or anything that woul=
d let
us program it live ?

In this context, that sounds about right. Though please rework the commit
message, I find it a little miss-leading, since in the code you still progr=
am it
in device_run(), which is during the idle portion of the hardware.

To really benefit, you would have to program and flush it on the context qb=
uf,
so that once device_run() is call, you just have to set the command buf for=
 the
context and trigger. Basically, no performance is gained from this patch I
believe.

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

With a clear commit message:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 28 +++++++---------
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 48 ++=
++++++++++++++-----------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 +--
> =C2=A03 files changed, 41 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 7419784efc693..79bf911e74779 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -113,8 +113,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(st=
ruct
> =C2=A0
> =C2=A0static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dm=
a_addr)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int reg;
> =C2=A0
> =C2=A0	reg =3D RGA_MMU_SRC_BASE - RGA_MODE_BASE_REG;
> @@ -126,8 +125,7 @@ static void rga_cmd_set_src_addr(struct rga_ctx *ctx,
> dma_addr_t dma_addr)
> =C2=A0
> =C2=A0static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t d=
ma_addr)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int reg;
> =C2=A0
> =C2=A0	reg =3D RGA_MMU_SRC1_BASE - RGA_MODE_BASE_REG;
> @@ -139,8 +137,7 @@ static void rga_cmd_set_src1_addr(struct rga_ctx *ctx=
,
> dma_addr_t dma_addr)
> =C2=A0
> =C2=A0static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dm=
a_addr)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int reg;
> =C2=A0
> =C2=A0	reg =3D RGA_MMU_DST_BASE - RGA_MODE_BASE_REG;
> @@ -153,7 +150,7 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx,
> dma_addr_t dma_addr)
> =C2=A0static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int scale_dst_w, scale_dst_h;
> =C2=A0	unsigned int src_h, src_w, dst_h, dst_w;
> =C2=A0	union rga_src_info src_info;
> @@ -313,8 +310,7 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
> =C2=A0				 struct rga_addr_offset *offset)
> =C2=A0{
> =C2=A0	struct rga_corners_addr_offset src_offsets;
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int src_h, src_w, src_x, src_y;
> =C2=A0
> =C2=A0	src_h =3D ctx->in.crop.height;
> @@ -341,8 +337,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rga_addr_offset *dst_offset;
> =C2=A0	struct rga_corners_addr_offset offsets;
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	unsigned int dst_h, dst_w, dst_x, dst_y;
> =C2=A0	unsigned int mir_mode =3D 0;
> =C2=A0	unsigned int rot_mode =3D 0;
> @@ -388,8 +383,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
> =C2=A0
> =C2=A0static void rga_cmd_set_mode(struct rga_ctx *ctx)
> =C2=A0{
> -	struct rockchip_rga *rga =3D ctx->rga;
> -	u32 *dest =3D rga->cmdbuf_virt;
> +	u32 *dest =3D ctx->cmdbuf_virt;
> =C2=A0	union rga_mode_ctrl mode;
> =C2=A0	union rga_alpha_ctrl0 alpha_ctrl0;
> =C2=A0	union rga_alpha_ctrl1 alpha_ctrl1;
> @@ -414,7 +408,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> =C2=A0
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> @@ -430,11 +424,11 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> =C2=A0	rga_cmd_set_trans_info(ctx);
> =C2=A0
> -	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);
> +	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> =C2=A0	/* sync CMD buf for RGA */
> -	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
> -		PAGE_SIZE, DMA_BIDIRECTIONAL);
> +	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_hw_start(struct rockchip_rga *rga,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index d8b14c2d9f6a4..74d94c7fe31ff 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -219,6 +219,16 @@ static int rga_open(struct file *file)
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> =C2=A0	if (!ctx)
> =C2=A0		return -ENOMEM;
> +
> +	/* Create CMD buffer */
> +	ctx->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> +					=C2=A0=C2=A0 &ctx->cmdbuf_phy, GFP_KERNEL,
> +					=C2=A0=C2=A0 DMA_ATTR_WRITE_COMBINE);
> +	if (!ctx->cmdbuf_virt) {
> +		ret =3D -ENOMEM;
> +		goto rel_ctx;
> +	}
> +
> =C2=A0	ctx->rga =3D rga;
> =C2=A0	/* Set default formats */
> =C2=A0	ctx->in =3D def_frame;
> @@ -230,15 +240,13 @@ static int rga_open(struct file *file)
> =C2=A0			=C2=A0=C2=A0=C2=A0 ctx->out.fmt->fourcc, def_width, def_height);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> -		kfree(ctx);
> -		return -ERESTARTSYS;
> +		ret =3D -ERESTARTSYS;
> +		goto rel_cmdbuf;
> =C2=A0	}
> =C2=A0	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(rga->m2m_dev, ctx, &queue_in=
it);
> =C2=A0	if (IS_ERR(ctx->fh.m2m_ctx)) {
> =C2=A0		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> -		mutex_unlock(&rga->mutex);
> -		kfree(ctx);
> -		return ret;
> +		goto unlock_mutex;
> =C2=A0	}
> =C2=A0	v4l2_fh_init(&ctx->fh, video_devdata(file));
> =C2=A0	v4l2_fh_add(&ctx->fh, file);
> @@ -252,6 +260,15 @@ static int rga_open(struct file *file)
> =C2=A0	mutex_unlock(&rga->mutex);
> =C2=A0
> =C2=A0	return 0;
> +
> +unlock_mutex:
> +	mutex_unlock(&rga->mutex);
> +rel_cmdbuf:
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> +rel_ctx:
> +	kfree(ctx);
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static int rga_release(struct file *file)
> @@ -266,6 +283,10 @@ static int rga_release(struct file *file)
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> =C2=A0	v4l2_fh_del(&ctx->fh, file);
> =C2=A0	v4l2_fh_exit(&ctx->fh);
> +
> +	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> +
> =C2=A0	kfree(ctx);
> =C2=A0
> =C2=A0	mutex_unlock(&rga->mutex);
> @@ -674,19 +695,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	pm_runtime_put(rga->dev);
> =C2=A0
> -	/* Create CMD buffer */
> -	rga->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> -					=C2=A0=C2=A0 &rga->cmdbuf_phy, GFP_KERNEL,
> -					=C2=A0=C2=A0 DMA_ATTR_WRITE_COMBINE);
> -	if (!rga->cmdbuf_virt) {
> -		ret =3D -ENOMEM;
> -		goto rel_m2m;
> -	}
> -
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&rga->v4l2_dev, "Failed to register video
> device\n");
> -		goto free_dma;
> +		goto rel_m2m;
> =C2=A0	}
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> @@ -694,9 +706,6 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> -free_dma:
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> =C2=A0rel_m2m:
> =C2=A0	v4l2_m2m_release(rga->m2m_dev);
> =C2=A0rel_vdev:
> @@ -713,9 +722,6 @@ static void rga_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =C2=A0
> -	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> -
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =C2=A0
> =C2=A0	v4l2_m2m_release(rga->m2m_dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 98635ddd50d7c..f8c932fdec21a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -56,6 +56,9 @@ struct rga_ctx {
> =C2=A0	struct rga_frame out;
> =C2=A0	struct v4l2_ctrl_handler ctrl_handler;
> =C2=A0
> +	void *cmdbuf_virt;
> +	dma_addr_t cmdbuf_phy;
> +
> =C2=A0	int osequence;
> =C2=A0	int csequence;
> =C2=A0
> @@ -91,8 +94,6 @@ struct rockchip_rga {
> =C2=A0	spinlock_t ctrl_lock;
> =C2=A0
> =C2=A0	struct rga_ctx *curr;
> -	dma_addr_t cmdbuf_phy;
> -	void *cmdbuf_virt;
> =C2=A0
> =C2=A0	const struct rga_hw *hw;
> =C2=A0};

--=-Nrb1QznaERS51PvTN0N7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwE5gAKCRDZQZRRKWBy
9C9uAP9miq59sr/4j3qDWKc9/Ke2pvtoDrTF57xX00GfHHVmYgEA1wVhsn7Yp5xi
QSyuOdd0uR2bq8rAKFW/dRx9gAReywY=
=fSqW
-----END PGP SIGNATURE-----

--=-Nrb1QznaERS51PvTN0N7--

