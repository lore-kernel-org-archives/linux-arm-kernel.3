Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF413CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEhywNjRyQXniz/pcQ13Co3tXpnmGzhcmCEno154HXY=; b=by61NPhgQfZVoqm1vx9irLwB/o
	6jeW5dAggLpemst7q4pBNZ9+5gtfKBDXUGx9GA4L8GID4HaGjNzUydfkdsRCeMQ8tv52hy/jUyrx3
	85BfhBflq9TP+M1zXQLXH5BRE92IEIL1ifJSpPGzCOO040Rex66292aFo9AatQmbhhlT5ETLthdGN
	zCBklEr1OWn1shZMGMAITudVlDGa6H4r/7UWJyW7qmsEAkU3UtUMRB9RMcQEJX67raIBVud4vJWGB
	oglNF7+JcXjliGQBZ8SvKLOrIm6RvKN6RLlbSu7eXkDjedqWDnQTBR6yhQ6AJAvsiZBoV9zDpb+7G
	A2rnlPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqoa-00000006EPM-2T29;
	Wed, 20 May 2026 23:59:04 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqoX-00000006ENt-0eGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:59:02 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-393da8f389bso51127571fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779321539; x=1779926339; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BEhywNjRyQXniz/pcQ13Co3tXpnmGzhcmCEno154HXY=;
        b=e3Dn7mYTJlemQQUHGpTNGywgLMbS0G0I/0oLKxutVp6Ontm3rTNZJl3o9B0CLTzzqY
         FtX1MOpUF7sh6ditfm4bQkV3Me5QmM1HmSzqiSB96uNH9qTF4vk00bQuQXokW7HdbVlh
         K140PV0f1CgdKoPq0b/l6C0jCZkAUyHar1RCYDzNoIbz2vUIsBf8hI9egvp71Jk4wsoT
         R5mcskDC93edOGcTc6/O0T0kKuWCP6K0ogAGDAMr5d8yVmMLh/PoX5kA1xsSOHUTEP1e
         INBhAsmLnJlvIqActdTbmq1/eVcNGEmMRKOw6MVczvJ/ylL58FzvyBQCFHsL1QtaBqza
         P8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321539; x=1779926339;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEhywNjRyQXniz/pcQ13Co3tXpnmGzhcmCEno154HXY=;
        b=WvJE3/nD6C/GPKbz3jOIlxtBfz5a8NIOmSDS1OW6TzNIZqdZwWdgi/Qu4iqz+grFIL
         blZMA7QAljHQy20A2ttGxK2WdFWNEmwFX2iDOhkPBd7PwXF+WFpQtCwphjBW7mstDDxa
         PBLvkMlAgc4Vd7Q0NoU5ACNWa6gCCRfB3BoKNEPg598tomLunDRTRpCe/GQ1bWgvSd9l
         s4844TyYFF525W2PQlsjne4p0myJ+cQoUtYuWF4M6PGa97NipKwFNc5Vu7V7ii/DsGUD
         fHbadBMXVI0d9ZsDDF2apRrDlPgH1Wq8MRMqn0ArHjE6eFFEVRejW0Oa06pzxgbBl3s+
         /3jQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZJwtz6i/BbJ1JbIfcfNnioGJFyqc+iAz7YcKkZsST+nDltHzS17ISisYaS3mTgTpQRfRi/g8k54JjfN8O37xt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1c6962Y8AIEsdqDKKnKS3asSKv3mDuMB7z4+eT5IHqky1FByJ
	W7JlDkmDOj+w4g8ejOdBPIqCTKcWloFpGEm8C+5+FpmWZGFxtr2oIU8UkxkzL+fB2s0=
