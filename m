Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE37CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 01:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIQSa2jEFJAsHLJt6tSAavwwKal+P7ObcOZRQSB3xAQ=; b=s5BDxl+VTGlUg/idGJ8xHGZWg8
	3V/hZU01LCpixj2eZdpu5Z83JUAkjsjKyAvg/yusi6IUrVOsLdlF5qgdZ7BQmNEhpl8kCQNF214HA
	oI352BqHuh4sNz/qHDl4P1boKTY/wnb0mZvZlEaoTKtaueTKuayWSktPSU0aXsudg/y2b2KnxFDcc
	KaEdTzBRhGbPz8lt6PwrpjCOYZVw+H+2Whp5J95QFnSARagFNcSVPrFLt1PAjcOK3sqX41mU24+o3
	8/eTXfgQAyksJPnNQREd3LGh0QLK2n/A+VSlUKxEJjLsb5+pVuJic/w+XblIim+4NN9D1Y5kzDaiy
	3FUZQsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5hC-0000000Asvx-1lXS;
	Tue, 04 Nov 2025 01:18:50 +0000
Received: from mail-m49244.qiye.163.com ([45.254.49.244])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5h8-0000000AsvL-2Qsz;
	Tue, 04 Nov 2025 01:18:48 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2840cd1f4;
	Tue, 4 Nov 2025 09:18:35 +0800 (GMT+08:00)
Message-ID: <7fb7e578-b97d-4ea5-a8af-33199563d834@rock-chips.com>
Date: Tue, 4 Nov 2025 09:18:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-4-kernel@airkyi.com>
 <rzozpbqmymdczerh3iijxxtz3xnsznoku7w2mquikwv6u5osvo@7h43hwc2fpzm>
 <eca9d5bd-23bd-4c1d-b2f2-c0c32f14177f@rock-chips.com>
 <aQiymTFVU7UpcJ1p@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aQiymTFVU7UpcJ1p@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a4c71c26b03abkunm130d5e00ad8ac3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxJHlZCQk5KS09MHxpMSklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AuKMie6XasD4Ngz32l1vJN8MYJB3Q/ibq1sswvGRbMIkyPTR7zzbtimzXPHmxbP/bkGpQZbAOxK+Ojkz38e9UGsxnPhHyh8hEMd1ysID0NaZV31oqLPgpYK9A8fiLwUsQ9bSXv2Psd5G5LAHaF052M4swaypeBxEzuuYoRhmnOw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wIQSa2jEFJAsHLJt6tSAavwwKal+P7ObcOZRQSB3xAQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_171847_172357_E16BE6F4 
X-CRM114-Status: GOOD (  25.72  )
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

On 11/3/2025 9:48 PM, Heikki Krogerus wrote:

>>>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>>>> index a250afd8d662..17257b223a28 100644
>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>> @@ -23,13 +23,16 @@ config DRM_AUX_BRIDGE
>>>>    	  build bridges chain.
>>>>    config DRM_AUX_HPD_BRIDGE
>>>> -	tristate
>>>> +	tristate "AUX HPD bridge support"
>>> Why? No, this is supposed to be selected by other drivers. Users don't
>>> know an wouldn't know what is this.
>> In v7, I implemented an additional module for selecting this option. But
>> Heikki believes that it would be better to merge the two modules into one.
> Like I said before, I was merely curious why not just squash the
> support into that AUX_PD_HPD_BRIDGE. If that does not make sense, then
> so be it - make it a "Display Interface Bridge" driver like you
> originally proposed.

Yes, it is.


