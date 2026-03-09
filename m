Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD21F3C260
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+pjJ8AYp8UNMrQ2/YzyBJ5hJEx0e6GJLawz++scizw=; b=szRicq0bEAk/S1G7zvat4RiFnT
	y+ciuSrlStgJ/JVbAqTmE02OINigpW5N8xrjmoysXQOnyfgUefrPQJcRK8zaXqi6tRd4IIEkIFneC
	34VyRfYlAubD2CUGiZnF0vibtmme4zP+jImlM9E5bF6lLgc+rAufhoV6Fbg4heDdqqwvzaZ9LO4BR
	kaAbLRrWgNyx+SQDZzIubVk7XROrlpv7mlKIqsEzsCQL3XgHOr6davswW7xp/l3HzDAOFi1eCtXuu
	ojRHCeJbCk0wpdbNPOIGr5mjb2ou08bgglx0UuDHUqoTevC5LsF+ajO67o7mv/NFrCGN24zNZxaes
	YVbvMdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzakX-00000007PD3-3hKX;
	Mon, 09 Mar 2026 13:34:21 +0000
Received: from mail-m49248.qiye.163.com ([45.254.49.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzakU-00000007P8u-0k5P;
	Mon, 09 Mar 2026 13:34:20 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 364581b40;
	Mon, 9 Mar 2026 21:34:08 +0800 (GMT+08:00)
Message-ID: <8df0574d-c4c8-4a6d-a357-7b8c82a38acb@rock-chips.com>
Date: Mon, 9 Mar 2026 21:34:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/15] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
From: Damon Ding <damon.ding@rock-chips.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-10-damon.ding@rock-chips.com>
 <DGT1S368J0BK.3UA75JNEA1AB8@bootlin.com>
 <b08028a2-a721-404f-aa37-2d5460b42f94@rock-chips.com>
Content-Language: en-US
In-Reply-To: <b08028a2-a721-404f-aa37-2d5460b42f94@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd2ce18f603a3kunm414b5e452e0573
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0geTFYdSkNLSUoeH0hNGktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=M4Y5MGyxF/AdrP3ihZXEHSWnvV2h0B7W+h5SyJclBYmjiA7VtwI0rHMg3a5WDAVUW1I4A4n6VdStslrwNpjxSWCf7wHBGc8pCPvWNfwSRNB7ZZM3WIAq5RiP696HMrrMqVVlvCKfwdKCWgoMWA7Or616ir+NiRL6F2BKRX2eYPc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=m+pjJ8AYp8UNMrQ2/YzyBJ5hJEx0e6GJLawz++scizw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_063418_766996_3C472888 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Luca,

On 3/9/2026 7:25 PM, Damon Ding wrote:
> Hi Luca,
> 
> On 3/3/2026 5:42 PM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
>>> Apply drm_bridge_connector helper for Analogix DP driver.
>>>
>>> The following changes have been made:
>>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>>    and &drm_connector_helper_funcs.
>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>    &analogix_dp_plat_data.attach.
>>> - Remove &analogix_dp_device.connector.
>>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>>    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>>    &drm_bridge_funcs.edid_read().
>>> - Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
>>>    binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
>>                               ^
>>
>> Do you mean "!DRM_BRIDGE_ATTACH_NO_CONNECTOR" here (i.e. missing '!')?
>>
>> Also, unsuppported -> unsupported (typo)
>>
> 
> Will fix in v10.
> 
>>>    in analogix_dp_bridge_attach().
>>> - Set &drm_bridge.ops according to different cases.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
>>
>> I had a quick look, looks good overall, for the moment I have only a
>> question, see below.
>>
>> I aim at reviewing this patch in depth, but it's not an easy one to
>> digest. Would it be feasible to split it in smaller logical steps? If it
>> is, please do, it would be very helpful for reviewing.
> 
> Yes, this commit will be split into several smaller ones in v10.
> 
>>
>>> @@ -1532,6 +1481,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>>>
>>>   int analogix_dp_bind(struct analogix_dp_device *dp, struct 
>>> drm_device *drm_dev)
>>>   {
>>> +    struct drm_bridge *bridge = &dp->bridge;
>>>       int ret;
>>>
>>>       dp->drm_dev = drm_dev;
>>> @@ -1545,7 +1495,18 @@ int analogix_dp_bind(struct analogix_dp_device 
>>> *dp, struct drm_device *drm_dev)
>>>           return ret;
>>>       }
>>>
>>> -    ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>>> +    if (dp->plat_data->panel)
>>> +        bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
>>> +    else
>>> +        bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>> +
>>> +    bridge->of_node = dp->dev->of_node;
>>> +    bridge->type = DRM_MODE_CONNECTOR_eDP;
>>> +    ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>
>> Can devm_drm_bridge_add() be added to analogix_dp_probe() instead?
> 
> Will do in v10.

My apologies for my somewhat irresponsible reply earlier!

When I was splitting this commit, I realized that moving 
devm_drm_bridge_add() to analogix_dp_probe() is actually not feasible – 
the type of the downstream bridge of the Analogix bridge can only be 
determined after the entire probe process is fully completed.

rockchip_dp_probe()/exynos_dp_probe() ->
   analogix_dp_finish_probe() ->
     analogix_dp_aux_done_probing() ->
       drm_of_find_panel_or_bridge() ->
         rockchip_dp_bind()/exynos_dp_bind() ->
           analogix_dp_bind()->
             devm_drm_bridge_add()

To avoid confusion, I’ve added some comments for this easily 
misunderstood logic to the commit message of v10, so the reasoning is 
clear for everyone.

> 
>>
>>> +    if (ret)
>>> +        goto err_unregister_aux;
>>> +
>>> +    ret = drm_bridge_attach(dp->encoder, bridge, NULL, 
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>       if (ret) {
>>>           DRM_ERROR("failed to create bridge (%d)\n", ret);
>>>           goto err_unregister_aux;
> 

Best regards,
Damon


