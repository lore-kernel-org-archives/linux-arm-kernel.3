Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8E9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9crSWJDNkqtEw/a3HR3gJ0imywHljW0VOjbarKbjSY=; b=boObxxuskXHq7UWj58NT6Pew2A
	2DHEKKtCQuME+cjEmCJvTHjwIEOJMEz8CkcRNSIxAf4QqstiaJcu+Eq3AcFmB89EAOhk1GYmPMZer
	VpZ856W4uTayMDpaZS6XrvZgox9luEGxHtwRYE7rrZCV/8XJWi6EYehP2/M1xC35dfQtfXIcVIH5G
	xYJdFkKwDGENy7q73hxiL35FsZ6yY2Ghhbvt3QlT50F2h+QiQ3XwJ+sH8XLs/4GrhdrSbflKqKdDt
	CuRSP884jDE1IqdfoWQKdq6HcjD9TBGGH/t5mziiJ5/E6Sn9vQPws1QNpiGT2mlMwoU5UTVAMZU0y
	gAjQWiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDxL-00000000LFT-0Dyr;
	Tue, 19 May 2026 06:29:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDxJ-00000000LEr-0K0t;
	Tue, 19 May 2026 06:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82B0360052;
	Tue, 19 May 2026 06:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD349C2BCB3;
	Tue, 19 May 2026 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172168;
	bh=Bb09Qg4E3F+Fq36BezSKvCvgDt/EXtMiv/2PmEfy4rg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=U68D6t7Dq9PG/+1ZD97WIcpBwihxV0A2v3tCH4NTmZPrGqvtB0EcNl6OdLebWgpN9
	 UzYFXMz9/DK2BVgEKMeKHx28/z30Q8sW2RZcRCcu1hjO62QT6SVnyF9GrJ34i6rkt6
	 821FHpU5jj25YNv2rfuS6ImD8xRx1mG7beceH0rqNJ8Ppz8z8uCEmx5UG0f99YPtku
	 fMIwZdEzMf2/OszzrOaVfwB0CN/J3yjTslyN6OHN0iDWkTZiybetdxS4xUOQJ7xCEm
	 7zPQO4mmya9vQVTcZEmyhOq4sYc+JOLNs8zB+38xLKUuBZkNlj/14mKUSr1pCRcggZ
	 D8PmKI2XgQX7w==
Message-ID: <46d05ad3-0334-4fad-816c-cce0d5403a14@kernel.org>
Date: Tue, 19 May 2026 08:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 13/23] drm: bridge: dw_hdmi: Use
 dw_hdmi_connector_status_update()
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
 <20260518180206.2480119-14-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-14-jonas@kwiboo.se>
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
> Update connector EDID and CEC phys addr from detect and force funcs to
> ensure that userspace always have access to latest read EDID after a
> sink use a HPD low voltage pulse to indicate that EDID has changed.
> 
> With EDID being updated in detect and force funcs, there should no
> longer be a need to re-read EDID in get_modes funcs, so drop it.
> 
> This change make the dw-hdmi connector work more closely like the bridge
> connector does with a hdmi bridge.
> 
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: No change
> v6: Pass struct dw_hdmi as a parameter,
>     Collect t-b tag
> v5: No change
> v4: Move last_connector_result assign in force ops to this patch,
>     Collect r-b tag
> v3: Reworked 'Update EDID during hotplug processing' patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 28 ++++++++++++-----------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a056e147731b..a4ecf830103d 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2473,36 +2473,36 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
>  {
>  	const struct drm_edid *drm_edid;
>  
> +	if (status == connector_status_disconnected) {
> +		drm_edid_connector_update(connector, NULL);
> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		return;
> +	}
> +
>  	drm_edid = dw_hdmi_edid_read(hdmi, connector);
>  	drm_edid_connector_update(connector, drm_edid);
>  	drm_edid_free(drm_edid);
>  
> -	cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -				   connector->display_info.source_physical_address);
> +	if (status == connector_status_connected)
> +		cec_notifier_set_phys_addr(hdmi->cec_notifier,
> +				connector->display_info.source_physical_address);
>  }
>  
>  static enum drm_connector_status
>  dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> -					     connector);
> +	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  	enum drm_connector_status status;
>  
>  	status = dw_hdmi_detect(hdmi);
>  
> -	if (status == connector_status_disconnected)
> -		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +	dw_hdmi_connector_status_update(hdmi, connector, status);
>  
>  	return status;
>  }
>  
>  static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> -					     connector);
> -
> -	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
> -
>  	return drm_edid_connector_add_modes(connector);
>  }
>  
> @@ -2532,13 +2532,15 @@ static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
>  
>  static void dw_hdmi_connector_force(struct drm_connector *connector)
>  {
> -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> -					     connector);
> +	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  
>  	mutex_lock(&hdmi->mutex);
>  	hdmi->force = connector->force;
> +	hdmi->last_connector_result = connector->status;
>  	dw_hdmi_update_phy_mask(hdmi);
>  	mutex_unlock(&hdmi->mutex);
> +
> +	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
>  }
>  
>  static void dw_hdmi_connector_destroy(struct drm_connector *connector)


