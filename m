Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFDC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xUN0y9tD66f1svU9Zz7etOEXfYYso6YFCLNHspL5Wo=; b=FNPDSClimJR0sbBGWLkYrWlrzu
	0Wlzcc79OMCVTo+R3g//t7M1H5WSlfKsQYtPkW6yUjU5/g1qFBT15Rf3Zc7//xU0OWCp+GtgtIvkC
	zvo2zj/ngbLt9b/Cs08sRTBDbOXg+wPPAE292YTw/AgbPjCVJAHySnkOOHD/P6wYVvy4pXb6Yn2Pm
	gjgOsV9SSXv37WFxKjWRrXJx5Gud7qw/K/BXkW5bB/iPrSD6RvlREnMbrVN/huwXs8TA1Jv+w/+mf
	DprLq73MElqTE619g/nVcSR1re4lYM69B07HdNoPb4jTlvSjhWUp02ChGky2smD48DgAGLSLDR7D6
	LDTQjIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0uT-0000000BVcT-2jMj;
	Tue, 27 May 2025 20:28:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0sJ-0000000BVTg-3oJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 20:26:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBdRea009222
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 20:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4xUN0y9tD66f1svU9Zz7etOE
	XfYYso6YFCLNHspL5Wo=; b=d8Bm5WMwIc5IosRakZB5otsePFFFIlm+u5xuGdyk
	G4HiSOd8wHfHCOMkjdid0I2CH4tvihInQvTbhBI2IL+jgR7ArXeu53hu1iGLfh5c
	QKe5P+yARJbg4/ydA3hsWEAtzUTCvR+DCrbl1a2rVZ0IqdbNfuFT8vjc1XNgGeIB
	lZN6d6tJhn2XsOU3hDes8Fk47oN6Q+KOUj7NcsJU00+GKSe/Rjt8hdvdTOvkatxH
	1VqUlTK7UGLLGPQKb/wA9h46qckyW15Ms13fu8/G3YZk0ZAOPyZhTioDQi4DNbN4
	vS8nGh8RdsEaQd+J7r5F4qCB/EZcAWl4ohP2WeLLpbu9Mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p86ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 20:26:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fa9d9b3e28so112175046d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 13:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748377573; x=1748982373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xUN0y9tD66f1svU9Zz7etOEXfYYso6YFCLNHspL5Wo=;
        b=HIJeXFx4EeUwdp5qhKSuft/DxzEnIvS688Svpa5BdHxBPQ0wbwNNUOFh+S2YhL/HIl
         FOzUm6iuZ6ShfIat2SER25R/O8nL2R/quy9PkhwCs2c1y+wg6u6noSnqQw5Ki2s1tbkW
         eCzeNJ6Kv8WsOMbxBaWuoHgjDuTLR+LgeqhiB2dWzun9jbeSPzsBeaKMbnboBK/jtBlE
         vzawuNrnOyEOgXqVjdQbE+0P0w7vto5E8Z6pDX9vi4IcuxJrpUQEao9+4HWaM48jTQv5
         6teLA1azcbzqLT/+lYBiEdIA8zJFjsoz1IoCrEKWnNZ17e1AQC+YR8i78N+au6X365je
         QUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXsedP92Xk8zQ6GIQ7QZEny7LXScFT55bd/wgIg5h1YkWrwmor1UD5Wx969tYTDppnVgrc+2BsRP6UJHaCAz8E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1H/BkSKpVKw7W99Sy1kCyABkCaYxt8fb8sfOFzaDomClm8CYm
	Sg+Z7y/lKXmq7ybyKKfot+gdKGTo+wXMCusqQkDtvCDSf+yYRN2J0ZMbme7yawAlz9/rnV5xReO
	3KvcOdbh2klFjiAv4SqvRcytA3ymHAt2jMov9Qd1LlrzvtHgjxMugF9ZPkC5yIw+woY9lYvfU5G
	1koQ==
X-Gm-Gg: ASbGncuX/14yrB1z5PS1rqmFrZVWMd82B+ODz1rdtAHvxGCGeE4GVtUoMXEQx9VJ3kD
	nYDIxQGkmla/XWXghF+KJS0FK63nASc+xV7uFyUWMSdXVF/JaEdvos+Vmcz4xlXiZG43PWkOpyc
	XBwNphn+HA4kkpzg1VMniVcOipXbJOVLlje6nl5CRlpmy1JdqeLqlPfCSSduvyruWmUDMKKiJ7a
	4NXGNfM2rz2DQvBd4Kyy2drCrFLTxUFmd+5qZpiKSU7F1lRiMOow3n/23juNH7D9M0kbuAIQRdP
	D3Ge3pcAJ12prAkaVirJN87693u2G20rLRbXmyWC+/T93E0jJvymxLbjfpTUZZEZJKVv7Vt+gkA
	=
