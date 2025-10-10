Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D14CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 04:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjdmS7xtW1HFPjDkBq2hnFUV3l8gzHZMY6mZgqnMerE=; b=DJGCWl+VVS9oDhF4mizYt38sMH
	fTyqZ85w1vafAYdyrpepIfQggh3cJjv6pCnQImv0zPbR0g2mrhnM+joBLG8MZoPXs9IMwpg9qm2js
	3jqfbnZXDI8XbPKita7zSZFX5XdCOELynPbBl/liVH8RP3jwmg8UJhO1eEN6IYEUo+aVKHymm764q
	cOfjQrsJRXccNceEuNMhicNvqXx7wDJnmKN04Zkj5z4FTvv7f37p2JK7cr+kVb2a990MyR7n96zXT
	B0fIMhA7K8wmZnKVEiMRnUJ1DiMB/eHE4kMc5WdA3EECI/E8mCefaacMuhHqSJXCIi8O5kO6kRFs5
	3Whan0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74LJ-00000007dA4-2Ouq;
	Fri, 10 Oct 2025 04:02:57 +0000
Received: from mail-m49216.qiye.163.com ([45.254.49.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74LF-00000007d99-2QJh;
	Fri, 10 Oct 2025 04:02:55 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 256613dc5;
	Fri, 10 Oct 2025 12:02:44 +0800 (GMT+08:00)
Message-ID: <b47c5579-511e-4831-b86e-48ad4cefaa6c@rock-chips.com>
Date: Fri, 10 Oct 2025 12:02:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251009193028.4952-1-heiko@sntech.de>
 <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
 <3572997.QJadu78ljV@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3572997.QJadu78ljV@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99cc49106703a3kunm83717e1fa8459
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklOSlZPGUgZTkNMGh1DHU1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VCOjjjWIpm8zpF9NqD0SP/ze5+hbIMIcSXoNvqOQfkmwmjkR5AcJwvXZDcLpheH0NZr8ZoT5Dlq8tfuxsW5qN4Y9ZRDF7m5Z1/TSpFCfjLJeqrJjzs7+YC0W2vMw+JhU2Ij7RyJydf4czuEd03Tx/NsyfP+Kir+EymCgdAoNXqk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GjdmS7xtW1HFPjDkBq2hnFUV3l8gzHZMY6mZgqnMerE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_210254_135517_34F9F685 
X-CRM114-Status: GOOD (  31.34  )
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

Hi,

On 10/10/2025 7:42 AM, Heiko Stübner wrote:
> Hi Dmitry,
> 
> Am Freitag, 10. Oktober 2025, 00:30:11 Mitteleuropäische Sommerzeit schrieb Dmitry Baryshkov:
>> On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
>>> Right now if there is a next bridge attached to the analogix-dp controller
>>> the driver always assumes this bridge is connected to something, but this
>>> is of course not always true, as that bridge could also be a hotpluggable
>>> dp port for example.
>>>
>>> On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
>>> connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
>>> for DisplayPort targets is more complicated than just reading the HPD pin
>>> level" and we should be "letting the actual DP driver perform detection."
>>>
>>> So use drm_bridge_detect() to detect the next bridge's state but ignore
>>> that bridge if the analogix-dp is handling the hpd-gpio.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>> As this patch stands, it would go on top of v6 of Damon's bridge-connector
>>> work, but could very well be also integrated into one of the changes there.
>>>
>>> I don't know yet if my ordering and/or reasoning is the correct one or if
>>> a better handling could be done, but with that change I do get a nice
>>> hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
>>> Analogix-DP ends in a full size DP port.
>>>
>>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index c04b5829712b..cdc56e83b576 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
>>>   	struct analogix_dp_device *dp = to_dp(bridge);
>>>   	enum drm_connector_status status = connector_status_disconnected;
>>>   
>>> -	if (dp->plat_data->next_bridge)
>>> -		return connector_status_connected;
>>> +	/*
>>> +	 * An optional next bridge should be in charge of detection the
>>> +	 * connection status, except if we manage a actual hpd gpio.
>>> +	 */
>>> +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
>>> +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);

I have tried to use the drm_bridge_detect() API to do this as 
simple-bridge driver, but it does not work well for bridges that do not 
declare OP_DETECT.

Take nxp-ptn3460 as an example, the connected status will be treated as 
connector_status_unknown via the following call stack:

drm_helper_probe_single_connector_modes()
   -> drm_helper_probe_detect()
      -> drm_bridge_connector_detect()
         -> analogix_dp_bridge_detect()
            -> drm_bridge_detect()
               -> return connector_status_unknown due to !OP_DETECT

However, the connected status will be connector_status_connected as 
expected if Analogix DP does not declare OP_DETECT[0]:

drm_helper_probe_single_connector_modes()
   -> drm_helper_probe_detect()
      -> drm_bridge_connector_detect()
         -> return connector_status_connected due to CONNECTOR_LVDS

Base on Andy's commit 5d156a9c3d5e ("drm/bridge: Pass down connector to 
drm bridge detect hook"), the drm_connector becomes available in 
drm_bridge_detect().

It may be better to unify the logic of drm_bridge_detect() and 
drm_bridge_connector_detect(), which sets the connected status according 
to the connector_type. Then the codes will be more reasonable and become 
similar to the simple-bridge demo via 
'drm_bridge_detect(dp->plat_data->next_bridge, connector)'.

But we still need a specific check for DP-connector to resolve this 
issue. The '!dp->hpd_gpiod' may not be well-considered. Perhaps we could 
introduce a new API, similar to drm_bridge_is_panel(), called 
drm_bridge_is_display_connector()?

>>
>> And it's also not correct because the next bridge might be a retimer
>> with the bridge next to it being a one with the actual detection
>> capabilities. drm_bridge_connector solves that in a much better way. See
>> the series at [1]
>>
>> [1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/
> 
> Hence my comment above about that possibly not being the right variant.
> Sort of asking for direction :-) .
> 
> I am working on top of Damon's drm-bridge-connector series as noted above,
> but it looks like the detect function still is called at does then stuff.
> 
> My board is the rk3588-tiger-displayport-carrier [0], with a dp-connector
> which is the next bridge, so _without_ any changes, the analogix-dp
> always assumes "something" is connected and I end up with
> 
> [    9.869198] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> [    9.980422] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> [   10.091522] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> [   10.202419] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> [   10.313651] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> 
> when no display is connected.
> 
> With this change I do get the expected hotplug behaviour, so something is
> missing still even with the bridge-connector series.
> 
> 
> Heiko
> 
> 
> [0] v3: https://lore.kernel.org/r/20250812083217.1064185-3-heiko@sntech.de
>      v4: https://lore.kernel.org/r/20251009225050.88192-3-heiko@sntech.de
>      (moved hpd-gpios from dp-connector back to analogix-dp per dp-connector
>      being not able to detect dp-monitors)
>>
>>>   
>>>   	if (!analogix_dp_detect_hpd(dp))
>>>   		status = connector_status_connected;
>>
>>
> 
> 

I see... There is also a way to leave the connected status check in 
Analogix DP bridge:

1.If the later bridge does not support HPD function, the 'force-hpd' 
property must be set under the DP DT node. The DT modifications may be
large by this way.
2.If the later bridge do support HPD function like the DP-connector, the
connected status detection method is GPIO HPD or functional pin HPD.

With the DT modifications for above 1, the analogix_dp_bridge_detect() 
can be simplified to:

static enum drm_connector_status
analogix_dp_bridge_detect(struct drm_bridge *bridge, struct 
drm_connector *connector)
{
	struct analogix_dp_device *dp = to_dp(bridge);
	enum drm_connector_status status = connector_status_disconnected;

	if (!analogix_dp_detect_hpd(dp))
		status = connector_status_connected;

	return status;
}

Best regards,
Damon

[0]https://lore.kernel.org/all/22a5119c-01da-4a7a-bafb-f657b1552a56@rock-chips.com/


