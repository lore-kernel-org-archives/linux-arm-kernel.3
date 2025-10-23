Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6DACCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV5L2/dVmRU/5ecTVqOwB2QqRRY2n4dnoFpehPZT1k0=; b=G0cWs/DMS6+fLuzrJDt3OAPDh3
	XGSf2mHWqLBs5m2YcxG6uY2IEzcArcCW33OUSoDUV7ThJ630Gx98PKDmjBSJ1nNxTsnfqsjXestTJ
	nQ3W8x7B3pDJSBorMwsl0CvMRigHEwjXL/LmLKNwRbYdwiMjrqCnZSKfiABf82mO7oPgUNNV2Or8Q
	1H7HJvbGTbWse+fLORC9H6ssbM61JyrkY94s+EIbtiYrkZo9OAyPryeY7RB/I3Kk7YK0JsF/XFXp3
	aMG1znEh9KirA7vNOsKjgjX4hYGzWzXp3ZSLI5mTFkCRFHG3zJiLo8AdQvQOfMskkL6+0W09Z0q5T
	zorvvt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtVz-000000065F7-0AIe;
	Thu, 23 Oct 2025 11:29:55 +0000
Received: from mail-m49228.qiye.163.com ([45.254.49.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtVv-000000065D7-1yHG;
	Thu, 23 Oct 2025 11:29:53 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26f1ef09a;
	Thu, 23 Oct 2025 19:29:45 +0800 (GMT+08:00)
Message-ID: <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
Date: Thu, 23 Oct 2025 19:29:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com> <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a10d4feb703abkunm0a84e08b197844
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlLGlYYH0tDGUweS0xOGRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Xn4egCLAu3OJU+toy3rICbQxQ7WpaviHfsRYKx2TYkWkGCOojJo3gWHnrtg3mYuaIWc++VhgE8ebvOe0CSUPcma62p2KNUiAi/LQ7C9eEfeRI3mnlAJdNEH/ey9A4NwJ3xVIRHGLZKH8ToMeIXkEdVQZGEx8EV2KgTrvu1XBgEs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PV5L2/dVmRU/5ecTVqOwB2QqRRY2n4dnoFpehPZT1k0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_042951_697273_075C33C2 
X-CRM114-Status: GOOD (  20.79  )
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

Hi Heikki,

On 10/23/2025 4:45 PM, Heikki Krogerus wrote:
> On Thu, Oct 23, 2025 at 11:30:02AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Several USB-C controller drivers have already implemented the DP HPD
>> bridge function provided by aux-hpd-bridge.c, but there are still
>> some USB-C controller driver that have not yet implemented it.
>>
>> This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
>> so that other USB-C controller drivers don't need to implement it again.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/Kconfig                | 11 ++++
>>   drivers/gpu/drm/bridge/Makefile               |  1 +
>>   .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
>>   3 files changed, 63 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index b9e0ca85226a..9f31540d3ad8 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -33,6 +33,17 @@ config DRM_AUX_HPD_BRIDGE
>>   menu "Display Interface Bridges"
>>   	depends on DRM && DRM_BRIDGE
>>   
>> +config DRM_AUX_TYPEC_DP_HPD_BRIDGE
>> +	tristate "TypeC DP HPD bridge"
>> +	depends on DRM_BRIDGE && OF && TYPEC
>> +	select DRM_AUX_HPD_BRIDGE
>> +	help
>> +	  Simple USB Type-C DP bridge that terminates the bridge chain and
>> +	  provides HPD support.
>> +
>> +	  If the USB-C controller driver has not implemented this and you need
>> +	  the DP HPD support, say "Y" or "m" here.
> You don't need to depend on DRM_BRIDGE separately, but do you really
> need a separate module for this in the first place?
>
>>   config DRM_CHIPONE_ICN6211
>>   	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>>   	depends on OF
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>> index 245e8a27e3fc..e91736829167 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>>   obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
>> +obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o
> Instead, why not just make that a part of aux-hpd-bridge
> conditionally:
>
> ifneq ($(CONFIG_TYPEC),)
>          aux-hpd-bridge-y        += aux-hpd-typec-dp-bridge.o
> endif

Oh, I did consider that! But I noticed that aux-hpd-bridge.c contains the following statement module_auxiliary_driver(drm_aux_hpd_bridge_drv), which already includes a module_init. In the newly added file, in order to call the register function, another module_init was also added. If the two files are each made into a module separately, would there be a problem?


>
>
> thanks,
>
-- 
Best,
Chaoyi


