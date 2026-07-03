Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1C5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZb7iFUKJo1HuDJr1mC2Gt3Na3fOo+8Lt2eKdfq6i9I=; b=yAXxN8Djvc5Wl5MAKyffmEbMto
	UKguoqECbdStZ3wtkqo3IWKIdrKdRut9PPo7XvG4nyKry19gYWLJs7ZKKyUXe+hTO28Ki/ba2T3OR
	doDPScoEJMzMxNXuW3Bglxc6XAN5YVe52mPv2sE1qpRS/P5IBDbuvU63LRImiQCM8oBUdY9ciKYeH
	ZE8ySyATRi7QDLATPI+0HEGZyRJc7EaE36c3W8+vbo9fZ+wZAGLGK5TaIJbxzQtE8A7BBMRJBd8rs
	nBlQnxOXmcvgRU3DSM0RunArsnbZM4GTrVdy/NWn2jkoP2myTV7Zbzrnveo4uXwiWq5eBazOYL3rz
	nC8AUxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkuG-00000007tmD-3Ulw;
	Fri, 03 Jul 2026 20:54:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkuD-00000007tlC-3lyU;
	Fri, 03 Jul 2026 20:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783112074;
	bh=45zXM+5aKO5eN/39BRTvY9zIafUVinuOnLXypVF5P58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dSmgKkwAjTsVDfAJuF7Qx0OVyHIxDKA2fsUW9i/5CX6+i4DRES9TV39lZVBkj3925
	 5Mjtaq1jiMxVW1Wdn1v6Hph4zkP3iO7+9M3CEgeznb5BpKYWjN8SfRakD3RbGLgh8O
	 05Ix+r/55Q4CqYZC9yTEGiEJsPo4s056ruT6cAqF4P73NjXElfr6TIu9sBUVVieScL
	 3Z8dRC+glur7DF32kBraiVGe5ej0tjAIh4Te3DSMBlp7FXo9u9ClpootU/F2nqx2sL
	 18w5WbGAH7D8lXp/swXqoDGRpKHIYqLfRaKlWVrCayYw2s/NHwxlRxjrOu/rcje8L/
	 wJxtV9TARcfCQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA5F917E03D4;
	Fri,  3 Jul 2026 22:54:33 +0200 (CEST)
Message-ID: <17753a1c-824a-4835-ac2d-8b2796bba1eb@collabora.com>
Date: Fri, 3 Jul 2026 23:54:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <tjsidlnvswo2rdhqa6jybxrnb47lxgmxdlfrfbasuh67wjbqoy@3a45n3zawvnf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_135438_097218_4DD31BB2 
X-CRM114-Status: GOOD (  30.38  )
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

On 7/3/26 5:34 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 02, 2026 at 05:46:17PM +0300, Cristian Ciocaltea wrote:
>> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
>>
>> - A scrambler_supported flag to indicate whether the source supports the
>>   scrambling capability, in which case the newly introduced
>>   .scrambler_{enable|disable}() callbacks in drm_connector_hdmi_funcs
>>   are mandatory
> 
> Do we need a flag? What would it mean if the flag is set, but the
> callbacks are not? Can we drop the flag and use the presence of the
> callbacks as a way to identify that scrambler is enabled?

The flag is intended to be set only within drmm_connector_hdmi_init_with_caps()
when drivers advertise HDMI 2.x capability, in which case it also ensures the
callbacks are provided.  

We could drop the flag and instead have the init helper clear the callbacks if
they were provided for HDMI 1.x.  This might slightly reduce code readability,
as it relies on checking the presence of individual callbacks - especially since
we plan to extend this further with HDMI 2.1 support, providing four or five
additional FRL-specific callbacks.  

That said, I don’t have a strong opinion on this.

