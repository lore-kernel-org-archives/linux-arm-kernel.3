Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EA0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0+kVcQ30B6s2dMupE/DYDbmCCyyFje/ABslI99ShoQ=; b=rpl7onR0QMo9MJiDLck0MIzSce
	z4R0aWt89X7XKML/H2/tiifo3Rbz3lq7+eTrJDGi+DW0g1moNqNzDucHDvnIYrXTBLaGfggKbUSRh
	0jNUVOaB8MDnE2/mH876uIF+r2ClbHgHMeOQ3/CoZLtvgkM6rQvTnj9ZDYNK5hLGq33w+JPIcgfGP
	2koDUEys2uc9jgX+mLjmNgcYRynCxiCZBinjwK3wF4YxDsFNsdKTYefId8FYuog+5p2vCoMmNL3oP
	qZIcPthflG9AuzR4DQX24Jknn8JIvGqUmjivMLlP1g3oYWEM1bGByWIQIHwpZkMtw7tefPqgYradL
	yXEiM1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEoE-0000000CTUE-3GeA;
	Tue, 05 Aug 2025 10:22:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujES6-0000000CQzy-3SDE;
	Tue, 05 Aug 2025 09:59:28 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D96F2AD0;
	Tue,  5 Aug 2025 11:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754387915;
	bh=RV+XSnddoBH4JRWHZZy+4T5rBIZcZFEquw455N0WQVA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aPIOyP3CCN60ghQ95OYLB9emUWH/n0b6O3gtc9ZoA+uMAITK5524gPFOoFe3iPgrR
	 PeGZgkGvvmEIfAIjVWqinSJN2vlhZuO+XIf+jbLxH1tzVI09y3TIRrSaAcZCkteW9d
	 f9FcX+PdukMOKmU3dXioC96DYHeFg17Pwv6UxHrs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250802-media-private-data-v1-42-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com> <20250802-media-private-data-v1-42-eb140ddd6a9d@ideasonboard.com>
Subject: Re: [PATCH 42/65] media: renesas: Access v4l2_fh from file
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 Aug 2025 10:59:19 +0100
Message-ID: <175438795943.1641235.15440393062572657340@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_025927_001004_E505C0F4 
X-CRM114-Status: GOOD (  14.55  )
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

