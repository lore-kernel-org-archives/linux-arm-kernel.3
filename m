Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=; b=ZanlSQpVny6bQi8PxZYABt47Q1
	T9U6GqIZQ25BWwHNvi7FnwDfuQujLIIXa6HDh+7mVpj84R3z22jUKiB1Ky9UenjAE607QFktEfFTY
	4OxArCf24Wahdaol+WH9ZgiCJ5o4/Ot7ijfjJUeZwWkZ65jp9mS3/4Rr/crczk1z8OVy+gh9OSZih
	nR0BZmabYLRFnXv4EKMLjwMgKDH+0y7jL9HlOJM6zqwVyU3bRsfBJK5Isedm7bQAAwEy1LJTZzNQh
	YFXkeUosupXjWxS4DPMIffUWX/EpFfT1lAemPYn2jNa5ZvmbJgayqcZbsN1Q+sYFq+9VPCfyBFhMO
	yC//+4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirJx-00000007LhR-0FQw;
	Sun, 12 Jul 2026 10:22:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirJu-00000007Lfi-3fGM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:21:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7S5bY1746430
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=euGwPsPogDlniuV4FhHgWZRz
	xcZ+x1hQNJ5g0xOwNmM=; b=X58z8cRps5ywNgg0ZH5F6VnwwvBCFv6bDW4o4X2y
	XjOa6whOhh2nd9VITGFOkzZ3HuhovVw37j4++/69sFS+3b0/ZhhA6hf+2iOH0PL4
	1zVGdqE7c5lNXkXjWB+W8SHX0VtI2xZMvv/oP4uONKgKkY8YG74yoEAovI7xD5JN
	DDIMddwjxtje+CrPvhk9Bf+LB9h5dagp947BdyIHCDnkDGfr5C5hdq2aCwPIZIaH
	/aRpuIEXlnNDtoaV7FKGCuIpnBoPkUeXPWLwlX61UT+4UH0BAknhRBLXPCg7wUYj
	40ios19eaDAiCyZYseDVxuPB4IqQsaByNOheIK3jg+4GGQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjgmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:21:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96feaeeeb3bso149655241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783851717; x=1784456517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=;
        b=GQA5gzrZlSUwe8S0xMUT7TkRFK2dVr/yhjUT0OxQDvhttGewQFQSkV1RWwApTKD0rZ
         hDMyagc/5YJiLct/kAeY0B3bpUXncubmnmRrLvnVL3mdgFooWq3+U1clzpv2/UjHw8ma
         N+ORmHupb+Lhhp2843oQ3HYZP5/Boq6j6I/ESY7ShV9JclxyLCp7umCv25yvV61dvxli
         zU+Ut6n7xPAU7N5v9lszoOkRQsccWSHNlqXkkSdpIKa3iSo5EUGbSRbZAdpR/QJdD2aJ
         xaiH/YXvvjsJK29srHJs2jRal7bQGuIsv1ubn8k0iZkUty3PVEMqzsPN7NxgxNymse+2
         cYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851717; x=1784456517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=;
        b=fIr2S7xRwoiWiR4KcSXkc40e2bK83IxPGyInW5kxnDD+Ark/SM9YTCS658dskqPOWZ
         3hGe4YdYOyT63DsbI9n5zpSGMpO39TJS7KVvPuporL7BSucBA40WRAZCYqL8rNW7T6mf
         FzSFbqB/SRLt7GhaaRaaBVrWv997KmX2mFpNVfVpngqV/mBoibK2G7WTmg/wayguLGoK
         suaQvatS05dpvp5fvY3Nb9U4JwmYBFvi6FDD2SA5Txpq8GfKtDwd81gc7UEukVl8HdaT
         eW4eFHq2Sk/cFg3k2j8LpEpsPQeFctfBwaPtgPirI46RrtoeaUB54rMrF0cJ0lwEwieH
         YoWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlTXs8Iqv9KNKaeBrAd+GejNYfYrPB8iGBX9vyDNLhvZWwsBKsrNpvk+p+p9Wnp29hjGkw0+sBvRwZlUZhGfc7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr9Actqz0vt1K0cTcbDPfq1boogK1GKf6jsUZmk9ZmyoRgTeOr
	nzlsW2H1aSrEJeFaPZ4ioEB44UdF0cpWy/Y57zLZfU1kmSkwBmdklfYsgrJzKQ9WZVMoRbIiwiS
	FFrHnjgMvcLpvRs4wWM8KT0QmVC6UF8ZF0ui00TyUCCLROA4+WW2aQ668qmtFSdllQ+/J+cf0r1
	EpOQ==
