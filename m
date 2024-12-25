Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A4AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk4s0qCyjEO8XOZ4Bt2JdqZhzAMwJb6j/s2chqx6dRU=; b=ezgVI3h0uTa/jiAtS39vYHLSI9
	2dfKwLIQPtazawEHSEyKfb5We3OzfuvMv1sfYPyoGctYsxti2DsmkuzRRZTwJpMtrebmx8iRlb+Jv
	nwmGTe1j0kRhr0kx7EjNricsVR5u+W54s4fGGlRnqOFYwDRVkJxdrW+8WcojX6XcOZxoJReBpubUl
	/dHOEpcdTq7602zj0P7CnaggJhmmq7Q/f/e1aBPCUeOwzDnhf9ZCIpvL5dSXVY6N6CmKVwnFE+aPv
	+QZtTLw7JWQV0BgIicc8VEOHSA/QhToSN0LFc7eX+EQgi3cB1+uN7HGVO6+vVYPRqi/dYMSpDDVuQ
	aFH1JzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQSuL-0000000DyDo-0Ez4;
	Wed, 25 Dec 2024 15:02:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQSt9-0000000Dy9M-0qed;
	Wed, 25 Dec 2024 15:01:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8638FA40444;
	Wed, 25 Dec 2024 14:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0C5C4CEDC;
	Wed, 25 Dec 2024 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735138889;
	bh=4bBE8LbFUYcZ10/kvs+K0KUMEg1oift8keSWrmc1IWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qwf4uo7v3vQwlFcBS5TpFevok2CrBVmP/NGdwq+P5lGGhBtQRz7RnpPF3PN+VBqwz
	 X8qFMfqPUeaespfHTxJiwTiHxaxKe/j4soflcxZtUCXmEGz4bJpAu2uy4SrDZhLhyS
	 u+72EBBqmmSejAKXs5F8G5CEJWqoWx50Wb2o5CJmge53rRfw2tuoBZdCnp81wAQ4mm
	 NRtwJomQq9yA4jTkhBhoEO4v3iQYFb6LICeFbvv8nnhAB3sFAemAYTKdTbXlhWYUDr
	 uEaRW87x5nSLad/xVB5NSq+GscuUEuJ44KJPT7VN8v5wgulge3TNsCGXSYqY/xvWAC
	 7LRMBNhNdiVLA==
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so6270363a91.3;
        Wed, 25 Dec 2024 07:01:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUH08pLOoDDMDmtOvJnMV2NuUqukeY844tny2EpeqL6H9E7Owm1O1yn029drdMi5HO7dmVZomgrMiOUzvytVzU=@lists.infradead.org, AJvYcCX+WVZuqBXamPSaxyfGRYv3RNs/AiciM/JougE8i8ywP9++tefdSHH0e+B/cw/QhaUqQ6lwf3Esvw65pggCVvoY@lists.infradead.org
X-Gm-Message-State: AOJu0YysyWAXSke+D/7xs+chKCDpJBhXOu6v++Er9j4llYzBF05Mhus+
	ctvwOGLA/MPXAdhc2B1VcWWDmyAUYLihJPO6QvOmJ3rJil2yMzuT4tE57GH7ehgJB+at1GBJKTe
	ZGE6gv8vhVo1k4XWduOb8nXVivw==
X-Google-Smtp-Source: AGHT+IF9xqr0MB+CeYvcLBK3vTLIYnlZnLybva/SWf50PuDmdoY6PLKbqt076UUPF0Wsld6o+8QicufgIRbtnqCK+ak=
X-Received: by 2002:a17:90a:e187:b0:2ee:8430:b847 with SMTP id
 98e67ed59e1d1-2f452dfcd26mr28539700a91.6.1735138889113; Wed, 25 Dec 2024
 07:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:02:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__No2VrkivsH3=6jvPGkPTXZ22vbGGKAcB3MMcA-+QeEw@mail.gmail.com>
Message-ID: <CAAOTY__No2VrkivsH3=6jvPGkPTXZ22vbGGKAcB3MMcA-+QeEw@mail.gmail.com>
Subject: Re: [PATCH V2] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_070131_377169_A2A8CEA0 
X-CRM114-Status: GOOD (  18.10  )
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

