Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19742C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 03:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5r6vIiUBjy393iKicv1XJak3ZesD6UsJejej8ywJBA=; b=K5PAvdqM5pYAyp5ip7WI+aiE9g
	jDLCOWMkSBlpquHN4D9kamsLJNsqrUMssj919K6Dd0+CHhl3OKgaqS40gZlkV8+i5a0w9egNJTrXu
	I0uH0iycWEL5GKtJ3j74ao7KvevaUI/fSbD1X9ISpGzo6O/AsTNpRPFkW+2IIRq1TP4Iu1jbaLuuW
	aMS84AV0cR/Zy6c9jlD+ora96FzDDE7nhwP0dKKpryP9KWN83Qg69/gY2/4qZtOzve5OdhzOH1mrO
	ns5kKtRAitLgppnEgKrTDKb34NIig6pwp/P458UxFxQDnulgbgOUAxBLU9R8WeqIVnCIqRZlquZZp
	6E4OJM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCED-00000001t9U-0DZ9;
	Mon, 27 Jul 2026 03:42:09 +0000
Received: from mail-m82149.xmail.ntesmail.com ([156.224.82.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCE7-00000001t7q-3rv6;
	Mon, 27 Jul 2026 03:42:06 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47a6aee59;
	Mon, 27 Jul 2026 11:41:48 +0800 (GMT+08:00)
Message-ID: <34aa3fb0-41fa-44ee-adac-3ca0862a20c0@rock-chips.com>
Date: Mon, 27 Jul 2026 11:41:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Vinod Koul <vkoul@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20260717072323.96-1-kernel@airkyi.com>
 <20260717072323.96-2-kernel@airkyi.com> <alpeAqKo72pwOEnX@venus>
 <al5fYojQ0kJw2okg@venus>
 <f567a9fb-925e-4d61-ba57-1bf8c72668c8@rock-chips.com>
Content-Language: en-US
In-Reply-To: <f567a9fb-925e-4d61-ba57-1bf8c72668c8@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9fa1aa1d8b03a7kunm65b8ca1c2178a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH05MVh0eSEpOTEhJGkpNSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Asf8ieTyOvqkn48/m2em7rvnbBsLZJtUp/d8a2iY0aTGfYUh/8qy3J6AFWCAsIVytg92y0bCGqz2NlwIDatQhSnQyGnuq7k3zyYsvhOY8KG6e6rKhTvfzUYN4zRdu9YwRvnioW2VJ4MZcGoHaoWo1vnUTMti5VPXMiQM1kDiaZs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=a5r6vIiUBjy393iKicv1XJak3ZesD6UsJejej8ywJBA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_204204_572731_47E4EAFF 
X-CRM114-Status: GOOD (  23.56  )
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

Hi Sebastian, 

On 7/21/2026 10:22 AM, Chaoyi Chen wrote:
> Hi Sebastian,
> 
> On 7/21/2026 1:59 AM, Sebastian Reichel wrote:
>> Hi,
>>
>> On Fri, Jul 17, 2026 at 07:19:29PM +0200, Sebastian Reichel wrote:
>>> On Fri, Jul 17, 2026 at 03:23:19PM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> The HPD function of Type-C DP is implemented through
>>>> drm_connector_oob_hotplug_event(). For embedded DP, it is required
>>>> that the DRM connector fwnode corresponds to the Type-C port fwnode.
>>>>
>>>> To describe the relationship between the DP controller and the Type-C
>>>> port device, we usually using drm_bridge to build a bridge chain.
>>>>
>>>> Now several USB-C controller drivers have already implemented the DP
>>>> HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
>>>> HPD bridge on USB-C connector port device.
>>>>
>>>> But this requires the USB-C controller driver to manually register the
>>>> HPD bridge. If the driver does not implement this feature, the bridge
>>>> will not be create.
>>>>
>>>> So this patch implements a generic DP HPD bridge based on
>>>> aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
>>>> Type-C port device containing the DP svid is registered, it will
>>>> create an HPD bridge for it without the need for the USB-C controller
>>>> driver to implement it.
>>>>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>>> ---
>>>
>>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com> # ArmSom Sige5
>>>
>>> I gave this a test together with the RK3588/RK3576 USB-C DP AltMode
>>> patches I'm working on. As the fusb302 does a manual registration
>>> for the DRM bridge in its probe function, the bridge is registered
>>> twice:
>>>
>>> root@sige5 # cat /sys/kernel/debug/dri/bridges
>>> ...
>>> bridge[1]: drm_aux_hpd_bridge_funcs
>>> 	refcount: 4
>>> 	type: [10] DP
>>> 	OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
>>> 	ops: [0x4] hpd
>>> bridge[2]: drm_aux_hpd_bridge_funcs
>>> 	refcount: 2
>>> 	type: [10] DP
>>> 	OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
>>> 	ops: [0x4] hpd
>>> ...
>>>
>>> Apparently the USB-C DP AltMode keeps working, so this just wastes
>>> a few CPU cycles and some memory. So this can land and then we can
>>> remove the manual code from the driver as a follow-up step. I also
>>> gave that a try and things keep working. I won't send the fusb302
>>> patch for now to ensure its not applied before this patch lands.

My initial idea was to implement this in the Type-C Alt Mode driver,
so that we wouldn't need to implement HPD registration for every
individual USB connector driver.

And yes, once this patch is merged, we can remove the relevant code
from fusb302.

>>
>> The above test was done with a kernel having all config options
>> built-in (i.e. no modules). Using arm64 defconfig one ends up with
>>
>> CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE=m
>>
>> But the resulting 'aux-hpd-typec-dp-bridge' module is not loaded
>> automatically resulting in missing bridge registration. Running
>> 'modprobe aux-hpd-typec-dp-bridge' manually in the booted system
>> does not work either as the TypeC controller has already been
>> registered and no new BUS_NOTIFY_ADD_DEVICE is generated.
>>
> 
> Oh, we indeed didn't consider that such a probe ordering issue exists.
> 
> The approach I came up with is to iterate through the &typec_bus after
> registering the notifier, to ensure we don't miss any events that 
> occurred prior:
> 
>  static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
>  {
>         bus_register_notifier(&typec_bus, &drm_typec_event_nb);
> -
> +       bus_for_each_dev(&typec_bus, NULL, NULL,
> +                        check_altmode_dev_and_register_hpd_bridge);
>         return 0;
>  }
> 
> 
> But I'm not sure if there are potential race conditions involved.
> Perhaps @Heikki and others have better ideas? Thanks.
> 

I tried analyzing the code, and this order ensures that it gets
registered.

I'll fix this in v4, thanks!

-- 
Best, 
Chaoyi