X-Received: by 2002:ad4:5b81:0:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6fa9d3229a8mr267504366d6.28.1748377572797;
        Tue, 27 May 2025 13:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIMvKx83CAGoAKuZ6b+GRDnxaFhcYLgNEmLiEF7jLpdTEpjQ2RM1yZ/MdwH+P9+KF0Ikr5Yw==
X-Received: by 2002:ad4:5b81:0:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6fa9d3229a8mr267503896d6.28.1748377572385;
        Tue, 27 May 2025 13:26:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532ee72cddsm13110e87.215.2025.05.27.13.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:26:00 -0700 (PDT)
Date: Tue, 27 May 2025 23:25:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
Message-ID: <e2dnvpbze4xuubggduqr3p5nnhg7huk3dnpdcb6tldxbrn2qtn@bfsewz5trfv3>
References: <20250527081447.304-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527081447.304-1-kernel@airkyi.com>
X-Proofpoint-GUID: YqAdpP1v_lDrvvT5iIGNmD3tQS7Hy_XO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3MSBTYWx0ZWRfX953D0pFIB0bP
 qzh6FkZQ4hMT7sIi59IfQdFC8f34oCKBJ9jborYTK2KqTLCfZJkhGK6dHQf+xHujqKCO+l3JgW1
 yCcBNbW3yzHPzmhn/0kG1aJHoiKcF76kNxIBihazAM5Yacwj8lqz4fZQW9546bjiTQ96Pb2BlC3
 fvHi7eo7wF1ni7TxZvNb+iTiWWC9VUwIADyouNDdrj84Xl6NDbqcpfeJ8IWoNnsuzQfFlmXOsXT
 L+tXBJxJ+Xyheg5KidvXn6pl/ncFkkrYZaMfGzzZpLlr9DP7/w0VO8kCDHPXTAC/FrRmxaUAfqM
 XpMgwKMX2hyeveWdtn0yIaEZn5C4h0BSWfwOkO3AqaYxtFFTSGIFyQFPY3Gb2MU6bJx2jNxAblm
 m1N38IlJ+eYk6H9qve7EQl0BH6eU+KFxfUquo1bT8WCdCna8O0KtVEr8Jp/52s0E+hLSW5oN
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68361fe6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=s8YR1HE3AAAA:8
 a=_UkGs5bstnNi4Q_uqmUA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=uGDpjx9DKq9E8W49yboe:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: YqAdpP1v_lDrvvT5iIGNmD3tQS7Hy_XO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_132615_952473_D0BA28F3 
X-CRM114-Status: GOOD (  41.39  )
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

On Tue, May 27, 2025 at 04:14:47PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> Considering that some code depend on the connector, the following
> changes have been made:
> - Only process edid in &drm_bridge_funcs.edid_read(), so no need to
> store additional edid info.
> - Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> cdn_dp_bridge_atomic_enable().
> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.
> 
> This patch also convert to use devm_drm_bridge_alloc() API.
> 
> Tested with RK3399 EVB IND board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250523011310.120-1-kernel@airkyi.com/
> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers
> - Remove the dependency for connector
> - Remove the extra stored edid
> - Code cleanup
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250507035148.415-1-kernel@airkyi.com/
> - Use drm_atomic_get_new_connector_for_encoder() to get connector
> - Convert to use devm_drm_bridge_alloc() API
> - Fix typo: cdn_dp_connector_edid_read -> cdn_dp_bridge_edid_read
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 279 ++++++++++---------------
>  drivers/gpu/drm/rockchip/cdn-dp-core.h |   9 +-
>  2 files changed, 110 insertions(+), 178 deletions(-)
> 


> @@ -595,16 +546,41 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
>  static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
>  					       bool plugged)
>  {
> -	if (dp->codec_dev)
> -		dp->plugged_cb(dp->codec_dev, plugged);
> +	if (dp->sink_has_audio)
> +		drm_connector_hdmi_audio_plugged_notify(dp->connector, plugged);

I'd say, notify always and let userspace figure it out via the ELD. Then
you shouldn't need sink_has_audio. This would match the behaviour of
HDMI drivers.

>  }
>  

[...]

> @@ -705,8 +681,6 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
>  
>  static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
>  	.mode_set = cdn_dp_encoder_mode_set,
> -	.enable = cdn_dp_encoder_enable,
> -	.disable = cdn_dp_encoder_disable,
>  	.atomic_check = cdn_dp_encoder_atomic_check,

Nit: for the future cleanup, it should probably be possible to get rid
of these encoder ops too by moving them to the bridge ops.

>  };
>  

[...]

