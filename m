Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4235AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 03:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFFcFveTYAjTv+ZdiJ5NifJ7wIuGpllPfX6b0xg96Fk=; b=3bjwwz9N8mFsAcYOdTq+u84ruH
	aLFExQ5PltHz/vZdNun4Y0ziwYsF6V8vGCa77PrRFPjKC8to8FlD2wEwU4dWnveCzDKBwVbmxzhJP
	yYwvRlAYPO5hxkBQFOB2myeljUGpERuZrWkXoKg+sZgKYwL8WdxRKVW8ruuUVPUW/VQYFIYfANTbA
	48qJkSULO4SgnXuFCHhhFXxHtJ4u5yRr/HfnFlK40gNG/dlacYde5SXnqNn/M19tjHyyPDMzy8GrT
	bg2DcZU9Gfi+Q28l5wh6Y3zecrlZhhnWiLSeAiBTEvbaMes5xOqDPNzBwg0dQZ6YwMF82wk6/O/3C
	ysUsMYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we34V-0000000DeVi-1sDh;
	Mon, 29 Jun 2026 03:54:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we34T-0000000DeVC-0Z0r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 03:54:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c9c9916f75so4557785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782705248; x=1783310048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFFcFveTYAjTv+ZdiJ5NifJ7wIuGpllPfX6b0xg96Fk=;
        b=SGsJrs1G6lcCgv47OluonhTXQQkB9nFQcmXQCItzQnGR17Z7ljknPiUh15AtrMxLCS
         rK6mrDjCyl12AW6rKzA30haduuCcKeJ4hUMqmRMXBNUoY5QlAigc0LCZmog2rsMJhbNj
         elp4hB7iWXW4niKjbbFf2btdWNGYwWJawxWtyMU/W/AhDdXQ3gz8baCJwEnhX85Wj+w/
         TxqU0c0MzsOHkoRO0DskChObCjP0THKEWAzdJXj8eKF6XdB+ap1s/C5QAoE+XWQW6A2e
         9RlKU9UwJmj7YlhmK7IGbCttgrf5YhYFx6soTUSrBOhYeUS3zz1QeCe51rnQWQIMzY94
         LbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782705248; x=1783310048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFFcFveTYAjTv+ZdiJ5NifJ7wIuGpllPfX6b0xg96Fk=;
        b=Lz1bwZkytb2fVCjNZlvUY5FLw8nzIqqhSS1oCykA84sPl/8HLAbYxLef/sSdlqPGFV
         iFV+FQ9Lq65TqFzs0FGUlY9J6MoU4H+0QirCMV4mYC/0PBH5WKDK9DMBRpu4CsDverQq
         HJNgSWoA/59U1/X3WOVAwP4+IdKuqBBFt4R8YSDwdGU3U7vr0sv/6loCHKSgsdBOEu2v
         /8FRUG2Ft0eGZOiUN4rZjik+C5PC+e1XRoykTZRGBEbVxKLDPkNCpCDC/7KQwTmdgXJ5
         9VVhotDzIbd6t3ekqITJV40zkIO6S4Opm76lFcmPLIzcT5JOrQG+c6L9CJMwwvKfpkKc
         XSyA==
X-Forwarded-Encrypted: i=1; AHgh+RpNLyven27S9iacehE9nYdsLMHuDPy4iyhIbfzXYdfVLE1wvJQZzxZ0Ra3jEZgW50Y5QKxx1gK/b0TS47Ft9YgE@lists.infradead.org
X-Gm-Message-State: AOJu0YzSp2RneHW9mQfBfGOC1DOEFayvyzeBnNAK1Pi9Ws+i0M8mwyce
	CczPoL1JdDydSgEyQHNfYOWhqupSsdZlT6JM0KfpPoj9x1cPe466DnwM
