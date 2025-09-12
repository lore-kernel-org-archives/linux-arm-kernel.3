Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F4CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wuz/SrWcESRGcCo6gCYLmsKeMNM5PGRQfy8MjBCPiko=; b=XcI0D6CErc4hDVtydQIGxBt4hV
	4yMuG6w0arxn7uvLB/5SZXhL/rDYx0cjSnmqIyUmJFqCzgNgUWIwqPpPCBYb/+Kg5Fv1YSJzcy8zS
	gOzcXcfHASSHZFRPm23KCUfJj2Yy7PRphIGyhboQ9m5zAMHcj0nu9dqZGmOgcJWlZIIXM3wSwac8Q
	wvn3L0sMQTT46yvQrvaUC+anw5zas0C2LGPGcsgyClgbNJQ0c9lWXbueKerBh2Hnip9nNzNhJRHql
	2sUqiPtTnOKvwokLW4Uq7/OH59ouygwzaU2pmlzu4y4YhXUcxL/UDyJDsaKPbHo+wALW3IY6Ed8rK
	ucVNQWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1cu-00000008mVz-0vFp;
	Fri, 12 Sep 2025 11:07:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1cs-00000008mUX-01lb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:07:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fcw4020054
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wuz/SrWcESRGcCo6gCYLmsKe
	MNM5PGRQfy8MjBCPiko=; b=IaVkP+QqorLtlosBQlebP9mE3Uv5KNkPPk1P8+JE
	Zq9dpAgX+ekM1Zs0k/O2YbThYvj3Sx0Qwp2kKBJaM3FvKYVmgHKgOeH58p9OkycZ
	+jzas3wHOArWzLbMyOid5tMhfksUCpGsj200QR7a93K17uIMHkWg+l+PDsf/cOEU
	/rFEnbA7GHi+j/STB5y8mnnmBF+wMs/fS4aZh4hxR0a9iSKfvZQ3hWSn+UgPmWMX
	vG619QtR/QeZ9jImLqttdZdEEsagjpIAtlT2EtoAU3Z7qNuXuJDHFMV4Kaomvq7Z
	kbsyNFy+0n6rbFNxRZEL2VMUyBx12fkNcEcRHGWBCnFhrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387u3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:07:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5fbf0388eso25645081cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675251; x=1758280051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wuz/SrWcESRGcCo6gCYLmsKeMNM5PGRQfy8MjBCPiko=;
        b=UEAUcDAKUpl+xQ1uaZmN0V2dcwT/gtbITWH66QqGlwKTUnbkstHylXbnJl4LjNyJKJ
         /tomvVwrDCBbnUKz6CGu8jUlYn/M0mWUrLNtCLywmC0RGuDiA/arUZGh7+liVqke3hFp
         ICc83jJVda6hAy7AU7V2u+ftxYtHKKR1ih7hFhEtzB43iCWYANLqAmik/ypF1oWpft0T
         648MAAfZgLkSqrzRM0WzYdsPGy6jp/zUwc3//ySYN6fcmgZIAwznfxorxDw5caC8beFF
         myKjIktgpusR4jlY6FgmLM23uubdzSd0e5KQFLpvdsctfDNGCMJb34yI95bfUEfXi7bc
         qVow==
X-Forwarded-Encrypted: i=1; AJvYcCWZxLKohmiqi4aAcyr9ZCl8SbdxuAS6Cip/s0QqMqp9lJNmxiT4hjkEHR5YytKZUVi/wvBPph94oIkF5t4wfwPZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUtvLR/Vuv+715UG565boPPNdI1UcxamxR+GomV+4x1QFSjl5p
	ss+xKcFJT0lueMMq3vy21i8pKiLlsTM4nP9EAvbAoc3naDIuS2JuWcok1n5yHgN87Yhs1DRoNST
	LKQOQUO78N1J9nf7TMrkn3MS8XXSvhEpBLG6MFv7ySdGDJ5ahtqyhgpNb/Dvv7SOkrfR7ntMco3
	zmvQ==
