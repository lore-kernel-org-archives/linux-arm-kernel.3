Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD98E776C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WSMWE/26hpkCga2NLvtQJAspfFCx8jE0uqEewiIag0=; b=rkILpL+3yOYfLYIYK44K1j1wG6
	nt8b8EFErt8YsTTq+DRoPzF281K4oOVbfjzQ/jhkwKPobGD4qz9TXOcLZrodf4OUzNPIMXIQN2ijG
	OM/xZEg3D8JXl0KqvoWDZZb485wgGibuWK8vDuuvr2+wlLw8l0FdGViI53ANqYcRWb6vALobRPcPV
	tkNY1UIRHkluVQA01UQXpuH16N3KXYnfNqVDYBIDBtIumJy1BmrOR/zuFzcDeW1g2G+2H+zSDIKYE
	15pRDeGerN2RMBPPEU+6kOpRhE26UrtwBrAeju7PpfmSloaFOqMHWKWG5qicLp8uBHQqRaUh4ZBrT
	aGTxEDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRHJ-0000000HAzn-0cQV;
	Wed, 24 Dec 2025 15:59:57 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRHE-0000000HAyy-1FFQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:59:55 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8b21fc25ae1so577469585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766591991; x=1767196791; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/WSMWE/26hpkCga2NLvtQJAspfFCx8jE0uqEewiIag0=;
        b=dNaPFJGOxyWjr46jpZUWxw22bDIjs1udYiOqmZ5UYWGDE08hULFUSaEhbySlGEaN4M
         bzHGh8EvmDXI2eqDnn5nBTsDzLJi7/4wGRZseVWEY4w0VN0eFeDkmStuKpwz7HjVYCRn
         LlaxWUtpKV7Bwo0QSsKvvX1Em67EnUJvMiQq0nMRbR/kASk1Du9FVtgovBCsQkwpJ3V0
         dCOY5VNquve/Owbw9wazSdT2t0qLEjDohAVZrePy7JutjzhLBXtKGQL+V6r3hiBCDm76
         tFRnjcUXHz6DlYa+MUCIQ+dXCDLT87R4/jF5+nrCjbonqn4pSIL2aRCDDMMw4o/17yLn
         8VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591991; x=1767196791;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WSMWE/26hpkCga2NLvtQJAspfFCx8jE0uqEewiIag0=;
        b=QoorHrjQoUenRPJVFcTNyn0r8RV6x03x2apuNWYy/upkJtxo0j8JVZthsclHpD097M
         uC5GUIwxU14QornjRjCT5mevXAA5KEL85gT+FgodxecvCrAOoWLUfW71joWaDK4NafBc
         nhBQTTymY0gMtB2QWcihI1TVac2JBN9OOWwQ+yiVCffOcJMkN78LH5acCMA7Xgzktfhr
         5cJTDIFGrGhMX8rMcZeI7K2R+7xIKU2QV9AwEHpFYxxtU0TRtYBdG1Ze6NVgmw0bE+nW
         9K5HHoCjdEMBAJcof2kNtH7kDe8dTeyeAbV4R+QCU/DXbVl+18jQMrVdn94i05FUQjRd
         M1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVTNu2rApVEZ4KDahB4UK4JAxTcN3AUfuzM6UAMLFHvBS2Shr/D+Yb67jleGxs/fgVohznxyepEFSGm9B/mtJUw@lists.infradead.org
X-Gm-Message-State: AOJu0YwT7ymGWPjVMkLb7Kd/CErZjgadwA2nxGuwhAhTWazQ3tC/3Mvn
	vjLmJgRaiwz+5hbyaidiGzFaajJz6E8+ALTMxI8KXzsxHKDplYdIYgtsJb6WedrRhjk=
