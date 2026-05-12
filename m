Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE0FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFfxIbyksNeEtf5P/BOwbmqUFbMT5NN+UNPslcsX6G8=; b=e2uY2zwW8HgmeXSM0PZf6M1cKZ
	ju9nrJe5cyeb2UXUCCCY6NXvOlxoHU8ueDwVYjJcAnDPfvzwNxt4+b0IGH75hgeR61vauM3OWzRTc
	rrwFdKpVGahsKEIt7Zukfqj/ANeLuaDuXY12t5GVBBeJz6UkwW0SiI4s9D4pLv4YB32Gww3dJdmjg
	yJ6u/BvEJCThF5PUT7ihs2eupzSUmq1iwBs120q8NAlsIx4YvoykSncsXQ1r5o/VbLPmMERPc8Iia
	c+TKET5Q3QS0Y9qDcsrp3hnfwsRhVGjSTzYjyyet/ZbErzIdnjIRi7a3kXms9s3CHncXSUlZxXEvw
	1f+EDHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkpn-0000000GVKu-2ydB;
	Tue, 12 May 2026 10:59:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkpk-0000000GVKA-3uRB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:59:30 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso1774279a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778583568; x=1779188368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFfxIbyksNeEtf5P/BOwbmqUFbMT5NN+UNPslcsX6G8=;
        b=Oh7zx4Ln7Pi70mlHswJXbh7Mw5T7PJ9KlO0X7zOQNrMiTIQ7vBGkPT/9B7lM2OxJFB
         UCkdiJ+p439m66ugmUXwfCsfOhqdCohoyTUo1D4zxX9I4h1NlezhriF9okPUqgeu9+Q/
         0Ffs8YbDh7BFKHqnAo323VhqeITbcg8PYu4iR1Jt69nApVDtWS8hYRVR9pmxITLrcpR5
         RF6GxjVfAf9aBU760oZpExRZhyyvnqTYjZpDaqgHQSIh0I3VzSHa3IW8/21JNxHj9R9x
         wu443otCjmKNXPvUlYzphNVBNylCMyw1klPoTvpLTu6ydd36gG6FGz/RJBnWyHVTWFRv
         d4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583568; x=1779188368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFfxIbyksNeEtf5P/BOwbmqUFbMT5NN+UNPslcsX6G8=;
        b=CUtlawiOg3KTRPg06sWYo/p3XsRh4NYhqpReuyyHSi1WzNchJ4jnOezzTW85sZIM/5
         dWIQJWla8vZM/unY2XLYXgmzvp0ACPvR+UJrGHkhF2JDb+7NU7pj9weNnA+1wzsvZ73y
         e8tsGlsl8bb7+P4apeRYXLS9pViqJEJxP1pjSySdQhiWw6MeusWnO6Wl3id1J5wxXnPn
         1WJzna7SCPHzSyEz+O1jADKBdhjGGmYBuhskSdbXrUr0EL3Yen/Gt1cNqazYwm1QXqt7
         Pglsiktt4p3bvOIOR40jEOBtTXHEnxGiXRPpdJ4CJOcENCXSB3trOOLdxOm3YPQk4fC1
         8dKw==
X-Forwarded-Encrypted: i=1; AFNElJ9deHRTGDe+5Ve1ExBYwcVPquiRWRqtTADdde6VnX6zVQ7Xccg0a94tyRa26ZXHT5A4Dnn5x4thxysVzuD+vzLq@lists.infradead.org
X-Gm-Message-State: AOJu0YywNEj4LWqO0GNB4TtUfMs6Bo0EDSTFYQXZ/dIZ7OXwzex4x4tr
	yT3njvnYQa12yOcjOHYYU1FO42D0AXINEnHu3mLvshO9E58/X8eXDe2H
X-Gm-Gg: Acq92OEGTm2akpjZGp4gJU4thyxnk0QrdkoKwkkFn3qB4QoIZiktFLLzLJr2ACYnEeH
	lcKfWrg5aRcxR8TGlXM811iDabM52EE124rtzjRI8imjPTaRvDNogchBvYs1zbhlom0SmLb28vc
	s92o4pY4UoC8Nwc9Y4GH26x2bZ57Pv/cCQFYeCoKDKHsNuZ2zabjeRqgGmWzjziZqyQzDf7nUnl
	nEiIRG5usyBf4IX2bCdT2u1ZULv5o/tKW3GGKBOUYWMqZeNdjmpUl0YHzgYqpX9BqSquiEn/aWZ
	CY9kxfJBBNX22hz7g1oZUvvJXHbTWmho7AH/MXpylVXUVxtufMIoSEyQGJNybHtCYXL5iXrd/WF
	MjnmphN+ENEsMRKIFhXxT9VnHvLgafb6bpud9s8NR2+5uOvaSw34HeskxTbDO/EX+Efvm4kcSvK
	WFB+CCdzXryDee/UyTTf8iaGM6zxIwaffDAgJsME/Ayl/0471YzyZP+Pq1QJTxhOlP61x75pkKp
	QKv
