Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03BECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbqPx7MMehJffAKX9zdt0wmPKRdUC5+UgUk2ExHxFQU=; b=IH4KFWrBdNxoX4
	CPGXNFci6G/IMxbvejHPyDinIYSYCAaNc5mNYXJ6rUznOa/tylA5kE8AXPQAXW14bswGZdRSYb4/d
	5cqTm9VODKLyQt29FxeYd73IWSvbdj7yDhIRDhZX2D4L/HFMD/vvE56Z587MBCH2u+luOZhTTplGL
	omXn+O4WrpXi0aMz7lY1o9nwTs17Pqduc1NWFQn9UY0iXdll7I3KAYnEGopFw0SGzWBBwZX/YTl5h
	BeFdBvb2l0bGxQXBwP6n2mFwlK9nq6YaogSdDMX32jI6C3ns18kIEaUD/X8Tm8+WSZNr0X5kcGwZz
	QpyQ0IavW40hi+NbIpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxzd-0000000ANSu-3JcI;
	Mon, 03 Nov 2025 17:05:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxzd-0000000ANSo-0QGo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44715601AF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB745C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762189520;
	bh=fzn2uWklE5tGYSA7UDjLpALgXVTdhEXtVy9R7XntaPQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=g9hrdi3xAQFfY1V7sdRdIVONNidF/l2hyJ/g0siNufHHpNmN2S5j4m4Fxq3Zu+ZzU
	 4b0xaTTbDaCRO1MfJ+643n5BiyP8/KI7nopvXnexBj8h3z2+sw07fgFc1ADdsRZdQV
	 T1qpqM0sYbu6Hg9YH9ddDXMhvuRnRuuPSiMfPJGu3h/POsphvocn3vrtAWctOycvsk
	 uYHB6GqzYucsTUCfTfDXCyiLRdPsMzs8gjYZwnBeHoFs99+rzxv6fHUBQPuY9Uur6f
	 WKVFD5tIyVPhlrtnwlomwe3+/PhsQ/m09WGC1VwzFqpIEsqjhKBLqLWYGYDp/ixC4j
	 NNlUYuvlDVK0A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3737d09d123so60423501fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:05:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZ8h4TW/uv+LgzjdRBAX5njAF4QtpMvYLOnr9Tgtq18WVAucnaLXbCjd5B94oovfyDui5NPceHljPMGW3rdhJH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5S4nBdHjr77cRrPHhUwcMgsNK8d4rQCA5mHaAUIL/Wz5zw2Zs
	hwv4tgcpLsZAPmhJj6OOUG0hBtow8sOA88HdeG6FMpxupe8ZOMSVUCCTaZZLIr2H130AEfUCW6O
	a2NVaTxmugtO7HRGUpmw/iXDcDpnrLoE=
X-Google-Smtp-Source: AGHT+IFFecWvcK1jARo7+vH1i0fdkgcM3ym8hNovbJFPh3GHwmoUFl+ITibWVEcnlLM/g4nfPOjXXktiS+ImC6As/Vk=
X-Received: by 2002:a05:651c:211a:b0:36e:4481:9e89 with SMTP id
 38308e7fff4ca-37a18d91342mr40664941fa.11.1762189518224; Mon, 03 Nov 2025
 09:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-25-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-25-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:05:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v67o69htsbDDn7XY=dhVFcGvaz2CUApdPkcrZHX-rL1Xzg@mail.gmail.com>
X-Gm-Features: AWmQ_bn7ssL-pDpY0rKLqDen2nEYYfFMIRhfqe36gObds6juuxJVT53N-TRZXDY
Message-ID: <CAGb2v67o69htsbDDn7XY=dhVFcGvaz2CUApdPkcrZHX-rL1Xzg@mail.gmail.com>
Subject: Re: [PATCH 24/30] drm/sun4i: mixer: Convert heuristics to quirk
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Determination if FCC unit can be used for VI layer alpha depends on
> number of VI channels. This info won't be available anymore in future
> to VI layer driver because of DE33 way of allocating planes from same
> pool to different mixers.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    |  9 +++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 +++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 +++++++-----
>  3 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 267a6f75feb2..78bbfbe62833 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -707,6 +707,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0=
_cfg =3D {
>         .de_type        =3D SUN8I_MIXER_DE2,
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -716,6 +717,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1=
_cfg =3D {
>         .de_type        =3D SUN8I_MIXER_DE2,
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_c=
fg =3D {
>         .mod_rate       =3D 432000000,
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -736,6 +739,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_=
cfg =3D {
>         .mod_rate       =3D 297000000,
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -746,6 +750,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_=
cfg =3D {
>         .mod_rate       =3D 297000000,
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -766,6 +771,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_=
cfg =3D {
>         .mod_rate       =3D 297000000,
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -776,6 +782,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_=
cfg =3D {
>         .mod_rate       =3D 297000000,
>         .scaler_mask    =3D 0x1,
>         .scanline_yuv   =3D 1024,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 0,
>         .vi_num         =3D 1,
>  };
> @@ -786,6 +793,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0=
_cfg =3D {
>         .mod_rate       =3D 297000000,
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 4096,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -796,6 +804,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1=
_cfg =3D {
>         .mod_rate       =3D 297000000,
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
> +       .de2_fcc_alpha  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index d14188cdfab3..def07afd37e1 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -176,6 +176,8 @@ enum sun8i_mixer_type {
>   *     a functional block.
>   * @de_type: sun8i_mixer_type enum representing the display engine gener=
ation.
>   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
> + * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
> + *     Most DE2 cores has FCC. If number of VI planes is one, enable thi=
s.
>   * @map: channel map for DE variants processing YUV separately (DE33)
>   */
>  struct sun8i_mixer_cfg {
> @@ -186,6 +188,7 @@ struct sun8i_mixer_cfg {
>         unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
> +       unsigned int    de2_fcc_alpha : 1;
>         unsigned int    map[6];
>  };
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 44e699910b70..8eb3f167e664 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -48,14 +48,16 @@ static void sun8i_vi_layer_update_attributes(struct s=
un8i_layer *layer,
>                 val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
>                         SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL =
:
>                         SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBIN=
ED;
> -       } else if (mixer->cfg->vi_num =3D=3D 1) {
> +       }
> +
> +       regmap_write(layer->regs,
> +                    SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overl=
ay), val);
> +
> +       if (mixer->cfg->de2_fcc_alpha) {
>                 regmap_write(layer->regs,
>                              SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
>                              SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >>=
 8));
>         }
> -
> -       regmap_write(layer->regs,
> -                    SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overl=
ay), val);

Should probably mention why the order is reversed here, and why it is OK.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

