Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4EFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlGxYsdCeIeMZ+N+hOExxK1vNZUEfTSzZ60NUH8zxXI=; b=O2HHIvHBkZ3n+P7/zGZbohjmI/
	KePcoLzRobPJ6tIcsMp92/7Mvj89zeyZJMzaUdqVD/aoLM6gdX9RA52BXD42uLr5do42pci+5sjbl
	a2OKcqEl62U6FUhuscb9l3zxcXFcXeZIUlvoTGNxPrYdXyXpTaP4hi5qvc8D8I8NLBz4AURvClszw
	fb4DCB8N71rainbJZv9Ja87iqoxDkxxftOAkbwt1gHqX/bvOXpu1x21OGZP9jeR/xDLPj1o5lBgIP
	ukto+3Syp5p3oFQI61288x8BviglV6Dl3TtMSRV9X/ta4tHc96ZlppiWXOHhSRtOsc2OAQ/pgsfef
	9abxQ2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXJt-00000003Mur-03ey;
	Wed, 20 May 2026 03:10:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXJq-00000003MuT-3gmt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 03:10:03 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c796163fac5so3664580a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246602; x=1779851402; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tlGxYsdCeIeMZ+N+hOExxK1vNZUEfTSzZ60NUH8zxXI=;
        b=KoWUW4d5CvRSGihRpGAqcmRkrGI+ZYvvoCCwlDFOZMMk5twYtHsbjoiaXXXHQASaEO
         VcYzOsa3ND6lSSzySJnl1TYaURX2b54rwqcbClSpW213vJO29ASZuNQ+rVWdMxYMHXAK
         IUika9xJsfzbfcpnPGjLRV22z5+b3ELQraDyXUw11344n1jIFaGVnT6dxWvGiDAgZWWy
         TYgx6h9aGAphDTOaT75lxXGqSt8ChJ2K9X5C5d5seb64Q+Ps4OtsF44mTkz8oC+Ezl4B
         5IfVs8vkF0UCpEiddOskEhVLPfD4xJ6sRUCQznywvGPzNamVsIKyCBbyFsR2c5ButSYr
         b7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246602; x=1779851402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlGxYsdCeIeMZ+N+hOExxK1vNZUEfTSzZ60NUH8zxXI=;
        b=Wo9FqXtgwXz2FVqKB+gpplkgVxtV9UMaiJsyxKzkfRWKe+xm2YY5oup/9/7w3rkK+b
         TsBIrmZLOF7WD6RnmxrJAr432MEh8m0jLulLC6tqG+FZKfqe01OTVCkiH76PIOgY3f/m
         /rrzUSG4TJLdsh3vnkH6RgZuYCKc0V6Y+FGlFyevBF4SZFaP+KU9rfLH4zmtARInqQCe
         wblPkNh+hEMe0e621jwRl4VAYtF7eXZ+zN+L2ngZCNrv9PfLqeFTVg/V6R+yEbpXZs/J
         A6WDxzcQNlSvF2Uckl5Xt7cMq28xtFswD134af4rNBSn9ww6YL5Zw9EaduiJs4XCUxQ+
         qyUA==
X-Forwarded-Encrypted: i=1; AFNElJ+YqQFL0htGGoZcmT3zvmQRrZxU5rCAWHg1iAYHQYsp/wpof23NKV8/o7+6hcb/rqkLddHb5TTVfZOpLOHOPUe3@lists.infradead.org
X-Gm-Message-State: AOJu0YwTCtbld6ZLESDyl0atPvzryYI9bOP7IbqQWtS5odxnUVPkb7mq
	DQNiKiPoZdAmf9QAalTzolXmEAiTdu9EIfQyfH1yLWeLQYaNpv0Myxr+
