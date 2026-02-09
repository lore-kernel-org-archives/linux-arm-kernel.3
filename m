Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509F2E81BA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1i4BXS21OZQO/srhwptAe3ZlZ7ke8GZKEhhBYlndKvc=; b=CmN4jg6oriNAVNRQJl0r21+7ZA
	EHVcNtIDpMp8kIprhNZa1CWeZAFKcwe4VrbQEeCrblX8tkjOkD38AWaQPrWTPzMdKd//KNFaHmGRB
	WjglbhqUT9Gc/EiuvBpN2UbsL1ij1rd+gov2/Ki/j1ux2m181ALd7xVyfgqYwnWjFbJSOy+KwnbPV
	EZUqmKuNuorYAC8X3xx3GhJ6LgAPOyApa8txsbIKJfeFniMiKt534pxy3FRN2GAyFMzaNN7WDw2p6
	Z6g1ubUyj3jygCnzBS0u798KqtZvF9MA5RHbsCd1WNg7LLBJhEkleWLks486SUB35IQ9FDtdFOejF
	cQkIB20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPcq-0000000FJeo-0e88;
	Mon, 09 Feb 2026 11:40:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPcn-0000000FJeF-3lL3;
	Mon, 09 Feb 2026 11:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770637213;
	bh=YaTGcZwimloW1kgdEu8K+8Kr1kYVJjhPDsKxgwaC/PM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LsCNZmAyezhl3cvyfXrtT3fLv3wCWzZ9+ABlrTSDaHixCeCjjxhzsU2Ofp6WSAXOx
	 lTbIG1xnRmaHn9+L82ux7AgGEQB7215cUmY8YwwMGZ6+QpWdjNngskX1QdUsnHtfvZ
	 MOS8CdmxtKmMn6AaDExoUwNnLOiOOJEgpmIjvUProq0KvQrqCUZgmhdcPvBUM3434a
	 8MsC44jgeZAi5LeDa2lrMuE64kprokKgDPFCcn+OZRCrprZefZgwOMDXyZQLT2rKT3
	 gn5YhQcM1rv8yVHlBQC6JDzp5x6Xv5Rc37TFp/fKZKnuh8TxkaX8tsdXGuuFTxXm8d
	 IvXe1leqXwmZQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C1E117E13D5;
	Mon,  9 Feb 2026 12:40:13 +0100 (CET)
Message-ID: <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
Date: Mon, 9 Feb 2026 12:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260209090516.14369-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260209090516.14369-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_034018_103816_A672EA97 
X-CRM114-Status: GOOD (  18.49  )
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

Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
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
>   0000000000000040
> [...]
> Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
>   drm_dma_helper drm_kms_helper panel_simple
> [...]
> Call trace:
>   drm_mode_object_add+0x58/0x98 (P)
>   __drm_encoder_init+0x48/0x140
>   drm_encoder_init+0x6c/0xa0
>   drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
>   mtk_dsi_bind+0x34/0x13c [mediatek_drm]
>   component_bind_all+0x120/0x280
>   mtk_drm_bind+0x284/0x67c [mediatek_drm]
>   try_to_bring_up_aggregate_device+0x23c/0x320
>   __component_add+0xa4/0x198
>   component_add+0x14/0x20
>   mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
>   mipi_dsi_attach+0x2c/0x50
>   panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
>   mipi_dsi_drv_probe+0x1c/0x28
>   really_probe+0xc0/0x3dc
>   __driver_probe_device+0x80/0x160
>   driver_probe_device+0x40/0x120
>   __device_attach_driver+0xbc/0x17c
>   bus_for_each_drv+0x88/0xf0
>   __device_attach+0x9c/0x1cc
>   device_initial_probe+0x54/0x60
>   bus_probe_device+0x34/0xa0
>   device_add+0x5b0/0x800
>   mipi_dsi_device_register_full+0xdc/0x16c
>   mipi_dsi_host_register+0xc4/0x17c
>   mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
>   platform_probe+0x5c/0xa4
>   really_probe+0xc0/0x3dc
>   __driver_probe_device+0x80/0x160
>   driver_probe_device+0x40/0x120
>   __driver_attach+0xc8/0x1f8
>   bus_for_each_dev+0x7c/0xe0
>   driver_attach+0x24/0x30
>   bus_add_driver+0x11c/0x240
>   driver_register+0x68/0x130
>   __platform_register_drivers+0x64/0x160
>   mtk_drm_init+0x24/0x1000 [mediatek_drm]
>   do_one_initcall+0x60/0x1d0
>   do_init_module+0x54/0x240
>   load_module+0x1838/0x1dc0
>   init_module_from_file+0xd8/0xf0
>   __arm64_sys_finit_module+0x1b4/0x428
>   invoke_syscall.constprop.0+0x48/0xc8
>   do_el0_svc+0x3c/0xb8
>   el0_svc+0x34/0xe8
>   el0t_64_sync_handler+0xa0/0xe4
>   el0t_64_sync+0x198/0x19c
> Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
> ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?

Are you running upstream on this device?
If so, why don't you also contribute a nice devicetree to get this device finally
upstream?!?! :-)

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4c2983852596..2358407b8a6b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   
>   	dsi->host.ops = &mtk_dsi_ops;
>   	dsi->host.dev = dev;
> +	platform_set_drvdata(pdev, dsi);
> +
>   	ret = mipi_dsi_host_register(&dsi->host);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   
>   	init_waitqueue_head(&dsi->irq_wait_queue);
>   
> -	platform_set_drvdata(pdev, dsi);
> -
>   	dsi->bridge.of_node = dev->of_node;
>   	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>   



