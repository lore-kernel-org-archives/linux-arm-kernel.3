Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC1CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIKA470xrZiayxUPdNqdVwH49IURz2Ovf5lBbRciHu0=; b=y+zpM6CLvuzR5njfSVe90HdimM
	Iyl/AkrNAiHGWvy5hxIa+sxhdhYvPmnogSuLZQ2xZpv5wxRsU3+TnKcePCLnNzIGpTslX7gxYhh9j
	ZCZtbb2MmU3Kj1iIXX4SeEHxrtVJWmTLvm3/R5QV/YNBz8Akj7ROT4Cc8ZZ1jRdFjB9hxWPUJCH+I
	dO+PvkmrMyCfJNUwfBZyb2xPpSa+skT+Yu3MU5VRj5U1v2RPd7v1fjA3tU62G3Ut2S29pPtWosn7t
	VLhoNLp5YfuWuB/X2V1HtWJ6vueI6f1wQEsBfREm6m/eJoSQ+Lh5tktzooU2Ttf1vEI2yZ1cylAt6
	iJry9nqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRQn-0000000Ap3X-3tvJ;
	Fri, 25 Jul 2025 23:02:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufROM-0000000Aoo4-0g1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 22:59:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PISD2K026758
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 22:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YIKA470xrZiayxUPdNqdVwH4
	9IURz2Ovf5lBbRciHu0=; b=iAd7xqbV3jp6RDE5Fx3/yt4s3TANlAx+gbRcqWdJ
	2ZuEzjtHfbMvxgU/plgYgmHf9UF9xaDloJChlIOZyQsSL6kljdlyrDwRRmuKl0LK
	xAjr8q/wi35M4fd9C7A9qG2/6pN3f+4WQfrMOYP/YvOAcPNruAeZXoMjGijukDzu
	iz3WtBbeOw/zSoJ2+eZsubfUVApOmXDNdETD55wGVte+/lQHdRDB7Rbjf7zFPp7I
	9dnMATe9MfiTb8BAoWoLYsK7WkCYf7E1VBZkqrkfq/qeV7lEwnfYYhGBY/wt1BLf
	l+n1UWd0MnYHZ9+7x1e3KHJ0eHKzYXctMIU4WqKLFnHjiQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u3r1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 22:59:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac45de153so40604906d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 15:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753484392; x=1754089192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIKA470xrZiayxUPdNqdVwH49IURz2Ovf5lBbRciHu0=;
        b=km2K5z2R5ptlmhlkIC7R5m5Ayjpt0vZVKo9uHr7sJQp76IJsyJZmmxpxN/u9BhMy4r
         HprsJPC22kMgAzeegI780dTYLDsnIVSlymkSsXG8lrkzx5ouLqfiGMzVgciJBc9u2g4Q
         Ee6PE9Cvwn9VV3FkpH6c3DDdkf35Jr9zRhI/3VoHawvc+upMoVfYjZsVJRL/IGRZgCPl
         M3fmCPzpq2JzEERWPVtX0oCokP8JTwuHqDfGwVf4cXV820DQ72Fy6aUqIyaOjqQ0asMU
         f4bZCvk+hlMlfqxLl4JXC5yw6wZ+pttUDYVqtt5FUdMKSBDwnKZIRteO7j1unppevrn/
         IjGA==
X-Forwarded-Encrypted: i=1; AJvYcCUwJVXkvBVPkTEz6ZatgSwQL83cUmTfa7y9Soj+bvL/4zKyVUAmkYSabpRYU1KGzGlNwGsSzH9y4OaqOAdDb6Ta@lists.infradead.org
X-Gm-Message-State: AOJu0YyfEN6LDbmJhPQulV+xg0jiL6Gds7enyhsGIq3af10h0xeK/CMP
	wQfwkXBlUH0NO6/9HwoE/LLkxTYM5ZzplqrW5qsooNKVJnUwyxI0U10J0zFYr8VFiNrwUrZNuAa
	svJvduI9/X1dF5iQFvI65vXlB+4H/telLo69ELCDhruGhNDcZgF9QXKv94FMKKsX8r22lXKMvU0
	5MEA==
X-Gm-Gg: ASbGncv+Le4G0JV4ZkLl7hbe53eXD9sFCncpOMEm15sfImHpyfgRARec70QKcOJHgkp
	WtrO+iGnn5JMffSLPS7gEJbPVgeA06NHwYUy6oTXZh5QoqxGaKhfLjZXeZsWj+TP8szWvkPzy7F
	aZaADn/RHwv+Ievp+UXP6ammhNM6dXyJCmdjQU4VyWMNx2rwzMdQfujI1dJ0XT5DfHI6uGXXZ3N
	V2IkVm0af5KI5rSlpEEkWSoXSTjpglL+O/Ld2BIdXrWWUivcvjXTjrm8lRz91ef6qIHnvmOGi38
	XAYSXpFexjAUP1WhIYAPO9MOVtJ83fRyN6ubH07F/4CKSTHrKsaT94Eb7EWz7WGtF8eii+quiGF
	SCA5glyhLGPTIHFgYLGvpK+AN9sKFNngP75De8tfSP/PHRtFxs82x
X-Received: by 2002:a05:6214:2021:b0:702:d6e6:aab8 with SMTP id 6a1803df08f44-707205d08fdmr50274456d6.38.1753484391705;
        Fri, 25 Jul 2025 15:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRRVVhBi4an9ryBUjXC1SCWBg0iBp7Xv7AcbxFmoNVWkRbiK75bGzcC12xTzL/6iwaeU2SQ==
