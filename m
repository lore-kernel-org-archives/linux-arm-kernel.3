Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA7DD58D61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4agveOwge0PFPBakCbLt+oYuwIz3qhwiYZMG0RcOCo=; b=1F/6ZeE/oKvCKC
	gdsTr8q2e9qqbb6itx2AUaIvvGaZHV/OzRgG5D5HRgtqU4upcdYc24CyK7L0G+HfUEJFYKVkzyEV+
	cC+eTsmDRNtsP+7j36qcyVO3gbsqX2xG/lvoJY8xbmt67/p/58d3yDHWbHWTuNyjNtk5xP2T23H3a
	TCyLB4Ji+9bBL5B/ILaRXURk+oR8+xuV44eYxRUFNTzxkS+AwMCH0AwAidRQb1LwwT1YyL+tNsG1p
	BF4PB/HtU94dw+jMWM9NAQg99xaJst+da0YYVrEYEGGXPUQFFz2q3Yfp5G3DDhOU5RpUwT1odx3lX
	AC+UbPio/9ZirEFxGIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbgu-00000008bmK-42Kz;
	Mon, 25 Nov 2024 16:12:00 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbfx-00000008bgl-0aBH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:11:02 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53dde9acbb0so2235905e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551058; x=1733155858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4agveOwge0PFPBakCbLt+oYuwIz3qhwiYZMG0RcOCo=;
        b=mm0s3agBVAjiSA7DA2hd9GnowwHRjbjZd/qXYsIYWa9ho8/xk3x/Xlyk7tU8U/5VUp
         ollaIiD6BN1kM4pxWyCaWklj438juwu8OiLth/0zWZO1Jf7OatmQA9Z0j27e4hJmdtNR
         dPzFFd9flaGGZgTxeFBD8sI9CRfMFZr04lHzQosZWgEFv6nyzNxNNHlIWbl/e4tvrrSZ
         KMw5fwlXEX1iqY4Efhdym7ua8GyQ29ycYvU7QHDPggPnQ/hCNFuc6bdSzRn1edALRQou
         VkXustoDrrKvn2xhTOw8RdiMdlRTPjfCL/A+e+MFjFpVOHiHW28ELqq7mSQSqXWTH+XU
         SI2A==
X-Forwarded-Encrypted: i=1; AJvYcCUziDqtCihFmBz2hJckrALyOSeP2rdS+OKAlb4rzmiwcmql0o0OgfOPAj9Z0bSfZeTlL1+VvZ8jeLRU1sJNDbEL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0PSFb7JvowBwYPKiuvXRqiaBS1S/e9tEBPTbLowPtOL7YYXo0
	UZJfPTfz71WpNIaW88zUQ1L5paPoveLh8oixqMOH215aiGCYAjR3i+jIiWXc
X-Gm-Gg: ASbGncsuFtz94aj6bRBGD7L2DDKyvtBkCUgi4hBitBuKkzQm1wfWmakYXYTmkd638as
	uwtPPuEiM11n6ASes89e+P8yL3kBUKkm/lK9k6lFfVa095amlJMmnUCj9hWX8CxNHJy81DsNgEK
	p1TFeOzwI4uWpvOqxlbND8tszUAV5itGDv6u+R3EfOdRk/YX2yCQt6JWh3HCkxJWtvNNdYa//uf
	hwr/uwktYycnmSZWBDlpI/MoOTkzpW/TpJgAEsH7MXYIg4s4NBAMhchkkLLZfk4YQmCu3zy+2FH
	nfgRbAU=
X-Google-Smtp-Source: AGHT+IEWU1tNfYU7fpvPtbRehVZ+4oi30z8obh0PhESgbuO2V+sjDtvpD2awiC3ez7nbXHqm0XQpbg==
X-Received: by 2002:a05:6512:3da3:b0:53d:e7b6:c702 with SMTP id 2adb3069b0e04-53de7b6c987mr773136e87.50.1732551057193;
        Mon, 25 Nov 2024 08:10:57 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2489841sm1720297e87.178.2024.11.25.08.10.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:10:56 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so20277381fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 08:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuDHnyTy3SX784WcTViYB21BHOreRanfDT4XS1C2cyGgLMhoiWBFd6pMieASQ7hzoo6ZjMXWHhp7G/FRoZOQ2P@lists.infradead.org
X-Received: by 2002:a2e:be8e:0:b0:2ff:c368:5765 with SMTP id
 38308e7fff4ca-2ffc3685815mr25260511fa.8.1732551055307; Mon, 25 Nov 2024
 08:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com> <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 26 Nov 2024 00:10:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/sun4i: use drm_mode_validate_mode() helper function
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_081101_175997_973D8A17 
X-CRM114-Status: GOOD (  19.48  )
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

On Mon, Nov 25, 2024 at 9:50=E2=80=AFPM Sean Nyekjaer <sean@geanix.com> wro=
te:
>
> Use new helper function for HDMI mode validation

This is a bit misleading since this is actually the DPI or parallel
output encoder, not HDMI. HDMI is in drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
and drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c

ChenYu

> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_rgb.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/su=
n4i_rgb.c
> index dfb6acc42f02efc40f36914e2925510cd8056d0b..4f8100e32769cf31c25f5dd84=
9a18f5b77376090 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> @@ -51,14 +51,6 @@ static int sun4i_rgb_get_modes(struct drm_connector *c=
onnector)
>         return drm_panel_get_modes(rgb->panel, connector);
>  }
>
> -/*
> - * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> - * CVT spec reuses that tolerance in its examples, so it looks to be a
> - * good default tolerance for the EDID-based modes. Define it to 5 per
> - * mille to avoid floating point operations.
> - */
> -#define SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE 5
> -
>  static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crt=
c,
>                                                  const struct drm_display=
_mode *mode)
>  {
> @@ -67,8 +59,8 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct=
 drm_encoder *crtc,
>         u32 hsync =3D mode->hsync_end - mode->hsync_start;
>         u32 vsync =3D mode->vsync_end - mode->vsync_start;
>         unsigned long long rate =3D mode->clock * 1000;
> -       unsigned long long lowest, highest;
>         unsigned long long rounded_rate;
> +       int ret;
>
>         DRM_DEBUG_DRIVER("Validating modes...\n");
>
> @@ -122,15 +114,9 @@ static enum drm_mode_status sun4i_rgb_mode_valid(str=
uct drm_encoder *crtc,
>         tcon->dclk_max_div =3D 127;
>         rounded_rate =3D clk_round_rate(tcon->dclk, rate);
>
> -       lowest =3D rate * (1000 - SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE)=
;
> -       do_div(lowest, 1000);
> -       if (rounded_rate < lowest)
> -               return MODE_CLOCK_LOW;
> -
> -       highest =3D rate * (1000 + SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE=
);
> -       do_div(highest, 1000);
> -       if (rounded_rate > highest)
> -               return MODE_CLOCK_HIGH;
> +       ret =3D drm_mode_validate_mode(mode, rounded_rate);
> +       if (ret)
> +               return ret;
>
>  out:
>         DRM_DEBUG_DRIVER("Clock rate OK\n");
>
> --
> 2.46.2
>
>

