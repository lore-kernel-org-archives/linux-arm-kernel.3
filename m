Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1824EA71BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 04:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbZP3ug2EwbGMhwVKjQovHIOnNmz8nAPKjABkE+UcX8=; b=Rm1X2DyQJaOiXJF+GUF4fL02dL
	Yrt5gWiXnEfGhLVtbFgnVu3cFHY577hbe64EfPIFirwhT1loxSl3PEi6+KgwEcCu5qYzjosaUSsV0
	hzPEWt1bvfLLJUGuPXOHgBF3fZbUr9o3LT9p3E6BFxLjGRuvRUNH5W5pmczljLtfcBIWiR85M6k5z
	bNC//kRY+ztWDYHuctFcaiOSFrwfOP0BKFtWJdogVrNAj2lK7/aokuMQpaHidOyGABAFggAwp1gVT
	EM47Eoznzuc7bMTbKLr7bu36bTWwnu6x3RLcaRmOkzJzLYyhQp12OyApKaS8DaAeOijCYyO7ObMNS
	uQyJgIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgb6-00000006Pvx-3dsH;
	Mon, 20 Apr 2026 04:51:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgb2-00000006PvV-3Bp4;
	Mon, 20 Apr 2026 04:50:58 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF9D778C;
	Mon, 20 Apr 2026 06:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776660554;
	bh=iwh3N+VethXilsaJ64nNuyiBXMJyYXgfop2Jfia4Qv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmYidhQJFff1Jy2JNWzkMs/4kz+pEMeZH1/ioKbzV/uchyIkn9+05FEWUXLnWC8Vs
	 QcM0jmCS1SJ7AfsP6G+9nT1W0hvFAwPxDaaDadIXwF1BdzgdVgUA2jyoHdbwIOK8ma
	 xdDODxQATbV0t+7b6dsvrTR3c1l8ydq0EsPQejfk=
Message-ID: <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
Date: Mon, 20 Apr 2026 07:50:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_215057_096201_1D9E6EB6 
X-CRM114-Status: GOOD (  25.28  )
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

Hi,

On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 16/04/2026 02:22, Dmitry Baryshkov wrote:
>>> The DisplayPort standard defines a special kind of events called IRQ.
>>> These events are used to notify DP Source about the events on the Sink
>>> side. It is extremely important for DP MST handling, where the MST
>>> events are reported through this IRQ.
>>>
>>> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
>>> events are ported through the bits in the AltMode VDOs.
>>>
>>> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
>>> events to the DisplayPort Sink drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/gpu/drm/drm_connector.c          |  4 +++-
>>>    drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
>>>    include/drm/drm_connector.h              |  3 ++-
>>>    3 files changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>> index 47dc53c4a738..5fdacbd84bd7 100644
>>> --- a/drivers/gpu/drm/drm_connector.c
>>> +++ b/drivers/gpu/drm/drm_connector.c
>>> @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>>     * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>>     * @connector_fwnode: fwnode_handle to report the event on
>>>     * @status: hot plug detect logical state
>>> + * @irq_hpd: HPD pulse detected
>>>     *
>>>     * On some hardware a hotplug event notification may come from outside the display
>>>     * driver / device. An example of this is some USB Type-C setups where the hardware
>>> @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>>     * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>>     */
>>>    void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>>> -				     enum drm_connector_status status)
>>> +				     enum drm_connector_status status,
>>> +				     bool irq_hpd)
>> I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
>> with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
>>
>> Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
>> If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
>> 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
>> for both short and long ones (although in the kernel doc you just write "HPD
>> pulse")... The kernel doc could be expanded a bit to make it clear what this
>> flag indicates.
> 
> I attempted to stay away from defining a DP-specific flag, keeping it
> generic enough. HDMI is pretty close (IMO) to requiring separate flag in

If it's not specifically the DP IRQ HPD, then we need to define what it 
means. I tried to think what it would mean with HDMI, but I didn't come 
up with anything.

> Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> in the VDO rather than a pulse.
> 
> Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> extra_irq"? This would convey that this is the extra hpd-related IRQ,
> but it would also be obvious that it's not related to the HPD pin
> itself.
We'd still need to define what exactly it means. I think it might be 
better to just define it as the DP IRQ HPD, as then the meaning is clear.

Also, would an enum flags parameter be better than a bool parameter?

  Tomi