Quoting Jacopo Mondi (2025-08-02 10:23:04)
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
>=20
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
>=20
> While at it, remove the now unused fh_to_ctx() macro.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 11 +++--------
>  drivers/media/platform/renesas/rcar_jpu.c  | 21 ++++++++-------------
>  2 files changed, 11 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index e78d8fb104e9544d27c8ace38888995ca170483f..84c3901a2e5dc3e7ccfb3b440=
62e839f8f19ee02 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -630,11 +630,6 @@ struct fdp1_ctx {
>         struct fdp1_field_buffer        *previous;
>  };
> =20
> -static inline struct fdp1_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -       return container_of(fh, struct fdp1_ctx, fh);
> -}
> -
>  static inline struct fdp1_ctx *file_to_ctx(struct file *filp)
>  {
>         return container_of(file_to_v4l2_fh(filp), struct fdp1_ctx, fh);
> @@ -1411,8 +1406,8 @@ static int fdp1_enum_fmt_vid_out(struct file *file,=
 void *priv,
> =20
>  static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format =
*f)
>  {
> +       struct fdp1_ctx *ctx =3D file_to_ctx(file);
>         struct fdp1_q_data *q_data;
> -       struct fdp1_ctx *ctx =3D fh_to_ctx(priv);
> =20
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -1589,7 +1584,7 @@ static void fdp1_try_fmt_capture(struct fdp1_ctx *c=
tx,
> =20
>  static int fdp1_try_fmt(struct file *file, void *priv, struct v4l2_forma=
t *f)
>  {
> -       struct fdp1_ctx *ctx =3D fh_to_ctx(priv);
> +       struct fdp1_ctx *ctx =3D file_to_ctx(file);
> =20
>         if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 fdp1_try_fmt_output(ctx, NULL, &f->fmt.pix_mp);
> @@ -1660,7 +1655,7 @@ static void fdp1_set_format(struct fdp1_ctx *ctx,
> =20
>  static int fdp1_s_fmt(struct file *file, void *priv, struct v4l2_format =
*f)
>  {
> -       struct fdp1_ctx *ctx =3D fh_to_ctx(priv);
> +       struct fdp1_ctx *ctx =3D file_to_ctx(file);
>         struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
>         struct vb2_queue *vq =3D v4l2_m2m_get_vq(m2m_ctx, f->type);
> =20
> diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/pl=
atform/renesas/rcar_jpu.c
> index 058fcfb967bd98440f33272db42f0d973299d572..9c70a74a2969fce6446b0f26e=
0637a68eade3942 100644
> --- a/drivers/media/platform/renesas/rcar_jpu.c
> +++ b/drivers/media/platform/renesas/rcar_jpu.c
> @@ -480,11 +480,6 @@ static struct jpu_ctx *ctrl_to_ctx(struct v4l2_ctrl =
*c)
>         return container_of(c->handler, struct jpu_ctx, ctrl_handler);
>  }
> =20
> -static struct jpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -       return container_of(fh, struct jpu_ctx, fh);
> -}
> -
>  static struct jpu_ctx *file_to_ctx(struct file *filp)
>  {
>         return container_of(file_to_v4l2_fh(filp), struct jpu_ctx, fh);
> @@ -661,7 +656,7 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long s=
ize, unsigned int *width,
>  static int jpu_querycap(struct file *file, void *priv,
>                         struct v4l2_capability *cap)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         if (ctx->encoder)
>                 strscpy(cap->card, DRV_NAME " encoder", sizeof(cap->card)=
);
> @@ -719,7 +714,7 @@ static int jpu_enum_fmt(struct v4l2_fmtdesc *f, u32 t=
ype)
>  static int jpu_enum_fmt_cap(struct file *file, void *priv,
>                             struct v4l2_fmtdesc *f)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_CAPTURE :
>                             JPU_DEC_CAPTURE);
> @@ -728,7 +723,7 @@ static int jpu_enum_fmt_cap(struct file *file, void *=
priv,
>  static int jpu_enum_fmt_out(struct file *file, void *priv,
>                             struct v4l2_fmtdesc *f)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_OUTPUT : JPU_DEC_OU=
TPUT);
>  }
> @@ -828,7 +823,7 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct =
jpu_fmt **fmtinfo,
> =20
>  static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format=
 *f)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
> =20
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -839,7 +834,7 @@ static int jpu_try_fmt(struct file *file, void *priv,=
 struct v4l2_format *f)
>  static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *=
f)
>  {
>         struct vb2_queue *vq;
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
>         struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
>         struct jpu_fmt *fmtinfo;
>         struct jpu_q_data *q_data;
> @@ -868,8 +863,8 @@ static int jpu_s_fmt(struct file *file, void *priv, s=
truct v4l2_format *f)
> =20
>  static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *=
f)
>  {
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
>         struct jpu_q_data *q_data;
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
> =20
>         if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
>                 return -EINVAL;
> @@ -902,8 +897,8 @@ static const struct v4l2_ctrl_ops jpu_ctrl_ops =3D {
> =20
>  static int jpu_streamon(struct file *file, void *priv, enum v4l2_buf_typ=
e type)
>  {
> -       struct jpu_ctx *ctx =3D fh_to_ctx(priv);
>         struct jpu_q_data *src_q_data, *dst_q_data, *orig, adj, *ref;
> +       struct jpu_ctx *ctx =3D file_to_ctx(file);
>         enum v4l2_buf_type adj_type;
> =20
>         src_q_data =3D jpu_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPL=
ANE);
> @@ -1284,8 +1279,8 @@ static int jpu_open(struct file *file)
> =20
>  static int jpu_release(struct file *file)
>  {
> -       struct jpu *jpu =3D video_drvdata(file);
>         struct jpu_ctx *ctx =3D file_to_ctx(file);
> +       struct jpu *jpu =3D video_drvdata(file);
> =20
>         v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>         v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>=20
> --=20
> 2.49.0
>

