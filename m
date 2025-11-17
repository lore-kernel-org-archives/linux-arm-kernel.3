Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493BCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 01:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCoPxWh+b3eSvtYMRsNlQyefUpu6kD2yKDCWJQ7xR74=; b=bzC6Bl3riPMBDlKAvFHLbSzviJ
	2nv3lFr9wPtgxDhD/Cy0HruC2IfTdEYUeTi1G/eb2Z9U8Hd7LFdWKdv09FqE/QMYfLD0l+z1Ti4cD
	j/8vXF8DQ/+JlA921CXnUQlHdRtPoHCP9Lcoy7TxjShbbINlQ7rRkONAUquWg6v9eKYTsaECM8TkW
	y45jlQlW5Rjnjo19iu9p3vF5/tQlCCRQ7/CmspC6HIMY9OWeMkQdfZkKWnsiPO4CceDmpt2W6VGY/
	sbsUrCCeSTJCONOppznHeUabs9dsT490+/Y6huk0R4LfTrFbs6ZjT/lPVgRHNAIwenur0Wg2TFiOl
	iWat4j/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKo8F-0000000FGaP-13bO;
	Mon, 17 Nov 2025 01:34:15 +0000
Received: from mail-m3276.qiye.163.com ([220.197.32.76])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKo8B-0000000FGZc-2URM;
	Mon, 17 Nov 2025 01:34:13 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29c3ce0df;
	Mon, 17 Nov 2025 09:33:59 +0800 (GMT+08:00)
Message-ID: <2ebace6f-d3c4-4516-b6cb-4951de06b6c8@rock-chips.com>
Date: Mon, 17 Nov 2025 09:33:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/10] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chaoyi Chen
 <kernel@airkyi.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-9-kernel@airkyi.com>
 <DE5YP3AVGOG3.OHP68Z0F6KBU@bootlin.com>
 <b1a339e7-a011-4b4b-8988-2e3768753c85@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <b1a339e7-a011-4b4b-8988-2e3768753c85@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8f728a9203abkunm7f35530083703a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGktOGlYYQ04fHUlKSkhNGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=M0Whx/IN7vzwWpGNPYw1m+tNCPRjv3SM+gdWc+WtuhKETcY7rThZlrCaxI2fAlhI3391csTS8ehibRh6ex51cQ/r+4YXK3tXX6w3wypz7DSxUZKNiakt6+eBek5O66Hvb28jfRZ1ZP/4biJPialEUbDiHj1QrwZ1mtTGsdG5MX8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OCoPxWh+b3eSvtYMRsNlQyefUpu6kD2yKDCWJQ7xR74=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_173412_182601_E48EE44C 
X-CRM114-Status: GOOD (  34.94  )
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

