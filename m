Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD241099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=; b=g7GmCEpsfYWFZM1Gh7dyjHZQ+k
	DILReiToiv+jyl0CUjaYEyf7HGZni2puqhCF3zAHIKpJKF4aqy5gpWBH6CbuV0a2a78GKHIlPx/lS
	/PtnQLYBh4bJVZZd71/k9lMxFUAkW14j6PBCg/RV9Wu/IfYOh59+jFeMo8yvGNnQM3B75gDGySQjg
	P57JoMbF2IyYFa0lSm5DYm+8k8BO89CW6cfWsjH8luUuVeii460WPU/KHx94OdkTjxo3Px9gkifL/
	GyUk5pmzxUGx5mbaK+p89yreltw9mR83FEsoEOCQVFX15os8tNJSIGR2QsVrPfdNHiUkE7jyMaIMQ
	chRZshKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e6H-0000000DKm2-14oV;
	Fri, 20 Mar 2026 17:57:33 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e6E-0000000DKl2-2bCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:57:32 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64ae222d978so2554804d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029449; x=1774634249; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=;
        b=f6DcQKuMULGGJ8IDvqGsTWq6eJbIzPH132dSTOlGOi9BsU28W2w8Y+ZIg6EFUOB5Gs
         zU3I5ADMigVzoNMY9wjDwlTwbmeTbqo8vMX5D4sZV0Edkd01kGH4yds5xh4aXRkEgst5
         Zu/XM+UKcdSABpBrO+LFP7Kv0aL8IRO4LQMSZNbHol4ldY+E0n5LF8dr7qlNsqXLsATC
         ZRruz+BLcaNmQ0z4+tqoY2Ont0/GGd6/rwoi+LJuvrTwE3os+nErEPCUSdOAjfoSdKgq
         MLBsEUL9cwFTumYm750yURzaLu6gphFnfxMHNX8akOcqMBDOZ8ltOzuPbHPQkgQ3rCDz
         ojJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029449; x=1774634249;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=;
        b=QnQRMjP1DOwkFU9T1GbGwsXTgh8DVliDWUjIRq1wM7KAJXtKVAatIjkfXw4Vjl04G0
         zMHIDsxz17w7qv744R0D6pPnYw3u1ZSpWS81+kikWHjcqJoq2GbN4gx/ZUnwVKxy3bKO
         KLmga1zzCwfPavHEF/6WWETliTPAZ4sPPeRf4HjnquHHDGwumWpOc42n196FI/YoD73D
         OG5TyhEGNbisbEXYDkgyhV+RpDHKwiq1AROirHLCezTahBrcR04cTh10eQGTKI+fcD0R
         8j8C7hhyCveXAi+Jmd9mNP6CUjdPM5BQ/AkCgc0GluL/6YYtnTzcB8tEbTOa6mTc3vw4
         AEzg==
X-Forwarded-Encrypted: i=1; AJvYcCUsSk0KYP+UnJve+iQ8GY3UPVRTaBG4LSn6988q0bA6jsqarnW3YQDV8vzsDat0tImaaCM3VNGMb/l/HrvT96JI@lists.infradead.org
X-Gm-Message-State: AOJu0YxuRD+0TVpoagbzv2lbNPZVO5x7GCVdya97n8kCKv4ASb+V5hJQ
	F+qZ60g9rZLq/fBx2Uv0jjxAuCG2PaVG29Vvj7RxtdeFJ8dKIsO3YBP+jdcjLBiBAjUWUhOzLq6
	SXK+2qMZpnA==
X-Gm-Gg: ATEYQzzqn4/7p3eRcMOpDkZje5etlu0nfo6F8bv0i83cqRGIAo7wwtPaMEFiHt6aAaS
	Ch9zG7S1mEi41TtU2qI0V6T2SSpO1PrrAy3n+SDTjx0qtoMU2a69iwF1imHOy51CFDIP6CFC7P1
	PGtJoR8EQSZ6mELVOVXhX3t0Iw4S5b8NHYf5aWHDusNbjnITwZRhcEC3OSqKSGLAZPRrUPD01KO
	CPGHqDgU1170JutLe2R1xCh1XrDGZ1vO997aeZDEXp8PEx51ldTLpyQNFeGYehzzctih1OAgaGF
	GPRhEsdLwu5f/v7hR8qyLMz9UqLiGf3gVjYEa31GoJ8GyNWRK2bl9iqaRqB4RQqpjWyGYwO0lIK
	JtaG0IcjmUIxGFRO022oCIN7yi3WBMThPKx74euaHWNi4DGvRP0aNmInQX0ZD7C1U0fIcgnZ8kK
	O6pZlQdRYGp3UNXokqNOsocrZB8JMf
