Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD74CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=; b=yF8FrcUKjGG1r8inIB22E6c5yu
	0EpdyIqROyaFj4Rew1lxAAzjh6mM5AHJMcnYMe08DORbfGJWIt1otsE3MlBJbdIqdeUC6HZKOTr5v
	6GGQEAOnGamdwUlzNItqPyUyV/+WMtHGtZuyejMWGkMgij4Hv4HPpKXwivTJaJIwahG5IwPUkdBR4
	i7dSXlqMXKlY1SsUsCurts/5Z1HZ7iO/Nx+eNwmr8GopqhPWasx01A2tqwWM0QAha5q3bao6cCZ9N
	1YHPKhOmfD38YbXbKaqDpGFi1ux6gtwIdqqcGnLXwIDwR/GcwOOKjNo1Esl/d6cNFb331b410RCnc
	Wp+7Xt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzdR-00000007IV0-3vNT;
	Thu, 21 May 2026 09:24:09 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzdP-00000007ITf-0ANg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:24:08 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6949831a7bcso3346128eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779355446; cv=none;
        d=google.com; s=arc-20240605;
        b=FI9EoRbox2yxF8gMYc0DnZqcUwpHueJv08r6M2q2cKBjRy7He6Bb6ktfcdV6icgCrV
         Z76LuomOT9NJ2C6SBBooKfbuyT9ILhg9rVSkbzOR7P9M5qR0AkgvyW8rPsx0De/liRc1
         P6xQGg1sbAkn9sRYU6I2UMXKt0g1k3HQZQJzgWkMF/W/d/D1EWexfVbkDbAR93XWcbSQ
         U8+e8U2H1xRMeVRE/kQohUXianCbLFAGlzjsx7RASMzPNQwXKDF8jkpKVfpEg9N4t1hw
         xTRkCjavVDUq1Cu0ZmZWso0kVxHyKAMSUU4Yk5WLDz7GEGD8PYxwmCxq3E4alolfUAn2
         YvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        fh=GpTLLRxiAKlzW1jRaHmNnl2UpZLcIQHLCtCKWYYKldI=;
        b=jNQFc+BU5KxdhNzG3DD75M3VPmwNNI7xAiwwawCCM1sKmv/hCyhIC8KU1YGYLVxgCL
         M3/8zEOrNbx/CtR9oJzkPTNyUvl4qXbTxdYNUalWBeOj1KXQCzRRL5AuhJFQRvHzSqcI
         UoNsk8zpCAWiVN+hm6yhuRlFU0BkDGla/RTY1w05+CWSMLI2RvQ2GJ1p6fnk7eKiCHkp
         20w1qY2eUe0sML7Gnub2Xz76jOuuX9MqqitRfVMgHdTM/bXUNLvx/0yRDcWd+VJJkc93
         ImrJOBo+OrNJ6ZEy34+/50QZf2gw1tS6aCwUVZ7ZW9l6Iur9J1/+nKkbh02HoDf/eeM0
         CN5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355446; x=1779960246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        b=gU0JvTXA4OUuxeqg5Y7pLmCEogV6LC8IEFuh6PxEVyirDt/aaE5zclAGIGQZnApgXd
         nxL4eVOq6I7MzOJppku4yDzSq27njFz1SJyNQdLsD84MAjj2Hu31uaIDGE+G9tnfaf2D
         PwPJa/wTsNok3BV2Si8NyJzzhlzNBu3nynh5vzuFb+0h6anFHG3Vjo/ApRTdA3Rra5Ob
         vshMaIJF0p/qYyN64Duy+7bGVoiPtanX+iHAaJrOU0IhQmwVCyhyQ0P/WEObWyE4ARKJ
         q3V0VaEoF9JprujJKBAEJlkghLFO3f0Qdn0hBDzuxChe/2Is0JrQnAZ0AhxhaRRKWXDA
         iWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355446; x=1779960246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        b=avseg5VYTB0RYuBcEVL3PpP9/jhNZ43j7EK7nwBtPQHnrJiFn0BB2IoKgXstNRdt2S
         if8y1hokR1WdCl+k6WPVC63P0qQKwzwrcb8PV6Eq0FakIdYKkrFDrQIUdDs5hIQHigno
         ru/Q6dOtMNan/mG7K1V8UqIBPy/OrLuGC2Wvu6CSb4O+HZzUhzpVEqLGnFPszf2FC5Lz
         3Vq4ePoo9hdKxoNedazKUB7gIlJCHPyb54pBbP8/p6MCrHaDqnKDYI2I2i1OOfCKCbmC
         7I2wct7mDflK8WD9xMWUt/ZAtXCfEs1KCh5odH6mwy5D33lKu1K+WynS81lgjN4XgfJP
         TmoQ==