X-Gm-Gg: Acq92OHyg32gGYURB51BF/pg2Hs8lGH2WedLX69O/4A3HiQmK6sYOLKloDP1ck0JGR8
	fGDzZi1F8w80+Ejcxv6bkRHdoTckWp5+tQ5lJ0qp1e9JIXCWs0Vavc4T68BY3fBO/PTuVp8rBS0
	isD4jRlII3Or4CYhTqBFSt6vR3lKp10Rer2Uaq3+TbPuZL8vWymbqps8A18oBJSjktw1QwwPH8D
	1ENmWCX1R8RJkvZY8/qn+/MLLZu6TTeaXV63a0tHI4yuGJKfVXV238A8cs1L3aPiccBxAUZx6Gb
	pHzNbXci8O/mI0X8JJFfpikzOYkN1tylFUYLgdbeLIAjpqeO3Kv9u+LAzlcmBPHWlIme0dFnIvS
	qI1gIZOk8ijZqDSpAHl/TfJFKE47WT7udR0AoEVd8ofdpTzfpKgls6QgHk+OnXN34QmzPNQZ3Ss
	dtm3dwm8O6ZGKKZ1PoJhSUqB77R+aqQrQrBF/ssSYFChUY4HLtI8Z3ib2SY/dcJSifC5h7UIbv8
	QLelWY=
X-Received: by 2002:a2e:bd17:0:b0:393:d6dd:e8a1 with SMTP id 38308e7fff4ca-395ca24e814mr1927031fa.2.1779321538328;
        Wed, 20 May 2026 16:58:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882d28f4sm33341501fa.17.2026.05.20.16.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:58:57 -0700 (PDT)
Message-ID: <5eeeaa5979a3f16ec8397b62bc35fd9b08d36032.camel@ndufresne.ca>
Subject: Re: [PATCH v7 17/28] media: rockchip: rga: check scaling factor
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
	p.zabel@pengutronix.de
Date: Wed, 20 May 2026 19:58:53 -0400
In-Reply-To: <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
	 <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-rdFBmfYTegp3nVJVJScl"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165901_266214_B359AC43 
X-CRM114-Status: GOOD (  33.74  )
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