Hi, Guoqing:

Guoqing Jiang <guoqing.jiang@canonical.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=
=8823=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The pointer need to be set to NULL, otherwise KASAN complains about
> use-after-free. Because in mtk_drm_bind, all private's drm are set
> as follows.
>
> private->all_drm_private[i]->drm =3D drm;
>
> And drm will be released by drm_dev_put in case mtk_drm_kms_init returns
> failure. However, the shutdown path still accesses the previous allocated
> memory in drm_atomic_helper_shutdown.
>
> [   84.874820] watchdog: watchdog0: watchdog did not stop!
> [   86.512054] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   86.513162] BUG: KASAN: use-after-free in drm_atomic_helper_shutdown+0=
x33c/0x378
> [   86.514258] Read of size 8 at addr ffff0000d46fc068 by task shutdown/1
> [   86.515213]
> [   86.515455] CPU: 1 UID: 0 PID: 1 Comm: shutdown Not tainted 6.13.0-rc1=
-mtk+gfa1a78e5d24b-dirty #55
> [   86.516752] Hardware name: Unknown Unknown Product/Unknown Product, BI=
OS 2022.10 10/01/2022
> [   86.517960] Call trace:
> [   86.518333]  show_stack+0x20/0x38 (C)
> [   86.518891]  dump_stack_lvl+0x90/0xd0
> [   86.519443]  print_report+0xf8/0x5b0
> [   86.519985]  kasan_report+0xb4/0x100
> [   86.520526]  __asan_report_load8_noabort+0x20/0x30
> [   86.521240]  drm_atomic_helper_shutdown+0x33c/0x378
> [   86.521966]  mtk_drm_shutdown+0x54/0x80
> [   86.522546]  platform_shutdown+0x64/0x90
> [   86.523137]  device_shutdown+0x260/0x5b8
> [   86.523728]  kernel_restart+0x78/0xf0
> [   86.524282]  __do_sys_reboot+0x258/0x2f0
> [   86.524871]  __arm64_sys_reboot+0x90/0xd8
> [   86.525473]  invoke_syscall+0x74/0x268
> [   86.526041]  el0_svc_common.constprop.0+0xb0/0x240
> [   86.526751]  do_el0_svc+0x4c/0x70
> [   86.527251]  el0_svc+0x4c/0xc0
> [   86.527719]  el0t_64_sync_handler+0x144/0x168
> [   86.528367]  el0t_64_sync+0x198/0x1a0
> [   86.528920]
> [   86.529157] The buggy address belongs to the physical page:
> [   86.529972] page: refcount:0 mapcount:0 mapping:0000000000000000 index=
:0xffff0000d46fd4d0 pfn:0x1146fc
> [   86.531319] flags: 0xbfffc0000000000(node=3D0|zone=3D2|lastcpupid=3D0x=
ffff)
> [   86.532267] raw: 0bfffc0000000000 0000000000000000 dead000000000122 00=
00000000000000
> [   86.533390] raw: ffff0000d46fd4d0 0000000000000000 00000000ffffffff 00=
00000000000000
> [   86.534511] page dumped because: kasan: bad access detected
> [   86.535323]
> [   86.535559] Memory state around the buggy address:
> [   86.536265]  ffff0000d46fbf00: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.537314]  ffff0000d46fbf80: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.538363] >ffff0000d46fc000: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.544733]                                                           =
^
> [   86.551057]  ffff0000d46fc080: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.557510]  ffff0000d46fc100: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.563928] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   86.571093] Disabling lock debugging due to kernel taint
> [   86.577642] Unable to handle kernel paging request at virtual address =
e0e9c0920000000b
> [   86.581834] KASAN: maybe wild-memory-access in range [0x07520490000000=
58-0x075204900000005f]
> ...
>

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
> V2 changes:
> 1. add Fixes tag per CK's comment
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 9a8ef8558da9..0062374f75d5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -673,6 +673,8 @@ static int mtk_drm_bind(struct device *dev)
>  err_free:
>         private->drm =3D NULL;
>         drm_dev_put(drm);
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> +               private->all_drm_private[i]->drm =3D NULL;
>         return ret;
>  }
>
> --
> 2.35.3
>