On 11/12/2025 9:37 AM, Chaoyi Chen wrote:
> Hello Luca,
>
> On 11/11/2025 11:14 PM, Luca Ceresoli wrote:
>> Hello Chaoyi,
>>
>> On Tue Nov 11, 2025 at 11:50 AM CET, Chaoyi Chen wrote:
>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>
>>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>>> the CDN-DP can be switched to output to one of the PHYs. If both ports
>>> are plugged into DP, DP will select the first port for output.
>>>
>>> This patch adds support for multiple bridges, enabling users to flexibly
>>> select the output port. For each PHY port, a separate encoder and bridge
>>> are registered.
>>>
>>> The change is based on the DRM AUX HPD bridge, rather than the
>>> extcon approach. This requires the DT to correctly describe the
>>> connections between the first bridge in bridge chain and DP
>>> controller. For example, the bridge chain may be like this:
>>>
>>> PHY aux birdge -> fsa4480 analog audio switch bridge ->
>>> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>>>
>>> In this case, the connection relationships among the PHY aux bridge
>>> and the DP contorller need to be described in DT.
>>>
>>> In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
>>> determines whether to register one or two bridges.
>>>
>>> Since there is only one DP controller, only one of the PHY ports can
>>> output at a time. The key is how to switch between different PHYs,
>>> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>>>
>>> There are two cases:
>>>
>>> 1. Neither bridge is enabled. In this case, both bridges can
>>> independently read the EDID, and the PHY port may switch before
>>> reading the EDID.
>>>
>>> 2. One bridge is already enabled. In this case, other bridges are not
>>> allowed to read the EDID. So we will try to return the cached EDID.
>>>
>>> Since the scenario of two ports plug in at the same time is rare,
>>> I don't have a board which support two TypeC connector to test this.
>>> Therefore, I tested forced switching on a single PHY port, as well as
>>> output using a fake PHY port alongside a real PHY port.
>>>
>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> [...]
>>
>>> @@ -966,28 +1084,16 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
>>>       return NOTIFY_DONE;
>>>   }
>>>
>>> -static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>> +static int cdn_bridge_add(struct device *dev,
>>> +              struct drm_bridge *bridge,
>>> +              struct drm_bridge *next_bridge,
>>> +              struct drm_encoder *encoder)
>>>   {
>>>       struct cdn_dp_device *dp = dev_get_drvdata(dev);
>>> -    struct drm_encoder *encoder;
>>> +    struct drm_device *drm_dev = dp->drm_dev;
>>> +    struct drm_bridge *last_bridge = NULL;
>>>       struct drm_connector *connector;
>>> -    struct cdn_dp_port *port;
>>> -    struct drm_device *drm_dev = data;
>>> -    int ret, i;
>> [...]
>>
>>> +    if (next_bridge) {
>>> +        ret = drm_bridge_attach(encoder, next_bridge, bridge,
>>> +                    DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        last_bridge = next_bridge;
>>> +        while (drm_bridge_get_next_bridge(last_bridge))
>>> +            last_bridge = drm_bridge_get_next_bridge(last_bridge);
>> DRM bridges are now refcounted, and you are not calling drm_bridge_get()
>> and drm_bridge_put() here. But here you can use
>> drm_bridge_chain_get_last_bridge() which will simplify your job.
>>
>> Don't forget to call drm_bridge_put() on the returned bridge when the
>> bridge is not referenced anymore. This should be as easy as adding a
>> cleanup action on the variable declaration above:
>>
>> -    struct drm_bridge *last_bridge = NULL;
>> +    struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
>
> Ah, I have seen your patch about this. Thank you for the reminder, I will fix this in v10.
>
>>
>>> @@ -1029,8 +1147,102 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>>           return ret;
>>>       }
>>>
>>> +    if (last_bridge)
>>> +        connector->fwnode = fwnode_handle_get(of_fwnode_handle(last_bridge->of_node));
>>> +
>>>       drm_connector_attach_encoder(connector, encoder);
>>>
>>> +    return 0;
>>> +}
>>> +
>>> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
>>> +{
>>> +    struct device_node *np = dp->dev->of_node;
>>> +    struct device_node *port __free(device_node) = of_graph_get_port_by_id(np, 1);
>>> +    struct drm_bridge *bridge;
>>> +    int count = 0;
>>> +    int ret = 0;
>>> +    int i;
>>> +
>>> +    /* If device use extcon, do not use hpd bridge */
>>> +    for (i = 0; i < dp->ports; i++) {
>>> +        if (dp->port[i]->extcon) {
>>> +            dp->bridge_count = 1;
>>> +            return 0;
>>> +        }
>>> +    }
>>> +
>>> +
>>> +    /* One endpoint may correspond to one next bridge. */
>>> +    for_each_of_graph_port_endpoint(port, dp_ep) {
>>> +        struct device_node *next_bridge_node __free(device_node) =
>>> +            of_graph_get_remote_port_parent(dp_ep);
>>> +
>>> +        bridge = of_drm_find_bridge(next_bridge_node);
>>> +        if (!bridge) {
>>> +            ret = -EPROBE_DEFER;
>>> +            goto out;
>>> +        }
>>> +
>>> +        dp->next_bridge_valid = true;
>>> +        dp->next_bridge_list[count].bridge = bridge;
>> You are storing a reference to a drm_bridge, so have to increment the
>> refcount:
>>
>>         dp->next_bridge_list[count].bridge = drm_bridge_get(bridge);
>>                                              ^^^^^^^^^^^^^^
>>
>> FYI there is a plan to replace of_drm_find_bridge() with a function that
>> increases the bridge refcount before returning the bridge, but it's not
>> there yet. When that will happen, the explicit drm_bridge_get() won't be
>> needed anymore and this code can be updated accordingly.

Out of curiosity, I checked the callers of of_drm_find_bridge(), and it seems that the vast majority of them do not pay attention to the increase or decrease of reference counts. Does this mean that even if we add reference counting in of_drm_find_bridge(), we still need to modify the corresponding functions of their callers and decrease the reference count at the appropriate time? Thank you.


>>
>> Also you have to call drm_bridge_put() to release that reference when the
>> pointer goes away. I guess that should happen in cdn_dp_unbind().
>
> You're right, this is indeed a pitfall. I will fix it in v10.
>
>
-- 
Best,
Chaoyi


