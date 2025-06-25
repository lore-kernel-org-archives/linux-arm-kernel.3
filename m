Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E747FC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XkhAaM/JzCEk+R3rkG9syqWlc5GbQFu/9f0qcN7to0=; b=L/+X0TnoILM6m3Tlpntu0o7yH1
	sjZsHAepm02QoFaQ9IXxNwTr/ZmAR2xWjuw8xQV/jDBbhqdAU63Il/BAPwhY5iYhPyeRFr/UQ9NTX
	DGgVtmd5xf9JP2FtCB7UXE+sJthUjCtd9Sbbsi8tfXAm9bSa2sg/L3HIK/F5vXbUg89S6jbHJk3EH
	Z7TmV2Q25G9i5DLyzufWcbVMgHFKRHh43FvT4OwttEzftyoGk5QhOKLlqOGecIxevvdVU7I55HKm4
	j8W80I+343qpodNGKINyh1Ya38cysTkJRIj79uh4vSJMg6NBEIpVyvYLJt+8zZjrZfqgp9EsXi9U9
	WcVtytiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVvf-00000009lIR-3UTn;
	Wed, 25 Jun 2025 19:37:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURnj-000000094v2-1yTR;
	Wed, 25 Jun 2025 15:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 811C55C289E;
	Wed, 25 Jun 2025 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE53C4CEF3;
	Wed, 25 Jun 2025 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864358;
	bh=7acD69w878vWcfp9ygQHvSapsDxQCm9372Qsvo+js2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UW2IXsJGnX+n8LxaqkEYFz6GP1RfGXWEYpIjWQx3n8EUARN5rjau0hWBA13tgRkfb
	 11aNVS6vJaEvdQBZWANlmJQP4ZMpt9AUK5fP0T327LRtuNvfxGuVgonWV0QrpMxkf3
	 wQGMJhKtuXJRkHfslCxcyzybbEAxC8LtjRKa+XD4QuhoGBtGlEQS8Urd0Bk3mOLAax
	 qSI8bdRz/5jebPZL9czaruYp7S0FHdKFTMiJFrrMfCRwD1T1M26EmcmhTPJHASMCxC
	 BmvSUNmqMV1y9jaj1zofT4vN85n0SmBjjRsXoJofoZuEJ8+kSNT6vaBaOXIGPprn0B
	 UFm+EsScewn9A==
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313cde344d4so7217020a91.0;
        Wed, 25 Jun 2025 08:12:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnOAuEUmqZP/aEgjZuX3k9CEVYnBgwUTlxQadGZQwdeGXfCvkCORDK7UjJ7cm9LvoqutmvZvD6nfW5ZjY3b49V@lists.infradead.org, AJvYcCX5LyEgEquV+16AUxBNZ0MO7pSe3DIMUXVyOkw6/A/v6DC/qHYcSPZee4K2XVdJeaU+VfWPZ2vXfFomy62ia9s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd7Z6fVqwlP65xjxlEKl8LMbg0h6oth+EYm1dpkLYurxRrISDE
	m3VHFB98Um0lqLmozyyhiifa53NYS7hG2++9+TKGuevdvwX8P3cR3MZJi0hNI6Uj6zPAbUUM7V4
	if+uf0eVBvvueam1wgUdLovwNGCy3tw==
X-Google-Smtp-Source: AGHT+IHRi+7PBRzwt050B+DXhTjMPEXnTOIufqryPox4YMfVMVuQlrfRpyLP0wm4eQM6nCbPhV2jgzf4aY8hipf3xAA=
X-Received: by 2002:a17:90a:da8d:b0:313:bf67:b354 with SMTP id
 98e67ed59e1d1-315f2553204mr5737914a91.0.1750864358080; Wed, 25 Jun 2025
 08:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250531121140.387661-1-uwu@icenowy.me>
In-Reply-To: <20250531121140.387661-1-uwu@icenowy.me>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Jun 2025 23:13:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9MbfmH8k8HanDeC-rRH8e9xHHfgnitNq4NT2oO6anTgQ@mail.gmail.com>
X-Gm-Features: AX0GCFuKfrykJIfV5gh3JBqMtrbzCdg6czPLe-Lhup6-ATUB3IAu60efsRHd8TY
Message-ID: <CAAOTY_9MbfmH8k8HanDeC-rRH8e9xHHfgnitNq4NT2oO6anTgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: only announce AFBC if really supported
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081239_596369_CC7DBBD5 
X-CRM114-Status: GOOD (  23.40  )
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

Hi, Icenowy:

Icenowy Zheng <uwu@icenowy.me> =E6=96=BC 2025=E5=B9=B45=E6=9C=8831=E6=97=A5=
 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=888:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Currently even the SoC's OVL does not declare the support of AFBC, AFBC
