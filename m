Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7FAE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 13:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnYCjr5LIRB+CieS4m1jkYQ54cCCfEv2N3mZy9H8kOM=; b=HcybuVqZO9n2DLy7G5HOTnh0JD
	wsQmpEEOG2I7dYdHgxQIIgIDuUzgjEO4hRE8p+i38RuqChQOG8/WoCr0ieVzIlgbqMhwtqqhrksmg
	uDwVjLji1XhzBE7KSaidoV0wPVm0vjZlwzK+9lUCnuEKgoT2/3ZzhIL2XTsRby744fr9odMsEneTB
	GOP+UqFl6rJ0BIYEYJVxyVw5dLvqZjXeBlhkrZU7T2Nfp1alg7YJV3fRbfqk5wbX8D2kxiQAwqAy1
	o+JFOdQyrl3OI8jnmCIrEsKQ9vv2dq8ZqD/fzU7/FxrJth6cn8QI3qf4Rkjl+kEtjZ+JYiqILhsD/
	nkZemRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRFc-0000000DqTI-1tED;
	Wed, 25 Dec 2024 13:16:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQREQ-0000000DqKG-1g85;
	Wed, 25 Dec 2024 13:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20B015C5C19;
	Wed, 25 Dec 2024 13:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB98C4CEDF;
	Wed, 25 Dec 2024 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735132519;
	bh=iHNXmu5hs74pFvfsdpshztzJ+D6rhXCuoqhaimsHvmY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NXBQvQJJLikx+b/hTw3s80MoGdqCU+PITzyGU/yke0hUnsW/RhnhHmX3iKvJUk41X
	 G6KpomoVFGKR+i30srRJRE97BMMslh8kCcWVIqpMGTN8WbjXO5QTMIzhhOGtgTy3eI
	 MCLQdgg3EZtXVHQ+PIzWBTtt5NyWqPiTcq0QHQtIqKNG4TQsgTjgWywFQM6lbVX3nL
	 aE3Cu+ROEpOxgbrY/2JRuDqwBhMaQjbUkprCqZmHzEYnVq06Bao/Svd7Q68ezv4T1E
	 vOn1O7m7mFjxN2ev5/Qy+Tq29CKtzHBLqf3eHQtOqAV6XtcPfEt3TlwfW1r9MEa2yi
	 JiHCrnnAJe9Wg==
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f441791e40so5427284a91.3;
        Wed, 25 Dec 2024 05:15:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuFWbuxMqBCoAcV2EZarZVis5Pa7h6rNUeBLqxrr7QGferUHx8rdiNTH8Eqi0UrqFlymDGP4cjKHa10uC0sJ8=@lists.infradead.org, AJvYcCW9Sn67GgrLMLCqXx3IdXVHYatwc8axAME2IvZhKDuxhFi1IYbyshHDim7RfO785g1qMfJPHZHbvJdvXXujEZ83@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/2GwHTTWZHXZXRnzogqJCp0UUxOpActIm/UpLzWhuBbjxjDWR
	0qPguMlMfsAQlLIDopKZYLk8M7fkhaKt8Jt0PJRcuNuE1f52t3BEAKwRSBMelpZLiW03BzMT/Jj
	nK50GPNF3SGj+ADpU+QRbkgaO+w==
X-Google-Smtp-Source: AGHT+IGvamxpRBkZPcG2USKxFycGzg9VcxRlTaAg4CDy0ih+TDctQVqL/wUXOKCLhbMvK94H0+QSz4jrQBTqKUvOH2k=
X-Received: by 2002:a17:90a:da8e:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f452ec37a0mr26874950a91.25.1735132518901; Wed, 25 Dec 2024
 05:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 21:15:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VcgTktusqpoNsx0JbwvKP=CPBc8M_YyQHa1cj+s_wrw@mail.gmail.com>
Message-ID: <CAAOTY__VcgTktusqpoNsx0JbwvKP=CPBc8M_YyQHa1cj+s_wrw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, sui.jingfeng@linux.dev, 
	ck.hu@mediatek.com, amergnat@baylibre.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_051522_540772_AD80B836 
X-CRM114-Status: GOOD (  19.19  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B411=E6=9C=8812=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The struct device_node *next pointer is not initialized, and it is
> used in an error path in which it may have never been modified by
> function mtk_drm_of_get_ddp_ep_cid().
>
> Since the error path is relying on that pointer being NULL for the
> OVL Adaptor and/or invalid component check and since said pointer
> is being used in prints for %pOF, in the case that it points to a
> bogus address, the print may cause a KP.
>
> To resolve that, initialize the *next pointer to NULL before usage.
>
> Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for displ=
ay paths")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

I would like you to fix this warning.

WARNING: Reported-by: should be immediately followed by Closes: with a
URL to the report
#19:
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>

Regards,
Chun-Kuang.

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 9a8ef8558da9..bc06c664e80f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct devic=
e *dev, enum mtk_crtc_path
>                                          const unsigned int **out_path,
>                                          unsigned int *out_path_len)
>  {
> -       struct device_node *next, *prev, *vdo =3D dev->parent->of_node;
> +       struct device_node *next =3D NULL, *prev, *vdo =3D dev->parent->o=
f_node;
>         unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] =3D { 0 };
>         unsigned int *final_ddp_path;
>         unsigned short int idx =3D 0;
> --
> 2.47.0
>