X-Received: by 2002:a05:6214:2021:b0:702:d6e6:aab8 with SMTP id 6a1803df08f44-707205d08fdmr50274156d6.38.1753484391196;
        Fri, 25 Jul 2025 15:59:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63363b6csm165468e87.98.2025.07.25.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 15:59:49 -0700 (PDT)
Date: Sat, 26 Jul 2025 01:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 02/10] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <bznw5qg3ag7rugqrvoxtqm4njrnxclbohzd64jajhspe6w65w7@ya4wpxpibpli>
References: <20250716100440.816351-1-andyshrk@163.com>
 <20250716100440.816351-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716100440.816351-3-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE5OSBTYWx0ZWRfX0DZcgPFyUhf5
 kRHHA+svKoraDeYfk4yn+VqSDeBfTyy1NLEBeMCpNsl7DqscpOtPrMp863DuWFCkIM5BDR7MTe9
 KenrhZav9UTD7xGj0jbK5NFzcxGlNrF/8aPEvaJP4sa7e7wjnzsuxueqYiARqJfAIRQ/nAgzZeX
 vEE7Ih4Ss5uVuNAj/pgups5/PLkeEb9lo5vNAXwNvJprAMjsq15615fkca9osy2Dgzm/Cmxu+AE
 oaJnkyIuCOYowxXgf72580aRZiLKqCyXNbkNgiQiMtwFN9/aK6HgXAYk7B5hLch+TyuRuZERyk/
 0yEWfJSIehqv/GHFensSeXjkdCVFGxsRw/Oh3M+e1N4BeerHG8qQZOBDHHBc08r0wU3CsQkyJVb
 IjnUB3r9fhDg7CGMGkS+E0mhnOgbOkE/QYMw5aPgz6RxCUDqSMcmtpDSkvRcZuqmOqDV2BD3
X-Proofpoint-ORIG-GUID: lNzZL55U3ZvkO3RiUer8vTebaPGDCIvc
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=68840c69 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=r9cyQ1YxkPkt54pAdh4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: lNzZL55U3ZvkO3RiUer8vTebaPGDCIvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_155954_220912_CB9C110C 
X-CRM114-Status: GOOD (  31.45  )
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

On Wed, Jul 16, 2025 at 06:04:29PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DW DP TX Controller is compliant with the DisplayPort Specification
> Version 1.4 with the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> Add library with common helpers to make it can be shared with
> other SoC.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v5:
> - Use drm_dp_read_sink_count_cap instead of the private implementation.
> 
> Changes in v4:
> - Drop unnecessary header files
> - Switch to devm_drm_bridge_alloc
> 
> Changes in v3:
> - Rebase on drm-misc-next
> - Switch to common helpers to power up/down dp link
> - Only pass parameters to phy that should be set
> 
> Changes in v2:
> - Fix compile error when build as module
> - Add phy init
> - Only use one dw_dp_link_train_set
> - inline dw_dp_phy_update_vs_emph
> - Use dp_sdp
> - Check return value of drm_modeset_lock
> - Merge code in atomic_pre_enable/mode_fixup to atomic_check
> - Return NULL if can't find a supported output format
> - Fix max_link_rate from plat_data
> 
>  drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
>  drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2044 ++++++++++++++++++++++
>  include/drm/bridge/dw_dp.h               |   20 +
>  4 files changed, 2072 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
>  create mode 100644 include/drm/bridge/dw_dp.h
> 

> +
> +/*
> + * Limits for the video timing for DP:
> + * 1. the hfp should be 2 pixels aligned;
> + * 2. the minimum hsync should be 9 pixel;
> + * 3. the minimum hbp should be 16 pixel;
> + */
> +static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
> +{
> +	struct dw_dp *dp = bridge_to_dp(bridge);
> +	struct dw_dp_video *video = &dp->video;
> +	struct drm_display_mode *m = &video->mode;
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> +	const struct dw_dp_output_format *fmt;
> +	int min_hbp = 16;
> +	int min_hsync = 9;
> +
> +	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	video->video_mapping = fmt->video_mapping;
> +	video->color_format = fmt->color_format;
> +	video->bpc = fmt->bpc;
> +	video->bpp = fmt->bpp;

This unfortunately is a bad part. You are updating your bridge structure
from the atomic_check() callback. There is no guarantee that this state
will be applied immediately. In fact there is no guarantee that this
state needs to be applied at all (the state can be verified w/o
comitting). So, these parts of dw_dp_video should be converted into a
structure containing drm_bridge_state. You will have to update state
allocation accordingly. Then you are safe to touch and change those
fields in .atomic_check() and use them in other atomic_*() callbacks.

> +
> +	if ((adjusted_mode->hsync_start - adjusted_mode->hdisplay) & 0x1) {
> +		adjusted_mode->hsync_start += 1;
> +		dev_warn(dp->dev, "hfp is not 2 pixeel aligned, fixup to aligned hfp\n");
> +	}
> +	if (adjusted_mode->hsync_end - adjusted_mode->hsync_start < min_hsync) {
> +		adjusted_mode->hsync_end = adjusted_mode->hsync_start + min_hsync;
> +		dev_warn(dp->dev, "hsync is too narrow, fixup to min hsync:%d\n", min_hsync);
> +	}
> +	if (adjusted_mode->htotal - adjusted_mode->hsync_end < min_hbp) {
> +		adjusted_mode->htotal = adjusted_mode->hsync_end + min_hbp;
> +		dev_warn(dp->dev, "hbp is too narrow, fixup to min hbp:%d\n", min_hbp);
> +	}
> +
> +	drm_mode_copy(m, adjusted_mode);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

