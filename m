Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B6C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=; b=Kc2zhWRIEpZw3KbZM0aNOWrXS7
	b9AOO5b1XIzybbOhD9qJAig5M7+GtI6QzCJA0zehPrTGaWAbcgx5CvnXGccEZE7dCO28/23Y4TUDs
	sdnGLso7b9T2ytqtYoGuQQaq0U/l6NQQJA/SnB0nYRtPXKHc2Q+C1wDeY7+xIZOnepUr6gf1egHV7
	S+XIOeSSRfXPUT9FMg3Rc9TYiAVuzoBR33Lk6OeXr3cdncvWaN6cOKwUw8ExdBK/RB0vOLjDRvCPz
	KYkcCf0m746BtBpm9N0gfC6qI7Z2LTVMUes7oRxAbI5vJiSq5hEOZCubVNeOvVMvZPxskt4gKTqrD
	ouKTIDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAP2-00000007Avj-08ph;
	Tue, 18 Aug 2026 03:22:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAP0-00000007Auf-1llB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:22:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28ime2884964
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j73bG+tmYVwAb5KvFoWsfW2d
	3OEy+/PhR/daxy+LBa0=; b=gEIfS9N+MIBWmQuKtz1VxzQ2+YyWmcmHg3HmqF41
	bQj6qxawqRFoTLNd9Pd9yeyek2qdJZyW0QKTsk8CD8jS3Bi1EUqAXB5OP5yYPdyl
	OsowqZlj1kWOPVi26fWMmLqTDUUUu7FWu/ZziKXReKe1LmOlmKUMBNWGTbUwxCEl
	WDtYDlvvUlRnmLvH29k6UVnN0sdSo6p3LHQQFY3RIzjeBncjsfzbroXqP0nSQ8dg
	L7bBnA5upxEuD5z0l6zXP61s+OHc98FNNC2BM2NbRFi9aHPnC/k2hd0wdGACnpPl
	Wk+EAN/mdc5M1jsjZzgLhFMSpKafUYOaOlwUakC/8SBIWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpr9pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:22:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a098ea19so559947085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023333; x=1787628133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=;
        b=dMr6CngtxsrLuPtwe3/wRDSDMwVv0jC77vKWiMeYOF7uJHHFdY2Hfg1WNHhdaOgwu6
         GckQj1TJdR/IppAXCKv3Dxqfab4ZnpsQY86bqsACJPzZNlVxUUQ7sMQrPToaC1OKtmsU
         4qI+lHeFidGkHjioRonxXeZiq8pbrSnlvz0DPahhEcSoLnUkOkyhvf5RnXeZq4CJnnek
         ud9ZFWheePNdqAvHtgYynBZYZnXMBz19uYa5TpwWQhYU39BihTAP3fLLQZTGx3jP2sjh
         /K61K1CQX3t4e+uRZfGsxYT9vHCnZOXzTn6I0ldXBA0TRab92mQdSrxQF6/9FQEjUtWG
         2ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023333; x=1787628133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=;
        b=CD0or3MqlPBFL6/aezcOyLQ2UEcmwqt7sW/zYeYs8+SnM8bLGP5YTT9XB4Xe/7U9vx
         FX0pe07vjLoJq5hiTn3AldXSInYiUHTM5UpWkARVZuHTs0J1djMvWTc9VXSI+3r6/R7/
         hlis3jKbN0Ux61Fo4qJfVcK16HvCeXWqHEaI8G6Jv7m019jTOvdcpOO/bUkbp5eAiiCf
         ANr6EU19OGvtf1t9a5mr6Tw+M3GGuZiPHcYhd3T2aoxeMlcr2ZVwmBJzT581NUQ++38o
         6KbDp6TyAtfIk2cc3R96ecM1V38/iEPHzk0tcNMxvxPkL03lAEekPz5n3zQB+pp5vAde
         79aw==
X-Forwarded-Encrypted: i=1; AHgh+RqmIh/qyI297I9OV4sh6STMdzZoIUHVlR2uiE4aG6n95jlAyBB0WfqIzcY/CWLT9YEedG9S7rChTvNR5prWRFMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzT3quEoa4V2AcbV/J6q2AQQO1W34Sfk8At/LzvnoUctvkEl/VB
	CJCdyPRAjfN3oYJ/SFbAQEN3a2ve030dcgDUNMnA46fKiVqJkaDB1fjV6Q9E9tsRVMs2+PzZlRF
	JvmiRjd+tTE2Ukt7r4BHNSB5U4UjTbLgKi35anOgHVau4n68nI2IuEGxJOacDION5WZim8ICYIx
	ajxw==
X-Gm-Gg: AR+sD111ZxFGa/VuwTrq21ESlFafd6eEST9tm/8995W2QrpHEibZ2IpXza2q6ZnaF6P
	ZmdVvJ3R1tLm9dSofrzpmcwNcjheIhTxo/1Rzxrl+ZOVv3S5yaCvkU/BRL2TUhjE9KSMotqi6eN
	qX6RLrjNdOAdykEtKdkwWtIc/EUy5im9llTyWwcu/prOnxrtVV9XI8C3wt+NsNcrKLVsa/KPtuu
	0sqXu9r+SCY3cYKlb+PLyNEDbTWXvoWO59FHXpKwmLlcwYpIaLMpGFLtIxMnh9grD6zY+syRBp4
	iXywiM8bADJsJE0Ikxi1ntXivs2lGRY5Sgcz0rmm0yL4PQJy2vCELa19ORcYze6vxnTBZXPi8lv
	5LQn9kz3GUwtDwaCZxa3r6vUBPrVwxcL4M3DQhsvOWOHKV+WHPcneO06frMF/0GVf4FT5uGo/Dx
	iBCR+VXx0EoXxV
