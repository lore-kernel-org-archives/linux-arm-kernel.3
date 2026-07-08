Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D78C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za77XoxoRqrqyU+Q419qgSjSwUsAQ7GOYPvZ8sXKToc=; b=Vy+vVkXW6Bb+aK9oZqmgIjbTnA
	x+02I1EzJwKkOY+nlzaFVRVJgqjiC07Mo4g0fCsTBhR0pQitE74Q0j+W5d6XuiZBWjEIz3BZDH4NY
	U7EeRP+8gTfnbS+h8d8qSOdchkHnV/2DjxqJY9DMZC3L6PpTuGzP0BKDtmwQZtir/mhGAd3+m+R12
	RxC91V92NmmIFV/pvPuuI4GB6GjV6e38UhTMGSfbN9JWxWALLMkCrTD8VS4vqs4Lb0jNj1meJ1avY
	VHGCa1eJutgE3tuMLKHqulLCLtlSTz1tt5yvj4ptidhv9j1IUOOx2tURWrjnvNRjJi7hIEXIMypV2
	MjEsdY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPG2-0000000GpCA-1kUG;
	Wed, 08 Jul 2026 10:11:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPFy-0000000GpAI-2rZi;
	Wed, 08 Jul 2026 10:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783505511;
	bh=cFQ2g375OyjW4/iTm/OqtKufeHSNNwfoiu9AiHJPVnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M3g4kibiLuxm6q2Zi1pBQsX7i2wlsrrTVZz/vbhiHSg09JcFpfR2ydeWeN56rLPYn
	 WMCIitUOwPxz0s2ibnpYM7b7aryIwxF8NKV/uwlmYGV5DbBTbNt5tSaKJ9NwxNu5wE
	 FaEVRRozyfbJXxi9z87PhxRt2tMrs0hz18/tZGSN702ErA+oar2ONv1IdmNg7FnM3o
	 PRYSJLJxZFnkVw08WEfN06qKboUtVmF7ggp5fKTfQPy75edR7ABSTVn72H0lQ0mgv3
	 i/6rv6WH70g2L/HpwP++BGbEjxbSXfmWiHjnU7OtjJxAjckZ5D4V3hsRPmDFy7DdWN
	 GkTnKOyySiPpw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 834C417E0713;
	Wed, 08 Jul 2026 12:11:50 +0200 (CEST)
Message-ID: <737678ab-f082-4a0e-b453-f403ba141437@collabora.com>
Date: Wed, 8 Jul 2026 13:11:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
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
 <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
 <i4tjtsf5rsckfcayo5nuhlger5wqxn3ujeaubm4g2fgrwvhzb2@hf4uhgq3ja5p>
 <ad75cf26-9437-47d0-864d-d71263401615@collabora.com>
 <20260707-illegal-tuna-of-force-1c06e3@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260707-illegal-tuna-of-force-1c06e3@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031154_906034_5A93DDFE 
X-CRM114-Status: GOOD (  20.30  )
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

Hi Maxime,

On 7/7/26 7:10 PM, Maxime Ripard wrote:
> On Fri, Jul 03, 2026 at 10:31:55PM +0300, Cristian Ciocaltea wrote:
>> Hi Dmitry,
>>
>> Thanks for your quick review!
>>
>> On 7/3/26 5:05 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 02, 2026 at 05:46:15PM +0300, Cristian Ciocaltea wrote:
>>>> In preparation for adding HDMI 2.x source capabilities, introduce struct
>>>> drm_connector_hdmi_caps and a new drmm_connector_hdmi_init_with_caps()
>>>> helper.
>>>>
>>>> The existing drmm_connector_hdmi_init() helper currently takes
>>>> individual capability arguments such as supported_formats and max_bpc.
>>>> Adding more HDMI-specific arguments to that function would not scale
>>>> well, so move those values into a dedicated capabilities structure and
>>>> implement the existing helper as a wrapper around the new caps-based
>>>> interface.
>>>
>>> I think, it was an intention of Maxime: make sure that every driver is
>>> forced to provide some values here. With the struct-based init it is
>>> easy to overlook or to ommit a value.
>>
>> Agreed that the struct-based init loses the compile-time guarantee that every
>> argument is explicitly provided - that's a real downside.  
>>
>> I'd argue it's recoverable, though: the init helper validates the mandatory
>> fields, so a driver that omits a required value gets rejected at init time
>> rather than silently misconfigured.  The "you must provide sane values" property
>> is expected to be preserved, just enforced at runtime instead of by the
>> compiler. 
> 
> Yeah, I don't think we can win with C here. Rust might, but we're
> probably a long way from that.
> 
>> The main motivation for the struct is scalability/maintainability as we add HDMI
>> 2.x capabilities: new fields go into the struct rather than growing the helper's
>> argument list, so existing callers don't need churny signature updates on every
>> extension.
>>
>> FWIW, in the previous revision we discussed addressing the concern with a
>> callback instead.  Sadly, I had to discard that approach, as it proved not
>> flexible enough, e.g. drm_bridge_connector_init() computes caps dynamically, and
>> would have required either stateful callbacks, or storing redundant/temporary
>> cap data in driver-private structures just to satisfy the callback.
> 
> I just realized something reviewing your patch: we don't necessarily
> need an extra argument or a callback, we can just put these fields into
> drm_hdmi_connector_funcs directly, and then validate them in init.

If I understand correctly, we should drop the drm_connector_hdmi_caps struct
introduced by this patch and move all its fields into drm_hdmi_connector_funcs.

In that case, how should we proceed with drmm_connector_hdmi_init()? I see the
following options:

1. Continue with drmm_connector_hdmi_init_with_caps() after removing the caps
   parameter, and then drop drmm_connector_hdmi_init() after the migration.

2. Keep the existing (unaltered) drmm_connector_hdmi_init(), which would be
   slightly inconsistent: supported_formats and max_bpc would still be passed 
   as arguments, while the rest would go through drm_hdmi_connector_funcs.

3. A variation of option 1: additionally rename
   drmm_connector_hdmi_init_with_caps() to drmm_connector_hdmi_init() after the
   migration.

Thanks,
Cristian

