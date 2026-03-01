Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FDEFD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bK9Rayioe0UgWRcACzhZoK7I9TYxOeFDSz/Gu0Nylic=; b=exVZB+KFPi527n4OgmB9a+s7IH
	mL2C+B65kyeXStBs7VREalq72aUcfG16mIAEowplq4hGJFBz+mGnP38BSErMR0D/zmiemI3ujZsc8
	ySAE7w1aMQRV2CGVQTvX8MGvPRbkxZEDq6Dsmkiip6d6PGfiNr6fm5bwMJdTF9FhNqNsX5WCZyGSK
	l38pAhiBhJFWAjBa6aPXvwC8m40tnNc1MQgAGdLyatGwtbQrV8LbUHL8mon7rZOX0A4cssLtL8MYi
	GEkTyceD5Qej3UIug8ozxhczD0o6hGUNugPk7YLac4PaVpNWVsN/d1X9xBt0lFvgkBwSW2ukiaNOo
	umKtNxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk5a-0000000BgiS-06gD;
	Sun, 01 Mar 2026 16:56:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwk5W-0000000BghP-0M33
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:56:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH010N3652740
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 16:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bK9Rayioe0UgWRcACzhZoK7I
	9TYxOeFDSz/Gu0Nylic=; b=mBjnrffDDHvSCmAVgxFFuKtFmYIuk6135iS7R1sa
	d62AmumryokGk1gEDgvyDte2rkIz16lW88SVM+gS11Q4Q969cpNiKFz/FanyPAFJ
	ygPSXB4j3xoNMHKwnKlwL58ywMYPOFYmC253/4AgwN277sOnSw+ZaUwf0As4P5q/
	6cuGmkwIJMWnEumD8+ERFq+iS9AoA8bKJlnnFgLWJx9AfCwdBQrJHRP914lCmpPj
	J+MJCp0F8rdxZwoISkLcapOSOcjA4PONIlMFUAwG8humnOhcl6ADnctIzHZLVE5C
	QNv4ikVgM1coU7Ge7vQ2V/bjPT597E+erkxI3g9XSzHvOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd31ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 16:56:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b6b37d8so2842075585a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772384172; x=1772988972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bK9Rayioe0UgWRcACzhZoK7I9TYxOeFDSz/Gu0Nylic=;
        b=NrrJZtJLv+qMiIq6Qnl6yb4iHXUS3+PTDy1UC+KO5RLlzMe0ANBf9ha85wOFUH/D/I
         MyX9xyqaJbdbw/oiO5Ckvet1WMguvIOASJBE4oPG3RJwRQL8S1SjA9XhWEWUc9oiZugl
         oH9VSFxuK66lejbGyXN4xPaazLKwD1PiB2sYSmF2sYPgb40bRQ2W6J89evWxGqs1hbyT
         ZngZZplyzZW/TDYhCGtc4+IOT+y0nX+/SSn6iREJ4kQeb/10vdpQk/ffH4BypC/2zthO
         y/11/iUWV7r/7h9yyu0kdT88fKtQVV6+NALwv4Q0gDBoBi97kR9tNJygdILqJkiwOzMl
         dpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384172; x=1772988972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bK9Rayioe0UgWRcACzhZoK7I9TYxOeFDSz/Gu0Nylic=;
        b=CLyeTdZ1PpIA9NfqiXPrcUCyo7MQtX1DtqXwxiKuLpGBNGzT0qbP66kfRT7itZEjOs
         BbFMNGYkBDYMe9CLu03yTfQrpUUXIICDcGVHgD4RVf42SEad/kszcql7TUdw5Z+jZgOY
         SlFayYuz6FKn0kJesQQpDB9FcQ8m0V83BBTU25x9BBGc9fQ0Sul/72lzjcXkWqQ/mz+b
         0/qH7INnpEhQhkNpUtELQY5zwA6ja5UqoPtjWcbpGFpU8qF2+f5XWIeSUqYvpKC447Rt
         3hVc7p3omZVPBoKZScnwXYJe2Dp1170RiTc4WuJR7CTi4PlMjD/EifkSGPQw3jF3yJY9
         tf6w==
