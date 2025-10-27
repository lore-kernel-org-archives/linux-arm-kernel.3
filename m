Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B34CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=; b=xcSQVZGmlbqu0Kt+40LB38e7HQ
	0pX3usK43qyhuggBUFaLs5T6/Yaz9Agyjx7GzdGSY1S/ye1hnV0iByPUa7Nc/NppHEzGNhrS91muA
	33yCH/8S/tA7yUaZCYAcHgHmLHW8dl2+u7m7E5JOVat81dPiUkAABUujJZ1taJmwZFx4mRXw4cqOl
	jim7RtHuVrRqKirGeNzNC4hgbmcOPAS9PF78O4PbHvfWMYP+DR8O2qbj9CO5FWedCmjVpNf6KgsTf
	g/GqPyxyjCubCVcpEXncuJtJk21Ir2KbGaWbQR2fIMJM50cT5ntIlThcCJnjZNgild8eBdEo9Nvw1
	f0ZKWOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRie-0000000EWjc-2RXH;
	Mon, 27 Oct 2025 18:13:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRic-0000000EWit-2TjW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:13:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47117f92e32so44674485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588801; x=1762193601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=;
        b=D5Agq0PurZV2ZivtJbiXcPDKK3X9ZDToZlD4nmlZi3Q0cSTDWDXLdSqfX5FNpxSxeh
         ZHRnCfu4s6B83Oxam+INSOz5mLQvew72rlTFi0CmD7j7y0hvEplADo5BiE39yvqrTCBW
         tgpaJvYz0toh71HA/0TZE1UTcuNZ1oQkGUjVoVWKmwfjdf0SaSD1FFj/YFAb7p5ycnDY
         T09sdFsoCSCiGEPu0YSRe4fRpT7U0E+z8/rohrwRtg9wzAK7FLQiY/6XO3p/9buiD9qg
         DPG94IM7Ih5AweZEGNts/eoIQTJHxto7baJ15eWkCp54WXYMlJpYS50jsmnspGgPNVUN
         mo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588801; x=1762193601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=;
        b=tPiFT7eP5guS0jNmBtpKG+xDgzxd1Zu1WY4/iZuDTJ7ayDE/KTygjwRSbR43htGTCB
         psaMiUPVH1v9ibm11HJQ/bUTm8sSpdjYb0jCt4q92nivL/5jlViGYQMhE5eirE0ucB4K
         kVkv7G4bXDcEcqdROXiUQ4PfceaBIwBQ1xRi5amIcPAolt3H5qo/MaRSyfgM8iMZOD9n
         RiRDWsAiJmRPP7zWkHRYOFA+01WA+AEFJymWavnafAakr6QifKxiUxnVWm5qHUmNeydi
         KNKq0/BPgYxPsgcjcMP4AclVD36LH15ys63qWpc6h4uGTuIE1NDwCsvft2hnmBDp2hzj
         hrGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhOasmd59xnTh1k02aoIYRT3lUPc4S0k8UhBQk8BA3Vdh6+EtJlBvasFBUlUs2FtG4l4WN45jRp0bLJBwFc0/j@lists.infradead.org
X-Gm-Message-State: AOJu0YyZmqL0j2XwZqoYngV4EHIMLbmNjQzvzvkYjq3V3Qhy9HnN+QIh
	SC6qXR6LTf+C11h2Lyy5mt2Drv7a+NB7gTOQhqqsYNkMa40ZrFX+WTqd
X-Gm-Gg: ASbGncutjd4yQcn0lA3g9lOM3EpOZSRCZm5eWxdjvex9IzjoyjPdDAb0KpH6+m1CNfb
	o5aR2xgHptCxelcw7xRVnRlNc/NUEaH0lYraFKzkLfeHgy7WIJaFDKRSmylmLyFbSvlK8HI/8cz
	+RwBMhI7EgiHYwFb09snenkBao5cMvMjtvITvv6gRNuzwgVUdrxv2iunYLsKIDSWXDw+XVPkJC0
	5vgPHqYSRF20EECiooPjFH91hM8MXF48f06C5bptgjn6Z4B90PcuAMeWSRAa5oHN0sOa+/NIRvZ
	hSD/u8TB35VqLwRpzMduTMBvT+zn2J46l6T4i4t/m2OfVVnhcecI47jQ2wXVo0CfhgKzF0UrTGE
	ZuXA4BOrG5PVZlc32FY3sqLY8Paj/7Ji6pxflRhpdMEbz0sa8P6nqeatD1I95wvHMrAY+uXqR6t
	SlorLSXFOmJXHdXvT5UpbKsm8EyNEOFFl1EMqT8CUL7SxzG4sHw/sdwnMUkTzUsZN3OB9qA3L39
	kPwBA==
