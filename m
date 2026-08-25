Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CD0C61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfx4ztOozT8o+3EG/K4NfW6koF1CGug2hWTu8MgSYVQ=; b=QSFAGZ5Z8BFhvTrPFQgBkB+qke
	NZDjMvMqA2/j00+YhdoNx08X51V/k6cEudJlygTi7Gix5+mhYZ5sK6aHlMnPDbnLN3tkZzdGOUYNa
	vy3DQliurxeUZox3T5Xy/kUzqHWEXs0oC7fcmAC6SWqdHBOly9j4sPCSBZnk8b3VnxO5twqjhQU0t
	GvQ7EAU7GYNU3VdJmVHva4CslU3kqhLO35lZ3AJhsRTBYGtnbdqys6KsaRIvoIBThpRgp26dDj0rc
	zPmIUoAdwrSRUOk038c+L/1FhA6c53wqwcy3vlS4FzuKgds50oLpHn+L0AX5KwEh3THkbPScwJxc9
	TvnpJlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoMd-00000000bPQ-1Dep;
	Tue, 25 Aug 2026 10:26:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoMZ-00000000bOe-2VTX;
	Tue, 25 Aug 2026 10:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787653591;
	bh=wdwDOSk5hX6BER010tdloX7TyIracwF8Sfqo/V+QHdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bTxbJf5fS32zFSecAaSleGRbfLnJKIjWUgmVnz7TLVMEdem/S0w4d6UBoDPhm7sUg
	 mnbrQwdKnlIrP8veP+1xkVGKCZQ/843/WX01n1joRiW7rUcazDBFpTMKVSSQa0cPu8
	 PJpjvsxkgYEB+mJNjIFPRkHY2SU44/hj+RhStHRgzT/0+NPGiPcByxBQwWC5CDdXnb
	 WZx8cpQTFBQnEgRU8Vy+1yObkV3UmLsFQEEo0xNhsEE0K+Or+DRJAggCo8mQgJ8b91
	 NMGSVeP6wkjJ0gPx2tqvWqOgtmLZGvxpg4/8ZMacCPZ1/bYYw7dfOaO/J1T2w/pYjE
	 ktV6450DXU1Pw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E097D17E084E;
	Tue, 25 Aug 2026 12:26:30 +0200 (CEST)
Message-ID: <0e66c987-866a-4166-a850-14e7d03ea69f@collabora.com>
Date: Tue, 25 Aug 2026 13:26:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 22/69] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Maud Spierings <maud_spierings@hotmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-22-294364b2cf15@collabora.com>
 <20260820-accomplished-curly-bandicoot-cc36ba@houat>
 <774c38bd-6569-4aff-9fbc-a4e017840a55@collabora.com>
 <20260825-potoo-of-imaginary-unity-7b0999@penduick>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260825-potoo-of-imaginary-unity-7b0999@penduick>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_032639_816030_F373CD33 
X-CRM114-Status: GOOD (  28.08  )
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

