Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B5CEF586C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1g+0t9HyVXdFrZRpw6jgWddfRKPzWReFsz+gFXMWCcY=; b=NeuKuNUbwi7/go/+x5eOYaN0jr
	VFMsYofo6ruORyKahA0275ZepYcX7Es5KIU6ZAlHp4AStbma4QepDBWewUhq8ijJWCxVosx0ZMbs8
	HDrazIPI2jm7B+Co6ul7QfA1v7/JSPxKTKNI65cVxmkHRy+af4kk8Rxpsw6hvAaueiIIRtZ+lF103
	rwdNpXyuYPMkbbwYEEyHuCzq/5IHpQYLkXwI6OxdXVXTdjDmaylTB4oVPeOAIbBfiWwJy88kjlEoH
	fKu+PBJbjuZ4PocVTkx6XG8/63C7OIjqzHJDu4ze5F8sfsm73DZrtbICZd0b3SUTOxSn4CK1wgc0M
	vQfifS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrWAP-00000005DvW-3oFC;
	Sun, 15 Feb 2026 07:03:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrWAN-00000005DvA-34PY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 07:03:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48371119eacso20553275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 23:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771139017; x=1771743817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g+0t9HyVXdFrZRpw6jgWddfRKPzWReFsz+gFXMWCcY=;
        b=kmWpCfcHiy7MV+37kLgpw7iQ+hFqlzcq7Gsq+oJp8wMvjVMSvEYsf0D4Q6Ew8g2fft
         dY2deDkoUYhYlAxUpsH1owcsJb+GuTrgljcoxmbk3HKQC5MLlUE/2cPdU5PHjBBEjOeq
         Le/5hh+Ns3H8flruT1F0+KfR5MsCLhmrLgH3BhoeTNAPrBbdKW9iqoJQ9zASsCXeSTkT
         d9KaPxF3MSjW3l+PWlvhzIQa+1fXDHH3T0XFz9/uA7Om7fqhoTHMI00F+M7162e+9+gh
         VrdLA13a5huGkfvLBvwA2gL2pL2rRlgZ5yHyhKyi38g7nq76K/s/1Zcfx+3eNz29aXe0
         UGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771139017; x=1771743817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1g+0t9HyVXdFrZRpw6jgWddfRKPzWReFsz+gFXMWCcY=;
        b=rlsFMYXRcizjPhTN3FKBvKmR0fB2IPvXDx8d712IOdjiu4RalAHZJbIMSTwTBRKdXx
         vyPH+uqL5Bkno5R6THl+I8AK2JZ8rKI9d0+bVptdjy4+mtjksA4+fDnAA/fWKKwWlxuA
         T6O1C8myQuvL0YYY6JKKGuazxfXno5Oap8pd9Lr7T8HXo+uw2X1tvlmezrsgv6J3Afln
         kBfL/yNQmXyXYx0WH6f9RKzWiLl40ZhIcKvsTT6vq/lFXvkofwpebFDKc1M3QNCzCuDo
         d1vsytb60YtbW1uDHFojs0iwfyx6sRsCqVQjsVuDrGk5UQ4mz4PFTOhR3cLAUtNooNms
         mZng==
X-Forwarded-Encrypted: i=1; AJvYcCVwt2k2mv8iDd7A9d1Ix7Up2HcnwB97jwokX4rjpceXpWa07k99wyFkREvpZrrayZMgvgrgYPmkvb7GSzF8qdro@lists.infradead.org
X-Gm-Message-State: AOJu0YziEVyfUe+HMMzkt17OTC0+ycGdIm+oq+uSQKsEdQIaLCOQnc7q
	3QUxAs8w1nybA36n0WNtqKKqA9zyowbX9dWQn02u2USU9M9nlmlWn9Nt
X-Gm-Gg: AZuq6aJjmJdbF0qC/6E1hFCVe7nCvB6HtLDi33MwInRFwoqtQVpUE8Zt3Sk8zeIBpct
	b4XdXuGBhZ9PjhHxUDlOZAlMhm7wmV3BPUZhk0ZcEqHG/hJwUFkeSutso3RSoov6jPIT4hn0DJG
	nWdJ2azJ4Ms6awtPGeqY5pwW2nbBQcIK/s/dbYmhulL1LJ8P4QAAmemmk4Kk7lGBTEQ5VFmT8hP
	RQpPQfw/YAl0O1D84UkMYFm7hv6VAkmxVOavhB9dV4cFq5rXzAA6x4D7LjlzDfszn9NoMSVusEY
	j1zNXpmnUSN185LsYimN1yyg4ol9pLtAO3uiA0C4/2cazqmcrnJQozA00GZlIqvI3p5jWaD4Qy2
	ZhjzcZT0XrzHlgjYmHypQ83aJdFxouedzG0D0jin6Bjot7d2p3Dzi5vsGIo5TYVLLbfD5d6ZpEE
	jb/6LoX8lMOzMHqTswy+sbxpnOS3tNoxNEZIDABfuf5kazmbvCQa/Xw3R1ZGIzqlKF9SWKp8qAo
	xl5EB9OdlkCMm8PvnGnm2vIFUUv
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr128369245e9.33.1771139017090;
        Sat, 14 Feb 2026 23:03:37 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-79-213.dynamic.telemach.net. [178.79.79.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm168216905e9.2.2026.02.14.23.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 23:03:36 -0800 (PST)
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
Date: Sat, 14 Feb 2026 21:55:00 +0100
Message-ID: <5047516.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-8-jernej.skrabec@gmail.com>
 <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_230339_934622_BEAB3932 
X-CRM114-Status: GOOD (  24.84  )
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

Hi Chen-Yu,

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

Looking a bit more into this, this requires a bit more work. For example, c=
locks
can be provided by tcon-top, which are created only in bind callback. Basic=
ally,
whole sun4i-drm driver depends on devm_* calls in bind functions. This would
need careful analysis of all driver calls and then refactoring drivers one =
by one.=20

IMO tcon-top driver needs to be refactored to plain clock driver without co=
mponent
bind/unbind functions. Although this may cause slightly higher power consum=
ption
if device doesn't have display but driver is loaded nevertheless.

What do you think?

Best regards,
Jernej




