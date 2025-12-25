Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4AFE7AD4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ual+W6DDkJtt+syVHuGALj1VtGBu5zyBQ1OOhp1LPA=; b=LT6n6zFPmINxPoskcT8KKMt1hB
	ReEmtqqKH6xjlWwS0pJOPqtQ+GgPSbG/axHHAziksO/ygjucmLVNVyPBiE+dlEyjNFzzE39+sTtqI
	F7Vu07LoCZTzzdbwefRpy9dUQOezAdPrRQFCQCi11k7YjTn2kb0+6wWkTtYgJGf8nFv4lSuPZe5Z/
	hsJtc0ySvkjRQa+ddnqR1Mo2ch0fJlEX4Hy9upll2D8TpMnbTRwXBftiZvGFm+Kk17LBDPdyt8zLR
	3GgIJ6fD3WszFttnEFLRcDc9ISZzm+UenUrFbGCZvsLvETzdrt6vJn3EoVOMZGRHN0G0BDuAggwqb
	b544CSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqt2-00000000dVZ-4AcY;
	Thu, 25 Dec 2025 19:20:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqt0-00000000dVD-1vhX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 19:20:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so7255955a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 11:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766690432; x=1767295232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ual+W6DDkJtt+syVHuGALj1VtGBu5zyBQ1OOhp1LPA=;
        b=kzM28Dac1uqx+1ccnjV80a0+nFnvzf8b/7dgewqeocZ7LAfZZ6pWHx1EDAwWKuqZMZ
         wrYvvYyxhPIVgqiReR6jFIaXOUVbT0j96r+hWYgCkL3hQNMwwlBCAhmZuLuGP9YvXoKS
         HD8fCE1AnK1SjG3TYDx0N7KraCUaP0iTtFdo5MhnqKNqfsoK/ApMr66fl9hRAQ8/ZARN
         czwkdUo/YD115B4UGrYlmtQ3QDqrQyr+nWjij1dgTd4r4cYJ/Prz+CPttt5ko7lPdHsl
         4aPtQg1d/Pr+nGfX/ccenUYAEudHqSc+SJEpmLkR5sU6S2X9L1iREmDSrMxsJVjTtvRa
         ClyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766690432; x=1767295232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ual+W6DDkJtt+syVHuGALj1VtGBu5zyBQ1OOhp1LPA=;
        b=f5NZOzFf7Wm9JFOTxmmrhVb3vxiYYn75vrFVHCLzkBuYBJjr7DPDuNRr/ihluSBRXD
         Rkqb+7zn9tGbWfyBNqWMosW7/SsMtROBGDagkBh9BOBa76Bs4pughrmGHPM5JkVl9rMY
         DoOo8v7uW80w6oons+AwUkVNktrTPGT3uzVRy06e06rkKQ3DDx5xK5mK8htus4Fbl8Nf
         asJBV0UELGeUkV6fG2cSrFmGXB75knv4hPt9vDMkOFVqvnVE/Hac5j8qeH0iIbI5SRMd
         2/3YZRPo1GJ/hpGwBIL5oGyLrrSQ9NzWhnNIWf4ePhr7j0x8hwxBQCj4k/vAYNcy34Lz
         AYgg==
X-Forwarded-Encrypted: i=1; AJvYcCUHkIWichfLNCzddzrGi3VSy1a0MuDq0/M9yA6XGsfdodq2TQAR8gdkQdqWi/qGYqWpDVe5vubSqDKZkLZb/XJZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwgJzCM14DUVNLzxXABviM4LDBZh2Dc9mcDxCMSD75Atqexav6c
	qh7dC4r4h+6HyAi3OcgOGPcXEkNyOxig7tl53BGL6x+4PZT+siL2KAX7
X-Gm-Gg: AY/fxX604LG5eT5UkoX/nq6PkTjlbCWIwWOzmu/7OSRq2fw3eX8fPmzdD5SRFWoUhHn
	fQK7nBb49fMoNNuc726PQwZl8QjjZ4XAWniSrfXCbM9HZjkbWqAIWxBf2Jii+prpa6CKmK3xT2t
	AXqastSJF0ogX8CEB2RVwImrMVd+pPKe4NQb35Ilr5zLjCAOW+OAR4P6a37S0bMtSK1PRS5blWg
	QZzcqhx+c2gbVl93wzcHBYwBlv3w3v7WTagCdBzY3I0e85okF7MSQC5Y8/Ko1zVSXkPqjfPgyqL
	t/QO0STyDfZBgfcKprVTKvnU5BQd45gxPYw8EaBpE8Q+hgivAgYdjrfHSraEx5czDo4zhkbS1zc
	WX0Jy89PuOpQY5A0PGw/i7HkedtvSqyp9lc6j1H+TLPQJtH5RqY0btN3UJFkUK8fWwbqkpanMD2
	px/67sy6YKXFSD8k4GE7pXvMZRgqzwGjU1
