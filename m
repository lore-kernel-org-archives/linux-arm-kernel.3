Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE0CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAK0NVDTXgfOyaDOAEDsii3ti5HHZ+55PJPDlnkFlQk=; b=mOYe/l6cc8v/RfL14mx3PsHc3F
	hU5/JAgRAbEWMpJT3crIV9f22tNmHrr+L0s3a41dI7fsJtqPvb0mnSOxdbovvltMy+OuVlazqAYJY
	C+tstO3eq1GhwvsEsy8+ND1UoiWwkNGRvjHXcjwG9pNf4rwAGAc3ZumzKrhIusQEqnsPaF7KMEDSj
	/Vq48G6Cpa2EpcrWxWAdVOU+OVV/jnExU9PC+tLDltoGlID3ZxtEtLs+LrxQkn4/Y8n34A8DMRvk2
	oGt/t1FH2L9wB8041ZnyHmx/BLK4cLB/LvekIC6BjbiVwyVK0HP7XP0imIrXu2ZlQMiUxovj5Lrsa
	kiF9nTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJv7w-0000000DahR-2sdK;
	Mon, 04 May 2026 15:22:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJv7u-0000000Dah6-0HRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 15:22:31 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 183FC175;
	Mon,  4 May 2026 17:22:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777908146;
	bh=zqH6L+EG9wUTO7Qoyz4neBCPa6T/Ac/tjYvnTvOAB7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHXtwh5T5BDC8Q9lFPK/5JEuWFjkhO2o8t8eJUO5EnQigc23poa+JjvgYhTAKT0fZ
	 2WAfqiKfoaQQcpeFgC0FcTCWmZWo3te0QcHcWFshgYdHWgitgFsqCdYFkqpJQIapQY
	 LQ0xWLVZ2ygWK/cNBfWeyY0dm7tXSECuDWeQGXVI=
Date: Mon, 4 May 2026 18:22:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <20260504152226.GB1455860@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-8-b578c3daaf10@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-8-b578c3daaf10@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_082230_248493_02D9B357 
X-CRM114-Status: GOOD (  22.03  )
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

Hi Luca,

Thank you for the patch.

On Mon, May 04, 2026 at 12:45:11PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 +++++++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 8be7266fd4f4..12c95198d9a4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -354,7 +354,6 @@ struct adv7511 {
>  	enum drm_connector_status status;
>  	bool powered;
>  
> -	struct drm_bridge *next_bridge;
>  	struct drm_display_mode curr_mode;
>  
>  	unsigned int f_tmds;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f318080f1139..8304978535e4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -849,8 +849,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>  	struct adv7511 *adv = bridge_to_adv7511(bridge);
>  	int ret = 0;
>  
> -	if (adv->next_bridge) {
> -		ret = drm_bridge_attach(encoder, adv->next_bridge, bridge,
> +	if (adv->bridge.next_bridge) {
> +		ret = drm_bridge_attach(encoder, adv->bridge.next_bridge, bridge,
>  					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret)
>  			return ret;
> @@ -1249,10 +1249,13 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	memset(&link_config, 0, sizeof(link_config));
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
> -					  &adv7511->next_bridge);
> -	if (ret && ret != -ENODEV)
> -		return ret;
> +	adv7511->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
> +	if (IS_ERR(adv7511->bridge.next_bridge)) {
> +		if (PTR_ERR(adv7511->bridge.next_bridge) == -ENODEV)
> +			adv7511->bridge.next_bridge = NULL;
> +		else
> +			return PTR_ERR(adv7511->bridge.next_bridge);
> +	}
>  
>  	if (adv7511->info->link_config)
>  		ret = adv7511_parse_dt(dev->of_node, &link_config);

-- 
Regards,

Laurent Pinchart

