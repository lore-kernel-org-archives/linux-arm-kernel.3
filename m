Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FFFCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSl7FCBzQc4oZkfBiJGqmOqu/PTGbltxr/25V67/H6I=; b=QrGoZM3JsOnxzqquryBdoz4tfQ
	HyqwP2Ynz/3iNP2XPmU6Oha1Az8UDrHhcrZ7g8fQtHIN78i8wGKE2xuR1UcYA3Pvzu/QoAj+Zqb+/
	f5blBLnQ+G1TLVB1A1vnegJMNB636u4TT9v7TR/BqJfZcPQ9s/V0Unw70pddY4ysuLfBHF5QsZfqt
	RUZq/32B8BdSlmYFnZttw55ohZIMEwlUL9lnrQ83IFIU3RTi/JBD2uFda5XtAJd+YRhL9Ce93QjQM
	kKzCpDMu43/ZUYKq5JpbVmGcTb9Scw44eo/8lIp5GlBSMEiAFNS1dz5pvaFVKlYkKZApBtsmRsRu4
	TF3ruppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfJ6-00000008p9f-2cPa;
	Thu, 25 Jun 2026 08:19:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfJ4-00000008p92-1HV7;
	Thu, 25 Jun 2026 08:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782375563;
	bh=nCyO76GcZTqJ8IWlo+QkFWSRUHPwnxqO6bLkIAX5v30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ao50NhUvUzm8tGdnsJslAfW/6WZAND9921SEJ92KLLqAo67oy0lHn16BQT2GeLIIb
	 fhntkvmDwarLS9ae4u/ket3QEVFuCcVapcfKGXrvSEfuyoo6bDVbN8Wv4HWCtHYR0k
	 o0d9jHUh6Ylqmcl3v2NTORcs3NQuJm2gn6A4G8e6Tb27XcvIN2v6apdjKkyyK77IzW
	 61t7eoVxUpmPqYcJgi/K5pro6KA0CCMp/tC3RwgEzdkZ2hHWODB732DpEGLmLP5oCv
	 DdmEpOsY6RGpDfVxVmfseW9ZO9wAtnK+9earnrKW+/S1jtMb0Xeg7UTftCNVs6HvxK
	 HvYTO6M6X8IpA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBA4717E03D7;
	Thu, 25 Jun 2026 10:19:22 +0200 (CEST)
Message-ID: <b520e77d-1ae3-4222-b442-e59442903107@collabora.com>
Date: Thu, 25 Jun 2026 11:19:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 25/30] drm/vc4: hdmi: Convert to common HDMI 2.0 SCDC
 scrambling helpers
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
 <20260602-dw-hdmi-qp-scramb-v7-25-445eb54ee1ed@collabora.com>
 <20260612-primitive-chital-of-tempering-18bc7c@houat>
 <8937d785-4daa-4246-9553-24aed7d279b5@collabora.com>
 <20260625-busy-ultra-oryx-ffb3c9@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260625-busy-ultra-oryx-ffb3c9@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_011930_505384_AB327B49 
X-CRM114-Status: GOOD (  38.59  )
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

On 6/25/26 10:44 AM, Maxime Ripard wrote:
> On Sat, Jun 13, 2026 at 03:41:20AM +0300, Cristian Ciocaltea wrote:
>> Hi Maxime,
>>
>> On 6/12/26 3:04 PM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Tue, Jun 02, 2026 at 01:44:25AM +0300, Cristian Ciocaltea wrote:
>>>> Replace the vc4-local scrambling implementation with the newly
>>>> introduced DRM common SCDC scrambling infrastructure:
>>>>
>>>> - Advertise source-side scrambling support by setting
>>>>   connector->hdmi.scrambling_supported based on the variant's
>>>>   max_pixel_clock before drmm_connector_hdmi_init().
>>>>
>>>> - Provide minimal .scrambler_{enable|disable} connector callbacks that
>>>>   only toggle the VC5 HDMI_SCRAMBLER_CTL register.  Sink-side SCDC
>>>>   programming and periodic status monitoring are now delegated to
>>>>   drm_scdc_{start|stop}_scrambling().
>>>>
>>>> - Replace vc4_hdmi_enable_scrambling() with a conditional call to
>>>>   drm_scdc_start_scrambling() in post_crtc_enable, gated on
>>>>   conn_state->hdmi.scrambler_needed (computed by the HDMI state helper).
>>>>
>>>> - Replace vc4_hdmi_disable_scrambling() with drm_scdc_stop_scrambling()
>>>>   in post_crtc_disable.
>>>>
>>>> - Drop vc4_hdmi_reset_link() and vc4_hdmi_handle_hotplug(), switching
>>>>   the .detect_ctx() path to
>>>>   drm_atomic_helper_connector_hdmi_hotplug_ctx() which internally calls
>>>>   drm_scdc_sync_status() to trigger a CRTC reset on reconnection.
>>>>
>>>> - Drop the local scrambling_work delayed workqueue and scdc_enabled
>>>>   flag, now tracked by the common drm_connector_hdmi layer.
>>>>
>>>> - Drop vc4_hdmi_supports_scrambling() and
>>>>   vc4_hdmi_mode_needs_scrambling() helpers, inlining the remaining 4KP60
>>>>   warning with an explicit drm_hdmi_compute_mode_clock() check.
>>>>
>>>> - Seed connector->hdmi.scrambler_enabled = true in connector_init() to
>>>>   ensure drm_scdc_stop_scrambling() runs at boot and disables any stale
>>>>   scrambling state left by the bootloader.
>>>>
>>>> No functional change is expected for the supported modes.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>
>>> I'd really like it to be broken down into several patches:
>>>
>>>> ---
>>>>  drivers/gpu/drm/vc4/vc4_hdmi.c | 265 ++++++-----------------------------------
>>>>  drivers/gpu/drm/vc4/vc4_hdmi.h |   8 --
>>>>  2 files changed, 35 insertions(+), 238 deletions(-)
>>>>

