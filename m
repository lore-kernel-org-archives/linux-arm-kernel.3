Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8734EF34C78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrgntLZaILeSjci3xZg8PBfzPBDaxQ/Aw+fi1cSA980=; b=MR6B24YCsTHUJLYzQpMM96/yT+
	30/U80j4444LJJPyiQkqM9LAb4MW928S8lRH9MRBk1ec6zRpZYDQk+cwztVeg8u6TG/VEq0qbCQUt
	2OCSKbWaoHZWMFk3LUBrF6lyWGUMHZ70vMG9IqsucNgFHiNvW7zVjg9Rahp5nT+kxiycZMvI/wwDA
	2ipMhHVtIn4g8+PaQ+Gz2DRcWo+9ACuCrtE8A4syr85Jx2NX0oqIuS1Ng1IrUYXqo2nrP4wUnUCzf
	LC8/J+nm41GIP4oYF/uJ4UTEP4BdSjd1qO5B50jW63yAAZhRmj2xDZyoBvfKHpiDvDhTkwKQdyrhe
	gu73r+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLbW-0000000GA3s-0v7i;
	Mon, 13 Apr 2026 18:01:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLbT-0000000GA3Y-2ASK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:01:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DF5W433750564
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RrgntLZaILeSjci3xZg8PBfz
	PBDaxQ/Aw+fi1cSA980=; b=hjbZNO4Q9bt4h/2K5hMOt14QfyAOqVQt5MCjIkup
	9siXOZX6diiUjWPHX6nHDCjw0+xVApMKOpQI4O+oC6Oj8RUSh+3Qok4H/d35fr+J
	62rsGvOkqgdG87A8D7CIJ0t2PTo9S7DGMeQmMqG1BuHJyY5gVJmFgf8Cv3LXSrVh
	rQTqfAc87o0a3xj2aVUWzgOAB6nEEeXJw2colnA1gmAqQFjYn+8tZ1Drh2JrHOUY
	m8olujJBYOnDeQM2z64twFi9HD8PxrnbK2aLJK1hqF7WW2sLlw26/CpCpkDcUXUw
	RiN9OVcN9jXa7XrXmiQthGd4DY4fTXnZumqk7t4tEXjUxA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh2tu8ma9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:01:41 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-475f6d0de69so7289477b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103301; x=1776708101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrgntLZaILeSjci3xZg8PBfzPBDaxQ/Aw+fi1cSA980=;
        b=HT/1gDD9aDTvWqCxdUxTuV7RAwyRxIUZ0svxhvnlaAKJi9sANsZoxAD2F0lnjkHPec
         3obPk2A/wrj5sfLFOrpaaW4/p6j9Y23Ft5+SLZ4NPSWEJUWxtbQByrr2W62v95xhwTj5
         yZCdonFHSTe2i8YypmzK8TKTtgC/dKnHY+vN4Z8w28vg6HbsN1YYC4tzHX7jwQJpBDJs
         cYC6z9FhpwFqyNrLKz5Zy00fsVx1A5Sb22fze3HxwLoy6DzZrpe9SbFITpVriJ7vrQtg
         R3hxDmjE/A3l2gYKEE1k09dSD7MtaTiy37kg7/YzU3AhLuw88LiZ2qLy6m+nXsYestK9
         134A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103301; x=1776708101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrgntLZaILeSjci3xZg8PBfzPBDaxQ/Aw+fi1cSA980=;
        b=Q7tEG9U5mvDSWyki9chUmvjg6179cSgeeiIUAaSJ9/i1ZRCvM/USH4/WAmNZyTT84/
         mFPPnKX5+e/7h5JRHE2NSmcRtpmqOqkt6goSmIM+eDxBe9AtCcplaNdRqtF1aguJXe7d
         ed4+qtBeWRsAInM0v1/ElCrVMpgfsdRZBFwL77fBE9l4G9r47Jq3ne8TnwRK741ZL+Ld
         2nwV6Fg5/veNYhA7lulUeSn8d21Hfr7QXYzPKR05YVMutdGKStzrAfDAfon+rkWJNDnN
         BdTNrQPN1mvyTs3ryDC7qi6/nxhuTB+gol3YgGAZBoOF4QorbltTJHRmkCIE6TX8B/JM
         oyew==
X-Forwarded-Encrypted: i=1; AFNElJ80KfF0VFLjlSItcDnGbvhG/MjlcbDdKhB+42QlxkfjhPNMi/sIeR0ZIqrXFzAGR0KdfOf/K9a47mjL+GmZHJEE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2/ivRhzoDG7BqYE1JnqhXrbyyyTFpulpP0v5TmoJ3tvFhp63Z
	GxT1UqrTDb8aCCOxTpRNmJ+pkiMeV6bnS3Nh2V7BBt6L/6IPysCOA2C0iPwcudRUs2tk47Zdz42
	d7YPz6cNiR2WV5HRlDoExIHyedWEWshr9j1QktB9yw5mAnUVMbgpZjL0w7AxNnu6tu2bgmt4bhY
	8dgg==
