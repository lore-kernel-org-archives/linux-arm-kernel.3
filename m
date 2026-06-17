Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66F4CD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ftmopsn3f2abpL48mO0RyoBfFBPSuZonc7xIqzYUpY=; b=UfO8+7WcYVIObNfmQBP3axnXxW
	WNfQbQ9CqwdfVLp321Bc6xPWOYQfsxLTKUdMS2WEcdOeI4GdKXXhKCPp+kcMWhavr7zwwdkVK2fjW
	5rkNuq4aBLT3rNlBYw/TpFd2+gSF6vJv7KcJ3I4xXmAi3YmlO0vmjQZXN6TcyKG7E3+E5w1uelBQ0
	oYlVL2Vhy2MM342Sk25yH5MTg+zfFASm4+fgiz+KVV1rBfsUtDWhLZjS4qFYTvKqHHczFY/gHF21N
	T33ZdMLQJ/4A9/hVxkNfJARJsLqR5/hlot6gRKiTk8nsCwJlBZbBeFLNJBzIIWvA7zdQvGIfYG2EB
	JolucSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncc-0000000H5b0-0YX4;
	Wed, 17 Jun 2026 10:35:50 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncZ-0000000H5YS-3Ujz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so536561a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ftmopsn3f2abpL48mO0RyoBfFBPSuZonc7xIqzYUpY=;
        b=c0fprpRo4KZRkXzppwbS49Tpzh/3MXl62PAUnH7HBKof0TKc0nLy/bClrGwcK8R81E
         XHntbkPRIjyVAMX0GL6RFzD4gCibJXT+/KI8p4S2dqyKiibQNbWHBPewpeJSiIb5Ughp
         f7XV4OPZXOMp2yfsLxvT73YmErKUWh//m3SefKic9OZ7+fsWybmuITzHEaV59nlmGmZE
         GPDabmC7uvTgZ3elVP2YodizDfzozBf/KsuCdiF3KdrhYYqvw7Pc7eGycSKq2wbh6XT8
         yi99YIkYNBiaaENiGsqIPkZIldTelhzNFYgkbBX+jPUTSLwolMTPfPVKIWmBxB3WySCi
         8yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ftmopsn3f2abpL48mO0RyoBfFBPSuZonc7xIqzYUpY=;
        b=bS9jX0Kav+Yjb87HNqZ59moLGptRyW3Jk0KioJ34w82DHYVwUuhp/56P34h7ey3/kP
         VMHxe/gasyNQ9QLmXhfT4wIHDuBhhbGat/zr7+sYYdgCdAMQW5wvoqNqXavQRQCpf0vd
         6atMaGcpbr9ezVxPVPL+bklxOR21CX1hKBojZq5RBvkUbFjH2BG0UarYfJFQ0MGyhx+r
         ttsY4ZmlfJelZqhorgG3s6SuqAXSIYOinM+UsAlQWm4o/s1MQ/FTX8Y84n2lDGkkYBtE
         cMLHA6ZhJWAXir1FHpNYffjiAjse7EkO55K2AWUmvquKWTfCZmPobTI1qbUq7+ZCctuy
         a89Q==
X-Forwarded-Encrypted: i=1; AFNElJ8sjzalUtioFvPvYqPGQ5J9PKRY5vsdHdAjmllcyaYc6lm4o+bLAvsZLfDC4SFrWv59Agcvq1ZdkzLFPq0szNCN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40z81deU2JvsSo/tSsWjB92fiHm/nTnv/lGL6Jn8jAkQ2eKUS
	KW3ebzUVYzzo2lc/n8riOXer0axkZebkyLrA4PU8/PcFH5gFTRKm+vF2
X-Gm-Gg: AfdE7ckhUf3WSE/uaVdNaJ1QmmJvrA79bjjnYtuiANcfbK3iK4a/dwVX190A4FXeJdF
	R9i053p/RxdLbATwYghpwdDrqOC8/4Nsi6tzaXVXLmL4Szj7zRMLAPFaSSKM4HaZvc4faa7Bq58
	XPic+/zqDKrKg1NSgW/7WeNHE7Clz0c1gjPABjauS57SwMbTVJ/Cs2fDA8bdWY4AF7iirkvo90t
	8XAOuObV1NhjdBRdJ7qLfv3vsU1OsdTzanOgwY9k6mI27qmrXdvVV40s3YEu8jXSfOiXS42RKf0
	cN4BmF4UQJi7RHZoO4oCy9eKu4TF6UT2LAjBd0McI7f1MnEM/bItF4KpHVk35oYv43L/oxpAiuH
	vGAEF6/uQinKJ95eziWfmEsvP0GzCFcGvDkAwH2p7YLdG3AqKL1cnjYZzFyRmlAgre/D/fmgN/F
	5frfEnkOQLJb3aUdXNaZQaH9nuoncO3VRNZgPG/31CKuWHRWHIpOKvLa6TqL7Hat64Cw==
