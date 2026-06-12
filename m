Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA65CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA/8lojlnoBXLM3tKqU8Fe1cfoyo8ibrdkSB51oFR5g=; b=Zgvv7ivDOMgqtlIVt4HhlRRCy9
	3xHE9C+quI7sf3077zISvJeSEFMEwTNP8JhOdsKgx0D72yaQ+OzBs2io1kPclCt0ww/2f1+23a+MK
	cQ+/0gRlU4ARru2zBqeRvfMoeGPuapAmxAjzxDOj2n0t2pEwBV0wjqKq/+jF+VVtbKeW/6ZskD5XF
	DMb3henMlwA3Uh2F+4iUEdoE4ROc+TuSd2m4ZU53hSUmdUbIjjKtuO4kLlFgKs4bimjhoaCy0eiqO
	1xEg+btSQCeUeqArD4Gdd1tGzziS/QqljNRiX0H15fUeuZqGZaywMl86cjeIJJAkvUwYooYciL3Xr
	Z8ViayCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8hh-0000000BYj1-48Jm;
	Fri, 12 Jun 2026 20:42:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8he-0000000BYie-3qhS;
	Fri, 12 Jun 2026 20:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781296927;
	bh=EwJnim2UySXl/C8gGWgVbYK2jiPjZuEGJl0kKvx+JJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jJWzVQuRji0oWgxnebSLfoQRnObVZavrZh4J1bnyxVeYBDwKTJ+Hp1hFy6PJtV/8J
	 n0DCJQEtId+w0/MRGmPfPBGYYip+crbavyBzp8vo3aXyXcCAyHJk7IAQhNOIvkFgIG
	 GahQ/csYaccDz1y7/V99iAYRa0t9BCIFeSBKvQnb4L1pKZUo1Gy2yEShSB3J0eiR3Q
	 Z8D97yKABYROKzZV+hUT/ong/MpjaSqxKrepBm9ZjTD8Is7ZYrIk9oazCHHwfLbQMX
	 9fXZU8vBVOjzN/YahJhPFk0J12CJ3jNPRY73c//o/kapbTUvMuI8jvPsygJpl84XNp
	 It4MArU596hhw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0BD717E03D7;
	Fri, 12 Jun 2026 22:42:06 +0200 (CEST)
Message-ID: <b14af457-0799-43cc-80b5-7ffff5901f24@collabora.com>
Date: Fri, 12 Jun 2026 23:42:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/30] drm/display: bridge_connector: Wire up HDMI 2.0
 scrambler callbacks
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-11-445eb54ee1ed@collabora.com>
 <20260612-attractive-dashing-mule-309598@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260612-attractive-dashing-mule-309598@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_134211_143180_37BA8AA1 
X-CRM114-Status: GOOD (  25.94  )
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

