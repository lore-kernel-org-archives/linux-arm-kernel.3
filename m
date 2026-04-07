Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7437FFEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=; b=HBfWIE4waBbs8hK0jU0O83G6sy
	DhlXYUkjgLco44SWHYnhkt71iZWYw+c3252CXm4bjepeQDbexSNLqAss3XTacoBCfbQRnbKq0Z40t
	ISXmPv3+wzHilhhLSd86KwTkgP3wnTrj1NXCy8yGDa2IrunpxGs+wbtSyrkF8DvkQGsP1cGRhfeFv
	vG+Y6sflMmcExPNPc7h+VC3Z/2UObUXCqn8DIjXgi+eIxX05Y7yZC9Bi5p5EPPQgFwlPoN6w9s+Lo
	2oFR3I1WYRIQC0xTgPu7xyRFfWoTXGSu80E3fui/8mmi76kC1+NHzwXd9hYWg3ib7HHlxRtYdAY9y
	isBDV03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7ey-00000006dz8-1VsC;
	Tue, 07 Apr 2026 14:44:08 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7ev-00000006dxu-1miw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:44:06 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-89f1e767f92so47464626d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775573044; cv=none;
        d=google.com; s=arc-20240605;
        b=RgJZyodCPsVZvDGwBQnZsNQudq1+5VjUcdhHeXDYMIwcXSl+IHbcQWz7dTS/DkPLVI
         ERdJm7Mr4Uf8jgpUxNYKzfLRvDvxUz4/DzJzE0E3JTGz/fR9PsXTCkxabQI5yGlHS13J
         9Du3/sFI4uvQvoHk72FAOYGOYV3iMVD1UmnRMyqFcFYRS8LGH1KExg9KqLze6WpOrCm1
         1j0EUxmui47yq9YXrSQRrfYLVji52xvy1P4nHj9yPkRbvenI0Rcyhw+9LBkp85W649Ic
         Vq0fsR/nsfsWwqxPDkLasawMeLQ9xYYNcZcthqq7qv5FtH/q1NJNmEjkr7rHQqTll67k
         +XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=;
        fh=yiy6oJXSZ76qrqmeKXiiT11Nz8Bwn0Olz77E1Dlzr2o=;
        b=jpayAbbJ1HCIRJOdnGiNTiL0tUfthip3GvzU5DRErJlUYU2Dlt2BJO2Zu/ZZPEGsOc
         AMcnIiMrkTqkrFJuRIj9bmB85R30X7l1VPyFuJPxOv1IiTnCnrL1A8LykK8PT8u2veVL
         dKnAbol2CZcievgdiLBob75LeV4iKfOLSsPKWmU8RJyzOo9NekBIBSb6eaLPeS3yxcrd
         FaoW41kmM9v8qBmTvUZFH2AJMtibmDKJ1HPdrh9SD/6p+HWDrHam5UHBaSJZWFjjutoi
         3YE16LF0169k6DztDhBeGxWkrd1eqEg4ukgMswXj9op3051vDhfotoYPY7ldfFFdf0io
         G4fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573044; x=1776177844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=;
        b=XgcltCTWUgaqSygm3Sr6hBWjsaESAAPIMa8kLyw4RLBpinyRz2n8ZIkOTq3SnqZ0Pq
         2nQ+udtMmyALXTcsa2HUkyaM15Gp5gupcRmGeg3zbROeH5QAfl4Aql5Mxuya2y72UDmu
         XwBircOntaFTlIk4yzk3oqQG1OcnYDuqovfUS+Zx5IIZPCMqAuCrr0ldWmQeRwo7Lufj
         ZOhbyeOEw9hvGlIvOQq/pMnFhMhqEEp8HBccjzCxTwQ2iyNpEJe1DN3fi7OG9lSngzk2
         boVXeRA7yRHnYExwD+4C4OEEdUa+oDV9gDhBbC7YvbQm1/y1zAFF9VLNCtA9Syvt/1gv
         BCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573044; x=1776177844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zl+ybDcUVtik8d9nb2gVdt0WS3xrV20DIN3DouokInQ=;
        b=nvDbHDVeX0IqklXzxo+s14DK6NiPbvMpLPpTlNLj9qeqN28nVtQ3OpaoS0SQCokrDH
         OnEZ433NgWa0PkY9NM6jz/nFSAzjgn0nuM30BO1gxVDcH76sG9DmJmHRHN27ZeIwZvH8
         2mjtRDnkuuM7Jov3/pfwRypp7+hhGjuYT1krfiCQRpfVMUC7dpSuh/c9n2wZViIxpgZD
         xVgSbgy/TLjvf2LZZbEGlLeGB59L64uO2ebeHmCY1Mlngq3tHvuYNhf+aK3z3NR7AAJs
         KhmKTNV656j2qXbtKoHzEEb7d1YywPlsyTVExt677r+BwKvY5+3vyzvCyRFoHp6pZegi
         0w3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUBIcwAsZ9twBPcrFKYjiXmi9nHIBDnQH68St9SHHBnkKYZ9IkLBXBlQcpjsBqjRQvtWghNvtuMnScu2jZhp/Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq1CIR/8EeWEoESJ1Wbh4Mdje/k3sxq4hFSqRvmnX2bfN9L2ui
	JMk7rpXM/zGVAvNJspAcMhvduEiNxw8EUJWVnMF905AZEyqTYfvKK//goqEhzXuKrZWkEeaAC5P
	L4y5Bbb905697gEtGRHPGj6qyhyptpyQ=
