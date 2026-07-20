Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C053C44512
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 01:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlQm/PpCTfe1j9oRpQXe07F8wUNhZzgsWv2yet6lYR8=; b=Nnu/c5vqPz9+4Y0CELDrjMHKMu
	+g6W1w2QemRbti8+OwQDKVU5tAclvQIWK7y9i4XnvWG//vuX0iuLD+f0M93AELqpuOrL3WLKuA0qY
	9ce03kK3eLyKVWaglXk2U9mGArLfaTxFjSUi/Sfh2+7VPFJ6RLlAwInL+xyJqmpz3nWOTF7xZx6HP
	FS2oQs+74gnDQdJ3iGFHlnDhA+ohAodNfI5PsKh3sosVjlO4wEMnA4Q1iNQ6sI0UqvijTcw6GbATn
	GyWxTp9/Sm0OxMoKUy1Hy0qzgv5oiLvVyKXwy5D2Ri88XvLLMTJXiIrf1qXPB4RGqRRGeZdbPkW7q
	aZbay5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcnh-00000005cNb-0PJO;
	Mon, 20 Jul 2026 01:28:09 +0000
Received: from mail-m103131191147.xmail.ntesmail.com ([103.131.191.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcnb-00000005cMf-3AEm;
	Mon, 20 Jul 2026 01:28:07 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 46c241bcb;
	Mon, 20 Jul 2026 09:27:46 +0800 (GMT+08:00)
Message-ID: <a2eed39e-1991-4b76-837f-d5cab47391b2@rock-chips.com>
Date: Mon, 20 Jul 2026 09:27:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/rockchip: lvds: propagate bus_flags to the CRTC
 state
To: Rok Markovic <rok@kanardia.eu>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alibek Omarov <a1ba.omarov@gmail.com>
References: <20260717120005.2087386-1-rok@kanardia.eu>
 <20260717120005.2087386-2-rok@kanardia.eu>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260717120005.2087386-2-rok@kanardia.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f7d22e4aa03a7kunmc2dbdd921ce93e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR5CVkgfGkoaHUxLTExJGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WVqO+2NCDv/mqaO7Kt2nEXgpTXTldKPyN/TiQkHcsd5v7udtGR77JY3k0OKq4COd3wN0vU79o6m/lfszbFb8PIsZYbVdWFJmO0yDE9FtgwlO5bc6k6xYkmawjTIedk/4J+nzSL2Igg1ho8BleWnFiLT+YAsqNSxgP6FQ5VsHWxg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KlQm/PpCTfe1j9oRpQXe07F8wUNhZzgsWv2yet6lYR8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_182804_372395_9CF20047 
X-CRM114-Status: GOOD (  20.09  )
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

On 7/17/2026 8:00 PM, Rok Markovic wrote:
> rockchip_lvds_encoder_atomic_check() sets output_mode and output_type
> but never copies the connector's bus_flags into the Rockchip CRTC
> state, unlike dw_dp-rockchip.c and dw-mipi-dsi2-rockchip.c which both
> do.
> 
> panel-lvds parses pixelclk-active from the DT display timing and
> publishes it on the connector as DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE.
> VOP2 reads that flag back out of the CRTC state to decide
> POLFLAG_DCLK_INV. With the flag dropped here, vcstate->bus_flags is
> always zero, so a panel that asks to be clocked on the falling edge is
> driven on the rising one, and there is no way to express the panel's
> requirement from DT at all.
> 
> No functional change for the SoCs currently supported by this driver:
> rk3288 and px30 pair with the VOP1 driver (rockchip_drm_vop.c), which
> never reads bus_flags - only VOP2 consumes it. The flag becomes live
> with the RK3568 support added later in this series.
> 
> Signed-off-by: Rok Markovic <rok@kanardia.eu>
> Assisted-by: Claude:claude-opus-4-8
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 75f898a..95fa0a9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -129,7 +129,15 @@ rockchip_lvds_encoder_atomic_check(struct drm_encoder *encoder,
>  				   struct drm_connector_state *conn_state)
>  {
>  	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
> -
> +	struct drm_connector *connector = conn_state->connector;
> +
> +	/*
> +	 * The VOP derives the pixel clock polarity from this. Without it a
> +	 * panel that declares pixelclk-active = <0> is clocked on the wrong
> +	 * edge. panel-lvds fills the connector's bus_flags in from the DT
> +	 * display timing.
> +	 */
> +	s->bus_flags = connector->display_info.bus_flags;
>  	s->output_mode = ROCKCHIP_OUT_MODE_P888;
>  	s->output_type = DRM_MODE_CONNECTOR_LVDS;
>  

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


