Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D64AFD006E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=; b=p7kFm1GnKWiECT4OLjV0bIaOKw
	Yevpqcaj/Ru4jZrl2zSe01HMUB2lfwYAgjqqH2ti/Yj2LnaLRDHgNomwry407k2kgqzFWSAgNd8uw
	ysi5ypkXt72VHclQgZoNx1macWnqstMhgQWvsjOz0+R85N6B4uWoG0DNE26mU4fW38xRxNJor2eJm
	EvZOTe+HD/SXXYb0ae5SPoDuy5P6t0VAnf9SYLMQjjOcw+Jdz3AJuOLLnkvkrTbj9eIlZJ2RZ/qGv
	V48E3wkijNZWW1x4KKrprJz6O2Ojlv4f0zwsdn4Secijs2VMm0dJemG8FTTZNAxKVmtIlSsmhLQRN
	bQa9k/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjsX-0000000BfpG-0H4G;
	Sun, 01 Mar 2026 16:42:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjsU-0000000BfoQ-1GdY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:42:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6214vk1o185296
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 16:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UUK6gQUiNTqa63dauhB4oNrf
	uTLkXg9Yv5hlRkbvUf4=; b=He8pARc8xKIWQNSUN5iKpE5loEd11TA19/vijzUy
	CYWHw9Xaap0rWw4bWeDfmBphXjBNU8zWqkLN0XTsTFglTLJRWiXYf7jqZnnW+NXb
	bE7DV5GnSj7UFtEJXNVoI/V8AkgNAOOfa8AS8aXm3UPmIjCkq1IvovuIL8iR56GT
	HRJ3BdNAUBEeqwYnPCAapQzOa8+GpTl7+m4P3BikpDnkGNGJzkOtqB0piXklqmXN
	BpoJDnESMWRskJpZaShiXRIapbYJ7FzjH3VJbf0wPkAje0oqUMrHemOdFsakXWe8
	VFIVqmFmDzPzK9WZ6poJpgk3/7NVdg6uXmSnFPyYJ7aewg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg72w6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 16:42:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso4523080885a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772383364; x=1772988164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=;
        b=dZKNMgmxIZWdAe3K1BZkPJ3WX6la6fLCNAvQ63+q2EEX3H2rYtiZvf1flxcv5Ossya
         D3KtsK1rlkftUu+Qg0NATLe5KDQSnJc9H4sCejgZE0LbEl0mwki3QiuoFHeGJEFQJCd/
         PhhrltXJpRGvMT+bsFuumgzwTueT0310OUJmLJCnzp1zzRayM2U0E6vIeaOnrT2mNWQk
         htr8MzkjMzK6BHU2VL9vDI/FfO6t5vJVIdUaKIwIS30V0BjNTjOo6ctQUXtQTEWTEi0D
         l6EOd4q0Yh1C0PW8jMF5DmcFSAs+tpMdYJOl5lWB7o+87eXgcfZNASF+otLPi9iJ4ssl
         ROpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383364; x=1772988164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=;
        b=a+fbH2i4hLFZ/uZCSAyE64ANQgWL2ukXpD7Jfpw8gBYnJy9Ca07CbHCkcvHRc2qizt
         AWNUSyJWUgdEP+MoMokC24iepWIAhZp0y6+0u+Fn/xG5+hcO6j/1qbcPn8MyW9ibpfCU
         nTfNC8//Rw4AKKf4oQeOgXenu/1ArenOF+spalJTYHPcAnyi51k2mh+ZY0Gic/SQxnMx
         l4HADnh77dObnAecQGFLb3Jxcn6dUor+D3cvlISPQoLqWxjQ1cS3s4sTj1Dp4NhJwP1I
         M+G1sQ7stv+yJuU2od9I8sHnPd309yGnf/LyGj9GOIbDpDutb55T8nTUU6M6k9QTcxyj
         eQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVscf03utoYAA+hnEwC7BzOfktl2gE7p3hVz29cEws0qFFK48pi9U6CMD+34y63LfuI/qBpkIVF4nSHZt40G/aK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg2pjFBONScFwNlD+2+1WnCMGozoKHluc4jOkkDs8bZyoSbAdP
	ZA4gB4SMakfwXeRZFL7vWL/bJhSTeFK8iq0olvxhVS4i7F38A6HQJqk3dpP98t2GQgFxc8ud1R5
	+6jvsyTz6Eh548kDZ4dhuhEu3Q+hpLAYKfBBe6sEFl/3F1WYmJogYielatXm2WYBmrRhApoZcft
	/AOw==
X-Gm-Gg: ATEYQzxmttZVOYR4I0kj5kSDhrmwL5iy4r3WPaeZbW73PRQsUpJdMhjJHFbrND8S6yl
	cEKO/Cc0o/rCI/QsBgp4Vueex7mgONlXEHNgTOfvmxmHemF0YeEjxgTvw6DAQaWAm5w23/cwA6o
	wljsxvNJ+H3dsvNK1iqe3VRtkCMrP2VB52bIdtQRCS4hVIgfIyMyVeCqU+TEQmyoWiZcEl7M04W
	Aa3v/O+QdB1j4/SmBMHpSzT230UNTxFxUayc3HuESGRlonBjKceecDb8iPkpps04QA9otc1HUBD
	vPObv8PWIwjmUZsM+LqS65bm4YKPa9oaCpkcxyqVSoR4z4Ej3efsQBk1EJ9n6mQxU2wSXbSttZS
	oRMTCq5nbyI9qrwoNO2rQWvO9gQvh0R3JXJw7lMGT4kJMCT2vPtOXun+rRD7cN4fudqyHqfoOK/
	7A/rnBfFSmBVPrIL7KpgL9L9g2AaP01GTCWVk=
