Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45DFCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5pBODwspf82fhKHX/+Qq3M8oCn/6yRZrJbLU7BeMOU=; b=FrPnPer4y3VDTazTg9Jepymvgf
	uOAA6JvSXmeOzQdVByd0MJ9TMPmUz7ZNAVuW3a7jmO0ZXsrlrRm5KjV0CfN+D6/9jdXZg96BUaPhS
	jaWPTlDy4fR1a15X/FLgbYlXKcTu5WfkbBB3F36z34kw6+9DzJMZ3AErlGJHINYn0OYPmvbmRjTZe
	v13S7wMRCP8a7ga74UTeLys8lWv65TmXJOVbZM03beRCmhs+jsBDAmBD2McgdiBSRZ1Kf2VwUycmb
	dR+jB03akNgjUZX1aJEWvHQHcRZAXLH24WXQBdy1c9VOZtp64fuoUMvkrwTkFSbIMtmvqZuevY3oY
	857TKz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvNu-000000059HP-2Q6t;
	Fri, 29 Aug 2025 09:27:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urumq-000000051an-1i4b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:48:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85G6J027404
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5pBODwspf82fhKHX/+Qq3M8
	oCn/6yRZrJbLU7BeMOU=; b=O171H4Aal17R09DovZSV+f7s9mAfCdAdtrQVTFsl
	GQlxb/LkQrUq/6+/W0kU6lq/0pofV7O7pLQhM+o1+aXy9r4fAPkuYL2MXiD4siQs
	g1Na+02TxmDq29fo1qK8CUsEFolUHv7Tc/CfS4QJaFJpsGjh9LlP/jSUXO0lRmWZ
	/CEbX8JaAtsj2hyphwKEMHu9i/NeKTePzqcndXiJ2Ty5Bd2R0/1PdwworLi+vW8J
	VU+zqzS11JwUSpjblFP44O2dPwkJuocpegRv6CbYE+UMyxnMNW1agMiKOmNwftF9
	j6bgIpa5uAUClt6tHX6mVrzhmjzjmE3cf5qsJHFYQFAZGQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umkew6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:48:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ddbb81696so35328256d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 01:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457322; x=1757062122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5pBODwspf82fhKHX/+Qq3M8oCn/6yRZrJbLU7BeMOU=;
        b=EBKc0WX2ipOx2YY66uZ93ov1DV7XqAZV5eNhwgE+XWBbYbCFGIOsSGckA72sXifnrK
         JYbLF+fpA7hX+/QN0ws6CEkN8a75ndUlPXAsXqHVLTmQkiraKwlRFVH7C6YK9is3A20J
         p9JgL/wK9AcvfEurxOormDbDGfTkh8kQPqqB6KmvGqOcf8NMerrKEMydow1CqfFrew2E
         drjb1Wz+XJxGiC7O6tSblEkw0xlgNe4xHG2g+PtLlBBC+aiSf3tpMF8FA2yhwmm/5jv4
         pOQIHlBs3IAuzhxNH/jZqRrJxZHlm+VN2sAVVOzlw0GYBOGA//jf0a+Hb1wjN4cmNmp+
         bEBw==
X-Forwarded-Encrypted: i=1; AJvYcCXCMKaNYa2CJ2GHB6mYZGVAO5fQpuwD20Yap/PD/kH/RCjkIrbKpBA00k2aLjQE+ftN0pQuVRSM6wiEYWl6qvXX@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ7QaHZMgZ+TTLA/qKfF/WcZ1tSWO/2jvs5gtwPVLhHmW63NXh
	zqbfQ9l+PUORV2hiHcAaUEdVyWalPM94Yht3HpQBOqzkcQxrk/fz32PdiDjG6naLau2HyAUttZM
	SKaepmpIp7IcfSZ1WtuD9WdM+VFwck1htEqA2IVcXjEqTunuEjP+bJTtzeJ5x3l8q+Mz5POnYZo
	wS5A==
