Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8467AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=; b=zsfpKVLJRmS2SB08aCDZ2UPI7Z
	1gGIGLkh3ZpUeMNSAwMF6NAQrB25+OFbWeH05S4ZUJo/pKAekH5yALiNE2E/wU3TpMapxln1i+OO5
	0JsGkwz70Yo2+4OdYQiTmSzjUwAULHeEaEHzluEwpef34gTvpJYiSHpexkdCv8fQb7gLNblU40kvC
	lcaoWbFpBzeLx/T0+dnk77sfnktujC3BYSjyzQmE742bO4zdBNcbOziZWPWGNKzXZJ2X0gvR5NQCk
	XG2WXlYWQz7EvmXGGJAfU3nwH0wDP0UMD3Q3l11ZI/7i+emw5up4KrSea7ljpbdq8PNY62nZnQc0h
	Jkm73agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0N-00000003kox-2sOy;
	Thu, 02 Jul 2026 07:38:39 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0L-00000003ko1-0osD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:38:38 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6a0e55e82d0so917109eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782977915; cv=none;
        d=google.com; s=arc-20260327;
        b=qVrMtmCMkHJrZuN9NV+m2xgbZ4+3qX72hrUNWaxXZ2dACB1+9KpuW1dwJDy3YFC/fs
         v+heTh99MJuccN5fFHEZxUF43x+FzJCMz8X5hMG77U4aGF0AxwOx23UwyKCEwKgLamJm
         HF4c2a06hhPOQMoMefAmva0nH/7FY2k5Q6xZr9F2+A2v0ywGFVdu9r14Z7QjKvVXLivY
         ORflLol1Cd9kNp2lr+XcgvvsvDywlMvKoQsZ2NtyMzvLiKy1oV1nATNVLCJNTAeO7NQZ
         TXxwaMXMRi7fqTHttg1ImPiaoRaeUZQegvYgLieV3qGajhMBoTScB3q50uJHHq0CiJyL
         8XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=;
        fh=Qofx87KGY6J+I+5IuTHUFMpaUD9Of5Yl8Sc2Q2GImAw=;
        b=ns29j6nU5EsO5oh27AE+hNfbMquIyHGh39Wxq+eSbFFvxiKklun+JHAgpCOT4DALkc
         lLZMGLJ1wQNRr9rRyvCPyuCQar956DakKTc52Xy8y/1ySaFbfr4YLonRxJ8XIvvy+L7w
         qS5x/FUNqEmbVN32hhFEJd29steC1Cx7GA1ntUqUCRjksLJPbBrTyKqx+21KeUU5wd7B
         WoFehZXyS6NLrKcLtgsJNVUjpOi7Uqfx0L35tSztHDFM+WVy9oWwPvK52H+jv3+q5Dg9
         xAzQJBt7fL/0ayNeSRukC1F5di7YbQQjejQbF6kP2vZI/owSMvjQK3JDFV4sqvWoA2L7
         I7FQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977915; x=1783582715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=;
        b=VwxFf8bz1k8oQjCPfMgyK2xo0qsaHT9vj/Sj6+4zEC9KaWSORIw5tnRtO0rNgAFqCN
         sWJmhrioL+V8dCNuiA2hwPmrZQTJM8afoviRfkMTZV/3RXh/898puKX9MYNzwQq6RwhW
         T+bOho8F7d7gIOIAdyH8Qi/NH5V3oIER5IisjmHGqLo69JvbK1CF/KDxMSB5e8K+jehm
         S2roVE7gTRDMb+d7qOxvdKZj6yGQIOG+/HMtYKygTh/iiGtlN+sMzPBl9BOwgYjFVIK/
         n/zHeqjwjioBY4Yn2zpmcX/PDqXUjYUWBkHZQzrcdMjL+G/+80jfm1OOOQRj50SqvEOy
         y7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977915; x=1783582715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=;
        b=ApbP3IoBhq7XDB5H5Z8qJSX+BuWG5oxNFY9iiz58vDZD5gHBewXXRH+uoIU+hkcacQ
         f86fRMg4ENlkkNRG2pkhsKGSTvCkCl/8ZXlF8/hEwNyQ1z4fvAbqlUhrANEI2+v53sO3
         bYRC5n7Co11UdaFVBEuSCnEqKKX+M2KGmx0iScca+KYvdBmPJUnuxrk+f7BwbBh9yrXq
         OVHumWDSX/mhsPbiHWmwA6Fn/SBOAy2Ps6Tyh4AivDK/uql0DfdhJ0my+6ISR/HI1um6
         zz+U9XHq3/I5Kir3vFyWMDe3yoqW00+UZ2N1E08nGa8EH/+JC2Aw8m3f9gZkvS084ooY
         Pwmw==