X-Forwarded-Encrypted: i=1; AFNElJ88wO+7ekiSUZ8LzGkUbkKloIFCTDp3VTAD0Zrdc3kXddTghxHpkX5o31L3kfFYW9wkLzOpmWSYAXkaHNVWZWv4@lists.infradead.org
X-Gm-Message-State: AOJu0YzqG0K2wVryq/hL3FAZZl5oRtaGdHHtgiT5GRnixD8vtbSQGQs4
	sMsToqTCxgkSL6n/euP91FNKtSC/0vPbPuBj+WGsWXLjyWFw/JQLfs6PMcG9xanDMcXcvKfqgdY
	KnFQV73yNPI9iaBdthvpe8ds/Pj4vuJE=
X-Gm-Gg: Acq92OEHygV9m8joGHrwcASedT59J/3pvsB3Z3WAmsLp8PRj2L0DL/4u6n2s8zrGySm
	Bn1hQPkj+3QfHy4LlXxcMYdM36K1WO25rUDXRJ/G7xHp2Bq+iqzcJ9zeI+jXUyUkFsLCbhWoxpE
	ErGcMx5+AIEq2LudYF455hA1x5kuJlLQ8RRbqnORy12p3ueAjqQtZ3P+TlTW0Drd8QJyEAjl/FN
	Hkydc0A6IGrRcu4lmMh8ofJy1Z4M6bvWmG77DFEx8Kno6j6c3xiqWhMcDadJXoJb7UqP3zAePQ4
	1wryHHqQfxdtryIz6Mqnsd8hShBrSQHdo1eFbSI58QzLq5uKEQfjcM0UctKz7gzU3/GkqcJxsLh
	EwGar
X-Received: by 2002:a05:6820:81c8:b0:67e:2988:15e1 with SMTP id
 006d021491bc7-69d6ee60692mr915956eaf.16.1779355445586; Thu, 21 May 2026
 02:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-15-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 21 May 2026 12:53:42 +0330