X-Gm-Gg: Acq92OGSgbbv6YVYFJVsJTCtGjVS0WASFoFZlMSr6iBUP4PSQb7KM2VJvmebOkuIdQo
	OWMDgk0bsHh5blRfTXc5BiZZRiStXYPxIAwOmrvaT0p0IhkBGY52eZOxGvNO3wiFms6l4NxJfyS
	CKmym1CZLVEgY3RqQbeClObNx10KOBff4MhMdOnKNVRyuYRWqwOVbJYyQPAOaBx6RdLC98oAgP2
	Dqxd8MJna4gaRZh81xAs9v8zw7+gQuBbqjD47UW7kw09ZOXjEyQ2rzbYSVrwJLv08jfnhzPGDKR
	JD64xh5FxygNRZwywV+a5j5WArQ0rfceueIjFQeEfvWIm4KhuL+xteo4Rm7/i+WUKvDbpMFkpzC
	FjVIpDtCXx8PVstny+xIqVinquL0YCqpdwRUhMs+TuXXmmW6NsyPyxW0u7asPYrqpvtHY1xj3qr
	ri+Ihu24oD0BoFuVbPNAxbI3ptHXYWp6OPcLDDZliKAIUbiiJ6ttvxB0MG2Tx9R07xmlxRXWihb
	/ry
X-Received: by 2002:a05:6a00:198f:b0:82c:20ba:1570 with SMTP id d2e1a72fcca58-83f33d9828dmr22226850b3a.29.1779246601737;
        Tue, 19 May 2026 20:10:01 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977c494sm18877770b3a.21.2026.05.19.20.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:10:01 -0700 (PDT)
Message-ID: <fb2ddf2c-36af-4118-95f1-081542e5a804@gmail.com>
Date: Wed, 20 May 2026 11:09:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite
 display controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260519055114.1886525-1-a0987203069@gmail.com>
 <20260519055114.1886525-5-a0987203069@gmail.com>
 <4d3c239ff1c560791668e571c5e6ab58c08ea002.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4d3c239ff1c560791668e571c5e6ab58c08ea002.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_201002_942301_4905C2E0 
X-CRM114-Status: GOOD (  27.18  )
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

