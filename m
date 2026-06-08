Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E0CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRDBSHYpzFBzXnPKcrs7qf2EMqGEh7EqJYnV9Ezibaw=; b=wuXndCADyb9fQ0FI6M8mO2oged
	GP54+rfTw1GScz77ZWyA3/i0mPMFpzJzmpCGhVjR4TwqCHHJ7KjuSf1oYEUUQSR/MD8u/9T0dxuDl
	h1LIn23guUvZwIATTd28vBhPrXTepy/LOmyLIskzxf4qIF8xJh61kxJRFO3ykvABXGweEsdalu6Rt
	q0e4yHzwmwMi3bYMGbrHglp6dO1/eBzuXdwmkU9QA065OJ0MeWMOEn9rXP9f8p3+AWJn+VACzPztk
	ur3ywXX5bZ0Z6OLA7bowsre0/Zwb2lBWQ7xHbJ2Js8j9jz56y6DMGX1zH1J2BadRoCxiNBWp0b/VG
	pGLZfTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWZJ-00000003Dhq-27Zb;
	Mon, 08 Jun 2026 09:46:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWZH-00000003DhK-2US4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:46:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso2431025a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912010; x=1781516810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRDBSHYpzFBzXnPKcrs7qf2EMqGEh7EqJYnV9Ezibaw=;
        b=jzbjCd1yrI3cX6gzopg67DHx61ARS1qCjgDKJWmrlTDtxTz+Vqj+PEowFcQUfXiDui
         mBVmkhPrKiioKyumZXG5BsUfgCN8Adak53xDl92pPhiKRy/koSRzn3qU0k1ghBZM8Kl4
         fYSz+VOb4pTaFavIG0+D/3srq0gFKMQJNml0jcd0+oDmDQZIlpr49Z32S/rLZqHwTckw
         Uua9KhTpPvRDk3q7SjFQxDC66yLCLJV6YI81bKgjteqeOzMF4PGahPAvZ5+eKyfgJhYH
         U/9jWufnLCc4Jq/1WeTJDzSJgoTmqRZUhxXO9E09suFNbrjLUWDKWbepFZNuk6I3oxHx
         2P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912010; x=1781516810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRDBSHYpzFBzXnPKcrs7qf2EMqGEh7EqJYnV9Ezibaw=;
        b=E0Ao7JG4uTL50PnO9JI6QeTAN3OULB0SvbvOZNb9B+N6hG+k66PiSAt6WgK0ulG0gP
         AGjoIkqq5Yy1f7bMqwEXzAHB7klEjh2e+xcC9AWQl35HZBlDSNBtSouJxBoxmO5XkpBA
         HPiUytpohweVZm84OnE8Jc42QKeVm5ep0OwkWRtI/qe8cIsUnxP3vrY9dyeUh2zSbSjr
         C/TPbBI5kGBYuwixcvTGNGb5tfU4+k1wcpPWZkyaWtjlkM8WgqhgVQso/5s3o2lcwcdN
         jS33Tq/wPsTnVHP8FpNI/SOHuDqazQO9SxJiM/S1jk/Ethh8BDiOqyJtQrB6ulB03m8U
         7EpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bOsuFMA1FwmIcxjgH2wr5HlXVM9jCOQMgCCwnPuGH+9A/1KHzM1+e3VHZsfFMEcxEkTNxOpu7MM68KYypJNwv@lists.infradead.org
X-Gm-Message-State: AOJu0YyOCPwDuQS3xqZr/9v7yly+3iwf72Ua4B4OSP1mIKP/H3098Z0d
	MSJtJF0YVHKtwfKF/x7iP6ZQev3ZW7iOlmCfan3A4hIJyR3VzSZq2c8V