--=-rdFBmfYTegp3nVJVJScl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 21 mai 2026 =C3=A0 00:44 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.
>=20
> The check is done at streamon when the other side is already streaming
> to avoid incorrectly failing if the application configures the other
> side after calling streamon. As try_fmt shouldn't be state aware,
> it cannot be used to limit the format based on the scaling factor.
> Therefore the check is done just before the actual streaming would be
> started.
>=20
> As the driver allows changing the rotation and selection while
> streaming, add additional checks to ensure these changes
> don't exceed the scaling factor.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> Changes in v6:
> - Dropped scaling adjustment in s_fmt, as this didn't match the try_fmt
> =C2=A0 result (which shouldn't have it to avoid making it stateful)
> - Moved scaling check to the prepare_streaming callback instead of
> =C2=A0 overwriting the ioctl directly
> - Consider rotation when checking the scaling
> - Check scaling factor when adjusting rotation and selection while
> =C2=A0 streaming
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 28 ++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 63 +++++++++++++++++++++++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++
> =C2=A05 files changed, 94 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index ffc6162b2e681..dcaba66f5c1fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -197,6 +197,33 @@ static void rga_buf_return_buffers(struct vb2_queue =
*q,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static int rga_buf_prepare_streaming(struct vb2_queue *q)
> +{
> +	struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> +	int ret;
> +
> +	/* It's safe to check the streaming state of the other queue,
> +	 * as the streamon ioctl's can't race due to the lock set in
> +	 * the queue_init function.
> +	 */
> +	if ((V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m=
2m_ctx))) ||
> +	=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_CAPTURE(q->type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m=
2m_ctx)))) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		ret =3D rga_check_scaling(hw, &ctx->in.crop, &ctx->out.crop,
> +					ctx->rotate);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int rga_buf_start_streaming(struct vb2_queue *q, unsigned in=
t count)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> @@ -232,6 +259,7 @@ const struct vb2_ops rga_qops =3D {
> =C2=A0	.buf_prepare =3D rga_buf_prepare,
> =C2=A0	.buf_queue =3D rga_buf_queue,
> =C2=A0	.buf_cleanup =3D rga_buf_cleanup,
> +	.prepare_streaming =3D rga_buf_prepare_streaming,
> =C2=A0	.start_streaming =3D rga_buf_start_streaming,
> =C2=A0	.stop_streaming =3D rga_buf_stop_streaming,
> =C2=A0};
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 567d39e58d33f..f2900812ba76f 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -584,6 +584,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index c2e34be751939..805ec23e5e3f4 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -14,6 +14,7 @@
> =C2=A0
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> +#define MAX_SCALING_FACTOR 16
> =C2=A0
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 394b14b9469df..22954bbae55fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -127,7 +127,9 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D container_of(ctrl->handler, struct rga_ctx=
,
> =C2=A0					=C2=A0=C2=A0 ctrl_handler);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	unsigned long flags;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&ctx->rga->ctrl_lock, flags);
> =C2=A0	switch (ctrl->id) {
> @@ -138,6 +140,13 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		ctx->vflip =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	case V4L2_CID_ROTATE:
> +		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +		=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ct=
x))) {
> +			ret =3D rga_check_scaling(hw, &ctx->in.crop,
> +						&ctx->out.crop, ctrl->val);
> +			if (ret < 0)
> +				goto s_ctrl_done;
> +		}
> =C2=A0		ctx->rotate =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	case V4L2_CID_BG_COLOR:
> @@ -145,8 +154,10 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	ctx->cmdbuf_dirty =3D true;
> +
> +s_ctrl_done:
> =C2=A0	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
> -	return 0;
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_ctrl_ops rga_ctrl_ops =3D {
> @@ -182,6 +193,38 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static bool check_scaling_factor(const struct rga_hw *hw, u32 src_size,
> +				 u32 dst_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >=3D dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >=3D src_size;
> +}
> +
> +int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *c=
rop_in,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_rect *crop_out, u32 r=
otate)
> +{
> +	u32 scaled_width;
> +	u32 scaled_height;
> +
> +	if (rotate =3D=3D 90 || rotate =3D=3D 270) {
> +		scaled_width =3D crop_out->height;
> +		scaled_height =3D crop_out->width;
> +	} else {
> +		scaled_width =3D crop_out->width;
> +		scaled_height =3D crop_out->height;
> +	}
> +
> +	if (!check_scaling_factor(hw, crop_in->width, scaled_width))
> +		return -EINVAL;
> +
> +	if (!check_scaling_factor(hw, crop_in->height, scaled_height))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> =C2=A0static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 p=
ixelformat)
> =C2=A0{
> =C2=A0	unsigned int i;
> @@ -525,7 +568,6 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	struct rga_frame *f;
> -	int ret =3D 0;
> =C2=A0
> =C2=A0	f =3D rga_get_frame(ctx, s->type);
> =C2=A0	if (IS_ERR(f))
> @@ -569,10 +611,25 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> +	if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +	=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx=
))) {
> +		int ret =3D 0;
> +
> +		if (V4L2_TYPE_IS_OUTPUT(s->type))
> +			ret =3D rga_check_scaling(rga->hw, &s->r, &ctx->out.crop,
> +						ctx->rotate);
> +		else
> +			ret =3D rga_check_scaling(rga->hw, &ctx->in.crop, &s->r,
> +						ctx->rotate);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> =C2=A0	f->crop =3D s->r;
> =C2=A0	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> -	return ret;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_ioctl_ops rga_ioctl_ops =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 5360f092fecf0..df525c6aea8b6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -123,6 +123,9 @@ static inline struct rga_vb_buffer *vb_to_rga(struct =
vb2_v4l2_buffer *vb)
> =C2=A0
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type type);
> =C2=A0
> +int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *c=
rop_in,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_rect *crop_out, u32 r=
otate);
> +
> =C2=A0/* RGA Buffers Manage */
> =C2=A0extern const struct vb2_ops rga_qops;
> =C2=A0
> @@ -151,6 +154,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);

--=-rdFBmfYTegp3nVJVJScl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5KvQAKCRDZQZRRKWBy
9E9rAQDiJbGoDoukTZoC800Ujw8eKYRfiw95dLx/TYGqe+Q0sgD7B6/L2PKKbwBM
wjRPxzakETkICLxJ+XtnlfrFYSrmBAo=
=Il/H
-----END PGP SIGNATURE-----

--=-rdFBmfYTegp3nVJVJScl--