X-Gm-Gg: AeBDiesg3krz8LVN7MPIrkV7z5piFQbRQcwatEgKFOgiuwM/x1uXXYs64DoUbLDCFlL
	uh1fSBxmJ8H4OpDVmRdcQ/imvRyw9Sffn30Qk6WeVnaQjB1Tw1wykVM1XBremGXDVboRD4ntxRr
	easM3e29hWjm1q8FIq0IpKwI8X9sehnEKuqGLjMkGWlSN0vqQVNnWq5QQufzuY6cEznYjNhLl2y
	w+luKMlEr/Lkeb2xZQz0a3kV2du10xGFZxPa7SkRscVCuWPz6Ozzt1+0UVGi3SGiVTHRlQsZ/Vf
	75H6OURKIk9ulZN71KIh/DT39V8jJ6jOnnFZZayT+3VKlimySFRsGgWQYVJscnwRuTTdC24tpq3
	8ZzSwrs9aSPqhsGpQgpduAQchZPwZyDO013o+ZIdWbxBvTwcSvKZ4iwiXKhvPnOAAKyGz+HOjN8
	zt6GK2BP1fXN0bRib8flejgODHFmHm9CapZWRbdaphx6H6og==
X-Received: by 2002:a05:6808:c1e9:b0:467:fd08:2826 with SMTP id 5614622812f47-4789f30c472mr7094120b6e.40.1776103300596;
        Mon, 13 Apr 2026 11:01:40 -0700 (PDT)
X-Received: by 2002:a05:6808:c1e9:b0:467:fd08:2826 with SMTP id 5614622812f47-4789f30c472mr7094006b6e.40.1776103299515;
        Mon, 13 Apr 2026 11:01:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492710ccsm26015781fa.7.2026.04.13.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:01:37 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:01:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] drm/bridge: lontium-lt9611uxc: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <rivgablnl6s7u54gyv77vr5pitlvvgzby7qnu4ryc4tttaqa7t@hztujmxw5njt>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-5-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-5-acd01cd79a1f@bootlin.com>
X-Proofpoint-ORIG-GUID: xtUR0j4A7GWVRkULCehhybTeaCPre0Dh
X-Proofpoint-GUID: xtUR0j4A7GWVRkULCehhybTeaCPre0Dh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NyBTYWx0ZWRfX1liadFaJiD1m
 9uPNjsis8//5pftn7+O3lwE7SGDcxmaXt6ywx6r0O3T70wKhq8+wHgydT+XaNXz+ti1js6MxkAR
 rCuSWnwEpEIXgwYCRPsGWHsSD+7u8LUpKhKLc+TqqG/UcXRj+ovWprd3H36qnnk02sRuO55a6sf
 lLI0oPQ4tmDyWqGN7BRN0UfvvbbAF/wTIkigEEzvUGNII2uOxwYHtbunu81BK8HqC+Z2SGNru9N
 kmwdB+2W5DwxsAvaH0iV6dtqFnQbDQLDEaYaAsa44yQ6pO2Exez5Q3bz8HlpRfJNwa9twfVe4uK
 Bx8FNVx7xvv2247hnybc48v2hyObOxssUZXKFrDCKXyIZnHD6yoHl1B43JwsMs9QFjCu4s5NKgo
 GYixkV+VrKp74woGb6gvnOSxKT/+trD5M9mWe2mU+MJK1MNM3b5J8BmAVg/hOHVa0OU7T/VLSFa
 0qc1HQYOtaM1g2TS2aA==
X-Authority-Analysis: v=2.4 cv=RJ+D2Yi+ c=1 sm=1 tr=0 ts=69dd2f85 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=xZdyE3pWI4XlTmgEQ5MA:9 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_110143_694886_481265E5 
X-CRM114-Status: GOOD (  26.13  )
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

On Mon, Apr 13, 2026 at 03:58:37PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.

What if the driver's _probe fails between increasing this refcount and
actually registering the bridge? There are enough possible cases. I
think this also applies to other patches in the series (BTW, including
the msm/hdmi, which I ack'ed).

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 11aab07d88df..55b80a488c33 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -35,7 +35,6 @@
>  struct lt9611uxc {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> -	struct drm_bridge *next_bridge;
>  
>  	struct regmap *regmap;
>  	/* Protects all accesses to registers by stopping the on-chip MCU */
> @@ -284,7 +283,7 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>  
> -	return drm_bridge_attach(encoder, lt9611uxc->next_bridge,
> +	return drm_bridge_attach(encoder, lt9611uxc->bridge.next_bridge,
>  				 bridge, flags);
>  }
>  
> @@ -487,7 +486,7 @@ static int lt9611uxc_parse_dt(struct device *dev,
>  
>  	lt9611uxc->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
>  
> -	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611uxc->next_bridge);
> +	return of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1, &lt9611uxc->bridge.next_bridge);
>  }
>  
>  static int lt9611uxc_gpio_init(struct lt9611uxc *lt9611uxc)
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