X-Received: by 2002:a53:b7d1:0:b0:64c:ac70:9422 with SMTP id 956f58d0204a3-64eaa8750damr3005530d50.79.1774029449330;
        Fri, 20 Mar 2026 10:57:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabd6dc60sm1852148d50.6.2026.03.20.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:57:28 -0700 (PDT)
Message-ID: <90da83de861e8268745255720554ad23341e6839.camel@ndufresne.ca>
Subject: Re: [PATCH v3 16/27] media: rockchip: rga: check scaling factor
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
Date: Fri, 20 Mar 2026 13:57:26 -0400
In-Reply-To: <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qjIqyG00QdlUohxd10SX"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_105730_667943_AA7970AD 
X-CRM114-Status: GOOD (  29.22  )
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


--=-qjIqyG00QdlUohxd10SX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.
>=20
> There are two relevant scenarios that have to be considered to protect
> against invalid scaling values:
>=20
> When the output or capture is already streaming, setting the format on
> the other side should consider the max scaling factor and clamp it
> accordingly. This is only done in the streaming case, as it otherwise
> may unintentionally clamp the value when the application sets the first
> format (due to a default format on the other side).
>=20
> When the format is set on both sides first, then the format won't be
> corrected by above means. Therefore the second streamon call has to
> check the scaling factor and fail otherwise.
>=20
> As try functions should only be state aware if specified, the scaling
> limitation is only done in s_fmt.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 47 ++=
++++++++++++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A04 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index dcd540ed3fd5b..7a4070665fed7 100644
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
> index f4752aa823051..fffcab0131225 100644
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
> index 6947c472a8b01..fad921ddd8348 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -405,10 +405,36 @@ static int vidioc_s_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> +	const struct rga_hw *hw =3D rga->hw;
> =C2=A0	struct vb2_queue *vq;
> =C2=A0	struct rga_frame *frm;
> =C2=A0	int ret =3D 0;
> =C2=A0	int i;
> +	struct rga_frame *limit_frm =3D NULL;
> +
> +	/* Limit before try_fmt to avoid recalculating the stride */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming)
> +		limit_frm =3D &ctx->out;
> +	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)
> +		limit_frm =3D &ctx->in;
> +	if (limit_frm) {
> +		const struct v4l2_frmsize_stepwise frmsize =3D {
> +			.min_width =3D DIV_ROUND_UP(limit_frm->pix.width,
> +						=C2=A0 hw->max_scaling_factor),
> +			.max_width =3D
> +				limit_frm->pix.width * hw->max_scaling_factor,
> +			.min_height =3D DIV_ROUND_UP(limit_frm->pix.height,
> +						=C2=A0=C2=A0 hw->max_scaling_factor),
> +			.max_height =3D
> +				limit_frm->pix.height * hw->max_scaling_factor,
> +			.step_width =3D 1,
> +			.step_height =3D 1,

Is there a risk to re-introduce odd sizes ? Should this be the hdiv / vdiv
values ?

> +		};
> +		v4l2_apply_frmsize_constraints(&pix_fmt->width,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pix_fmt->height, &frmsize);
> +	}
> =C2=A0
> =C2=A0	/* Adjust all values accordingly to the hardware capabilities
> =C2=A0	 * and chosen format.
> @@ -568,12 +594,33 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst=
_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >=3D dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >=3D src_size;
> +}
> +
> =C2=A0static int vidioc_streamon(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0
> +	if ((V4L2_TYPE_IS_OUTPUT(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streamin=
g) ||
> +	=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_CAPTURE(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streamin=
g)) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
> +		=C2=A0=C2=A0=C2=A0 !check_scaling(hw, ctx->in.pix.height, ctx->out.pix=
.height))
> +			return -EINVAL;
> +	}
> +
> =C2=A0	hw->setup_cmdbuf(ctx);
> =C2=A0
> =C2=A0	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index c741213710b32..454af283b1694 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);

--=-qjIqyG00QdlUohxd10SX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2KhgAKCRDZQZRRKWBy
9PM7AP9jGP5aoYcuwSgumkHCKGfz+EC3ON3LYoZEHTq181prOwD9EQ6lsBj+nyKz
T6YbQyqWaVwY9slYUWGL40d6F+8IIAY=
=9adu
-----END PGP SIGNATURE-----

--=-qjIqyG00QdlUohxd10SX--