On 5/19/2026 3:44 PM, Icenowy Zheng wrote:
> 在 2026-05-19二的 13:51 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCU Lite display
>> controller.  While its register layout is broadly similar to the
>> DC8200,
>> several differences require dedicated hardware ops:
>>
>> 1. No CONFIG_EX commit path: framebuffer updates use enable (bit 0)
>> and
>>     reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging
>> registers
>>     (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
>>     PANEL_CONFIG_EX).
>>
>> 2. No PANEL_START register: panel output starts when
>>     PANEL_CONFIG.RUNNING is set; no multi-display sync start register
>>     is used.
>>
>> 3. Different IRQ registers: DCU Lite uses DISP_IRQ_STA (0x147C) /
>>     DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
>>     TOP_IRQ_EN (0x0014).
>>
>> 4. Per-frame commit cycle: DCU Lite requires the VALID bit in
>> FB_CONFIG
>>     to be set at the start of each atomic commit (crtc_begin) and
>> cleared
>>     after (crtc_flush).
>>
>> 5. Simpler clock topology: only "core" (bus gate) and "pix0" (pixel
>>     divider) clocks; no axi or ahb clocks.  Make axi_clk and ahb_clk
>>     optional (devm_clk_get_optional_enabled) so DCU Lite nodes without
>>     those clocks are handled gracefully.
>>
>> Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
>> differences.  After chip identity detection, vs_dc_probe() now
>> selects
>> vs_dcu_lite_funcs when the identified model is VSDC_MODEL_DCU_LITE
>> (model register reads 0, revision 0x5560, customer_id 0x305).
>>
>> Extend Kconfig to allow building on ARCH_MA35 platforms.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
>>   drivers/gpu/drm/verisilicon/Makefile      |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
>>   drivers/gpu/drm/verisilicon/vs_dc.h       |  1 +
>>   drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78
>> +++++++++++++++++++++++
>>   5 files changed, 87 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
>> b/drivers/gpu/drm/verisilicon/Kconfig
>> index 7cce86ec8603..295d246eb4b4 100644
>> --- a/drivers/gpu/drm/verisilicon/Kconfig
>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>> @@ -2,7 +2,7 @@
>>   config DRM_VERISILICON_DC
>>   	tristate "DRM Support for Verisilicon DC-series display
>> controllers"
>>   	depends on DRM && COMMON_CLK
>> -	depends on RISCV || COMPILE_TEST
>> +	depends on RISCV || ARCH_MA35 || COMPILE_TEST
>>   	select DRM_BRIDGE_CONNECTOR
>>   	select DRM_CLIENT_SELECTION
>>   	select DRM_DISPLAY_HELPER
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>> b/drivers/gpu/drm/verisilicon/Makefile
>> index f4fbd9f7d6a2..bf88f627e65c 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,5 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_dcu_lite.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index c94957024189..77bc63c629f7 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   		return PTR_ERR(dc->core_clk);
>>   	}
>>   
>> -	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
>> +	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
>>   	if (IS_ERR(dc->axi_clk)) {
>>   		dev_err(dev, "can't get axi clock\n");
>>   		return PTR_ERR(dc->axi_clk);
>>   	}
>>   
>> -	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
>> +	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
>>   	if (IS_ERR(dc->ahb_clk)) {
>>   		dev_err(dev, "can't get ahb clock\n");
>>   		return PTR_ERR(dc->ahb_clk);
>> @@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>> identity.model,
>>   		 dc->identity.revision, dc->identity.customer_id);
>>   
>> -	dc->funcs = &vs_dc8200_funcs;
>> +	if (dc->identity.model == VSDC_MODEL_DC8200)
> Don't do that. The model value is only for matching hardware values,
> not for detecting what's present. Don't forget that DC8000 has a model
> value of 0x8000, but behaves similarly with DCUltraLite with a model
> value of 0x0.
>
> I suggest adding another field for assigning helper functions.
>
> My suggestion is here:
>
> ```
> enum vs_dc_generation {
> 	VSDC_GEN_DC8000,
> 	VSDC_GEN_DC8200
> };
> ```
>
> Thanks,
> Icenowy
Understood. I will add `enum vs_dc_generation` to vs_hwdb.h and a 
`generation` field to `vs_chip_identity`. Each entry in 
`vs_chip_identities[]` will set `.generation` accordingly (DC8200 
entries → `VSDC_GEN_DC8200`; DCUltraLite → `VSDC_GEN_DC8000`). The probe 
will then branch on `dc->identity.generation == VSDC_GEN_DC8200` instead 
of the model register value.
>> +		dc->funcs = &vs_dc8200_funcs;
>> +	else
>> +		dc->funcs = &vs_dcu_lite_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index 45172c1a525c..d77d4a1babdf 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -66,5 +66,6 @@ struct vs_dc {
>>   };
>>   
>>   extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +extern const struct vs_dc_funcs vs_dcu_lite_funcs;
>>   
>>   #endif /* _VS_DC_H_ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>> b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>> new file mode 100644
>> index 000000000000..11ef57d5ebaa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
>> + */
>> +
>> +#include <linux/regmap.h>
>> +
>> +#include "vs_crtc_regs.h"
>> +#include "vs_dc.h"
>> +#include "vs_primary_plane_regs.h"
>> +
>> +static void vs_dcu_lite_bridge_enable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dcu_lite_bridge_disable(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_begin(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_flush(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_enable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_disable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dcu_lite_enable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dcu_lite_disable_vblank(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			  VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static u32 vs_dcu_lite_irq_handler(struct vs_dc *dc)
>> +{
>> +	u32 irqs;
>> +
>> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
>> +	return irqs;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dcu_lite_funcs = {
>> +	.bridge_enable		= vs_dcu_lite_bridge_enable,
>> +	.bridge_disable		=
>> vs_dcu_lite_bridge_disable,
>> +	.crtc_begin		= vs_dcu_lite_crtc_begin,
>> +	.crtc_flush		= vs_dcu_lite_crtc_flush,
>> +	.crtc_enable		= vs_dcu_lite_crtc_enable,
>> +	.crtc_disable		= vs_dcu_lite_crtc_disable,
>> +	.enable_vblank		= vs_dcu_lite_enable_vblank,
>> +	.disable_vblank		=
>> vs_dcu_lite_disable_vblank,
>> +	.irq_handler		= vs_dcu_lite_irq_handler,
>> +};

