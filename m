Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CFFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6G2SVWO20IBn1PN7dFTFMYYXOJCjUg90dESHj0IaiD0=; b=0n27j1seEi5TZGc8VQFbKzsf9g
	KHUaj/OWphkhf3HeZ4oPLTVtTSA0bYsL54JNEYqbdp7R3hQcy23JA/rp+m3TKVkrnIabUjdw8u4PA
	Q2nBVclAYPZ0K3H8SO1+0M+vGpqmSCSD2i917nVe7ewPfb5zoj0okHBcHHN1s0KmvKqCmyPzBMq0s
	8hhM6Uy9rEzc3ihcRWM6gdaZfIN3bTZIMbtzCtaLHAEpDo33179q5+fvDOdUNn0NZk9vhw4YJxSPk
	Ih9NVaohsUtkUrEJq/3CZMAXx22NhLPpH/GemTbEkJk3lfBXbNDqr2hHkfpiqOw3Ivc+uxAKxjyDm
	S9JTha/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Jeq-0000000FPLd-14pK;
	Sun, 22 Mar 2026 14:20:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Jeo-0000000FPLK-1P4n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 14:19:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C06560128
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 14:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC03EC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774189196;
	bh=pw3Kex2TtkEIr5Hh1UwrWSsRUK78ekd18b80cHZofwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BoFzhb5gLlfX688voT++AKnLCgQBqxpwKcGS57Z5P/fBgmKtP5VBs1tLoEDj+jA6F
	 jXoL1k6bIEAEVg+2M2U2MywBJ3huIrXn0v0FIyzuUGwbweaxlIaVFsrMwsK+hCi24t
	 Ch0ouWrOdCjWlvNPlw63nE1hhLmFk5nR4Zv92C7qB05u13fVqZED6GcjVH87xPjRhu
	 fHURr1Sy8joGP3MTrM+qJMtl9NQRi3Kr18wqs0zGn5cjvfN74jURXLcnnyacfeuOJp
	 zgsuv6BYnOxWmErUnzqoSFYb4xaa+Ko1Zlnaaz83iGYiuYmk9uwodGGj9mOZy0WbKh
	 N00CNy9zJTEHQ==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127380532eeso1365169c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 07:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTVmqkGiWdODJV4V62P6yaU2ybWiSk6QXorH/N9Wt2x3K3MI3wpaj/NcvUkMYRo3Yw6GqYgSFYIF0H+1Z4X6Nk@lists.infradead.org
X-Gm-Message-State: AOJu0YySPMOnfWG86eKr6vSi+z5WBHJNAJYQu4xjlVlh5rjiV78GlCn8
	VmSjGV6Jl87AV1xFgaD3S7Ml8hqRXmwDHyFbNDvYocL791W9HXBcVxGC4xMzifNmmXFVVhmoZr5
	mjMyg5JZqvMKQ3fT/YgfAka/1AkhlFQ==
X-Received: by 2002:a05:7022:928:b0:128:e016:dd4b with SMTP id
 a92af1059eb24-12a726e13e4mr4555706c88.37.1774189195957; Sun, 22 Mar 2026
 07:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260225094047.76780-1-l.scorcia@gmail.com>
In-Reply-To: <20260225094047.76780-1-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:19:43 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-_k4Fv2H_P6Xt3mT3aqfWHki_Ary3Lt0G6vk_nfqb6OQ@mail.gmail.com>
X-Gm-Features: AaiRm53TPKDRjcIENz8E-lT6qKe1LyJ0Aic3cDGSTsLZUFPpGAbsnhoMCBgOczA
Message-ID: <CAAOTY_-_k4Fv2H_P6Xt3mT3aqfWHki_Ary3Lt0G6vk_nfqb6OQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8825=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
> which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
> structure needs to be stored inside the driver data before invoking it.
>
> As drvdata is currently uninitialized it leads to a crash when
> registering the DSI DRM encoder right after acquiring
> the mode_config.idr_mutex, blocking all subsequent DRM operations.
>
> Fixes the following crash during mediatek-drm probe (tested on Xiaomi
> Smart Clock x04g):
>
> Unable to handle kernel NULL pointer dereference at virtual address
>  0000000000000040
> [...]
> Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
>  drm_dma_helper drm_kms_helper panel_simple
> [...]
> Call trace:
>  drm_mode_object_add+0x58/0x98 (P)
>  __drm_encoder_init+0x48/0x140
>  drm_encoder_init+0x6c/0xa0
>  drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
>  mtk_dsi_bind+0x34/0x13c [mediatek_drm]
>  component_bind_all+0x120/0x280
>  mtk_drm_bind+0x284/0x67c [mediatek_drm]
>  try_to_bring_up_aggregate_device+0x23c/0x320
>  __component_add+0xa4/0x198
>  component_add+0x14/0x20
>  mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
>  mipi_dsi_attach+0x2c/0x50
>  panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
>  mipi_dsi_drv_probe+0x1c/0x28
>  really_probe+0xc0/0x3dc
>  __driver_probe_device+0x80/0x160
>  driver_probe_device+0x40/0x120
>  __device_attach_driver+0xbc/0x17c
>  bus_for_each_drv+0x88/0xf0
>  __device_attach+0x9c/0x1cc
>  device_initial_probe+0x54/0x60
>  bus_probe_device+0x34/0xa0
>  device_add+0x5b0/0x800
>  mipi_dsi_device_register_full+0xdc/0x16c
>  mipi_dsi_host_register+0xc4/0x17c
>  mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
>  platform_probe+0x5c/0xa4
>  really_probe+0xc0/0x3dc
>  __driver_probe_device+0x80/0x160
>  driver_probe_device+0x40/0x120
>  __driver_attach+0xc8/0x1f8
>  bus_for_each_dev+0x7c/0xe0
>  driver_attach+0x24/0x30
>  bus_add_driver+0x11c/0x240
>  driver_register+0x68/0x130
>  __platform_register_drivers+0x64/0x160
>  mtk_drm_init+0x24/0x1000 [mediatek_drm]
>  do_one_initcall+0x60/0x1d0
>  do_init_module+0x54/0x240
>  load_module+0x1838/0x1dc0
>  init_module_from_file+0xd8/0xf0
>  __arm64_sys_finit_module+0x1b4/0x428
>  invoke_syscall.constprop.0+0x48/0xc8
>  do_el0_svc+0x3c/0xb8
>  el0_svc+0x34/0xe8
>  el0t_64_sync_handler+0xa0/0xe4
>  el0t_64_sync+0x198/0x19c
> Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
> ---[ end trace 0000000000000000 ]---

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: e4732b590a77 ("drm/mediatek: dsi: Register DSI host after acquirin=
g clocks and PHY")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> v3: Also initialize irq_wait_queue before calling platform_set_drvdata
> v2: Added Fixes tag
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d7726091819c..acee2227275b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1232,6 +1232,11 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>
>         dsi->host.ops =3D &mtk_dsi_ops;
>         dsi->host.dev =3D dev;
> +
> +       init_waitqueue_head(&dsi->irq_wait_queue);
> +
> +       platform_set_drvdata(pdev, dsi);
> +
>         ret =3D mipi_dsi_host_register(&dsi->host);
>         if (ret < 0)
>                 return dev_err_probe(dev, ret, "Failed to register DSI ho=
st\n");
> @@ -1243,10 +1248,6 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, ret, "Failed to request =
DSI irq\n");
>         }
>
> -       init_waitqueue_head(&dsi->irq_wait_queue);
> -
> -       platform_set_drvdata(pdev, dsi);
> -
>         dsi->bridge.of_node =3D dev->of_node;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> --
> 2.43.0
>