X-Forwarded-Encrypted: i=1; AJvYcCUOCuh0UoBxlRZQ5o8G4Msg71cKmqplmwc+hXtdxsGpqpIK/wZ/yXfSy+Wv5qZuDa5CpPgGHB24f3oQCHCyophS@lists.infradead.org
X-Gm-Message-State: AOJu0YxqYDCdus7Hk+YcCr8Ajb/zX2P58AMrdKJrA8qFC+OBqN2OwzNl
	ZHj9xkdtaEk6hdjcpl+OYsKQNYNx/WP0iZ3yBschokIuqleKnNSw+gYkmfz89Zl8MebcNRhv12T
	wzXMruQiaozpLGXIENGgjZCBiwe57d/xaiWEvMuCDXPD7lhM/jd1FR8VlK9LFWoWn8dF9oU5dFW
	ewJQ==
X-Gm-Gg: ATEYQzwuoyzcynFrfVQ7Rn2uEJ9l2gllRS2xnOwxEh2zK966EetP4hN5RqraK3TU3o8
	Gw3zH9+cSKpOH6E40fqioAmGwOKG82h/9CnFBs68EyyCvBnYPDRxB5ktfubGFunC2JEUnsH4ZHO
	wrA3zgPROd+JV6owku/sv2bFxpeSsq3052xV1dOa3HGw9bBZA0gTjy8eBrDLCAbBnr9lTbSvvQz
	CeadReypbEZKt3JGqo/7L0r+Nke1xB4nYXv7REFEkqRo1iW8YagooAyZXNGXgr4SDrQL8MPDFPB
	gYpJm4Q8NZGlc2aIkjnO+sNjRQ0ZEX0LVrfxD4njaYmdqB7zvRTtIfVqgfdluCdUPaRQo/85Ocb
	j0fpO6juOqvvKr+krZ3wZLAhdCOhiv5GaFA7KbjBJy7W022S25dr9mzP4XQQHrcORqFMKRL6CtM
	rS8p6Qp2W9KO6idcLsS6HhylOONcM/PSjxf2s=
X-Received: by 2002:a05:620a:28c2:b0:8ca:3c67:890f with SMTP id af79cd13be357-8cbc8e1b535mr1288640985a.76.1772384172031;
        Sun, 01 Mar 2026 08:56:12 -0800 (PST)
X-Received: by 2002:a05:620a:28c2:b0:8ca:3c67:890f with SMTP id af79cd13be357-8cbc8e1b535mr1288637485a.76.1772384171446;
        Sun, 01 Mar 2026 08:56:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116022215sm1093411e87.52.2026.03.01.08.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:56:10 -0800 (PST)
Date: Sun, 1 Mar 2026 18:56:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 03/19] drm/bridge: Act on the DRM color format property
Message-ID: <unfsi4t4t4wl74zudkq3oeiryvm2xgyiplugcaxhyvjmtn7s2l@72xhl5vrtyt3>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfXz1xE+9hW83Fu
 dy5MAd3L3Qf9P6rgEUw3MGF1G5wE99R5ckAT11LUH2XmfYdnw29sZ1xRw5N8kEXahEv2Sp5UglK
 vW/qMFP67f1Ragw6b463KniE5L0Twjn+kEpQNI4J11VsDNTMyqYwbcR7VYKnyayBR1THofjOHjm
 28pzSnxc655tGaCu5FVVuZo2HMWuJoODqUAjWx3xoDrbuMnWkWrzklnbFVxlcNIvcPzV+Jn4Zk7
 C8siZUl8yj+E29EpIH6YlHoFBDg2BFDL/OM8ixrPSI+wJGmuT8jP7t49ewrD8TSoS/P383sOY5h
 95G97D1QQOUONKEakkBB3ueGXZI1vWd4lW/uOvPgZE94KboRxEgIZSB0uWsaaO5eTReQ6qvibkz
 Kok8WQIlUPoEjMTiwEKrRPqL9Q8VT3lVdnO2O2W8Eh16/G4qdR5tRMHNc1493G1luHMRIF8U8wi
 RMeO7OolxY340Aomrjw==
X-Proofpoint-ORIG-GUID: SmXT8YwPDUY_a8RJWyvqoIx3PLHF_TsX
X-Proofpoint-GUID: SmXT8YwPDUY_a8RJWyvqoIx3PLHF_TsX
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a46fad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QX4gbG5DAAAA:8
 a=yKAVQKaA_AwziBLyn1oA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_085614_137980_385417B4 
