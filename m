Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=; b=WDkyNPPjVvPsjR/0ygrdlp8H2k
	vIeFvgKTDTElL0TSdQEDZAbZop9eWjVWm45PwuhLOHSQcMllB1iWE0mzDWLRKmTcgI8p4yF+dK2QY
	CC/231mwomyKiChZ/yb82JbuXBXnxM5pkMaqYOt1gLeer1wCchlcnfUQZUFZbxEL3LtYkwIQ8WM3L
	djH7tT4KXvcygwyBZQdQpmL3sk1IWcuJt8COEgzNjXuizq5+DAuWZtprCUkXDAfikQ5UNRBHUZrbS
	Vgtkvt10Hnm7EqiOWYEiAf1JIkgg6eDDMnT2byXPttJ86rA1blbXwWpNJkrH6bFjKTWqQEoiMtBha
	vQfRV3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirVL-00000007Mlx-3Ik0;
	Sun, 12 Jul 2026 10:33:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirVJ-00000007Ml6-1buw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:33:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SmeX2000533
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=; b=ieN8kKDAR8qhHWCJ
	ltUmC6xm/kWtJ1ABS4QVcmrK20Y7oDjtppJUJ8Y3PsQtCVN5BKO9CrQsQavv0lbj
	GBs5OPTCwpSOyBdyeULr6+L03ixDLrpYZkxvlvAJ6i06MsJrMf4Ldmt0KLLCy5l4
	cUT1qg0UTX2BUCEZ/Lpna7op91HeuZO/52jon6DZu4hKllP2DVBty6zFnGG1i+Nr
	Aq39PqjDlyJ/T1O00tdpTrMg7e7SkZRQtsasIgDBAbrZ7sEcMAC20mfGZIcobF+j
	epZgo4d+ZJ+Op+MMdY1UMny7ea6yFKyzLMyjFAVpamFIOHc29dkH5fuzq2aVSKLc
	vr6nOQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgjn4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:33:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969275401c6so2256474241.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783852423; x=1784457223; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=;
        b=CbojTTCYPIyrEjZOgLoCH6Ehv3K9YnTI2AFRGzuyOilaI1k1FqtWBDZabfMyVjRCtC
         ldOIDqnwy532w2PACNiXAGqW4CSAcB50YnoPwRyVsENC4DEaZV7pjH1Rsj5VxARoOQpg
         kF+WDwDmvkyERyKUY9hOSxtIUeOOPjbV6nRkgpNnY5wHPyvORytyr49TlAfMgAvXqQn0
         lgxqp/01fzBPObMIIeo7B99X8wDiBfPErg7kEaF6WXsyIp4KVtRMDNh2h2Y8S8Iz2nXb
         AFOKzzsMUqSEkJZqdKlu6HlpfirbOSPyDaTk29gqvq/WPkt/V86+AbyrR0hyzynPoz3n
         y65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783852423; x=1784457223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=;
        b=ADpAYBmTelT7NGtDsLyDESiIDUyYNpUG1x63b/QpXHe4H4GGbsDvxziWFOyCcCDY9T
         xG5JBPeOGXbWx+SFGSxXL9L9z63ihP/A+GtU6MvMx6ZDBUCYR8KrBMhjtXPzuTZ7JXoM
         UXFoq+vBJIqIKm+6hSMK0pOUxTuBuWyanPtgvsktI4XBg8Orn3gHiV5Imv/xwTks751O
         luYLiL05/Ok6Ns3k+5+Vg+NMq4YiYOPiyMxEH10eiInSWXNWbju0I61IyUlSnh343wbe
         4x2q82JmdFQELToXSee6tIAVeTQ7mB0Ll5d7Rl6mtD0AuNIy6LkAsdY+rlb6R8+u72P6
         e48A==
X-Forwarded-Encrypted: i=1; AHgh+Rpw7HUWx9duZDjJntw+mOgISh/XyZnZs0qXshGccltPh8+XTyt1SBX9DeLJq4PUfTnC6FG3aztXbjMDIwjSmF9P@lists.infradead.org
X-Gm-Message-State: AOJu0Yyik/wuUL946+jQFhM9+KlKfHSgpk3WEo5B/7tlBlFi83XmbXR5
	/HMZ9Ye6qrNNPs3P1D+WXhGo5Bqnz5dUpSr7/wBIi1buwnQAAqcUiWSACBJoQLdBpmiht+TYcRR
	q1AP835iGArcDiQpBTo636mu6b0JPzoQRUzYaVxlINfDxVWVG9JqtdPhcxgn4cFsMQBltqefbTt
	Mpiw==
