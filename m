Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F04CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 23:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syRoK2LSa4q4HkYqz7cZTfQqr9eMv3CfkuHnLwIdEBw=; b=T7lr+lzuctYd1O/SoaSruJB5IQ
	4DZFFeVVCA3bCGKky2a+OZSzTpV0qr3Y4wP8cypYMY0G05JZtBadtckLe44sMCYqPdxO6xs1AXuMg
	RX/bWwtlsr4717jLKeGhgSio8JIe8igVk2momgRtA0Rnhjh18oUmntJYMWs2VZCn4mmbkFuPVvMrG
	VBKBxfr2RMe2Sbxc1tUIpoFm3YdrY4tMBL9B01+Ly1/8IgeMDeFrsUTL4IzT/YHZPc0HRaoEujzFy
	LC+grhlB14qAy9Qv5GOSACiWk7vqbRnL7FKN5577na1RNvtY4gU0q+hu9qvQ/BM4NYdDoWsC0bawR
	w2HQ1Ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un45s-00000003ixs-3zbF;
	Fri, 15 Aug 2025 23:44:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un41I-00000003iU2-0qZP;
	Fri, 15 Aug 2025 23:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FB295C6EB0;
	Fri, 15 Aug 2025 23:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB2EC4CEF7;
	Fri, 15 Aug 2025 23:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755301174;
	bh=wwsSHz9qW4HM4CvVm/6W9nFKkjnMGwSQT3gsML0+kno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dy5EWzxg3q5jZyEc5bv6P/Z/DH5Vm/gvVQ0KzBdqG+h1UraLcJ8bGvDiOcUn4VHMJ
	 OBiOzwv6iYzGc+ff50s+zlr/kuPqVtu+58RJEjX0iZBMAHUdf+3HM7zt2TNN2Xt+DH
	 fX9YhxVams39HItzisR90HZNfVerp3x6a08dcDaYc+ycuNvuU8k08VlxKF5vfX38dM
	 mkeL5gKMG7U4YJ2CIRHw81q63OW3ZOJv0CioArMqRGdDMAJ93JjaVnO7xaSlzP0y0u
	 ghEBAvASk9dewqo1XESgz6X/oFzMR/A4Tucw9C2mDpGeP6WdQ/OmMfLvpWhRnrxuRa
	 PiAxzLrryxguQ==
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4717563599so2121808a12.3;
        Fri, 15 Aug 2025 16:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTe1+ijHSfY2VgbGTQWKZyKxAVkCRnOL5U99d+W2lLDqJqLX25/yoyBSiQ1eUF/7N8NpZcM1s2Nwmu3QLk3ao=@lists.infradead.org, AJvYcCUtpoKRvD+T/qjApOYz54/cUePfdZhWpSLyTqgkEh0im1isgQgUJFtmy63rNj0b2/fLD5Sr2+TEkosFmGv7EPCh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3fNeHNK8x56cenJCgmHcf1f4xM9HzfOvix4IYDMHskgx/xVXy
	K1mpbFGAGWh5d8QHSbBwSlmMRAlpM8uJ7Fm21uu+JINR/kSKNCIDAFtggUs3SHpl8lMzqW0paar
	zxDyVxlcImUCcNl6pyWYOCoEpBnnI3A==
X-Google-Smtp-Source: AGHT+IF3UhjPzI/NY7tWC6HSMCDlAaXInyJ/IGmu2yTEf5VazKwog6umahYLBkhkXktfxZh67B39CKu2Ii3gsJIura0=
X-Received: by 2002:a17:903:b87:b0:240:80f:228e with SMTP id
 d9443c01a7336-2446d93d8dbmr54840315ad.52.1755301174432; Fri, 15 Aug 2025
 16:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250812071932.471730-1-make24@iscas.ac.cn>
In-Reply-To: <20250812071932.471730-1-make24@iscas.ac.cn>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Aug 2025 07:40:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_91C=5YDk1qcU3Dir6TqtN17kgjzTzr=XYRNPHGvQwSgA@mail.gmail.com>
X-Gm-Features: Ac12FXzKVkel4FRxgngT7H7BLJAi1wo2-ssfsabNu9COZ3np_6DfRlSEuXQhYKk
Message-ID: <CAAOTY_91C=5YDk1qcU3Dir6TqtN17kgjzTzr=XYRNPHGvQwSgA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
To: Ma Ke <make24@iscas.ac.cn>
Cc: ck.hu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_163936_325752_3470F263 
X-CRM114-Status: GOOD (  18.14  )
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

Ma Ke <make24@iscas.ac.cn> =E6=96=BC 2025=E5=B9=B48=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Using device_find_child() and of_find_device_by_node() to locate
> devices could cause an imbalance in the device's reference count.
> device_find_child() and of_find_device_by_node() both call
> get_device() to increment the reference count of the found device
> before returning the pointer. In mtk_drm_get_all_drm_priv(), these
> references are never released through put_device(), resulting in
> permanent reference count increments. Additionally, the
> for_each_child_of_node() iterator fails to release node references in
> all code paths. This leaks device node references when loop
> termination occurs before reaching MAX_CRTC. These reference count
> leaks may prevent device/node resources from being properly released
> during driver unbind operations.
>
> As comment of device_find_child() says, 'NOTE: you will need to drop
> the reference with put_device() after use'.
>
> Found by code review.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Cc: stable@vger.kernel.org
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - added goto labels as suggestions.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index d5e6bab36414..f8a817689e16 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -387,19 +387,19 @@ static bool mtk_drm_get_all_drm_priv(struct device =
*dev)
>
>                 of_id =3D of_match_node(mtk_drm_of_ids, node);
>                 if (!of_id)
> -                       continue;
> +                       goto next_put_node;
>
>                 pdev =3D of_find_device_by_node(node);
>                 if (!pdev)
> -                       continue;
> +                       goto next_put_node;
>
>                 drm_dev =3D device_find_child(&pdev->dev, NULL, mtk_drm_m=
atch);
>                 if (!drm_dev)
> -                       continue;
> +                       goto next_put_device_pdev_dev;
>
>                 temp_drm_priv =3D dev_get_drvdata(drm_dev);
>                 if (!temp_drm_priv)
> -                       continue;
> +                       goto next_put_device_drm_dev;
>
>                 if (temp_drm_priv->data->main_len)
>                         all_drm_priv[CRTC_MAIN] =3D temp_drm_priv;
> @@ -411,10 +411,17 @@ static bool mtk_drm_get_all_drm_priv(struct device =
*dev)
>                 if (temp_drm_priv->mtk_drm_bound)
>                         cnt++;
>
> -               if (cnt =3D=3D MAX_CRTC) {
> -                       of_node_put(node);
> +next_put_device_drm_dev:
> +               put_device(drm_dev);
> +
> +next_put_device_pdev_dev:
> +               put_device(&pdev->dev);
> +
> +next_put_node:
> +               of_node_put(node);
> +
> +               if (cnt =3D=3D MAX_CRTC)
>                         break;
> -               }
>         }
>
>         if (drm_priv->data->mmsys_dev_num =3D=3D cnt) {
> --
> 2.25.1
>

