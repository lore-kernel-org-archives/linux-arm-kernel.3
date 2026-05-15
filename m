Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D665CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 06:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4wG8bH1gfDBcb14JbvmcrOJGC7+5HB1bq/2ymPAYSI=; b=ft6uxQUM1hniqEoZdiMFpfv9Kg
	pBVPrSF/r7uP7C4zbFONbjCy8C5PhKYmYjwNyddPa2/4GK7MEYNIWRSZiNt88hZ0uh10q7DBVtsk8
	LaispkHH2VsV3wmIC4+1Al33e2HEMjn2G5X2a057oOKDj0TJ5sHMAGu0fXktvv9orb1IUn3OpO7rg
	dqyfgzavfUF4n4KTifpBWXqL/YZYuVa9TGmtiDg2hIHwEcDW1q7RrBMmJtw/++8pC9x3Dp+q5z4P7
	z467pHm57ZGMo+/4XqhVTNFamGpvxCqnKk+1rWgBI+SlCRlMtEY4SN2O8MXXzIclPMSZ9Hn7oFqRI
	Eo+NKqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlzk-00000007VYc-02oy;
	Fri, 15 May 2026 06:26:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlzg-00000007VXt-2RgP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 06:25:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c828daf83e2so2791335a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778826355; x=1779431155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4wG8bH1gfDBcb14JbvmcrOJGC7+5HB1bq/2ymPAYSI=;
        b=bIY78eEpifsLUSJor8f9uKkYGlR05PMOc3e5Gnr0p2178nSPWCxKUmJ/vPiyyyND15
         wSG4hE4ZqkG5U+QjT01ot3AfpgRXQTbOQdquXWDHTihpMibrdE9rm10BYTnDnUwaQ9Ht
         dYkHl9rKwzZ6B+Pij47lNzfA5Nad6tfny/3CMfhGx2v5VgRGFigitJYrACjugvKN4Ihr
         YkZT1oJclbsDejaupVZjPXknleRvCopcYdbehNSdes0yvm1ZlpkEnywWYyWztm/mcJQH
         I8zNMtz858QsbrSIbET5Znk+mJIt8OUIr7A/M2bFGonTDIX+OD9Cuv6TID4/7gLdYpU4
         x3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826355; x=1779431155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4wG8bH1gfDBcb14JbvmcrOJGC7+5HB1bq/2ymPAYSI=;
        b=ik1S8WE3kWjR09uEWRWb6k+0n/sPu5eOylBC1UdHfdx8XgeRn6TAJgd+Fb23/B3ert
         Lp5cgysbh7MeQMl8ESBpLg7oAs5OFbfX2rKotbmT4UVfylU4iSVBAcno8rTb2jOiOWAv
         yR/Q+toCXGSvL5W6N6LhA7zBY2PPE2SDFyJ1Zg8Y1iATsGLvBVADioFjjPCKPje31EKC
         0+2nI78yT376Fs+khbm0gzMJnBt9YIxyYvZYgtoldR0QTFbF5CJJgtwUdCjFc5zowsQj
         saGh5VGC3g2ulNI4Abh4MKVxaKb6J4vugFe60Vurv89mSxeVKptm8VDuVSq4xaPoqt5C
         oS2w==
X-Forwarded-Encrypted: i=1; AFNElJ+lAXbiRg1lwbBr7CJVVPr5FmaDWKrihi1JzfuzaGRtuvHa/d+Hl00ptCGHI+Ki10ASJMf1wZB0US7xwaiC651A@lists.infradead.org
X-Gm-Message-State: AOJu0YwSLBIfglq2hTsA3/MKeVNQAyblmoXL/hcQaGIiZYNgvVD9oNU3
	T6KKURCTMWeXkJZL6IH8DYiDfaiLX7iKb03ZCtetuNbyJ5tJjFr+UHWu
