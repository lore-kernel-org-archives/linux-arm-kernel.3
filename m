Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5667DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDBlcreApT69nD2JDPHGYA71d8rTboSMPdYxDM3luXk=; b=422AXFXL56gEROpGW2Qe8agaMX
	3Um+Oc8LERy9XC7dmcnWp4CZYS6K6NS0+MHPW5AI6FRJR4i0EfwQ1Z2bsQAym1V4gsVQ6MGKPlbM8
	bmxcbsKxeEMlQRFCTbmLyyz64joDqDZmYHA8QZBt/nX4gZultHH6TwYdqSHk1e/NBN+8NV0atJ86v
	n+LmMiN/LMzaNT1n2F2bJtLqHV7VukSYoqGM1dl6sfMh4yF7W6Q8/BJyzIVs/Hzv9QjhITMfBOmbg
	bfzFJqK869RijxffGoeUPgKkld/SArLGyYKQ6Cc+TpWdfswSqy1UDqHbzzA3vSkBUPYEfFbBTHWbO
	ibGVryuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoX4-00000007qaZ-3yXS;
	Fri, 15 May 2026 09:08:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoX2-00000007qZu-2dWP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:08:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bc7b311e77so3283245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778836112; x=1779440912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDBlcreApT69nD2JDPHGYA71d8rTboSMPdYxDM3luXk=;
        b=LgHXup1hbTJf5sPLsdnrubQPSM5PrJq/to/0dlq7eCDfVxUmcIHjmG7IXRcaWDX5dV
         sfLy9Qx7zyHP/TBroVDxq+o/R7TEezLckbJrRg1MgnRIdaGixc5/Hvn0Dsln2+LS8pvk
         JlojpIes3e7BS4yNKHlC8ZfveP5EuW7m4coq8Ho7Om6UuTTtCzI+SCS04YBDHOH2e+IA
         yZNE+k/Rn8XnNdqLfONq58SjHYUvih4y8SZ0HPK1+5KwrA9LlQ801A2QyJaXMAKXQ1MS
         O/4jHomhKbmaPZJJb0W76dPi5JlcSAv1uDiPVGLUnjaXkESTvXIL9ds4KZMDbcn+CZGn
         Egbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836112; x=1779440912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDBlcreApT69nD2JDPHGYA71d8rTboSMPdYxDM3luXk=;
        b=gyUhIocuaEQ3O4esjKXKxF9VxhjvDeUcnEFTMHospl9K4uf8w9FH2E+wZqvqZC/5eN
         bnEVwwrabHD6luSHEmHrtpJugt3mzWQlAUpA5osJOyEc9AwcMskylBeYVSAT+XaICT8t
         viwoVGNGW9RYO+bjV2rGKaim2eRaNmYyq7j0TfqIW2dazoWCAwtT7q/2teCc9oa3uOAk
         N8m8UY/ib86K+oT48C1kNk+MuufjsvIHFDj3/gfnBDATIZGqsZ8yKsoOuHjnYre51cpI
         XwhYLmoxrMbdyZl2xRL6SbCA1fOF9+WfeZPyrYvESdWc6OS6TvoRMJ2CvnVtofjxs23X
         aKdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XSM1sLlW9lcCLmYHmlSXH8lMl1MR9IJerXPhXsQpGQJChMEf7GitmxYOThtqxaFLwTweZjXv/0o7IgiN8BDpZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwF/7dMYrEqwQHxWK5xFRph7jAc/dyvin6BQnIKUObhQsrJ3vA/
	FKg5zFw5YQqc4sn7ItzhCTtvYRLRyNnPF8772+eMtbw40tYw2hQ9yRq+
X-Gm-Gg: Acq92OGp6KKMVxmVo/EBWNF3bmOijd9pGHA1ymj3QlCNnxWqC29UGu1YJdidINQL0SN
	GIdk4zdQWj3N4YNn5JWjFPAH55XsXecR1XYXzU08BHDIreCFGoa4TV8qesHFs16V9EdSO8GYS/f
	25z8pKpX31LjD7cql246tu8WGAFR1JYJ9MT5Jh2cjCyOVjEMEOjWIcuGXljxrB0XKW9JBlmrXDh
	MAYv4jqsp/MsQGgrMzNafAiIZxWw/KYvcGDt7+L6FuiMM0BaI8Nnu2jdP9GcL+onOWo/P769LOo
	qjHfgc0K4I1BRiiB5gu7utqJlJCCdRLX3+ropIj+44K8VZzhYzGiIZZQ137nzY/va0rV0KoD0B2
	r2RFFrw9t94rNhzWqdB4Ae2Gu0LRMrlSFaA7IJIQ66uUqwsODQeAV9Ca40U6oF6I4h4genT9vUb
	OA7GYvIBu21bS6GF4FHiP54ls12DqSbJI6vL+0P7JIQ8LViwUU+BDX0JYyA2javng7ElyGMJz4N
	HnDtaA4PdvnIsM=