X-Forwarded-Encrypted: i=1; AFNElJ+IF5oAf+0seVL6z/Ky5Tvf8koHZd2VbeEWXsO0CCW0R4eiGgQ36BENP4ov9L68zzknwHblcsqzTt/FhVLkirBk@lists.infradead.org
X-Gm-Message-State: AOJu0YxYD0sINwe527/+uy8qhXsqL2DvlqYkrz9DyGM+v2kwMiMF8Hw4
	qVy74tS/N0MHYlXfQwLHoBgP0fQkwd77cZMnRc0QC9l6AkhudfnD8bT3MoIcim0MXr6W+xLsyKo
	vaigf5I9VYiSEQVELuVQabGOAO6Cdc9Q=
X-Gm-Gg: AfdE7ck5Gmejxtn9bcfGq8jpMfdLBbgGN4/n4EK14IYAPGrLaTdQBZ44E1q37TUU4g0
	jXzf1yFtlFk0i38ZrSr6O+N1jurgbrwfZa48lcBwNDoEHBsXHOWDjWh3jmx+WGI95SYWRcfTu38
	nSGmK3BabH0+JpHYKZIsqmja92I7IPPdSuvelfznxBszhxO1nHmNKvoO1omBDEl9E1TEjpQpjfK
	QOn9RUaus7D8r68YKTNUhs/Yyp3QMpsGwPCpJj4Sl4WwUce17fYabUxjSnri6q10yDGPaGHcnvH
	jJ++eMVu1/lhp+OKlkyJuAeWrZ0T6nEfB9VfNisBRoixhG4mjzgoGw2y
X-Received: by 2002:a05:6820:4b09:b0:6a1:5756:10d3 with SMTP id
 006d021491bc7-6a30d79e230mr2586326eaf.22.1782977915404; Thu, 02 Jul 2026
 00:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-2-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-2-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 2 Jul 2026 11:08:23 +0330
X-Gm-Features: AVVi8CeafjPFa4ObcedUXNC1nyKbr1QgWVPZnCBama60Wv2Vd2sSRdfYRIO95ik
Message-ID: <CAMxPZkjeCL=kdpj2V-9b-C68kOsrAv1dPKq4iHn2PEpn2pYEuA@mail.gmail.com>
Subject: Re: [PATCH 01/16] media: sun6i-csi: bridge: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_003837_315271_A683BEB4 
X-CRM114-Status: GOOD (  29.74  )
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

Hi Paul,

On Mon, May 18, 2026 at 1:55=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Arash Golgol <arash.golgol@gmail.com>
>
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>
> Previously, capture accessed bridge private state directly. After
> moving to framework-managed state, resolve the format through the
> subdev pad API.
>
> The sun6i-csi-bridge hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
>
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> Tested-by: Paul Kocialkowski <paulk@sys-base.io>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I noticed this series didn't make it into the v7.2 merge window.
Is there anything still pending on my side before it can be picked up,
or is it just a matter of timing for the next cycle?

