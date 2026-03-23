Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618E2D58CD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=; b=upNkpcYaeZmoM1f1ZFevXNOaXM
	3nwLuD4G52baf6YFvAw09pHNmM4UOsGhVhsK8vCsYTaVNoElPgkm11pkhxpu/VGQ0o5vdw74+x5N5
	4DE8UrwLXd0pAKtzCJ3Nd8ppb7uz6SwbX8ZUuP328MDEK5jH0HrVKgZkB4MG1gNvJurhjwlu2Xlt6
	g1hdZNJtfTKOE7O/1If+Xza9aAKMBRo/HK5Jb76bE6GxYZ5KDXvVTS5sOfuAefn8M2c2DDaiA1dpf
	bu4BAkW0oSoaa4gv34JPsJyGK3URzTmJTVkKnDnhVvjhgRNsyVbFpXFNnuSZG9rJguuekatFhsqAl
	mr17VIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WVY-0000000FyTF-3omq;
	Mon, 23 Mar 2026 04:03:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WVV-0000000FyRE-1ppK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:03:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MMft3W1286035
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjTWTO9LGKbNJnCdQR2t56Ga
	qKq39XkGtlvuZ5fybUY=; b=Ozc6CeFD6p1fCbrn7gsfAUtdjoYHKvbceDQNVeNL
	gdGiq572M53A7ankXVia7Q9sS7TX+Qu5iMKQjqtSw93u/AJzb2beekF0AydNlzh9
	W2SbJM4tROlHH2oUhRrdishXFoYahYu3BPMjSSHJca+vwzSbKmC8inVkmD/zcq05
	8inmKT5xjBX66/Pda5BYtqNzP0gLZMC5NlCLIt5NcEDdAnmabFiyp/YBPUQCcdDE
	rgWB1SvrJ9EsA9J3Mxy70Du2SDeI6qLM0fgsIUWErTgvZ0zp7FmeMkxRnbPrHW/H
	OCkQ/cwWHQ11kLfWcLankx3x2yH2KW6w4Kjo+PzgcEcMNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5umna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:03:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso36295851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238591; x=1774843391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=;
        b=YYNhO6CW/VDZJdJyQsK9vA0qB8XvEIMtnIbrzz/71inuDlvmnP3q7TX/6xYv5zldL2
         bn8zrkdIzxR955Rupr+G1SaS8OIukpCWeAP6k4xBf7DJ4v+rgA1bYqfsCez19KapuqD4
         74LzKuTt338lKIGyUl3wNINT23XLXJHMAubit1oEFlIQd/Z/gJwXoRYcrPo5hdkntIaf
         1LkgQADGHNtWIcn9MqiJRqn9o8Ygny5wcgEqDOkLZjwV5M7gYd7oUD/A8H2Kj8kF9F06
         8vRYZepqsDqHLudq106BCxP3VzptA4kd/HZpU4daXu+N+MAvmEN70yEZ1NMKhpLxxYKt
         llEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238591; x=1774843391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=;
        b=F0QWfyIaVK63mK1hsj6ryiLLEA9ZFazFx98ZrSqAHovW1mb8D14zZS8L27K+PknxO6
         /WM48OFyAIM9LFPESbvVspTAvGZusipnPZzS4ekj5n+xtDrm6Mo6P/oasoyj+PI3D+gG
         DizNs0YfYUAVT8y69Xng1AnpMGQ/FZ94FXpTia18QgtnFa3e94ZymOoYSUNmjTLzXUlH
         0q6gFJIMTIqH4V4Sqh2UrT58KdzQT3LG0hbphqboUOL3AsF07RZhhNwXpxtEo7Dh2J5w
         0sWYD8oomoiI6WKUCaA6Kflx9St7hyBRCsqfVtjWwUUKgoM5jjJARk5fJRdRO8IQSnaD
         wdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZFwfxaVGEUkoP+GcYpBm94GyAlU1rOhbXrPW65OBrbbqbhJ8k2JPQmtSHFYRjVtPtX8whZRjhnUjFBXR6a28l@lists.infradead.org
X-Gm-Message-State: AOJu0YwE82tQQ0oFWRFgyUaMk1cYUdfQdwYjO1bU9SgEz5iMwa5LK5fI
	+0bSO96vPmEikpBs63+BfvsERiguCq7a7MFFb5MPJaIExe/iD6vJ+YCrla7H3z4Sc8VxU5rmfeB
	PThCh5J0OY0OIk9eEuw8rImIgt6fRSGhniBSkIYZj0qGVCu6rHrko6XERAEdKN89vh08y/SqBdz
	THFA==
