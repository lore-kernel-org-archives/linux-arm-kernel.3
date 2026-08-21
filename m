Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7018C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKHl0TpfBtrjUDpLLcVLEklz3HswqlwtK2BO20EwKcs=; b=uqTWD1PbsRXd8bVB0SgNaqD2BK
	CnI9SY5PBt+/fcoXcslwbtvDxFJxIScjZUi5x92YGyPL1Gbhm0sY26f0LeBajTtw/2dwt097UwUSh
	y2OYR/6ui7F/uv3n7XUU7QP2vQSNa/Xujn0j4ZTRTFdaiZ6EjjVdKkD4lGr4e2DGAyDGCQU6pjHON
	UkVh5JrWKIm3qNmPGuMGMGuK2LuZz+mZmYhzATQ9bjqKpkSBZStOlWizbo19XsPkzZgfvPODRvKwZ
	Tle8duHaz6COkN54pXi9o49s+E7x8Wj6VcUACsadMdcl4aJbWLMb+BpXC9xur/cW9NCOuFkkhv21U
	Ktl2Us/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKJy-0000000Cm5s-2A2Z;
	Fri, 21 Aug 2026 08:09:50 +0000
Received: from mail-m103131191112.xmail.ntesmail.com ([103.131.191.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKJu-0000000Cm41-0uFO;
	Fri, 21 Aug 2026 08:09:48 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ad475c48;
	Fri, 21 Aug 2026 16:09:40 +0800 (GMT+08:00)
Message-ID: <c5fba12d-487c-46ee-8ea3-3a844f383555@rock-chips.com>
Date: Fri, 21 Aug 2026 16:09:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for optional
 data-lanes mapping
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-6-damon.ding@rock-chips.com>
 <178714408666.358642.10737743872246645132.b4-review@b4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <178714408666.358642.10737743872246645132.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0235e56ad03a8kunme42a00e845a4aa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGExNVkxPTExNThlKGR4dTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=c+3teKrSTTlXpJm1/i6LeNry75eFu/LVtK9z45N0HBhWA4yMUOIhkHCeXd+57htAifrv1J37fPpyJ0aEcZKghhEOywnc52hTnD8htVJWy/7LtEe6j3DFnT5GQivXfsJFbEJvm2fX4k2k8i6XbQ5Gl2SbDLTp6S6sR1xc5XEzqCQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wKHl0TpfBtrjUDpLLcVLEklz3HswqlwtK2BO20EwKcs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_010946_916875_64E231E9 
X-CRM114-Status: GOOD (  25.39  )
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

On 8/19/2026 8:54 PM, Luca Ceresoli wrote:
> Hello,
> 
>> Parse the optional 'data-lanes' device tree property to support
>> custom physical lane mapping configuration.
>>
>> If no valid configuration is found, fall back to the default
>> lane map (0, 1, 2, 3) automatically and keep the driver running.
>>
>> Lane mapping is mainly used for below scenarios:
>> 1. Correct PCB lane swap and differential line routing crossover
>>     without hardware changes;
>> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
>> 3. Support multiple panel hardware variants on the same board
>>     by configuring data-lanes in device tree only.
>>
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 117448b854db..4aa444858bb6 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1240,6 +1240,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>>   	.detect = analogix_dp_bridge_detect,
>>   };
>>
>> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
>> +{
>> +	struct video_info *video_info = &dp->video_info;
>> +	struct device_node *endpoint;
>> +	u32 tmp[LANE_COUNT4];
> 
> The 'tmp' name is not very useful to understand what it's for. Based on the
> code I'd say it stores a lane index, so what about 'lane_idx', unless you
> can propose a better name.

Good idea, will fix in v8.

> 
>> +	u32 map[LANE_COUNT4] = {0, 1, 2, 3};
>> +	bool used[LANE_COUNT4] = {false};
>> +	int num_lanes;
>> +	int ret, i;
>> +
>> +	memcpy(video_info->lane_map, map, sizeof(map));
>> +
>> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
>> +						   video_info->max_lane_count);
>> +	if (num_lanes < 0)
>> +		return -EINVAL;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);
> 
> 
>> +	if (!endpoint)
>> +		return -EINVAL;
>> +
>> +	ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lanes);
>> +	of_node_put(endpoint);
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < num_lanes; i++) {
>> +		if (tmp[i] >= LANE_COUNT4) {
>> +			dev_dbg(dp->dev, "data-lanes[%d] = %u is out of range\n", i, tmp[i]);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (used[tmp[i]]) {
>> +			dev_dbg(dp->dev, "data-lanes[%d] = %u is duplicate\n", i, tmp[i]);
>> +			return -EINVAL;
>> +		}
>> +
>> +		used[tmp[i]] = true;
>> +		map[i] = tmp[i];
>> +	}
>> +
>> +	for (i = 0; i < LANE_COUNT4 && num_lanes < LANE_COUNT4; i++) {
>> +		if (!used[i])
>> +			map[num_lanes++] = i;
>> +	}
> 
> This loop is a bit obscure to me. After reading it a few times I _think_ it
> does the following:
> 
>   /*
>    * Fill the unused map[] entries with the unused lane indices <reason?>. E.g.:
>    * used[] values = {0,1,0,1} // Only lanes 1 and 3 are used
>    * map[] before  = {3,1,x,x} // x = unassigned
>    * map[] after   = {3,1,0,2} // filled last 2 entries with the unused lane indices
>    */
> 
> Is my understanding correct? If it is, please fill <reason?> and add the
> above comment (possibly improved) before the loop.
> 
> 

You are right.

The hardware register defaults to 0xE4, which corresponds to map = {0, 
1, 2, 3}. Functionally, writing duplicate mappings for unused lanes 
would not cause issues.

Unused lanes are populated with non‑duplicated physical lane indices to 
support DP HPD scenarios where different devices with varying lane 
counts may be connected, as well as to keep the register content reasonable.

The comment will be added in v8.

Best regards,
Damon