X-Google-Smtp-Source: AGHT+IG3koG/3abxHLtWkZ337VV1CmsvGGyayKli2Quehqnffrl9OvRiJwbUvz3ehq/xnRoimTHc8Q==
X-Received: by 2002:a05:6402:2808:b0:647:5f97:ab37 with SMTP id 4fb4d7f45d1cf-64b8cd31acfmr22428490a12.2.1766690432300;
        Thu, 25 Dec 2025 11:20:32 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm20550613a12.8.2025.12.25.11.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:20:31 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/sun4i: switch DE33 to new bindings
Date: Thu, 25 Dec 2025 20:20:29 +0100
Message-ID: <3684052.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-8-jernej.skrabec@gmail.com>
 <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_112034_668130_BB58A460 
X-CRM114-Status: GOOD (  24.56  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 10:49:47 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > Now that everything is in place, switch DE33 to new bindings.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 130 +++++++++++++++-------------
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
> >  2 files changed, 71 insertions(+), 69 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index fde3b677e925..da213e54e653 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> >
> > @@ -24,6 +25,7 @@
> >  #include <drm/drm_probe_helper.h>
> >
> >  #include "sun4i_drv.h"
> > +#include "sun50i_planes.h"
> >  #include "sun8i_mixer.h"
> >  #include "sun8i_ui_layer.h"
> >  #include "sun8i_vi_layer.h"
> > @@ -256,7 +258,6 @@ static void sun8i_mixer_commit(struct sunxi_engine =
*engine,
> >  {
> >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> >         u32 bld_base =3D sun8i_blender_base(mixer);
> > -       struct regmap *bld_regs =3D sun8i_blender_regmap(mixer);
> >         struct drm_plane_state *plane_state;
> >         struct drm_plane *plane;
> >         u32 route =3D 0, pipe_en =3D 0;
> > @@ -293,16 +294,16 @@ static void sun8i_mixer_commit(struct sunxi_engin=
e *engine,
> >                 route |=3D layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE=
_SHIFT(zpos);
> >                 pipe_en |=3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> >
> > -               regmap_write(bld_regs,
> > +               regmap_write(engine->regs,
> >                              SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpo=
s),
> >                              SUN8I_MIXER_COORD(x, y));
> > -               regmap_write(bld_regs,
> > +               regmap_write(engine->regs,
> >                              SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zp=
os),
> >                              SUN8I_MIXER_SIZE(w, h));
> >         }
> >
> > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route=
);
> > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), r=
oute);
> > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> >                      pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> >
> >         if (mixer->cfg->de_type !=3D SUN8I_MIXER_DE33)
> > @@ -317,7 +318,6 @@ static struct drm_plane **sun8i_layers_init(struct =
drm_device *drm,
> >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> >         int plane_cnt =3D mixer->cfg->ui_num + mixer->cfg->vi_num;
> >         enum drm_plane_type type;
> > -       unsigned int phy_index;
> >         int i;
> >
> >         planes =3D devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), G=
=46P_KERNEL);
> > @@ -332,12 +332,8 @@ static struct drm_plane **sun8i_layers_init(struct=
 drm_device *drm,
> >                 else
> >                         type =3D DRM_PLANE_TYPE_OVERLAY;
> >
> > -               phy_index =3D i;
> > -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > -                       phy_index =3D mixer->cfg->map[i];
> > -
> >                 layer =3D sun8i_vi_layer_init_one(drm, type, mixer->eng=
ine.regs,
> > -                                               i, phy_index, plane_cnt,
> > +                                               i, i, plane_cnt,
> >                                                 &mixer->cfg->lay_cfg);
> >                 if (IS_ERR(layer)) {
> >                         dev_err(drm->dev,
> > @@ -357,12 +353,8 @@ static struct drm_plane **sun8i_layers_init(struct=
 drm_device *drm,
> >                 else
> >                         type =3D DRM_PLANE_TYPE_OVERLAY;
> >
> > -               phy_index =3D index;
> > -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > -                       phy_index =3D mixer->cfg->map[index];
> > -
> >                 layer =3D sun8i_ui_layer_init_one(drm, type, mixer->eng=
ine.regs,
> > -                                               index, phy_index, plane=
_cnt,
> > +                                               index, index, plane_cnt,
> >                                                 &mixer->cfg->lay_cfg);
> >                 if (IS_ERR(layer)) {
> >                         dev_err(drm->dev, "Couldn't initialize %s plane=
\n",
> > @@ -376,16 +368,25 @@ static struct drm_plane **sun8i_layers_init(struc=
t drm_device *drm,
> >         return planes;
> >  }
> >
> > +static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
> > +                                            struct sunxi_engine *engin=
e)
> > +{
> > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > +
> > +       if (IS_ENABLED(CONFIG_DRM_SUN50I_PLANES))
> > +               return sun50i_planes_setup(mixer->planes_dev, drm, engi=
ne->id);
> > +
> > +       return NULL;
> > +}
> > +
> >  static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
> >                                  const struct drm_display_mode *mode)
> >  {
> >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > -       struct regmap *bld_regs;
> >         u32 bld_base, size, val;
> >         bool interlaced;
> >
> >         bld_base =3D sun8i_blender_base(mixer);
> > -       bld_regs =3D sun8i_blender_regmap(mixer);
> >         interlaced =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> >         size =3D SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
> >
> > @@ -397,14 +398,14 @@ static void sun8i_mixer_mode_set(struct sunxi_eng=
ine *engine,
> >         else
> >                 regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZ=
E, size);
> >
> > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), siz=
e);
> > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base),=
 size);
> >
> >         if (interlaced)
> >                 val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> >         else
> >                 val =3D 0;
> >
> > -       regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> > +       regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_b=
ase),
> >                            SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
> >
> >         DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> > @@ -417,8 +418,14 @@ static const struct sunxi_engine_ops sun8i_engine_=
ops =3D {
> >         .mode_set       =3D sun8i_mixer_mode_set,
> >  };
> >
> > +static const struct sunxi_engine_ops sun50i_engine_ops =3D {
> > +       .commit         =3D sun8i_mixer_commit,
> > +       .layers_init    =3D sun50i_layers_init,
> > +       .mode_set       =3D sun8i_mixer_mode_set,
> > +};
> > +
> >  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> > -       .name           =3D "layers",
> > +       .name           =3D "display",
> >         .reg_bits       =3D 32,
> >         .val_bits       =3D 32,
> >         .reg_stride     =3D 4,
> > @@ -433,14 +440,6 @@ static const struct regmap_config sun8i_top_regmap=
_config =3D {
> >         .max_register   =3D 0x3c,
> >  };
> >
> > -static const struct regmap_config sun8i_disp_regmap_config =3D {
> > -       .name           =3D "display",
> > -       .reg_bits       =3D 32,
> > -       .val_bits       =3D 32,
> > -       .reg_stride     =3D 4,
> > -       .max_register   =3D 0x20000,
> > -};
> > -
> >  static int sun8i_mixer_of_get_id(struct device_node *node)
> >  {
> >         struct device_node *ep, *remote;
> > @@ -463,17 +462,14 @@ static int sun8i_mixer_of_get_id(struct device_no=
de *node)
> >
> >  static void sun8i_mixer_init(struct sun8i_mixer *mixer)
> >  {
> > -       struct regmap *top_regs, *disp_regs;
> >         unsigned int base =3D sun8i_blender_base(mixer);
> > +       struct regmap *top_regs;
> >         int plane_cnt, i;
> >
> > -       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> >                 top_regs =3D mixer->top_regs;
> > -               disp_regs =3D mixer->disp_regs;
> > -       } else {
> > +       else
> >                 top_regs =3D mixer->engine.regs;
> > -               disp_regs =3D mixer->engine.regs;
> > -       }
> >
> >         /* Enable the mixer */
> >         regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
> > @@ -483,25 +479,25 @@ static void sun8i_mixer_init(struct sun8i_mixer *=
mixer)
> >                 regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
> >
> >         /* Set background color to black */
> > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base=
),
> >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> >
> >         /*
> >          * Set fill color of bottom plane to black. Generally not needed
> >          * except when VI plane is at bottom (zpos =3D 0) and enabled.
> >          */
> > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bas=
e),
> >                      SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(=
base, 0),
> >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> >
> >         plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
> >         for (i =3D 0; i < plane_cnt; i++)
> > -               regmap_write(disp_regs,
> > +               regmap_write(mixer->engine.regs,
> >                              SUN8I_MIXER_BLEND_MODE(base, i),
> >                              SUN8I_MIXER_BLEND_MODE_DEF);
> >
> > -       regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> > +       regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_C=
TL(base),
> >                            SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> >  }
> >
> > @@ -532,7 +528,6 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
> >         if (!mixer)
> >                 return -ENOMEM;
> >         dev_set_drvdata(dev, mixer);
> > -       mixer->engine.ops =3D &sun8i_engine_ops;
> >         mixer->engine.node =3D dev->of_node;
> >
> >         if (of_property_present(dev->of_node, "iommus")) {
> > @@ -562,6 +557,11 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct device *master,
> >         if (!mixer->cfg)
> >                 return -EINVAL;
> >
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > +               mixer->engine.ops =3D &sun50i_engine_ops;
>=20
> You're missing an IS_ENABLED() clause here if you wanted to make the DE 3=
=2E3
> planes driver optional. Though as I mentioned in the other patch, splittig
> the two modules might not work.

No, as I said in previous response, I'll merge it into sun8i-mixer.

>=20
> > +       else
> > +               mixer->engine.ops =3D &sun8i_engine_ops;
> > +
> >         regs =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(regs))
> >                 return PTR_ERR(regs);
> > @@ -584,17 +584,6 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct device *master,
> >                         dev_err(dev, "Couldn't create the top regmap\n"=
);
> >                         return PTR_ERR(mixer->top_regs);
> >                 }
> > -
> > -               regs =3D devm_platform_ioremap_resource_byname(pdev, "d=
isplay");
> > -               if (IS_ERR(regs))
> > -                       return PTR_ERR(regs);
> > -
> > -               mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> > -                                                        &sun8i_disp_re=
gmap_config);
> > -               if (IS_ERR(mixer->disp_regs)) {
> > -                       dev_err(dev, "Couldn't create the disp regmap\n=
");
> > -                       return PTR_ERR(mixer->disp_regs);
> > -               }
> >         }
> >
> >         mixer->reset =3D devm_reset_control_get(dev, NULL);
> > @@ -634,6 +623,33 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct device *master,
> >
> >         clk_prepare_enable(mixer->mod_clk);
> >
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > +               struct platform_device *pdev;
> > +               struct device_node *np;
> > +               void *data;
> > +
> > +               np =3D of_parse_phandle(dev->of_node, "allwinner,planes=
", 0);
> > +               if (!np) {
> > +                       ret =3D -ENODEV;
> > +                       goto err_disable_mod_clk;
> > +               }
> > +
> > +               pdev =3D of_find_device_by_node(np);
>=20
> You need to add a matching put_device() in the unbind function.
>=20
> Side note:
>=20
> This bind function is using a lot of devm_ functions. These have the wrong
> lifetime. I think it would be better if we could move resource acquisition
> into the probe function.

Good point. This can be clean up later.

>=20
>=20
> > +               of_node_put(np);
> > +               if (!pdev) {
> > +                       ret =3D -EPROBE_DEFER;
> > +                       goto err_disable_mod_clk;
> > +               }
> > +
> > +               data =3D platform_get_drvdata(pdev);
> > +               if (!data) {
> > +                       put_device(&pdev->dev);
> > +                       return -EPROBE_DEFER;
>=20
> Should be a goto here?

Right.

Best regards,
Jernej

>=20
>=20
> ChenYu
>=20
> > +               }
> > +
> > +               mixer->planes_dev =3D &pdev->dev;
> > +       }
> > +
> >         list_add_tail(&mixer->engine.list, &drv->engine_list);
> >
> >         /* Reset registers and disable unused sub-engines */
> > @@ -668,6 +684,8 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
> >
> >         return 0;
> >
> > +err_disable_mod_clk:
> > +       clk_disable_unprepare(mixer->mod_clk);
> >  err_disable_bus_clk:
> >         clk_disable_unprepare(mixer->bus_clk);
> >  err_assert_reset:
> > @@ -863,16 +881,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixe=
r0_cfg =3D {
> >  };
> >
> >  static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg =3D {
> > -       .lay_cfg =3D {
> > -               .de_type        =3D SUN8I_MIXER_DE33,
> > -               .scaler_mask    =3D 0xf,
> > -               .scanline_yuv   =3D 4096,
> > -       },
> >         .de_type        =3D SUN8I_MIXER_DE33,
> >         .mod_rate       =3D 600000000,
> > -       .ui_num         =3D 3,
> > -       .vi_num         =3D 1,
> > -       .map            =3D {0, 6, 7, 8},
> >  };
> >
> >  static const struct of_device_id sun8i_mixer_of_table[] =3D {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4=
i/sun8i_mixer.h
> > index e2f83301aae8..7abc88c898d9 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
> >         int                     ui_num;
> >         unsigned int            de_type;
> >         unsigned long           mod_rate;
> > -       unsigned int            map[6];
> >  };
> >
> >  struct sun8i_mixer {
> > @@ -216,7 +215,7 @@ struct sun8i_mixer {
> >         struct clk                      *mod_clk;
> >
> >         struct regmap                   *top_regs;
> > -       struct regmap                   *disp_regs;
> > +       struct device                   *planes_dev;
> >  };
> >
> >  enum {
> > @@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
> >         return mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE3 ? DE3_BLD_BAS=
E : DE2_BLD_BASE;
> >  }
> >
> > -static inline struct regmap *
> > -sun8i_blender_regmap(struct sun8i_mixer *mixer)
> > -{
> > -       return mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33 ?
> > -               mixer->disp_regs : mixer->engine.regs;
> > -}
> > -
> >  static inline u32
> >  sun8i_channel_base(struct sun8i_layer *layer)
> >  {
> > --
> > 2.51.2
> >
> >
>=20





