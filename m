Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD557CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=; b=P+96TiFnkrPC5+mBFDm7e3xlQ7
	xsNKdippxdv6d4pohTX/q0hGSfS1S6vDdBvrCC4nB3XWiMwnymSArOZCPuGfqTBCmK6D9heudbxEz
	c5bCJDcUcHs+sIE5WfWDRgruhAptq4KWOIEqaaBg1U0T8jYJtC1R5Vr8MQ3xWmMYI60i16g8hLgh4
	S60UBoSWtMhMS5iumzn+ATDRZR+70NvoZXUhUgzIH3jJnMssfhTbzF//4oYMUveiSsbNaW8vUaSKw
	mWBpCSzge9gjc6/Aa4qsQ4fgDUddqsDja+jmRmd6Z2isSurtKk9ue6b5nQuNyVXHcHzon3118kEVG
	5WGVThVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOuR-0000000F1bT-02wj;
	Sun, 04 Oct 2026 16:17:55 +0000
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOuO-0000000F1b6-3Er7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 16:17:53 +0000
Received: by mail-yx2-x2a.google.com with SMTP id 956f58d0204a3-6768036283dso560968d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 09:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130671; cv=none;
        d=google.com; s=arc-20260327;
        b=f2bvyLVj9Evebhh20kkjreyGeNZtd6XSzvhksHQhaYJ0n2lWbESEHSr4G6tbiC6Vuu
         haBX8CIvLODIksGyubBksslmz6E//vzESy5o2O2qY+cH+yZ0/8BaFOHLYHc0unNz2q72
         SEI5lGTIviCc3qnMVrQ3Ob+lYp18aFz4XuBLaQbCQ+hfT93xdL2MTSIJGqY1o2x1KXlc
         q2d/HQ2IeSJKHCdks4zD85M6syqc6VdlfAZbFMQZPu5hKhIYJurW6hnKZvjbbtQ+V+TF
         iFHfFcep5QLP95A0xHwZao8mEN6STwvyEcIDpiJzOrO2bBpr9AOlu0sAkmwM4MKTAoip
         QCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        fh=evB4yG+9syd0AkiwOLMtnpfjfUo40hr61aA/SiE6Jes=;
        b=RMyDecd+gniuWI98Bi8/p7X8Wkk2UzLW/GZXuuRJlf9mVSdfO17G7uq0t74GuJ/zZp
         qPP8G2J6w3hujA7ZffXihHVpXXkOpoJ8JS2OH5fmamIphk+EbUAnAGendhHWabREDqk3
         Dbf52k5UMsQ6qbOGahbMZATE/RscyzGyU8njayzqKaIcChla6nJn7ZSEjQgwo1axn4gj
         bjRFJD4nhpD86vkQZr/L2EKaxxIOTZaIQmeqnjJS3jvqEE4xsNBkQuwRisH2h/ZA2ORT
         UYiFiRK0qnQD11nGwir5PRHDGR5eLKTnkejQwzBFp33ElF3lfEsx/xfm8aK7ziQ449af
         TOHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791130671; x=1791735471; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        b=m7Aovd+0mMj6JmHOoSzUXmMhf7cP0x7WgeooGW95zADN2+6s+odLkkNXNV2BZ4Rb+z
         s+E968xpMTMxr1P8nMfdzjtgaJz9fRmLFet0Ng/+EN2mVSEwJEWHgkNikFl8IAA967zk
         9gJuwl1tBJ9Ps5boO5zKwiFc6Plc/0rdtQ1xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130671; x=1791735471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        b=QQzsW2JSFla1XEespPJjtxGLguoR6Rlehv/+cRUwXEsor6/TXTjpHBfHGDRvF2afxF
         POFan+KeU9piNTKBqiWKKsRFr47A6I1xIKi4hFQ5laAu342A4Nt86MKKOqjkWmw/Zesq
         N17ysqEcJkMqtQTO6VwERs5C4eG7ETp7vf8PGaFDJTRe9ZkiMXppwvox/Nd8azjRsi02
         rKSMcoLK/R3yWSb7xnuFn1bh0p6mQmyDwfM8gGVgC03OSxmH9KZZBZpfsfR03sJl6QbS
         PF4po2Nz8gTYvlvm0i0Fv9FtyUJyL8B60Mv8GMUkfEg1DGOUFTIrg0lMM8Zxdy3KsaKM
         GCDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzliXUdmRsskm2WYqoftMv6KNg4Bq5f9eARYBkRvT3xWlAxSH4IPPEq6teZVdfBbg1Ojp3/XIjmQZxqVV7tIVWj@lists.infradead.org
X-Gm-Message-State: AFq9FYJYn84y8wgPWoE2AgSdm+Pq2NTXstofAMzZE4IrawwG1Ed3+gs7
	Gwr22qV7WirGKZAYK4NarrPQAnglpQwlHjJhD1qQkgx+0y2nbFeFZhQhK5wkfkQlgl5ni0/6StC
	NWgiyobB6WW0jmmB3WME2cv15+AMlmkBVOJExT8S4
