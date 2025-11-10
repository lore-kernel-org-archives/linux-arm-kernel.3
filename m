Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000ABCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ7LYF5rARcfLsBpxePOybR+1y8/o3ZLz4XlyN978+M=; b=I+Z54rlCzNH2sWqOl+Ynuv76GM
	6ElyjscyOvPBAD5r132GqDOEoyfSFqBQf/w4Gp0sFF/YlKWScWRatw+wjR/iQRqb+1Blcj0h/65hu
	w0GBSnm5JfhvSxQbI7PzqpEHa1PHsD2FZ79qCFE4kQXaxRWsvz37tiK2ndA43bbYGG9jaU9p0PeWM
	dq7U3JrtpG3nT00d0+6AVGujKkt7waLHcIBUT9uEjjX1g2pLlu5jGuvm/Zl72RBQm5aOOCWQ/jQ/E
	3scYTQhWEKrTDQi0UuTOnHpS8xOUQ4cKzXfYE8vkVRrpI+imBzHkrsF5eGKXbXMDxg2XOvXP4BMU5
	8rnfwacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILec-00000004qk8-3B0V;
	Mon, 10 Nov 2025 06:45:30 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILeW-00000004qjb-3dIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 06:45:29 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-93722262839so1097451241.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 22:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762757123; x=1763361923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ7LYF5rARcfLsBpxePOybR+1y8/o3ZLz4XlyN978+M=;
        b=GwWwQouo91kwKlymB1ivyESwDUH9OGwgNSbXvsAoKwBYAovG9jt/fS/1xfQyxdYxdG
         m2W+M94A+EkhOWKcvrrW+O7KUmPn09abwmCZDuTjkmLNKLajDCiITsVnGf593lKkY9Yd
         8ElvhbfXJ3+tFZ0mmxdZeMJUZTk6VFdhHJ1b5yrolALEHR/9jH12b6zFnSy1RYm0+d70
         kFmhPFId3Q79abrFkGC5zmfj9QC1KJQDY+0Ghdt8syMRHyU2B2MC879PGpnsw3cf62Mi
         Lw1E7/Vd1YX4rHELERdJ02TBOGlgj0Dn15E9TBCWrjtTmj2BMEptvLrxy7OBGq16k/A9
         1qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757123; x=1763361923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJ7LYF5rARcfLsBpxePOybR+1y8/o3ZLz4XlyN978+M=;
        b=Kit2W5N4X0oZaBowKXKR98i9cpDLbYpyMRhiJltXVl07jBA/XZSGYaahOS5epoHXL2
         IhWZsZvf+GnhP3vi72FYYiLfOgGnKvXPqWW5Gjts8O+xiYjTe8VszV2CO6nwtZ1tosPZ
         vjTUFFnPJ17hBrs9LVE+gHdPFAqz6BERPelNZZS1D3eaT829ZePluWkoeA9D8lK4q0wo
         0/FX6NiXl1iisL8CBIjBDh1nVckqKQMI2Th1uo1owLzqkSpZTAoH2E4ea1EjmQb1gIWS
         YSMZmNGWTotM+TryoauxzjnK/8zUdkIXNYTmKxnRBpkSXp6tXTNOCYWfXkiPldGRr1x9
         xUcg==
X-Forwarded-Encrypted: i=1; AJvYcCUomdxi6zZ2TD+fX0uMycUorohtIcShE3U6Lmu4RnsrInMzeWhdoZVd+gWE/WnkznaVAWZXROs2UFkF0S1wPuiM@lists.infradead.org
X-Gm-Message-State: AOJu0YziLHYh34S8O/X+n4giZwCVYB/60YpWM8C9El4Ot/rx99Xkd2BQ
	2g4R0czslvIoDQKUpoAITr1+ADyefW6CTfnqb19RuXnYuYPJTktiLThsj0ZXoAxC4ur9YAi9r+r
	fUEyPvLZIzvGpevRTDKWir70571ntu8E=
X-Gm-Gg: ASbGncvt5mqegROuEtn+xRHD9JPFreoebUsXWmpvgged1HJRXOK7Hx3/G/Y9lrs7UWn
	e14JExGckIIm/VFjd9Iy7HVZU1Gg+qY+Kxv6Og5np0tGRFBjQ2lAWk/iCvu84XfisyZre5ChpJ6
	up/y/IXdysMdiL/bqQ0p7+RZW/SV0Z4TUSi7bLw+zPYkPVu+IFa4ioMtZbqmre7XvKEmcPeIXd6
	lVXn5tM4JzJ1w/KwsSN+2xeL0cmopzSbWdf+UJTD6XOziEEXHsTygrqmM9IkAL8qQNWDQ==
X-Google-Smtp-Source: AGHT+IF+gs9QIahGISXKJRHjGuXprvZlDgmBa+ZvpM71d+5sssU4cyVVLoFXELWcuPET2oDoTXg/lkyadapsy4GEvcw=
X-Received: by 2002:a05:6102:c51:b0:5dd:a69a:b935 with SMTP id
 ada2fe7eead31-5ddc468ea63mr2373148137.16.1762757123612; Sun, 09 Nov 2025
 22:45:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-4-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-4-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 15:44:46 +0900
X-Gm-Features: AWmQ_bnm9xQ99kNtPGcygx_UKQxpZ_ctsO76xXZQ0SPcCmu0BnofZ2Xoq2-JZF4
Message-ID: <CAAQKjZMDe-nXN14qQQTHR9HMwqCcbTospjMg_P98G0e=XAO5NQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/exynos: Move mode_config setup from fb.c to drv.c
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_224528_714455_72AE70DF 
X-CRM114-Status: GOOD (  24.44  )
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

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:29, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Relocate exynos_drm_mode_config_init() and the mode_config funcs/helpers
> from exynos_drm_fb.c to exynos_drm_drv.c, and invoke
> drm_mode_config_init() from inside exynos_drm_mode_config_init().
>
> Rationale: resolve the historical fb.c placement, align with common DRM
> layering (mode_config is device-wide policy that belongs in the core
> driver), and make initialization order explicit before creating KMS
> objects and binding components.
>
> No functional change intended.

