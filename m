Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D681DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2Ct0/bWmZg0045LkT8XFFR+cuxnWwmmUDTjfb+QZ+I=; b=4UtuEabxgzPBdIsKeuvAgHYEpv
	WyR6fASrlYOCzaX52z2arx2y9ML2eRNdG1ytu3UFJddi/W4gkueVTTnYsWFc3OHAFwLwMgZiXQG9n
	v1Igx9teO+MJFEKaJ9tc8Qdn/jB3uHvOa4LCW5CoyxNauN5Sm3994lrTFu6RAAsNnrJsMW+hcXBHn
	M/tgg3t3ASf87otz5TIS0UgopYarRIcgTxtarcJHuwTreLhZxsw81U/MIyt4cwUl/69MutCSPfCWw
	dcAKooHN+fjyncmYxSqoEsipW1D8k6FHjuad9fPJMCeUarWjNfqFIUCGeWAnFSyMT60PbasEumQua
	GX2mHlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCQ60-0000000AOsH-0Pxw;
	Thu, 01 Oct 2026 23:21:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCQ5z-0000000AOs0-0zNH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 23:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C110601FA
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 23:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E7B1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 23:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790896904;
	bh=P2Ct0/bWmZg0045LkT8XFFR+cuxnWwmmUDTjfb+QZ+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=irsRZx/rUn8ekK7xjNdMO80DWdGYFaYugnQMl5sRWn7m2pV9I2vJ1Ap+zQGt1x195
	 cTOx8M/PbUhX3ZGB7gUxBdtMXei6YxJqdToJnv+E1SiO5k1SuP74CvIqLQlnX5779k
	 Tc4eoyJmBPwloGo2xVVF4jJYu6gSCq94GfTiSFjUnH31mvxyfFM/uJPXK59zLtHxBN
	 kXSWO3IEwu4BQ2jJXgrxB6obga3x3MARbG0TiMkJ4h3CPP0xpTWougE+2Cd7SpgFmL
	 JPQvxPKM8tTRR1qq2M00TCGZQ2yDSNWJKn5kGYvF1fhlWw8b2LAxhZij3rQ+sTiiMt
	 mxgikEgDNtvGw==
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bb8b31660so2179505eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 16:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwCQpRjCV81MMd6OCiMxyusWLgcW2du9iX4CO/d8VV8/kC4yMm0QYdCmFftSvdwkaJINiqcvUTfkC3BagZKkEO@lists.infradead.org
X-Gm-Message-State: AFuF++kHIoUfGG8c55CSw8yudD2EJwvYVM1N6AhE3NwpSbFBkKF/H5P8
	pdWEDUKYBjPeR0o3QZW6Zvg/ODiJxYB1B9pUqOINpyP5pju8ZmpFnMts+pC1C5eb30J8fsK+MxR
	p8WoTVVa6ohUpZsSG78NMmHsaqQgsYw==
X-Received: by 2002:a05:7022:f515:b0:143:297c:82e0 with SMTP id
 a92af1059eb24-14f5bffa779mr757615c88.32.1790896904343; Thu, 01 Oct 2026
 16:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260921131156.403652-1-lgs201920130244@gmail.com>
In-Reply-To: <20260921131156.403652-1-lgs201920130244@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 1 Oct 2026 23:21:30 +0000
X-Gmail-Original-Message-ID: <CAAOTY__kLYfpbyD+nQOmdGPu8Qm_aC5BjsOQzYGVnQvD0WGP_Q@mail.gmail.com>
X-Gm-Features: AclHuK-E9VLgmUd_-lnnf9Q-aBBowJwr-pxvO9-FXnzpDzOztdORiwXC2sJecYk
Message-ID: <CAAOTY__kLYfpbyD+nQOmdGPu8Qm_aC5BjsOQzYGVnQvD0WGP_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix ovl adaptor platform device leak
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Nancy.Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Guangshuo:

Guangshuo Li <lgs201920130244@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=882=
1=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:12=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> mtk_drm_probe() creates an OVL adaptor platform device with
> platform_device_register_data() when the display pipeline requires the
> OVL adaptor.
>
> If a later initialization step fails, the probe error path releases
> the DRM resources without unregistering the already registered OVL
> adaptor device. The normal remove path likewise leaves the device
> registered after the DRM driver is unbound.
>
> Keep track of whether the OVL adaptor was successfully registered and
> unregister it on probe failure. Also recover the platform device from
> the stored DDP component device and unregister it during normal
> removal.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index c86a3f54f35b..d176e6496aa7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1060,7 +1060,7 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>         struct mtk_mmsys_driver_data *mtk_drm_data;
>         struct device_node *node;
>         struct component_match *match =3D NULL;
> -       struct platform_device *ovl_adaptor;
> +       struct platform_device *ovl_adaptor =3D NULL;
>         int ret;
>         int i;
>
> @@ -1205,6 +1205,8 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>  err_pm:
>         pm_runtime_disable(dev);
>  err_node:
> +       if (ovl_adaptor)
> +               platform_device_unregister(ovl_adaptor);
>         of_node_put(private->mutex_node);
>         for (i =3D 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
>                 of_node_put(private->comp_node[i]);
> @@ -1214,9 +1216,15 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>  static void mtk_drm_remove(struct platform_device *pdev)
>  {
>         struct mtk_drm_private *private =3D platform_get_drvdata(pdev);
> +       struct device *ovl_adaptor_dev;
>         int i;
>
> +       ovl_adaptor_dev =3D
> +               private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev;
> +
>         component_master_del(&pdev->dev, &mtk_drm_ops);
> +       if (ovl_adaptor_dev)
> +               platform_device_unregister(to_platform_device(ovl_adaptor=
_dev));
>         pm_runtime_disable(&pdev->dev);
>         of_node_put(private->mutex_node);
>         for (i =3D 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
> --
> 2.43.0
>

