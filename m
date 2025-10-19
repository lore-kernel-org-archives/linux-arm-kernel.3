Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F85CCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMwNP3my/AAtkqEoi875nhGGuoIYGuPvqPRBJ3G+A9w=; b=hGYp09yESTMVgo
	BS/QZ2gz+hTvmPmIj5lKVNufmxNplgOqza5jEok2uE7h9x2OlvvnMTuv7JA/gPR3wqyyQOFJJbd1N
	mCp9rR6hHdKUV3Mmrdam5PMwlvNMq3774zloqBljB5Wo0/p+atw/mh4Ospy6VaFXuscL6inDMHh7R
	gmWYqSIuEXzgKKMMCHJRDknr6FxGeVm066KGqk4qtoBWO20G8i7xGs7uPXeEgF33xjYLM+8g3cJmk
	dieRhwb0OYYwX9htYoIlDjVNAqzUVKxmOIbPz29ZoHcQtY5XBquvThBsfYWMo5FO7EC72XddOST7y
	88u0fRbLlwWdpE1UTygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOiR-0000000Ap1T-2Kob;
	Sun, 19 Oct 2025 08:24:35 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAOiO-0000000Ap18-2X7O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 08:24:33 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso3902408e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760862269; x=1761467069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMwNP3my/AAtkqEoi875nhGGuoIYGuPvqPRBJ3G+A9w=;
        b=lnW4NK9DC6WUrOOhSe00etZcMN5q4SJdphv5QYRsAxyp6evOAiGC4hS9yD1MfX/rGw
         e9rjNPPuMH7U55ZoMqaUCuFksBSJ09sX2hxAGUIXon/bVaClfwM7KMA3z571a5w7KDnf
         +v/u5TE6iY7A7K/BbNQfW7rFsTTrBIyH6aqHhJemVJj0Au0qeDc085cQuItUY4aEBwfw
         Re+nXIimAe0ozs0DcoCWemvs4SP0WxnJTLRX+oeOyg/LVD88/6MoIk3LOS4YQkv2gNM/
         GulyPpSBTNqF9YPwZGDKiiHAotfql5oN99kWqhpBObqFULHTP8V0ZceXcWno9OWS8YIZ
         ecYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGXvoJMwwLfF4IVyHkK4g+gr3SBqEtcbno88i2tJit2uiIgsxRfPXA+FiZChu81Xskqagi5eOYfaG9qHjZvQLk@lists.infradead.org
X-Gm-Message-State: AOJu0YwT2Bsw9X1unSulL5fbd0UpH4tPRg8ZP25SRQKib4muC6N3UTeY
	LDzv4Ko+iPbRi5L3J31rDQP25y4U+oD6GxbhzgP3O8SpgLRVQ5lpPNfaq1kePAK4
X-Gm-Gg: ASbGncvPtyMIbSzYqslxy8zU9E4m6WMhJOgZO3DRP6sARDwEtiKyQ/TKJeUqj41Qq9H
	YxbLkcX5xCzjHWe2SNrs/8FDFaGbH0NMRXLMK21SkgDZ95F7IwgBLp2HDXNeCHt02xn47dcfk8U
	527YztgVDQKJM0aTqZwSO+l+iu3Hq0CXgUiJqjg+tbFrusafEL85QYVao4B/6eayQu30q2xhhPc
	27WA6X0Uhejzs5UaWsXTWQ7l30Yzg59I1A31TvknSp3jJzAtqwaBa59bN4z5zA6rnCZzbrB2e10
	dKnCfeLsNdwurAyClZePcwb4OcgYf7682ZrzX6KECNcj0Zwzz7ZEk65uy9FZ3CRslKWmWZrDClO
	7kbcp2XeJtrrLYFYzMWPdrjGKGc6d1b7fYBOijlnWpf9m7DHC9PJc75gGBb+GJf9PSx+ZutIkgI
	Fr1Nb/uw5KNrK/OOhSqRVqjZP9hUNdGIc7
X-Google-Smtp-Source: AGHT+IE/M+tp37n9sWRpLX6Wj3xn4egXjWzWEYa3epaSl9T4Gh5ff5qvDvfuf/qQYdOlSZ2hnS/yXA==
X-Received: by 2002:a05:6512:3b82:b0:57e:9865:d68a with SMTP id 2adb3069b0e04-591d8575789mr3183688e87.52.1760862268853;
        Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8cafsm1389560e87.2.2025.10.19.01.24.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-367874aeeacso38986181fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTXFxlvbfeN6t23cGFpWWzBWzfojEHKtpzVbNdCwsDirfEfv18IDEPTtDLaVBN2TgfwROCKI8Ncot8vVR2uuda@lists.infradead.org
X-Received: by 2002:a2e:bd86:0:b0:36b:f63:2785 with SMTP id
 38308e7fff4ca-37797a09b5emr26596581fa.27.1760862268372; Sun, 19 Oct 2025
 01:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-5-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-5-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:24:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v64_HXub5SZn8U2=Smi_XheyK5-k-ycwR19wmboEvub3Rg@mail.gmail.com>
X-Gm-Features: AS18NWD0jnxz1Ue42cbwTGa97ilz_J4ZeWnbXU3EI3BU7YNx8yeEWNSRMp4bPA8
Message-ID: <CAGb2v64_HXub5SZn8U2=Smi_XheyK5-k-ycwR19wmboEvub3Rg@mail.gmail.com>
Subject: Re: [PATCH 04/30] drm/sun4i: ui_layer: Move check from update to
 check callback
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_012432_660115_FA3747B3 
X-CRM114-Status: GOOD (  17.25  )
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
> DRM requires that all checks are done in atomic_check callback. Move
> one check from atomic_commit to atomic_update callback.

                                  ^ atomic_check?

Otherwise the commit message seems self-contradictory.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 9b786e5c7f3c..fce7b265c5d8 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun=
8i_mixer *mixer, int channel,
>         struct drm_plane_state *state =3D plane->state;
>         const struct drm_format_info *fmt;
>         u32 val, ch_base, hw_fmt;
> -       int ret;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
>
>         fmt =3D state->fb->format;
> -       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -       if (ret || fmt->is_yuv) {
> -               DRM_DEBUG_DRIVER("Invalid format\n");
> -               return -EINVAL;
> -       }
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
>         val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
>         regmap_update_bits(mixer->engine.regs,
> @@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_pla=
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
> @@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_pl=
ane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       fmt =3D new_plane_state->fb->format;
> +       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +       if (ret || fmt->is_yuv) {
> +               DRM_DEBUG_DRIVER("Invalid plane format\n");
> +               return -EINVAL;
> +       }
> +
>         min_scale =3D DRM_PLANE_NO_SCALING;
>         max_scale =3D DRM_PLANE_NO_SCALING;
>
> --
> 2.51.0
>
>