X-Gm-Gg: AY/fxX6eu8OPjb8T1KNUq3uIuoeztmK5zfcb/hN3r6UNLAYjwGYaZkkXZezbDxbMnVZ
	woU59qIwCaMae9j2GBKyz4Cbv4qzaMF3H+tTcjG9/WNjsYGirhadfLzUTYn0uKSzjvopnbcRFMr
	C4WNoL26yUYkOvMEpG34vgSSHbtJNcBC1OVjTGuVz/os+6xvrAzFDM3FgaksJHGUpno9lpYOeHh
	+xn58genFQrB7nnk4HNSoQlud9U6dVO2ZyGAroyqMY446w31irF+3oiXPdAmRg20Q50S6kYaio1
	mULoJBZ9c5SDQ7Nu4x1cVlhTEzkM14EeQEQ284JtyP611aCTAqp4vcTWjh5eCvrNu47bk3cZna9
	Yd9xoD7qK9ZuKQ4sQ10WruXDRXoGX+4s4VWcZywc2vRxtHfRrNTnsVWbQc6RIUMX54d7F1AomxV
	XcXZjxFewSk1d+jzU3
X-Google-Smtp-Source: AGHT+IEvTXUWsdfb1c7lXzx2lNU4vqAmRcfs5ge8eo5IMBugNQUMOnZvF8ghn8YowoKI01K6gIjpbg==
X-Received: by 2002:a05:620a:691a:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8c08f666fc0mr2781706885a.19.1766591991112;
        Wed, 24 Dec 2025 07:59:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm1415561585a.45.2025.12.24.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:59:50 -0800 (PST)
Message-ID: <de09023e7bdb1698c0bcdeb8d625101cbf647595.camel@ndufresne.ca>
Subject: Re: [PATCH v2 18/22] media: rockchip: rga: move rga_fmt to rga-hw.h
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
Date: Wed, 24 Dec 2025 10:59:49 -0500
In-Reply-To: <20251203-spu-rga3-v2-18-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-18-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Yz7EV6xH1v3dWkULnR4e"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075952_433539_B91E548C 
X-CRM114-Status: GOOD (  30.86  )
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


--=-Yz7EV6xH1v3dWkULnR4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Move rga_fmt to rga-hw in preparation of the RGA3 addition, as the struct
> contains many RGA2 specific values. They are used to write the correct
> register values quickly based on the chosen format. Therefore the
> pointer to the rga_fmt struct is kept but changed to an opaque void
> pointer outside of the rga-hw.h.
>=20
> To enumerate and set the correct formats, two helper functions need to
> be exposed in the rga_hw struct:
>=20
> enum_format just get's the vidioc_enum_fmt format and it's return value
> is also returned from vidioc_enum_fmt. This is a simple pass-through,
> as the implementation is very simple.
>=20
> adjust_and_map_format is a simple abstraction around the previous
> rga_find_format. But unlike rga_find_format, it always returns a valid
> format. Therefore the passed format value is also a pointer to update
> it in case the values are not supported by the hardware.
> Due to the RGA3 supporting different formats on the capture and output
> side, an additional parameter is_capture has been added to support
> this use-case.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c |=C2=A0 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 | 53 +++++++++++=
++++++++++------
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h=C2=A0 | 12 ++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 38 +++++--------------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
 17 ++-------
