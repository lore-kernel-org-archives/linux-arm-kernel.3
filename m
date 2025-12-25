Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD9BE7AD42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jO9ZVC+Sv5KGX4TZR45vIwEWxSI6v4ie2TOfAN0k/Y=; b=Ijr8ccPH0SrGzq
	p8tT2y8Lra8isxOC8ZFVnm+oJM69vmt6JU1Gd/PWG1RDP08OjXh54GsU284QbxjO+0f7S0DcnbTkd
	a6n/dvJKCcyqhOvDfaZ9cZDEdqNjLHhsoUs4A4mfvjQAiZwaFfeNNADnSxmTEBIGzF6p/JK1F04+q
	SR7J1ERFMI8Hv5usnYcS8ZhCtyMELrGMfQuQHLnN9U99btC4wLmxQy0PeCPuzRXqFtHclUQ6b1w9j
	txGZg5OGe3mQMgI+lTwuOCAa8mSMbRFvUIhRWKO67lwtu5jC2cyBcAc78ygcuAOr/nuH7CRpQoikL
	kENDCTRBrJCtn0nuAmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhzA-00000000IQU-1KMC;
	Thu, 25 Dec 2025 09:50:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhz9-00000000IQJ-0KXj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Dec 2025 09:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=1jO9ZVC+Sv5KGX4TZR45vIwEWxSI6v4ie2TOfAN0k/Y=; b=jelm1Rl3uGl+Xdi4LU5zgK4T04
	F/BqMxptUEhfl82WQKsPRqbEywsxto5Mup4oUj/sqIFau2WtXfJA3oxszvGhosykxKTdfK00+OlUS
	2gCnj6aiDx3MM/HEkqyuyOi9rHqYFuk1VYowhot9EP0JlNU8DOIVXJGlNamSyKHk8kPilJvedn9m2
	XSc68kt4Yu2eGZ9jb92r9lUgsVTmtyzId5mLO4lGLq0DcRPQba/pQeWgmLaEdkb0BzrvLC9qHj4mz
	PEs4Sus99dAl1hiDY9SCk8KxIed4MdyKKpLFo+ebhDOmkiDadgh1FziS+L6/X+cPcHHzgeZvGNAx7
	tDWAcsaw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhz0-00000000PR0-0YUm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 09:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 798E4444A5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3D6C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766656204;
	bh=Z+LojugKlODv0WdjM0vbdLv2JUaHooTEqULsVCPjc3A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=r7e1/XEM5jHtY1SlLBn6/a0yxquH74NoIdZrMM6A1SRfOMH4PWeLBD2dRi6maRny9
	 uZMPGp0jhno/WOj7679yeMdT045B7m/EfEtrDMZFaHmMvyJR6Dsb3uZH6JINqk0tKI
	 V+rEERTbZqh9h5ODBM63CtrrAFER2XjJJzrVKxfDkmxTd0BkqRmg6Eohu5zhHZv+Wb
	 cHJJQzF+/6NP2UZ2nO2kOA/D++mbJoOVIuJ1yzfF5Tiswk7WU4rnRL/oOoiVvLVOvC
	 RLX12qwJnMwvII7Tfo397bEOPcTaWspn8X6ZhQH8MlZA5vLMh7xc+WoHZ7HdHJtgH8
	 q5EBdCRX6bdIw==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so2342032fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 01:50:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUX1+UKm9nz+2LYRKJKMUyId3HHjRgW6LTYzVRwh6iXPYKhUQbGwG798MFyhju3whLpzLvsiaTFyGXjGuDDliUx@lists.infradead.org
X-Gm-Message-State: AOJu0YyI8hLe53L+lYWageQIM+XFCrFTRD9v8PJYSImIy7hxbT8TB9ob
	J5xTweFmH+qTxPLfV3qUtdlqSheMW6J2L67vKbrp/ggAjXDzn73qsftDmH1ZyQh8IpmgqJNFudG
	E0LPY0cbqpe1TM6W0/hAioABszglgl2M=
X-Google-Smtp-Source: AGHT+IHy0s6wJhLRaq9jruYRmygY6NK9VE5jQGXxTqsz4FjEgyVHcOX4VpvlGiLLnkQjinIJ1/ugZHsD7xDfX/L8/t4=
X-Received: by 2002:a05:6820:1691:b0:65b:29af:b55f with SMTP id
 006d021491bc7-65d0e9b71d0mr7606538eaf.35.1766656203125; Thu, 25 Dec 2025
 01:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-8-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-8-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:49:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
