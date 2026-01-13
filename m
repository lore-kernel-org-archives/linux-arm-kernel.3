Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD19D29DDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhTcfD/CMFWgQbt2pmRO5UpxDwpZhvJVqYUMDa7UvOc=; b=a+qstghxYGLlucJcwwale2gy1y
	Qw7CovH5fNc2L5wFtDO3Fg6+Li97pwiMTrkzXtr5DR7Hg2Ab8QQt20Qxh6z1103PXTPn+oQVg+3xx
	cinn32uGqYfQyPkXKBkKVXLh6ekEnhqXSeRl6vwosRKMUfnwoRqK6CqO7L3Q+VBw+wyb4gtfeyOeI
	Aon+TKCMrqHXGUQKjXZel5Yq44BOBFkS5zwrJ/PQHkmI572zGTcEvhu5JNEQGEyoG6sGgYhOmsL/5
	9aNuFtY0ah0xHK/NdYNXo1muwpTTHI8uNpn1d0vLMWCcPnGLjBe3afmEppC/bO6ImeIobwJROkuYC
	lxAdhx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg2C-00000007KbU-11il;
	Tue, 13 Jan 2026 15:10:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg28-00000007KaA-2gi2;
	Tue, 13 Jan 2026 15:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768317008;
	bh=3Qt3PPBW0EOqivH7PZKc5Rp9J4QVVjOldfrh4WBzw4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=APMuYhk6HiXkfK0tgcarBgKZ/Exw2pisufwnpt8i+3dJCVUESaxTZcGQPQLqfEdjT
	 6Zze6kL3ZBBqCdB3frKCF3Ohd4trq8s7l6qgNQPv3Z88QuI3snH4zVkz1CGqnz66u0
	 GvGubIOqvDO3Lcfe5I5GpUj44k/iKg0RmfSeIp4r4+yA5NWHD+e0lOGI+/HUKeYYdZ
	 PMFxTKPPEYuJ/G/HytMam0EX5hFIG6CBgqN/9nCFzWpoiOW3LNEY/QK4H5OrO4YaAc
	 bYw+rLPiO3HQhDawE+VScw5laGg2zfJpqnNqNvhZ5bCllMg444nMqBc7Ru6g5/Kn+4
	 xhVATSp5KSdfw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63DB617E0443;
	Tue, 13 Jan 2026 16:10:07 +0100 (CET)
Message-ID: <38f9e21c-ac64-45cd-a425-4036ad2ef32b@collabora.com>
Date: Tue, 13 Jan 2026 17:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio
 and scrambling support
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
 <20260113-dw-hdmi-qp-scramb-v2-3-ae7b2c58d24d@collabora.com>
 <20260113-unselfish-russet-chicken-80d3c3@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260113-unselfish-russet-chicken-80d3c3@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_071012_874180_2BBD8DCC 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Maxime,

On 1/13/26 5:00 PM, Maxime Ripard wrote:
> On Tue, Jan 13, 2026 at 12:26:20AM +0200, Cristian Ciocaltea wrote:
>> @@ -902,13 +981,74 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
>>  
>>  	hdmi->tmds_char_rate = 0;
>>  
>> +	dw_hdmi_qp_disable_scramb(hdmi);
>> +
>> +	hdmi->curr_conn = NULL;
>>  	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
>>  }
>>  
>> -static enum drm_connector_status
>> -dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
>> +static int dw_hdmi_qp_reset_link(struct dw_hdmi_qp *hdmi,
>> +				 struct drm_connector *conn,
>> +				 struct drm_modeset_acquire_ctx *ctx)
>> +{
>> +	struct drm_crtc *crtc;
>> +	u8 config;
>> +	int ret;
>> +
>> +	if (!conn->state)
>> +		return 0;
>> +
>> +	crtc = conn->state->crtc;
>> +	if (!crtc)
>> +		return 0;
>> +
>> +retry:
>> +	ret = drm_modeset_lock(&crtc->mutex, ctx);
>> +	if (ret)
>> +		goto check_err;
>> +
>> +	if (!crtc->state->active)
>> +		return 0;
>> +
>> +	if (conn->state->commit &&
>> +	    !try_wait_for_completion(&conn->state->commit->hw_done))
>> +		return 0;
>> +
>> +	ret = drm_scdc_readb(hdmi->bridge.ddc, SCDC_TMDS_CONFIG, &config);
>> +	if (ret < 0) {
>> +		dev_err(hdmi->dev, "Failed to read TMDS config: %d\n", ret);
>> +		return 0;
>> +	}
>> +
>> +	if (!!(config & SCDC_SCRAMBLING_ENABLE) == hdmi->scramb_enabled)
>> +		return 0;
>> +
>> +	dev_dbg(hdmi->dev, "%s resetting crtc\n", __func__);
>> +
>> +	drm_atomic_helper_connector_hdmi_hotplug(conn, connector_status_connected);
>> +
>> +	/*
>> +	 * Conform to HDMI 2.0 spec by ensuring scrambled data is not sent
>> +	 * before configuring the sink scrambling, as well as suspending any
>> +	 * TMDS transmission while changing the TMDS clock rate in the sink.
>> +	 */
>> +	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
>> +
>> +check_err:
>> +	if (ret == -EDEADLK) {
>> +		drm_modeset_backoff(ctx);
>> +		goto retry;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge,
>> +				    struct drm_connector *connector,
>> +				    struct drm_modeset_acquire_ctx *ctx)
>>  {
>>  	struct dw_hdmi_qp *hdmi = bridge->driver_private;
>> +	enum drm_connector_status status;
>>  	const struct drm_edid *drm_edid;
>>  
>>  	if (hdmi->no_hpd) {
>> @@ -919,7 +1059,15 @@ dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connec
>>  			return connector_status_disconnected;
>>  	}
>>  
>> -	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
>> +	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
>> +
>> +	dev_dbg(hdmi->dev, "%s status=%d scramb=%d\n", __func__,
>> +		status, hdmi->scramb_enabled);
>> +
>> +	if (status == connector_status_connected && hdmi->scramb_enabled)
>> +		dw_hdmi_qp_reset_link(hdmi, connector, ctx);
>> +
>> +	return status;
>>  }
> 
> We have drm_bridge_helper_reset_crtc() now, any reason you didn't use it?

Ups, I missed it somehow..

Thanks,
Cristian