> =C2=A05 files changed, 68 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index 8de6b9c3fd615..b0f226f7f06d9 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -158,7 +158,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Fill the remaining planes */
> -	info =3D v4l2_format_info(f->fmt->fourcc);
> +	info =3D v4l2_format_info(f->pix.pixelformat);
> =C2=A0	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> =C2=A0		dma_addrs[i] =3D dma_addrs[0] + get_plane_offset(f, info, i);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 4dee33d8f7206..a868a34a1452e 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -44,14 +44,15 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rg=
a_addrs *addrs,
> =C2=A0	struct rga_addrs *lt, *lb, *rt, *rb;
> =C2=A0	unsigned int x_div =3D 0,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 y_div =3D 0, y_stride =3D 0, uv_stride =
=3D 0, pixel_width =3D 0;
> +	struct rga_fmt *fmt =3D frm->fmt;
> =C2=A0
> =C2=A0	lt =3D &corner_addrs.left_top;
> =C2=A0	lb =3D &corner_addrs.left_bottom;
> =C2=A0	rt =3D &corner_addrs.right_top;
> =C2=A0	rb =3D &corner_addrs.right_bottom;
> =C2=A0
> -	x_div =3D frm->fmt->x_div;
> -	y_div =3D frm->fmt->y_div;
> +	x_div =3D fmt->x_div;
> +	y_div =3D fmt->y_div;
> =C2=A0	y_stride =3D frm->pix.plane_fmt[0].bytesperline;
> =C2=A0	uv_stride =3D y_stride / x_div;
> =C2=A0	pixel_width =3D y_stride / frm->pix.width;
> @@ -162,6 +163,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ct=
x)
> =C2=A0	union rga_dst_vir_info dst_vir_info;
> =C2=A0	union rga_dst_act_info dst_act_info;
> =C2=A0	u32 in_stride, out_stride;
> +	struct rga_fmt *in_fmt =3D ctx->in.fmt;
> +	struct rga_fmt *out_fmt =3D ctx->out.fmt;
> =C2=A0
> =C2=A0	src_h =3D ctx->in.crop.height;
> =C2=A0	src_w =3D ctx->in.crop.width;
> @@ -177,18 +180,18 @@ static void rga_cmd_set_trans_info(struct rga_ctx *=
ctx)
> =C2=A0	dst_vir_info.val =3D dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >=
> 2];
> =C2=A0	dst_act_info.val =3D dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >=
> 2];
> =C2=A0
> -	src_info.data.format =3D ctx->in.fmt->hw_format;
> -	src_info.data.swap =3D ctx->in.fmt->color_swap;
> -	dst_info.data.format =3D ctx->out.fmt->hw_format;
> -	dst_info.data.swap =3D ctx->out.fmt->color_swap;
> +	src_info.data.format =3D in_fmt->hw_format;
> +	src_info.data.swap =3D in_fmt->color_swap;
> +	dst_info.data.format =3D out_fmt->hw_format;
> +	dst_info.data.swap =3D out_fmt->color_swap;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * CSC mode must only be set when the colorspace families differ b=
etween
> =C2=A0	 * input and output. It must remain unset (zeroed) if both are the=
 same.