X-Gm-Features: AVHnY4JLgYD5g8KSsZAQsfTJHSovnmg95Dqn-5an288CZbWMq20rZb5y5QAIb78
Message-ID: <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
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
X-CRM114-CacheID: sfid-20260521_022407_129275_169469A8 
X-CRM114-Status: GOOD (  25.22  )
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

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Store the active format using the common V4L2 subdev active state
> instead of our local copy of it.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  16 ++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  18 ++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++++----------
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 --
>  5 files changed, 82 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index e7b99cee63d6..24e731bcabe9 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -595,11 +595,25 @@ static int sun6i_isp_capture_link_validate(struct m=
edia_link *link)
>                 media_entity_to_video_device(link->sink->entity);
>         struct sun6i_isp_device *isp_dev =3D video_get_drvdata(video_dev)=
;
>         struct v4l2_device *v4l2_dev =3D &isp_dev->v4l2.v4l2_dev;
> +       struct v4l2_subdev *proc_subdev =3D
> +               media_entity_to_v4l2_subdev(link->source->entity);
>         unsigned int capture_width, capture_height;
>         unsigned int proc_width, proc_height;
> +       struct v4l2_subdev_format proc_subdev_format =3D {
> +               .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad    =3D link->source->index,
> +       };
> +       int ret;
>
>         sun6i_isp_capture_dimensions(isp_dev, &capture_width, &capture_he=
ight);
> -       sun6i_isp_proc_dimensions(isp_dev, &proc_width, &proc_height);
> +
> +       ret =3D v4l2_subdev_call(proc_subdev, pad, get_fmt, NULL,
> +                              &proc_subdev_format);
> +       if (ret)
> +               return ret;
> +
> +       proc_width =3D proc_subdev_format.format.width;
> +       proc_height =3D proc_subdev_format.format.height;
>
>         /* No cropping/scaling is supported (yet). */
>         if (capture_width !=3D proc_width || capture_height !=3D proc_hei=
ght) {
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index b7ef33fa2b13..0cc48e2bc8c6 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -43,11 +43,14 @@ static const struct sun6i_isp_params_config sun6i_isp=
_params_config_default =3D {
>         },
>  };
>
> -static void sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_d=
ev)
> +static void
> +sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_dev,
> +                             const struct v4l2_mbus_framefmt *mbus_forma=
t)
>  {
>         unsigned int width, height;
>
> -       sun6i_isp_proc_dimensions(isp_dev, &width, &height);
> +       width =3D mbus_format->width;
> +       height =3D mbus_format->height;
>
>         sun6i_isp_load_write(isp_dev, SUN6I_ISP_OB_SIZE_REG,
>                              SUN6I_ISP_OB_SIZE_WIDTH(width) |
> @@ -112,10 +115,12 @@ static void sun6i_isp_params_configure_wb(struct su=
n6i_isp_device *isp_dev)
>                              SUN6I_ISP_WB_CFG_CLIP(0xfff));
>  }
>
> -static void sun6i_isp_params_configure_base(struct sun6i_isp_device *isp=
_dev)
> +static void
> +sun6i_isp_params_configure_base(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat)
>  {
>         sun6i_isp_params_configure_ae(isp_dev);
> -       sun6i_isp_params_configure_ob(isp_dev);
> +       sun6i_isp_params_configure_ob(isp_dev, mbus_format);
>         sun6i_isp_params_configure_wb(isp_dev);
>  }
>
> @@ -170,14 +175,15 @@ sun6i_isp_params_configure_modules(struct sun6i_isp=
_device *isp_dev,
>         sun6i_isp_load_write(isp_dev, SUN6I_ISP_MODULE_EN_REG, value);
>  }
>
> -void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev)
> +void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat)
>  {
>         struct sun6i_isp_params_state *state =3D &isp_dev->params.state;
>         unsigned long flags;
>
>         spin_lock_irqsave(&state->lock, flags);
>
> -       sun6i_isp_params_configure_base(isp_dev);
> +       sun6i_isp_params_configure_base(isp_dev, mbus_format);
>
>         /* Default config is only applied at the very first stream start.=
 */
>         if (state->configured)
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> index 50f10f879c42..c0d6cff95d54 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> @@ -36,8 +36,8 @@ struct sun6i_isp_params {
>
>  /* Params */
>
> -void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev);
> -
> +void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat);
>  /* State */
>
>  void sun6i_isp_params_state_update(struct sun6i_isp_device *isp_dev,
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> index 46a334b602f1..9073a7f3f8c8 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> @@ -15,17 +15,6 @@
>  #include "sun6i_isp_proc.h"
>  #include "sun6i_isp_reg.h"
>
> -/* Helpers */
> -
> -void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
> -                              unsigned int *width, unsigned int *height)
> -{
> -       if (width)
> -               *width =3D isp_dev->proc.mbus_format.width;
> -       if (height)
> -               *height =3D isp_dev->proc.mbus_format.height;
> -}
> -
>  /* Format */
>
>  static const struct sun6i_isp_proc_format sun6i_isp_proc_formats[] =3D {
> @@ -137,9 +126,10 @@ static void sun6i_isp_proc_disable(struct sun6i_isp_=
device *isp_dev)
>         regmap_write(regmap, SUN6I_ISP_FE_CFG_REG, 0);
>  }
>
> -static void sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev)
> +static void
> +sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev,
> +                        const struct v4l2_mbus_framefmt *mbus_format)
>  {
> -       struct v4l2_mbus_framefmt *mbus_format =3D &isp_dev->proc.mbus_fo=
rmat;
>         const struct sun6i_isp_proc_format *format;
>         u32 value;
>
> @@ -173,6 +163,8 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev=
 *subdev, int on)
