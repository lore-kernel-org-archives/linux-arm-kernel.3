Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B32AD232FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/SwZOTAWGRjC/jOsnr+JcML73MY8MIOtSVDjsJsr/A=; b=LCkJZqcd9qdRHX3tX4T3dt0Yi/
	1CdZAhC3l+RAKY4F7V2a1rveC3W855lnsLC0mCRB97/s333ragoW12ATrxaYt1dGSkGaXx1C2E+8v
	Mi3PtyEwRM8rAqrL6DStbljuvV5nPLQ629fhzkDBGxBiC9pjRG3+DeJxoF2NDascIrad5AVddsc00
	Kri4YZEbIOV0x/8o+eIW4QYUi11cl4QjghsC7llHeLBTNvzJcYzJWrE9Js7YLONHf6QmPGu19PA5B
	So90UXBQU5Jng2N0hyerHtfkNEkyUqbjmYG4iudgFgEn+b/v5l2FhYFAGMK0xB3ms2vODruXkmcQY
	4WfrGMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Bc-00000001w8E-3WN0;
	Fri, 09 Jan 2026 08:49:36 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8BY-00000001w6s-1HUe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:49:35 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260109084924euoutp01315c90ef4d986985ae015b602106ec75~JA9o3qaIP2091320913euoutp01J
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 08:49:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260109084924euoutp01315c90ef4d986985ae015b602106ec75~JA9o3qaIP2091320913euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767948564;
	bh=c/SwZOTAWGRjC/jOsnr+JcML73MY8MIOtSVDjsJsr/A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Mqvi6VnSI+CqaxNhSov0BFfWfW+NPRCSr1KW/RSAFYA+1Gf5MHNWUTkWA5+dY08NO
	 m5CIBzPkCWZtBAdfRdTe2inPqn7yJPtVIdr2GNdToUf9Iuvq3SQZ3bcyMPo2SH9YbV
	 yxqsWKXsar1KHHVBKWzgrPmCi0k1q2Ailkga0CYM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260109084923eucas1p1f8f659a0971bb13f38e8358bdec8a393~JA9oVbnXV2402824028eucas1p1U;
	Fri,  9 Jan 2026 08:49:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260109084922eusmtip2df18ddfed878c3c954ee6deb52bb639c~JA9m9Osqh0432004320eusmtip2H;
	Fri,  9 Jan 2026 08:49:22 +0000 (GMT)
Message-ID: <11d08a53-44b2-48c0-8fc4-8b633e72b1ba@samsung.com>
Date: Fri, 9 Jan 2026 09:49:21 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>,
	benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
	Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien
	Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, Shawn
	Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
	<jagan@amarulasolutions.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260109084923eucas1p1f8f659a0971bb13f38e8358bdec8a393
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260109074009eucas1p21117b6a8a2eba825ebad7b77bd19efd4
X-EPHeader: CA
X-CMS-RootMailID: 20260109074009eucas1p21117b6a8a2eba825ebad7b77bd19efd4
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
	<CGME20260109074009eucas1p21117b6a8a2eba825ebad7b77bd19efd4@eucas1p2.samsung.com>
	<20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_004932_927093_065A791A 
X-CRM114-Status: GOOD (  27.81  )
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

On 09.01.2026 08:31, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>
> As a preliminary cleanup, add a temporary local 'next_bridge' pointer and
> only copy it in dsi->out_bridge as late as possible, i.e. just before
> calling pdata->host_ops->attach() which uses it (only in the exynos
> driver).
>
> Not strictly needed, but for symmetry move the clearing of dsi->out_bridge
> in samsung_dsim_host_detach() to after pdata->host_ops->detach().
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>
> Changes in v2:
> - fix "pointer set too late" bug (NULL pointer deref in the exynos case)
> - *not* add Acked-by: Maxime as the patch has changed
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index eabc4c32f6ab..8dd058124e93 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1886,6 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   {
>   	struct samsung_dsim *dsi = host_to_dsi(host);
>   	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> +	struct drm_bridge *next_bridge;
>   	struct device *dev = dsi->dev;
>   	struct device_node *np = dev->of_node;
>   	struct device_node *remote;
> @@ -1924,17 +1925,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   
>   	panel = of_drm_find_panel(remote);
>   	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		next_bridge = devm_drm_panel_bridge_add(dev, panel);
>   	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> +		next_bridge = of_drm_find_bridge(remote);
> +		if (!next_bridge)
> +			next_bridge = ERR_PTR(-EINVAL);
>   	}
>   
>   	of_node_put(remote);
>   
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> +	if (IS_ERR(next_bridge)) {
> +		ret = PTR_ERR(next_bridge);
>   		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>   		return ret;
>   	}
> @@ -1958,10 +1959,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   			return ret;
>   	}
>   
> +	// The next bridge can be used by host_ops->attach
> +	dsi->out_bridge = next_bridge;
> +
>   	if (pdata->host_ops && pdata->host_ops->attach) {
>   		ret = pdata->host_ops->attach(dsi, device);
>   		if (ret)
> -			return ret;
> +			goto err_release_next_bridge;
>   	}
>   
>   	dsi->lanes = device->lanes;
> @@ -1969,6 +1973,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	dsi->mode_flags = device->mode_flags;
>   
>   	return 0;
> +
> +err_release_next_bridge:
> +	dsi->out_bridge = NULL;
> +	return ret;
>   }
>   
>   static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
> @@ -1985,11 +1993,11 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
>   	struct samsung_dsim *dsi = host_to_dsi(host);
>   	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>   
> -	dsi->out_bridge = NULL;
> -
>   	if (pdata->host_ops && pdata->host_ops->detach)
>   		pdata->host_ops->detach(dsi, device);
>   
> +	dsi->out_bridge = NULL;
> +
>   	samsung_dsim_unregister_te_irq(dsi);
>   
>   	drm_bridge_remove(&dsi->bridge);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