X-Gm-Gg: ASbGncvTht+l6P8UL9cagc8qQWDdgytMHcOlxZ0LDD2oE/BgPI7qb9hpYrONzbxw+5l
	yL/oMIVO98D/8QfKLfdohzgEtxrAguDOfMeUE5b8f/3Rm1bKRlRaEmUXCQi8ZgT/F+UVJi55len
	EBQKBMDj04K6h1+383pXr5MQ6DNPXsHdAXkBc6McLdIqBhf+EvYTV/teOJ51kJwnejlXqRoR/rG
	4X+6veKZLG0DjBZkXjb8MnFzQoic8ZIwtbfb8kYjgRHfntBwxwTGy/poWilNpn4c1uOatVFfkuW
	ghDQcUmvKTIsrT0QJasMtZMOQ9sLgwf2VJxUON77JF5ssfQD4JDE4ATcxpCPMBV3usuYWhdl8ue
	1cG5RwIHSHqs+OHvcHiIFlLhIfnxCJ4BHk47NiAK2MtdMLZTea0tZ
X-Received: by 2002:a05:6214:5186:b0:70d:b3de:cec9 with SMTP id 6a1803df08f44-70dd59c1196mr125891136d6.22.1756457322349;
        Fri, 29 Aug 2025 01:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq1ezFqcENyB1YLJXTV7TThom8X2IGaTOdTprgqE2iRpU+3lXQDMjeVPvPOaC+kNzjQAaeVA==
X-Received: by 2002:a05:6214:5186:b0:70d:b3de:cec9 with SMTP id 6a1803df08f44-70dd59c1196mr125890886d6.22.1756457321839;
        Fri, 29 Aug 2025 01:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6784526csm461424e87.84.2025.08.29.01.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:39 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 07/13] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <ghp33yxo24gaubn6pijks3wnuch3fpbmi5z27cq7pk3siffiox@jb2zw3lt35hk>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
 <20250814104753.195255-8-damon.ding@rock-chips.com>
 <incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim>
 <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b1696b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=g_3uhpjf_u-dzjrkN2gA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXwvCJYHWJxwaI
 hfqFcw67LRb2qc9d51qim0Zm7FIM8NUUlOsYMH+NT//2/rdUjxk32IxN1+KCGAg9DkngnFQZHvr
 TZ+wCIoDjvNz24HCVPnVKEgYswQBB7aCxW0vSdF7qkBOfOjxQhRT6CsIfTLbiOjXbSFe78DkzI4
 yHDN4jNGAte14PSDo2bpqvaJ3IGQuRWL7OCRlaGXyNLOOzCXbSsSP/wiCtwSDcKMLoG5o+uMnAU
 JVOp3IIvua5C70hmrKLzegUfFv2RWhqaHf3PBnsXSG61DpKXp0oBKCbca82UXeLrPEhhm1djQiq
 Ab8iGCNvKTgPTBrIJeiCtvUWFApWr6A1QwfvxdaakivGC36n9U97Vx0dbRZEManaqFMqMveqg+Q
 XyVCXSX6
X-Proofpoint-GUID: nhSzvNzLOg_pVu7QyQHykKexxeP3_bfL
X-Proofpoint-ORIG-GUID: nhSzvNzLOg_pVu7QyQHykKexxeP3_bfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014844_456578_9185ACA4 
X-CRM114-Status: GOOD (  45.40  )
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