>         struct sun6i_isp_proc_source *source;
>         struct v4l2_subdev *source_subdev;
>         struct media_pad *remote_pad;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *mbus_format;
>         int ret;
>
>         /* Source */
> @@ -191,6 +183,10 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subde=
v *subdev, int on)
>         else
>                 source =3D &proc->source_csi1;
>
> +       /* Active State */
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>         if (!on) {
>                 sun6i_isp_proc_irq_disable(isp_dev);
>                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> @@ -202,7 +198,7 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev=
 *subdev, int on)
>
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0)
> -               return ret;
> +               goto unlock;
>
>         /* Clear */
>
> @@ -210,9 +206,12 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subde=
v *subdev, int on)
>
>         /* Configure */
>
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_ISP_PROC_PAD_SIN=
K_CSI);
> +
>         sun6i_isp_tables_configure(isp_dev);
> -       sun6i_isp_params_configure(isp_dev);
> -       sun6i_isp_proc_configure(isp_dev);
> +       sun6i_isp_params_configure(isp_dev, mbus_format);
> +       sun6i_isp_proc_configure(isp_dev, mbus_format);
>         sun6i_isp_capture_configure(isp_dev);
>
>         /* State Update */
> @@ -230,13 +229,17 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subd=
ev *subdev, int on)
>                 goto disable;
>         }
>
> -       return 0;
> +       ret =3D 0;
> +       goto unlock;
>
>  disable:
>         sun6i_isp_proc_disable(isp_dev);
>
>         pm_runtime_put(dev);
>
> +unlock:
> +       v4l2_subdev_unlock_state(state);
> +
>         return ret;
>  }
>
> @@ -259,21 +262,22 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mbus=
_framefmt *mbus_format)
>  static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
>                                      struct v4l2_subdev_state *state)
>  {
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       unsigned int pad =3D SUN6I_ISP_PROC_PAD_SINK_CSI;
> -       struct v4l2_mbus_framefmt *mbus_format =3D
> -               v4l2_subdev_state_get_format(state, pad);
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> +       unsigned int pad;
>
> -       mutex_lock(lock);
> +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +               struct v4l2_mbus_framefmt *mbus_format;
>
> -       mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> -       mbus_format->width =3D 1280;
> -       mbus_format->height =3D 720;
> +               if (pad =3D=3D SUN6I_ISP_PROC_PAD_SINK_PARAMS)
> +                       continue;
>
> -       sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +               mbus_format =3D v4l2_subdev_state_get_format(state, pad);
>
> -       mutex_unlock(lock);
> +               mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code=
;
> +               mbus_format->width =3D 1280;
> +               mbus_format->height =3D 720;
> +
> +               sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +       }
>
>         return 0;
>  }
> @@ -291,53 +295,31 @@ sun6i_isp_proc_enum_mbus_code(struct v4l2_subdev *s=
ubdev,
>         return 0;
>  }
>
> -static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
> -                                 struct v4l2_subdev_state *state,
> -                                 struct v4l2_subdev_format *format)
> -{
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> -
> -       mutex_lock(lock);
> -
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> -                                                            format->pad)=
;
> -       else
> -               *mbus_format =3D isp_dev->proc.mbus_format;
> -
> -       mutex_unlock(lock);
> -
> -       return 0;
> -}
> -
>  static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
>                                   struct v4l2_subdev_state *state,
>                                   struct v4l2_subdev_format *format)
>  {
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> +       struct v4l2_mbus_framefmt *mbus_format;
>
> -       mutex_lock(lock);
> +       if (format->pad !=3D SUN6I_ISP_PROC_PAD_SINK_CSI)
> +               return v4l2_subdev_get_fmt(subdev, state, format);
>
> -       sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +       sun6i_isp_proc_mbus_format_prepare(&format->format);
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> -                       *mbus_format;
> -       else
> -               isp_dev->proc.mbus_format =3D *mbus_format;
> +       mbus_format =3D v4l2_subdev_state_get_format(state, format->pad);
> +       *mbus_format =3D format->format;
>
> -       mutex_unlock(lock);
> +       /* Propagate the format to the source pad. */
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_ISP_PROC_PAD_SOU=
RCE);
> +       *mbus_format =3D format->format;
>
>         return 0;
>  }
>
>  static const struct v4l2_subdev_pad_ops sun6i_isp_proc_pad_ops =3D {
>         .enum_mbus_code =3D sun6i_isp_proc_enum_mbus_code,
> -       .get_fmt        =3D sun6i_isp_proc_get_fmt,
> +       .get_fmt        =3D v4l2_subdev_get_fmt,
>         .set_fmt        =3D sun6i_isp_proc_set_fmt,
>  };
>
> @@ -499,8 +481,6 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp=
_dev)
>         struct media_pad *pads =3D proc->pads;
>         int ret;
>
> -       mutex_init(&proc->lock);
> -
>         /* V4L2 Subdev */
>
>         v4l2_subdev_init(subdev, &sun6i_isp_proc_subdev_ops);
> @@ -532,10 +512,14 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         /* V4L2 Subdev */
>
> +       ret =3D v4l2_subdev_init_finalize(subdev);
> +       if (ret < 0)
> +               goto error_media_entity;
> +
>         ret =3D v4l2_device_register_subdev(v4l2_dev, subdev);
>         if (ret < 0) {
>                 v4l2_err(v4l2_dev, "failed to register v4l2 subdev: %d\n"=
, ret);
> -               goto error_media_entity;
> +               goto error_subdev_finalize;
>         }
>
>         /* V4L2 Async */
> @@ -562,6 +546,9 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp=
_dev)
>
>         v4l2_device_unregister_subdev(subdev);
>
> +error_subdev_finalize:
> +       v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>         media_entity_cleanup(&subdev->entity);
>
> @@ -577,5 +564,7 @@ void sun6i_isp_proc_cleanup(struct sun6i_isp_device *=
isp_dev)
>         v4l2_async_nf_cleanup(notifier);
>
>         v4l2_device_unregister_subdev(subdev);
> +       v4l2_subdev_cleanup(subdev);
> +
>         media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> index db6738a39147..26c4327c5ed7 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> @@ -42,18 +42,11 @@ struct sun6i_isp_proc {
>         struct v4l2_subdev              subdev;
>         struct media_pad                pads[3];
>         struct v4l2_async_notifier      notifier;
> -       struct v4l2_mbus_framefmt       mbus_format;
> -       struct mutex                    lock; /* Mbus format lock. */
>
>         struct sun6i_isp_proc_source    source_csi0;
>         struct sun6i_isp_proc_source    source_csi1;
>  };
>
> -/* Helpers */
> -
> -void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
> -                              unsigned int *width, unsigned int *height)=
;
> -
>  /* Format */
>
>  const struct sun6i_isp_proc_format *sun6i_isp_proc_format_find(u32 mbus_=
code);
> --
> 2.54.0
>

I used LicheePi Zero Dock (V3s) with the following pipeline as test setup.

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified TRY and ACTIVE state handling, including changing TRY
formats without affecting ACTIVE state. Format propagation from the
sink (csi) pad to the source pad was also tested.

I also tested streaming with the sensor test pattern enabled and
verified the captured output was correct.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
--=20
Regards
Arash Golgol