On 6/12/26 11:52 AM, Maxime Ripard wrote:
> On Tue, Jun 02, 2026 at 01:44:11AM +0300, Cristian Ciocaltea wrote:
>> Connect the bridge connector's .scrambler_{enable|disable} callbacks to
>> the underlying bridge's .hdmi_scrambler_{enable|disable} funcs when
>> DRM_BRIDGE_OP_HDMI_SCRAMBLER is advertised.
>>
>> This completes the bridge connector plumbing so that the SCDC
>> scrambling helpers can control source-side scrambling through the
>> bridge chain.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_bridge_connector.c | 41 +++++++++++++++++++++++++-
>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 9d21b1b57b0d..d048ab49eade 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -555,6 +555,32 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
>>  	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
>>  }
>>  
>> +static int drm_bridge_connector_scrambler_enable(struct drm_connector *connector)
>> +{
>> +	struct drm_bridge_connector *bridge_connector =
>> +		to_drm_bridge_connector(connector);
>> +	struct drm_bridge *bridge;
>> +
>> +	bridge = bridge_connector->bridge_hdmi;
>> +	if (!bridge)
>> +		return -EINVAL;
>> +
>> +	return bridge->funcs->hdmi_scrambler_enable(bridge);
>> +}
>> +
>> +static int drm_bridge_connector_scrambler_disable(struct drm_connector *connector)
>> +{
>> +	struct drm_bridge_connector *bridge_connector =
>> +		to_drm_bridge_connector(connector);
>> +	struct drm_bridge *bridge;
>> +
>> +	bridge = bridge_connector->bridge_hdmi;
>> +	if (!bridge)
>> +		return -EINVAL;
>> +
>> +	return bridge->funcs->hdmi_scrambler_disable(bridge);
>> +}
>> +
>>  static const struct drm_edid *
>>  drm_bridge_connector_read_edid(struct drm_connector *connector)
>>  {
>> @@ -580,7 +606,7 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
>>  		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
>>  		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
>>  	},
>> -	/* audio, hdr_drm and spd are set dynamically during init */
>> +	/* scrambler, audio, hdr_drm and spd are set dynamically during init */
>>  };
>>  
>>  static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
>> @@ -886,6 +912,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>  			     !bridge->funcs->hdmi_clear_spd_infoframe))
>>  				return ERR_PTR(-EINVAL);
>>  
>> +			if (bridge->ops & DRM_BRIDGE_OP_HDMI_SCRAMBLER &&
>> +			    (!bridge->funcs->hdmi_scrambler_enable ||
>> +			     !bridge->funcs->hdmi_scrambler_disable))
>> +				return ERR_PTR(-EINVAL);
>> +
>>  			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
>>  
>>  			if (bridge->supported_formats)
>> @@ -990,6 +1021,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>  			bridge_connector->hdmi_funcs.spd =
>>  				drm_bridge_connector_hdmi_spd_infoframe;
>>  
>> +		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SCRAMBLER) {
>> +			bridge_connector->hdmi_funcs.scrambler_enable =
>> +				drm_bridge_connector_scrambler_enable;
>> +			bridge_connector->hdmi_funcs.scrambler_disable =
>> +				drm_bridge_connector_scrambler_disable;
>> +			connector->hdmi.scrambler_supported = true;
>> +		}
>> +
> 
> I think we're taking this backwards. The scrambler support isn't
> optional: either the controller supports HDMI < 2.0, and then it doesn't
> exist, or it supports >= 2.0 and then it's mandatory.
> 
> You're considering it optional here, when it's never actually optional
> (unlike YUV420 for example)
> 
> I still think we should list, somehow, the capabilities of the
> controller to the helpers, like max tmds rate supported, formats, etc.
> We've so far put everything as an argument to drmm_connector_hdmi_init
> but it becomes a bit overloaded, and I wonder if introducing a callback
> wouldn't solve this, kind of like what we have for planes and formats.


What about introducing something like:

struct drm_connector_hdmi_caps {
    ...
    unsigned int supported_formats;
    enum hdmi_version supported_hdmi_ver;
};

struct drm_connector_hdmi_funcs {
    ...
    int (*get_caps)(struct drm_connector *connector,
                    struct drm_connector_hdmi_caps *caps);
    ...
};

int drmm_connector_hdmi_init(struct drm_device *dev, ...)
{
    ...
    if (hdmi_funcs->get_caps) {
        struct drm_connector_hdmi_caps caps = { };

        ret = hdmi_funcs->get_caps(connector, &caps);
        if (ret)
            return ret;

        connector->hdmi.supported_formats  = caps.supported_formats;
        ...
        if (caps.supported_hdmi_ver > HDMI_2_0)
            connector->hdmi.frl_supported = true;
        else if (caps.supported_hdmi_ver == HDMI_2_0)
            connector->hdmi.scrambler_supported = true;
    }
    ...
}

Not sure if max_tmds_char_rate should be listed as a capability, as we already
have the .tmds_char_rate_valid() callback.

Cristian