> @@ -1006,7 +947,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
>  
>  out:
>  	mutex_unlock(&dp->lock);
> -	drm_connector_helper_hpd_irq_event(&dp->connector);
> +	if (dp->connector)
> +		drm_connector_helper_hpd_irq_event(dp->connector);

drm_bridge_hpd_notify(). I think then you don't need dp->connector.

>  }
>  
>  static int cdn_dp_pd_event(struct notifier_block *nb,
> @@ -1062,26 +1004,35 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  
>  	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
>  
> -	connector = &dp->connector;
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -	connector->dpms = DRM_MODE_DPMS_OFF;
> -
> -	ret = drm_connector_init(drm_dev, connector,
> -				 &cdn_dp_atomic_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret) {
> -		DRM_ERROR("failed to initialize connector with drm\n");
> -		goto err_free_encoder;
> -	}
> +	dp->bridge.ops =
> +			DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_EDID |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_DP_AUDIO;
> +	dp->bridge.of_node = dp->dev->of_node;
> +	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> +	dp->bridge.hdmi_audio_dev = dp->dev;
> +	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> +	dp->bridge.hdmi_audio_spdif_playback = 1;
> +	dp->bridge.hdmi_audio_dai_port = -1;
> +
> +	ret = devm_drm_bridge_add(dev, &dp->bridge);
> +	if (ret)
> +		return ret;
>  
> -	drm_connector_helper_add(connector, &cdn_dp_connector_helper_funcs);
> +	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		return ret;
>  
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret) {
> -		DRM_ERROR("failed to attach connector and encoder\n");
> -		goto err_free_connector;
> +	connector = drm_bridge_connector_init(drm_dev, encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
> +		return ret;
>  	}
>  
> +	drm_connector_attach_encoder(connector, encoder);
> +
>  	for (i = 0; i < dp->ports; i++) {
>  		port = dp->port[i];
>  
> @@ -1101,30 +1052,19 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  	schedule_work(&dp->event_work);
>  
>  	return 0;
> -
> -err_free_connector:
> -	drm_connector_cleanup(connector);
> -err_free_encoder:
> -	drm_encoder_cleanup(encoder);
> -	return ret;
>  }
>  
>  static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
>  {
>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder = &dp->encoder.encoder;
> -	struct drm_connector *connector = &dp->connector;
>  
>  	cancel_work_sync(&dp->event_work);
> -	cdn_dp_encoder_disable(encoder);
>  	encoder->funcs->destroy(encoder);
> -	connector->funcs->destroy(connector);
>  
>  	pm_runtime_disable(dev);
>  	if (dp->fw_loaded)
>  		release_firmware(dp->fw);
> -	drm_edid_free(dp->drm_edid);
> -	dp->drm_edid = NULL;
>  }
>  
>  static const struct component_ops cdn_dp_component_ops = {
> @@ -1171,9 +1111,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  	int ret;
>  	int i;
>  
> -	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> -	if (!dp)
> -		return -ENOMEM;
> +	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
> +				   &cdn_dp_bridge_funcs);
> +	if (IS_ERR(dp))
> +		return PTR_ERR(dp);
>  	dp->dev = dev;
>  
>  	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
> @@ -1209,19 +1150,11 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  	mutex_init(&dp->lock);
>  	dev_set_drvdata(dev, dp);
>  
> -	ret = cdn_dp_audio_codec_init(dp, dev);
> -	if (ret)
> -		return ret;
> -
>  	ret = component_add(dev, &cdn_dp_component_ops);
>  	if (ret)
> -		goto err_audio_deinit;
> +		return ret;
>  
>  	return 0;
> -
> -err_audio_deinit:
> -	platform_device_unregister(dp->audio_pdev);
> -	return ret;
>  }
>  
>  static void cdn_dp_remove(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> index 17498f576ce7..6aa3ce489382 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> @@ -8,6 +8,8 @@
>  #define _CDN_DP_CORE_H
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>

This include can go to the C file instead of the header.

>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <sound/hdmi-codec.h>
> @@ -65,12 +67,12 @@ struct cdn_dp_port {
>  struct cdn_dp_device {
>  	struct device *dev;
>  	struct drm_device *drm_dev;
> -	struct drm_connector connector;
> +	struct drm_bridge bridge;
> +	struct drm_connector *connector;
>  	struct rockchip_encoder encoder;
>  	struct drm_display_mode mode;
>  	struct platform_device *audio_pdev;
>  	struct work_struct event_work;
> -	const struct drm_edid *drm_edid;
>  
>  	struct mutex lock;
>  	bool connected;
> @@ -102,8 +104,5 @@ struct cdn_dp_device {
>  
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>  	bool sink_has_audio;
> -
> -	hdmi_codec_plugged_cb plugged_cb;
> -	struct device *codec_dev;
>  };
>  #endif  /* _CDN_DP_CORE_H */
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

