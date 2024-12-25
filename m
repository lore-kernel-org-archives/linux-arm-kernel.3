Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9BEE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glY5uHKnifew38bH9P9DnCSw3eG0lJVQ7ZggzjMxJ54=; b=Ox7Hb+uzYeDCR1H/DZjAPD6YaE
	VVPmG/iKOS8IA+E7TzCUUMSH+US7e6P5HlT8/hGnRnsXVL4UeRGZCH4yiwMpsUqxGPhrvSxwMwoXL
	kKB4RCRnf78GEcjNSqIqb8c80CYk987P4cqFLRklUWPZcO9opx+uejroiTjbYekTboiINk2xmsmAd
	tvPSkKgQXjqatm16AE+AiK4/VfNKvdN65fte/JLb78v14i6xT075CeDsYYzFFvTirWv0F+zVej/Lu
	Xv2HV41LBC3qSeNO7hcs+pHBDK0sV/IkD4oO9RpV1TDrlRC7kpVgC5O47HcjI0LMxVWvfe/mcB4sR
	S847sgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTFE-0000000DzWt-2Jus;
	Wed, 25 Dec 2024 15:24:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTE1-0000000DzR6-3DYs;
	Wed, 25 Dec 2024 15:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E225CA40579;
	Wed, 25 Dec 2024 15:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05409C4CED4;
	Wed, 25 Dec 2024 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140184;
	bh=mhUhfD5xu9xUgTWuJ7EicNZyi3Rplf9WEPihxS1XkoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oo2UjOR9+b1rdymnlrbNg7g5QgmvsmNIx6lAaW8uC2UmBp6rXnydkipmhbKNqBdrI
	 pJY5LQi2+uoKIASsqKqXyYDyob1ybAf0dYpub9RdQpTkN1GCtucPUKDXPV58R75WGe
	 lztnWsqHf1+p468k+99n4AavsNMp1CETHbxuROem3keKvAOM3bcacIk6XrXtAA+B7V
	 gMMzyxAwJ4VBEnKKj+SIMPk462orJ76PwHkl/SDSsH+Eqr5JJmVx8z6zjkoYS3ld5Z
	 zpxHgG4wYLNkxLEMtALiQEXiBj+F5n/EVlxXbfvsb4tuYqTIg6x/z2YpRRcWqBWsna
	 r7HA5/N9/4Sdw==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2efb17478adso6292625a91.1;
        Wed, 25 Dec 2024 07:23:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWv35tLt2Wm2ITquIJt//C3i6P6Uu7FTatP8Hk+y3XcHSLtBQZm7ewF7x2TBRgkjpsI6B1K8ukKeqJ+MdFzWvE=@lists.infradead.org, AJvYcCXas/UVBclC/KqJ//x5doA7Auu4hU/v18Vai6VbCv8TWh7+HpPLtMitCa32PLxNe6kxMnpLDV4tralesVG+XOUe@lists.infradead.org
X-Gm-Message-State: AOJu0YxYOE26tsVYRfRMNpEcZUgfCDtMMFNHxCVaIehTBjC5516GoKUa
	15a6Y/OVYkLlpSheYjrJkk6Ci4tgjqAaujrk999aUpAK+ekDzL1ADvfltLWW1+IxdRGVJdQWitM
	mneD+6twiXZaf3Y0rY3OA6XB9Iw==
X-Google-Smtp-Source: AGHT+IHCihUHcJ8qD4UtDOlUirJx2B7bhpCAamJSMHeC/NqpVjt2cMY/BxGA/o2GvMZiwrUAXoIblHFFblMMDR+/zeg=
X-Received: by 2002:a17:90a:e187:b0:2ee:8430:b847 with SMTP id
 98e67ed59e1d1-2f452dfcd26mr28628588a91.6.1735140183506; Wed, 25 Dec 2024
 07:23:03 -0800 (PST)
MIME-Version: 1.0
References: <c7fbd3c3e633c0b7dd6d1cd78ccbdded31e1ca0f.1734397800.git.daniel@makrotopia.org>
In-Reply-To: <c7fbd3c3e633c0b7dd6d1cd78ccbdded31e1ca0f.1734397800.git.daniel@makrotopia.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:23:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PcNYev_1cTc8Q63K-kTWAgNCMwLfcfZ0ah6_ZJGPKfQ@mail.gmail.com>
Message-ID: <CAAOTY_9PcNYev_1cTc8Q63K-kTWAgNCMwLfcfZ0ah6_ZJGPKfQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if
 AFBC is supported
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Justin Green <greenjustin@chromium.org>, Frank Wunderlich <frank-w@public-files.de>, 
	John Crispin <john@phrozen.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_072305_953197_60D1FF90 
X-CRM114-Status: GOOD (  19.93  )
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

Hi, Daniel:

Daniel Golle <daniel@makrotopia.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Touching DISP_REG_OVL_PITCH_MSB leads to video overlay on MT2701, MT7623N
> and probably other older SoCs being broken.
>
> Move setting up AFBC layer configuration into a separate function only
> being called on hardware which actually supports AFBC which restores the
> behavior as it was before commit c410fa9b07c3 ("drm/mediatek: Add AFBC
> support to Mediatek DRM driver") on non-AFBC hardware.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driv=
er")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: move AFBC layer config into a new function
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 57 +++++++++++++------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index f731d4fbe8b6..e0e24f0a6edd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -460,6 +460,29 @@ static unsigned int mtk_ovl_fmt_convert(struct mtk_d=
isp_ovl *ovl,
>         }
>  }
>
> +static void mtk_ovl_afbc_layer_config(struct mtk_disp_ovl *ovl,
> +                                     unsigned int idx,
> +                                     struct mtk_plane_pending_state *pen=
ding,
> +                                     struct cmdq_pkt *cmdq_pkt)
> +{
> +       unsigned int pitch_msb =3D pending->pitch >> 16;
> +       unsigned int hdr_pitch =3D pending->hdr_pitch;
> +       unsigned int hdr_addr =3D pending->hdr_addr;
> +
> +       if (pending->modifier !=3D DRM_FORMAT_MOD_LINEAR) {
> +               mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg,=
 ovl->regs,
> +                                     DISP_REG_OVL_HDR_ADDR(ovl, idx));
> +               mtk_ddp_write_relaxed(cmdq_pkt,
> +                                     OVL_PITCH_MSB_2ND_SUBBUF | pitch_ms=
b,
> +                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> +               mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg=
, ovl->regs,
> +                                     DISP_REG_OVL_HDR_PITCH(ovl, idx));
> +       } else {
> +               mtk_ddp_write_relaxed(cmdq_pkt, pitch_msb,
> +                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> +       }
> +}
> +
>  void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>                           struct mtk_plane_state *state,
>                           struct cmdq_pkt *cmdq_pkt)
> @@ -467,25 +490,13 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
>         struct mtk_plane_pending_state *pending =3D &state->pending;
>         unsigned int addr =3D pending->addr;
> -       unsigned int hdr_addr =3D pending->hdr_addr;
> -       unsigned int pitch =3D pending->pitch;
> -       unsigned int hdr_pitch =3D pending->hdr_pitch;
> +       unsigned int pitch_lsb =3D pending->pitch & GENMASK(15, 0);
>         unsigned int fmt =3D pending->format;
>         unsigned int offset =3D (pending->y << 16) | pending->x;
>         unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
>         unsigned int blend_mode =3D state->base.pixel_blend_mode;
>         unsigned int ignore_pixel_alpha =3D 0;
>         unsigned int con;
> -       bool is_afbc =3D pending->modifier !=3D DRM_FORMAT_MOD_LINEAR;
> -       union overlay_pitch {
> -               struct split_pitch {
> -                       u16 lsb;
> -                       u16 msb;
> -               } split_pitch;
> -               u32 pitch;
> -       } overlay_pitch;
> -
> -       overlay_pitch.pitch =3D pitch;
>
>         if (!pending->enable) {
>                 mtk_ovl_layer_off(dev, idx, cmdq_pkt);
> @@ -524,11 +535,12 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>         }
>
>         if (ovl->data->supports_afbc)
> -               mtk_ovl_set_afbc(ovl, cmdq_pkt, idx, is_afbc);
> +               mtk_ovl_set_afbc(ovl, cmdq_pkt, idx,
> +                                pending->modifier !=3D DRM_FORMAT_MOD_LI=
NEAR);
>
>         mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_CON(idx));
> -       mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb | i=
gnore_pixel_alpha,
> +       mtk_ddp_write_relaxed(cmdq_pkt, pitch_lsb | ignore_pixel_alpha,
>                               &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PIT=
CH(idx));
>         mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->re=
gs,
>                               DISP_REG_OVL_SRC_SIZE(idx));
> @@ -537,19 +549,8 @@ void mtk_ovl_layer_config(struct device *dev, unsign=
ed int idx,
>         mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_ADDR(ovl, idx));
>
> -       if (is_afbc) {
> -               mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg,=
 ovl->regs,
> -                                     DISP_REG_OVL_HDR_ADDR(ovl, idx));
> -               mtk_ddp_write_relaxed(cmdq_pkt,
> -                                     OVL_PITCH_MSB_2ND_SUBBUF | overlay_=
pitch.split_pitch.msb,
> -                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> -               mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg=
, ovl->regs,
> -                                     DISP_REG_OVL_HDR_PITCH(ovl, idx));
> -       } else {
> -               mtk_ddp_write_relaxed(cmdq_pkt,
> -                                     overlay_pitch.split_pitch.msb,
> -                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> -       }
> +       if (ovl->data->supports_afbc)
> +               mtk_ovl_afbc_layer_config(ovl, idx, pending, cmdq_pkt);
>
>         mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
> --
> 2.47.1

