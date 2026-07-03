Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB37C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKo6OPhVEgyLPX0yHK/easdgO+usCoQyvOamCjz3XwA=; b=4AjgjO7lVQKn38NgEOC4uN/V3V
	e45X2G/yY/t7h2Nrqqr4q0yEdg//CNQeR5Dzd4yShp1wbl6fzDv3w+jSm3iDk6R5PKbo7YDDzZvLG
	WZeVI2LFnwL3njTumxKNOC74MGLVUr6KO4pyomQjU+2XUVELT9zQBJpmnSQ8/udOpHj1q5KlKaHHr
	vIhO6K+H85LgvZ1EWl49lWzEc8ws4XlIhdXr3l4KMHjcLh8iSQlq+Q2tT+rcQLMlo7W+F23lVFNHh
	TYT4xWJuEDajI3u4EUx4rcCl2kizX2OFddOkpRclbCaIi/r546J7ln84IyEWIgpLHavgMC/fKC2hq
	RT82Ra2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfejT-00000007EwQ-36uw;
	Fri, 03 Jul 2026 14:19:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfejR-00000007Evf-2Ln3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:19:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663AtWRg3136109
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YKo6OPhVEgyLPX0yHK/easdg
	O+usCoQyvOamCjz3XwA=; b=X+a0dWsQ9cZuaaIyMj61+0hDJJZjyCRiqV/fZMJg
	dE+L7cUwNkPgEwelSfjEIG+7ea9v/gkwaIwvaJTiUF/lL6FWGSn1DPYWYtv9d5tK
	Q+ecSfKBk/yLVLIQBKxFLnhfn32t1/a9JPdfsf4bNzRSipOSWrAAo44yfRnV7f+M
	3E+Fds1MRs2t0WCK0a1cn06e22yQWBbA5S591GPqKd8Rdzv47tEJKWDeoU2dthkp
	GBbJC1i/3OzRAwbWPS+lRXgrA++g2Lkv5wmPHCrRmsHp8fRjlPTQNka6uwPNgKJV
	RJrUCeN+XZSgorizlNgs1FZ0QBiw2wmA6g+a85xmnPn5tA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5apae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 14:19:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd83569844so831633e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783088344; x=1783693144; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKo6OPhVEgyLPX0yHK/easdgO+usCoQyvOamCjz3XwA=;
        b=VVFSEwyNHc3iqwf+QahbuzF49yxAJ3pDmFXer4d2TfH9YH77TmIyk5pYUuyOpDEBdf
         im6h/pX3nFlZmpcAMODL3qy2ECsEuSilPdfXqEB9RqXmXU2YQ3LME3LOmqCVCQRnSbnJ
         CCxZNnAmDMGFfeuhLcQX5XLAbN5XcsrKUELuQMS9Q9twTxkxf6aDlDGDAjSKCJGBPNpf
         sMqN876FiiMZ8I5zGvFr/JLRLbXsbCm6juaXv3oKBUdNPEiZCupO/sZ1MknZVzqE+Exp
         5vVzX4Dt8E+Je0Iu4Yj6/ufnmT441AtQnM9ydoEWMSIg/hAGTDbXa9/y20x5c6XmbH9Q
         P0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088344; x=1783693144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKo6OPhVEgyLPX0yHK/easdgO+usCoQyvOamCjz3XwA=;
        b=SrxAgerIN1Y6LE+aO21Rd/yj2tfTd+WPT66lID51E6KhZGxLYk4HcqmY5TATDSe4eZ
         /70ouJVlFIcknkmt8I0tkWApaY4x1uHOjE6SaVwx5Gc2JqmjkdalqP1JODkwwfsYN7QJ
         wqYZwXxBmu09oR84I910ec8qpqttJiX7lqcKpkQ+xx0mhim2juwi+peBPxtxcwpjJfMd
         IW3KJysVhXVKFZlGtqmwiLTk7NXO7ORItVO/R8yfBnG3W0yhXn+wKNCXJAEpmVH/i0lg
         8K9UT796DQkV5GlHvLxQn1PHzBIokGCG8/Ks8ztdvi8v/JxMJghqgM2PCdb+Bff/48p8
         9/Ug==
X-Forwarded-Encrypted: i=1; AHgh+Roxmlptpf99Q/fl+q6YxjFGsGpi36hx5a/W9fmjPZiDXL+ENyNZNo10sKrpxXXtHrg/bCyNcGuu7W7b2v6e5NIJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzQOAGRJW4cSoFgy+qEFSFb48Fg+WHAK5q3OkOzFNmiho7uHvEy
	tei+7aV3rpwqpA9tG/bJ7719dIPaTs5FOkoaw2M10rYElGUHAYuzjxzxbYYpRXHJ4biHIeHL7tg
	+XFfUw7svG0ZvHEhvzQPkLyHhHATkk2YhryMIVo/SuowWlpeTb27hGXwOwpyrAR30Ea9IRHHp8w
	eVHA==