> =C2=A0	 */
> =C2=A0
> -	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
> -	=C2=A0=C2=A0=C2=A0 RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
> +	if (RGA_COLOR_FMT_IS_YUV(in_fmt->hw_format) &&
> +	=C2=A0=C2=A0=C2=A0 RGA_COLOR_FMT_IS_RGB(out_fmt->hw_format)) {
> =C2=A0		switch (ctx->in.pix.colorspace) {
> =C2=A0		case V4L2_COLORSPACE_REC709:
> =C2=A0			src_info.data.csc_mode =3D RGA_SRC_CSC_MODE_BT709_R0;
> @@ -199,8 +202,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ct=
x)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
> -	=C2=A0=C2=A0=C2=A0 RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
> +	if (RGA_COLOR_FMT_IS_RGB(in_fmt->hw_format) &&
> +	=C2=A0=C2=A0=C2=A0 RGA_COLOR_FMT_IS_YUV(out_fmt->hw_format)) {
> =C2=A0		switch (ctx->out.pix.colorspace) {
> =C2=A0		case V4L2_COLORSPACE_REC709:
> =C2=A0			dst_info.data.csc_mode =3D RGA_SRC_CSC_MODE_BT709_R0;
> @@ -619,11 +622,35 @@ static struct rga_fmt formats[] =3D {
> =C2=A0	},
> =C2=A0};
> =C2=A0
> +static void *rga_adjust_and_map_format(struct v4l2_pix_format_mplane *fo=
rmat,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_output)
> +{
> +	unsigned int i;
> +
> +	if (!format)
> +		return &formats[0];
> +
> +	for (i =3D 0; i < ARRAY_SIZE(formats); i++) {
> +		if (formats[i].fourcc =3D=3D format->pixelformat)
> +			return &formats[i];
> +	}
> +
> +	format->pixelformat =3D formats[0].fourcc;
> +	return &formats[0];
> +}
> +
> +static int rga_enum_format(struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >=3D ARRAY_SIZE(formats))
> +		return -EINVAL;
> +
> +	f->pixelformat =3D formats[f->index].fourcc;
> +	return 0;
> +}
> +
> =C2=A0const struct rga_hw rga2_hw =3D {
> =C2=A0	.card_type =3D "rga2",
> =C2=A0	.has_internal_iommu =3D true,
> -	.formats =3D formats,
> -	.num_formats =3D ARRAY_SIZE(formats),
> =C2=A0	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> =C2=A0	.min_width =3D MIN_WIDTH,
> =C2=A0	.max_width =3D MAX_WIDTH,
> @@ -636,4 +663,6 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> =C2=A0	.get_version =3D rga_get_version,
> +	.adjust_and_map_format =3D rga_adjust_and_map_format,
> +	.enum_format =3D rga_enum_format,
> =C2=A0};
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index fffcab0131225..3bc4b1f5acba2 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -6,6 +6,8 @@
> =C2=A0#ifndef __RGA_HW_H__
> =C2=A0#define __RGA_HW_H__
> =C2=A0
> +#include <linux/types.h>
> +
> =C2=A0#define RGA_CMDBUF_SIZE 0x20
> =C2=A0
> =C2=A0/* Hardware limits */
> @@ -431,4 +433,14 @@ union rga_pat_con {
> =C2=A0	} data;
> =C2=A0};
> =C2=A0
> +struct rga_fmt {
> +	u32 fourcc;
> +	int depth;
> +	u8 uv_factor;
> +	u8 y_div;
> +	u8 x_div;
> +	u8 color_swap;
> +	u8 hw_format;
> +};
> +
> =C2=A0#endif
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 7e30fafb25fab..c991cc64b4b7f 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -185,17 +185,6 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelf=
ormat)
> -{
> -	unsigned int i;
> -
> -	for (i =3D 0; i < rga->hw->num_formats; i++) {
> -		if (rga->hw->formats[i].fourcc =3D=3D pixelformat)
> -			return &rga->hw->formats[i];
> -	}
> -	return NULL;
> -}
> -
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type type)
> =C2=A0{
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(type))
> @@ -217,7 +206,6 @@ static int rga_open(struct file *file)
> =C2=A0		.crop.top =3D 0,
> =C2=A0		.crop.width =3D def_width,
> =C2=A0		.crop.height =3D def_height,
> -		.fmt =3D &rga->hw->formats[0],
> =C2=A0	};
> =C2=A0
> =C2=A0	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> @@ -238,9 +226,11 @@ static int rga_open(struct file *file)
> =C2=A0	ctx->in =3D def_frame;
> =C2=A0	ctx->out =3D def_frame;
> =C2=A0
> -	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
> +	ctx->in.fmt =3D rga->hw->adjust_and_map_format(&ctx->in.pix, true);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.pix.pixelformat,
> =C2=A0				=C2=A0=C2=A0=C2=A0 def_width, def_height, rga->hw->stride_align=
ment);
> -	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
> +	ctx->out.fmt =3D rga->hw->adjust_and_map_format(&ctx->out.pix, false);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.pix.pixelformat,
> =C2=A0				=C2=A0=C2=A0=C2=A0 def_width, def_height, rga->hw->stride_align=
ment);
> =C2=A0
> =C2=A0	if (mutex_lock_interruptible(&rga->mutex)) {
> @@ -322,15 +312,8 @@ vidioc_querycap(struct file *file, void *priv, struc=
t v4l2_capability *cap)
> =C2=A0static int vidioc_enum_fmt(struct file *file, void *priv, struct v4=
l2_fmtdesc *f)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D video_drvdata(file);
> -	struct rga_fmt *fmt;
> =C2=A0
> -	if (f->index >=3D rga->hw->num_formats)
> -		return -EINVAL;
> -
> -	fmt =3D &rga->hw->formats[f->index];
> -	f->pixelformat =3D fmt->fourcc;
> -
> -	return 0;
> +	return rga->hw->enum_format(f);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_=
format *f)
> @@ -355,15 +338,13 @@ static int vidioc_try_fmt(struct file *file, void *=
priv, struct v4l2_format *f)
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	const struct rga_hw *hw =3D rga->hw;
> -	struct rga_fmt *fmt;
> =C2=A0	u32 min_width =3D hw->min_width;
> =C2=A0	u32 max_width =3D hw->max_width;
> =C2=A0	u32 min_height =3D hw->min_height;
> =C2=A0	u32 max_height =3D hw->max_height;
> =C2=A0
> -	fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> -	if (!fmt)
> -		fmt =3D &hw->formats[0];
> +	hw->adjust_and_map_format(pix_fmt,
> +				=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type));
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming=
) {
> @@ -425,7 +406,8 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm =3D rga_get_frame(ctx, f->type);
> =C2=A0	if (IS_ERR(frm))
> =C2=A0		return PTR_ERR(frm);
> -	frm->fmt =3D rga_fmt_find(rga, pix_fmt->pixelformat);
> +	frm->fmt =3D rga->hw->adjust_and_map_format(pix_fmt,
> +						=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type));
> =C2=A0
> =C2=A0	/* Reset crop settings */
> =C2=A0	frm->crop.left =3D 0;
> @@ -438,7 +420,7 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	v4l2_dbg(debug, 1, &rga->v4l2_dev,
> =C2=A0		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
> =C2=A0		=C2=A0 V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
> -		=C2=A0 &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
> +		=C2=A0 &pix_fmt->pixelformat, pix_fmt->width, pix_fmt->height,
> =C2=A0		=C2=A0 pix_fmt->plane_fmt[0].bytesperline);
> =C2=A0
> =C2=A0	for (i =3D 0; i < pix_fmt->num_planes; i++) {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index a7f891b94a478..980f70f842317 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -17,22 +17,12 @@
> =C2=A0#define DEFAULT_WIDTH 100
> =C2=A0#define DEFAULT_HEIGHT 100
> =C2=A0
> -struct rga_fmt {
> -	u32 fourcc;
> -	int depth;
> -	u8 uv_factor;
> -	u8 y_div;
> -	u8 x_div;
> -	u8 color_swap;
> -	u8 hw_format;
> -};

Ah! here's the removal of the unused variable. Not review friendly, but at =
last
removed.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> -
> =C2=A0struct rga_frame {
> =C2=A0	/* Crop */
> =C2=A0	struct v4l2_rect crop;
> =C2=A0
> =C2=A0	/* Image format */
> -	struct rga_fmt *fmt;
> +	void *fmt;
> =C2=A0	struct v4l2_pix_format_mplane pix;
> =C2=A0};
> =C2=A0
> @@ -145,8 +135,6 @@ static inline void rga_mod(struct rockchip_rga *rga, =
u32 reg, u32 val, u32 mask)
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> =C2=A0	bool has_internal_iommu;
> -	struct rga_fmt *formats;
> -	u32 num_formats;
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> @@ -158,6 +146,9 @@ struct rga_hw {
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> =C2=A0	bool (*handle_irq)(struct rockchip_rga *rga);
> =C2=A0	void (*get_version)(struct rockchip_rga *rga);
> +	void *(*adjust_and_map_format)(struct v4l2_pix_format_mplane *format,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_output);
> +	int (*enum_format)(struct v4l2_fmtdesc *f);
> =C2=A0};
> =C2=A0
> =C2=A0static inline bool rga_has_internal_iommu(const struct rockchip_rga=
 *rga)

--=-Yz7EV6xH1v3dWkULnR4e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwN9QAKCRDZQZRRKWBy
9PgbAP0Vfr6uJCAC5URmlDNN0VtVrSgkiLdQItl3mJA6ZjtYPAEA/6GG12wLnkPL
G6ihuu2Lg+M6cft1cJyHcYK0Jg5Vgg4=
=p/Dk
-----END PGP SIGNATURE-----

--=-Yz7EV6xH1v3dWkULnR4e--