This patch looks fine to me.
However, since the second patch should be applied first, please repost
them as v2.

Thanks,
Inki Dae

>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 47 ++++++++++++++++++++++---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c  | 34 ++----------------
>  drivers/gpu/drm/exynos/exynos_drm_fb.h  |  7 ++--
>  3 files changed, 49 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 1aea71778ab1..6362cd417a4e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -233,6 +233,43 @@ static struct component_match *exynos_drm_match_add(=
struct device *dev)
>         return match ?: ERR_PTR(-ENODEV);
>  }
>
> +static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helper=
s =3D {
> +       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs =
=3D {
> +       .fb_create =3D exynos_user_fb_create,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int exynos_drm_mode_config_init(struct drm_device *dev)
> +{
> +       int ret;
> +
> +       ret =3D drmm_mode_config_init(dev);
> +       if (ret)
> +               return ret;
> +
> +       dev->mode_config.min_width =3D 0;
> +       dev->mode_config.min_height =3D 0;
> +
> +       /*
> +        * set max width and height as default value(4096x4096).
> +        * this value would be used to check framebuffer size limitation
> +        * at drm_mode_addfb().
> +        */
> +       dev->mode_config.max_width =3D 4096;
> +       dev->mode_config.max_height =3D 4096;
> +
> +       dev->mode_config.funcs =3D &exynos_drm_mode_config_funcs;
> +       dev->mode_config.helper_private =3D &exynos_drm_mode_config_helpe=
rs;
> +
> +       dev->mode_config.normalize_zpos =3D true;
> +
> +       return 0;
> +}
> +
>  static int exynos_drm_bind(struct device *dev)
>  {
>         struct exynos_drm_private *private;
> @@ -257,9 +294,9 @@ static int exynos_drm_bind(struct device *dev)
>         dev_set_drvdata(dev, drm);
>         drm->dev_private =3D (void *)private;
>
> -       drmm_mode_config_init(drm);
> -
> -       exynos_drm_mode_config_init(drm);
> +       ret =3D exynos_drm_mode_config_init(drm);
> +       if (ret)
> +               goto err_free_private;
>
>         /* setup possible_clones. */
>         clone_mask =3D 0;
> @@ -272,7 +309,7 @@ static int exynos_drm_bind(struct device *dev)
>         /* Try to bind all sub drivers. */
>         ret =3D component_bind_all(drm->dev, drm);
>         if (ret)
> -               goto err_mode_config_cleanup;
> +               goto err_free_private;
>
>         ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
>         if (ret)
> @@ -296,7 +333,7 @@ static int exynos_drm_bind(struct device *dev)
>         drm_kms_helper_poll_fini(drm);
>  err_unbind_all:
>         component_unbind_all(drm->dev, drm);
> -err_mode_config_cleanup:
> +err_free_private:
>         exynos_drm_cleanup_dma(drm);
>         kfree(private);
>         dev_set_drvdata(dev, NULL);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.c
> index ddd73e7f26a3..c118a079d308 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -8,8 +8,7 @@
>   *     Seung-Woo Kim <sw0312.kim@samsung.com>
>   */
>
> -#include <drm/drm_atomic.h>
> -#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_modeset_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_fourcc.h>
> @@ -93,7 +92,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
>         return ERR_PTR(ret);
>  }
>
> -static struct drm_framebuffer *
> +struct drm_framebuffer *
>  exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv=
,
>                       const struct drm_format_info *info,
>                       const struct drm_mode_fb_cmd2 *mode_cmd)
> @@ -150,32 +149,3 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebu=
ffer *fb, int index)
>         exynos_gem =3D to_exynos_gem(fb->obj[index]);
>         return exynos_gem->dma_addr + fb->offsets[index];
>  }
> -
> -static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helper=
s =3D {
> -       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> -};
> -
> -static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs =
=3D {
> -       .fb_create =3D exynos_user_fb_create,
> -       .atomic_check =3D drm_atomic_helper_check,
> -       .atomic_commit =3D drm_atomic_helper_commit,
> -};
> -
> -void exynos_drm_mode_config_init(struct drm_device *dev)
> -{
> -       dev->mode_config.min_width =3D 0;
> -       dev->mode_config.min_height =3D 0;
> -
> -       /*
> -        * set max width and height as default value(4096x4096).
> -        * this value would be used to check framebuffer size limitation
> -        * at drm_mode_addfb().
> -        */
> -       dev->mode_config.max_width =3D 4096;
> -       dev->mode_config.max_height =3D 4096;
> -
> -       dev->mode_config.funcs =3D &exynos_drm_mode_config_funcs;
> -       dev->mode_config.helper_private =3D &exynos_drm_mode_config_helpe=
rs;
> -
> -       dev->mode_config.normalize_zpos =3D true;
> -}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.h
> index fdc6cb40cc9c..0c79ce5d4a8d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
> @@ -19,8 +19,11 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
>                             struct exynos_drm_gem **exynos_gem,
>                             int count);
>
> -dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)=
;
> +struct drm_framebuffer *
> +exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv=
,
> +                     const struct drm_format_info *info,
> +                     const struct drm_mode_fb_cmd2 *mode_cmd);
>
> -void exynos_drm_mode_config_init(struct drm_device *dev);
> +dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)=
;
>
>  #endif
> --
> 2.34.1
>
>