> is still announced to the userspace within the IN_FORMATS blob, which
> breaks modern Wayland compositors like KWin Wayland and others.
>
> Gate passing modifiers to drm_universal_plane_init() behind querying the
> driver of the hardware block for AFBC support.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driv=
er")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Patch tested on MT8183, on which KWin Wayland 5.27.12 is fixed.
>
> In addition, I tried to fake supports_afbc in mt8183_ovl_driver_data and
> mt8183_ovl_2l_driver_data, then KWin Wayland gets broken again and
> modetest also shows the AFBC modifier in IN_FORMATS.
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 3 ++-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 9 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h | 1 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 +++++++
>  drivers/gpu/drm/mediatek/mtk_plane.c    | 7 +++++--
>  drivers/gpu/drm/mediatek/mtk_plane.h    | 3 ++-
>  7 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 8f6fba4217ece..53359c2465b65 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -930,7 +930,8 @@ static int mtk_crtc_init_comp_planes(struct drm_devic=
e *drm_dev,
>                                 mtk_ddp_comp_supported_rotations(comp),
>                                 mtk_ddp_comp_get_blend_modes(comp),
>                                 mtk_ddp_comp_get_formats(comp),
> -                               mtk_ddp_comp_get_num_formats(comp), i);
> +                               mtk_ddp_comp_get_num_formats(comp),
> +                               mtk_ddp_comp_is_afbc_supported(comp), i);
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.c
> index edc6417639e64..ac6620e10262e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -366,6 +366,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =3D {
>         .get_blend_modes =3D mtk_ovl_get_blend_modes,
>         .get_formats =3D mtk_ovl_get_formats,
>         .get_num_formats =3D mtk_ovl_get_num_formats,
> +       .is_afbc_supported =3D mtk_ovl_is_afbc_supported,
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_postmask =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.h
> index 39720b27f4e9e..7289b3dcf22f2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> @@ -83,6 +83,7 @@ struct mtk_ddp_comp_funcs {
>         u32 (*get_blend_modes)(struct device *dev);
>         const u32 *(*get_formats)(struct device *dev);
>         size_t (*get_num_formats)(struct device *dev);
> +       bool (*is_afbc_supported)(struct device *dev);
>         void (*connect)(struct device *dev, struct device *mmsys_dev, uns=
igned int next);
>         void (*disconnect)(struct device *dev, struct device *mmsys_dev, =
unsigned int next);
>         void (*add)(struct device *dev, struct mtk_mutex *mutex);
> @@ -294,6 +295,14 @@ size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_c=
omp *comp)
>         return 0;
>  }
>
> +static inline bool mtk_ddp_comp_is_afbc_supported(struct mtk_ddp_comp *c=
omp)
> +{
> +       if (comp->funcs && comp->funcs->is_afbc_supported)
> +               return comp->funcs->is_afbc_supported(comp->dev);
> +
> +       return false;
> +}
> +
>  static inline bool mtk_ddp_comp_add(struct mtk_ddp_comp *comp, struct mt=
k_mutex *mutex)
>  {
>         if (comp->funcs && comp->funcs->add) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 04217a36939cd..679d413bf10be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -106,6 +106,7 @@ void mtk_ovl_disable_vblank(struct device *dev);
>  u32 mtk_ovl_get_blend_modes(struct device *dev);
>  const u32 *mtk_ovl_get_formats(struct device *dev);
>  size_t mtk_ovl_get_num_formats(struct device *dev);
> +bool mtk_ovl_is_afbc_supported(struct device *dev);
>
>  void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mute=
x);
>  void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *m=
utex);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index d0581c4e3c999..e0236353d4997 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -236,6 +236,13 @@ size_t mtk_ovl_get_num_formats(struct device *dev)
>         return ovl->data->num_formats;
>  }
>
> +bool mtk_ovl_is_afbc_supported(struct device *dev)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +
> +       return ovl->data->supports_afbc;
> +}
> +
>  int mtk_ovl_clk_enable(struct device *dev)
>  {
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/media=
tek/mtk_plane.c
> index 655106bbb76d3..e08b771bc25e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.c
> @@ -321,7 +321,8 @@ static const struct drm_plane_helper_funcs mtk_plane_=
helper_funcs =3D {
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
>                    unsigned int supported_rotations, const u32 blend_mode=
s,
> -                  const u32 *formats, size_t num_formats, unsigned int p=
lane_idx)
> +                  const u32 *formats, size_t num_formats,
> +                  bool supports_afbc, unsigned int plane_idx)
>  {
>         int err;
>
> @@ -332,7 +333,9 @@ int mtk_plane_init(struct drm_device *dev, struct drm=
_plane *plane,
>
>         err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
>                                        &mtk_plane_funcs, formats,
> -                                      num_formats, modifiers, type, NULL=
);
> +                                      num_formats,
> +                                      supports_afbc ? modifiers : NULL,
> +                                      type, NULL);
>         if (err) {
>                 DRM_ERROR("failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/media=
tek/mtk_plane.h
> index 3b13b89989c7e..95c5fa5295d8a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_plane.h
> @@ -49,5 +49,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
>                    unsigned int supported_rotations, const u32 blend_mode=
s,
> -                  const u32 *formats, size_t num_formats, unsigned int p=
lane_idx);
> +                  const u32 *formats, size_t num_formats,
> +                  bool supports_afbc, unsigned int plane_idx);
>  #endif
> --
> 2.49.0
>