X-Received: by 2002:a17:90b:3883:b0:368:6998:b49e with SMTP id 98e67ed59e1d1-3686998bc7emr7312294a91.9.1778583567896;
        Tue, 12 May 2026 03:59:27 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm14241837a91.14.2026.05.12.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:59:27 -0700 (PDT)
Message-ID: <1d04dd6d-f245-4b83-96b0-c5491fad8093@gmail.com>
Date: Tue, 12 May 2026 18:59:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/verisilicon: add support for Nuvoton MA35D1
 DCUltra Lite display controller
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-3-a0987203069@gmail.com>
 <93e69179dbc495188cfffd8015350b3a55ce7876.camel@iscas.ac.cn>
 <de35406e-874d-4bdd-be7f-3d74dc37b13f@gmail.com>
 <3b94806073de8bd1d79aa7ec956493f67679e46b.camel@iscas.ac.cn>
 <dfbc4042-64cf-49f2-a5de-12260beffaa0@gmail.com>
 <4bf6efbb222ebc4d770ad613d17c6185e7cb2fda.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4bf6efbb222ebc4d770ad613d17c6185e7cb2fda.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_035928_973098_30EA7D0E 
X-CRM114-Status: GOOD (  24.70  )
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


On 5/12/2026 6:01 PM, Icenowy Zheng wrote:
> 在 2026-05-12二的 17:06 +0800，Joey Lu写道：
>
> ======= 8< =============
>>>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> index 7a93049368db..225af322de32 100644
>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> @@ -164,13 +164,16 @@ static void
>>>>>> vs_bridge_enable_common(struct
>>>>>> vs_crtc *crtc,
>>>>>>     			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>>>>     	regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>>>     			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>>>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>>>> -			
>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>>>> -
>>>>>> 			VSDC_DISP_PANEL_START_RUNNING(output));
>>>>>>     
>>>>>> -	regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>>>> id),
>>>>>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>>>> +	if (dc->info->has_config_ex) {
>>>>>> +		regmap_clear_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_START,
>>>>>> +				
>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>> +		regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_START,
>>>>>> +				VSDC_DISP_PANEL_START_RUNNIN
>>>>>> G(ou
>>>>>> tput
>>>>>> ));
>>>>>> +
>>>>>> +		regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>>>> +				VSDC_DISP_PANEL_CONFIG_EX_CO
>>>>>> MMIT
>>>>>> );
>>>>> Should the commit operation happen on DC8000/DCUltraLite too?
>>>>> (By
>>>>> writing to DcregFrameBufferConfig0.VALID).
>>>>>
>>>>> Many registers written has "Note: This field is double
>>>>> buffered" in
>>>>> the
>>>>> DCUltraLite documentation.
>>>>>
>>>>> I suggest create a static function for commit -- write to the
>>>>> corresponding commit bit on DC8200, and write to
>>>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>>>> [a] There is no commit operation for DCUltra Lite.
>>>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID (BIT(3)) is a
>>>> hardware-managed double-buffer status bit: hardware writes
>>>> 1=PENDING
>>>> when a new register set is ready and clears to 0=WORKING after
>>>> the
>>>> VBLANK copy. Software must never write it, and there is no
>>>> polling
>>>> use
>>> It seems to be writable and controls whether register buffering is
>>> enabled, see [1].
>>>
>>> The description of this bit in MA35D1 TRM says "This ensures a
>>> frame
>>> will always start with a valid working set if this register is
>>> programmed last, which reduces the need for SW to wait for the
>>> start of
>>> a VBLANK signal in order to ensure all states are loaded before the
>>> next VBLANK", which indicates some kind of "committing write",
>>> although
>>> the code at [1] seems to indicate that double buffering is only
>>> enabled
>>> when bit is cleared.
>>>
>>> Anyway this bit should be programmable, and "Software must never
>>> write
>>> it" contradicts with the MA35D1 TRM.
>>>
>>> Thanks,
>>> Icenowy
>>>
>>> [1]
>>> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
>> Thank you for the correction. I'll add
>> `#define VSDC_FB_CONFIG_VALID BIT(3)` to vs_primary_plane_regs.h and
>> write it in `vs_primary_plane_commit()` for non-config_ex variants.
>>>> case in the driver that requires a named constant. For non-
>>>> config_ex
>>>> variants, `vs_primary_plane_commit()` performs no commit
>>>> operation —
>>>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>>>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET` (BIT(4)) is
>>>> set/cleared in the bridge enable/disable paths.
> Well according to the driver code for DC8000 from Eswin, and the bit
> named "VALID", maybe it should be cleared before programming the
> registers, and set after programming registers, to make the process of
> programming registers atomic from the perspective of the display
> controller.
>
> Anyway this should require testing on real hardware to verify.
>
> By the way, I see multiple peripheral drivers for MA35D1 get applied in
> the torvalds tree, but the device tree is still only a skeleton; when
> will the device tree be updated?
>
> Thanks,
> Icenowy

Thanks for pointing this out. I’ll perform tests on real hardware since 
I haven’t used this bit before.

As for the device tree, we plan to update it comprehensively after 
completing several major IPs, with the goal of releasing the update 
later this year.

>>> ========= 8< ==========
>>>