X-Gm-Gg: AfdE7ckaRIrAkvDap9DrhhsWQeB9E3Fer09mkRgpZOHPuqLnOsya28y6+rV3TVQxlVv
	TR5hDdo8ZPfNRNkOndfhmJaUHUQUYRJ+js+Q81CWsoH5YkeICtSWbJbSPhzCoHbk9FpA1BsgX49
	mRaLIF6g6HaaOD6hlyYRpkiUwvFPSMMbqcP8k+IiPjMwL3VRbSQzMOnrHbsUVnZw08yOuEubQSY
	DS/H8Y+Rqm2iVKvF/VZcgIJLSFKdJqz4MfS8fPt/IgzFwZZIHyc/6Lpaa7SklrwQ8VL2qTyMbb6
	YzZirdw1zucLc88et9getQrWZ4OYwcX7bszr7MKGTeICBF3S73/nrgb75z0D8SYG+wmkTTtDyyn
	0q3AOBeJrDdrvhki5yxAbVwtq3KQsZvVG6koJFR6C3Uh35kEp+coLdUGLEKEM+r5x6JXUnLofs5
	8Zaud8kshVzdImCLzThp8OIvcNh6d0nXntucUsrWjbzBtJkTiGOG1aCzHAun+58StlvLHdvhb+d
	otW
X-Received: by 2002:a17:903:244f:b0:2ca:b8d:e65f with SMTP id d9443c01a7336-2ca0b8de994mr9096045ad.1.1782705248120;
        Sun, 28 Jun 2026 20:54:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b1b02f8esm36341435ad.71.2026.06.28.20.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 20:54:07 -0700 (PDT)
Message-ID: <abe52380-dbb9-49e1-b93b-ab4aca9105b6@gmail.com>
Date: Mon, 29 Jun 2026 11:54:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/verisilicon: add DC8000 (DCUltraLite) display
 controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-6-a0987203069@gmail.com>
 <39e7d0426d1690ccfc8dbcfc77e7440bc5c9a725.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <39e7d0426d1690ccfc8dbcfc77e7440bc5c9a725.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_205409_180126_A3D6211D 
X-CRM114-Status: GOOD (  21.71  )
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


On 6/26/2026 4:03 PM, Icenowy Zheng wrote:
> 在 2026-06-25四的 17:44 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
>> controller (DC8000 generation) whose register layout differs from
>> the DC8200 in several important ways:
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
>> 4. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
>>     divider) clocks; no axi or ahb clocks required.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile    |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c     |  5 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
>>   drivers/gpu/drm/verisilicon/vs_dc8000.c | 86
>> +++++++++++++++++++++++++
>>   4 files changed, 92 insertions(+), 2 deletions(-)
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
>> index fd1f5fe67a68..9499fffbca58 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
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
>> index 825f5dd6bf17..ac96ad701199 100644
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
>> index 000000000000..fbe0fa516cac
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
>> + */
>> +
>> +#include <linux/regmap.h>
>> +
>> +#include "vs_crtc_regs.h"
>> +#include "vs_dc.h"
>> +#include "vs_drm.h"
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
>> +static void vs_dc8000_crtc_enable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dc8000_crtc_disable_ex(struct vs_dc *dc, unsigned int
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
>> +	u32 hw_irqs, unified = 0;
>> +	unsigned int i;
>> +
>> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
>> +
>> +	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
>> +		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
>> +			unified |= VSDC_IRQ_VSYNC(i);
>> +	}
> Maybe a warning for unknown IRQ bits should be added here.
>
> Thanks,
> Icenowy
I will add the same `drm_WARN_ONCE` pattern in `vs_dc8000_irq_ack` for
unknown `VSDC_DISP_IRQ_STA` bits.
>> +
>> +	return unified;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dc8000_funcs = {
>> +	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
>> +	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
>> +	.crtc_begin		= vs_dc8000_crtc_begin,
>> +	.crtc_flush		= vs_dc8000_crtc_flush,
>> +	.crtc_enable_ex		= vs_dc8000_crtc_enable_ex,
>> +	.crtc_disable_ex	= vs_dc8000_crtc_disable_ex,
>> +	.enable_vblank		= vs_dc8000_enable_vblank,
>> +	.disable_vblank		= vs_dc8000_disable_vblank,
>> +	.irq_ack		= vs_dc8000_irq_ack,
>> +};

