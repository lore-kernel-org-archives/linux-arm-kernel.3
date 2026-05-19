Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAA4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOWX9c+b3OM3daoAYqubYKs9ClX2jKzVAtuQZZBDyAc=; b=3LQvce4o6aZRQzc4Wb0g+DGcgA
	clK83Dlk6Aodt4fJt7RaXZwWFtDFa67EotGF0VeFZYk+uG38AWQKf85Vj4pN6NaeGdDd+j/JdZnUs
	Ly+MRvY+5U/DT4tneUbBLjdfwBCIJWdfKy3/pctLulIByEJJEMS7z9A2OFs+WFg0CEHyIFExJ+v5L
	A/Pk+aEja4/wUHUtUrZ7zwT+y1OWDEx2KBDCF6aJAjoBDNQAoU6UjoSbIK3Qw7B2WJH6BgfRMCXOw
	dy7WQLi4etrZloAzPktgT5G6CrrhF0gGgc3BooQVWKGAo2YwHUdnzn4iHPfAPN58qFZAQ2MVWihiX
	pS6vPbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDqk-00000000JcS-18cx;
	Tue, 19 May 2026 06:22:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDqj-00000000Jc3-1a2A;
	Tue, 19 May 2026 06:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5764E60052;
	Tue, 19 May 2026 06:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B49C2BCB3;
	Tue, 19 May 2026 06:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171760;
	bh=Aed99a9dXoFFjuBe/HKh937SbaI5TENok8jZVzI83yE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=qYy9FxepzjehKfeq9lEF5JJ3nqEjctatayrwKgP/QkN2GUteagkyhpJTph2ElnMhb
	 XA7JGax4wS9GDgvHe1gF6OMymKDKBclceeMW6+VfHCkcdViQqWrUF9ev3gK0+mt80S
	 CfQp7WudEKSQWvVxFmhxE9VSks3/P9/LrPuogEObXdaA+HDxzDIPMNIfp7jeIPjLYy
	 gGY7xNgRbIRPjZN3naGDc3O6M8a1zaCTsPrbeLkGn6mJEhuY88nSSou6GrFvvF5OOp
	 /pMU9YQHhOfVCgxFVzEJKt2sQiUQKa0mISpFQFzWemWNXqt5xPjTIj+rxLM4POlph0
	 u+beaXfaohiEw==
Message-ID: <3b6e1fa8-228c-4e2e-b985-72a3f9a1daf0@kernel.org>
Date: Tue, 19 May 2026 08:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 09/23] drm: bridge: dw_hdmi: Unregister CEC notifier
 during connector cleanup
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-10-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-10-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/05/2026 20:01, Jonas Karlman wrote:
> The CEC notifier is being unregistered when the bridge detach,
> something that happens earlier than normal connector cleanup.
> 
> Change to unregister the CEC notifier at connector cleanup, in the
> connector .destroy() func, to align the lifetime of the connector and
> the CEC notifier and closer match a drmres handled generic CEC notifier.
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: No change
> v6: Collect t-b tag
> v5: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index cbbd15578042..5fd26ff8f55b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2532,6 +2532,11 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  
> +	mutex_lock(&hdmi->cec_notifier_mutex);
> +	cec_notifier_conn_unregister(hdmi->cec_notifier);
> +	hdmi->cec_notifier = NULL;
> +	mutex_unlock(&hdmi->cec_notifier_mutex);
> +
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
>  }
> @@ -2909,16 +2914,6 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  	return dw_hdmi_connector_create(hdmi);
>  }
>  
> -static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
> -{
> -	struct dw_hdmi *hdmi = bridge->driver_private;
> -
> -	mutex_lock(&hdmi->cec_notifier_mutex);
> -	cec_notifier_conn_unregister(hdmi->cec_notifier);
> -	hdmi->cec_notifier = NULL;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
> -}
> -
>  static enum drm_mode_status
>  dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>  			  const struct drm_display_info *info,
> @@ -2996,7 +2991,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = dw_hdmi_bridge_attach,
> -	.detach = dw_hdmi_bridge_detach,
>  	.atomic_check = dw_hdmi_bridge_atomic_check,
>  	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
>  	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,