[...]

>>>> -
>>>> -	/*
>>>> -	 * HDMI 2.0 says that one should not send scrambled data
>>>> -	 * prior to configuring the sink scrambling, and that
>>>> -	 * TMDS clock/data transmission should be suspended when
>>>> -	 * changing the TMDS clock rate in the sink. So let's
>>>> -	 * just do a full modeset here, even though some sinks
>>>> -	 * would be perfectly happy if were to just reconfigure
>>>> -	 * the SCDC settings on the fly.
>>>> -	 */
>>>> -	return drm_atomic_helper_reset_crtc(crtc, ctx);
>>>> -}
>>>
>>> This one doesn't look functionally equivalent to me to
>>> drm_scdc_reset_crtc: this part was, in part, making sure we would only
>>> reset the scrambler if it was enabled in the first place.
>>> drm_scdc_reset_crtc() doesn't and will always trigger a modeset on
>>> hotplug. That's unnecessary and a significant functional different.
>>
>> drm_scdc_reset_crtc() alone was not meant to be an equivalent of
>> vc4_hdmi_reset_link(), as it only checks the sink side and it serves as an
>> internal helper used exclusively by drm_scdc_sync_status().  
>>
>> As a matter of fact, the latter is the one responsible for verifying if the
>> scrambler was enabled on the controller side before attempting to invoke the
>> reset logic, hence we should get the same behavior.  But we don't invoke it
>> directly either, it's part of the drm_atomic_helper_connector_hdmi_hotplug_ctx()
>> call path.
> 
> Oh, right, sorry.
> 
>>> I'd argue that it's drm_scdc_reset_crtc() that needs to align to what
>>> vc4 was doing, not the opposite.
>>
>> The only difference consists in dropping the crtc state check:
>>
>>     ret = drm_modeset_lock(&crtc->mutex, ctx);
>>     if (ret)
>>             return ret;
>>
>>     crtc_state = crtc->state;
>>     if (!crtc_state->active)
>>             return 0;
>>
>> The rationale was that when CRTC is inactive, drm_atomic_helper_reset_crtc()
>> should result in a no-op commit anyway.
> 
> A commit is expensive, so I'd skip it if we can.
> 
>> And the one for the in-flight commit:
>>
>>     if (conn_state->commit &&
>>         !try_wait_for_completion(&conn_state->commit->hw_done)) {
>>             mutex_unlock(&vc4_hdmi->mutex);
>>             return 0;
>>     }
> 
> And yeah, we'll need this one too.
> 
>> Both checks are also missing in drm_bridge_helper_reset_crtc(), taken as an
>> initial reference. Should we still keep any/both and sync the bridge helper
>> accordingly?
> 
> Yes, but I'd expect the bridge helpers to converge / reuse your helpers
> eventually anyway?

Ack.

[...]

>>>> -	vc4_hdmi_disable_scrambling(encoder);
>>>> +	drm_scdc_stop_scrambling(&vc4_hdmi->connector);
>>>
>>> I don't think the names here are right. It's not *only* related to scdc
>>> but also to the HDMI controller. I'm fine with using a scdc prefix but
>>> only for the things related to scdc. This is related (in part) to the
>>> HDMI controller, so it should use a drm_connector_hdmi prefix.
>>
>> Ack. I guess we should also move these helpers out of drm_scdc_helper.c, but
>> unsure where.  FWIW I'm currently working on adding HDMI 2.1 FRL support, and
>> implemented the link training in a dedicated drm_hdmi_frl_helper.c.  
>>
>> Should we create drm_hdmi_scrambler_helper.c?  Or maybe have a common one to
>> hold both - any suggestion for the naming?
> 
> display/drm_hdmi_helper.c sounds like a great place for both?

Indeed, let's move all the stuff there.

>>>>  	drm_dev_exit(idx);
>>>>  
>>>> @@ -1625,6 +1434,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
>>>>  	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
>>>>  	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
>>>>  	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
>>>> +	struct drm_connector_state *conn_state;
>>>>  	unsigned long flags;
>>>>  	int ret;
>>>>  	int idx;
>>>> @@ -1693,7 +1503,10 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
>>>>  	}
>>>>  
>>>>  	vc4_hdmi_recenter_fifo(vc4_hdmi);
>>>> -	vc4_hdmi_enable_scrambling(encoder);
>>>> +
>>>> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>>>> +	if (conn_state && conn_state->hdmi.scrambler_needed)
>>>> +		drm_scdc_start_scrambling(connector);
>>>
>>> And the nice thing with a drm_connector_hdmi_* prefix is that you don't
>>> have to shoehorn it into SCDC support anymore, so you can take a state
>>> as an argument, and do the check in the helper instead of doing it in
>>> every driver and hoping they get it right.
>>
>> I was about to consider a similar approach before deciding to let drivers manage
>> the logic, i.e. to prevent loosing flexibility later when dealing with HDMI 2.1.
>> That was mostly in the context of supporting drivers to define if/when a display
>> mode that fits in TMDS should be sent over FRL. 
>>
>> Thinking again, that's not really a valid concern right now, e.g. will use TMDS
>> by default for all supported modes, and switch to FRL only when absolutely
>> required.  Later we might consider extending the infrastructure to support
>> dynamic control if required.
> 
> Thanks for working on FRL as well :)
> 
> I agree, let's focus on getting HDMI 2.0 right, and then we'll try to
> make 2.1 the easiest to work with for drivers.

Thanks for clarifying the remaining details — I should now have everything I
need to prepare a new revision. :)

Regards,
Cristian

