Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716AFE7AD4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 19:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuBMYgUvpujZFFxEebcmJA0Qddg42Ta0WZ5j0EnaKFA=; b=vkoNVbwktS9DlKAtz4+3srQD8Q
	kVpZ1IIBk31yr36F9IJYf6U0FYmDKSyxUKyRU6lpa3k2r8qtweVgwW+zf4Fx7oKL58PKkg0dQf/AS
	rd1uf5czvC3BqZGtVx8cBOOpc1rpueFdsXiQaz4wXyiGqcDaPMOC0xff+JhyU64C0ah8XfNxZRy/l
	Umm+sS2vOSju2pA+W1KhwAISqhr2v9YWYJ3zSwO5GMNsU88L6nwRJwm5lI8RxxE5n2biB7+lO0iQX
	iI5Z2Ew6VQ+MPvC6Tv4WHqHbkMvSkvbM8WSGinKm+bNaF6nXM6uXK1Sj7YFcuO1Lz7oBulxdV2NB1
	NkXvVG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqpb-00000000dJc-3Hm3;
	Thu, 25 Dec 2025 19:17:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqpZ-00000000dJD-0f9g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 19:17:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b7633027cb2so1225816166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766690219; x=1767295019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuBMYgUvpujZFFxEebcmJA0Qddg42Ta0WZ5j0EnaKFA=;
        b=ExeN8pfjnIF4Mwi60hCKlGaVh6cnO/JTjUWBjEpxglbr0kq6Mp9lmOzXh9hpfXXGx1
         BuiCA+V2ynQ6hvIitzrf5n8byhrWoWoRSkreoqNvmJmdxW1n8dXDWXZvpAX8uirL+/me
         CnZqWGrLyVkNlHSAlxSP/PE4KyTsKH0kKYHQigtJhN5+vmlNrlM9Tz0wn30E9S6en5mE
         DUOvJS3pnnPC2q1b3/tLs1u1Bo3EHRXb4azxzkQFalZmlHy7mCeApcI5YXsHFpHHX2X6
         mSjGp6FrvYQKBU7jqDkidGCBQC+cR8IFujplr0zCWat3l2sfRAeIueZRnKrvpwn0mClF
         Xdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766690219; x=1767295019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YuBMYgUvpujZFFxEebcmJA0Qddg42Ta0WZ5j0EnaKFA=;
        b=eA6hUgyWO2/SkcSlffjCVxN81LyRa/uhgMujqcRed4XPPKZqNYXIqsoZEdH7lvnlOE
         NHeNoPaNt+lJyle2QCKOTq1bhyARb0Y6w/j6jjnzo4S0X8iRZ84AcbJPjLEvul0vBzZl
         boChS4dFyBRPAkql2iAnb0V87/rsngHeStmGID8ppC5piFFHNAoz9tjY3O94AxEMYdJv
         EW53lW5qXcW7eBLDvKyJsFtJljlx1z9H/Wglr3QVLDOtDG9piWP0Ok8drTfsyAYfkI+c
         YBbjAwBXlCUocnlwnicIwr5mxECknZCT/zLt5P8eb1t146Ol1+oWJ2Qoj4XbE1xXyaDQ
         V9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWaOUh6uwbhzMlJU25jLgijDMZ4HJeSmXiQB7a4cLS0rA8I64/c+V2Si2dCON3LIvR7zVFMLZ4LRVEdKU81rVNO@lists.infradead.org
X-Gm-Message-State: AOJu0Yza7zicE5Kin3/1QBQvUB15imvcDwGctr/KhaH8Yx0ylVsBYhYJ
	3MHYu9oWMZ2mRHj20VEzGjyvTD5h6C0qKMftaksi9mnx+Skls83pw7xn
X-Gm-Gg: AY/fxX5cqo6jvBMgRAZZlk7kHKgDy1QxJKWhDS0rkojBgqI+1MjzXRmioI0XE0FKi4b
	Guvr7lqiStPW9QOu2/NRBLeBMwzttIk7UNLhrwVzk8u6/E7fZiNFAmk76Z5FwY1965+z/NbBNIK
	4mZ9+hkR+U52nxIDmVUhXgGye5OWbCXq/f4OaYSVdWjKTvq+e/CXTvssauCSevE8ZcvARlHARUK
	13yxaHf6y7InUCu8ZliE3FAKsTDEgwf4HsaNzzRFmjBGETIhhqKhUn2OwAVLhO9CvNE8jpqIK6W
	LORJLuUo96e3u27+sFseuThfDv6EnbiTVc+dkPmU1LzkDVN1yMpnAOBUHj2hUjCpQ7yPgFZ/CmI
	CAs9BIkJNzocqqi8za6EyWgPp9PTpVCeJn+vk1OtkHRIREdyJQzVD2kRy+qArbPLZps/9fGGHQl
	ZjZ57zFFE1orRk9as9KsurUJ6quE7CgRhI
