Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCEBC44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1rxcUQ7ZgcrX3VztVIQdM6GQ64KrdNzuTO3pONHaoE=; b=YZJMx1bKJYaU7Az2RJY5ojJ790
	5Qw02iryY7lTwzYofC7yu5qsGn49UuzAazQmh2xAEkwbIqwFJXFd0QiO0SK8vqOVYuHRc1VR2dcYm
	p5SN4hw4iT5drOXI+0OB/jG+3b71la72mC8/+H/n7UsTzql9Y7R9wJKEtY/7ap0TQtf8cQgtXu01D
	ltPjtcPUgBSDrEBdlnApLSgaWIlocuYHCjoNLYNIHkhOBkOGn1tT+dFEhonE0YL61Rg1PO7UGq7/7
	37EgAXORun78MkHWjieTCErhpGYsvF5a/uUb+g/RGV2tUGNAtBpxyouq9Qdw9HeIJSp+l1PUnI2eA
	yGman/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNgD-0000000HaZG-0rFg;
	Thu, 16 Jul 2026 15:07:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNgA-0000000HaXu-0gFr;
	Thu, 16 Jul 2026 15:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784214430;
	bh=2RoxLxBygH3XJAzauNRzHXAbfvqYjBGxJOnkUcb1/g4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qEH/1up8uv9N0V0a296zX9X+VRqI9wpvBQM6gWVM0YQmLqF46Tm3u+lL5FXxRu4Rx
	 9jjapg/A9O5XqwAPxM25DzpWeGLH9vdzlnYI+f6et3hLu4v9T2PvGH9HnVQcvoZ2bL
	 h7yZqIWuWMFc19KlDCUJBJ/MuZgOY6QM2DrkPP8dsnvEVgwyv8dfEb44OTk5HjZueK
	 3K7QUYKRfvf44Lttl2lrK+M/oZ+25pWb1j6sWNW/DcD//YanRMGW+PueVuOkioJXBQ
	 lpIIr/q38XnE7cbCbrdTNG3CMNdXaaHZ0xylX4leyxmWtk1a/G557fFmq90dUwJ5YD
	 mIAJGunlxwJog==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18AFD17E010F;
	Thu, 16 Jul 2026 17:07:10 +0200 (CEST)
Message-ID: <7753ee98-a8c6-4535-8789-d915b0f79ddf@collabora.com>
Date: Thu, 16 Jul 2026 18:07:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-4-d79890d00b6a@collabora.com>
 <tjsidlnvswo2rdhqa6jybxrnb47lxgmxdlfrfbasuh67wjbqoy@3a45n3zawvnf>
 <17753a1c-824a-4835-ac2d-8b2796bba1eb@collabora.com>
 <534b921c-638c-4fc3-b89e-5dfc1f269f96@collabora.com>
 <20260713-statuesque-nonchalant-seagull-b9c39d@houat>
 <91c3a825-3344-4ff5-8ea0-f8f057665b3f@collabora.com>
 <20260715-ancient-zealous-eagle-b13e94@houat>
 <dfca9032-98ca-4c61-b1b1-85fd05283d77@collabora.com>
 <20260716-astute-nippy-moose-bd22b5@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260716-astute-nippy-moose-bd22b5@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_080714_369830_7D0D18DF 
X-CRM114-Status: GOOD (  26.34  )
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

