Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235E2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxsHD+SSh0Luv+skgTZWigJdecyXnBYdarAnH8cNCSY=; b=gXopRuHpCve/vKQbTOz6/KYVns
	e/iKKZHnbydlcBu9MkHqOneCHcb2Jnl4auTiYd7ATO7m5Di+4km79OimhD1WYS9nuPgEM4g43jmxZ
	HQw9+kA8NdbVRqy6gpmx4dVEBnp6Hql1RtZxJJLyl//KGW6ZC1nnDVxJX7L4JXqQ0xL2/6qENN94b
	xvrxyirGqFmDxnlFjLVOXE7OYvXyhQHjgSGVSX9mns+zMu9S7Isy4mdhv49e53zF2DO7S0VLftygZ
	K820cApoS3Yjw6DP91Tg4bd9ZaJhss8yRCjmidGgy0469U76aWcc5XukycgHCRFM2LGmO30XWXNg+
	oAAQM8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua82U-0000000DwGE-0Fbl;
	Fri, 11 Jul 2025 07:19:22 +0000
Received: from mail-m49251.qiye.163.com ([45.254.49.251])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua802-0000000DvdE-17Xo;
	Fri, 11 Jul 2025 07:16:51 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1badd8452;
	Fri, 11 Jul 2025 15:16:37 +0800 (GMT+08:00)
Message-ID: <9a094335-79ac-4419-bfb7-0df27b8fa603@rock-chips.com>
Date: Fri, 11 Jul 2025 15:16:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Apply drm_bridge_connector helper for the
 Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
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
References: <CGME20250709070241eucas1p1351e2b508cc648d1fafd93640b471e7b@eucas1p1.samsung.com>
 <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4eb09ec9-bb7b-4266-8771-26b4819f47db@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5CT1ZPQksaQ0hPGkNCHx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a97f857deaa03a3kunm3b2ab5caf2ddf4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6MRw*IjEwIx8MDFEJDSMX
	SVZPCQpVSlVKTE5JSUpDSUtLSkpLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITUJDNwY+
DKIM-Signature: a=rsa-sha256;
	b=TVoTqxymO3vvd1b9+aSl1I0T2j9Z9r35bWxjCF2PbI0G5iTNtWDkfCbrHJCDevU7au9JgckLZxcTkF0Z8DZSgEIleijQGpvQFqDHEGX0dNpC8fl9hHIVR27rvXzlXte9GD4Rjega3ly4DXnG/AxqFar4mDw05jbkgmtK1ExGa7Q=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kxsHD+SSh0Luv+skgTZWigJdecyXnBYdarAnH8cNCSY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_001650_466981_78715C3B 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Marek,

On 2025/7/9 15:22, Marek Szyprowski wrote:
> On 09.07.2025 09:01, Damon Ding wrote:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
>> PATCH 9 is to apply a better API for the encoder initialization.
>> PATCH 10-11 are to apply the newly added API to find panel or bridge.
>> PATCH 12 is to apply the drm_bridge_connector helper.
> 
> This patchset conflicts with my recent fix for Analogix DP driver
> applied to drm-misc-fixes:
> 
> https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/
> 

Yeah, I've also been tracking your patch as well, and I will rebase my 
changes once it's merged.

> 
>> Damon Ding (12):
>>     drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>>     drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>>       &drm_bridge_funcs.atomic_enable
>>     drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
>>     drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>>     drm/exynos: exynos_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/bridge: analogix_dp: Remove redundant
>>       &analogix_dp_plat_data.skip_connector
>>     drm/bridge: analogix_dp: Add support to find panel or bridge
>>     drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
>>       drm_simple_encoder_init()
>>     drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
>>     drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
>>     drm/bridge: analogix_dp: Remove unused APIs for AUX bus
>>     drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>>
>>    .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
>>    .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
>>    drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
>>    include/drm/bridge/analogix_dp.h              |   6 +-
>>    5 files changed, 217 insertions(+), 236 deletions(-)
>>
> Best regards

Best regards,
Damon