X-Google-Smtp-Source: AGHT+IFvbDFb5iMsxvcHe5uwcc5xP1qt+TI1oeS+emR1kX9GA2B625QCLopqwLQJpyQpTnQVovm73A==
X-Received: by 2002:a17:907:97c7:b0:b79:d24b:474d with SMTP id a640c23a62f3a-b8036f56569mr2366332866b.16.1766690218514;
        Thu, 25 Dec 2025 11:16:58 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0deesm2155826266b.37.2025.12.25.11.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:16:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Thu, 25 Dec 2025 20:16:56 +0100
Message-ID: <2040104.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com>
 <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_111701_376161_6F689B1D 
X-CRM114-Status: GOOD (  43.96  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 10:37:06 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > <jernej.skrabec@gmail.com> wrote:
> > >
> > > This driver serves just as planes sharing manager, needed for Display
> > > Engine 3.3 and newer.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> > >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> > >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> > >  4 files changed, 257 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kc=
onfig
> > > index b56ba00aabca..946dd7606094 100644
> > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> > >           TCON TOP is responsible for configuring display pipeline for
> > >           HDMI, TVE and LCD.
> > >
> > > +config DRM_SUN50I_PLANES
> > > +       tristate
> > > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > > +       help
> > > +         Chose this option if you have an Allwinner Soc with the
> > > +         Display Engine 3.3 or newer. Planes are shared resource
> > > +         between multiple mixers.
> > > +
> > >  endif
> > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/M=
akefile
> > > index bad7497a0d11..03f002abef15 100644
> > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_dsi.o
> > >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> > >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> > >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
> >
> > I don't think you can have this as a separate module:
> >
> > a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_one()
> >    from the sun8i-mixer module, and neither of them are exported symbol=
s.
> >
> > b. You export sun50i_planes_setup() for sun8i-mixer to call, which ends
> >    up becoming a circular dependency.
> >
> > The easiest solution would be to just fold this into the sun8i-mixer mo=
dule.

I mimicked tcon-top module, but yeah, it's much less of a hassle to fold it
into sun8i-mixer.

> >
> >
> > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/=
sun4i/sun50i_planes.c
> > > new file mode 100644
> > > index 000000000000..a99c01122990
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > > @@ -0,0 +1,205 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "sun50i_planes.h"
> > > +#include "sun8i_ui_layer.h"
> > > +#include "sun8i_vi_layer.h"
> > > +
> > > +static bool sun50i_planes_node_is_planes(struct device_node *node)
> > > +{
> > > +       return !!of_match_node(sun50i_planes_of_table, node);
> > > +}
> > > +
> > > +struct drm_plane **
> > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > +                   unsigned int mixer)
> > > +{
> > > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > > +       const struct sun50i_planes_quirks *quirks;
> > > +       struct drm_plane **drm_planes;
> > > +       const struct default_map *map;
> > > +       unsigned int i;
> > > +
> > > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > > +               dev_err(dev, "Device is not planes driver!\n");
> > > +               return NULL;
> > > +       }
> > > +
> > > +       if (!planes) {
> > > +               dev_err(dev, "Planes driver is not loaded yet!\n");
> > > +               return NULL;
> > > +       }
> > > +
> > > +       if (mixer > 1) {
> > > +               dev_err(dev, "Mixer index is too high!\n");
> > > +               return NULL;
> > > +       }
> > > +
> > > +       quirks =3D planes->quirks;
> > > +       map =3D &quirks->def_map[mixer];
> > > +
> > > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
> >
> > Just a note: it seems we are missing the sentinel in sun8i_layers_init(=
).

Why do you think so? Current mainline code has mixer->cfg->vi_num +
mixer->cfg->ui_num + 1.