X-Gm-Gg: AfdE7clQsSNf+sj+QLxz/9NsWgxosu1Uq34s37uEOSKia1kPNMNhMdSm2Muy2HUcmKF
	XzfxcKLMii4bhROmH3CF4XROwLj+HA7AgMuYqfMv3Cdz5yD2ijnQuO1qSd+IsEfLsDLchHE0k0y
	Amdj3qsRc6bGtDaIwVABWElSdmyhAa64P/idD6Lh/1MA1sMoCtFO8PjBBtVN3jxQKprAJn5riPg
	b2kgHtjCsdXu7JpzNg1Z0ZNoQKPXIkjzEsXiRGfSmUp8PnpjemOOK+WvD9xuHWI4/KwqqUvQTPn
	3v7JvF5sgqRSwhrxJxMdQjMhWaZGhdWu20pu3Nb09iIQbXYrrFnB4+EczrGUd8PtBwzxeOTLN9v
	FmTRGRtP8RxvTaonSInGnIbVGHalCfwqCDEiBTcmbNXy3DS4qAYyp39nUWg7NOSakP/DdWBVtSh
	g2Ox/splTfAA3NYiDg3/NREqgh
X-Received: by 2002:a05:6102:5e8f:b0:740:127:c81b with SMTP id ada2fe7eead31-74533bee3eemr3749083137.7.1783852423487;
        Sun, 12 Jul 2026 03:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8f:b0:740:127:c81b with SMTP id ada2fe7eead31-74533bee3eemr3749068137.7.1783852423033;
        Sun, 12 Jul 2026 03:33:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b9fb1csm18390071fa.34.2026.07.12.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:33:40 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:33:37 +0300
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
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
Message-ID: <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExMCBTYWx0ZWRfX6KTTdaOGurT5
 8XpEATMjbDB/6yzh76mOVzu1ugoAJ9iZdL3/BO8BJzo54GhoPOAUbx8PniIqEKvF4UVYHSqZ2cs
 ENe98WPJ0yT1kz1r4p97pgdOi/HP/sY=
X-Proofpoint-ORIG-GUID: TG6LwN4GI8OEDB1L4apgdvsrIkhP-s3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExMCBTYWx0ZWRfXwzt0PYSThRDS
 YAUBfnC5/SIQn9BWaThPnEiS46Bk0h+A6BIaveYZLjdlDDNkVCOaXdeVnKZP2y2A69RGNnS1Xwh
 1AEGEZD3DTyBEn7FLfRZe1VEearFWanV8nWoSF532gJp5gZGstA6l//5ISbua2ZyTdgPu/98WGv
 TJRCHJ7ymbxCwKrfUZ1JKh06Cbv4inTWOEdKgpLzdXiX9KIA/fiHFDRc/gToKOoI73XIqDHO3Ql
 D53etyJgVww6tVnb3cIWWP/JJ3xmFfuoYHbQxRKYSY7GehWm/Qzr4Hb1eiNKEQK2QoI0lC3wZ3w
 PtoCAYkbGRRv96gXHPNOG8wRPhygNXVUU8NzPA0QJ32msfTo39cx/KivAx34xy6ADoiUMnZIxTR
 ZL4rihV8TbA9+7MW/UKoq3seLgx+QgKb509qNAkF8TlnXmbf6f31AhLJJ2w8p7RYrqlJXEp0LBq
 oO5iLLhufcpOsLnCQ0A==
X-Proofpoint-GUID: TG6LwN4GI8OEDB1L4apgdvsrIkhP-s3f
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a536d88 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1N1HUszlP5lRL62vBQQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_033346_132659_AD44505B 
X-CRM114-Status: GOOD (  31.19  )
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

On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
> The bridge connector HPD handling path currently updates
> connector->status for every hpd_notify() invocation.
> 
> This does not work well for IRQ-only notifications where the event being
> reported is carried by extra_status and no connector status transition is
> associated with it.
> 
> One example is DP MST. HPD IRQs are propagated through
> drm_bridge_hpd_notify_*() so that bridge drivers can process the
> notification. During MST operation, however, the SST connector attached
> to the bridge connector is intentionally kept disconnected while the MST
> topology manager handles all connector creation, removal and hotplug
> processing.
> 
> Updating connector->status for an IRQ-only MST notification may cause
> the SST connector state to oscillate between connected and disconnected
> depending on the notification path. These artificial state transitions
> can later be detected by the polling logic and result in unnecessary
> hotplug events being generated. Userspace then re-probes connector
> status, potentially triggering the same sequence again.

Then the API might need to be adjusted.

Remember, we have two usecases, which we must be able to interpret
correctly:
- The driver gets separate HPD and IRQ_HPD events.
- The driver gets HPD and IRQ_HPD at the same time.

> 
> Treat notifications with status == connector_status_unknown and a valid
> extra_status as IRQ-only events. Forward the notification to bridge
> drivers without modifying connector->status.
> 
> This keeps IRQ delivery working while leaving connector state management
> to the component that actually owns it, such as the DP MST topology
> framework.

How is it handled by other drivers (i915, amd, nouveau)?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 5edca47a025f..7334d6677604 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
>  
> +	/*
> +	 * IRQ-only notification: extra_status carries the event but
> +	 * status is unknown — do not overwrite connector->status.

But it's not unknown at this point. The connector status is reported
following the HPD status.

> +	 */
> +	if (status == connector_status_unknown &&
> +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
> +		drm_bridge_connector_hpd_notify(connector,
> +						connector->status,
> +						extra_status, NULL);
> +		return;
> +	}
> +
>  	mutex_lock(&dev->mode_config.mutex);
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