X-Gm-Gg: AeBDiesIq9jy8nT5RHRvY/U9qkSbUquhsxY1xvTQ3Zc3nng2MfSkyUlg+GiH8qteJ9w
	vRqPDWSIHF97GLcFwtp0ZVU5CukApaAAmAR7XMYrH8L/lZM2q+WAADgeBjNxgZktvyQbGI/ohRZ
	wZolTMY0oq9FBZDo9NzZypiohCxgqZCTUkU41sAKc+OLoMk29Uo2JWHrKIPVDMdry++e7ggwaxP
	G+nvLtAgn37eBcxrOdHLZ4TKQa+UvglAO6mU7ak8aZrhP1wKpOAyOeMmRgALk/J1Y3hwnP4RcBq
	LuY6xQ==
X-Received: by 2002:ad4:5bc3:0:b0:8a5:fcce:4c with SMTP id 6a1803df08f44-8a7043edff1mr287526516d6.27.1775573043645;
 Tue, 07 Apr 2026 07:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org> <20260326094308.1161335-3-wenst@chromium.org>
In-Reply-To: <20260326094308.1161335-3-wenst@chromium.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 7 Apr 2026 23:43:26 +0900
X-Gm-Features: AQROBzBGt340ZHEJc4Xn02uKsIv90vik5xWrVoDE6tBxFh2VJoHTruSbBo3C7_4
Message-ID: <CAAQKjZM5NC6svNX=7QpXzsfS-xAsCV2GdLDDdSTDpArwqg=o7g@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/exynos: Use DRM core dedicated DMA device
 tracking facility
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_074405_511275_3F944B7E 
X-CRM114-Status: GOOD (  23.49  )
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