On 7/16/26 4:50 PM, Maxime Ripard wrote:
> On Wed, Jul 15, 2026 at 01:46:12PM +0300, Cristian Ciocaltea wrote:
>> On 7/15/26 11:55 AM, Maxime Ripard wrote:
>>> On Mon, Jul 13, 2026 at 01:23:00PM +0300, Cristian Ciocaltea wrote:
>>>> On 7/13/26 11:50 AM, Maxime Ripard wrote:
>>>>> On Thu, Jul 09, 2026 at 10:25:54PM +0300, Cristian Ciocaltea wrote:
>>>>>> On 7/3/26 11:54 PM, Cristian Ciocaltea wrote:
>>>>>>> On 7/3/26 5:34 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Jul 02, 2026 at 05:46:17PM +0300, Cristian Ciocaltea wrote:
>>>>>>>>> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
>>>>>>>>>
>>>>>>>>> - A scrambler_supported flag to indicate whether the source supports the
>>>>>>>>>   scrambling capability, in which case the newly introduced
>>>>>>>>>   .scrambler_{enable|disable}() callbacks in drm_connector_hdmi_funcs
>>>>>>>>>   are mandatory
>>>>>>>>
>>>>>>>> Do we need a flag? What would it mean if the flag is set, but the
>>>>>>>> callbacks are not? Can we drop the flag and use the presence of the
>>>>>>>> callbacks as a way to identify that scrambler is enabled?
>>>>>>>
>>>>>>> The flag is intended to be set only within drmm_connector_hdmi_init_with_caps()
>>>>>>> when drivers advertise HDMI 2.x capability, in which case it also ensures the
>>>>>>> callbacks are provided.  
>>>>>>>
>>>>>>> We could drop the flag and instead have the init helper clear the callbacks if
>>>>>>> they were provided for HDMI 1.x.  This might slightly reduce code readability,
>>>>>>> as it relies on checking the presence of individual callbacks - especially since
>>>>>>> we plan to extend this further with HDMI 2.1 support, providing four or five
>>>>>>> additional FRL-specific callbacks.
>>>>>>
>>>>>> I tried to replace the flag with a helper that checks the presence of (one of)
>>>>>> the callbacks, but it's not straightforward to unset those for non-HDMI 2.x
>>>>>> cases since the hdmi_funcs argument is immutable.
>>>>>
>>>>> I'm not sure why we would need to unset them. If the driver states that
>>>>> it support HDMI 2.0, then it needs to be there, if it doesn't, then who
>>>>> cares? it's not going to be used. We can log a warning that it's
>>>>> inconsistent I guess, but there's no need to actively remove it.
>>>>
>>>> I was trying to address the use case where drivers provide the scrambler
>>>> callbacks despite not supporting HDMI 2.0.
>>>
>>> Scrambling got introduced with HDMI 2.0. That doesn't make sense, but
>>> it's not a total deal breaker, it's just going to be here unused. Hence
>>> why I was suggesting to put a warning there if you wanted to.
>>>
>>>> If we replace the scrambler_supported flag with a helper checking the
>>>> presence of the scrambler callbacks, then we would need to ensure the
>>>> callbacks do not exist in this case.
>>>
>>> Keep it simple:
>>>
>>> if (hdmi_version >= HDMI_VERSION_2_0)
>>>    if (funcs->scrambler_enable)
>>>       hdmi->scramblers_supported = true
>>>    else
>>>       return -EINVAL
>>> else
>>>     drm_warn(warn, "Inconsistent HDMI version");
>>>
>>> We don't need anything more than that.
>>
>> I dropped the scrambler_supported flag and introduced a helper:
>>
>> static inline bool
>> drm_connector_hdmi_scrambler_supported(struct drm_connector *connector)
>> {
>> 	return connector->hdmi.funcs && connector->hdmi.funcs->scrambler_enable;
> 
> I'd add disable to that test

If scrambler_enable is present, scrambler_disable is also present, as guaranteed
by the init validation below.  I assume you'd like to have it added regardless,
to improve code readability, which is a fair point.

>> }
>>
>> Therefore we need to ensure the callbacks are not set in the HDMI 1.x cases:
>>
>> int drmm_connector_hdmi_init_with_caps()
>> {
>> 	...
>> 	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0) {
>> 		if (!hdmi_funcs->scrambler_enable ||
>> 		    !hdmi_funcs->scrambler_disable)
>> 			return -EINVAL;
>>
>> 		connector->hdmi.max_tmds_char_rate = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
>> 	} else {
>> 		/*
>> 		 * Scrambler callbacks are only valid for connectors advertising
>> 		 * HDMI 2.0 capability. drm_connector_hdmi_scrambler_supported()
>> 		 * relies on their presence to report scrambling support.
>> 		 */
>> 		if (hdmi_funcs->scrambler_enable ||
>> 		    hdmi_funcs->scrambler_disable)
>> 			return -EINVAL;
>>
>> 		if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3) {
>> 			connector->hdmi.max_tmds_char_rate = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
>> 		} else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0) {
>> 			connector->hdmi.max_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
>> 		}
>> 	}
> 
> Drivers might have a lower limit than the max allowed by the spec. It
> should be provided by the driver, possibly optionally with a fallback to
> what the spec states?

Yes, this has been already part of patch 2 (also added an error message to help
with debugging):

	if (caps->max_tmds_char_rate) {
		if (caps->max_tmds_char_rate > connector->hdmi.max_tmds_char_rate) {
			drm_err(dev, "Enforced max_tmds_char_rate exceeds %llu spec limit\n",
				connector->hdmi.max_tmds_char_rate);
			return -EINVAL;
		}
		connector->hdmi.max_tmds_char_rate = caps->max_tmds_char_rate;
	}

Regards,
Cristian

