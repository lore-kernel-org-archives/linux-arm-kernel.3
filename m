Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20578CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/ND+XYFn3bL2xeCI3dtf6zpZRcNozLAv93BypE9ZnA=; b=um1O7ccrar+86VLcUI+LI8+XWE
	CBo4BFB4rWUphBLwy9Wr6H0XnHRAwctWf4BvhO0fKh6viamiU7tzSG6ttdkHZa5pAueZLQRxYnaoF
	H+ulM9olpcYhVybceE+7XhntyC4NVmBnNRJwS6SfStpAfrt3Mu0VncbQ+fS0JUFmpxTe4ECofGsIx
	3l2lLnqouYkYtub47IPU8hZ/7mLgKHAYbmMH7365T2h2Ck8LCTn09L5znDa3jPAAD0gajTc7LDeno
	5Yxym0pzq54oUOoAL9Qf5A/icr1i06byVd+mvQ4dyHghCXW2ijjoG0lx6BWaeUaT8D0yMoA//Yylk
	HOxCVGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unK3K-00000004vmJ-0181;
	Sat, 16 Aug 2025 16:46:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unK0i-00000004vaw-2DFg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 16:44:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3B8Qv021731
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 16:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a/ND+XYFn3bL2xeCI3dtf6zp
	ZRcNozLAv93BypE9ZnA=; b=eviCU05iYpXey7dc7sazo4iNuti+3tBp1aPPfcvI
	Rua2duSY7N74qH4pxfNzd1vSHtBfkpijRKRXrht5BKU/okzZ681C9hZZKjVhbZts
	7amj4OkSuzLSKTJ9mxLyB4ICXA2MBiUhZ9deQWiv8TE+QLRrrSy4tf85yo17Gn9s
	2oqwdOiJDIJTy35WhSZ7gj3Ud/f2t+rDKlweQxBMnSwvqsjkF4I/zqM+EUd311Sh
	k6Wv37EjbJiV3tg7dOIUWUFZx6L4bXu35+agW68JzEZOLm84oSQBM+kd8VPbGOix
	4YTAQSTHyM9o0jevVHt7vzHeQBVyQ76Tha57t2dnEQBRFQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy8y6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 16:44:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a928da763so63515386d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755362642; x=1755967442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/ND+XYFn3bL2xeCI3dtf6zpZRcNozLAv93BypE9ZnA=;
        b=h3vCmv+TuYk17ZxxrU32+2zOD3g9twt3qjfRLYVG47phYbh5ak0VpQVEswy/J9fnUG
         +oRLe4kRd4316s1uFD28jJ6thfM77vwfs2k+gI1+N7zueI9bQpYA4Ixn+jXqNTTZaBqR
         TD6KSci1/6EZH9fStE4kJ+GrIwmyg9HIOCmSerlr8u39Ee6POkgujN/RN9zrK3gbHg83
         /Le6qPMw6IZ6o/3SH0EFOG5k5Dkd0JcmSMbLyOrDa36gTNEK3Tj+fIvOyAROrU2B2n0m
         +PJiTTG37YHohLPn8f7YbF0nNN8idsGpdQSnSwdqN0htmfia6hQoVAF5gPHSIfPmzzMw
         vl9A==
X-Forwarded-Encrypted: i=1; AJvYcCXZwNhDOj9W3UTZd493V2z9090mqXzHf8g5jIAqW/EItet/bGRdBdalqdwVtV5VwPJp9xeTaTxIMhaUCToS1uwo@lists.infradead.org
X-Gm-Message-State: AOJu0YzPVTgdgcjbqdDryYr9pd1C8AAbj7/l6hrkTA30oy0j5wO/Ze4g
	6N1GEC5xi+zmEgKhwhjGJo+XB2EpwEpw9hRifJ5x5S4jdCFLzGvSmJZhcE9/0+79nAdiKrN1y2S
	ckoZ+Hna0A+c07OLToyUE34AcIzsvXVTCrQbzTahN28G2L107rITilZeSV/6LVJzMivBXYG8w4e
	1oPQ==
X-Gm-Gg: ASbGnctvnqgy0NecQ4wzU0JsF9+qUWyrfO/SIzaGHEADFFx9I+ExCbp6J/p/YOaibiY
	XnxACgW29Pq73eGzPWngPFFWUpRJV0LdwtdvYJktdwb/6FIEKzHN460GOb2Uyze6m2u96e0FScr
	j/7KNP5OyLZ6yEYD2u5QVPaSLHtgynMO6QfaBVMdIMgai0ig1rW4FJcm3drzZuuTNH1Ic3GNekE
	lwUPZ0b5iGKM9QzomY3kTsc2t1rJbWjMhSWB72StryGirpAx8rVYzmh0N3PN6ekMRbTVyp/+IIv
	fFayzMq5fls66izjf0ZDNZiEr6I+unKVQzhXsWE/hg69U7kQ1Si26cTQX3C3rFSLh1/fQGX51KV
	J56OECnwXHNh89iWr84W/6As0h5GPjjS3NiyJ6/RI3DlyPHA/ntuE
