Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30004E7AD67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 19:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=; b=3FUWenxZATHw+PyxQBXrWxMoxL
	s6JFvmSeFpPIvYZ/BkbJvUpMxuNMkEFX3N9RupHAmAWDrBKlQTOIouloRhSgGA3iinNQhnHuJrSYR
	fPITWvLdtWXudYBvUXaKwMxJ1ozm9o2PU1/H9cqFrJp7YwZutXT7a3ghmvVhoAsqMD5Np21XUkKBJ
	TdU18KZNPKNkS4QhB27Y7SkT123NliPD6pY2fCKsYcL+qHMxb5mWMKcT+DCbV3/wpLlIQa6OS3Lw+
	78x/ABqmAVc0SFMQ9+UoMPDbcEFcO7paRDmQ3pldQE3Yw026jns6JLvS6TH7TwMXqZcuBdrQcyHUz
	4A515Adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYr6M-00000000dzd-1DjQ;
	Thu, 25 Dec 2025 19:34:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYr6J-00000000dzC-2y11
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 19:34:21 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso11272923a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766691258; x=1767296058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=;
        b=PlR4IIHnd7rsmZ53I0vDsMeUKb1nXOz5Gplq2KUYBUycq9GXGNqT8I57SHKkqq2wh1
         PVBQOlYyrWSy6vBf8T3QZChuN1zvbTAl6VqYB4RjEwLFlnq9stuupWjqWQBUCHlwQMan
         3nX/A7nZTZvbmdNwxhDYAbbpftIksVh2iZ/Bvnk9qdo3+5jt/NsM2FdC9us76n7DiwWh
         5BEYS1WfWT7jpJDo8NBXrlvZpMcXKx4onydMDgioGeQwVoUSIb61t2j/qij0xjNTQ5c8
         +nylNTq964RsvaxAl+5MoKjhc3024ARaEu5w6WMBSO/74PeTz0tholioroUhuc9pg57R
         K1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766691258; x=1767296058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=;
        b=E509LZgKn4RHxNycwPVnlq6y20ydAdES2zUxhvth4g2KZ3/fIhlEnetlGUBR6OXHO7
         zh7MTXshamCsUKY5qW7q30y9+2pimLYmsGEYEVaD8RGw/6Eh+fKoDNSWPXvnO1ZJQ+/W
         2f/E13sGRCChF7h31yf0eSr1tKR0pjlw6d5kaNEN0fu5HUZyT9ZkhNGBhRE3CQp6XES5
         a5YNstT1J6HOjzL+OywkWJyLYX1Ka00KOOmzlo6NQSB/XvOUHIrbTCzDrqq1oad5AsnS
         E37Cs1wYzL8mv3XNId9WdArbwwQ9Ks3G3CCumZrSGhicCBdVSlQZv4vC5/Wk/umAi3lt
         N9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdFBD3V9pPQc1XBnSTAqCYkCDXyG5jbYok1BSilN92GAeWUrWkJJFW5sNeGVSzAc1yCjgZRzWR0fCVBzyssXSr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+rjwINI1hoLeJuHRwRpRfv2Um7En2R11th/TM68SR28H/d/it
	Tb+M+nDTKcQSmgcIb4vYSUJkKTA9wVpwFzOlXqd3F2XSDRdIGu74Ipdi
X-Gm-Gg: AY/fxX7PRZq3kB0mrHyd1TqZCz97cXCi1yA4Q8ME2bfw53Nrs9Zs46ZIXvyMH9CchwM
	fvWJpN62cp8cnPK5V88t7e8EttgBIylkxT6rl/TVSnvt7HvdQMoSQa3lZbliVu3RyTXDTAq/kvn
	IJae3dOYPtkaZcJElWw1n3lTq6n/ZJXZ5Q7CuDRSmz9RhrPbYQ2BBmd4OeTE3bYRrgqytV0Utw3
	nkAO/mKjIezqkgcL/eKIYoTpxEhMZA9+xWS5/1ewWfCxEMIo9r82TPraulHqCQNnbpjAeXaMcSt
	v80MKnC+FWjEx/fzMo7ktTg8Dh4lYWNB4vxV6oVL6h0btxS5AQE4nvcAn+1+LYPwGpMxkJfoAfx
	//FRcrIs+9E3nzhHvauoZt7orWa3KaYAz+Eey4nK01oh2cW5tmt2FvnIRQ9rpwwAGWb7bgtTYJ9
	RmJzODlPLJ8STk1Z7NJGEoATlLIN1O0R9k
