Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A25CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0I75g7L32DElp2iwBRFQ1AhD2jEmMGjIS1HjLJtkOc=; b=aFNgRpMpFIDQkj
	qUHTlWV4o2oZNubIuNAvywhQj9bvQOE+6XGGpAAg3WKgozOwgj/EOy9rE53VgZPpD6yd2qc4ZRjgh
	6SkTeFC10h9PkP4ggSBVoNpWxcBWt3CJG3BxLLFyCXMiN+hhytJoEzJWJhXlW5BJnKdy6cKQ1n5fe
	wQ2E2Ndce/jyv7ykDgEOyKGcPRgoL+noM3QCV/eM3ZQhB1fkv767Sdam1cYvolEJnvVMu/jDqDW4m
	0Pxn50iL2Q+YGxPp3bQQ90propwgq98XysEb22haZQRm7RzNur4BSMdLb2su070mC99ob32DCdBIk
	NTB3Imen30hIBEYogSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy5V-0000000ANxS-2HqQ;
	Mon, 03 Nov 2025 17:11:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy5T-0000000ANxK-3r6d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 181226013D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A58C4AF0F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762189882;
	bh=Sv9FQL3Mzv+xYf8NoCGm6lqnm9197fwnn5s+c0L/OC4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=SlqXc6fdFdwZKkA3NGn+gW1fT8efWP2Pq9Eay/W3Z/vvEZfuiMhms2HFuhmciuSLQ
	 1Kh7RRyWB29Umachh4f15d/U7AQqP3zYHMeYH5OC3ZppNDS1UKTAdPsHgevXW/WW55
	 ve9P/zKD57n3O8qju8FiYDzLkoTNe2h4N+7x0a2rVJjuzTYWH53qtGyPu87G5HYLDv
	 eCmzAwVZo6J+LklFDGA4aj3LdeXYHdHp3670uap8kl2GfnATtEfPe4pICSzf4/kbdD
	 thKd8mjau7IIw+u35stL/MSUdmOQNyQ03rET2COozaTLSqLRDjZQlLrDM1E0HNe3q2
	 pDtzVyQqo3pug==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3737d09d123so60508751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:11:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSsY0HdwUkSnlXZA3FxP/ZLHY7q8gypD6kwGn3jDxcqyBml7qCaDh6h0jf8iKS1OEoyerVWzqoQ5xju/dclFL9@lists.infradead.org
X-Gm-Message-State: AOJu0YyQrj2cSl1xsW2TgY4Sq6+uwVnBMR3B9LRTjC1s+BIW4EbAc9ux
	r5LouN9wxt2GziDGlaP2TmUX2L6C+xESq0KucPXhERVtLZLf0QgaZPxoy1oVIFA/TaKKJ7aEITK
	DjT9y0eRM9jfobK8FINsZBCMxEcjk2bI=
X-Google-Smtp-Source: AGHT+IGj3r9zUjzPzn9IEygYQzEgz7ukM/+Lp4b6fW21ZV+0fJdeLDp4noFAI8Yrq2hHKB7s/nRse2db5Ak/8EyGv8Q=
X-Received: by 2002:a2e:9205:0:b0:337:e29c:b0d2 with SMTP id
 38308e7fff4ca-37a18de1e52mr34298411fa.41.1762189881006; Mon, 03 Nov 2025
 09:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-27-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-27-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:11:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
X-Gm-Features: AWmQ_bkNL0jahcEQaqn8bSZ19J8F-ktWPPiEchcfhtJA1Ye9Nhc1HXJ4hMb0Q_M
Message-ID: <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
Subject: Re: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
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
> On DE2 and DE3, UI scalers are located right after VI scalers. So in
> order to calculate proper UI scaler base address, number of VI scalers
> must be known. In practice, it is same as number of VI channels, but it
> doesn't need to be.
>
> Let's make a quirk for this number. Code for configuring channels and
> associated functions won't have access to vi_num quirk anymore after
> rework for independent planes.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
>  3 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 78bbfbe62833..f9131396f22f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0=
_cfg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1=
_cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_c=
fg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_=
cfg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_=
cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_c=
fg =3D {
>         .ui_num =3D 1,
>         .scaler_mask =3D 0x3,
>         .scanline_yuv =3D 2048,
> +       .vi_scaler_num  =3D 2,
>         .ccsc =3D CCSC_MIXER0_LAYOUT,
>         .mod_rate =3D 150000000,
>  };
> @@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_=
cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_=
cfg =3D {
>         .scaler_mask    =3D 0x1,
>         .scanline_yuv   =3D 1024,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 0,
>         .vi_num         =3D 1,
>  };
> @@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0=
_cfg =3D {
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 4096,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> @@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1=
_cfg =3D {
>         .scaler_mask    =3D 0x3,
>         .scanline_yuv   =3D 2048,
>         .de2_fcc_alpha  =3D 1,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 1,
>         .vi_num         =3D 1,
>  };
> @@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_=
cfg =3D {
>         .mod_rate       =3D 600000000,
>         .scaler_mask    =3D 0xf,
>         .scanline_yuv   =3D 4096,
> +       .vi_scaler_num  =3D 1,
>         .ui_num         =3D 3,
>         .vi_num         =3D 1,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index def07afd37e1..40b800022237 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -178,6 +178,7 @@ enum sun8i_mixer_type {
>   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
>   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
>   *     Most DE2 cores has FCC. If number of VI planes is one, enable thi=
s.
> + * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
>   * @map: channel map for DE variants processing YUV separately (DE33)
>   */
>  struct sun8i_mixer_cfg {
> @@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
>         unsigned int    de2_fcc_alpha : 1;
> +       unsigned int    vi_scaler_num;

This could be a smaller type. Please do a sweep of the struct after the
refactoring is done and see if any of the types could be shrunk.

And just a nitpick, but I would probably insert it above scaler_mask.


Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