X-Received: by 2002:a05:6214:20a3:b0:709:b6a7:5f16 with SMTP id 6a1803df08f44-70ba7bdbf6cmr79168976d6.28.1755362642202;
        Sat, 16 Aug 2025 09:44:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtpiAuhV34fMzTAghfd19E6ldXdihh8WZnwVajDj9v8RLDbwhpqckO6fSzgT61D94aqN7wwQ==
X-Received: by 2002:a05:6214:20a3:b0:709:b6a7:5f16 with SMTP id 6a1803df08f44-70ba7bdbf6cmr79168496d6.28.1755362641652;
        Sat, 16 Aug 2025 09:44:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a645fcbsm10108661fa.69.2025.08.16.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 09:43:59 -0700 (PDT)
Date: Sat, 16 Aug 2025 19:43:56 +0300
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
Message-ID: <incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
 <20250814104753.195255-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: KddCkTcWkvNTx9pP_wJDyf_EIKBYtN15
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a0b553 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=CixiMOkOpjwi1I4l6n8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: KddCkTcWkvNTx9pP_wJDyf_EIKBYtN15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXxnBh8PvcRxia
 /3Wocjirj4bvxPO4TqX2mJ03JgStTmMNkAmz4LNIUuWNKs4Qr/EE+tG1tW+3M8VGonANHm1hX6Y
 BpW1RW8c7lGdxIqMcyX5Qy2fcA2u/Jj/nfaiAjOHX0/1Ac/1SrwoIzG1yEuSJRpQcZlnLHDi1Mf
 W1fvDNwK71nWy/ctTnLOzQMnG/SL3bfOvIKDMpYdWwhsKsZd7+s2c40XS2QQqa7OEfpMUmJ/epa
 LKYevqT/JH5WsOu09zeMaYmsq8L9bRJJW78/XoIdp5y3vDXu70uvd+l4utegZIbOmlQSt4DiVe7
 T7QTFxi3Mg0zqF1vMY2lJHlbz08ri46yQwcMrSTqYXn/QUeEzTEL6Rrz/6AGwvz+5rrVakxxmxb
 PH1ixd+j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_094404_685601_BEF55287 
X-CRM114-Status: GOOD (  37.52  )
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

On Thu, Aug 14, 2025 at 06:47:47PM +0800, Damon Ding wrote:
> Apply drm_bridge_connector helper for Analogix DP driver.
> 
> The following changes have been made:
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - Remove &analogix_dp_device.connector.
> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>   &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>   &drm_bridge_funcs.edid_read().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v2:
> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>   DRM_BRIDGE_OP_EDID.
> - Add analogix_dp_bridge_edid_read().
> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>   patches.
> 
> Changes in v3:
> - Rebase with the new devm_drm_bridge_alloc() related commit
>   48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
>   API").
> - Expand the commit message.
> - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
>   bridge is available.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - In order to decouple the connector driver and the bridge driver, move
>   the bridge connector initilization to the Rockchip and Exynos sides.
> 
> Changes in v4:
> - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
>   &drm_connector.
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge.
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 145 ++++++++----------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>  drivers/gpu/drm/exynos/exynos_dp.c            |  18 ++-
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
>  include/drm/bridge/analogix_dp.h              |   3 +-
>  5 files changed, 88 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 7876b310aaed..a8ed44ec8ef5 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -947,24 +947,16 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>  	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>  }
>  
> -static int analogix_dp_get_modes(struct drm_connector *connector)
> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> -	const struct drm_edid *drm_edid;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	int num_modes = 0;
>  
> -	if (dp->plat_data->panel) {
> +	if (dp->plat_data->panel)
>  		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> -	} else {
> -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>  
> -		drm_edid_connector_update(&dp->connector, drm_edid);
> -
> -		if (drm_edid) {
> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
> -			drm_edid_free(drm_edid);
> -		}
> -	}
> +	if (dp->plat_data->next_bridge)
> +		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);

If there is a next bridge which provides OP_MODES, then
drm_bridge_connector will use it for get_modes() and skip this one
completely. I'm not sure what's the value of this call.

