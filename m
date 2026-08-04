Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E159FC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaH2PNL0DzB1AiDFqofOUl87+ejDXdlDada/f8nrt/U=; b=i4atGDFGgu1LpJ
	6Ggm9kUaIooDKKNegFm6tvOozEhayZp7Ul2QJkv+vPD3aCJEg8tRRCmusPs0WGmUoEgW1ZfPCWrR/
	R7cqC1499XdSjxP5JHFKPFa4bZRdXh0LQTtmpjZGPN3JsoEzUVddlVZD24wsJvOPpRLC16g2RoxA1
	+pJlDP1fRueNWx8sF9mNwbvrnnsOxQXRAHx3R+hEGT9+wTTt7BzapyFPtxZo9Ia7LBEc+k43m5lwa
	ZVQdxgp/Xc1Od78xTl25zplacFeKjrkZ3/LjLpwC4MsROfPcHG+/Bh+vE5T1hI953wlPn3qDJypdX
	O3dtdnaEpIOmNqoGl3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4f6-00000000oxn-1LSl;
	Tue, 04 Aug 2026 02:13:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4f4-00000000oxh-3RBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:13:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C571B600AE
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 02:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F23A1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 02:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785809625;
	bh=HaH2PNL0DzB1AiDFqofOUl87+ejDXdlDada/f8nrt/U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=HNOUURBfRpELrfysdDPrxP6ldTC/Pmj5hsD//FMTGVE8qL8Ok8aXoX3/DitE/MbkH
	 FDliIANBc+buY4D3BZib4lsM1x0tDFgk+5HVNBzteaOQb2tipdpolhXZqtefef572p
	 Xj8Y4iMvx8NsptAFwSKkBHuW+3awkDTLRWD22axs6FZe+PaKf5IKjj3wU6gszjzh/l
	 SDW4h0EiQXGBexBoFdLfCtKQv6UAJey+uo1USjuQE5ir1wbnGnQwax+pIN5JWlkBQE
	 hfN5GfCKAcvTmUvC0LgIs4jGly9w+bYK+QddvyL3M1AHtlyMhU6gTLV3OidAGk/3g9
	 9C8opPJr8PlyA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c74722e27so6751141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 19:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro64dxZR6Zas1CbE8d1FmxDlfg5W53gaxRegbu+VKVaM4UJUzZ4WMHh4NtBY//8NzM+6xJeDgN+Qk9yD77qa08q@lists.infradead.org
X-Gm-Message-State: AOJu0YxKBHmNXSgVFhvjCWqrmDEwnZOkgkhqajV+lmRoXaPdyp8kTU0t
	vulm8o5uvA4TTg3gOvC+UgVgQkPV49MU7P1p1uiwIIJn3OCAglggbFtVKTibfXTpuxMsS5pufVp
	xFF/cMxoqKRLIR2KdEcXzVE3vzBmNUHw=
X-Received: by 2002:a05:651c:198f:b0:39c:797e:bc8a with SMTP id
 38308e7fff4ca-39fb3308f32mr609461fa.16.1785809623988; Mon, 03 Aug 2026
 19:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <263a4a41442a3c8b072b170256b72658f1b90802.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <263a4a41442a3c8b072b170256b72658f1b90802.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 10:13:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v66x0gt665ZKGTvi37j5quYLpn1YMhrRcd-naD4j83tZ4Q@mail.gmail.com>
X-Gm-Features: AUfX_mymhMOdQmpPOxedWcFtrz_hfHN0-KPCg_ZnLW8-t4yrJhRM5wzU5pS1ZNk
Message-ID: <CAGb2v66x0gt665ZKGTvi37j5quYLpn1YMhrRcd-naD4j83tZ4Q@mail.gmail.com>
Subject: Re: [PATCH 02/13] drm/sun4i: vi scaler: Fix coefficient selection
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
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

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Currently, vertical coefficients are selected based on horizontal
> scaling, which is wrong. Additionally, chroma coefficients should be
> selected based on format subsampling.
>
> Fix all that.
>
> Fixes: b862a648de3b ("drm/sun4i: Add support for HW scaling to DE2")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


Somehow having the two fixes together made the diff much harder for me
to understand.

> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/su=
n4i/sun8i_vi_scaler.c
> index 3dec4eeb1ba2..d4412a62c2f0 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> @@ -894,20 +894,26 @@ static void sun8i_vi_scaler_set_coeff(struct regmap=
 *map, u32 base,
>                              lan3coefftab32_left[offset + i]);
>                 regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
>                              lan3coefftab32_right[offset + i]);
> +       }
> +       offset =3D sun8i_vi_scaler_coef_index(vstep) *
> +                       SUN8I_VI_SCALER_COEFF_COUNT;
> +       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
> +               regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
> +                            lan2coefftab32[offset + i]);
> +
> +       offset =3D sun8i_vi_scaler_coef_index(hstep / format->hsub) *
> +                       SUN8I_VI_SCALER_COEFF_COUNT;
> +       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
>                 regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
>                              ch_left[offset + i]);
>                 regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
>                              ch_right[offset + i]);
>         }
> -
> -       offset =3D sun8i_vi_scaler_coef_index(hstep) *
> +       offset =3D sun8i_vi_scaler_coef_index(vstep / format->vsub) *
>                         SUN8I_VI_SCALER_COEFF_COUNT;
> -       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
> -               regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
> -                            lan2coefftab32[offset + i]);
> +       for (i =3D 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
>                 regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
>                              cy[offset + i]);
> -       }
>  }
>
>  void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
> --
> 2.43.0
>

