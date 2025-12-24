Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2903EE7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwkJIIAOyC+iGrxHsI9snh+xrQsvtUQwuewCKc8KNUQ=; b=1dWDd4zErV0LN068CYvhEDXpsG
	k0zJ/AExShS1824FNne/9XMkGHw5/2xHbjzC71iXKM38vZMS0n4MhrI9BnyyCh+VYZQf2K5IEQwFc
	PD1IdrOaz1uPH8iwHF4tqkgZS1wORA5RJN+86tezhBtaE/F6vepkPyeF3Kis98d1c9PuvxWzMqCZH
	woKcEKUEXjHDU3jLJhna8zsDxrbeAzU/iaSsKaWyK159hNdzPx8dZSBvLJU5TDmIjVfWxOj+QWR+V
	p+XzRIx7lon+svEfCu2JemgwdmdIdKTc48IgJriFnGwOm1n7rGDHEcOIR1ALgsEIysIRAowAGMoSG
	BzV3qPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQo6-0000000H6t0-1KLf;
	Wed, 24 Dec 2025 15:29:46 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQo3-0000000H6sI-3J5b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:29:44 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4f1b4bb40aaso31880721cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766590183; x=1767194983; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TwkJIIAOyC+iGrxHsI9snh+xrQsvtUQwuewCKc8KNUQ=;
        b=0/MJ51nnUn9Pnx9Dm+cJcSvkxI5ESPQc/Lm7wFKlHDnbnP5nYpVS7oETJ4Zdv3QZHo
         jxJ7jPGcrqm8udk+n+ssSkImwJdPdos7dcz2h45fSAzqE5DfJsSJuNr1nOUpbIN5GQie
         EE/mGipRQuMmc1e42vfTSG9zBu4XS4Ck6qVHDP3/t8RH9RN4exX/TO8gNubE6mAhUaa3
         NO/7KsM2Otkl8qm+SqGZvpa20mP3vyGvlakcAc1bjsrrh2pHVw7obgoKbFawjJdIgVEc
         7ioBt6mY4pyeg+cZ2OiP4mrXibiooALFeD6uK27XY0cPbsb7tbeHXE64m38znWpOkRrL
         jPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590183; x=1767194983;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwkJIIAOyC+iGrxHsI9snh+xrQsvtUQwuewCKc8KNUQ=;
        b=p/5feKbptf+rsXFe9piWVNIb+aC0EkvFFl8gSKJbzrCtGP4x3tRcWSpDRVwKE8lTOR
         B+Bhi7iDVpV1ZB3KJWyzVtRloLKHIOIPau2A4Db9f0sZ2V/uyFG8EuyGZsJSoXBNLqoE
         W8NVxQIXX72TO+KEVhnVJE9JhR2hbYM934U0ssdUBWReI68GnwjmU5KV1WWMh149IgUD
         OFww9UllwMsYtogcgC5lYJHOvEo05/+lgLN0lvlQU8Rvg8o6LZ/jH//mP+dVp+virVSE
         Xs4ki4NX+HcNycZ7pMt5smhaga5LJvuAKEvF+a4UQeyw70Uk6pwjgfXkBKQcAXnt6Hp+
         qqZg==
X-Forwarded-Encrypted: i=1; AJvYcCUyXAr4KwisAA+AghFeNVZzOIG5tabnnp5A2WJ3oT7lIV5q/aPE0WfSCw9MVUpTpB0tKx9OgRXLZ1Xc3OjC1waQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+8pB4UiiJZ59H6XF2TqHfirl+saloLn/KtBMyrLLb/BukXLmk
	guM3nQTw8ZV0LEvR1B/kaSSd6XJgWz6PkKRA54uD9CEbXLvX22eZdODGa3MU2BcNdGc=
X-Gm-Gg: AY/fxX4IBSMKrnOf/4S03WlLO6xAnoBODO+nDKBaE63NByViJj3M+f0h3aZrxxnlpFy
	hOExUpEhVCwWAIB1eEfQePtLPJOVXXa9dQjwJTTN5uH3GWZkUh2z4NMPen606yNRYHErRZMRJHa
	aSdoNkC+A9Ul7uCKatBr9hnPL4Nq3/YFxxW22iThYHOd4mLrq+N9pM61I9rd3+EeCwhL00GJ8h5
	iW29eRgvY3HqisJWgtU+Wr2DJ33AM3bfjnsjHXhCr0qd2HNYaI9QP5RqTzDCmCuPZYn9f4rks8f
	DVj2zdvywlX/RLn4yHP9NBzdxMOzYLoiNox3Le+d4dBvvaidNj7Wv3JaKzj63ayWql/+DltwOmv
	20gAY19p2p68qe5DruAHnJe86NA4owCeAYa3hZgphWOExBoGvt/6Xu/ljmj8Ckzj5yQMFt2dF6N
	ryE2lRzycI4S1TK/XS