X-CRM114-Status: GOOD (  36.35  )
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

On Fri, Feb 27, 2026 at 08:20:08PM +0100, Nicolas Frattaroli wrote:
> The new DRM color format property allows userspace to request a specific
> color format on a connector. In turn, this fills the connector state's
> color_format member to switch color formats.
> 
> Make drm_bridges consider the color_format set in the connector state
> during the atomic bridge check. For bridges that represent HDMI bridges,
> rely on whatever format the HDMI logic set. Reject any output bus
> formats that do not correspond to the requested color format.
> 
> Non-HDMI last bridges with DRM_CONNECTOR_COLOR_FORMAT_AUTO set will end
> up choosing the first output format that functions to make a whole
> recursive bridge chain format selection succeed.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6d8947419940..5938fba0a983 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1117,6 +1117,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
>  	return ret;
>  }
>  
> +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_connector_color_format fmt)
> +{
> +	if (fmt == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> +		return true;
> +
> +	switch (bus_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +		return true;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_RGB121212_1X36:
> +	case MEDIA_BUS_FMT_RGB161616_1X48:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_YUV12_1X36:
> +	case MEDIA_BUS_FMT_YUV16_1X48:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +	case MEDIA_BUS_FMT_YUYV10_1X20:
> +	case MEDIA_BUS_FMT_VYUY10_1X20:
> +	case MEDIA_BUS_FMT_YVYU10_1X20:
> +	case MEDIA_BUS_FMT_UYVY12_1X24:
> +	case MEDIA_BUS_FMT_VYUY12_1X24:
> +	case MEDIA_BUS_FMT_YUYV12_1X24:
> +	case MEDIA_BUS_FMT_YVYU12_1X24:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /*
>   * This function is called by &drm_atomic_bridge_chain_check() just before
>   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> @@ -1160,6 +1201,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  	struct drm_encoder *encoder = bridge->encoder;
>  	struct drm_bridge_state *last_bridge_state;
>  	unsigned int i, num_out_bus_fmts = 0;
> +	enum drm_connector_color_format fmt;
>  	u32 *out_bus_fmts;
>  	int ret = 0;
>  
> @@ -1201,13 +1243,58 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
>  	}
>  
> +	/*
> +	 * On HDMI connectors, use the output format chosen by whatever does the
> +	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
> +	 * are sorted by preference for %DRM_CONNECTOR_COLOR_FORMAT_AUTO, as
> +	 * bus_format_is_color_fmt() always returns true for AUTO.
> +	 */
> +	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {

This will break the logic if there is anything after the HDMI bridge.
For example, if the board has hdmi-connector (yep, it's a bridge without
DRM_BRIDGE_OP_HDMI, because HDMI connectors don't implement any of the
HDMI functionality), then the function will go to the second clause.

This probably needs to be moved to drm_bridge_connector. There is is
natural to check for bridge_connector->bridge_hdmi.

> +		drm_dbg_kms(last_bridge->dev,
> +			    "HDMI bridge requests format %s\n",
> +			    drm_hdmi_connector_get_output_format_name(
> +				    conn_state->hdmi.output_format));
> +		switch (conn_state->hdmi.output_format) {
> +		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> +			break;
> +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> +			break;
> +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> +			break;
> +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			goto out_free_bus_fmts;
> +		}
> +	} else {
> +		fmt = conn_state->color_format;
> +		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %d\n", fmt);
> +	}
> +
>  	for (i = 0; i < num_out_bus_fmts; i++) {
> +		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
> +			drm_dbg_kms(last_bridge->dev,
> +				    "Skipping bus format 0x%04x as it doesn't match format %d\n",
> +				    out_bus_fmts[i], fmt);
> +			ret = -ENOTSUPP;
> +			continue;
> +		}
>  		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
>  					       conn_state, out_bus_fmts[i]);
> -		if (ret != -ENOTSUPP)
> +		if (ret != -ENOTSUPP) {
> +			drm_dbg_kms(last_bridge->dev,
> +				    "Found bridge chain ending with bus format 0x%04x\n",
> +				    out_bus_fmts[i]);
>  			break;
> +		}
>  	}
>  
> +out_free_bus_fmts:
>  	kfree(out_bus_fmts);
>  
>  	return ret;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