X-Received: by 2002:a05:620a:e1d:b0:936:bcf9:8539 with SMTP id af79cd13be357-936d232dab7mr1974697285a.35.1787023332571;
        Mon, 17 Aug 2026 20:22:12 -0700 (PDT)
X-Received: by 2002:a05:620a:e1d:b0:936:bcf9:8539 with SMTP id af79cd13be357-936d232dab7mr1974694985a.35.1787023332068;
        Mon, 17 Aug 2026 20:22:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf95803sm836861e87.1.2026.08.17.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:22:10 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:22:07 +0300
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
Message-ID: <r2xv3lsvku2wlccf44dlesqgrjqbvjrvike3jfx7casembecrd@3mw3olil5toz>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
 <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
 <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
X-Proofpoint-GUID: ImtwtwLuATd3I2mqHY9gJiNnb7gz--F-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX2mvBerjjGbkh
 /DajtXj/Sc6wgf90Pxg/aIg5c+TjjYipuwLlKPOSNeMzCGkF6swIPBWwuSUQON115r1x5IFxHn9
 FW0FH56Ml7rTfar+xI8ORAezgVK6z5R/DdSAAdmMC85CTz/q22kjdUCxCLwOwIh9YsVU/vOGX0w
 83Yj40t1bfcpEhbnd1Sqd+8nAD+jPnsKa1X182nFjytevxvS87fu6VhkALBm0ggo6sL+l6roky5
 ZXNLpkUty/uA6yyoC9M5I6rqUvjapRaJ2GjhNwJLDIx879p/7gTPQEPSKKUoUrhlCbaf6z39Fp5
 W+S88c/wQCR+OtKpybtSPDDKBA2DSslwYND8c7qogW7u1Ysbhzyge7+P2178HqBuwnzHTfy3lOI
 uaahojwo8EAzJZNpYW12Aym3l8aQW0mkuuuglE3yU28Aqnoms7Uf+O3HyvDUvyUnxFjyEc/zUyf
 ebLj5UAim33XHXtRWSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX2gr/aqx1UBCU
 73J4FoBBRlNlgFPsMGXzuNdX5YCr+pSubuWEORVK+tL0B4DuAybd6ik8zNN1n3yi7A99+WCFBZ6
 58yQeX4Hc1MkfLz/Y3GP/MrzOzhjqZc=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83cfe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pvfFc-ymSHibiSm0GcIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ImtwtwLuATd3I2mqHY9gJiNnb7gz--F-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202214_581726_A5849559 
X-CRM114-Status: GOOD (  37.14  )
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

On Mon, Aug 17, 2026 at 04:01:36PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
> > > The DP MST framework already generates the required hotplug events for
> > > MST topology changes.
> > > 
> > > Suppress connector hotplug event generation from the bridge connector
> > > path while MST is active, and continue propagating HPD notifications to
> > > the DP driver.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
> > >   drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
> > 
> > No, it can't go as this. The drm_bridge_connector part should have been
> > a part of the first patch.
> > 
> Got it.
> > >   2 files changed, 12 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > index 7334d6677604..82ed0dc450ab 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   {
> > >   	struct drm_connector *connector = &drm_bridge_connector->base;
> > >   	struct drm_device *dev = connector->dev;
> > > +	bool send_hotplug = true;
> > >   	/*
> > >   	 * IRQ-only notification: extra_status carries the event but
> > > @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   	connector->status = status;
> > >   	mutex_unlock(&dev->mode_config.mutex);
> > > -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
> > > +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
> > > -	drm_kms_helper_connector_hotplug_event(connector);
> > > +	if (send_hotplug)
> > > +		drm_kms_helper_connector_hotplug_event(connector);
> > 
> > But now I can also see that the idea seems to be incorrect. You are
> > preventing the kernel from sending the events, but it doesn't really
> > matter. If connection status oscillates, then other components might
> > notice it even without the event being sent.
> > 
> Here our original intent behind suppressing the hotplug was
> that, under MST, hotplugs should be sent independently by the MST
> framework, rather than being emitted along the IRQ handling path.
> 
> Following the extra_status approach you introduced, would it make sense
> to let the bridge_connector layer distinguish between long pulses (HPD)
> and short pulses (IRQ_HPD) -- a short pulse would not update
> connector->status and would not emit a hotplug, only forwarding the
> event to the bridge driver. Does this direction sound reasonable to
> you?

IRQ_HPD is not limited to the MST usecase.

> > 
> > >   }
> > >   static void drm_bridge_connector_hpd_cb(void *cb_data,
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 6835c68fe510..bc93b566fbca 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   			msm_dp_hpd_plug_handle(dp);
> > >   		} else {
> > >   			msm_dp_hpd_plug_handle(dp);
> > > +			/* mst_active is set in plug_handle; suppress SST hotplug */
> > > +			if (send_hotplug && msm_dp_display->mst_active)
> > > +				*send_hotplug = false;
> > >   		}
> > >   	} else {
> > > -		if (hpd_link_status == ISR_DISCONNECTED)
> > > +		if (!msm_dp_display->mst_active) {
> > >   			msm_dp_hpd_unplug_handle(dp);
> > > +		} else if (send_hotplug) {
> > > +			msm_dp_hpd_unplug_handle(dp);
> > > +			*send_hotplug = false;
> > 
> > Why? Disconnected events definitely should be reported further.
> > 
> In MST case, MST DRM framework will send the discconnected hotplug by
> msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);.

msm_dp_mst_display_set_mgr_state() is not a part of MST DRM framework.
But, while we are at it. The MST framwork needs to be updated to send
connector-specific HPD events.

> > > +		}
> > >   	}
> > >   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