X-Gm-Features: AQt7F2rLIS4H7Xj_k6kBZKKbWXDlqSHssxeujnFrIM_IapLVNe6Uj-8rhSrFP2s
Message-ID: <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/sun4i: switch DE33 to new bindings
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_095011_376981_BF25CB8A 
X-CRM114-Status: GOOD (  27.60  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> Now that everything is in place, switch DE33 to new bindings.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 130 +++++++++++++++-------------
>  drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
>  2 files changed, 71 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index fde3b677e925..da213e54e653 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>
> @@ -24,6 +25,7 @@
>  #include <drm/drm_probe_helper.h>
>
>  #include "sun4i_drv.h"
> +#include "sun50i_planes.h"
>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"
> @@ -256,7 +258,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *e=
ngine,
>  {
>         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
>         u32 bld_base =3D sun8i_blender_base(mixer);
> -       struct regmap *bld_regs =3D sun8i_blender_regmap(mixer);
>         struct drm_plane_state *plane_state;
>         struct drm_plane *plane;
>         u32 route =3D 0, pipe_en =3D 0;
> @@ -293,16 +294,16 @@ static void sun8i_mixer_commit(struct sunxi_engine =
*engine,
>                 route |=3D layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_S=
HIFT(zpos);
>                 pipe_en |=3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
>
> -               regmap_write(bld_regs,
> +               regmap_write(engine->regs,
>                              SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos)=
,
>                              SUN8I_MIXER_COORD(x, y));
> -               regmap_write(bld_regs,
> +               regmap_write(engine->regs,
>                              SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos=
),
>                              SUN8I_MIXER_SIZE(w, h));
>         }
>
> -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
> -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), rou=
te);
> +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
>                      pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
>
>         if (mixer->cfg->de_type !=3D SUN8I_MIXER_DE33)
> @@ -317,7 +318,6 @@ static struct drm_plane **sun8i_layers_init(struct dr=
m_device *drm,
>         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
>         int plane_cnt =3D mixer->cfg->ui_num + mixer->cfg->vi_num;
>         enum drm_plane_type type;
> -       unsigned int phy_index;
>         int i;
>
>         planes =3D devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP=
_KERNEL);
> @@ -332,12 +332,8 @@ static struct drm_plane **sun8i_layers_init(struct d=
rm_device *drm,
>                 else
>                         type =3D DRM_PLANE_TYPE_OVERLAY;
>
> -               phy_index =3D i;
> -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> -                       phy_index =3D mixer->cfg->map[i];
> -
>                 layer =3D sun8i_vi_layer_init_one(drm, type, mixer->engin=
e.regs,
> -                                               i, phy_index, plane_cnt,
> +                                               i, i, plane_cnt,
>                                                 &mixer->cfg->lay_cfg);
>                 if (IS_ERR(layer)) {
>                         dev_err(drm->dev,
> @@ -357,12 +353,8 @@ static struct drm_plane **sun8i_layers_init(struct d=
rm_device *drm,
>                 else
>                         type =3D DRM_PLANE_TYPE_OVERLAY;
>
> -               phy_index =3D index;
> -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> -                       phy_index =3D mixer->cfg->map[index];
> -
>                 layer =3D sun8i_ui_layer_init_one(drm, type, mixer->engin=
e.regs,
> -                                               index, phy_index, plane_c=
nt,
> +                                               index, index, plane_cnt,
>                                                 &mixer->cfg->lay_cfg);
>                 if (IS_ERR(layer)) {
>                         dev_err(drm->dev, "Couldn't initialize %s plane\n=
",
> @@ -376,16 +368,25 @@ static struct drm_plane **sun8i_layers_init(struct =
drm_device *drm,
>         return planes;
>  }
>
> +static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
> +                                            struct sunxi_engine *engine)
> +{
> +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +
> +       if (IS_ENABLED(CONFIG_DRM_SUN50I_PLANES))
> +               return sun50i_planes_setup(mixer->planes_dev, drm, engine=
->id);
> +
> +       return NULL;
> +}
> +
>  static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
>                                  const struct drm_display_mode *mode)
>  {
>         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> -       struct regmap *bld_regs;
>         u32 bld_base, size, val;
>         bool interlaced;
>
>         bld_base =3D sun8i_blender_base(mixer);
> -       bld_regs =3D sun8i_blender_regmap(mixer);
>         interlaced =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>         size =3D SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
>
> @@ -397,14 +398,14 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
>         else
>                 regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE,=
 size);
>
> -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size)=
;
> +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), s=
ize);
>
>         if (interlaced)
>                 val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
>         else
>                 val =3D 0;
>
> -       regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +       regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_bas=
e),
>                            SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
>
>         DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> @@ -417,8 +418,14 @@ static const struct sunxi_engine_ops sun8i_engine_op=
s =3D {
>         .mode_set       =3D sun8i_mixer_mode_set,
>  };
>
> +static const struct sunxi_engine_ops sun50i_engine_ops =3D {
> +       .commit         =3D sun8i_mixer_commit,
> +       .layers_init    =3D sun50i_layers_init,
> +       .mode_set       =3D sun8i_mixer_mode_set,
> +};
> +
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> -       .name           =3D "layers",
> +       .name           =3D "display",
>         .reg_bits       =3D 32,
>         .val_bits       =3D 32,
>         .reg_stride     =3D 4,
> @@ -433,14 +440,6 @@ static const struct regmap_config sun8i_top_regmap_c=
onfig =3D {
>         .max_register   =3D 0x3c,
>  };
>
> -static const struct regmap_config sun8i_disp_regmap_config =3D {
> -       .name           =3D "display",
> -       .reg_bits       =3D 32,
> -       .val_bits       =3D 32,
> -       .reg_stride     =3D 4,
> -       .max_register   =3D 0x20000,
> -};
> -
>  static int sun8i_mixer_of_get_id(struct device_node *node)
>  {
>         struct device_node *ep, *remote;
> @@ -463,17 +462,14 @@ static int sun8i_mixer_of_get_id(struct device_node=
 *node)
>
>  static void sun8i_mixer_init(struct sun8i_mixer *mixer)
>  {
> -       struct regmap *top_regs, *disp_regs;
>         unsigned int base =3D sun8i_blender_base(mixer);
> +       struct regmap *top_regs;
>         int plane_cnt, i;
>
> -       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
>                 top_regs =3D mixer->top_regs;
> -               disp_regs =3D mixer->disp_regs;
> -       } else {
> +       else
>                 top_regs =3D mixer->engine.regs;
> -               disp_regs =3D mixer->engine.regs;
> -       }
>
>         /* Enable the mixer */
>         regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
> @@ -483,25 +479,25 @@ static void sun8i_mixer_init(struct sun8i_mixer *mi=
xer)
>                 regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
>
>         /* Set background color to black */
> -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
>                      SUN8I_MIXER_BLEND_COLOR_BLACK);
>
>         /*
>          * Set fill color of bottom plane to black. Generally not needed
>          * except when VI plane is at bottom (zpos =3D 0) and enabled.
>          */
> -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base)=
,
>                      SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(ba=
se, 0),
>                      SUN8I_MIXER_BLEND_COLOR_BLACK);
>
>         plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
>         for (i =3D 0; i < plane_cnt; i++)
> -               regmap_write(disp_regs,
> +               regmap_write(mixer->engine.regs,
>                              SUN8I_MIXER_BLEND_MODE(base, i),
>                              SUN8I_MIXER_BLEND_MODE_DEF);
>
> -       regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +       regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL=
(base),
>                            SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
>  }
>
> @@ -532,7 +528,6 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
>         if (!mixer)
>                 return -ENOMEM;
>         dev_set_drvdata(dev, mixer);
> -       mixer->engine.ops =3D &sun8i_engine_ops;
>         mixer->engine.node =3D dev->of_node;
>
>         if (of_property_present(dev->of_node, "iommus")) {
> @@ -562,6 +557,11 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>         if (!mixer->cfg)
>                 return -EINVAL;
>
> +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> +               mixer->engine.ops =3D &sun50i_engine_ops;

You're missing an IS_ENABLED() clause here if you wanted to make the DE 3.3
planes driver optional. Though as I mentioned in the other patch, splittig
the two modules might not work.

> +       else
> +               mixer->engine.ops =3D &sun8i_engine_ops;
> +
>         regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(regs))
>                 return PTR_ERR(regs);
> @@ -584,17 +584,6 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>                         dev_err(dev, "Couldn't create the top regmap\n");
>                         return PTR_ERR(mixer->top_regs);
>                 }
> -
> -               regs =3D devm_platform_ioremap_resource_byname(pdev, "dis=
play");
> -               if (IS_ERR(regs))
> -                       return PTR_ERR(regs);
> -
> -               mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> -                                                        &sun8i_disp_regm=
ap_config);
> -               if (IS_ERR(mixer->disp_regs)) {
> -                       dev_err(dev, "Couldn't create the disp regmap\n")=
;
> -                       return PTR_ERR(mixer->disp_regs);
> -               }
>         }
>
>         mixer->reset =3D devm_reset_control_get(dev, NULL);
> @@ -634,6 +623,33 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>
>         clk_prepare_enable(mixer->mod_clk);
>
> +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> +               struct platform_device *pdev;
> +               struct device_node *np;
> +               void *data;
> +
> +               np =3D of_parse_phandle(dev->of_node, "allwinner,planes",=
 0);