X-Gm-Gg: ATEYQzz7bxQVV8GGoIXIca0anD0Ox4/7OW/WWyDm25sTgGPV08LLHA/kp62ffQWs2C8
	SzStzyRnGQLVxG41cNH4qkbN1511/xw3c3OJw9P8y+eh7G5L6gMu3ebJn5VltssnaRn9j3ozdy8
	fglhv/pDo1K1JpHH990BoWegOU6yp2tNY0uoI0udJgjKLRdaiRlG1mrkum9SKdanN2u4GNMheNl
	QeQvkkB/2Ins7puj8hR5LnVnxxDFCIky4wigVJfEFhHpaPU7xx9MRUuCGzZwKyFwGbM2KF6J7ZP
	wp+ERL6KZZ+C6BaTnKvkvwGkLvq/1DfTQDjiZmuYYvCWX9ILWDeg7GKQvIVUIhod5anH/8+G4sM
	ecLEC3tIJqk0mvZdb8osDZhDA1zLQnZD3bVI/+mdc/XkehJPBlkzUwZd8or8spfwoVKDLYV/hnF
	BXP5xOnk574n9B791Xu8slayC9yS/TwWPNriA=
X-Received: by 2002:a05:622a:7c0f:b0:509:3c8c:2405 with SMTP id d75a77b69052e-50b3744f6a9mr130275771cf.28.1774238591429;
        Sun, 22 Mar 2026 21:03:11 -0700 (PDT)
X-Received: by 2002:a05:622a:7c0f:b0:509:3c8c:2405 with SMTP id d75a77b69052e-50b3744f6a9mr130275571cf.28.1774238590919;
        Sun, 22 Mar 2026 21:03:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853055bbsm2240569e87.60.2026.03.22.21.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:03:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:03:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 07/14] drm/bridge: cadence: Convert to
 drm_output_color_format
Message-ID: <h5giabamrwbtuumue52iu45d2jiybcwbbw3r53modge2pfe5k4@ijprwzi2qx4f>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c0bb80 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=CFmvC39ClzzmkW9Sp_QA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNyBTYWx0ZWRfX7kgSDWagXGXl
 48y2X4R9iE1i8ERK+shfcN9LSF0xJjSTaeFVG8JUTqq9DQnf+MsHRp6DwaenLQTMCJYvPNzxZu6
 Ad+xJpgCO4PNFq34D0RvfAhmNDKPsg7df7vR6nX2RAxsOV6g1LvftI16orbUBMZNdT7aL2wbdtB
 vnZKEeKuL6/h17OwX5C/WGpod4/PgycGTYwuo5txO1uDBvrc3DLnZMyHavRMXXiS4bFwZPl0rVs
 A41r9L2RjN8ObUboFC1SZWTydRhzzp1cF0h/McQCw/qt3t3j/J5kdi3r/GsSNBrpVOX4uysetsC
 3vbsl5tBkTXQxFRJ5i5JnjWDgQYanf+SOKHVx9tVKjlLk4Mvf2xHUc98FPOTuVWXDkdmuSMjwI9
 a9ZHS7MxboMqXK7jEo6VFSdinNsp+J4DtRVLkbUVhj3pIbl8vsK4Ql2YvBb1dwHD1ethYP28/Jp
 QOIuJGToCOaSXgZG64Q==
X-Proofpoint-ORIG-GUID: n63XV4DlZ_ve82t1lBhPDFwG6ZIiXid_
X-Proofpoint-GUID: n63XV4DlZ_ve82t1lBhPDFwG6ZIiXid_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210313_612296_5C630C64 
X-CRM114-Status: GOOD (  26.17  )
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

On Thu, Mar 05, 2026 at 10:04:59AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 24 +++++++++++-----------
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
>  	switch (fmt->color_format) {
> -	case DRM_COLOR_FORMAT_RGB444:
> -	case DRM_COLOR_FORMAT_YCBCR444:
> +	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
>  		bpp = fmt->bpc * 3;
>  		break;
> -	case DRM_COLOR_FORMAT_YCBCR422:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
>  		bpp = fmt->bpc * 2;
>  		break;
> -	case DRM_COLOR_FORMAT_YCBCR420:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:

Nit: where are those values being set? I see only the RGB444 being set
in the probe function.

>  		bpp = fmt->bpc * 3 / 2;
>  		break;
>  	default:
>  		bpp = fmt->bpc * 3;
>  		WARN_ON(1);
> @@ -2479,11 +2479,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  	mhdp->link.rate = mhdp->host.link_rate;
>  	mhdp->link.num_lanes = mhdp->host.lanes_cnt;
>  
>  	/* The only currently supported format */
>  	mhdp->display_fmt.y_only = false;
> -	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
> +	mhdp->display_fmt.color_format = DRM_OUTPUT_COLOR_FORMAT_RGB444;
>  	mhdp->display_fmt.bpc = 8;
>  
>  	mhdp->bridge.of_node = pdev->dev.of_node;
>  	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>  			   DRM_BRIDGE_OP_HPD;

-- 
With best wishes
Dmitry