>> - A scrambler_needed flag to be managed by the hdmi state helpers based
>>   on the negotiated TMDS character rate and the source/sink scrambling
>>   capabilities
>> - A scrambler_enabled flag to track whether scrambling is currently
>>   active
>> - A delayed work item (scdc_work) with an associated callback (scdc_cb)
>>   to monitor sink-side scrambling status and retry the setup if the sink
>>   resets it
>>
>> These are intended to be used by SCDC scrambling helpers to coordinate
>> scrambling setup and teardown between the source driver and the DRM
>> core.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c | 26 ++++++++++++--
>>  include/drm/drm_connector.h     | 77 +++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 100 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index c7ce6b7bd8b0..deecfc582f09 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -220,6 +220,19 @@ void drm_connector_free_work_fn(struct work_struct *work)
>>  	}
>>  }
>>  
>> +static void drm_connector_hdmi_scdc_work(struct work_struct *work)
>> +{
>> +	struct drm_connector *connector;
>> +	struct drm_connector_hdmi *hdmi;
>> +
>> +	hdmi = container_of(to_delayed_work(work), struct drm_connector_hdmi,
>> +			    scdc_work);
>> +	connector = container_of(hdmi, struct drm_connector, hdmi);
>> +
>> +	if (hdmi->scdc_cb)
>> +		hdmi->scdc_cb(connector);
>> +}
>> +
>>  static int drm_connector_init_only(struct drm_device *dev,
>>  				   struct drm_connector *connector,
>>  				   const struct drm_connector_funcs *funcs,
>> @@ -285,6 +298,7 @@ static int drm_connector_init_only(struct drm_device *dev,
>>  	mutex_init(&connector->edid_override_mutex);
>>  	mutex_init(&connector->hdmi.infoframes.lock);
>>  	mutex_init(&connector->hdmi_audio.lock);
>> +	INIT_DELAYED_WORK(&connector->hdmi.scdc_work, drm_connector_hdmi_scdc_work);
>>  	connector->edid_blob_ptr = NULL;
>>  	connector->epoch_counter = 0;
>>  	connector->tile_blob_ptr = NULL;
>> @@ -624,12 +638,18 @@ int drmm_connector_hdmi_init_with_caps(struct drm_device *dev,
>>  	 * inferred limit with the actual controller capability. A value of
>>  	 * zero keeps the default limit inferred from supported_hdmi_ver.
>>  	 */
> 
> Here we need to check that the driver doesn't set only one callback of
> the pair.

Is anything missing from the check below?  I chose to ignore the presence of the
callbacks in HDMI 1.x cases.

> 
>> -	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0)
>> +	if (caps->supported_hdmi_ver >= HDMI_VERSION_2_0) {
>> +		if (!hdmi_funcs->scrambler_enable ||
>> +		    !hdmi_funcs->scrambler_disable)
>> +			return -EINVAL;
>> +
>> +		connector->hdmi.scrambler_supported = true;
>>  		connector->hdmi.max_tmds_char_rate = HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ;
>> -	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3)
>> +	} else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_3) {
>>  		connector->hdmi.max_tmds_char_rate = HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
>> -	else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0)
>> +	} else if (caps->supported_hdmi_ver >= HDMI_VERSION_1_0) {
>>  		connector->hdmi.max_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
>> +	}
>>  
>>  	if (caps->max_tmds_char_rate) {
>>  		if (caps->max_tmds_char_rate > connector->hdmi.max_tmds_char_rate)
>> +
>> +	/** @scdc_cb: Callback to be invoked as part of @scdc_work.
>> +	 *
>> +	 * Currently used to monitor sink-side scrambling status and retry
>> +	 * setup if the sink resets it.
>> +	 *
>> +	 * This is assigned by the framework when making use of
>> +	 * drm_connector_hdmi_enable_scrambling() helper.
> 
> No such helper. 

Right, I'll drop the reference to the helper name, as that's added later in the
series.

> Also, please explain in the commit message, why do we
> need to keep it configurable. Why the default is not enough?

We will need a separate callback to support HDMI 2.1, i.e. for link training
management.  I’ll update the commit message accordingly.

Thanks,
Cristian

