Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5E0C83039
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zx86M/cqB0Cz2cc6T/d/PweesudhCH3bhP7FyA6XDw=; b=J1ZVnBwp9jfg87u9vJ7B+Aie/Z
	S1J4IeiyivVkleFGKLv3fSa0MVnPvg5llqVqJlAQwrWAkRE0bEtXQqhbuDHTbtMtM2XbibiBwA0nK
	xxRw7z44mtyWbTCTVVEZZRcoYtRWbi4jHxJFiWShvO55d8kPygyPAjlXKeiQgob9qQ7UNgMp/Rx7Y
	l1nqZ/jN8MYpDHPLcDqlxaXSlq+6GQYMaffhiZmj+35rWPmOvbbsfUxxxN7QtJj5lsUFSnPPk++x+
	8N58wOz4gdZsjvGu7LQIO1u8rP0pWjoTCqX+TLglSe2ZuL6NYXJ/v7+JSAPHCpAo0t0uKNdqBc7pl
	88oTj/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWiz-00000004TUM-45DI;
	Tue, 01 Jul 2025 08:52:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWDE-00000004ORw-0Zve;
	Tue, 01 Jul 2025 08:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751357970;
	bh=y0AZawpjHW7SFgMPWSFOKe+kD46e6DMDPvzNjsfdVTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TvqyMYMOeFtk9c5luFAIOTQYoymrZh6POrfEkdvkrEea2RLvse4H9cNe81W7o8mG3
	 7iWlKv3dvcvWSWvHnEa99BG8T+DSnOpTNtrUcpObdWi+0MHVjjgQfNu3RWbrCm9B20
	 HiArf3fZ1rUANUhmwr8l3z1HW8rT1m1rlHz3Mel96+L2JqarpETFhwNQYUftllA85l
	 qVZQBOG/X5kl3KQGWhpO98cqAD6G7adIMhA+KGgp1NDQIgeVOiju6gCK4GsBNXDSo3
	 SeXkEbbeS0mypsAZKSMlfN8DmORL8AS1HpjwFoqeFXPQvK85jr4JCx4QFrwxTUWI6Z
	 pxNOUOpqfBdRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66C8117E0342;
	Tue,  1 Jul 2025 10:19:29 +0200 (CEST)
Message-ID: <27b09cde-2da2-49cf-b872-31adf7b5c4e6@collabora.com>
Date: Tue, 1 Jul 2025 10:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_011932_343905_D0425328 
X-CRM114-Status: GOOD (  20.56  )
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

Il 01/07/25 09:30, Louis-Alexis Eyraud ha scritto:
> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable"), the bridge pre_enable callbacks are now
> called before crtc enable, and the bridge post_disable callbacks after
> the crtc disable.
> In the mediatek-drm driver, this change leads to transfer errors on
> mtk_dsi_host_transfer callback processing during the panel bridge
> pre-enable sequence because the DSI host bridge pre_enable and CRTC
> enable sequences, that are enabling the required clocks and PHY using
> mtk_dsi_poweron function, are called after.
> 
> So, in order to fix this call order issue, request the DSI host bridge
> be pre-enabled before panel bridge by setting pre_enable_prev_first
> flag on DSI device bridge in the mtk_dsi_host_attach function.
> 
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> This patch fixes an issue that can be observed on boards such as
> MediatekGenio 1200-EVK or 350-EVK with a kernel based on linux-next
> (tag: next-20250635) since commit c9b1150a68d9 ("drm/atomic-helper:
> Re-order bridge chain pre-enable and post-disable").
> In boot logs, there are multiples errors such as IRQ timeouts and
> panel init errors, leading the DSI panel not being enabled:
> 
> Example on Genio 1200-EVK:
> ```
> [drm] Wait DSI IRQ(0x00000002) Timeout
> panel-himax-hx8279 1c008000.dsi.0: sending generic data b0 05 failed:
>    -62
> [drm] Wait DSI IRQ(0x00000008) Timeout
> [drm:mtk_dsi_host_transfer [mediatek_drm]] *ERROR* failed to switch cmd
>   mode
> panel-himax-hx8279 1c008000.dsi.0: sending DCS SET_DISPLAY_ON failed:
>    -62
> ```
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d7726091819c4762698b41060b3d4d8d27940238..0e2bcd5f67b767d92f2697a5b8183f67ee178a38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1002,6 +1002,12 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>   			return PTR_ERR(dsi->next_bridge);
>   	}
>   
> +	/*
> +	 * set flag to request the DSI host bridge be pre-enabled before device bridge
> +	 * in the chain, so the DSI host is ready when the device bridge is pre-enabled
> +	 */
> +	dsi->next_bridge->pre_enable_prev_first = true;
> +
>   	drm_bridge_add(&dsi->bridge);
>   
>   	ret = component_add(host->dev, &mtk_dsi_component_ops);
> 
> ---
> base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
> change-id: 20250630-mediatek-drm-fix-dsi-panel-init-1a4b534c40a6
> 
> Best regards,



