Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C589BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb4ApefZutryRdB75QWmCb7+x6M/kUCog+7gDuEDR90=; b=fBBKHRnDtbsgtyVoS3ucQgFcPB
	cjnKYMZ5k69EzVHzM60BMOubHJxh/uLo5F9ug4LiAMKdfyx4W1Cf1nXn5nc5MeapJ1VXYWlE8KUai
	4r7KsHLWf5Je7QYulDwLJ/W0MOP97asHr42PfjERLpXZSrviLcxJUzVkVn6xvXuaAIWjNqfM6nO6F
	blMW/LLSsJwux+wHLqrk9XB66SdfKJEOvf6JwY3aGoXvJKTj/s3yD0+1ez9sMEJgaPiLyhQaggQ1H
	cXof5cI2AO/u5SLR6Dkv/vFU0tilrvXPbrEo2ZhIYw9HeUnvFqvLl/jiRrZaxdPZZbxdrirnL5vwM
	NC0ITcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirgB-00000007NVP-39A2;
	Sun, 12 Jul 2026 10:44:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirg9-00000007NTy-1N4f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:44:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcd692371492
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sb4ApefZutryRdB75QWmCb7+
	x6M/kUCog+7gDuEDR90=; b=SHrCHjqs4df99NJG9bdHq119sHRuizAVPkyTBsbi
	mP51su7CI5aprYTPnlfhgyhKnr/zIt6o7Z01lHjNMV95wVeOyfWqIG7WJOeQqTFV
	w08ooD1SMRKwk0y3KWWKl/aO9UdzS/vjtU1NJwSCQzXEY7AD3Jf0GSyAyzKO1oZr
	nrEQxsMlq7BKi9Sm9pjThbaKr5hDuSSrARY8SZHy6EGueoQuiD6xmPVoJSIMUnPv
	keiJctLBV1zCeh2Yw/ZSgwgB6/cA1fyd8VoF8A7V60DZjcVl9z5UJ361uQsa4Oet
	jDuWGQnsv1DPTrXlstLtpV1WASkoIhBCtH1KGa673UFq+Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr2hn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:44:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bdc8169a8dso3178262e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853096; x=1784457896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sb4ApefZutryRdB75QWmCb7+x6M/kUCog+7gDuEDR90=;
        b=Jm3SZiJW4M1reZ4gmz6bG+JwyF+AETaz66hdYbnGrXyLrdpfAVCS+ZvKwob0LzTFi4
         5YVFP+Lgc1T4+EAd25WyF2HAKnB8+8odK9c/2w1NphxwHTi29160UYfEQ3jh13HfvWFb
         LDu/d/IGziyuj0k0T/jit5sz4+A10P2lcbzybqXZajChlU5IIEgo0Kvb+5UzVJMq0IHM
         WXvHw+xT8ry4xtp/v7OUp07SzpqnXjjwbiHt5xDiNCyhqISmVXreWUvRtADnOY4a07jS
         vWS3L18210Npo508WxnojeBJ7r4i5ae9A2QUw3jry3rFXaUwRoZAlAQL6/H37tx5kiA2
         neww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853096; x=1784457896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb4ApefZutryRdB75QWmCb7+x6M/kUCog+7gDuEDR90=;
        b=Eo7NjjQHaA9UrOIDU3zW/1uEZQH7zSKT/wzCn6sKgvPH36XFVXn+URmTqAoDC91Qih
         nLutngq5okrQ6xoZEAcVezwlESX6e/WrSmMSpO+pvc2uho8StP1hAek5PF6yuVWg8YEb
         WScoriXXeLBoAIGmYbiVGlSLEhWpXW/4843K5aSLHh8GG3cthh1gO3RxwScwhG8QlZTP
         6OOIg0DLt0CZhX16hkDOnvi2aMgB080NUhgt9qUjgxWf7JE0VLljHegK9bKmbpg1NJzz
         3IVPU131bKc6gzOL1u39XRrS68xMx7jZLGtCsNTBdhldqhZ4CavCM5cKPCMX0JZ0VLo/
         YEww==
X-Forwarded-Encrypted: i=1; AHgh+RrGuLDcczJ+ptNMZynxKqDWfLcTBf+JaLyu4vCxCFC4WOmZZCNpaZ8WDaZOCyPFFBk3/U3yls27SKV/Wo8RJD9l@lists.infradead.org
X-Gm-Message-State: AOJu0YzdCp1aInpv8F5fR34UQbKUcLkPXFUMS1AMK0JRscFp02AE6WcD
	XqP44gdihZwUaIdqDUrv9wGy4QpSodCqIDV+wImYmFATSXlBmKNj6mQEtT2rqFABflvq0Kag4Bl
	AdgR5ITSVXeH8cNlFRQYCt9wIG9KeqQ3GoX5XVu+J2ZmgZpvMvwXm1+Vq3Rs0Dv24CpPFYfDGKh
	2oUNvyu/HwTQ==
