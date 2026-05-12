Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6F4CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1x3QKNa6wEmvoxZX8OKMfbWBrcN6crkcagrWuMBo3Xc=; b=hb93q+zhGLoZmgxg8veQ8CQ69L
	bKGzSVzZzzBAiljKu/y/LkhOCrheA6sWKRz47bARVBamdw7HhTGbLmvrewZQwsV3jbgFaNkSHt+iA
	OwztgAL2pXzsobmw8GFTGI41EJuzv1fKEo8veXhatNfKQHyNKGvabM6K948NGzQkV5RmJPiQQLF3L
	aw0me9h6RQUZbEDxzGF67cQhbLj4KAxe8xL2mp2CUvXNNV0RHuPa9lHC8DuiHwUlZFieeQ2CcEtou
	arAblEl9cf396b3T/bgYANkVIB3GpzdXwXkmj7MmhvMQemDe/8JShnnx2xsoxXkiCTQsxdg6Tp7Zy
	6v7axRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4u-0000000GCfb-0mxf;
	Tue, 12 May 2026 09:07:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4s-0000000GCdk-2mMt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 09:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1x3QKNa6wEmvoxZX8OKMfbWBrcN6crkcagrWuMBo3Xc=; b=h73XrUxhQvRd7yNP+xsTxYmXp/
	dDfuycCNdmQ2uV8fOrLf1PI3w71NgQti5mKcj4BU5D3H0zkhz/vk/QNemJa/oHwassvwNkMjKZRfK
	So5l/j01quDtr2RAw6vToVzaN38Gv3uLDQItSalDiCJ0ZsE/cz5tvM9qRq2T8FR9zl+HlgXO4pKcm
	tgIHBBSqRcyPRvxI3lr36crUTgan6OPwY7+xyVWEfVg6hWsUlNxl8/OVeBhOnMhVClC5rsi9ys9Ye
	UIB2LPCsIOq7wySGalTi5tCxIVZmbZTFenCQ+cgLn8mtQEwQCORo5cw1JVf95fYx0nl/SPJD9vTCf
	ATsFqyDQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4m-0000000EC4k-1lwR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:06:55 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-366087480d8so4794350a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778576810; x=1779181610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1x3QKNa6wEmvoxZX8OKMfbWBrcN6crkcagrWuMBo3Xc=;
        b=LHNMWX19GQBB1RSh3S8xh2iB+2wzPGs0D7EWLUwVf09lO3caOCbq7TvKKCeEhqOgym
         LXLokjp9/p8lrSeWICBOyA6CyMEw4D88BTX6wUxIJlCupRv60RNZfF1VUd+6Ds2Sx5no
         RaBhWen1HvOmPoPhDDmZBDfwKS1so0UuTJMp/AlDrY+aJmJfUiCoEHkVCIXOwUmvDfUW
         6XRetY29i0KHgeVgd+H0BdGgRNep7rYiRvHQC3RIqtCz9Gtbek4dgIC729acvKHwVPfp
         Gr0BAfWXScCw4CD/0BuelFDXtz+NZZ35oqm9YoShTeaMK5tRk/gHhJOjYZGCvH/qIZ0X
         FVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576810; x=1779181610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1x3QKNa6wEmvoxZX8OKMfbWBrcN6crkcagrWuMBo3Xc=;
        b=LodzGoPOyoibGdXvflveC1UGGvUJaIem/AciPWlZVx+gncdKN8kRMBtrJM2j0YWBYg
         HFEuJo/7GrwK4n869rWLKLVl7EGR3tyuYOy4eKdhZBkP1hQFTUlNhhjY9nq1a4syi/WM
         FDG/NB+UQDKGWmcfjpVwLaOmbjn4XfBMu+c51RzpxGngFRwBb3rLk6UqJas5+LTzoglw
         JNNjnj6yoVxEN9dJhrL/pLW4CPnErvyH/58v+JIP2pGJ+pOtJuP7BPgkGPlS6rCEDUZ9
         mrNJESUnaBvaH/dBwKAvq8I4qQE25QOn9EPmHqDZOREMExPWhJC0URZ9hwgKHaSsofR1
         gl8g==
X-Forwarded-Encrypted: i=1; AFNElJ/rl6V3qhGBOQf4Bo7hG1zFDLm1IgiJ75VH/hpQxdNGx4RpbZt0VjO3O3u1H9Wb831/IDZ/wJ/OuNIQ5XkhO5d8@lists.infradead.org
X-Gm-Message-State: AOJu0YxIsDDozL0FHCMd87oZyVowhej7pyyZSv909qymziv5tAa+ndOy
	XGEYjtL6jhckbaU0Bn77q3ElTsGFs6wzOZJGXHXI8Bo4mKZAbcFhn6Na