Happy to help however I can.

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  3 files changed, 86 insertions(+), 105 deletions(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..43a85bcc2ba2 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -13,26 +13,6 @@
>  #include "sun6i_csi_bridge.h"
>  #include "sun6i_csi_reg.h"
>
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -                                unsigned int *width, unsigned int *heigh=
t)
> -{
> -       if (width)
> -               *width =3D csi_dev->bridge.mbus_format.width;
> -       if (height)
> -               *height =3D csi_dev->bridge.mbus_format.height;
> -}
> -
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -                            u32 *mbus_code, u32 *field)
> -{
> -       if (mbus_code)
> -               *mbus_code =3D csi_dev->bridge.mbus_format.code;
> -       if (field)
> -               *field =3D csi_dev->bridge.mbus_format.field;
> -}
> -
>  /* Format */
>
>  static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] =
=3D {
> @@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi=
_device *csi_dev)
>  }
>
>  static void
> -sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
> +                                   const struct v4l2_mbus_framefmt *mbus=
_format)
>  {
>         struct device *dev =3D csi_dev->dev;
>         struct regmap *regmap =3D csi_dev->regmap;
> @@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi=
_device *csi_dev)
>                 &csi_dev->bridge.source_parallel.endpoint;
>         unsigned char bus_width =3D endpoint->bus.parallel.bus_width;
>         unsigned int flags =3D endpoint->bus.parallel.flags;
> -       u32 field;
> +       u32 field =3D mbus_format->field;
>         u32 value =3D SUN6I_CSI_IF_CFG_IF_CSI;
>
> -       sun6i_csi_bridge_format(csi_dev, NULL, &field);
> -
>         if (field =3D=3D V4L2_FIELD_INTERLACED ||
>             field =3D=3D V4L2_FIELD_INTERLACED_TB ||
>             field =3D=3D V4L2_FIELD_INTERLACED_BT)
> @@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_cs=
i_device *csi_dev)
>  }
>
>  static void
> -sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
> +                                    const struct v4l2_mbus_framefmt *mbu=
s_format)
>  {
>         struct regmap *regmap =3D csi_dev->regmap;
>         u32 value =3D SUN6I_CSI_IF_CFG_IF_MIPI;
> -       u32 field;
> -
> -       sun6i_csi_bridge_format(csi_dev, NULL, &field);
> +       u32 field =3D mbus_format->field;
>
>         if (field =3D=3D V4L2_FIELD_INTERLACED ||
>             field =3D=3D V4L2_FIELD_INTERLACED_TB ||
> @@ -335,19 +313,20 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_c=
si_device *csi_dev)
>         regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
>  }
>
> -static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *c=
si_dev)
> +static void
> +sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
> +                                 const struct v4l2_mbus_framefmt *mbus_f=
ormat)
>  {
>         struct regmap *regmap =3D csi_dev->regmap;
>         bool capture_streaming =3D csi_dev->capture.state.streaming;
>         const struct sun6i_csi_bridge_format *bridge_format;
>         const struct sun6i_csi_capture_format *capture_format;
> -       u32 mbus_code, field, pixelformat;
> +       u32 pixelformat;
> +       u32 field =3D mbus_format->field;
>         u8 input_format, input_yuv_seq, output_format;
>         u32 value =3D 0;
>
> -       sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
> -
> -       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_format->code)=
;
>         if (WARN_ON(!bridge_format))
>                 return;
>
> @@ -391,16 +370,17 @@ static void sun6i_csi_bridge_configure_format(struc=
t sun6i_csi_device *csi_dev)
>  }
>
>  static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
> -                                      struct sun6i_csi_bridge_source *so=
urce)
> +                                      struct sun6i_csi_bridge_source *so=
urce,
> +                                      const struct v4l2_mbus_framefmt *m=
bus_format)
>  {
>         struct sun6i_csi_bridge *bridge =3D &csi_dev->bridge;
>
>         if (source =3D=3D &bridge->source_parallel)
> -               sun6i_csi_bridge_configure_parallel(csi_dev);
> +               sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format)=
;
>         else
> -               sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
> +               sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format=
);
>
> -       sun6i_csi_bridge_configure_format(csi_dev);
> +       sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
>  }
>
>  /* V4L2 Subdev */
> @@ -415,6 +395,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>         struct sun6i_csi_bridge_source *source;
>         struct v4l2_subdev *source_subdev;
>         struct media_pad *remote_pad;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *mbus_format;
>         int ret;
>
>         /* Source */
> @@ -433,6 +415,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_sub=
dev *subdev, int on)
>         else
>                 source =3D &bridge->source_mipi_csi2;
>
> +       /* Active State */
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>         if (!on) {
>                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
>                 ret =3D 0;
> @@ -443,7 +429,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0)
> -               return ret;
> +               goto unlock;
>
>         /* Clear */
>
> @@ -451,7 +437,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>
>         /* Configure */
>
> -       sun6i_csi_bridge_configure(csi_dev, source);
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_CSI_BRIDGE_PAD_S=
INK);
> +       sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
>
>         if (capture_streaming)
>                 sun6i_csi_capture_configure(csi_dev);
> @@ -472,7 +460,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>         if (ret && ret !=3D -ENOIOCTLCMD)
>                 goto disable;
>
> -       return 0;
> +       ret =3D 0;
> +       goto unlock;
>
>  disable:
>         if (capture_streaming)
> @@ -482,6 +471,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>
>         pm_runtime_put(dev);
>
> +unlock:
> +       v4l2_subdev_unlock_state(state);
>         return ret;
>  }
>
> @@ -504,21 +495,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mb=
us_framefmt *mbus_format)
>  static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
>                                        struct v4l2_subdev_state *state)
>  {
> -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -       unsigned int pad =3D SUN6I_CSI_BRIDGE_PAD_SINK;
> -       struct v4l2_mbus_framefmt *mbus_format =3D
> -               v4l2_subdev_state_get_format(state, pad);
> -       struct mutex *lock =3D &csi_dev->bridge.lock;
> +       unsigned int pad;
>
> -       mutex_lock(lock);
> +       /*
> +        * This subdev does not perform format conversion,
> +        * initialize both pads identically.
> +        */
> +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +               struct v4l2_mbus_framefmt *mbus_format;
>
> -       mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_code;
> -       mbus_format->width =3D 1280;
> -       mbus_format->height =3D 720;
> +               mbus_format =3D v4l2_subdev_state_get_format(state, pad);
>
> -       sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +               mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_co=
de;
> +               mbus_format->width =3D 1280;
> +               mbus_format->height =3D 720;
>
> -       mutex_unlock(lock);
> +               sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +       }
>
>         return 0;
>  }
> @@ -536,53 +529,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev =
*subdev,
>         return 0;
>  }
>
> -static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
> -                                   struct v4l2_subdev_state *state,
> -                                   struct v4l2_subdev_format *format)
> -{
> -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &csi_dev->bridge.lock;
> -
> -       mutex_lock(lock);
> -
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> -                                                            format->pad)=
;
> -       else
> -               *mbus_format =3D csi_dev->bridge.mbus_format;
> -
> -       mutex_unlock(lock);
> -
> -       return 0;
> -}
> -
>  static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
>                                     struct v4l2_subdev_state *state,
>                                     struct v4l2_subdev_format *format)
>  {
> -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &csi_dev->bridge.lock;
> +       struct v4l2_mbus_framefmt *fmt;
>
> -       mutex_lock(lock);
> +       /* The format on the source pad always matches the sink pad. */
> +       if (format->pad !=3D SUN6I_CSI_BRIDGE_PAD_SINK)
> +               return v4l2_subdev_get_fmt(subdev, state, format);
>
> -       sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +       sun6i_csi_bridge_mbus_format_prepare(&format->format);
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> -                       *mbus_format;
> -       else
> -               csi_dev->bridge.mbus_format =3D *mbus_format;
> +       /* Set the format on the sink pad. */
> +       fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> +       *fmt =3D format->format;
>
> -       mutex_unlock(lock);
> +       /* Propagate the format to the source pad. */
> +       fmt =3D v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_=
SOURCE);
> +       *fmt =3D format->format;
>
>         return 0;
>  }
>
>  static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops =3D {
>         .enum_mbus_code =3D sun6i_csi_bridge_enum_mbus_code,
> -       .get_fmt        =3D sun6i_csi_bridge_get_fmt,
> +       .get_fmt        =3D v4l2_subdev_get_fmt,
>         .set_fmt        =3D sun6i_csi_bridge_set_fmt,
>  };
>
> @@ -780,8 +752,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>         };
>         int ret;
>
> -       mutex_init(&bridge->lock);
> -
>         /* V4L2 Subdev */
>
>         v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
> @@ -809,6 +779,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *=
csi_dev)
>         if (ret < 0)
>                 return ret;
>
> +       /* V4L2 Subdev finalize */
> +
> +       ret =3D v4l2_subdev_init_finalize(subdev);
> +       if (ret < 0)
> +               goto error_media_entity;
> +
>         /* V4L2 Subdev */
>
>         if (csi_dev->isp_available)
> @@ -818,7 +794,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>
>         if (ret) {
>                 dev_err(dev, "failed to register v4l2 subdev: %d\n", ret)=
;
> -               goto error_media_entity;
> +               goto error_subdev_finalize;
>         }
>
>         /* V4L2 Async */
> @@ -852,6 +828,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>         else
>                 v4l2_device_unregister_subdev(subdev);
>
> +error_subdev_finalize:
> +       v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>         media_entity_cleanup(&subdev->entity);
>
> @@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device=
 *csi_dev)