X-Gm-Gg: Acq92OEiPww1Nt8suiqpNXwzYPLx3LoVBunMjpq1N0421EBOR+Hy3K5ufh7ZRoFg26V
	1TUNx22Wo9HZtI+Jn+ihrRm/00Zcm3Xra61JVlnZzMMpHGqDTBzmKtAWG+qWoPDTkgNRr+g7gyB
	RqzljQdr8xFGB1ruw+/OWjJkRuhXN1JSfTXd2Aw8oGQ/GEBwbMAeXH1wb2MkzsbABY6E68qyhmD
	+11HXBFcYfipVCgk09VBxnnP/LRGwXrNEBIuGiXXexJbuXV0p3wcK49euvBEoRzojyceEgj/GTv
	xTCQEGMinM9dpDxBhtGVSh8BjSnSLwu8ekRITiWBsqad4ANIWqhVVgemKv9Lkaby9J+BMaMDsTe
	0D2hM/mHYMVY7WwiLO2Ccup7tY2Q7FVtc2AhgbzNO3DtOup8h7WYpAm3tEq9tJqTJa0egc9fLLi
	bI14KyUeuvkbWdZ0wyOpFOwMb9t0bJBNb0fiCxKFgGglo7Xyn/oDuQfoUmltHsZJP9I47kpwfPG
	W2O+Mf3yxgbB3k=
X-Received: by 2002:a17:90b:5787:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-370f0284a87mr15256643a91.14.1780912010481;
        Mon, 08 Jun 2026 02:46:50 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm17761731b3a.10.2026.06.08.02.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:46:50 -0700 (PDT)
Message-ID: <178c4511-a290-4526-9e80-2fe8291f6ed3@gmail.com>
Date: Mon, 8 Jun 2026 17:46:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/verisilicon: add Nuvoton MA35D1 DCU Lite
 display controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-5-a0987203069@gmail.com>
 <335c237d2636764948e629dbab0b5b747ac48fa5.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <335c237d2636764948e629dbab0b5b747ac48fa5.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024651_663995_5CDF83D1 
X-CRM114-Status: GOOD (  25.84  )
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


On 6/8/2026 2:26 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 10:32 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
>> controller whose register layout differs from the DC8200 in several
>> important ways:
>>
>> 1. No CONFIG_EX commit path: framebuffer updates use the enable (bit
>> 0)
>>     and reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging
>>     registers (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT,
>>     FB_BLEND_CONFIG, PANEL_CONFIG_EX).
>>
>> 2. No PANEL_START register: panel output starts when
>>     PANEL_CONFIG.RUNNING is set; there is no multi-display sync start
>>     register.
>>
>> 3. Different IRQ registers: DCUltraLite uses DISP_IRQ_STA (0x147C) /
>>     DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
>>     TOP_IRQ_EN (0x0014).
>>
>> 4. Per-frame commit cycle: DCUltraLite requires the VALID bit in
>>     FB_CONFIG to be set at the start of each atomic commit
>> (crtc_begin)
>>     and cleared after (crtc_flush).
>>
>> 5. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
>>     divider) clocks; no axi or ahb clocks required.  Make axi_clk and
>>     ahb_clk optional (devm_clk_get_optional_enabled) so DCUltraLite
>>     nodes without those clocks are handled gracefully.
>>
>> Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
> Nitpick: could you use vs_dc8000 to make things more aligned? (Although
> I must admit that DCUltraLite is the first revision to be supported in
> this codepath).
Understood. I will rename `vs_dcu_lite.c` to `vs_dc8000.c`, all internal 
functions from `vs_dcu_lite_*` to `vs_dc8000_*`, the exported symbol 
from `vs_dcu_lite_funcs` to `vs_dc8000_funcs`, and update the Makefile 
accordingly.
>> differences.  The probe now selects vs_dcu_lite_funcs when the
>> identified generation is VSDC_GEN_DC8000 (DCUltraLite reads model
>> 0x0,
>> revision 0x5560, customer_id 0x305).
>>
>> Extend Kconfig to allow building on ARCH_MA35 platforms.
> Maybe the Kconfig change could be in the last commit or a dedicated
> commit before current ones? Because it's only meaningful after the HWDB
> item is added.
>
> Thanks,
> Icenowy
Understood. The Kconfig change adding `ARCH_MA35` will be moved to a 
separate commit placed after the HWDB entry is added, or as the final 
commit in the series.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
>>   drivers/gpu/drm/verisilicon/Makefile      |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
>>   drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78
>> +++++++++++++++++++++++
>>   4 files changed, 86 insertions(+), 5 deletions(-)
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
>> index 9d4cd16452fa..960af0861dfa 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o \
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_dcu_lite.o vs_drm.o vs_hwdb.o \
>>   	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index c94957024189..81a8d9bf85bd 100644
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
>> +	if (dc->identity.generation == VSDC_GEN_DC8200)
>> +		dc->funcs = &vs_dc8200_funcs;
>> +	else
>> +		dc->funcs = &vs_dcu_lite_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
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