X-Received: by 2002:a17:903:46c7:b0:2bc:dca9:f0ed with SMTP id d9443c01a7336-2bd7e9249a5mr28348315ad.15.1778836111714;
        Fri, 15 May 2026 02:08:31 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm55522125ad.65.2026.05.15.02.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:08:31 -0700 (PDT)
Message-ID: <520e1683-6d5c-4e1f-8811-0ef78cf8d605@gmail.com>
Date: Fri, 15 May 2026 17:08:25 +0800
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
 <1a42a168-1dbb-467e-9053-b5585a737f71@gmail.com>
 <1c4d8611411e2d14699ac0b9aeb5b2377feedc8a.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <1c4d8611411e2d14699ac0b9aeb5b2377feedc8a.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020832_680575_9740C18A 
X-CRM114-Status: GOOD (  34.48  )
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


On 5/15/2026 4:38 PM, Icenowy Zheng wrote:
> 在 2026-05-15五的 14:25 +0800，Joey Lu写道：
>> On 5/12/2026 9:12 PM, Icenowy Zheng wrote:
>>> 在 2026-05-12二的 18:59 +0800，Joey Lu写道：
>>>> On 5/12/2026 6:01 PM, Icenowy Zheng wrote:
>>>>> 在 2026-05-12二的 17:06 +0800，Joey Lu写道：
>>>>>
>>>>> ======= 8< =============
>>>>>>>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> index 7a93049368db..225af322de32 100644
>>>>>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> @@ -164,13 +164,16 @@ static void
>>>>>>>>>> vs_bridge_enable_common(struct
>>>>>>>>>> vs_crtc *crtc,
>>>>>>>>>>       			VSDC_DISP_PANEL_CONFIG_CLK_E
>>>>>>>>>> N);
>>>>>>>>>>       	regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>>>>>>>       			VSDC_DISP_PANEL_CONFIG_RUNNI
>>>>>>>>>> NG);
>>>>>>>>>> -	regmap_clear_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> -			
>>>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>>>> -	regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> -
>>>>>>>>>> 			VSDC_DISP_PANEL_START_RUNNIN
>>>>>>>>>> G(ou
>>>>>>>>>> tput));
>>>>>>>>>>       
>>>>>>>>>> -	regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>>>>>>>> id),
>>>>>>>>>> -
>>>>>>>>>> 			VSDC_DISP_PANEL_CONFIG_EX_CO
>>>>>>>>>> MMIT);
>>>>>>>>>> +	if (dc->info->has_config_ex) {
>>>>>>>>>> +		regmap_clear_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> +				
>>>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> +				VSDC_DISP_PANEL_STAR
>>>>>>>>>> T_RU
>>>>>>>>>> NNIN
>>>>>>>>>> G(ou
>>>>>>>>>> tput
>>>>>>>>>> ));
>>>>>>>>>> +
>>>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>>>>>>>> +				VSDC_DISP_PANEL_CONF
>>>>>>>>>> IG_E
>>>>>>>>>> X_CO
>>>>>>>>>> MMIT
>>>>>>>>>> );
>>>>>>>>> Should the commit operation happen on
>>>>>>>>> DC8000/DCUltraLite
>>>>>>>>> too?
>>>>>>>>> (By
>>>>>>>>> writing to DcregFrameBufferConfig0.VALID).
>>>>>>>>>
>>>>>>>>> Many registers written has "Note: This field is double
>>>>>>>>> buffered" in
>>>>>>>>> the
>>>>>>>>> DCUltraLite documentation.
>>>>>>>>>
>>>>>>>>> I suggest create a static function for commit -- write
>>>>>>>>> to
>>>>>>>>> the
>>>>>>>>> corresponding commit bit on DC8200, and write to
>>>>>>>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>>>>>>>> [a] There is no commit operation for DCUltra Lite.
>>>>>>>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID
>>>>>>>> (BIT(3))
>>>>>>>> is a
>>>>>>>> hardware-managed double-buffer status bit: hardware
>>>>>>>> writes
>>>>>>>> 1=PENDING
>>>>>>>> when a new register set is ready and clears to 0=WORKING
>>>>>>>> after
>>>>>>>> the
>>>>>>>> VBLANK copy. Software must never write it, and there is
>>>>>>>> no
>>>>>>>> polling
>>>>>>>> use
>>>>>>> It seems to be writable and controls whether register
>>>>>>> buffering
>>>>>>> is
>>>>>>> enabled, see [1].
>>>>>>>
>>>>>>> The description of this bit in MA35D1 TRM says "This
>>>>>>> ensures a
>>>>>>> frame
>>>>>>> will always start with a valid working set if this register
>>>>>>> is
>>>>>>> programmed last, which reduces the need for SW to wait for
>>>>>>> the
>>>>>>> start of
>>>>>>> a VBLANK signal in order to ensure all states are loaded
>>>>>>> before
>>>>>>> the
>>>>>>> next VBLANK", which indicates some kind of "committing
>>>>>>> write",
>>>>>>> although
>>>>>>> the code at [1] seems to indicate that double buffering is
>>>>>>> only
>>>>>>> enabled
>>>>>>> when bit is cleared.
>>>>>>>
>>>>>>> Anyway this bit should be programmable, and "Software must
>>>>>>> never
>>>>>>> write
>>>>>>> it" contradicts with the MA35D1 TRM.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Icenowy
>>>>>>>
>>>>>>> [1]
>>>>>>> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
>>>>>> Thank you for the correction. I'll add
>>>>>> `#define VSDC_FB_CONFIG_VALID BIT(3)` to
>>>>>> vs_primary_plane_regs.h
>>>>>> and
>>>>>> write it in `vs_primary_plane_commit()` for non-config_ex
>>>>>> variants.
>>>>>>>> case in the driver that requires a named constant. For
>>>>>>>> non-
>>>>>>>> config_ex
>>>>>>>> variants, `vs_primary_plane_commit()` performs no commit
>>>>>>>> operation —
>>>>>>>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>>>>>>>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET`
>>>>>>>> (BIT(4))
>>>>>>>> is
>>>>>>>> set/cleared in the bridge enable/disable paths.
>>>>> Well according to the driver code for DC8000 from Eswin, and
>>>>> the
>>>>> bit
>>>>> named "VALID", maybe it should be cleared before programming
>>>>> the
>>>>> registers, and set after programming registers, to make the
>>>>> process
>>>>> of
>>>>> programming registers atomic from the perspective of the
>>>>> display
>>>>> controller.
>>>>>
>>>>> Anyway this should require testing on real hardware to verify.
>>>>>
>>>>> By the way, I see multiple peripheral drivers for MA35D1 get
>>>>> applied in
>>>>> the torvalds tree, but the device tree is still only a
>>>>> skeleton;
>>>>> when
>>>>> will the device tree be updated?
>>>>>
>>>>> Thanks,
>>>>> Icenowy
>>>> Thanks for pointing this out. I’ll perform tests on real hardware
>>>> since
>>>> I haven’t used this bit before.
>>>>
>>>> As for the device tree, we plan to update it comprehensively
>>>> after
>>>> completing several major IPs, with the goal of releasing the
>>>> update
>>>> later this year.
>>> Well I bought a MA35D1 board (MYIR MYB-LMA35 + RGB LCD) earlier
>>> this
>>> year (and this is where I got the MA35D1 identification register
>>> values). Hope I can have a chance to test this driver by myself.
>>>
>>> As MMC, Ethernet and USB support is all applied, maybe it's already
>>> worthy to update the device tree ;-)
>>>
>>> Thanks,
>>> Icenowy
>> Yes you can!
>>
>> I have performed hardware validation on the MA35D1 and found that
>> this
>> bit acts as a manual latch for the shadow registers rather than an
>> auto-clearing trigger, which clarifies the slightly ambiguous
>> description in the TRM.
>>
>> Following your suggestion, I will align the implementation with
>> ESWIN's
>> DC8000 logic: setting the VALID bit at atomic_begin and clearing it
> Ah do you mean clearing it at begin and setting it at flush?
>
> In the Eswin driver (which seems to be based on reference code by
> Verisilicon, I saw similar driver code for DC8200),
> dc_hw_enable_shadow_register() clears VALID bit when enable is true,
> and all register setting sequences calls that function with enable =
> true before setting and enable = false after setting.
>
> In addition, considering this bit is called "VALID" instead of
> "INVALID", I think it represents that the DC will apply the new setting
> when it's set and keep the current setting when it's cleared, so I
> think it should be cleared before modeset sequence and be set after
> modeset sequence.
>
> Thanks,
> Icenowy
Thanks for pointing that out. To clarify, the TRM defines the states for 
this bit as:
1: PENDING (Shadow registers are locked; incoming CPU writes are held in 
the shadow buffer).
0: WORKING (Shadow registers are unfrozen/live; configuration is committed).

Regarding the Eswin reference, `dc_hw_enable_shadow_register(hw, false)` 
actually writes a 1 to isolate the registers during a batch update, and 
then transitions back to true (0) to flush them out.
My hardware test confirms this sequence:

- atomic_begin: We set VALID = 1. This safely freezes the current 
scanout configuration so we can update multiple registers (like frame 
addresses and pitches) without mid-frame tearing.
- atomic_update: We write the new register values safely into the frozen 
shadow space.
- atomic_flush: We clear VALID = 0. This releases the shadow lock, 
triggering the hardware to latch the whole batch atomically.

If we reverse this logic—leaving the bit at 1 after the flush — the 
hardware remains permanently stuck in the PENDING state, waiting to be 
unfrozen, which starves the display engine and results in the blank 
screen behavior I observed.
>> at
>> atomic_flush. My tests confirm this allows the hardware to latch the
>> plane configuration correctly while avoiding the blank screen issues
>> observed with other configurations.
>>
>> I am preparing the v2 patchset with this change, along with the
>> requested commit splits, and will submit it shortly.🙂
>>
>>>>>>> ========= 8< ==========
>>>>>>>

