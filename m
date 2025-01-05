Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC3AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un5/64g9V3uQ7DFC69I0RBCZQfmsmPHVhtmk5Szk3tc=; b=10eMS+7rK6H5N4l8mdV12Idhdd
	KCOsRMzguJ/cEbTQ+I/YYVodeN5TxQelYCNvnZyeV94qjXzDHvNpYTGRlDd/GpKWprLOIOXVvGl19
	0HNozKYiGNIkRXoDcwqWxwqrzvVgwMqZPQMSPQwU0weHI1/Uzh5JcjkhTP8vrWBiHm6yZ7DGlt06w
	J3mjXieuxtrxo5wWVspG20cZN7qZu5ZQ85sD8rMdh8yzVbYmwMbkF6vVVsF356AX7Op+aaQ+IdNFT
	3PGkCVew4XZzOJrUqHOfkbpZkQXY2/GkUhMdH5dxlB4W9bcJ9OQK+/ByGUCUiHSrHMKX6aeC/qbJJ
	Ukp4Yq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZy5-0000000HVwv-1For;
	Sun, 05 Jan 2025 23:23:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZws-0000000HVuk-3WsP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 23:22:24 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A7B4594;
	Mon,  6 Jan 2025 00:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736119290;
	bh=i+mmSnetEJ2wYr6KUP6A42oOjaPOpfLk2IUU7cgmPXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S360THjpWADamVJ+TSvowC9wx3ORxzsxua0OpNpA++42F7LO4tcQB02GrAC66qFug
	 tHQe06v7ywUgUVfV3jm6bewxqJbemV/r4pPjUlc5lM1W3OJ0OqFIlkP5qE9XQkDmvC
	 YfJc0cGPo9NHdtVpyxYGdLm6NvuT5V1KqhTKx+Mo=
Date: Mon, 6 Jan 2025 01:22:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250105232219.GC21164@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105190659.99941-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_152223_032507_0C7934CC 
X-CRM114-Status: GOOD (  27.54  )
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

Hi Marek,

Thank you for the patch.

On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> HDMI but do not contain the HDMI connector node. This flag allows such
> DTs to work by creating the connector in the HDMI bridge driver. Do not
> use this flag, do not proliferate this flag, please fix your DTs and add
> the connector node this way:
> 
> ```
> / {
>     hdmi-connector {
>         compatible = "hdmi-connector";
>         label = "FIXME-Board-Specific-Connector-Label"; // Modify this
>         type = "a";
> 
>         port {
>             hdmi_connector_in: endpoint {
>                 remote-endpoint = <&hdmi_tx_out>;
>             };
>         };
>     };
> };
> 
> &hdmi_tx {
>     ...
> 
>     ports {
>         port@1 {
>             hdmi_tx_out: endpoint {
>                 remote-endpoint = <&hdmi_connector_in>;
>             };
>         };
>     };
> };
> ```

Are there any in-tree DT sources that use the old bindings ?

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V3: New patch
> V4: - Add HDMI connector node addition example into commit message
>     - Bail from dw_hdmi_bridge_attach() if DRM_BRIDGE_ATTACH_NO_CONNECTOR
>       is set and there is no hdmi->next_bridge , so the connector can
>       be created in scanout driver.
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 ++++++--
>  include/drm/bridge/dw_hdmi.h              | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004..e84693faf46dc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		if (!hdmi->next_bridge)
> +			return 0;
> +
>  		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
>  					 bridge, flags);
> +	}
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>  					  hdmi->plat_data->output_port,
>  					  -1);
>  	if (!remote)
> -		return -ENODEV;
> +		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;

Let's complain loudly with a WARN_ON if output_port_optional is set.

>  
>  	hdmi->next_bridge = of_drm_find_bridge(remote);
>  	of_node_put(remote);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737cd..3bb6e633424a8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
>  	unsigned int output_port;
> +	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
> +	bool output_port_optional;
>  
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;

-- 
Regards,

Laurent Pinchart