X-Gm-Gg: AfdE7cmbC2l6YzxEwMpnNZPyLaiiBIcf/usopsHcI9RsTki/J4Et9acVTqoZdJiwF3w
	2b/IY2AJpsM0jH28wTJ8kXgEPYG5qv0qmz8/wlTk9sY91mwicK/xpkfwuHZdhs/AQN/+VawRcky
	/SKdJUz2vTrGkbXj5U6UDpQzj/7ZRCVNTalZ52c+aE1xNbAh41Q/CVwhlPXbzO+Uc9FEcU0kkQi
	a1NpzEEaX33r1QlrefpA+nycDTl4XkZYaoHrWyp15ZVGmou8iFPu9ZwAap2E1NJk6gFshVRs+cs
	KftY38PEFIE3P0QeTocmeDIBg9grxh5p3Oudw8AT9GNPYl6dlvyZtHSZ7Gktq9OyL10T2t+W4Z4
	w//rQqqPqcnTofhAGSHaaayekeFSUpgQRxyqEH98fK2mzwiuDsYsy6rR0uEblOoFG37N9Idtxot
	HTyyEXI6KpNU/olTNG7Yc1RxRY
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr1242369e0c.7.1783851717368;
        Sun, 12 Jul 2026 03:21:57 -0700 (PDT)
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr1242356e0c.7.1783851716956;
        Sun, 12 Jul 2026 03:21:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84bb39fesm21064931fa.42.2026.07.12.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:21:54 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:21:51 +0300
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
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a536ac6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ROdofPDD1fpM39RL8CQA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: -APFZrBvYbQ5wUG5mHm3JjDQmB0kC9jx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEwNyBTYWx0ZWRfXxHOzNgoFlRqg
 JuNnNL5oagxONhDu7kRfr7M6JEUUtGDtYDRHuGwxbZUiKozNXDvrMb8kyv4fz90MdDhp52RXU/T
 /2z2jY4zEoCDjrMQoudDmOJ3/pdGayJKVLY8Z3+FwcNeIe4SFzGrgWodFLn2jfFw82i2YJJebXh
 4U5jMhaCbxeCfRasEd5X9BZRwlDGNY6Pa+07TFxBj/P2tZf9NvIy4qjwfC57VSHvxkERZb4fVaA
 d0dU0ndhdkQgzOw/GWGmKyjnn1On9jsVd2JjngiJQGHAiRcCg/a7RTd3pQxZbYUed87EnqCvlhv
 9Ege1YAky6s2LnEwB3jRMQxtHtJ9b3gm0uUDrR+g+F5+jY/XMTSIAzdWSdtR67wWZ8jiYD3MvQP
 G1v6aE3KyDjyAIlHzgdp1uUjtZ8mRjSbPRjRokewFFnLxCfKhcskz0vfP4c4Ox8jb553HVih8RM
 Fn+mTvnVZXRAsMMnVOg==
X-Proofpoint-GUID: -APFZrBvYbQ5wUG5mHm3JjDQmB0kC9jx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEwNyBTYWx0ZWRfX+EgxS3YMH11r
 fALS7RAYDV3OdlTnfJrli5Urop56TDWIDImyq413Bsy/i5zpopLsF2BPSYej9nE8CJs2HgkazW1
 A9QwDaVDDvpNx8Or9QLN44Sw0N20DlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032158_919513_71BBCC26 
X-CRM114-Status: GOOD (  20.55  )
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

On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> The bridge connector framework currently invokes all bridge
> hpd_notify() callbacks and unconditionally emits a connector hotplug
> event afterwards.
> 
> However, not every HPD notification requires a userspace hotplug event.
> 
> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> IRQ notifications through the bridge chain while the actual hotplug
> handling is performed by the DRM DP MST core. Connector creation,
> removal and userspace hotplug events are already managed by the MST
> topology framework.
> 
> Allow hpd_notify() implementations to suppress the bridge connector
> hotplug event by introducing a bool *send_hotplug parameter. Drivers
> can clear this flag when HPD processing should not result in a
> connector hotplug notification.

Why? Worst case the kernel receives another hotplug notification which
gets ignored by the driver.

> 
> A NULL pointer indicates that hotplug suppression is not supported by
> the caller, such as the connector detect polling path.

And nothing in this patch makes any use of it. I'd say, it's
questionable addition. Let me check other patches...

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>  include/drm/drm_bridge.h                       |  3 ++-
>  7 files changed, 21 insertions(+), 12 deletions(-)

-- 
With best wishes
Dmitry