>>>>    	depends on DRM_BRIDGE && OF
>>>>    	select AUXILIARY_BUS
>>>>    	help
>>>>    	  Simple bridge that terminates the bridge chain and provides HPD
>>>>    	  support.
>>>> +	  Specifically, if you want a default Type-C DisplayPort HPD bridge for
>>>> +	  each port of the Type-C controller, say Y here.
>>>> +
>>>>    menu "Display Interface Bridges"
>>>>    	depends on DRM && DRM_BRIDGE
>>>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>>>> index c7dc03182e59..2998937444bc 100644
>>>> --- a/drivers/gpu/drm/bridge/Makefile
>>>> +++ b/drivers/gpu/drm/bridge/Makefile
>>>> @@ -1,6 +1,12 @@
>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>    obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>>>> -obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
>>>> +
>>>> +hpd-bridge-y := aux-hpd-bridge.o
>>>> +ifneq ($(CONFIG_TYPEC),)
>>>> +hpd-bridge-y += aux-hpd-typec-dp-bridge.o
>>>> +endif
>>>> +obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += hpd-bridge.o
>>>> +
>>>>    obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>>>>    obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>>>>    obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
>>>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
>>>> index 2e9c702c7087..11ad6dc776c7 100644
>>>> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
>>>> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
>>>> @@ -12,6 +12,8 @@
>>>>    #include <drm/drm_bridge.h>
>>>>    #include <drm/bridge/aux-bridge.h>
>>>> +#include "aux-hpd-bridge.h"
>>>> +
>>>>    static DEFINE_IDA(drm_aux_hpd_bridge_ida);
>>>>    struct drm_aux_hpd_bridge_data {
>>>> @@ -204,7 +206,26 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
>>>>    	.id_table = drm_aux_hpd_bridge_table,
>>>>    	.probe = drm_aux_hpd_bridge_probe,
>>>>    };
>>>> -module_auxiliary_driver(drm_aux_hpd_bridge_drv);
>>>> +
>>>> +static int drm_aux_hpd_bridge_mod_init(void)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = auxiliary_driver_register(&drm_aux_hpd_bridge_drv);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return drm_aux_hpd_typec_dp_bridge_init();
>>>> +}
>>>> +
>>>> +static void drm_aux_hpd_bridge_mod_exit(void)
>>>> +{
>>>> +	drm_aux_hpd_typec_dp_bridge_exit();
>>>> +	auxiliary_driver_unregister(&drm_aux_hpd_bridge_drv);
>>>> +}
>>>> +
>>>> +module_init(drm_aux_hpd_bridge_mod_init);
>>>> +module_exit(drm_aux_hpd_bridge_mod_exit);
>>>>    MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
>>>>    MODULE_DESCRIPTION("DRM HPD bridge");
>>>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.h b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
>>>> new file mode 100644
>>>> index 000000000000..69364731c2f1
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
>>>> @@ -0,0 +1,13 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#ifndef AUX_HPD_BRIDGE_H
>>>> +#define AUX_HPD_BRIDGE_H
>>>> +
>>>> +#if IS_REACHABLE(CONFIG_TYPEC)
>>>> +int drm_aux_hpd_typec_dp_bridge_init(void);
>>>> +void drm_aux_hpd_typec_dp_bridge_exit(void);
>>>> +#else
>>>> +static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
>>>> +static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
>>>> +#endif /* IS_REACHABLE(CONFIG_TYPEC) */
>>>> +
>>>> +#endif /* AUX_HPD_BRIDGE_H */
>>>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>>>> new file mode 100644
>>>> index 000000000000..6f2a1fca0fc5
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>>>> @@ -0,0 +1,47 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +#include <linux/of.h>
>>>> +#include <linux/usb/typec_altmode.h>
>>>> +#include <linux/usb/typec_dp.h>
>>>> +#include <linux/usb/typec_notify.h>
>>>> +
>>>> +#include <drm/bridge/aux-bridge.h>
>>>> +
>>>> +#include "aux-hpd-bridge.h"
>>>> +
>>>> +#if IS_REACHABLE(CONFIG_TYPEC)
>>>> +static int drm_typec_bus_event(struct notifier_block *nb,
>>>> +			       unsigned long action, void *data)
>>>> +{
>>> This feels like this should be a part of the Type-C subsystem rather
>>> than DRM.
>> In v7, this used to be a part of the Type-C subsystem. I'm not sure what
>> Heikki thinks about this.
> Your original proposal of making the entire TYPEC subsystem depend on
> DRM is _not_ going to happen. In general, if I've now understood this
> correctly, this thing probable should be a "display interface bridge
> driver", similar to what you proposed in the previous version.
>
> Note also that you could make it selected automatically, so there is
> no need for user selectable option if that's the preference. Kconfig
> and Makefile gives you options on how to do that. For example, maybe
> this Kconfig works (or does not, but something like it will):
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index a250afd8d662..7487024ba2ce 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -30,6 +30,15 @@ config DRM_AUX_HPD_BRIDGE
>            Simple bridge that terminates the bridge chain and provides HPD
>            support.
>   
> +if DRM_AUX_HPD_BRIDGE
> +
> +config DRM_AUX_HPD_TYPEC_BRIDGE
> +       tristate
> +       depends on TYPEC || !TYPEC
> +       default TYPEC
> +
> +endif /* DRM_AUX_HPD_BRIDGE */
> +
>   menu "Display Interface Bridges"
>          depends on DRM && DRM_BRIDGE

Thank you for your code. I think both of your points make sense. So choosing the approach you mentioned now (similar to v7) might be a reasonable compromise.



>   
>
>
> thanks,
>
-- 
Best,
Chaoyi