X-Received: by 2002:a05:620a:40c4:b0:8c5:32b7:210e with SMTP id af79cd13be357-8cbc8ead9f6mr1058573385a.82.1772383364346;
        Sun, 01 Mar 2026 08:42:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8c5:32b7:210e with SMTP id af79cd13be357-8cbc8ead9f6mr1058568585a.82.1772383363834;
        Sun, 01 Mar 2026 08:42:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca1e5sm1139257e87.26.2026.03.01.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:42:43 -0800 (PST)
Date: Sun, 1 Mar 2026 18:42:41 +0200
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
Subject: Re: [PATCH v9 12/19] drm/bridge: dw-hdmi-qp: Implement
 atomic_get_output_bus_fmts
Message-ID: <hocqjcusieyqmsai4bxtgjon446yae6m43dmvqzk34ul44pvfg@ithgwadiwx2j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: x4kEdsIflEysU0A_9na1wPzl2AYMdEle
X-Proofpoint-GUID: x4kEdsIflEysU0A_9na1wPzl2AYMdEle
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a46c85 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=J_biHfMZ8pKUvqPgpkYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MiBTYWx0ZWRfX5TN384TfUTlf
 T6daEF6GEs1/JnBowVf3j7aT1SJ4PqcwCrbGu6DDLR3AlPvaxDypTGcUe+orir1of4e/o0xuGsW
 zvClvTuNmXKxDxrmd9o0g5Km+b18Ig/03rZ+xzCPtO38vpyhLqrAQlMX2SsHvli8qEYiIkxSAs9
 zzNBW3wZ2cE7NgMsDuPHrgLkXYAvHtZG5fxT73ImnE+Ma8qumnDZPukCDih5rIERVuQdg0txGmw
 1IaKZtMc8Ue4Y7nTUkQLl82fAr6zJJnxUBulSMnRI9RthWsZwm1iOSp1NMSgRRs1sBOIod/ikO7
 HrhBlTQDssDD2ixQnMD0MHiPGeiA55JWFpf2pmj7ti4ZJAhEwmKDqB5JZCIPyeLV2DjHrKtuP+c
 EUvfdJkZSTDwzf8KDh8HTVrkYKwiyFRVe/I1XkZGPrVJKHduTkx2zpegCagweoUfw9t1mO20Ec2
 iaQCJD3ZA/0W23+985w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_084246_483890_50E72D91 
X-CRM114-Status: GOOD (  33.00  )
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

On Fri, Feb 27, 2026 at 08:20:17PM +0100, Nicolas Frattaroli wrote:
> The atomic_get_output_bus_fmts callback is used by the DRM bridge layer
> to recursively select a suitable output format in a bridge chain.
> 
> As a bridge that outputs to HDMI, dw-hdmi-qp will have its output
> formats determined by which formats the platform-specific integration of
> the hardware supports, and the chosen HDMI output bit depth.
> 
> Implement this callback. The returned u32* buffer is supposed to be
> freed by the caller of this callback, as specified by the callback's
> documentation.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 64 ++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index d649a1cf07f5..4556494f9bb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -11,6 +11,7 @@
>  #include <linux/export.h>
>  #include <linux/i2c.h>
>  #include <linux/irq.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -749,6 +750,68 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
>  	return adap;
>  }
>  
> +static u32*
> +dw_hdmi_qp_bridge_get_output_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      unsigned int *num_output_fmts)
> +{
> +	unsigned int num_fmts = 0;
> +	u32 *out_fmts;
> +
> +	/*
> +	 * bridge->supported_formats is a bit field of the HDMI_COLORSPACE_* enums.
> +	 * These enums are defined by the HDMI standard, and currently top out at
> +	 * 7. Consequently, BIT(7) is the highest bit that will be set here, unless
> +	 * the standard runs out of reserved pixel formats. Therefore, hweight8()
> +	 * will give an accurate count of how many bus formats we'll output.
> +	 */
> +	out_fmts = kmalloc_array(hweight8(bridge->supported_formats), sizeof(u32),
> +				 GFP_KERNEL);
> +	if (!out_fmts) {
> +		*num_output_fmts = 0;
> +		return NULL;
> +	}
> +
> +	switch (conn_state->hdmi.output_bpc) {
> +	case 12:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV12_1X36;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;

This looks like very generic code. It uses bridge->supported_formats
only. Can we move this to the helpers library?

> +		break;
> +	case 10:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV10_1X30;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		break;
> +	default:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +		break;
> +	}
> +
> +	*num_output_fmts = num_fmts;
> +
> +	return out_fmts;
> +}
> +
>  static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
>  					    struct drm_atomic_state *state)
>  {
> @@ -1192,6 +1255,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
>  #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
>  
>  static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
> +	.atomic_get_output_bus_fmts = dw_hdmi_qp_bridge_get_output_bus_fmts,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