>  
>  	if (dp->plat_data->get_modes)
>  		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
> @@ -972,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>  	return num_modes;
>  }
>  
> -static struct drm_encoder *
> -analogix_dp_best_encoder(struct drm_connector *connector)
> +static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
> +							   struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp = to_dp(bridge);
> +	const struct drm_edid *drm_edid = NULL;
>  
> -	return dp->encoder;
> -}
> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>  
> +	if (dp->plat_data->get_modes)
> +		dp->plat_data->get_modes(dp->plat_data, connector);


So, we have DDC, but we still want to return platform modes? What is the
usecase for that?

There might be some, but I think it deserves a comment in the source
file.

>  
> -static int analogix_dp_atomic_check(struct drm_connector *connector,
> -				    struct drm_atomic_state *state)
> -{
> -	struct analogix_dp_device *dp = to_dp(connector);
> -	struct drm_connector_state *conn_state;
> -	struct drm_crtc_state *crtc_state;
> +	return drm_edid;
> +}
>  
> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
> -	if (WARN_ON(!conn_state))
> -		return -ENODEV;
> +static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state,
> +					   struct drm_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state)
> +{
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  
>  	conn_state->self_refresh_aware = true;
>  
> -	if (!conn_state->crtc)
> -		return 0;
> -
> -	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> -	if (!crtc_state)
> -		return 0;
> -
>  	if (crtc_state->self_refresh_active && !dp->psr_supported)
>  		return -EINVAL;
>  
>  	return 0;
>  }
>  
> -static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
> -	.get_modes = analogix_dp_get_modes,
> -	.best_encoder = analogix_dp_best_encoder,
> -	.atomic_check = analogix_dp_atomic_check,
> -};
> -
>  static enum drm_connector_status
> -analogix_dp_detect(struct drm_connector *connector, bool force)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
>  	if (dp->plat_data->panel)
> @@ -1028,21 +1008,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>  	return status;
>  }
>  
> -static const struct drm_connector_funcs analogix_dp_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = analogix_dp_detect,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>  static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  				     struct drm_encoder *encoder,
>  				     enum drm_bridge_attach_flags flags)
>  {
>  	struct analogix_dp_device *dp = to_dp(bridge);
> -	struct drm_connector *connector = NULL;
>  	int ret = 0;
>  
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> @@ -1050,31 +1020,8 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!dp->plat_data->next_bridge) {
> -		connector = &dp->connector;
> -		connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -		ret = drm_connector_init(dp->drm_dev, connector,
> -					 &analogix_dp_connector_funcs,
> -					 DRM_MODE_CONNECTOR_eDP);
> -		if (ret) {
> -			DRM_ERROR("Failed to initialize connector with drm\n");
> -			return ret;
> -		}
> -
> -		drm_connector_helper_add(connector,
> -					 &analogix_dp_connector_helper_funcs);
> -		drm_connector_attach_encoder(connector, encoder);
> -	}
> -
> -	/*
> -	 * NOTE: the connector registration is implemented in analogix
> -	 * platform driver, that to say connector would be exist after
> -	 * plat_data->attch return, that's why we record the connector
> -	 * point after plat attached.
> -	 */
>  	if (dp->plat_data->attach) {
> -		ret = dp->plat_data->attach(dp->plat_data, bridge, connector);
> +		ret = dp->plat_data->attach(dp->plat_data, bridge);
>  		if (ret) {
>  			DRM_ERROR("Failed at platform attach func\n");
>  			return ret;
> @@ -1178,14 +1125,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
>  }
>  
>  static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state,
>  					const struct drm_display_mode *mode)
>  {
>  	struct analogix_dp_device *dp = to_dp(bridge);
> -	struct drm_display_info *display_info = &dp->connector.display_info;
>  	struct video_info *video = &dp->video_info;
>  	struct device_node *dp_node = dp->dev->of_node;
> +	struct drm_connector *connector;
> +	struct drm_display_info *display_info;
>  	int vic;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (!connector)
> +		return;
> +	display_info = &connector->display_info;
> +
>  	/* Input video interlaces & hsync pol & vsync pol */
>  	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>  	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
> @@ -1269,7 +1223,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>  	if (!new_crtc_state)
>  		return;
> -	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
> +	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
>  
>  	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>  	/* Not a full enable, just disable PSR and continue */
> @@ -1385,7 +1339,11 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>  	.atomic_enable = analogix_dp_bridge_atomic_enable,
>  	.atomic_disable = analogix_dp_bridge_atomic_disable,
>  	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
> +	.atomic_check = analogix_dp_bridge_atomic_check,
>  	.attach = analogix_dp_bridge_attach,
> +	.get_modes = analogix_dp_bridge_get_modes,
> +	.edid_read = analogix_dp_bridge_edid_read,
> +	.detect = analogix_dp_bridge_detect,
>  };
>  
>  static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
> @@ -1615,6 +1573,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>  
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  {
> +	struct drm_bridge *bridge = &dp->bridge;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -1628,7 +1587,16 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  		return ret;
>  	}
>  
> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> +	bridge->ops = DRM_BRIDGE_OP_DETECT |
> +		      DRM_BRIDGE_OP_EDID |

