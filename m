Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CCCCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZxPWSKtwF5orX0VqJt5KBCZ8QBtCRHOEdMlILNOyus=; b=UmqBLlDsJckilOT6N31mEhmRdz
	OrpAxUWvJtAjHwP5dSbUI5BLrr4nHfkfpr+2hQQDMhworENgytEaYiANHZJyMgnm8QxBZZsj5VMEm
	eB8Pat1jhv3QqiWPA4t5pwIeSDiu47DcAh26f9Iz7okFeCQM6Ip+z2CmejXdhnuwS14BXgfPID4vf
	EK1CX2MnNOjhnoD++O9dcwc5KHzCZYE/d477VOoAFgFpZja/zVH6PBLMzzq/nyPNkYU1wetp1mFIr
	hLnCKWyeFbGHhpeFHWy/jyZWxXF0dZKzgqrrsRVKq92HdLPSDPMq+lNmc7FnlWU/uRAix/I1rO104
	ite1a8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvps-0000000B72j-16y6;
	Mon, 01 Sep 2025 04:08:04 +0000
Received: from mail-m1973172.qiye.163.com ([220.197.31.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvQE-0000000B3cG-2B6l;
	Mon, 01 Sep 2025 03:41:36 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 213b40c01;
	Mon, 1 Sep 2025 11:41:22 +0800 (GMT+08:00)
Message-ID: <46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>
Date: Mon, 1 Sep 2025 11:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
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
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
 <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
 <1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
 <f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
 <a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
 <461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99035d7c9903a3kunm3d5cd7fd4a1b94
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwaGlYYTh9NSk5PHUxDGkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=W4yYo/vwpzX+wWl6tvpk41xzzN7CA/SKhUfAX6MB+T5jbvw/HtFCdcjzpMgafZDDmuO1cnDmkB+2Ig2UIxH5taHX9gVXpdOpf1mmsDskVveMeT8dWgZ3qvvTnW5jzKeyrJhaCGHtt/gSsurno0qpzLJQi5+A1VeMJeP0nS7OaTU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=yZxPWSKtwF5orX0VqJt5KBCZ8QBtCRHOEdMlILNOyus=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_204135_086646_B7C1004D 
X-CRM114-Status: GOOD (  17.19  )
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

On 8/29/2025 4:23 PM, Marek Szyprowski wrote:
> On 29.08.2025 10:08, Damon Ding wrote:
>> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>>> On 15.08.2025 04:59, Damon Ding wrote:
>>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>>> PATCH 1 is a small format optimization for struct
>>>>>>> analogid_dp_device.
>>>>>>> PATCH 2 is to perform mode setting in
>>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix
>>>>>>> side.
>>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>>
>>>>>> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's
>>>>>> Kconfig,
>>>>>> so it causes build break:
>>>>>>
>>>>>> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
>>>>>> `drm_bridge_connector_init'
>>>>>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>>>>>>
>>>>>> After adding this dependency, the Exynos DP driver stops working. On
>>>>>> Samsung Snow Chromebook I observed following issue:
>>>>>>
>>>>>> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
>>>>>> following panel or bridge (-16)
>>>>>> [    4.543428] exynos-drm exynos-drm: failed to bind
>>>>>> 145b0000.dp-controller (ops exynos_dp_ops): -16
>>>>>> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
>>>>>> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
>>>>>> exynos-dp failed with error -16
>>>>>>
>>>>>> I will investigate details later in the evening.
>>>>>
>>>>> The failure is caused by trying to add plat_data->next_bridge twice
>>>>> (from exynos_dp's .attach callback, and from analogix' ->bind
>>>>> callback).
>>>>>
>>>>>
>>>>> Best regards
>>>>
>>>> I see. The bridge attachment for the next bridge was not well thought
>>>> out. It may be better to move panel_bridge addition a little forward
>>>> and remove next_bridge attachment on the Analogix side. Then, the
>>>> Rockchip side and Exynos side can do their own next_bridge attachment
>>>> in &analogix_dp_plat_data.attach() as they want.
>>>>
>>>> Could you please help test the following modifications(they have been
>>>> tested on my RK3588S EVB1 Board) on the Samsung Snow Chromebook? ;-)
>>>
>>> Assuming that I properly applied the malformed diff, it doesn't solve
>>> all the issues. There are no errors reported though, but the display
>>> chain doesn't work and no valid mode is reported:
>>>
>>> # dmesg | grep drm
>>> [    3.384992] [drm] Initialized panfrost 1.4.0 for 11800000.gpu on
>>> minor 0
>>> [    4.487739] [drm] Exynos DRM: using 14400000.fimd device for DMA
>>> mapping operations
>>> [    4.494202] exynos-drm exynos-drm: bound 14400000.fimd (ops
>>> fimd_component_ops)
>>> [    4.502374] exynos-drm exynos-drm: bound 14450000.mixer (ops
>>> mixer_component_ops)
>>> [    4.511930] exynos-drm exynos-drm: bound 145b0000.dp-controller (ops
>>> exynos_dp_ops)
>>> [    4.518411] exynos-drm exynos-drm: bound 14530000.hdmi (ops
>>> hdmi_component_ops)
>>> [    4.529628] [drm] Initialized exynos 1.1.0 for exynos-drm on minor 1
>>> [    4.657434] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>> sizes
>>> [    4.925023] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>> sizes
>>>
>>> # ./modetest -c -Mexynos
>>> Connectors:
>>> id      encoder status          name            size (mm)       modes
>>>      encoders
>>> 69      0       disconnected    LVDS-1          0x0             0
>>>        68
>>>     props:
>>>           1 EDID:
>>>                   flags: immutable blob
>>>                   blobs:
>>>
>>>                   value:
>>>           2 DPMS:
>>>                   flags: enum
>>>                   enums: On=0 Standby=1 Suspend=2 Off=3
>>>                   value: 0
>>>           5 link-status:
>>>                   flags: enum
>>>                   enums: Good=0 Bad=1
>>>                   value: 0
>>>           6 non-desktop:
>>>                   flags: immutable range
>>>                   values: 0 1
>>>                   value: 0
>>>           4 TILE:
>>>                   flags: immutable blob
>>>                   blobs:
>>>
>>>                   value:
>>> 71      0       disconnected    HDMI-A-1        0x0             0
>>>        70
>>>     props:
>>>           1 EDID:
>>>                   flags: immutable blob
>>>                   blobs:
>>>
>>>                   value:
>>>           2 DPMS:
>>>                   flags: enum
>>>                   enums: On=0 Standby=1 Suspend=2 Off=3
>>>                   value: 0
>>>           5 link-status:
>>>                   flags: enum
>>>                   enums: Good=0 Bad=1
>>>                   value: 0
>>>           6 non-desktop:
>>>                   flags: immutable range
>>>                   values: 0 1
>>>                   value: 0
>>>           4 TILE:
>>>                   flags: immutable blob
>>>                   blobs:
>>>
>>>                   value:
>>>
>>>
>>> I will investigate details later this week.
>>>
>>
>> Could you please provide the related DTS file for the test? I will
>> also try to find out the reason for this unexpected issue. ;-)
> 
> Unfortunately I didn't find enough time to debug this further. The above
> log is from Samsung Snow Chromebook,
> arch/arm/boot/dts/samsung/exynos5250-snow.dts
> 
> 

I compare the differences in the following display path before and after 
this patch series:

exynos_dp -> nxp-ptn3460 -> panel "auo,b116xw03"

The issue is likely caused by the &drm_connector_funcs.detect() related 
logic. Before this patch series, the nxp-ptn3460 connector is always 
connector_status_connected because there is not available 
&drm_connector_funcs.detect(). After it, the DRM_BRIDGE_OP_DETECT flag 
make the connection status depend on analogix_dp_bridge_detect().

Could you please add the following patches additionally and try again?
(Not the final solution, just validation)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c 
b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a93ff8f0a468..355911c47354 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1491,9 +1491,11 @@ int analogix_dp_bind(struct analogix_dp_device 
*dp, struct drm_device *drm_dev)
                 }
         }

-       bridge->ops = DRM_BRIDGE_OP_DETECT |
-                     DRM_BRIDGE_OP_EDID |
+       bridge->ops = DRM_BRIDGE_OP_EDID |
                       DRM_BRIDGE_OP_MODES;
+       if (drm_bridge_is_panel(dp->plat_data->next_bridge))
+               bridge->ops |= DRM_BRIDGE_OP_DETECT;
+
         bridge->of_node = dp->dev->of_node;
         bridge->type = DRM_MODE_CONNECTOR_eDP;
         ret = devm_drm_bridge_add(dp->dev, &dp->bridge);

Best regards,
Damon