>
>         v4l2_device_unregister_subdev(subdev);
>
> +       v4l2_subdev_cleanup(subdev);
> +
>         media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> index 44653b38f722..a5b0a6f064dd 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
>         struct v4l2_subdev              subdev;
>         struct v4l2_async_notifier      notifier;
>         struct media_pad                pads[2];
> -       struct v4l2_mbus_framefmt       mbus_format;
> -       struct mutex                    lock; /* Mbus format lock. */
>
>         struct sun6i_csi_bridge_source  source_parallel;
>         struct sun6i_csi_bridge_source  source_mipi_csi2;
>  };
>
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -                                unsigned int *width, unsigned int *heigh=
t);
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -                            u32 *mbus_code, u32 *field);
> -
>  /* Format */
>
>  const struct sun6i_csi_bridge_format *
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 65879f4802c0..d90abba21309 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>                 media_entity_to_video_device(link->sink->entity);
>         struct sun6i_csi_device *csi_dev =3D video_get_drvdata(video_dev)=
;
>         struct v4l2_device *v4l2_dev =3D csi_dev->v4l2_dev;
> +       struct v4l2_subdev *src_subdev =3D
> +               media_entity_to_v4l2_subdev(link->source->entity);
>         const struct sun6i_csi_capture_format *capture_format;
>         const struct sun6i_csi_bridge_format *bridge_format;
>         unsigned int capture_width, capture_height;
> -       unsigned int bridge_width, bridge_height;
>         const struct v4l2_format_info *format_info;
> +       struct v4l2_subdev_format src_fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad =3D link->source->index
> +       };
>         u32 pixelformat, capture_field;
> -       u32 mbus_code, bridge_field;
>         bool match;
> +       int ret;
>
>         sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_he=
ight);
>
> @@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>         if (WARN_ON(!capture_format))
>                 return -EINVAL;
>
> -       sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_heigh=
t);
> +       /* Resolve csi bridge format. */
> +       ret =3D v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt=
);
> +       if (ret)
> +               return ret;
>
> -       sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
> -       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       bridge_format =3D sun6i_csi_bridge_format_find(src_fmt.format.cod=
e);
>         if (WARN_ON(!bridge_format))
>                 return -EINVAL;
>
>         /* No cropping/scaling is supported. */
> -       if (capture_width !=3D bridge_width || capture_height !=3D bridge=
_height) {
> +       if (capture_width !=3D src_fmt.format.width ||
> +           capture_height !=3D src_fmt.format.height) {
>                 v4l2_err(v4l2_dev,
>                          "invalid input/output dimensions: %ux%u/%ux%u\n"=
,
> -                        bridge_width, bridge_height, capture_width,
> -                        capture_height);
> +                        src_fmt.format.width, src_fmt.format.height,
> +                        capture_width, capture_height);
>                 return -EINVAL;
>         }
>
> @@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct med=
ia_link *link)
>         /* With raw input mode, we need a 1:1 match between input and out=
put. */
>         if (bridge_format->input_format =3D=3D SUN6I_CSI_INPUT_FMT_RAW ||
>             capture_format->input_format_raw) {
> -               match =3D sun6i_csi_capture_format_match(pixelformat, mbu=
s_code);
> +               match =3D sun6i_csi_capture_format_match(pixelformat,
> +                                                      src_fmt.format.cod=
e);
>                 if (!match)
>                         goto invalid;
>         }
> --
> 2.54.0
>

--=20
Regards,
Arash Golgol