X-Google-Smtp-Source: AGHT+IGvO3IMjEj5neK9YLe7p0o8Hu6EpqYO5l2iHCHivnyYHwPQvp96m6na5gEhouJ/SSYvvXULIw==
X-Received: by 2002:a05:6402:42c4:b0:63c:eb6:65e8 with SMTP id 4fb4d7f45d1cf-64b8edb753bmr20691588a12.30.1766691257505;
        Thu, 25 Dec 2025 11:34:17 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b912534f2sm20604568a12.15.2025.12.25.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:34:16 -0800 (PST)
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
Date: Thu, 25 Dec 2025 20:34:14 +0100
Message-ID: <3333337.5fSG56mABF@jernej-laptop>
In-Reply-To: <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <2040104.PYKUYFuaPT@jernej-laptop>
 <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_113419_813749_BAB7EDBB 
X-CRM114-Status: GOOD (  34.09  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 20:30:23 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Fri, Dec 26, 2025 at 3:17=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne =C4=8Detrtek, 25. december 2025 ob 10:37:06 Srednjeevropski standar=
dni =C4=8Das je Chen-Yu Tsai napisal(a):
> > > On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org=
> wrote:
> > > >
> > > > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > > > <jernej.skrabec@gmail.com> wrote:
> > > > >
> > > > > This driver serves just as planes sharing manager, needed for Dis=
play
> > > > > Engine 3.3 and newer.
> > > > >
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> > > > >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> > > > >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> > > > >  4 files changed, 257 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4=
i/Kconfig
> > > > > index b56ba00aabca..946dd7606094 100644
> > > > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > > > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> > > > >           TCON TOP is responsible for configuring display pipelin=
e for
> > > > >           HDMI, TVE and LCD.
> > > > >
> > > > > +config DRM_SUN50I_PLANES
> > > > > +       tristate
> > > > > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > > > > +       help
> > > > > +         Chose this option if you have an Allwinner Soc with the
> > > > > +         Display Engine 3.3 or newer. Planes are shared resource
> > > > > +         between multiple mixers.
> > > > > +
> > > > >  endif
> > > > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun=
4i/Makefile
> > > > > index bad7497a0d11..03f002abef15 100644
> > > > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > > > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_d=
si.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > > > > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
> > > >
> > > > I don't think you can have this as a separate module:
> > > >
> > > > a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_=
one()
> > > >    from the sun8i-mixer module, and neither of them are exported sy=
mbols.
> > > >
> > > > b. You export sun50i_planes_setup() for sun8i-mixer to call, which =
ends
> > > >    up becoming a circular dependency.
> > > >
> > > > The easiest solution would be to just fold this into the sun8i-mixe=
r module.
> >
> > I mimicked tcon-top module, but yeah, it's much less of a hassle to fol=
d it
> > into sun8i-mixer.
> >
> > > >
> > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/=
drm/sun4i/sun50i_planes.c
> > > > > new file mode 100644
> > > > > index 000000000000..a99c01122990
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > > @@ -0,0 +1,205 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> =
*/
> > > > > +
> > > > > +#include <linux/device.h>
> > > > > +#include <linux/io.h>
> > > > > +#include <linux/mfd/syscon.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_graph.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +
> > > > > +#include "sun50i_planes.h"
> > > > > +#include "sun8i_ui_layer.h"
> > > > > +#include "sun8i_vi_layer.h"
> > > > > +
> > > > > +static bool sun50i_planes_node_is_planes(struct device_node *nod=
e)
> > > > > +{
> > > > > +       return !!of_match_node(sun50i_planes_of_table, node);
> > > > > +}
> > > > > +
> > > > > +struct drm_plane **
> > > > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > > > +                   unsigned int mixer)
> > > > > +{
> > > > > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > > > > +       const struct sun50i_planes_quirks *quirks;
> > > > > +       struct drm_plane **drm_planes;
> > > > > +       const struct default_map *map;
> > > > > +       unsigned int i;
> > > > > +
> > > > > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > > > > +               dev_err(dev, "Device is not planes driver!\n");
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       if (!planes) {
> > > > > +               dev_err(dev, "Planes driver is not loaded yet!\n"=
);
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       if (mixer > 1) {
> > > > > +               dev_err(dev, "Mixer index is too high!\n");
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       quirks =3D planes->quirks;
> > > > > +       map =3D &quirks->def_map[mixer];
> > > > > +
> > > > > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
> > > >
> > > > Just a note: it seems we are missing the sentinel in sun8i_layers_i=
nit().
> >
> > Why do you think so? Current mainline code has mixer->cfg->vi_num +
> > mixer->cfg->ui_num + 1.
>=20
> I believe this was changed in your previous cleanups:
>=20
> https://lore.kernel.org/all/20251104180942.61538-16-jernej.skrabec@gmail.=
com/

Ah, true. I'll send fix for -rc soon.

Best regards,
Jernej