X-Gm-Gg: AYBFou1Aj7ajYrVPbWHc9UGUw7T9IVWamia5y3vTl0lLFY/iN8lGFrpNopavWyCYpxv
	8kkHG/7VVEPjxM68CCzYut5qehd8LErPbpO3j1MqJo8GtgA6LY3P6QqxfjuMfqAcPrj5cpRCBWK
	Et4txAySj0N2hK4yxXalWgAZIm87OUSDM8I0lnAuxllg9PZPiYERlQ3EUeU04tmIsqJW6DMTkg2
	vFx0CzR5Ccaq0cSKfsZX7Uj4X+OsToOd7AzBj61ooOSNX7XbpVbByj2YgcaB66eQehmRx10cPzT
	UvWXrNFnpD2QiOtRJP86hP8vhOqLn21d2dBA2VFPTGXva/SBqfzNwRL2
X-Received: by 2002:a05:690e:168a:b0:677:af43:e268 with SMTP id
 956f58d0204a3-677af43ef66mr2978859d50.113.1791130670771; Sun, 04 Oct 2026
 09:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260803135249.2898083-1-wenst@chromium.org>
In-Reply-To: <20260803135249.2898083-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 4 Oct 2026 18:17:38 +0200
X-Gm-Features: AclHuK8AbiOI1d3O1oMAtq-YB9tfgZCN1siOUfw9uTtQBVIHV68l-lLxUKSjvHc
Message-ID: <CAGXv+5FS7gLB7-koaPKMqjtMPjOSWguW9NN_tS+8Wi2GTSHYEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Set supported modifiers during plane init
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_091752_894156_6C63FC52 
X-CRM114-Status: GOOD (  29.12  )
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

Hi,

On Mon, Aug 3, 2026 at 3:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The exynos driver currently checks the modifier in a helper called by
> the plane atomic check helper callback. This check only concerns whether
> the selected plane supports the tiled format or not. This is tied to
> the plane's hardware capability.
>
> Turns out the tiled support was added around the same time modifiers
> were being plumbed through DRM planes. The latter provided a way to
> describe per-plane modifier support.
>
> Add a field to the hardware plane capability struct to allow adding
> an optional list of supported modifiers. This is passed to
> drm_universal_plane_init(). This also allows the core to generate
> and pass to userspace a list of supported modifiers for each plane.
>
> EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
> check is now down by the DRM atomic check.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Any chance someone could take a look at this? This drops some redundant
code.

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 30 +----------------------
>  drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++++-
>  3 files changed, 9 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index b126cd129944..ab0edb826261 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -92,7 +92,6 @@ struct exynos_drm_plane {
>  #define EXYNOS_DRM_PLANE_CAP_DOUBLE    (1 << 0)
>  #define EXYNOS_DRM_PLANE_CAP_SCALE     (1 << 1)
>  #define EXYNOS_DRM_PLANE_CAP_ZPOS      (1 << 2)
> -#define EXYNOS_DRM_PLANE_CAP_TILE      (1 << 3)
>  #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND (1 << 4)
>  #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND (1 << 5)
>
> @@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
>         const uint32_t *pixel_formats;
>         unsigned int num_pixel_formats;
>         unsigned int capabilities;
> +       const uint64_t *modifiers;
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 5c04ef87e400..31f5f0941154 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -174,30 +174,6 @@ static struct drm_plane_funcs exynos_plane_funcs =3D=
 {
>         .atomic_destroy_state =3D exynos_drm_plane_destroy_state,
>  };
>
> -static int
> -exynos_drm_plane_check_format(const struct exynos_drm_plane_config *conf=
ig,
> -                             struct exynos_drm_plane_state *state)
> -{
> -       struct drm_framebuffer *fb =3D state->base.fb;
> -       struct drm_device *dev =3D fb->dev;
> -
> -       switch (fb->modifier) {
> -       case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
> -               if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
> -                       return -ENOTSUPP;
> -               break;
> -
> -       case DRM_FORMAT_MOD_LINEAR:
> -               break;
> -
> -       default:
> -               DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifie=
r");
> -               return -ENOTSUPP;
> -       }
> -
> -       return 0;
> -}
> -
>  static int
>  exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config=
,
>                             struct exynos_drm_plane_state *state)
> @@ -245,10 +221,6 @@ static int exynos_plane_atomic_check(struct drm_plan=
e *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> -       ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
> -       if (ret)
> -               return ret;
> -
>         ret =3D exynos_drm_plane_check_size(exynos_plane->config, exynos_=
state);
>         return ret;
>  }
> @@ -312,7 +284,7 @@ int exynos_plane_init(struct drm_device *dev,
>                                        &exynos_plane_funcs,
>                                        config->pixel_formats,
>                                        config->num_pixel_formats,
> -                                      NULL, config->type, NULL);
> +                                      config->modifiers, config->type, N=
ULL);
>         if (err) {
>                 DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exyn=
os/exynos_mixer.c
> index 69dea5049309..d74e605a452b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -93,6 +93,12 @@ static const uint32_t vp_formats[] =3D {
>         DRM_FORMAT_NV21,
>  };
>
> +static const uint64_t vp_modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
>  struct mixer_context {
>         struct platform_device *pdev;
>         struct device           *dev;
> @@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_con=
figs[MIXER_WIN_NR] =3D {
>                 .num_pixel_formats =3D ARRAY_SIZE(vp_formats),
>                 .capabilities =3D EXYNOS_DRM_PLANE_CAP_SCALE |
>                                 EXYNOS_DRM_PLANE_CAP_ZPOS |
> -                               EXYNOS_DRM_PLANE_CAP_TILE |
>                                 EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
> +               .modifiers =3D vp_modifiers,
>         },
>  };
>
> --
> 2.55.0.571.g244d577d93-goog
>