> >
> > > +                                 sizeof(*drm_planes), GFP_KERNEL);
> > > +       if (!drm_planes)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       for (i =3D 0; i < map->num_ch; i++) {
> > > +               unsigned int phy_ch =3D map->map[i];
> > > +               struct sun8i_layer *layer;
> > > +               enum drm_plane_type type;
> > > +
> > > +               if ((i =3D=3D 0 && map->num_ch =3D=3D 1) || i =3D=3D =
1)
> > > +                       type =3D DRM_PLANE_TYPE_PRIMARY;
> > > +               else
> > > +                       type =3D DRM_PLANE_TYPE_OVERLAY;
> > > +
> > > +               if (phy_ch < UI_PLANE_OFFSET)
> > > +                       layer =3D sun8i_vi_layer_init_one(drm, type, =
planes->regs,
> > > +                                                       i, phy_ch, ma=
p->num_ch,
> > > +                                                       &quirks->cfg);
> > > +               else
> > > +                       layer =3D sun8i_ui_layer_init_one(drm, type, =
planes->regs,
> > > +                                                       i, phy_ch, ma=
p->num_ch,
> > > +                                                       &quirks->cfg);
> > > +
> > > +               if (IS_ERR(layer)) {
> > > +                       dev_err(drm->dev,
> > > +                               "Couldn't initialize DRM plane\n");
> > > +                       return ERR_CAST(layer);
> > > +               }
> > > +
> > > +               drm_planes[i] =3D &layer->plane;
> > > +       }
> > > +
> > > +       return drm_planes;
> > > +}
> > > +EXPORT_SYMBOL(sun50i_planes_setup);
> > > +
> > > +static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
> > > +{
> > > +       const struct sun50i_planes_quirks *quirks =3D planes->quirks;
> > > +       unsigned int i, j;
> > > +       u32 mapping;
> > > +
> > > +       mapping =3D 0;
> > > +       for (j =3D 0; j < MAX_DISP; j++)
> > > +               for (i =3D 0; i < quirks->def_map[j].num_ch; i++) {
> > > +                       unsigned int ch =3D quirks->def_map[j].map[i];
> > > +
> > > +                       if (ch < UI_PLANE_OFFSET)
> > > +                               mapping |=3D j << (ch * 2);
> > > +                       else
> > > +                               mapping |=3D j << ((ch - UI_PLANE_OFF=
SET) * 2 + 16);
> > > +               }
> > > +       regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG,=
 mapping);
> > > +
> > > +       for (j =3D 0; j < MAX_DISP; j++) {
> > > +               mapping =3D 0;
> > > +               for (i =3D 0; i < quirks->def_map[j].num_ch; i++) {
> > > +                       unsigned int ch =3D quirks->def_map[j].map[i];
> > > +
> > > +                       if (ch >=3D UI_PLANE_OFFSET)
> > > +                               ch +=3D 2;
> > > +
> > > +                       mapping |=3D ch << (i * 4);
> > > +               }
> > > +               regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN=
_MUX_REG + j * 4, mapping);
> > > +       }
> > > +}
> > > +
> > > +static const struct regmap_config sun50i_planes_regmap_config =3D {
> > > +       .name           =3D "planes",
> > > +       .reg_bits       =3D 32,
> > > +       .val_bits       =3D 32,
> > > +       .reg_stride     =3D 4,
> > > +       .max_register   =3D 0x17fffc,
> > > +};
> > > +
> > > +static int sun50i_planes_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct sun50i_planes *planes;
> > > +       void __iomem *regs;
> > > +
> > > +       planes =3D devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
> > > +       if (!planes)
> > > +               return -ENOMEM;
> > > +
> > > +       planes->quirks =3D of_device_get_match_data(&pdev->dev);
> > > +       if (!planes->quirks)
> > > +               return dev_err_probe(dev, -EINVAL, "Unable to get qui=
rks\n");
> > > +
> > > +       planes->mapping =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> > > +                                                         "allwinner,=
plane-mapping");
> > > +       if (IS_ERR(planes->mapping))
> > > +               return dev_err_probe(dev, PTR_ERR(planes->mapping),
> > > +                                    "Unable to get mapping\n");
> > > +
> > > +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(regs))
> > > +               return PTR_ERR(regs);
> > > +
> > > +       planes->regs =3D devm_regmap_init_mmio(dev, regs, &sun50i_pla=
nes_regmap_config);
> > > +       if (IS_ERR(planes->regs))
> > > +               return PTR_ERR(planes->regs);
> > > +
> > > +       dev_set_drvdata(dev, planes);
> > > +
> > > +       sun50i_planes_init_mapping(planes);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct sun50i_planes_quirks sun50i_h616_planes_quirks =
=3D {
> > > +       .def_map =3D {
> > > +               {
> > > +                       .map =3D {0, 6, 7},
> > > +                       .num_ch =3D 3,
> > > +               },
> > > +               {
> > > +                       .map =3D {1, 2, 8},
> > > +                       .num_ch =3D 3,
> > > +               },
> > > +       },
> > > +       .cfg =3D {
> > > +               .de_type        =3D SUN8I_MIXER_DE33,
> > > +               /*
> > > +                * TODO: All planes support scaling, but driver needs
> > > +                * improvements to properly support it.
> > > +                */
> > > +               .scaler_mask    =3D 0,
> > > +               .scanline_yuv   =3D 4096,
> > > +       },
> > > +};
> > > +
> > > +/* sun4i_drv uses this list to check if a device node is a plane */
>=20
> I didn't see any usage of this in patch 7. Is this part of another
> series?
>=20
> Maybe just export sun50i_planes_node_is_planes() instead?

