Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288CBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIHbeL0LG8G55ANYGcdpujwUfCstWXCxAhnRkcjxSxo=; b=zm6rgYKGutozloYych09sZf7GW
	hjlrf7omMRvJRCjvog5QVfyHNv1K/Tkl+lTE0BmSBxYDcFoFqpWN2OquDyIEmDHp4ZLYXNn3JPkbP
	ZrGDcBrF65BOH44E7AEZlVHUWvM9Lq6TjFx4YwLqsTtKpQPJ6VFemGHcEwwdiw8FMtbKYa0XoDOk4
	F+07tHycCXno95qgvo6YE05LRx0hixQKNCAHZWkP9xBV1cDo6IFv+CpDCVfa+qSMVsLMa1dT7P6Zw
	n9zu82lvDNhJN6f+pjyErxvg4TfvhxTQY8fXPcJL+rdj9oeZmPk+Xm44/DQmjamEYKPCQK0wRPoRj
	3Xih7hPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQPA-000000080Uy-0ty6;
	Wed, 09 Jul 2025 08:43:52 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP8p-00000007nlH-26jk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:22:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250709072246euoutp02551a99063c0558ec4ffcfa2c2d56b2c5~QhFeKJ1Dx0771507715euoutp02V
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Jul 2025 07:22:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250709072246euoutp02551a99063c0558ec4ffcfa2c2d56b2c5~QhFeKJ1Dx0771507715euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752045766;
	bh=qIHbeL0LG8G55ANYGcdpujwUfCstWXCxAhnRkcjxSxo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=u+O8eUBejQ0U3lDJSuGDT7O5A/2mhQfjdEr38ZnnSm3Z8lCrRXk6b+nevytM15awo
	 25r7QXh3IEnRHwfD96bFEDkSZQ3ByBaTuHMeYQrrxorgL8Y3By2iGo6nYl2vAjLAM5
	 n0Mdgya150E1spOOOyzKUWIQ1LJBxrPnGh+Tabqg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250709072246eucas1p1d64e4c09a83c92497d76cb3efeaf6509~QhFdx5tSY0368803688eucas1p1I;
	Wed,  9 Jul 2025 07:22:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250709072243eusmtip29880f65c5964c8e0828e1df05a890579~QhFbeaA3i1291112911eusmtip2E;
	Wed,  9 Jul 2025 07:22:43 +0000 (GMT)
Message-ID: <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Date: Wed, 9 Jul 2025 09:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Apply drm_bridge_connector helper for the
 Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250709072246eucas1p1d64e4c09a83c92497d76cb3efeaf6509
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b
X-EPHeader: CA
X-CMS-RootMailID: 20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b
References: <CGME20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b@eucas1p1.samsung.com>
	<20250709070139.3130635-1-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_002255_800768_B51B3EB8 
X-CRM114-Status: GOOD (  11.19  )
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

On 09.07.2025 09:01, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
> PATCH 9 is to apply a better API for the encoder initialization.
> PATCH 10-11 are to apply the newly added API to find panel or bridge.
> PATCH 12 is to apply the drm_bridge_connector helper.

This patchset conflicts with my recent fix for Analogix DP driver 
applied to drm-misc-fixes:

https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/


> Damon Ding (12):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Add support to find panel or bridge
>    drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
>      drm_simple_encoder_init()
>    drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
>    drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
>    drm/bridge: analogix_dp: Remove unused APIs for AUX bus
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>
>   .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
>   include/drm/bridge/analogix_dp.h              |   6 +-
>   5 files changed, 217 insertions(+), 236 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