X-Gm-Gg: AfdE7cltAz4yGNTTtgYzG09dIkrMTEZSHTJo/qa+mmOWoyjzb6SM8QcJAoe6UgnCNnb
	/5+fN2KrqqJibbkC1Uxfbhj0u4HUjQ1OozPxa9Pcu6J1aPmn4jLlAPMuLtZBiE5peFRwkJ/iLrP
	P6McMwckfciP/F7gbohgTeGMOEHPC1tquF0CoA1Ui6mU11q5+RWuuNlEoNIPqo3IsWxEBTH3tbl
	Md7VF6bZ9E9I/cegrvr8cWBFW58wfP4otq67Hp3Ds2PTtU6o1zUMO//zTqOhf2mce1jUCLHPxc+
	qc4KXZwX6R8TQ493LON1mTGH4VPjMZruF0ENyAYjqBFJgVtkBQv6HIUapDjGguJcZkqaoFozBKp
	jXiVanuETSraOpVXpPOp4tINTk0PKkPt6mN23fuVgYuDRP+1bR00aTnXMlRy6zTezTn6Yynm6EI
	IbHPNsWPbPwm5O6ZgBG3mXE5ZK
X-Received: by 2002:a05:6122:8b0f:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5bddf5de64amr4308824e0c.8.1783088343843;
        Fri, 03 Jul 2026 07:19:03 -0700 (PDT)
X-Received: by 2002:a05:6122:8b0f:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5bddf5de64amr4308805e0c.8.1783088343359;
        Fri, 03 Jul 2026 07:19:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377180sm514920e87.33.2026.07.03.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:19:02 -0700 (PDT)
Date: Fri, 3 Jul 2026 17:19:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 03/39] drm/display: bridge_connector: Pass HDMI
 capabilities through caps struct
Message-ID: <eqnr2hfclbdkry2jqe2kuufss5kus6qpjblewq35upnjwlhxhl@4awqxpwrnxk2>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-3-d79890d00b6a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-3-d79890d00b6a@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0MCBTYWx0ZWRfX8FAeGITE0re0
 Wcks6YGuj5SW8r3HgZ4mwJzzsYeGtLswzVLYQm+SRc/855AAVMZPCM3t/nTF56QTviCUKFPpAwy
 PUuRu17/IGi8Y+manyNpn+8yoLRY294=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47c4d9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8
 a=VsKdElH_S0EtIKHoY5UA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: b79tGb8lA8sE8YoqhI0dxPFeY75gMEBi
X-Proofpoint-GUID: b79tGb8lA8sE8YoqhI0dxPFeY75gMEBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0MCBTYWx0ZWRfX2624OXpspD2W
 GFYDY1d+zmr82vvdEnhhQAq2HxIYpkD8IuJWhkekyKV3H2XIf9qZmvUWL/zLg0FqyN/ea3YbUHD
 KBvXd6OU973JSdrtAP6csiuYt9Pj0rK5tmDvzpl3j/bUrYxVRe8F0Ab+hEapniLT3IKOpetuba5
 YCCh6Lr39JU9oo0Qbu4oe+AlS2JOytum/zJO4vsJcTnQAHHfEjjuxrasrqMGdOs4OTNE51w99CE
 mHj7nDfrXEtS6uQx5poxuZhd9tFbgsSw3xmoUkpBSgQL3o8CxgMqMsYDiBtaQyww9yhCy9ixhcP
 pMH8m040xCw9pEIKYWtQcedWlp6X0yAyXAfqs44kt859Cw+Kc6z44EHwTs4P1tVG31ZFunmxrHN
 Ict+IMUJmSRV93WyoA+5WnMXahwvnKs0xGh0jY3uZBHHYmX20HM3FOBZ/U6yhSBbVif38Mo+bDh
 VRXS8RCXiGLHN92MD+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_071905_607159_DFD0EA0A 
X-CRM114-Status: GOOD (  27.56  )
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

On Thu, Jul 02, 2026 at 05:46:16PM +0300, Cristian Ciocaltea wrote:
> Switch drm_bridge_connector_init() to
> drmm_connector_hdmi_init_with_caps(), collecting the bridge's HDMI
> properties into a stack drm_connector_hdmi_caps so future HDMI 2.x
> capabilities can be plumbed without growing the argument list.
> 
> Introduce struct drm_bridge::supported_hdmi_ver to let bridges declare
> the HDMI specification version they are conformant with, and forward it
> to the connector layer through the new caps struct so HDMI 2.x features
> can be gated on real source capability rather than guesswork.

And it's left uninitialized by the bridges, which doesn't mean anything.
If you don't want to touch all bridge drivers in one commit, please
provide some migration path and hopefully get rid of it by the end of
the series. At least, there should be a drm_warn() if the version in
unsspecified.

> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 29 ++++++++++++++------------
>  include/drm/drm_bridge.h                       |  6 ++++++
>  2 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 92f8a2d7aab4..796069dbf1a1 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -823,8 +823,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_connector *connector;
>  	struct i2c_adapter *ddc = NULL;
>  	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
> -	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
> -	unsigned int max_bpc = 8;
> +	struct drm_connector_hdmi_caps caps = {
> +		.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
> +		.max_bpc = 8,
> +	};

I'm really not sure that we need separate caps. But if we do, it would
make sense to embed it as is in the drm_bridge instead of having the
scattered fields.

>  	bool support_hdcp = false;
>  	int connector_type;
>  	int ret;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 18f3db367dc1..2d8b5e4c64ba 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1176,6 +1176,12 @@ struct drm_bridge {
>  	 */
>  	const char *product;
>  
> +	/**
> +	 * @supported_hdmi_ver: HDMI version the bridge is conformant with.
> +	 * This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
> +	 */
> +	enum hdmi_version supported_hdmi_ver;
> +
>  	/**
>  	 * @supported_formats: Bitmask of @drm_output_color_format listing
>  	 * supported output formats. This is only relevant if
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

