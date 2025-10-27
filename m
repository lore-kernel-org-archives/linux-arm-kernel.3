Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BCECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBt+IECqNVtAsegMkIX7fm58vbKYt/6Urfpjeenw3Ow=; b=aa9L+cZb5Q35l+
	R6/ZVxdwPxDrMkNKiWcQ5SU/yjNCmREHaiAQaDee1PxBOE0Z+rLw0WpaOLhmC2GMvcqs/hLT5iiKA
	ztt1tLYIJYAfLmlOS1SSoJrnm8Se8mkKp7Y9PNTTxbxLowAWvgY9ZhL9BUibgMqxcLMrp+O7X37zV
	WYjP4V0MZ1TvvKJ+/ZwOAC0tTL9lmhdOUvRF+IPU8JTFf5jdnw53a6bqjht6tbo30fwlI/S/yWLh4
	ThAgx7YD05ISutxTKzjKEgTlCEvzWOWaspW2iQB5QHsDL9ENyos6Mk2Eu9jkGu33KXF9CHU83EQA/
	FtY/iPYNN7y0vOrzhlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPiM-0000000EHKo-0pnN;
	Mon, 27 Oct 2025 16:04:58 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPiJ-0000000EHJy-2Zpa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:04:56 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378ccb8f84aso51837131fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581093; x=1762185893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBt+IECqNVtAsegMkIX7fm58vbKYt/6Urfpjeenw3Ow=;
        b=FK+69zEnSrx5Z9ev7m8fRFcIMBvdqH/HvEyg637eoo+aZ9u3SFmw6Ukxv2kmmhbxjF
         zIhBG2AqzwzYX4t0nOD7cUTisyNF2WPKf526ihOIR9uxgjl1ue0yyeJu9Bx3tbfghkcj
         SYoLpyPQIrndVmPgOHkaMofv9z68iBF28RYYRpmP+PyCAiKxTTr2XwGa/4oJ/gbOhzcx
         qUAzrKY9cpE27+Vi/CgFOAzxWY1VSJYW/JIsxNTpc/WGoHOKnc8LurYlBkahXmep3Smx
         6W2Lu7r1kwlzHQh1RTa1soJEIaOEcCUgkNLu7GCav/ITd1LBlcJpRbFwL0I0yfBcf4qA
         Og1w==
X-Forwarded-Encrypted: i=1; AJvYcCV2BmlwKJxNIo6Qlb20eOcHhjkEL7QrFrQxkMqFP840/1VLmqEOrkl45n5TO+KmStj7rwTFtZK61yG5GCvT45Jj@lists.infradead.org
X-Gm-Message-State: AOJu0YybcxV02YYmlm9u/VpRVKGWWnGlc5gluJq7c4VFNsDMjXZLYspg
	6Z9OgPMHLJmQEgg+kDLdRNGc8Cksmqlrr5L2jnW5arWl2UpiLIUkPqMLXmeWToGBV20=
X-Gm-Gg: ASbGncvqohyM5ylWex6fE4uNDriDsHMzkZhBkHCmHNMqpxNixFRVsCoNE8tl7ja1kwO
	dk1vsd68SajapmaXjXlYH0NK5iWRQSBVgZN8/c28D3yU9V/5wxoER9extofH/d1vZFovqktMxc6
	yvkC2nmxmwEJpXyABvQSpRAg/WKfF69K5hnWBX/EmaJLib5TUXbBEFHNaHnyMs4G0k2zPyA2hx1
	sQmfPOok57ZroWqbRhk8ORh7r4YGqcWY1m4AG8k9tw/MMLMGtt4bZUGYYBW3FHWzuJA49lvaQvX
	rf+2kdaw9bmQHMyjBd+JBnZZz6jP7GuNTGUiT2bjEblV/5PnSUDbw0tGPbCC+ORpZF9hIjCpWrd
	D4fvTaEXAF+WzJS2nr4//iM0QrLzXT09tu9vkjJTb6SZqbD6KDtVmDwShM7LOtW8E8NrWz18tdM
	iraxt0/rfs8p+mqhZ9F/MV358m9XtpI/owZX1bCJ5K+x8=