X-Gm-Gg: AfdE7cluCfyVYj6jH5tr/TCb15I7MAFj3Bx49y3x4fSnbN+v+TDDx1oG/ig8lgJ/8EA
	+fRo1isIMsAcMLFv8Hqw5J0ewanhsBj6pHbhqZzw7bEHsg5ZCT0TkiTTrF46ewbkMhqeuahpr9m
	ur4Rr0QX1dZdfeUGmD6Ub1+OIa33QmGYdF0DG/cGzIGjsv6VVJiCUv+/8ojgjylf+8+xatfbkle
	CVDbFSYSqJwwAizh+NNwPsAkE3Bcj4BOkJrHPisEpI0RCkGg4R9jOAOfXT6lQX6xFHVtzzt4f9N
	Y8zaxz/LkZ8dw07mBzn3EbIf0Gm33+sG/kYyegUF1Ls6q1knZ4MucubwDNixZPwM33WwZMAXXlU
	lbro2iVybegIQR/0R8o4gBzp/rcHDIHIZ8Z+nH1MdsKm7T1lcQR4c4gSrASQHD6CL+VXohVe/Dv
	M4izsblkjWvIivGjtfImfqN2cp
X-Received: by 2002:a05:6122:d29:b0:5bf:bbe5:372 with SMTP id 71dfb90a1353d-5bfbf3b676dmr3706455e0c.12.1783853095633;
        Sun, 12 Jul 2026 03:44:55 -0700 (PDT)
X-Received: by 2002:a05:6122:d29:b0:5bf:bbe5:372 with SMTP id 71dfb90a1353d-5bfbf3b676dmr3706406e0c.12.1783853095217;
        Sun, 12 Jul 2026 03:44:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b854cesm19921011fa.27.2026.07.12.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:44:52 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:44:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during
 MST operation
Message-ID: <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExMiBTYWx0ZWRfX25vmwNbUD6ri
 a0/EIPOqxOr0HQjdqYPGX9CR0eb7vLY60DMGd9EeUyP5Avn3oCpv5tNFilUX0TyGZ2AOtkBLCaK
 MC5GkxUhUHCLNeG4orbNxcqPJ+8WTlA=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a537028 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dRlQVyWoEjKAXtvccWIA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: tM8Ep9psXl2eN77TgmuOQbYE7pLXbTEP
X-Proofpoint-ORIG-GUID: tM8Ep9psXl2eN77TgmuOQbYE7pLXbTEP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExMiBTYWx0ZWRfX1llh19wy32bh
 /IW5cwTp+U+mDesDCnHpU5EucMUvS81eanIVZniYq+teLJvkFsI3nkRJZn68UIVI6UUUrygMwV3
 N8RtBAgwEMyo1bmX4P6/JfEMF3eF/JSHQ2TP/wQZE4GR8PTXVZ6zhKbwvdbboMHBAfu57/7GOWb
 ID+T8R+NHVA9K6DhoIzlSw4rv800oK5yTZmOpT7xMBgtbC7JSjJn+YajnkY4BRXnJhzF87Ux5Vm
 fF98ouupiIWw0ggpAAKs+UN40fqIF9cAVP1abjqqgTwIzEF3lRGPvperosAjZWGcdL4LWER/GLq
 U79PfRFQUWaWbMmSYgwh6CWE62/xxxyiRe2h90Wx7e3H4POTRwkODrpNuo7mAMTbxhGqiJ1TKXR
 n1JkXlboN+f6WoQO5QPFJIadX+7MjzAuY6u+SVUprUcCkdXuE5eZTIR7yGW6xTz6WWlx4WqJzEM
 zxUhj356iVUYZcwp4nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_034457_381111_A07037BC 
X-CRM114-Status: GOOD (  28.14  )
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

On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
> The DP MST framework already generates the required hotplug events for
> MST topology changes.
> 
> Suppress connector hotplug event generation from the bridge connector
> path while MST is active, and continue propagating HPD notifications to
> the DP driver.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
>  drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-

No, it can't go as this. The drm_bridge_connector part should have been
a part of the first patch.

>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 7334d6677604..82ed0dc450ab 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  {
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
> +	bool send_hotplug = true;
>  
>  	/*
>  	 * IRQ-only notification: extra_status carries the event but
> @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
>  
> -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
> +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
>  
> -	drm_kms_helper_connector_hotplug_event(connector);
> +	if (send_hotplug)
> +		drm_kms_helper_connector_hotplug_event(connector);

But now I can also see that the idea seems to be incorrect. You are
preventing the kernel from sending the events, but it doesn't really
matter. If connection status oscillates, then other components might
notice it even without the event being sent.


>  }
>  
>  static void drm_bridge_connector_hpd_cb(void *cb_data,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6835c68fe510..bc93b566fbca 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			msm_dp_hpd_plug_handle(dp);
>  		} else {
>  			msm_dp_hpd_plug_handle(dp);
> +			/* mst_active is set in plug_handle; suppress SST hotplug */
> +			if (send_hotplug && msm_dp_display->mst_active)
> +				*send_hotplug = false;
>  		}
>  	} else {
> -		if (hpd_link_status == ISR_DISCONNECTED)
> +		if (!msm_dp_display->mst_active) {
>  			msm_dp_hpd_unplug_handle(dp);
> +		} else if (send_hotplug) {
> +			msm_dp_hpd_unplug_handle(dp);
> +			*send_hotplug = false;

Why? Disconnected events definitely should be reported further.

> +		}
>  	}
>  
>  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