X-Google-Smtp-Source: AGHT+IEqlnVwDpi13GnycHHx8DE0kjDHzXjgMTxar3Q9GtHCBjX6mOGesLa7ZV6EWb6wgPy30T7PJg==
X-Received: by 2002:a05:600c:6818:b0:475:de05:661f with SMTP id 5b1f17b1804b1-47717e67c68mr5088525e9.41.1761588800714;
        Mon, 27 Oct 2025 11:13:20 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4924e2sm149902535e9.8.2025.10.27.11.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:13:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Mon, 27 Oct 2025 19:13:19 +0100
Message-ID: <10742932.nUPlyArG6x@jernej-laptop>
In-Reply-To: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-9-jernej.skrabec@gmail.com>
 <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_111322_660705_A0825724 
X-CRM114-Status: GOOD (  20.99  )
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

Dne ponedeljek, 27. oktober 2025 ob 17:04:38 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > It turns out that none of the UI channel registers were meant to be
> > read. Mostly it works fine but sometimes it returns incorrect values.
> >
> > Rework UI layer code to write all registers in one go to avoid reads.
> >
> > This rework will also allow proper code separation.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
> >  1 file changed, 16 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_ui_layer.c
> > index 12c83c54f9bc..8634d2ee613a 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -25,25 +25,27 @@
> >  #include "sun8i_ui_scaler.h"
> >  #include "sun8i_vi_scaler.h"
> >
> > -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int=
 channel,
> > -                                       int overlay, struct drm_plane *=
plane)
> > +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
> > +                                            int channel, int overlay,
> > +                                            struct drm_plane *plane)
> >  {
> > -       u32 mask, val, ch_base;
> > +       struct drm_plane_state *state =3D plane->state;
> > +       const struct drm_format_info *fmt;
> > +       u32 val, ch_base, hw_fmt;
> >
> >         ch_base =3D sun8i_channel_base(mixer, channel);
> > +       fmt =3D state->fb->format;
> > +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> >
> > -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > -
> > -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alph=
a >> 8);
> > -
> > -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> > +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
> > +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
>=20
> Changing "plane->state" to "state" made the diff somewhat harder to read.

Do you prefer that I change that in next revision?

Best regards,
Jernej

>=20
> >                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> >                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +       val |=3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> > +       val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
> >
> > -       regmap_update_bits(mixer->engine.regs,
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, over=
lay),
> > -                          mask, val);
> > +       regmap_write(mixer->engine.regs,
> > +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), =
val);
> >  }
> >
> >  static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int=
 channel,
> > @@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun=
8i_mixer *mixer, int channel,
> >         }
> >  }
> >
> > -static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, i=
nt channel,
> > -                                         int overlay, struct drm_plane=
 *plane)
> > -{
> > -       struct drm_plane_state *state =3D plane->state;
> > -       const struct drm_format_info *fmt;
> > -       u32 val, ch_base, hw_fmt;
> > -
> > -       ch_base =3D sun8i_channel_base(mixer, channel);
> > -
> > -       fmt =3D state->fb->format;
> > -       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> > -
> > -       val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> > -       regmap_update_bits(mixer->engine.regs,
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, over=
lay),
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, v=
al);
> > -}
> > -
> >  static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, in=
t channel,
> >                                          int overlay, struct drm_plane =
*plane)
> >  {
> > @@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct d=
rm_plane *plane,
> >         if (!new_state->crtc || !new_state->visible)
> >                 return;
> >
> > +       sun8i_ui_layer_update_attributes(mixer, layer->channel,
> > +                                        layer->overlay, plane);
> >         sun8i_ui_layer_update_coord(mixer, layer->channel,
> >                                     layer->overlay, plane);
> > -       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> > -                                   layer->overlay, plane);
> > -       sun8i_ui_layer_update_formats(mixer, layer->channel,
> > -                                     layer->overlay, plane);
> >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >  }
> > --
> > 2.51.0
> >
> >
>=20