It's not needed if driver is folder into sun8i-mixer module. Looks like this
is remnant of tcon-top concept...

>=20
> > > +const struct of_device_id sun50i_planes_of_table[] =3D {
> > > +       {
> > > +               .compatible =3D "allwinner,sun50i-h616-de33-planes",
> > > +               .data =3D &sun50i_h616_planes_quirks
> > > +       },
> > > +       { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
> > > +EXPORT_SYMBOL(sun50i_planes_of_table);
> > > +
> > > +static struct platform_driver sun50i_planes_platform_driver =3D {
> > > +       .probe          =3D sun50i_planes_probe,
> > > +       .driver         =3D {
> > > +               .name           =3D "sun50i-planes",
> > > +               .of_match_table =3D sun50i_planes_of_table,
> > > +       },
> > > +};
> > > +module_platform_driver(sun50i_planes_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
> > > +MODULE_DESCRIPTION("Allwinner DE33 planes driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/=
sun4i/sun50i_planes.h
> > > new file mode 100644
> > > index 000000000000..446feaeb03fc
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
> > > @@ -0,0 +1,43 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > > +
> > > +#ifndef _SUN50I_PLANES_H_
> > > +#define _SUN50I_PLANES_H_
> > > +
> > > +#include <drm/drm_device.h>
> > > +#include <linux/regmap.h>
> >
> > I think you could move these two to the .c file, and just use forward
> > declarations here.

Ok.

Best regards,
Jernej

> >
> > The rest looks OK.
> >
> >
> > > +
> > > +#include "sun8i_mixer.h"
> > > +
> > > +/* mapping registers, located in clock register space */
> > > +#define SUNXI_DE33_DE_CHN2CORE_MUX_REG 0x24
> > > +#define SUNXI_DE33_DE_PORT02CHN_MUX_REG        0x28
> > > +#define SUNXI_DE33_DE_PORT12CHN_MUX_REG        0x2c
> > > +
> > > +#define MAX_DISP       2
> > > +#define MAX_CHANNELS   8
> > > +#define UI_PLANE_OFFSET        6
> > > +
> > > +struct default_map {
> > > +       unsigned int map[MAX_CHANNELS];
> > > +       unsigned int num_ch;
> > > +};
> > > +
> > > +struct sun50i_planes_quirks {
> > > +       struct default_map      def_map[MAX_DISP];
> > > +       struct sun8i_layer_cfg  cfg;
> > > +};
> > > +
> > > +struct sun50i_planes {
> > > +       struct regmap                           *regs;
> > > +       struct regmap                           *mapping;
> > > +       const struct sun50i_planes_quirks       *quirks;
> > > +};
> > > +
> > > +extern const struct of_device_id sun50i_planes_of_table[];
> > > +
> > > +struct drm_plane **
> > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > +                   unsigned int mixer);
> > > +
> > > +#endif /* _SUN50I_PLANES_H_ */
> > > --
> > > 2.51.2
> > >
> > >
>=20