X-Gm-Gg: Acq92OF29e1k9A0sfKOxoXri1kej6hGvhYNbCfuQidrvJorAySaNBCNUfEjqyKiVvIQ
	+MZ09R4aUobMEfBGl6afej20zTptI63/ov5O+SX2Z0LmfaqmgmKpQnoDnGoolKgEacHW0uGGUTG
	Nm9boGx6K6vU4xpgQ4pUKDixKi6AtGAr1dzaLQkMKKDJ9ZcAkXI8/yUl2Hza201nSZtXH1Kp5dD
	Vz2ln6zN6fscpsBTiixEMdF6u+lHbH8aWs+TnOTTaNPp0/cljgLAC1COHusFQDxGyTohz5mpLHg
	nEINwBr+qcxsVTIGFNULHwHoAV+zQp6sEzLB+DFPwG3aO4WNCK+gxgYf1AZ/bI+bNpeB6dAyXSA
	T98Dp4BGBgyuC7lge6AGkLUdS8u6zfoEuNceJdf6VP+6y5Z6alvttPMrF8+jfCExuy0CJLhJeaq
	dILolzr1bdjlq/sVxgJhicCoFiIwzFTveOCpLntv76MWhvBhDiRqhDhWxS/BM3QX72Zf77TyiaZ
	Y6U
X-Received: by 2002:a17:90b:3806:b0:367:bf59:6f99 with SMTP id 98e67ed59e1d1-368b26f7b09mr2441610a91.26.1778576809623;
        Tue, 12 May 2026 02:06:49 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625cee7sm10341825a91.2.2026.05.12.02.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:06:49 -0700 (PDT)
Message-ID: <dfbc4042-64cf-49f2-a5de-12260beffaa0@gmail.com>
Date: Tue, 12 May 2026 17:06:43 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <3b94806073de8bd1d79aa7ec956493f67679e46b.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100653_969320_44E2E894 
X-CRM114-Status: GOOD (  32.95  )
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