2026=EB=85=84 3=EC=9B=94 26=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:51, C=
hen-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The exynos driver tracks a dedicated DMA device in its private data.
> The DRM core already has facilities to do this, and it is integrated
> into DRM PRIME imports and GEM DMA helpers.
>
> Convert the exynos driver to use the core's dedicated DMA device
> tracking facility. Also get rid of exynos_drm_gem_prime_import() as
> it is identical to drm_gem_prime_import() after the conversion.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++++-----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |  8 --------
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 11 +++++-----
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 27 ++++++++++---------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
>  6 files changed, 23 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dma.c
> index ccc6b852ee7d..734741c80cbe 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -8,6 +8,7 @@
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
>
> +#include <drm/drm_device.h>
>  #include <drm/drm_print.h>
>  #include <drm/exynos_drm.h>
>
> @@ -41,7 +42,7 @@ static int drm_iommu_attach_device(struct drm_device *d=
rm_dev,
>         struct exynos_drm_private *priv =3D drm_dev->dev_private;
>         int ret =3D 0;
>
> -       if (get_dma_ops(priv->dma_dev) !=3D get_dma_ops(subdrv_dev)) {
> +       if (get_dma_ops(drm_dev_dma_dev(drm_dev)) !=3D get_dma_ops(subdrv=
_dev)) {
>                 DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IO=
MMU\n",
>                           dev_name(subdrv_dev));
>                 return -EINVAL;
> @@ -93,8 +94,8 @@ int exynos_drm_register_dma(struct drm_device *drm, str=
uct device *dev,
>  {
>         struct exynos_drm_private *priv =3D drm->dev_private;
>
> -       if (!priv->dma_dev) {
> -               priv->dma_dev =3D dev;
> +       if (drm_dev_dma_dev(drm) =3D=3D drm->dev) {
> +               drm_dev_set_dma_dev(drm, dev);
>                 DRM_INFO("Exynos DRM: using %s device for DMA mapping ope=
rations\n",
>                          dev_name(dev));
>         }
> @@ -109,7 +110,7 @@ int exynos_drm_register_dma(struct drm_device *drm, s=
truct device *dev,
>                         mapping =3D arm_iommu_create_mapping(dev,
>                                 EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SI=
ZE);
>                 else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> -                       mapping =3D iommu_get_domain_for_dev(priv->dma_de=
v);
> +                       mapping =3D iommu_get_domain_for_dev(dev);
>
>                 if (!mapping)
>                         return -ENODEV;
> @@ -135,5 +136,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
>
>         arm_iommu_release_mapping(priv->mapping);
>         priv->mapping =3D NULL;
> -       priv->dma_dev =3D NULL;
> +       drm_dev_set_dma_dev(drm, NULL);
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 2101a74dc1ed..9ee30086879f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -109,7 +109,6 @@ static const struct drm_driver exynos_drm_driver =3D =
{
>         .open                   =3D exynos_drm_open,
>         .postclose              =3D exynos_drm_postclose,
>         .dumb_create            =3D exynos_drm_gem_dumb_create,
> -       .gem_prime_import       =3D exynos_drm_gem_prime_import,
>         .gem_prime_import_sg_table      =3D exynos_drm_gem_prime_import_s=
g_table,
>         EXYNOS_DRM_FBDEV_DRIVER_OPS,
>         .ioctls                 =3D exynos_ioctls,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index 06c29ff2aac0..1ab7195d09ae 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -198,7 +198,6 @@ struct drm_exynos_file_private {
>   */
>  struct exynos_drm_private {
>         struct device *g2d_dev;
> -       struct device *dma_dev;
>         struct device *vidi_dev;
>         void *mapping;
>
> @@ -208,13 +207,6 @@ struct exynos_drm_private {
>         wait_queue_head_t       wait;
>  };
>
> -static inline struct device *to_dma_dev(struct drm_device *dev)
> -{
> -       struct exynos_drm_private *priv =3D dev->dev_private;
> -
> -       return priv->dma_dev;
> -}
> -
>  static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
>  {
>         struct exynos_drm_private *priv =3D drm_dev->dev_private;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_g2d.c
> index 348603262af0..85a3a247dfca 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -20,6 +20,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
>
> +#include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_print.h>
>  #include <drm/exynos_drm.h>
> @@ -278,7 +279,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
>
>         g2d->cmdlist_dma_attrs =3D DMA_ATTR_WRITE_COMBINE;
>
> -       g2d->cmdlist_pool_virt =3D dma_alloc_attrs(to_dma_dev(g2d->drm_de=
v),
> +       g2d->cmdlist_pool_virt =3D dma_alloc_attrs(drm_dev_dma_dev(g2d->d=
rm_dev),
>                                                 G2D_CMDLIST_POOL_SIZE,
>                                                 &g2d->cmdlist_pool, GFP_K=
ERNEL,
>                                                 g2d->cmdlist_dma_attrs);
> @@ -311,7 +312,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
>         return 0;
>
>  err:
> -       dma_free_attrs(to_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SIZE,
> +       dma_free_attrs(drm_dev_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SI=
ZE,

to_dma_dev returns only the dedicated DMA device explicitly stored by
the Exynos driver, whereas drm_dev_dma_dev falls back to the DRM
master device when no dedicated DMA device has been set. So this does
change the existing behavior, but it does not look problematic to me.

Thanks,
Inki Dae

