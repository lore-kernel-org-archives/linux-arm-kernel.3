Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW3mkeflKClv9lw164K4YGIw8SIsux7V05xBSu2+GpY=; b=vcZ728exU5+0t/
	vO7D1BWKCYhSRhzPfKep23wibg92fRTU/7cwa6ZVIue0BXOFpD1mjjbsu1rFwAHW/DWm1aAtn6kzC
	sY5opF7YpR0ghmrMskpiEVHYwmFP8AYGZPwY9oF0WDf9s0nXwggeZBYYMW6Hmf2cxlwp852sfLNnP
	qxOGl7QCJCwlbI/tA7QYB2dqRWjWCK4GfQYQJ39C6c+gJn8v9gBuHrXQSpZSmmViy5+4vZOFTnJxD
	oClpaG1IVFHRuuQ5RNUmgU90qxZ/2gcPY3uG1iha/hPgGpS56poHK+CYLLogaKsUql2X7HI2mj6K6
	+K76DwU6Hkx7heGzoO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOjL-0000000Ap8M-3rwr;
	Sun, 19 Oct 2025 08:25:31 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOjJ-0000000Ap7e-2Gx8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 08:25:30 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso5865754e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760862324; x=1761467124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VW3mkeflKClv9lw164K4YGIw8SIsux7V05xBSu2+GpY=;
        b=HjVgz3X4gNvGKIVMUnDh5T+U+6a61CKh/OjUUyNmwn8BTyNNq5hzshY1CeGKxEidvg
         y2JtK7kfkZ+M1m8MjwlVoH+QoTsVrn18QlJgP21AqMbV0VJd/2I+g+pJXxd43ukjPxBz
         2XfkzBAsYzjCfc/XdboVBJrb4fEiuk9q6vZUx6O5gyEPfC1CGIAFP2RP7K15hOSPsfSO
         oIrnzAax5LG2XYSN94vjnEiF4veNAYHfH9bBtT6TWcG5BWta/HUTniS8gsOZJjdTLU4a
         AY447yrodyDTmSSuAhTAGhCio/VgyGbGMSR+H/b1jLCSUI4Y8gz7IS4uftv/Joun2EaK
         3r3A==
X-Forwarded-Encrypted: i=1; AJvYcCUFJyJVdJl9KoLjiVwnRybMfpZr+tNvyOyZgRU8lNaEilYxpDn3QVFjGOLBiEew+boRZANeyUUYT3xZX3tOwTRt@lists.infradead.org
X-Gm-Message-State: AOJu0YweAXSycKSoJbkjNXUDmF4CKNsv/MLMEAM4T/O6A+esYtcEwsEG
	CD/UctGvHYFSdkfHRrgHIbijWKGxae3ZFUP4t65GVUFWlQ/UzYs15dSEuX8PA4ej
X-Gm-Gg: ASbGncuwCAXDq3uU5SMyxnMZzcbt7hMYz3+2Mhm7Ms9MGdK0c3FZBpdLAuTsyHhHbxX
	YL/XzIJIjvjjAM2HAUq9aiQlvwTHU4rZ8/GtykVvxczx3+u+90SX21ESCdSKwH1tDJIyh5niQCP
	jhsmOXVBw7j26qKwfFOtPeIIyxoMCv2zNmo7xOsSLMZX4SJx3+3xsFGrndn2/BvAN4AgzHzZLZ4
	fPqpakJn9PSiNwmsiMUR2UMZA9aEGgZ+CmWvd6K8dWQpBv4aFtJ32K06avqADDmUgnV7vonADwv
	8zBjoz2tsw0YxBhZTHMBbd9LEWK/3ZgV7QfgSBDav0pzBwHOxH9jcsSeEUHUx7bXGmTxAzvGISs
	N8qJ7ItjxeLwn8a3kvy212XohNHhmFRNlD4QkR87opvX4EbsucyPkX2Isob/bhAQqljYTISq88+
	uKUgPTM37zcBod9p8PhV3nWZ5VIAAvQyEX6TKt1K3SlOs=
X-Google-Smtp-Source: AGHT+IGus5c8Ia3K1knPcKUXnvKDuJuPswkbVdtj0dpHIGM/AZACLGOyQpu898oB4LZTEZNiHkFOVw==
X-Received: by 2002:a05:6512:3da1:b0:585:ec27:b571 with SMTP id 2adb3069b0e04-591d83841b3mr2933448e87.4.1760862323800;
        Sun, 19 Oct 2025 01:25:23 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf49bsm1373582e87.28.2025.10.19.01.25.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:25:23 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37775ed97daso44805081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFKW8hAzR+CaVmN1Xysl8J6k2aHIJ6sZnZxihRKi+6VA1m6tN9qeKm9ibnVhiEVXN13RY6R7YMS6s11APqUTho@lists.infradead.org
X-Received: by 2002:a05:651c:25da:10b0:376:41f5:a6ca with SMTP id
 38308e7fff4ca-37781f4148fmr32251171fa.0.1760862322639; Sun, 19 Oct 2025
 01:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-6-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-6-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66XAFkKaM8Gi=0fZknvrit0WmXA0G_kBYmye5APnhxOOQ@mail.gmail.com>
X-Gm-Features: AS18NWC1T4rH1wgxWICMNRFWZoKmEq_TA059og5Su5dyIUywI4YDjh2R7R0IKKc
Message-ID: <CAGb2v66XAFkKaM8Gi=0fZknvrit0WmXA0G_kBYmye5APnhxOOQ@mail.gmail.com>
Subject: Re: [PATCH 05/30] drm/sun4i: vi_layer: Move check from update to
 check callback
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_012529_599452_80C474A0 
X-CRM114-Status: GOOD (  17.81  )
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
> DRM requires that all check are done in atomic_check callback. Move
> one check from atomic_commit to atomic_update callback.

Same comment as the previous patch.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index bd6c7915bbc4..c80bdece5ffc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun=
8i_mixer *mixer, int channel,
>         struct drm_plane_state *state =3D plane->state;
>         u32 val, ch_base, csc_mode, hw_fmt;
>         const struct drm_format_info *fmt;
> -       int ret;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
>
>         fmt =3D state->fb->format;
> -       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -       if (ret) {
> -               DRM_DEBUG_DRIVER("Invalid format\n");
> -               return ret;
> -       }
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
>         val =3D hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
>         regmap_update_bits(mixer->engine.regs,
> @@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_pla=
ne *plane,
>         struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>         struct drm_crtc *crtc =3D new_plane_state->crtc;
>         struct drm_crtc_state *crtc_state;
> -       int min_scale, max_scale;
> +       const struct drm_format_info *fmt;
> +       int min_scale, max_scale, ret;
> +       u32 hw_fmt;
>
>         if (!crtc)
>                 return 0;
> @@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_pl=
ane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       fmt =3D new_plane_state->fb->format;
> +       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +       if (ret) {
> +               DRM_DEBUG_DRIVER("Invalid plane format\n");
> +               return ret;
> +       }
> +
>         min_scale =3D DRM_PLANE_NO_SCALING;
>         max_scale =3D DRM_PLANE_NO_SCALING;
>
> --
> 2.51.0
>
>