X-Gm-Gg: ASbGncuE9VxpXzE10qQpfw7KU68D5Lf8NDdAzkzHieUuWzCsjqxGv5DOk9bQBKD8KoO
	raiIq0ri4b98CwlAUKDvdw4DSO00x6pK9fUZHQK0JEaFrX8o4CgNnEEzgUEoaz6d3KAiPOgNVlG
	uW+2LkgJZtQXrZ2qgQ2Wm0BmFn0dA7aTPoJLZREog3vD5FmIjvDqG6atVbIi1Rdzxo48HWF1mPy
	No+AI5ryLxp2RD0sbg72a+Qb1nEwPwyCIT0bFX5+IzGAXLicnPUGJclD8Od1X04RsOjjqAT4pGQ
	HkBsZSF5FQDWR4RFNdhoB8kEboiQi2iZuscTYyvT58uoccwlPFnRQti9BP3AgFMdluu4VPul9tN
	uIJGbKrGIYiqbNyv4hXpKyNjns4UzpOK+F/On6P7cIF/xSIvInGyV
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id d75a77b69052e-4b77d0c8726mr26900851cf.65.1757675250833;
        Fri, 12 Sep 2025 04:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEiDGwKFNmyX2dYy+yuf7JY3W0Iytw1CrXm3NUr783uLSdnhKB6N+spTNVyCrcHKwChFTEdw==
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id d75a77b69052e-4b77d0c8726mr26900321cf.65.1757675250170;
        Fri, 12 Sep 2025 04:07:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8211c9sm7300031fa.37.2025.09.12.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:07:29 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <s76pkp6cir2s2x6xzhnuhkmvirn3l7gnrhlpuachldbeqztwoo@xqnsyyjxctxy>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: mru7adROAEani7epnI1G7pbylx9hXEKu
X-Proofpoint-GUID: mru7adROAEani7epnI1G7pbylx9hXEKu
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c3fef5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=TUyDhR3qWEo6SlV7cHcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9EsnB3UdO2cM
 vfYx6wxXYg9iHFIHxCiGODQe19WxHC0UgJPmBnhzp/LBqW1ool1wscpLZNH74aNak22WX9hVOhs
 crB00rRLQAg96KjsGoXtqXALh0FQMcPm9MXKU9F79kk+9XkOpAxTFfkhii+0uuMT4xuHmCahf24
 uO8EcBuTtf4jyDZbBYhW9DpiEPVgZLFmyBLEFgE8mMZFaEp3F9piYWX5V/InCdvGY15vdBzrW5c
 A3VH2LcdAoquO9r5XaM4lVl3hO8Sq0yhfA0XyIi2rbMhRBVfp28cJkJIwQ3AeogtgtI2U5YDhfm
 ruPEDERqIIbHEkA2E5bhDMAlMEmhl6lpvd2RwbJgI3w05NzcggMhEaJtMPU6TdQdAYzJtqb6i48
 qvbULhJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_040734_054128_323B6DEB 
X-CRM114-Status: GOOD (  24.63  )
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

On Fri, Sep 12, 2025 at 04:58:29PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-9 are preparations for apply drm_bridge_connector helper.
> PATCH 10 is to apply the drm_bridge_connector helper.
> PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
> PATCH 15-16 are preparations for apply panel_bridge helper.
> PATCH 17 is to apply the panel_bridge helper.
> 
> Damon Ding (17):
>   drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>   drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>     &drm_bridge_funcs.atomic_enable
>   drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>   drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>   drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>   drm/bridge: analogix_dp: Remove redundant
>     &analogix_dp_plat_data.skip_connector
>   drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
>     node
>   drm/bridge: analogix_dp: Move the color format check to
>     .atomic_check() for Rockchip platforms
>   drm/bridge: analogix_dp: Remove unused
>     &analogix_dp_plat_data.get_modes()
>   drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>   drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>   drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>   drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
>     attach next bridge
>   drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>   drm/bridge: analogix_dp: Remove panel disabling and enabling in
>     analogix_dp_set_bridge()
>   drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>     in analogix_dp_unbind()
>   drm/bridge: analogix_dp: Apply panel_bridge helper

This patch didn't make it to the maling list.

> 
>  drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>  .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>  drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
>  drivers/gpu/drm/rockchip/Kconfig              |   1 -
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
>  include/drm/bridge/analogix_dp.h              |   9 +-
>  7 files changed, 342 insertions(+), 310 deletions(-)
> 
> ---
> 
> Changes in v2:
> - Update Exynos DP driver synchronously.
> - Move the panel/bridge parsing to the Analogix side.
> 
> Changes in v3:
> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
> - Squash all commits related to skip_connector deletion in both Exynos and
>   Analogix code into one.
> - Apply panel_bridge helper to make the codes more concise.
> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach().
> - In order to decouple the connector driver and the bridge driver, move
>   the bridge connector initilization to the Rockchip and Exynos sides.
> 
> Changes in v4:
> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
> - Drop the drmm_encoder_init() modification commit.
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge.
> 
> Changes in v5:
> - Add legacy bridge to parse the display-timings node under the dp node
>   for Exynos side.
> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>   in order to get rid of &analogix_dp_plat_data.get_modes().
> - Remove unused callback &analogix_dp_plat_data.get_modes().
> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>   the downstream device is a panel, a bridge or neither.
> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>   ROCKCHIP_ANALOGIX_DP.
> - Apply rockchip_dp_attach() to support the next bridge attachment for
>   the Rockchip side.
> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

