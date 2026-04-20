Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8170F36C5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQmlMRCR3jRB12yeVes2W0+WOJzVX7e+Ho+WesUUC+U=; b=JWZHnCEclvJ00FmK30GwvLYGo/
	mcHLW1lwkLOvcU2d/nlEnGwqtZ4vA51grnoH4A9wDny7s387bYc1t5cbe4Esie8IKdrjuMe2B97P9
	2xRFZAXcHIK1wK1a3BxQNyIwHR/PqEFP6l2+67F8UPWMcHslf+AtbM4h5iyb1qTmde1rNyOUMcXeV
	IPlOPZLpPKbNI9AI3hYCNLsI6Oh9JsUc1TLal+IWSPzkcFhEIgxFT5RIcmR/AJ1YILuqgBDTETrhP
	ZyaXcYknvWMghzsBHJsSWtfCaoJCWQCSod2YR95KXE5Qa7W2BWii3ygPJyGtCcCwLN6EbqdorAksR
	fWjEzRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnAW-00000006p06-0i54;
	Mon, 20 Apr 2026 11:52:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnAT-00000006ozS-1Me5;
	Mon, 20 Apr 2026 11:51:58 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AC462451;
	Mon, 20 Apr 2026 13:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776685817;
	bh=Uj43gvxABQWLIrStRddWS7MNYGB+8ufSczMe2ZWKRR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kbqgEp8qfmaABuyz8o4+tz3ZxkCRqnCDoNhgOWtkcu5TeIcyz5caIsXWreGwN4wfM
	 6BsxqcL8/8ACPJ37j4d3Vu2QnCV+o1n8Jn6oTRHIVgrtQI9/f2ZBLtGcVVzKCoU94B
	 GWx/HhsBWfufDywWK/v7i1LaHHABg3vl/L4miqdk=
Message-ID: <ac330f76-24dc-4f6b-aeaf-69176eb41298@ideasonboard.com>
Date: Mon, 20 Apr 2026 14:51:49 +0300
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
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
 <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
 <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
 <v7h3a5pwx32dfcumc3diysylja6lhkhobyzemfthb6dsadcxnp@2kkidnsgov4e>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <v7h3a5pwx32dfcumc3diysylja6lhkhobyzemfthb6dsadcxnp@2kkidnsgov4e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_045157_562601_4D4807D9 
X-CRM114-Status: GOOD (  37.20  )
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

On 20/04/2026 14:45, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 02:01:57PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 20/04/2026 12:50, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
>>>> Hi,
>>>>
>>>> On 18/04/2026 01:32, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 16/04/2026 02:22, Dmitry Baryshkov wrote:
>>>>>>> The DisplayPort standard defines a special kind of events called IRQ.
>>>>>>> These events are used to notify DP Source about the events on the Sink
>>>>>>> side. It is extremely important for DP MST handling, where the MST
>>>>>>> events are reported through this IRQ.
>>>>>>>
>>>>>>> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
>>>>>>> events are ported through the bits in the AltMode VDOs.
>>>>>>>
>>>>>>> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
>>>>>>> events to the DisplayPort Sink drivers.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/drm_connector.c          |  4 +++-
>>>>>>>      drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
>>>>>>>      include/drm/drm_connector.h              |  3 ++-
>>>>>>>      3 files changed, 13 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>>>>>> index 47dc53c4a738..5fdacbd84bd7 100644
>>>>>>> --- a/drivers/gpu/drm/drm_connector.c
>>>>>>> +++ b/drivers/gpu/drm/drm_connector.c
>>>>>>> @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>>>>>>       * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>>>>>>       * @connector_fwnode: fwnode_handle to report the event on
>>>>>>>       * @status: hot plug detect logical state
>>>>>>> + * @irq_hpd: HPD pulse detected
>>>>>>>       *
>>>>>>>       * On some hardware a hotplug event notification may come from outside the display
>>>>>>>       * driver / device. An example of this is some USB Type-C setups where the hardware
>>>>>>> @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>>>>>>       * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>>>>>>       */
>>>>>>>      void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>>>>>>> -				     enum drm_connector_status status)
>>>>>>> +				     enum drm_connector_status status,
>>>>>>> +				     bool irq_hpd)
>>>>>> I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
>>>>>> with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
>>>>>>
>>>>>> Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
>>>>>> If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
>>>>>> 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
>>>>>> for both short and long ones (although in the kernel doc you just write "HPD
>>>>>> pulse")... The kernel doc could be expanded a bit to make it clear what this
>>>>>> flag indicates.
>>>>>
>>>>> I attempted to stay away from defining a DP-specific flag, keeping it
>>>>> generic enough. HDMI is pretty close (IMO) to requiring separate flag in
>>>>
>>>> If it's not specifically the DP IRQ HPD, then we need to define what it
>>>> means. I tried to think what it would mean with HDMI, but I didn't come up
>>>> with anything.
>>>
>>> I might be mistaken, but I had someting like HEAC HPD / EDID status
>>> changes in mind (or HDCP-triggered HPD status changes). But here I
>>> admit, I hadn't checked if it is actually applicable or not.
>>
>> Possibly, I'm not familiar with those.
>>
>>> Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
>>> to abstain from defining someting as DP-only in the top-level API.
>>
>> I'm fine with that, but then it really has to be defined =).
>>
>>>>> Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
>>>>> in the VDO rather than a pulse.
>>>>>
>>>>> Anyway, if irq_hpd doesn't sound precise enough, what about "bool
>>>>> extra_irq"? This would convey that this is the extra hpd-related IRQ,
>>>>> but it would also be obvious that it's not related to the HPD pin
>>>>> itself.
>>>> We'd still need to define what exactly it means. I think it might be better
>>>> to just define it as the DP IRQ HPD, as then the meaning is clear.
>>>>
>>>> Also, would an enum flags parameter be better than a bool parameter?
>>>
>>> Maybe not enum, but u32 param. Then it can become:
>>>
>>> @extra_status: additional type-specific information provided by the sink
>>> without changing the HPD state
>>>
>>> void drm_connector_oob_hotplug_event(..., u32 extra_status);
>>>
>>> /* DP short HPD pulse or corresponding AltMode flag */
>>> #define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
>>> /* DP long HPD pulse, debounced XXX: do we need this? */
>>> #define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)
>>
>> Why is u32 better than enum? So that we could e.g. pass short values inside
>> the extra_status?
> 
> No, my thought was to be able to define values specific to the
> particular connector types and to be able to combine those values.
> 
> After sending the email I started thinking about the bridged and
> corresponding notifications. There having overlapping values will not
> work becasue bridges in the chanin don't easily know the final connector
> type.

An enum can have overlapping values. I don't think there's much 
difference between u32 and an enum in C. I just like enum because 1) it 
groups the possible values in the header file, and 2) the function 
parameters can use the enum type, making it obvious what flags you are 
supposed to use there.

> I think you are correct here, it should be the enum. With the first
> iteration defined as:
> 
> /**
>   * enum drm_connector_status_extra - additional events sent by the sink
>   * together or in replacement of the HPD status changes
>   /
> enum drm_connector_status_extra {
>    /**
>     * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
>     * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
>     */
>    DRM_CONNECTOR_DP_IRQ_HPD = BIT(0),
> };
> 
> /**
>    * @extra_status: additional information provided by the sink without
>    * changing the HPD state (or in addition to such a change). It is an
>    * OR of the values defined in the drm_connector_status_extra enum.
>    */
> void drm_connector_oob_hotplug_event(..., u32 extra_status);

Looks good to me, except I'd use "enum drm_connector_status_extra" 
instead of u32 there in the function parameters.

  Tomi


