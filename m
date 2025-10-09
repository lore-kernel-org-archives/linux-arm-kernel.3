Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F68CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQ2zeMeYDfoWTQYJ4xG+nhpK+0ZJUttKUUEWrzWjUSw=; b=lGA03lSEdgASPzVkQ8YF+zFxiC
	bxBf6tFt1B1R2zU9nkji4qzdHmJ+ssmtUWxnnCkrkxhdqsSWxapRkfZ7R3JmTyAC2SM8L8HtM9R2x
	6XHRCVYij0zUlgyY56FQjtqXWa4V5WCrgbeYVDP4zhxVgCmJwLFk5S9OciBwMUX6O1IHSlYNEvDAm
	k/MuGjQgMUJZXfwfZg7BxtQsSm/BtnscABV+Mr7muxiE94+z9/QPU6EJ69gEHDytxkUwizx1esCSr
	g5zltr5K5QcxyKsPtO23c8W002oX1QK70oBfnjr8Pwuj2BYdm01hVscfouW2PJQTjPqxFzPSULxxy
	ooH7W5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hzQ-000000058wa-1WhQ;
	Thu, 09 Oct 2025 04:10:52 +0000
Received: from mail-m19731115.qiye.163.com ([220.197.31.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hzM-000000058va-0sJ8;
	Thu, 09 Oct 2025 04:10:50 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2543142d9;
	Thu, 9 Oct 2025 12:10:40 +0800 (GMT+08:00)
Message-ID: <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
Date: Thu, 9 Oct 2025 12:10:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <20251001180922.6bbe42ac@booty>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251001180922.6bbe42ac@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99c729f83903a3kunm16370414a6fa98
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhISlZKSRgYQkhITx4fSEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CRpZqVpXED0SBtQWsNn3unDFg6hHUsSbzj0hQuFlxkwW+RHOgdqWJ+gRlo060O6EvTD8QiK/bJkRJC7jl8p3TKWpa+RYxJFZxheUO49caZ0+LEO/SzLEqHTLZz4OpdNo5ABc75WLQf70YZcuBwLuXIDCpICPiK4KZ7G+gX4C7Gg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qQ2zeMeYDfoWTQYJ4xG+nhpK+0ZJUttKUUEWrzWjUSw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_211048_778446_58CB818C 
X-CRM114-Status: GOOD (  31.57  )
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

On 10/2/2025 12:09 AM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue, 30 Sep 2025 17:09:13 +0800
> Damon Ding <damon.ding@rock-chips.com> wrote:
> 
>> When multiple bridges are present, EDID detection capability
>> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
>> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
>> determined by the last bridge in the chain, we handle three cases:
>>
>> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>>   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>>     &drm_bridge_connector.bridge_edid to NULL and set
>>     &drm_bridge_connector.bridge_modes to the later bridge.
>>   - Ensure modes detection capability of the later bridge will not
>>     be ignored.
>>
>> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>>   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>>     &drm_bridge_connector.bridge_modes to NULL and set
>>     &drm_bridge_connector.bridge_edid to the later bridge.
>>   - Although EDID detection capability has higher priority, this
>>     operation is for balance and makes sense.
>>
>> Case 3: the later bridge declares both of them
>>   - Assign later bridge as &drm_bridge_connector.bridge_edid and
>>     and &drm_bridge_connector.bridge_modes to this bridge.
>>   - Just leave transfer of these two capabilities as before.
> 
> I think the whole explanation can be more concisely rewritten as:
> 
> If the later bridge declares OP_EDID, OP_MODES or both, then both
> .bridge_modes and .bridge_edid should be set to NULL (if any was set
> from a previous bridge), and then .bridge_modes and/or .bridge_edid be
> set to the later bridge as is done already.
> 
> Does this look correct (i.e. does it convey the same meaning)?
> 
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   	struct drm_connector *connector;
>>   	struct i2c_adapter *ddc = NULL;
>>   	struct drm_bridge *bridge, *panel_bridge = NULL;
>> +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
>>   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
>>   	unsigned int max_bpc = 8;
>>   	bool support_hdcp = false;
>> @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   	 */
>>   	connector_type = DRM_MODE_CONNECTOR_Unknown;
>>   	drm_for_each_bridge_in_chain(encoder, bridge) {
>> +		pre_bridge_edid = bridge_connector->bridge_edid;
>> +		pre_bridge_modes = bridge_connector->bridge_modes;
>> +
>>   		if (!bridge->interlace_allowed)
>>   			connector->interlace_allowed = false;
>>   		if (!bridge->ycbcr_420_allowed)
>> @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   			bridge_connector->bridge_detect = bridge;
>>   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>>   			bridge_connector->bridge_modes = bridge;
>> +
>> +		/*
>> +		 * When multiple bridges are present, EDID detection capability
>> +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
>> +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
>> +		 * are determined by the last bridge in the chain, we handle
>> +		 * three cases:
>> +		 *
>> +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>> +		 *    &drm_bridge_connector.bridge_edid to NULL and set
>> +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
>> +		 *  - Ensure modes detection capability of the later bridge
>> +		 *    will not be ignored.
>> +		 *
>> +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>> +		 *    &drm_bridge_connector.bridge_modes to NULL and set
>> +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
>> +		 *  - Although EDID detection capability has higher priority,
>> +		 *    this operation is for balance and makes sense.
>> +		 *
>> +		 * Case 3: the later bridge declares both of them
>> +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
>> +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
>> +		 *  - Just leave transfer of these two capabilities as before.
>> +		 */
>> +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
>> +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
>> +			if (pre_bridge_modes)
>> +				bridge_connector->bridge_modes = NULL;
>> +		}
>> +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
>> +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
>> +			if (pre_bridge_edid)
>> +				bridge_connector->bridge_edid = NULL;
>> +		}
>> +
> 
> If the above rewrite is correct, then I think this patch can be
> rewritten in a simple way (build tested only):
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index a5bdd6c10643..bd5dbafe88bc 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>                  if (!bridge->ycbcr_420_allowed)
>                          connector->ycbcr_420_allowed = false;
>   
> -               if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -                       bridge_connector->bridge_edid = bridge;
> +               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
> +                       bridge_connector->bridge_edid = NULL;
> +                       bridge_connector->bridge_modes = NULL;
> +                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +                               bridge_connector->bridge_edid = bridge;
> +                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +                               bridge_connector->bridge_modes = bridge;
> +               }
>                  if (bridge->ops & DRM_BRIDGE_OP_HPD)
>                          bridge_connector->bridge_hpd = bridge;
>                  if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>                          bridge_connector->bridge_detect = bridge;
> -               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -                       bridge_connector->bridge_modes = bridge;
>                  if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
>                          if (bridge_connector->bridge_hdmi)
>                                  return ERR_PTR(-EBUSY);
> 

Yes, this is correct and maintains functional equivalence with the 
previous implementation.

I previously attempted to implement this feature by modifying the logic 
in this section. However, that approach would obscure the explicit 
propagation semantics of the bridge chain flags 
(OP_EDID/OP_HPD/OP_DETECT/OP_MODES). Therefore, I finally decided to 
implemented it as a specific check after this code block.

Dmitry, what's your take on this?

> Another thing to note is that this patch conflicts with [0], which I
> plan to apply in the next few days. The two patches are orthogonal but
> they insist on the same lines (those assigning
> bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> comes later will be easily adapted. Just wanted to ensure you are aware.
> 
> [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> 

This is indeed a clever approach to the managing bridge resource cleanup 
in drm_bridge_connector. Thanks a lot for the heads-up! I'll resolve 
this conflict and rebase the patch series.

Apologies for the delayed reply as I was on vacation. ;-)

Best regards,
Damon


