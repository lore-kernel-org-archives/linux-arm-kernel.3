Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61143C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRxfufF4OUe+W5VRpXOA9RrWw0ix/G9yeSyBfXtoFkM=; b=fs2vB1X0kFz4lBMPeqinvaUl5g
	9V3DZn6aKl7qaqlzCS+g8c0iDT3hmKNI01YUSOF7g59ga3n9wKSkGVrL69rf4oTriKvknhhggjH3l
	WjDIB7ZzQzQSjXxaabCDCSlWvXYWhh+3FIROWoFn9lgQf/uOB0c5CVVin6av7c/HChf0+XHu6yApc
	n5dCHk4m4kt2z6ZADnxISf7cHi9wdW97n8mMEyu4Wl/hMj76JQzJN5p0u+PzR4/mJx1gw6CzbjrsX
	UT5pFiNV3psXqYbtdZGyee3b/PqOVXEzUIVhDjiLTSDSOviF61Bn0135g9vBRMXL4MfT7o1/HVuFC
	VQZ5vArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udR0F-0000000F7f8-2MDz;
	Sun, 20 Jul 2025 10:10:43 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQxk-0000000F7XM-1ejU;
	Sun, 20 Jul 2025 10:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1753006023;
	bh=HRxfufF4OUe+W5VRpXOA9RrWw0ix/G9yeSyBfXtoFkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TW4tuRhcfxKeRWJQQ+aYY+ZN3HoXkXz/it35XVnHy7wKaouOTkJ0ycWKpubqelLPi
	 WNJlRQ3J+CtfaZO/9dwGeOiJBNFQMGYA94lMA2ZZmqmxuT5t6KSV5XLC+XQgfVWPXL
	 YpHu+Q9GvKDuxBtG20imYd+uHoveV/TRNEHa16wc=
X-QQ-mid: esmtpgz14t1753006014t51320e67
X-QQ-Originating-IP: F7PdjKICQ8nRZpWX1lEhOBgGMEMX4m1ChMp59nydQx0=
Received: from [192.168.0.103] ( [117.25.58.172])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 20 Jul 2025 18:06:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11197095626192148985
Message-ID: <61E98DE80D7F342D+8e29ec49-1291-48f5-b47e-17aed7c4b032@airkyi.com>
Date: Sun, 20 Jul 2025 18:06:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/rockchip: cdn-dp: Support handle lane info and
 HPD without extcon
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-4-kernel@airkyi.com>
 <t3th2tqbnkmsqssypxvye6vsfhpw37sf7wyl53cso3r5pqa7qp@gn74pj75j4pb>
From: air windows <kernel@airkyi.com>
In-Reply-To: <t3th2tqbnkmsqssypxvye6vsfhpw37sf7wyl53cso3r5pqa7qp@gn74pj75j4pb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NdaCjfXsdP3wmBC7/smz583kfEiJrGvrF/SEPf1wX76MuKwRl0GqRoL3
	OtGQh8Rxona6QEFXCQzl/PkgaiXYCm1h5ZByXuVAXg7xZhxCN8ONmasEc6GZjPVFll7rsPH
	Nb4w97C7xFFpiriOvS0FF710rB6m8xy6MK/UHIvyN/EDxZx9HbEjN2cP7ZUl3nggb0UBz/K
	gyTy3zXYDLd2bGt9A9Ohglme+7LbBv6BvCD+WBteds2RNNYIX8Rh8dX9hLH+YMZGKFDWxec
	PEqjk0tja6Efq06fZAC44JKph5q2VzPbjvN4EsNLKvWHg1Owqr3ywaNlbSBhA1tOdvY3alB
	yQaTKkSz3Cg2LZFikclK6JAoKyW/KrZUakV+JjvMEGBm3kIRT/ZDv9W7AzmCDUusYBYzMzd
	6B9FoSJBYXihWvRcvQNONd1RUSZZ9iF40dZWdqAzIWDMMdhNE05/v/2KnbYJIhMm52zkEAA
	5yNUicrJ5NOjtOrao3mM/ewgT0i5neX6VGBts4WSMda1eJ7fKiViH6WB/y/3slcGYbUl7RZ
	I3F4peCpRmsF9hnIHStapD7I2oDlwxQoKcc1P5tmcUxzMyNvEuD2ewwCdTMqRU5xnYALeLF
	iycLPKQHWvJFX9cFSxy/x/8nX1AHuI22pD+Y7LK+hpjJi8691ZBAzA8y9MswbDdOP3lK5z0
	0OmTMEEpzaiAnSaGi26E5Z1EfFSEyEkvsIEoM+Pr7IqbeZAwvd8SEv/qTGxtLmk4hoTCCrh
	QTpxIqzIXs21cJxLa+EvxP9C1rK+Y9JqrFYZ5I0XZiti6FO1RupGCm3aWCK5+cP761TIFWp
	Bv8Qir/IDiCh+skBCJevJqT8t1n+FNeErWCSFi6U37eLPABzOEmAaQLZmD8hF7ARjx9Lfh0
	UcvWWWpXiCOaPWF9XPR7Iso2gf6gMisFBnSvUk+wmXGm0dSqSOyzpxTV5HDGrhuz6CnjzzP
	p8b4kUPgEI+kqGy63XuDj42oyHnKa8ewEZF3m2nn1pE43k/17jRLlXACt
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_030808_889733_1BC1CD84 
X-CRM114-Status: GOOD (  22.90  )
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