X-Received: by 2002:a17:90b:2e0b:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-37c9330947cmr3320760a91.4.1781692546953;
        Wed, 17 Jun 2026 03:35:46 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228ebadsm5485446a91.10.2026.06.17.03.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:35:46 -0700 (PDT)
Message-ID: <df7363be-0e3f-4459-be4a-43ffb0a5366c@gmail.com>
Date: Wed, 17 Jun 2026 18:35:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display
 controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-5-a0987203069@gmail.com>
 <d5df0e9df3a9a68aae982f2fce830a4b10468476.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <d5df0e9df3a9a68aae982f2fce830a4b10468476.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033547_884405_545040B3 
X-CRM114-Status: GOOD (  26.96  )
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


On 6/15/2026 4:51 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
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
>>     ahb_clk optional (devm_clk_get_optional_enabled) so DC8000 nodes
>>     without those clocks are handled gracefully.
>>
>> Add vs_dc8000.c implementing the vs_dc_funcs vtable for the above
>> differences.  The probe now selects vs_dc8000_funcs when the
>> identified
>> generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
>> revision 0x5560, customer_id 0x305).
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile    |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c     |  9 ++-
>>   drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
>>   drivers/gpu/drm/verisilicon/vs_dc8000.c | 78
>> +++++++++++++++++++++++++
>>   4 files changed, 86 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>> b/drivers/gpu/drm/verisilicon/Makefile
>> index 9d4cd16452fa..d2fd8e4dff24 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o \
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_dc8000.o vs_drm.o vs_hwdb.o \
>>   	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index 9729b693d360..9499fffbca58 100644
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
> Please make the clock change a separated patch for atomicity.
>
> BTW the MA35D1 manual's clock tree shows that DCUltra appears on AXI2
> ACLK, AHB_HCLK2, behind a mux of SYS-PLL/EPLL-DIV2 (which seems to be
> the core clock), and behind a divider (which seems to be the pixel
> clock).
>
> However it's weird that only one DCUltra Clock Enable Bit exists
> despite both bus clocks have "ICG" (I think it means "Integrated Clock
> Gating"). In addition the linux clk-ma35d1 driver assigns "dcu_gate" as
> a downstream of "dcu_mux", although the Figure 6.5-2 in the TRM shows
> no ICG after the "Display core CLK" mux.
>
> Is the two bus clocks controlled by a single gate bit, and is the bit
> also gating DC core clock?
>
> Thanks,
> Icenowy
I will split the axi/ahb optional-clock change into its own patch in v5 
for atomicity.
Regarding the MA35D1 clock tree: from the TRM, the single "dcu_gate" bit 
gates both bus clocks (AXI ACLK and AHB HCLK) together with the display 
core clock through the same ICG cell. The clk-ma35d1 driver exposes only 
"dcu_gate" (downstream of "dcu_mux") and does not provide separate 
axi/ahb clock entries. Therefore the MA35D1 DT binding will use only two 
clocks ("core" and "pix0"); making axi and ahb optional in the driver is 
the correct approach, and this will be stated clearly in the split-out 
patch.
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
>> +		dc->funcs = &vs_dc8000_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index 544e1a37065b..5218e8cf63e2 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -66,5 +66,6 @@ struct vs_dc {
>>   };
>>   
>>   extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +extern const struct vs_dc_funcs vs_dc8000_funcs;
>>   
>>   #endif /* _VS_DC_H_ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c
>> b/drivers/gpu/drm/verisilicon/vs_dc8000.c
>> new file mode 100644
>> index 000000000000..be0c0d7baf52
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
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
>> +static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dc8000_crtc_enable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dc8000_crtc_disable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dc8000_enable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dc8000_disable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			  VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
>> +{
>> +	u32 irqs;
>> +
>> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
>> +	return irqs;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dc8000_funcs = {
>> +	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
>> +	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
>> +	.crtc_begin		= vs_dc8000_crtc_begin,
>> +	.crtc_flush		= vs_dc8000_crtc_flush,
>> +	.crtc_enable		= vs_dc8000_crtc_enable,
>> +	.crtc_disable		= vs_dc8000_crtc_disable,
>> +	.enable_vblank		= vs_dc8000_enable_vblank,
>> +	.disable_vblank		= vs_dc8000_disable_vblank,
>> +	.irq_ack		= vs_dc8000_irq_ack,
>> +};