X-Gm-Gg: Acq92OE8RoL063ZsQSXbe5CtZYKlcNbQBpxMITz1VCYFhMv8f2kpti8Pt/0HrN9khZ3
	9JC0AN6b74QTDupnIojhI5houFYHknNO/eJ/wM5ERF3PmNzutGKG/gj8GKnH0CZCoqqavPvA90n
	6OLpmOR13mxoHhdBwxo5Vd4l2K2NhtKMED3CWiKvrwEHGbP0xsbEzFkaprKFnZBawe4bnOwSia9
	TonnobEa4bnPORnyZhPx0Ekv4gfRVH6owDehWlkijk6oT2pbb2QkYVum8klmTgRdH3Jh+vfRIf4
	fg6dE3H0fMzxpdk14bx4fvg5snaQWe4xRBly7RCBZp2koCsov51wLG5bwUkuGn5jIqELTL9jswx
	GWq7MIGOtRnFHrrZpaqzcpEUW5wFpx/hSHlLcixKw30jVK0kNLdmD1X9QyowHAdJxAQwWjoywmt
	UZi7lkgeRrg3r/2cFwCaG0phbBm5b+G/CFCme4gc+WlL20U6QTOM/JloDSRtk76Gg6hZyYcYA4K
	xZB
X-Received: by 2002:a05:6a20:560c:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3b22e72fb16mr2125835637.14.1778826355136;
        Thu, 14 May 2026 23:25:55 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm4688486a12.20.2026.05.14.23.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:25:54 -0700 (PDT)
Message-ID: <1a42a168-1dbb-467e-9053-b5585a737f71@gmail.com>
Date: Fri, 15 May 2026 14:25:48 +0800
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
 <1d04dd6d-f245-4b83-96b0-c5491fad8093@gmail.com>
 <76a9e9b676509e85484a1eb31c723b46c7e21a19.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <76a9e9b676509e85484a1eb31c723b46c7e21a19.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_232556_634854_12B4865D 
X-CRM114-Status: GOOD (  26.70  )
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