在 2025/7/19 18:53, Dmitry Baryshkov 写道:

> On Fri, Jul 18, 2025 at 02:26:17PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This patch add support for get PHY lane info and handle HPD state
>> without help of extcon.
>>
>> There is no extcon needed if the Type-C controller is present. In this
>> case, cdn_dp_hpd_notify() will handle HPD event from USB/DP combo PHY,
>> and the lane info can be get from PHY instead of extcon.
> The DP AltMode driver will send drm_connector_oob_hotplug_event() to the
> DRM connector associated with the USB-C connector fwnode. However your
> DP connector will have fwnode set to the DP controller, if I'm not
> mistaken. So I doubt that HPD events are going to be delivered
> correctly.

Yes, that's exactly the case for the DP Altmode driver! I've thought of a few approaches, but none of them are elegant. Now it relying on the PHY driver to call the drm_connector_oob_hotplug_event(). You'll find the relevant code in the PHY driver.


>
>> The extcon device should still be supported if Type-C controller is
>> not present.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - Ignore duplicate HPD events.
>>
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 37 ++++++++++++++++++++------
>>   1 file changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> index 24f6b3879f4b..b574b059b58d 100644
>> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> @@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
>>   	int dptx;
>>   	u8 lanes;
>>   
>> +	if (!edev)
>> +		return phy_get_bus_width(port->phy);
>> +
>>   	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
>>   	if (dptx > 0) {
>>   		extcon_get_property(edev, EXTCON_DISP_DP,
>> @@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
>>   	 * some docks need more time to power up.
>>   	 */
>>   	while (time_before(jiffies, timeout)) {
>> -		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
>> +		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
>>   			return false;
>>   
>>   		if (!cdn_dp_get_sink_count(dp, &sink_count))
>> @@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
>>   		goto err_power_on;
>>   	}
>>   
>> -	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
>> -				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
>> -	if (ret) {
>> -		DRM_DEV_ERROR(dp->dev, "get property failed\n");
>> -		goto err_power_on;
>> +	property.intval = 0;
>> +	if (port->extcon) {
>> +		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
>> +					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
>> +		if (ret) {
>> +			DRM_DEV_ERROR(dp->dev, "get property failed\n");
>> +			goto err_power_on;
>> +		}
>>   	}
>>   
>>   	port->lanes = cdn_dp_get_port_lanes(port);
>> @@ -821,6 +827,17 @@ static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
>>   	return ret;
>>   }
>>   
>> +static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
>> +			      enum drm_connector_status status)
>> +{
>> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> +	enum drm_connector_status last_status =
>> +		dp->connected ? connector_status_connected : connector_status_disconnected;
>> +
>> +	if (last_status != status)
>> +		schedule_work(&dp->event_work);
>> +}
>> +
>>   static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> @@ -831,6 +848,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>>   	.atomic_disable = cdn_dp_bridge_atomic_disable,
>>   	.mode_valid = cdn_dp_bridge_mode_valid,
>>   	.mode_set = cdn_dp_bridge_mode_set,
>> +	.hpd_notify = cdn_dp_hpd_notify,
>>   
>>   	.dp_audio_prepare = cdn_dp_audio_prepare,
>>   	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
>> @@ -1028,6 +1046,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>   	for (i = 0; i < dp->ports; i++) {
>>   		port = dp->port[i];
>>   
>> +		if (!port->extcon)
>> +			continue;
>> +
>>   		port->event_nb.notifier_call = cdn_dp_pd_event;
>>   		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
>>   						    EXTCON_DISP_DP,
>> @@ -1120,14 +1141,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
>>   		    PTR_ERR(phy) == -EPROBE_DEFER)
>>   			return -EPROBE_DEFER;
>>   
>> -		if (IS_ERR(extcon) || IS_ERR(phy))
>> +		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
>>   			continue;
>>   
>>   		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>>   		if (!port)
>>   			return -ENOMEM;
>>   
>> -		port->extcon = extcon;
>> +		port->extcon = IS_ERR(extcon) ? NULL : extcon;
>>   		port->phy = phy;
>>   		port->dp = dp;
>>   		port->id = i;
>> -- 
>> 2.49.0
>>