X-Google-Smtp-Source: AGHT+IFurORRUJNULnlbX94R2za/XCt3vvaDyHm+KjHk3sOKh4CoRdkgBOx3YgO3VJabdA7p5qCnbw==
X-Received: by 2002:a05:622a:4d93:b0:4e8:96ed:2e65 with SMTP id d75a77b69052e-4f4abcc50e0mr263126051cf.22.1766590182533;
        Wed, 24 Dec 2025 07:29:42 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66841bsm120154681cf.30.2025.12.24.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:29:41 -0800 (PST)
Message-ID: <8c3a3299036dd1bab158bdcd589abd027d2864b6.camel@ndufresne.ca>
Subject: Re: [PATCH v2 10/22] media: rockchip: rga: prepare cmdbuf on
 streamon
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
Date: Wed, 24 Dec 2025 10:29:41 -0500
In-Reply-To: <20251203-spu-rga3-v2-10-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-10-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-wgUFX3W9vJo/GeY1uEul"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_072943_845368_CBBAD15E 
X-CRM114-Status: GOOD (  21.69  )
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


--=-wgUFX3W9vJo/GeY1uEul
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Prepare the command buffer on streamon to reuse it's contents instead of
> completely writing it for every frame. Due to the stream settings being
> fixed after a streamon we only need to replace the source and destination
> addresses for each frame. This reduces the amount of CPU and memory
> operations done in each frame.

My speculation is that flushing to device is usually more expensive then th=
is,
but I didn't check closely if you have enabled the caches. That being said,=
 this
is good change. It highlight the inflexible nature of V4L2 imho, which in t=
his
case can be used to optimize.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 13 ++=
++++++++++-
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A03 files changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 56a2558539bfb..8cdfe089fd636 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -408,8 +408,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> -
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> =C2=A0	 * Due to hardware bug,
> @@ -418,11 +416,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
> =C2=A0
> =C2=A0	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
> -	rga_cmd_set_mode(ctx);
> =C2=A0
> =C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> -	rga_cmd_set_trans_info(ctx);
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> @@ -431,6 +427,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> +static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
> +{
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +
> +	rga_cmd_set_mode(ctx);
> +	rga_cmd_set_trans_info(ctx);
> +}
> +
> =C2=A0static void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0			 struct rga_vb_buffer *src,=C2=A0 struct rga_vb_buffer *dst)
> =C2=A0{
> @@ -622,6 +626,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_height =3D MAX_HEIGHT,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> +	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> =C2=A0	.get_version =3D rga_get_version,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 592c977a07cf3..f02ae02de26ca 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -523,6 +523,17 @@ static int vidioc_s_selection(struct file *file, voi=
d *priv,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static int vidioc_streamon(struct file *file, void *priv,
> +			=C2=A0=C2=A0 enum v4l2_buf_type type)
> +{
> +	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> +
> +	hw->setup_cmdbuf(ctx);
> +
> +	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
> +}
> +
> =C2=A0static const struct v4l2_ioctl_ops rga_ioctl_ops =3D {
> =C2=A0	.vidioc_querycap =3D vidioc_querycap,
> =C2=A0
> @@ -547,7 +558,7 @@ static const struct v4l2_ioctl_ops rga_ioctl_ops =3D =
{
> =C2=A0	.vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> =C2=A0	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> =C2=A0
> -	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamon =3D vidioc_streamon,
> =C2=A0	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> =C2=A0
> =C2=A0	.vidioc_g_selection =3D vidioc_g_selection,
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 0aef348dddb95..93162b118d069 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -154,6 +154,7 @@ struct rga_hw {
> =C2=A0	u32 max_width, max_height;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> +	void (*setup_cmdbuf)(struct rga_ctx *ctx);
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> =C2=A0	bool (*handle_irq)(struct rockchip_rga *rga);

--=-wgUFX3W9vJo/GeY1uEul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwG5QAKCRDZQZRRKWBy
9O4FAP9E2aNeLRZt1zQcbEal6Ub+hRLjCwZuHvx4d6mo+exV+gD8D3fEU7lK1Rbl
U4jgUBplP0NBwSIZ6m7R2BXkERRjOQA=
=EAR/
-----END PGP SIGNATURE-----

--=-wgUFX3W9vJo/GeY1uEul--