On 5/12/2026 9:12 PM, Icenowy Zheng wrote:
> 在 2026-05-12二的 18:59 +0800，Joey Lu写道：
>> On 5/12/2026 6:01 PM, Icenowy Zheng wrote:
>>> 在 2026-05-12二的 17:06 +0800，Joey Lu写道：
>>>
>>> ======= 8< =============
>>>>>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> index 7a93049368db..225af322de32 100644
>>>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> @@ -164,13 +164,16 @@ static void
>>>>>>>> vs_bridge_enable_common(struct
>>>>>>>> vs_crtc *crtc,
>>>>>>>>      			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>>>>>>      	regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>>>>>      			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>>>>>> -	regmap_clear_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>> -			
>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>>>>>> -
>>>>>>>> 			VSDC_DISP_PANEL_START_RUNNING(ou
>>>>>>>> tput));
>>>>>>>>      
>>>>>>>> -	regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>>>>>> id),
>>>>>>>> -
>>>>>>>> 			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>>>>>> +	if (dc->info->has_config_ex) {
>>>>>>>> +		regmap_clear_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>> +				
>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>> +				VSDC_DISP_PANEL_START_RU
>>>>>>>> NNIN
>>>>>>>> G(ou
>>>>>>>> tput
>>>>>>>> ));
>>>>>>>> +
>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>>>>>> +				VSDC_DISP_PANEL_CONFIG_E
>>>>>>>> X_CO
>>>>>>>> MMIT
>>>>>>>> );
>>>>>>> Should the commit operation happen on DC8000/DCUltraLite
>>>>>>> too?
>>>>>>> (By
>>>>>>> writing to DcregFrameBufferConfig0.VALID).
>>>>>>>
>>>>>>> Many registers written has "Note: This field is double
>>>>>>> buffered" in
>>>>>>> the
>>>>>>> DCUltraLite documentation.
>>>>>>>
>>>>>>> I suggest create a static function for commit -- write to
>>>>>>> the
>>>>>>> corresponding commit bit on DC8200, and write to
>>>>>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>>>>>> [a] There is no commit operation for DCUltra Lite.
>>>>>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID (BIT(3))
>>>>>> is a
>>>>>> hardware-managed double-buffer status bit: hardware writes
>>>>>> 1=PENDING
>>>>>> when a new register set is ready and clears to 0=WORKING
>>>>>> after
>>>>>> the
>>>>>> VBLANK copy. Software must never write it, and there is no
>>>>>> polling
>>>>>> use
>>>>> It seems to be writable and controls whether register buffering
>>>>> is
>>>>> enabled, see [1].
>>>>>
>>>>> The description of this bit in MA35D1 TRM says "This ensures a
>>>>> frame
>>>>> will always start with a valid working set if this register is
>>>>> programmed last, which reduces the need for SW to wait for the
>>>>> start of
>>>>> a VBLANK signal in order to ensure all states are loaded before
>>>>> the
>>>>> next VBLANK", which indicates some kind of "committing write",
>>>>> although
>>>>> the code at [1] seems to indicate that double buffering is only
>>>>> enabled
>>>>> when bit is cleared.
>>>>>
>>>>> Anyway this bit should be programmable, and "Software must
>>>>> never
>>>>> write
>>>>> it" contradicts with the MA35D1 TRM.
>>>>>
>>>>> Thanks,
>>>>> Icenowy
>>>>>
>>>>> [1]
>>>>> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
>>>> Thank you for the correction. I'll add
>>>> `#define VSDC_FB_CONFIG_VALID BIT(3)` to vs_primary_plane_regs.h
>>>> and
>>>> write it in `vs_primary_plane_commit()` for non-config_ex
>>>> variants.
>>>>>> case in the driver that requires a named constant. For non-
>>>>>> config_ex
>>>>>> variants, `vs_primary_plane_commit()` performs no commit
>>>>>> operation —
>>>>>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>>>>>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET` (BIT(4))
>>>>>> is
>>>>>> set/cleared in the bridge enable/disable paths.
>>> Well according to the driver code for DC8000 from Eswin, and the
>>> bit
>>> named "VALID", maybe it should be cleared before programming the
>>> registers, and set after programming registers, to make the process
>>> of
>>> programming registers atomic from the perspective of the display
>>> controller.
>>>
>>> Anyway this should require testing on real hardware to verify.
>>>
>>> By the way, I see multiple peripheral drivers for MA35D1 get
>>> applied in
>>> the torvalds tree, but the device tree is still only a skeleton;
>>> when
>>> will the device tree be updated?
>>>
>>> Thanks,
>>> Icenowy
>> Thanks for pointing this out. I’ll perform tests on real hardware
>> since
>> I haven’t used this bit before.
>>
>> As for the device tree, we plan to update it comprehensively after
>> completing several major IPs, with the goal of releasing the update
>> later this year.
> Well I bought a MA35D1 board (MYIR MYB-LMA35 + RGB LCD) earlier this
> year (and this is where I got the MA35D1 identification register
> values). Hope I can have a chance to test this driver by myself.
>
> As MMC, Ethernet and USB support is all applied, maybe it's already
> worthy to update the device tree ;-)
>
> Thanks,
> Icenowy

Yes you can!

I have performed hardware validation on the MA35D1 and found that this 
bit acts as a manual latch for the shadow registers rather than an 
auto-clearing trigger, which clarifies the slightly ambiguous 
description in the TRM.

Following your suggestion, I will align the implementation with ESWIN's 
DC8000 logic: setting the VALID bit at atomic_begin and clearing it at 
atomic_flush. My tests confirm this allows the hardware to latch the 
plane configuration correctly while avoiding the blank screen issues 
observed with other configurations.

I am preparing the v2 patchset with this change, along with the 
requested commit splits, and will submit it shortly.🙂

>>>>> ========= 8< ==========
>>>>>