> +               if (!np) {
> +                       ret =3D -ENODEV;
> +                       goto err_disable_mod_clk;
> +               }
> +
> +               pdev =3D of_find_device_by_node(np);

You need to add a matching put_device() in the unbind function.

Side note:

This bind function is using a lot of devm_ functions. These have the wrong
lifetime. I think it would be better if we could move resource acquisition
into the probe function.


> +               of_node_put(np);
> +               if (!pdev) {
> +                       ret =3D -EPROBE_DEFER;
> +                       goto err_disable_mod_clk;
> +               }
> +
> +               data =3D platform_get_drvdata(pdev);
> +               if (!data) {
> +                       put_device(&pdev->dev);
> +                       return -EPROBE_DEFER;

Should be a goto here?


ChenYu

> +               }
> +
> +               mixer->planes_dev =3D &pdev->dev;
> +       }
> +
>         list_add_tail(&mixer->engine.list, &drv->engine_list);
>
>         /* Reset registers and disable unused sub-engines */
> @@ -668,6 +684,8 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
>
>         return 0;
>
> +err_disable_mod_clk:
> +       clk_disable_unprepare(mixer->mod_clk);
>  err_disable_bus_clk:
>         clk_disable_unprepare(mixer->bus_clk);
>  err_assert_reset:
> @@ -863,16 +881,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0=
_cfg =3D {
>  };
>
>  static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg =3D {
> -       .lay_cfg =3D {
> -               .de_type        =3D SUN8I_MIXER_DE33,
> -               .scaler_mask    =3D 0xf,
> -               .scanline_yuv   =3D 4096,
> -       },
>         .de_type        =3D SUN8I_MIXER_DE33,
>         .mod_rate       =3D 600000000,
> -       .ui_num         =3D 3,
> -       .vi_num         =3D 1,
> -       .map            =3D {0, 6, 7, 8},
>  };
>
>  static const struct of_device_id sun8i_mixer_of_table[] =3D {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index e2f83301aae8..7abc88c898d9 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
>         int                     ui_num;
>         unsigned int            de_type;
>         unsigned long           mod_rate;
> -       unsigned int            map[6];
>  };
>
>  struct sun8i_mixer {
> @@ -216,7 +215,7 @@ struct sun8i_mixer {
>         struct clk                      *mod_clk;
>
>         struct regmap                   *top_regs;
> -       struct regmap                   *disp_regs;
> +       struct device                   *planes_dev;
>  };
>
>  enum {
> @@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
>         return mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE3 ? DE3_BLD_BASE =
: DE2_BLD_BASE;
>  }
>
> -static inline struct regmap *
> -sun8i_blender_regmap(struct sun8i_mixer *mixer)
> -{
> -       return mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33 ?
> -               mixer->disp_regs : mixer->engine.regs;
> -}
> -
>  static inline u32
>  sun8i_channel_base(struct sun8i_layer *layer)
>  {
> --
> 2.51.2
>
>