X-Google-Smtp-Source: AGHT+IEKtxfIZ42II/PJp0x4aSJbNtNThjwH9BhLvLJcaIuMmyfY/M09OCPLgD4PuA0oug0nuRN27g==
X-Received: by 2002:a2e:a98d:0:b0:36e:f1ae:d4bc with SMTP id 38308e7fff4ca-379076da90dmr580451fa.14.1761581092900;
        Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09d2e5sm20821141fa.17.2025.10.27.09.04.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378cfbf83f2so53504301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMii/e54fngg5RaeDM0t74I9HjDUwNdcYDuKgyfU5ozn3fczKQ8vgIwuqXzbAHrE4/ZP3Oh3AHzrkHF1EHJhFF@lists.infradead.org
X-Received: by 2002:a05:651c:222c:b0:378:d499:d34d with SMTP id
 38308e7fff4ca-379076d8741mr539671fa.15.1761581092345; Mon, 27 Oct 2025
 09:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-9-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-9-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:04:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm99AcS6yMWuT9w2DAubuMwkVTQftsOHcXhHkfhxsBt-ffhIxUo7tu2w44
Message-ID: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_090455_704078_AB3186E4 
X-CRM114-Status: GOOD (  19.16  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> It turns out that none of the UI channel registers were meant to be
> read. Mostly it works fine but sometimes it returns incorrect values.
>
> Rework UI layer code to write all registers in one go to avoid reads.
>
> This rework will also allow proper code separation.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
>  1 file changed, 16 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 12c83c54f9bc..8634d2ee613a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -25,25 +25,27 @@
>  #include "sun8i_ui_scaler.h"
>  #include "sun8i_vi_scaler.h"
>
> -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int c=
hannel,
> -                                       int overlay, struct drm_plane *pl=
ane)
> +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
> +                                            int channel, int overlay,
> +                                            struct drm_plane *plane)
>  {
> -       u32 mask, val, ch_base;
> +       struct drm_plane_state *state =3D plane->state;
> +       const struct drm_format_info *fmt;
> +       u32 val, ch_base, hw_fmt;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
> +       fmt =3D state->fb->format;
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
> -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> -
> -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha =
>> 8);
> -
> -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
> +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?

Changing "plane->state" to "state" made the diff somewhat harder to read.

>                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
>                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +       val |=3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> +       val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
>
> -       regmap_update_bits(mixer->engine.regs,
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
> -                          mask, val);
> +       regmap_write(mixer->engine.regs,
> +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), va=
l);
>  }
>
>  static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int c=
hannel,
> @@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i=
_mixer *mixer, int channel,
>         }
>  }
>
> -static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int=
 channel,
> -                                         int overlay, struct drm_plane *=
plane)
> -{
> -       struct drm_plane_state *state =3D plane->state;
> -       const struct drm_format_info *fmt;
> -       u32 val, ch_base, hw_fmt;
> -
> -       ch_base =3D sun8i_channel_base(mixer, channel);
> -
> -       fmt =3D state->fb->format;
> -       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -
> -       val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> -       regmap_update_bits(mixer->engine.regs,
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val=
);
> -}
> -
>  static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int =
channel,
>                                          int overlay, struct drm_plane *p=
lane)
>  {
> @@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm=
_plane *plane,
>         if (!new_state->crtc || !new_state->visible)
>                 return;
>
> +       sun8i_ui_layer_update_attributes(mixer, layer->channel,
> +                                        layer->overlay, plane);
>         sun8i_ui_layer_update_coord(mixer, layer->channel,
>                                     layer->overlay, plane);
> -       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> -                                   layer->overlay, plane);
> -       sun8i_ui_layer_update_formats(mixer, layer->channel,
> -                                     layer->overlay, plane);
>         sun8i_ui_layer_update_buffer(mixer, layer->channel,
>                                      layer->overlay, plane);
>  }
> --
> 2.51.0
>
>

