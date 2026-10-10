Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A07ECA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 02:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5z0sWq1xdiTzWPgicaSELr86K89CYKpEepP4VhiG/1g=; b=efiX8Xd8WQmE7NSd3fztJsiBt9
	n5cMl65QcVHKW/PS7aLIeQaEn0Qiew9FNz2jf5LFndNZT23EuNcSKnFqC9gK/TBBoW+AgWc0otd5X
	bjxHYi00aoqGGpbxZtjKhwdiz76rwMl+FDMChTrzFOwJDd4o6mamOv59qnut+S/WAlrQ8gxr22RmP
	DU9FE4gEsS7rBd5KIYrNwIxfFkmibNL56Z3o33YbhFF7G4jEzGeG/YRRUNsPBwOe6vxhVTRDzZ4v/
	hGH9WtB7qxBUavAGYAunXedcHR28hMKB54l+8RQEcT6/fZakLj5yJlok/M8yWo57Uue5Ok7NDT+fs
	RHv142IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMzo-00000007R3R-1ouq;
	Sat, 10 Oct 2026 02:39:36 +0000
Received: from mail-m81213.netease.com ([47.88.81.213])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMzj-00000007R2f-2uvs;
	Sat, 10 Oct 2026 02:39:34 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50844c1f1;
	Sat, 10 Oct 2026 10:39:17 +0800 (GMT+08:00)
Message-ID: <82df3bec-7734-4d84-9e20-a563e6231aa9@rock-chips.com>
Date: Sat, 10 Oct 2026 10:39:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] drm/bridge-connector: Attach max bpc for
 non-HDMI bridges
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Igor Paunovic <royalnet026@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dragon@radxa.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-3-1835d4966da3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa123add66203a7kunm2ab09db81359c42
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0pOVhhNSkpDTE5LGUxLTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=i94VClHpmYbPXhra1VFNUWbroJUdigk/oWp50gX7ervPys3K2s89uJ6im7uYzB+K9Mxa0lfSSxWf283hIRmL3nwSXVFQmawBo3cLD/gvMowHXWjivohlyoUWXk+3x5MmP+uXkfggUtHMpXew44L7yTW2oTI2X/HnWu3BM3ghnJg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5z0sWq1xdiTzWPgicaSELr86K89CYKpEepP4VhiG/1g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_193933_113879_E0D1B5F4 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Xilin,

On 10/9/2026 11:15 AM, Xilin Wu wrote:
> Allow non-HDMI bridges to advertise their output bit-depth limit through
> max_bpc. Attach the max bpc property when the lowest reported limit in the
> chain exceeds 8, ignoring bridges that do not report a limit. This lets
> DP drivers expose deep-color support without attaching the property in
> their connector initialization code.
> 
> Use a lower bound of 6 for DP and eDP, which support 6 bpc RGB output, and
> 8 for other connector types. Keep the existing HDMI registration path.
> The property can be attached before connector state allocation; the
> atomic state helper initializes its default when state is created.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++++++++
>  include/drm/drm_bridge.h                       | 11 ++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 8b54069fa53a..be2e08a3694a 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -825,6 +825,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
>  	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  	unsigned int max_bpc = 8;
> +	unsigned int chain_max_bpc = 0;
>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;
> @@ -985,6 +986,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			panel_bridge = drm_bridge_get(bridge);
>  		}
>  
> +		if (bridge->max_bpc)
> +			chain_max_bpc = chain_max_bpc ?
> +				min(chain_max_bpc, bridge->max_bpc) : bridge->max_bpc;
> +

The check on chain_max_bpc here doesn't seem to make any sense.


>  		if (bridge->support_hdcp)
>  			support_hdcp = true;
>  	}
> @@ -1026,6 +1031,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					  connector_type, ddc);
>  		if (ret)
>  			return ERR_PTR(ret);
> +
> +		if (chain_max_bpc > 8) {
> +			unsigned int min_bpc = 8;
> +
> +			if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			    connector_type == DRM_MODE_CONNECTOR_eDP)
> +				min_bpc = 6;
> +
> +			ret = drm_connector_attach_max_bpc_property(connector, min_bpc,
> +								    chain_max_bpc);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}
>  	}
>  
>  	if (bridge_connector->bridge_hdmi_audio ||
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 58fff047f43b..01ad1878149e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1089,9 +1089,14 @@ struct drm_bridge {
>  	unsigned int supported_formats;
>  
>  	/**
> -	 * @max_bpc: Maximum bits per char the HDMI bridge supports. Allowed
> -	 * values are 8, 10 and 12. This is only relevant if
> -	 * @DRM_BRIDGE_OP_HDMI is set.
> +	 * @max_bpc: Maximum bits per color component the bridge supports.
> +	 * Zero means that the bridge does not report a limit. For HDMI bridges
> +	 * with @DRM_BRIDGE_OP_HDMI set, allowed values are 8, 10 and 12.
> +	 *
> +	 * For non-HDMI connectors, drm_bridge_connector_init() attaches the
> +	 * max bpc property when the lowest nonzero limit in the bridge chain
> +	 * exceeds 8. Bridges remain responsible for validating configurations
> +	 * against any limits not reported here.
>  	 */
>  	unsigned int max_bpc;
>  
> 

-- 
Best, 
Chaoyi

