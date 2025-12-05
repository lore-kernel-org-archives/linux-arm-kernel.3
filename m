Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C411BD2CE0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtwmAIo0SaGp/QXNcsjM3U1Vr4tjF0Aq/LuKxWtI5aQ=; b=JWseXvNOyp5bp4YN6bxQmfc3BF
	iDpsxT+zYGoRWiXJCPfP4vWLH7kZw7fQilrwIYYcIp/w8YXNtJUy+9lz3Cav8MRV5Q3Y9a0Cx3HR3
	II06aqUThWA3sX1ul/K/LRo3bmQdwv7m1uRH6CVbDNksxNSvw0KnCCNFBUfQ80gWitW7mrheF7Hqa
	s4LZv2AaoTk78b2jV3frdY8AI96fjXzdaXuPRtDSp2G98PGODpLAOMPdAlMtQZQATXAZJVWkxeMXy
	SIaQ4Ayd9J5bxIZJix2A48bvlPRJCP9q8a8WbcukLVztIMCt8IPcsTWm7WLts2fdmGRFV6DyK9UEh
	DA8GsUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRLWr-00000008ujL-3xgS;
	Fri, 05 Dec 2025 02:26:41 +0000
Received: from mail-m19731112.qiye.163.com ([220.197.31.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRLWl-00000008uiT-24UW;
	Fri, 05 Dec 2025 02:26:37 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c1095715;
	Fri, 5 Dec 2025 10:26:26 +0800 (GMT+08:00)
Message-ID: <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
Date: Fri, 5 Dec 2025 10:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB Type-C
 DP HPD bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-4-kernel@airkyi.com> <aTGPaJmwd7uHfrnV@kuha>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aTGPaJmwd7uHfrnV@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9aec5504a403abkunm9ee3fce2af812e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1NH1ZPHkhJTkMfTR5JSx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=dsPsGNd5e897H3fkHx9JCGvZRm2YiJCFhvaP+jw00pxK222QJL0XiP31/eVLZJlPrKbaJjN00u9w23Xj3Uw4IfNFQ/6SaZ4EwtVpGeZp74TgSbKhAJMmi/wQoPo9/wpRg3t9Rqmf/pKCfLKP+Rx212Jo9299la1sGPByNezAavk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=VtwmAIo0SaGp/QXNcsjM3U1Vr4tjF0Aq/LuKxWtI5aQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_182636_021775_729CF995 
X-CRM114-Status: GOOD (  15.38  )
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

On 12/4/2025 9:40 PM, Heikki Krogerus wrote:
> Hi,
> 
> I don't know what's going on here - this series is the 12th?
> In any case, you need to fix this..
> 

It is 11th. Patch 1 was missing the Signed-off-by line, so I've resent
it. Sorry for the confusion.

>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>> new file mode 100644
>> index 000000000000..94be3d5f69e9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>> @@ -0,0 +1,51 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +#include <linux/of.h>
>> +#include <linux/usb/typec_altmode.h>
>> +#include <linux/usb/typec_dp.h>
>> +
>> +#include <drm/bridge/aux-bridge.h>
>> +
>> +static int drm_typec_bus_event(struct notifier_block *nb,
>> +			       unsigned long action, void *data)
>> +{
>> +	struct device *dev = (struct device *)data;
>> +	struct typec_altmode *alt = to_typec_altmode(dev);
>> +
>> +	if (action != BUS_NOTIFY_ADD_DEVICE)
>> +		goto done;
>> +
>> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
>> +		goto done;
> 
> That's still not enough because of the plug altmodes. You need to
> check that it's a port altmode:
> 
>         if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
>         	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>         				   to_of_node(alt->dev.parent->fwnode));
>

Oh, it is. Will fix in v12. Thank you.

>> +	/*
>> +	 * alt->dev.parent->parent : USB-C controller device
>> +	 * alt->dev.parent         : USB-C connector device
>> +	 */
>> +	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>> +				   to_of_node(alt->dev.parent->fwnode));
>> +
>> +done:
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block drm_typec_event_nb = {
>> +	.notifier_call = drm_typec_bus_event,
>> +};
>> +
>> +static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
>> +{
>> +	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
>> +}
>> +
>> +static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
>> +{
>> +	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
>> +
>> +	return 0;
>> +}
>> +
>> +module_init(drm_aux_hpd_typec_dp_bridge_module_init);
>> +module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
>> +
>> +MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
>> +MODULE_LICENSE("GPL");
> 
> thanks,
> 

-- 
Best, 
Chaoyi