Should this be limited to the !panel cases? Otherwise OP_EDID overrides
OP_MODES and the analogix_dp_bridge_get_modes() will never be called.

> +		      DRM_BRIDGE_OP_MODES;
> +	bridge->of_node = dp->dev->of_node;
> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> +	if (ret)
> +		goto err_unregister_aux;
> +
> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
>  	if (ret) {
>  		DRM_ERROR("failed to create bridge (%d)\n", ret);
>  		goto err_unregister_aux;
> @@ -1646,7 +1614,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
>  void analogix_dp_unbind(struct analogix_dp_device *dp)
>  {
>  	analogix_dp_bridge_disable(&dp->bridge);
> -	dp->connector.funcs->destroy(&dp->connector);
>  
>  	drm_panel_unprepare(dp->plat_data->panel);
>  
> @@ -1656,7 +1623,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>  
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
>  
>  	if (!connector->state->crtc) {
>  		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
> @@ -1664,13 +1632,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
>  		return -EINVAL;
>  	}
>  
> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp = to_dp(bridge);
> +
>  	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>  
>  int analogix_dp_stop_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
> +
> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp = to_dp(bridge);
>  
>  	return drm_dp_stop_crc(&dp->aux);
>  }
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 91b215c6a0cf..17347448c6b0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -154,7 +154,6 @@ struct analogix_dp_device {
>  	struct drm_encoder	*encoder;
>  	struct device		*dev;
>  	struct drm_device	*drm_dev;
> -	struct drm_connector	connector;
>  	struct drm_bridge	bridge;
>  	struct drm_dp_aux	aux;
>  	struct clk		*clock;
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index 702128d76ae3..65579873ceea 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -21,6 +21,7 @@
>  #include <drm/bridge/analogix_dp.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -95,8 +96,7 @@ static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>  }
>  
>  static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
> -				   struct drm_bridge *bridge,
> -				   struct drm_connector *connector)
> +				   struct drm_bridge *bridge)
>  {
>  	struct exynos_dp_device *dp = to_dp(plat_data);
>  	int ret;
> @@ -147,6 +147,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  	struct exynos_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder = &dp->encoder;
>  	struct drm_device *drm_dev = data;
> +	struct drm_connector *connector;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -168,10 +169,19 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  	dp->plat_data.encoder = encoder;
>  
>  	ret = analogix_dp_bind(dp->adp, dp->drm_dev);
> -	if (ret)
> +	if (ret) {
>  		dp->encoder.funcs->destroy(&dp->encoder);
> +		return ret;
> +	}
> +
> +	connector = drm_bridge_connector_init(dp->drm_dev, dp->plat_data.encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
> +		return ret;
> +	}
>  
> -	return ret;
> +	return drm_connector_attach_encoder(connector, dp->plat_data.encoder);
>  }
>  
>  static void exynos_dp_unbind(struct device *dev, struct device *master,
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..87dfb48206db 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -25,6 +25,7 @@
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/bridge/analogix_dp.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -394,6 +395,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  {
>  	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_device *drm_dev = data;
> +	struct drm_connector *connector;
>  	int ret;
>  
>  	dp->drm_dev = drm_dev;
> @@ -413,7 +415,14 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  	if (ret)
>  		goto err_cleanup_encoder;
>  
> -	return 0;
> +	connector = drm_bridge_connector_init(dp->drm_dev, dp->plat_data.encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
> +		goto err_cleanup_encoder;
> +	}
> +
> +	return drm_connector_attach_encoder(connector, dp->plat_data.encoder);
>  err_cleanup_encoder:
>  	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
>  	return ret;
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index f06da105d8f2..ffc05f3de232 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -33,8 +33,7 @@ struct analogix_dp_plat_data {
>  
>  	int (*power_on)(struct analogix_dp_plat_data *);
>  	int (*power_off)(struct analogix_dp_plat_data *);
> -	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
> -		      struct drm_connector *);
> +	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
>  	int (*get_modes)(struct analogix_dp_plat_data *,
>  			 struct drm_connector *);
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