On Wed, Aug 20, 2025 at 05:18:13PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 8/17/2025 12:43 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 06:47:47PM +0800, Damon Ding wrote:
> > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > 
> > > The following changes have been made:
> > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > >    and &drm_connector_helper_funcs.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - Remove &analogix_dp_device.connector.
> > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > >    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > >    &drm_bridge_funcs.edid_read().
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ------
> > > 
> > > Changes in v2:
> > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > >    DRM_BRIDGE_OP_EDID.
> > > - Add analogix_dp_bridge_edid_read().
> > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > >    patches.
> > > 
> > > Changes in v3:
> > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > >    48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > >    API").
> > > - Expand the commit message.
> > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > >    bridge is available.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - In order to decouple the connector driver and the bridge driver, move
> > >    the bridge connector initilization to the Rockchip and Exynos sides.
> > > 
> > > Changes in v4:
> > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > >    &drm_connector.
> > > - Rename the &analogix_dp_plat_data.bridge to
> > >    &analogix_dp_plat_data.next_bridge.
> > > ---
> > >   .../drm/bridge/analogix/analogix_dp_core.c    | 145 ++++++++----------
> > >   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > >   drivers/gpu/drm/exynos/exynos_dp.c            |  18 ++-
> > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > >   include/drm/bridge/analogix_dp.h              |   3 +-
> > >   5 files changed, 88 insertions(+), 90 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > index 7876b310aaed..a8ed44ec8ef5 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > @@ -947,24 +947,16 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
> > >   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
> > >   }
> > > -static int analogix_dp_get_modes(struct drm_connector *connector)
> > > +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > > -	struct analogix_dp_device *dp = to_dp(connector);
> > > -	const struct drm_edid *drm_edid;
> > > +	struct analogix_dp_device *dp = to_dp(bridge);
> > >   	int num_modes = 0;
> > > -	if (dp->plat_data->panel) {
> > > +	if (dp->plat_data->panel)
> > >   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> > > -	} else {
> > > -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > > -		drm_edid_connector_update(&dp->connector, drm_edid);
> > > -
> > > -		if (drm_edid) {
> > > -			num_modes += drm_edid_connector_add_modes(&dp->connector);
> > > -			drm_edid_free(drm_edid);
> > > -		}
> > > -	}
> > > +	if (dp->plat_data->next_bridge)
> > > +		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
> > 
> > If there is a next bridge which provides OP_MODES, then
> > drm_bridge_connector will use it for get_modes() and skip this one
> > completely. I'm not sure what's the value of this call.
> 
> Following your advice, it is really a good idea to distinguish the
> drm_bridge_ops between the panel and the bridge. Will add it in v5.
> 
> > 
> > >   	if (dp->plat_data->get_modes)
> > >   		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
> > > @@ -972,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
> > >   	return num_modes;
> > >   }
> > > -static struct drm_encoder *
> > > -analogix_dp_best_encoder(struct drm_connector *connector)
> > > +static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
> > > +							   struct drm_connector *connector)
> > >   {
> > > -	struct analogix_dp_device *dp = to_dp(connector);
> > > +	struct analogix_dp_device *dp = to_dp(bridge);
> > > +	const struct drm_edid *drm_edid = NULL;
> > > -	return dp->encoder;
> > > -}
> > > +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > > +	if (dp->plat_data->get_modes)
> > > +		dp->plat_data->get_modes(dp->plat_data, connector);
> > 
> > 
> > So, we have DDC, but we still want to return platform modes? What is the
> > usecase for that?
> > 
> > There might be some, but I think it deserves a comment in the source
> > file.
> > 
> 
> For Rockchip side, since RK3588 and RK3576 can support YUV formats while the
> other can not, the &analogix_dp_plat_data.get_modes() help filter out YUV
> formats for some platforms(The YUV feature support may not be fit for this
> patch series and will come later).

Note, get_modes() here adds modes rather than filtering them. You can
use .mode_valid in order to filter out YUV modes.

> 
> For Exynos side, I think &analogix_dp_plat_data.get_modes() can help
> parse the video mode set in the eDP DT node when there is no available panel
> or bridge.

I think this should be handled by a separate bridge. E.g. see how the
imx-legacy-bridge is implemented.

> 
> I will add some comments about it in the next version.
> 

-- 
With best wishes
Dmitry