On 5/12/2026 4:11 PM, Icenowy Zheng wrote:
> 在 2026-05-12二的 15:45 +0800，Joey Lu写道：
>> On 5/11/2026 5:47 PM, Icenowy Zheng wrote:
>>> 在 2026-05-11一的 15:51 +0800，Joey Lu写道：
>>>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltra Lite
>>>> display
>>>> controller, which is a previous generation of the DC8000 series.
>>>> While
>>>> the general register layout is similar to the DC8000, there are
>>>> several
>>>> key differences that require per-variant handling in the driver.
>>>>
>>>> Add a vs_dc_info platform data structure (in vs_hwdb.h) to
>>>> describe
>>>> per-IP-variant capabilities, and use it throughout the driver to
>>>> select
>>>> the correct code paths at runtime.
>>>>
>>>> Key differences between DC8000 and DCUltra Lite handled:
>>> What the driver supports now is DC8200, DC8000 have the following
>>> point
>>> 1~4 the same with DCUltraLite (different to DC8200).
>> Understood. I'll rename all `vs_dc8000_*` identifiers to
>> `vs_dc8200_*` in v2. The commit message will also be corrected to say
>> that points 1~4 are differences from DC8200, not DC8000.
>>>> 1. No chip identity registers (0x0020-0x0030): DCUltra Lite uses
>>>> static
>>>>      platform data instead of reading model/revision/customer_id
>>>> from
>>>> HW.
>>> My test shows that revision and customer_id is correctly present,
>>> only
>>> model is 0 -- I think this can be also considered as a valid model
>>> value because the IP name has also no model number.
>>>
>>> The revision number is 0x5560 and customer id is 0x305 .
>> Thank you for testing. I'll drop the `has_chip_id` flag
>> entirely. In v2, `vs_fill_chip_identity()` will be called for all
>> variants. A new entry will be added to `vs_chip_identities[]` in
>> vs_hwdb.c with model=0x0, revision=0x5560, customer_id=0x305,
>> display_count=1, and `vs_formats_no_yuv444`.
>> e.g. verisilicon-dc 40260000.display: Found DC0 rev 5560 customer 305
>>>> 2. No CONFIG_EX commit mechanism: DC8000 uses registers at 0x1CC0
>>>>      (FB_CONFIG_EX), 0x24D8 (FB_TOP_LEFT), 0x24E0
>>>> (FB_BOTTOM_RIGHT),
>>>>      0x2510 (FB_BLEND_CONFIG), 0x2518 (PANEL_CONFIG_EX). DCUltra
>>>> Lite
>>>>      omits all of these and instead uses enable/reset bits in
>>>> FB_CONFIG
>>>>      (bit 0 = enable, bit 4 = reset) for direct framebuffer
>>>> updates.
>>>>
>>>> 3. No PANEL_START register (0x1CCC): DCUltra Lite panel output
>>>> starts
>>>>      when PANEL_CONFIG.RUNNING is set; no separate multi-display
>>>> sync
>>>>      start register is needed.
>>>>
>>>> 4. Different IRQ registers: DCUltra Lite uses 0x147C (IRQ_STA) /
>>>>      0x1480 (IRQ_EN); DC8000 uses 0x0010 (IRQ_ACK) / 0x0014
>>>> (IRQ_EN).
>>>>
>>>> 5. Different clock/reset topology: DCUltra Lite requires only
>>>> "core"
>>>>      (bus gate) and "pix0" (pixel divider) clocks with no reset
>>>> lines
>>>>      managed by the driver. DC8000 needs core/axi/ahb clocks and
>>>> three
>>>>      resets.
>>> It's possible that your SoC integration combines core clock gate
>>> with
>>> bus clock gate instead of bus clock gate not existing.
>> Agreed. In v2 I'll remove the family-gated clock handling and
>> instead use `devm_clk_get_optional_enabled()` for the axi and ahb
>> clocks, so they are simply skipped if not present in DT. Resets are
>> already optional. This keeps the probe path uniform and handles any
>> SoC-specific clock combinations naturally.
> Maybe this could be splitted as another patch, to make single commits
> smaller.
Got it.
>>>> 6. Single output only: DCUltra Lite has one display output; per-
>>>> output
>>>>      index logic is still in place but display_count is fixed at
>>>> 1.
>>>>
>>>> 7. Reduced register space: max_register is 0x2000 vs DC8000's
>>>> 0x2544.
>>>>
>>>> Add the "nuvoton,ma35d1-dcu" compatible string to the OF match
>>>> table,
>>>> extend Kconfig to allow building on ARCH_MA35 platforms, and
>>>> expose
>>>> vs_formats_no_yuv444 as the default format table for DCUltra Lite
>>>> (YUV444 blending is a DC8000-only feature).
>>>>
>>>> All changes have been tested on Nuvoton MA35D1 hardware and are
>>>> functioning correctly.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
>>>>    drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.c           | 129
>>>> ++++++++++++----
>>>> --
>>>>    drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
>>>>    drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
>>>>    drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
>>>>    .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
>>>>    .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
>>>>    10 files changed, 187 insertions(+), 74 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
>>>> b/drivers/gpu/drm/verisilicon/Kconfig
>>>> index 7cce86ec8603..295d246eb4b4 100644
>>>> --- a/drivers/gpu/drm/verisilicon/Kconfig
>>>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>>>> @@ -2,7 +2,7 @@
>>>>    config DRM_VERISILICON_DC
>>>>    	tristate "DRM Support for Verisilicon DC-series display
>>>> controllers"
>>>>    	depends on DRM && COMMON_CLK
>>>> -	depends on RISCV || COMPILE_TEST
>>>> +	depends on RISCV || ARCH_MA35 || COMPILE_TEST
>>>>    	select DRM_BRIDGE_CONNECTOR
>>>>    	select DRM_CLIENT_SELECTION
>>>>    	select DRM_DISPLAY_HELPER
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> index 7a93049368db..225af322de32 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> @@ -164,13 +164,16 @@ static void vs_bridge_enable_common(struct
>>>> vs_crtc *crtc,
>>>>    			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>>    	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>    			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			
>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			VSDC_DISP_PANEL_START_RUNNING(output));
>>>>    
>>>> -	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>> id),
>>>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>> +	if (dc->info->has_config_ex) {
>>>> +		regmap_clear_bits(dc->regs,
>>>> VSDC_DISP_PANEL_START,
>>>> +				
>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>> +		regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> +				VSDC_DISP_PANEL_START_RUNNING(ou
>>>> tput
>>>> ));
>>>> +
>>>> +		regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>> +				VSDC_DISP_PANEL_CONFIG_EX_COMMIT
>>>> );
>>> Should the commit operation happen on DC8000/DCUltraLite too? (By
>>> writing to DcregFrameBufferConfig0.VALID).
>>>
>>> Many registers written has "Note: This field is double buffered" in
>>> the
>>> DCUltraLite documentation.
>>>
>>> I suggest create a static function for commit -- write to the
>>> corresponding commit bit on DC8200, and write to
>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>> [a] There is no commit operation for DCUltra Lite.
>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID (BIT(3)) is a
>> hardware-managed double-buffer status bit: hardware writes 1=PENDING
>> when a new register set is ready and clears to 0=WORKING after the
>> VBLANK copy. Software must never write it, and there is no polling
>> use
> It seems to be writable and controls whether register buffering is
> enabled, see [1].
>
> The description of this bit in MA35D1 TRM says "This ensures a frame
> will always start with a valid working set if this register is
> programmed last, which reduces the need for SW to wait for the start of
> a VBLANK signal in order to ensure all states are loaded before the
> next VBLANK", which indicates some kind of "committing write", although
> the code at [1] seems to indicate that double buffering is only enabled
> when bit is cleared.
>
> Anyway this bit should be programmable, and "Software must never write
> it" contradicts with the MA35D1 TRM.
>
> Thanks,
> Icenowy
>
> [1]
> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
Thank you for the correction. I'll add
`#define VSDC_FB_CONFIG_VALID BIT(3)` to vs_primary_plane_regs.h and
write it in `vs_primary_plane_commit()` for non-config_ex variants.
>> case in the driver that requires a named constant. For non-config_ex
>> variants, `vs_primary_plane_commit()` performs no commit operation —
>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET` (BIT(4)) is
>> set/cleared in the bridge enable/disable paths.
> ========= 8< ==========
>