On 8/25/26 12:25 PM, Maxime Ripard wrote:
> On Thu, Aug 20, 2026 at 05:44:08PM +0300, Cristian Ciocaltea wrote:
>> On 8/20/26 11:53 AM, Maxime Ripard wrote:
>>> On Fri, Jul 31, 2026 at 07:19:29PM +0300, Cristian Ciocaltea wrote:
>>>> drm_atomic_helper_connector_hdmi_hotplug() does not currently
>>>> synchronize SCDC status on hotplug events, leaving the scrambler state
>>>> potentially inconsistent after (re)connect.
>>>>
>>>> Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
>>>> paths, replacing the existing TODOs around missing scrambler handling.
>>>>
>>>> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>>>> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 23 ++++++++++++++---------
>>>>  1 file changed, 14 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>>> index 4a93c279c9a7..3377ea936120 100644
>>>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>>> @@ -1205,13 +1205,16 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
>>>>  					enum drm_connector_status status)
>>>>  {
>>>>  	const struct drm_edid *drm_edid;
>>>> +	int ret = 0;
>>>>  
>>>>  	if (status == connector_status_disconnected) {
>>>> -		// TODO: also handle scramber, HDMI sink disconnected.
>>>> -		drm_connector_hdmi_audio_plugged_notify(connector, false);
>>>> -		drm_edid_connector_update(connector, NULL);
>>>> -		drm_connector_cec_phys_addr_invalidate(connector);
>>>> -		return 0;
>>>> +		ret = drm_connector_hdmi_sync_scdc(connector, false, ctx);
>>>> +		if (ret != -EDEADLK) {
>>>> +			drm_connector_hdmi_audio_plugged_notify(connector, false);
>>>> +			drm_edid_connector_update(connector, NULL);
>>>> +			drm_connector_cec_phys_addr_invalidate(connector);
>>>> +		}
>>>
>>> If there's a deadlock, shouldn't we restart the whole sequence there?
>>
>> In that case we do already propagate -EDEADLK and let the callers
>> (drm_helper_probe_detect_ctx(), drm_helper_probe_single_connector_modes())
>> to ensure the sequence is restarted.
>>
>>> Ie, we should return ret all the time anyway? And if we do that, we
>>> should return ret for drm_edid_connector_update() too.
>>
>> Per .detect_ctx() contract, implementations shall return a drm_connector_status
>> value or -EDEADLK only.  On the other hand, .force_ctx() accepts any error code,
>> but the probe helpers just log it.  Hence returning anything else wouldn't
>> really have an impact on the functionality.
>>
>> Returning errors from drm_edid_connector_update() would potentially override
>> non-deadlock ones from sync_scdc().  Since both helpers already log their own
>> failures, I think it isn't worth the trouble.
>>
>>> Either way, a comment on why we're doing it this way would be nice.
>>
>> Indeed.  Would the following be too verbose?
>>
>> /*
>>  * The SCDC resync may reset the CRTC, which might involve aquiring
>>  * modeset locks.  If that fails, -EDEADLK is reported and the callers
>>  * passing a non-NULL @ctx drop the locks and restart the sequence
>>  * - see drm_helper_probe_detect_ctx() and
>>  * drm_helper_probe_single_connector_modes().
>>  *
>>  * The resync runs first, and the audio and CEC helpers only once the
>>  * link state has settled: the CRTC reset is a blocking commit, so on
>>  * success the pipeline is already up again, while on -EDEADLK nothing
>>  * has been resynced yet and the pending retry redoes everything.  This
>>  * keeps userspace from acting upon a link that is about to be reset.
>>  *
>>  * -EDEADLK is the only status gating the helpers below, as it is the
>>  * sole one guaranteeing a new run.  The other failures are merely
>>  * reported: .force_ctx() accepts any error code and the probe helpers
>>  * just log it, while .detect_ctx() has to swallow it, being only
>>  * allowed to return a drm_connector_status value or -EDEADLK.
>>  * Propagating the status of drm_edid_connector_update() on top would
>>  * therefore only make it compete with an earlier resync failure over a
>>  * value that triggers no recovery, the more so as both helpers already
>>  * log their own errors.
>>  */
> 
> You can tell your LLM to be more terse :)

That's actually the shortened form :-)

> 
> Something like the following would be enough:
> 
>   /*
>    * detect_ctx can only ever return an status or EDEADLK. Handle deadlocks, and report any !EDEADLK error.
>    */
>   ret = drm_connector_hdmi_sync_scdc(connector, false, ctx);
>   if (ret)
>      if (ret == -EDEADLK) {
>      	return ret;
>      } else {
>        drm_warn(connector->dev, "ignored error");
>      }
> 
>   drm_connector_hdmi_audio_plugged_notify(connector, false);                                                                                                                                                                                                    
>   ret = drm_edid_connector_update(connector, NULL);
>   if (ret)
>        drm_warn(connector->dev, "ignored error");
>   drm_connector_cec_phys_addr_invalidate(connector);                                                                                                                                                                                                            

Ack.

Thanks,
Cristian

