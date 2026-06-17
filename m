Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBA9CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPFdGPVI89DMoWS2fldSDp40nn36zWGcGlqvbLPCcpw=; b=vWZ1K8Dw9O0O6zwAohfg6yRyua
	unwi84BH12DUrjCDCu/NQPDR5NUysycw46uKL0xjvS+ivrfCZb0RfjLfovabgSf36oocf2XCSUKSe
	GhCKxS9sqoRi9kNXd0GgbHDipg29KQnAOy+IBTXvWxUc6GJZ+XZ9sC2OdyW7IfiWJKpTck3jRpP9G
	jUAByytQwGm4kv5//zawPYqI2SZehvDP5dWfT6rQKx6+Ei7wSwaj+IQJxx6CyR2u6vdHOrI8m/LRW
	IVisTZg5suSSNklJhphSv9oIbnba4imJJX/pQhtJYalE9maKEOp2IagQB35kybqdZKqKx2xAWyJtz
	Dutn+dEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnTJ-0000000H36d-41Bp;
	Wed, 17 Jun 2026 10:26:13 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnTH-0000000H36C-3rGN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:26:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8419ab3a297so2489111b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781691971; x=1782296771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPFdGPVI89DMoWS2fldSDp40nn36zWGcGlqvbLPCcpw=;
        b=ljbT2TP11hwl0Mw3+nJnoXyJW30we3ebVEQD/92BLVNE6sF516hAQNsOVYUR4HgTlJ
         tr8s2TZKk6XxuukMz3UxIvwIw+UQOLykuLVvwaCaN4q9vouXEEuihNPWsB8kxXQvBihh
         t8hDxZs+4NlIVdED3SFgewsm313mIc8BibcKquLkvETOtuDl3eZAYQUx2mjwOlKjPzY+
         /UjD2UNhWw4P1FHtQKYSJctT8fLRKyLrXwlfUyUPMTTRQljQAsGZJcAdpXHTGVgjOF9z
         uDv7MqhZsVV557cNorb+IwvHQCwFMkPfZ4sXXkFUwU43v+wg5kUpRq2gfZggPo645sRG
         z5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691971; x=1782296771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPFdGPVI89DMoWS2fldSDp40nn36zWGcGlqvbLPCcpw=;
        b=Mm2q3MP2g8KUBH1szveX2Ki/vpT6iCXe3s5cFr+bDnURSjsnPuJCataKGEbsxpexqG
         MCxQhPueHTI3qu0XPrjFp1GlpCm2DjJjEFE6nKh80k5AMviXK+9gAQChB8clVdUAONVa
         Kl4be31FjtYrIAWBAgrMqyOEWMe8qd3ARePJJ5Ubmp7AAwDO3ClyJMszrGkylEsEpUMc
         aeAFXuGbl+sWaOiMGSAEprA//2AjT5eT2IYb+C0TA79Kj6YM+W7xxbiIVaUIFeMyvNVo
         bZ3Qcpj7Zf5JLnPjsm9EjArd/wsXe8Oi+pfsR2kYUIryRIvrKk55oYIyiowU3U+lRefm
         ccyw==
X-Forwarded-Encrypted: i=1; AFNElJ8YofFX55WkV0M/pUNHnFPuiByV72IT1GmIB3mVOQOgp2v7Et6A/40Pr6al/HFn22ax2SnTGtcH1gkkluNzi93H@lists.infradead.org
X-Gm-Message-State: AOJu0YxT8q0og9Vgp6HKwLXqSabGhXwdGeBK8ACB6Tc30hpPMn4ZbcNH
	gZ9uTCDgW8BnFpmsWpalGwP8m0NQngeG8cZHKtSmQeyq9lCk48qOodsH
X-Gm-Gg: Acq92OFnGpYynzq/j1xi3h4sYOLC1aNw9lr0a59xbf2dBAks+lIinvXLttRGEd7GZ5B
	gU+ns0eLNeeXTwivmSoMDn1scfB2GHMvjsHnHYaYwu2PT1Y9/1RmUMZcLBxOm1lramid//sC6LX
	7f2hW1haeqnuGqZHQj+rlAuEi2bb6pDI8QXKUQLhbVIGOMi+9Cx9bxRGQQlFbBsIKTCWp2vuWi6
	6/1iU9p3yQm3SAIeNdtbsIkHHqxsw2Fc87YE72Rp8mtRYIi5o5ZUdhV/5vomCO6RpIpo1+oHxq9
	BgQpGyNJI0t/PUC4SWHOqx2IM4gQtR2jjFphuLo6oOQyZ0EDC7vQLjhtC0LcptMOCCSuNUoC8cJ
	NHtRwXZCwhz9hgaOOD4DOsHugC5/wq0aJM+61zN72tTMPI/vvMEoaQi74PETV8pl96KfFIf55/b
	ODMDy2RJ+pS88GeCmX7YZ9SHyhPtRBd2Jdq4XmtUyuRweTPacgvTLOdxmj2grORT3eQg==
X-Received: by 2002:a05:6a00:194d:b0:842:4f20:53ff with SMTP id d2e1a72fcca58-845245bdbc2mr3342086b3a.42.1781691970650;
        Wed, 17 Jun 2026 03:26:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm15446071b3a.36.2026.06.17.03.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:26:10 -0700 (PDT)
Message-ID: <3dedae12-038a-4233-8315-82e6d29b5926@gmail.com>
Date: Wed, 17 Jun 2026 18:26:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-4-a0987203069@gmail.com>
 <38d07e3b3c841d380c987800d8ef85065be94e79.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <38d07e3b3c841d380c987800d8ef85065be94e79.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_032611_988575_FC4BF7D0 
X-CRM114-Status: GOOD (  25.92  )
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


On 6/15/2026 4:37 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
>> The DC8200 and DCUltraLite share a broadly similar register layout
>> but
>> differ in how the bridge, CRTC, primary plane and IRQ paths are
>> driven.
>> Introduce a vs_dc_funcs vtable so each variant can supply its own
>> implementation without scattering conditionals across multiple files.
>>
>> Add enum vs_dc_generation (VSDC_GEN_DC8000 / VSDC_GEN_DC8200) to
>> vs_hwdb.h and a generation field to struct vs_chip_identity.
>> Annotate
>> all four existing DC8200 HWDB entries with VSDC_GEN_DC8200.
>>
>> Extract the DC8200-specific hardware ops into a new vs_dc8200.c:
>>    panel_enable_ex / panel_disable_ex - PANEL_CONFIG/START + CONFIG_EX
>> commit
>>    enable_vblank / disable_vblank - TOP_IRQ_EN VSYNC bit
>>    primary_plane_enable_ex / disable_ex / update_ex - FB_CONFIG_EX
>> path
>>    irq_ack - reads TOP_IRQ_ACK
>>
>> Update vs_bridge.c, vs_crtc.c, vs_primary_plane.c and vs_dc.c to
>> dispatch through dc->funcs instead of directly touching registers.
>> vs_crtc.c gains atomic_begin and atomic_flush hooks to allow variants
>> to gate per-frame commit cycles.
>>
>> No behaviour change for existing DC8200 platforms.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile          |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +---
>>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++++-
>>   drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.h           |  32 ++++++
>>   drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107
>> ++++++++++++++++++
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
>>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
>>   9 files changed, 196 insertions(+), 51 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>> b/drivers/gpu/drm/verisilicon/Makefile
>> index 426f4bcaa834..9d4cd16452fa 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o
>> vs_hwdb.o \
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o \
>>   	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>> index 7a93049368db..6ff2ac745b15 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>> @@ -162,15 +162,8 @@ static void vs_bridge_enable_common(struct
>> vs_crtc *crtc,
>>   			VSDC_DISP_PANEL_CONFIG_DE_EN |
>>   			VSDC_DISP_PANEL_CONFIG_DAT_EN |
>>   			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> -			VSDC_DISP_PANEL_CONFIG_RUNNING);
>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> -			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>> -			VSDC_DISP_PANEL_START_RUNNING(output));
>> -
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>> id),
>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +
>> +	dc->funcs->panel_enable_ex(dc, output);
>>   }
>>   
>>   static void vs_bridge_atomic_enable_dpi(struct drm_bridge *bridge,
>> @@ -228,14 +221,7 @@ static void vs_bridge_atomic_disable(struct
>> drm_bridge *bridge,
>>   	struct vs_dc *dc = crtc->dc;
>>   	unsigned int output = crtc->id;
>>   
>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> -			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
>> -			  VSDC_DISP_PANEL_START_RUNNING(output));
>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> -			  VSDC_DISP_PANEL_CONFIG_RUNNING);
>> -
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>> id),
>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +	dc->funcs->panel_disable_ex(dc, output);
>>   }
>>   
>>   static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
>> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c
>> b/drivers/gpu/drm/verisilicon/vs_crtc.c
>> index 0b8a35d09cd2..679d6541ba1b 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
>> @@ -16,10 +16,33 @@
>>   #include "vs_crtc_regs.h"
>>   #include "vs_crtc.h"
>>   #include "vs_dc.h"
>> -#include "vs_dc_top_regs.h"
>>   #include "vs_drm.h"
>>   #include "vs_plane.h"
>>   
>> +static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
>> +				  struct drm_atomic_commit *state)
>> +{
>> +	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>> +	struct vs_dc *dc = vcrtc->dc;
>> +	unsigned int output = vcrtc->id;
>> +
>> +	if (dc->funcs->crtc_begin)
>> +		dc->funcs->crtc_begin(dc, output);
>> +}
>> +
>> +static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
>> +				  struct drm_atomic_commit *state)
>> +{
>> +	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>> +	struct vs_dc *dc = vcrtc->dc;
>> +	unsigned int output = vcrtc->id;
>> +
>> +	if (dc->funcs->crtc_flush)
>> +		dc->funcs->crtc_flush(dc, output);
>> +
>> +	drm_crtc_vblank_atomic_flush(crtc, state);
>> +}
>> +
>>   static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
>>   				   struct drm_atomic_commit *state)
>>   {
>> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc
>> *crtc,
>>   	drm_crtc_vblank_off(crtc);
>>   
>>   	clk_disable_unprepare(dc->pix_clk[output]);
>> +
>> +	if (dc->funcs->crtc_disable)
>> +		dc->funcs->crtc_disable(dc, output);
> Should this be `crtc_disable_ex` ? Because the clock-related operation
> is shared.
I will rename `crtc_disable` to `crtc_disable_ex` and `crtc_enable` to 
`crtc_enable_ex` in v5 to make clear these hooks extend the shared clock 
operations rather than replace them.
>>   }
>>   
>>   static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>> @@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc
>> *crtc,
>>   	drm_WARN_ON(&dc->drm_dev->base,
>>   		    clk_prepare_enable(dc->pix_clk[output]));
>>   
>> +	if (dc->funcs->crtc_enable)
>> +		dc->funcs->crtc_enable(dc, output);
> Ditto for appending `_ex` .
Addressed above.
>> +
>>   	drm_crtc_vblank_on(crtc);
>>   }
>>   
>> @@ -119,7 +148,8 @@ static bool vs_crtc_mode_fixup(struct drm_crtc
>> *crtc,
>>   }
>>   
>>   static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
>> -	.atomic_flush	= drm_crtc_vblank_atomic_flush,
>> +	.atomic_begin	= vs_crtc_atomic_begin,
>> +	.atomic_flush	= vs_crtc_atomic_flush,
>>   	.atomic_enable	= vs_crtc_atomic_enable,
>>   	.atomic_disable	= vs_crtc_atomic_disable,
>>   	.mode_set_nofb	= vs_crtc_mode_set_nofb,
>> @@ -132,7 +162,7 @@ static int vs_crtc_enable_vblank(struct drm_crtc
>> *crtc)
>>   	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>> +	dc->funcs->enable_vblank(dc, vcrtc->id);
>>   
>>   	return 0;
>>   }
>> @@ -142,7 +172,7 @@ static void vs_crtc_disable_vblank(struct
>> drm_crtc *crtc)
>>   	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>> +	dc->funcs->disable_vblank(dc, vcrtc->id);
>>   }
>>   
>>   static const struct drm_crtc_funcs vs_crtc_funcs = {
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index dad9967bc10b..9729b693d360 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -8,9 +8,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_graph.h>
>>   
>> -#include "vs_crtc.h"
>>   #include "vs_dc.h"
>> -#include "vs_dc_top_regs.h"
>>   #include "vs_drm.h"
>>   #include "vs_hwdb.h"
>>   
>> @@ -33,7 +31,7 @@ static irqreturn_t vs_dc_irq_handler(int irq, void
>> *private)
>>   	struct vs_dc *dc = private;
>>   	u32 irqs;
>>   
>> -	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
>> +	irqs = dc->funcs->irq_ack(dc);
> The definition of bits in 0x0010 seems to be different to ones in
> 0x147C, although the first 2 bits are the same. (e.g. `BIT(2)` is
> "cursor interrupt" in DC8000 0x147C but "secure reset done" in DC8200
> 0x0010).
>
> Should some kind of translation be done in `irq_ack` ? (and add a
> unified interrupt definition that aims to be the translation target).
>
> Thanks,
> Icenowy
>
>>   
>>   	vs_drm_handle_irq(dc, irqs);
>>   
>> @@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>> identity.model,
>>   		 dc->identity.revision, dc->identity.customer_id);
>>   
>> +	dc->funcs = &vs_dc8200_funcs;
>> +
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>>   		ret = -EINVAL;
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index ed1016f18758..544e1a37065b 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/reset.h>
>>   
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_plane.h>
>>   
>>   #include "vs_hwdb.h"
>>   
>> @@ -22,6 +23,34 @@
>>   
>>   struct vs_drm_dev;
>>   struct vs_crtc;
>> +struct vs_dc;
>> +
>> +struct vs_dc_funcs {
>> +	/* Bridge: atomic_enable, atomic_disable */
>> +	void (*panel_enable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*panel_disable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* CRTC: atomic_begin, atomic_flush */
>> +	void (*crtc_begin)(struct vs_dc *dc, unsigned int output);
>> +	void (*crtc_flush)(struct vs_dc *dc, unsigned int output);
>> +
>> +	/* CRTC: atomic_enable, atomic_disable */
>> +	void (*crtc_enable)(struct vs_dc *dc, unsigned int output);
>> +	void (*crtc_disable)(struct vs_dc *dc, unsigned int output);
>> +
>> +	/* CRTC: enable_vblank, disable_vblank */
>> +	void (*enable_vblank)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*disable_vblank)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* Primary plane: atomic_enable, atomic_disable,
>> atomic_update */
>> +	void (*primary_plane_enable_ex)(struct vs_dc *dc, unsigned
>> int output);
>> +	void (*primary_plane_disable_ex)(struct vs_dc *dc, unsigned
>> int output);
>> +	void (*primary_plane_update_ex)(struct vs_dc *dc, unsigned
>> int output,
>> +					struct drm_plane_state
>> *state);
>> +
>> +	/* IRQ acknowledge */
>> +	u32 (*irq_ack)(struct vs_dc *dc);
>> +};
>>   
>>   struct vs_dc {
>>   	struct regmap *regs;
>> @@ -33,6 +62,9 @@ struct vs_dc {
>>   
>>   	struct vs_drm_dev *drm_dev;
>>   	struct vs_chip_identity identity;
>> +	const struct vs_dc_funcs *funcs;
>>   };
>>   
>> +extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +
>>   #endif /* _VS_DC_H_ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> new file mode 100644
>> index 000000000000..800df9279e9b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> @@ -0,0 +1,107 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
>> + */
>> +
>> +#include <linux/regmap.h>
>> +
>> +#include "vs_bridge_regs.h"
>> +#include "vs_dc.h"
>> +#include "vs_dc_top_regs.h"
>> +#include "vs_plane.h"
>> +#include "vs_primary_plane_regs.h"
>> +
>> +static void vs_dc8200_panel_enable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> +			VSDC_DISP_PANEL_CONFIG_RUNNING);
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>> +			VSDC_DISP_PANEL_START_RUNNING(output));
>> +
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
>> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +}
>> +
>> +static void vs_dc8200_panel_disable_ex(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> +			  VSDC_DISP_PANEL_CONFIG_RUNNING);
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
>> +			  VSDC_DISP_PANEL_START_RUNNING(output));
>> +
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
>> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +}
>> +
>> +static void vs_dc8200_enable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> +			VSDC_TOP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dc8200_disable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> +			  VSDC_TOP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dc8200_plane_commit(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			VSDC_FB_CONFIG_EX_COMMIT);
>> +}
>> +
>> +static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc,
>> unsigned int output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			VSDC_FB_CONFIG_EX_FB_EN);
>> +	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>> +
>> +	vs_dc8200_plane_commit(dc, output);
>> +}
>> +
>> +static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
>> unsigned int output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			VSDC_FB_CONFIG_EX_FB_EN);
>> +
>> +	vs_dc8200_plane_commit(dc, output);
>> +}
>> +
>> +static void vs_dc8200_primary_plane_update_ex(struct vs_dc *dc,
>> unsigned int output,
>> +				       struct drm_plane_state
>> *state)
>> +{
>> +	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>> +		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>> crtc_y));
>> +	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>> +		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>> crtc_w,
>> +					 state->crtc_y + state-
>>> crtc_h));
>> +	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>> +		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>> +
>> +	vs_dc8200_plane_commit(dc, output);
>> +}
>> +
>> +static u32 vs_dc8200_irq_ack(struct vs_dc *dc)
>> +{
>> +	u32 irqs;
>> +
>> +	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
>> +	return irqs;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dc8200_funcs = {
>> +	.panel_enable_ex		= vs_dc8200_panel_enable_ex,
>> +	.panel_disable_ex		=
>> vs_dc8200_panel_disable_ex,
>> +	.enable_vblank			= vs_dc8200_enable_vblank,
>> +	.disable_vblank			=
>> vs_dc8200_disable_vblank,
>> +	.primary_plane_enable_ex	=
>> vs_dc8200_primary_plane_enable_ex,
>> +	.primary_plane_disable_ex	=
>> vs_dc8200_primary_plane_disable_ex,
>> +	.primary_plane_update_ex	=
>> vs_dc8200_primary_plane_update_ex,
>> +	.irq_ack			= vs_dc8200_irq_ack,
>> +};
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> index 2a0f7c59afa3..91524d16f778 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> @@ -94,6 +94,7 @@ static struct vs_chip_identity vs_chip_identities[]
>> = {
>>   		.revision = 0x5720,
>>   		.customer_id = ~0U,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>> @@ -103,6 +104,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.revision = 0x5721,
>>   		.customer_id = 0x30B,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>> @@ -112,6 +114,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.revision = 0x5720,
>>   		.customer_id = 0x310,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_with_yuv444,
>> @@ -121,6 +124,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.revision = 0x5720,
>>   		.customer_id = 0x311,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> index 2065ecb73043..a15c8b565604 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> @@ -9,6 +9,11 @@
>>   #include <linux/regmap.h>
>>   #include <linux/types.h>
>>   
>> +enum vs_dc_generation {
>> +	VSDC_GEN_DC8000,
>> +	VSDC_GEN_DC8200,
>> +};
>> +
>>   struct vs_formats {
>>   	const u32 *array;
>>   	unsigned int num;
>> @@ -19,6 +24,7 @@ struct vs_chip_identity {
>>   	u32 revision;
>>   	u32 customer_id;
>>   
>> +	enum vs_dc_generation generation;
>>   	u32 display_count;
>>   	/*
>>   	 * The hardware only supports square cursor planes, so this
>> field
>> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> index 1f2be41ae496..f992cb277f61 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> @@ -53,12 +53,6 @@ static int vs_primary_plane_atomic_check(struct
>> drm_plane *plane,
>>   	return 0;
>>   }
>>   
>> -static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int
>> output)
>> -{
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_COMMIT);
>> -}
>> -
>>   static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
>>   					   struct drm_atomic_commit
>> *atomic_state)
>>   {
>> @@ -69,13 +63,8 @@ static void vs_primary_plane_atomic_enable(struct
>> drm_plane *plane,
>>   	unsigned int output = vcrtc->id;
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_FB_EN);
>> -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>> -
>> -	vs_primary_plane_commit(dc, output);
>> +	if (dc->funcs->primary_plane_enable_ex)
>> +		dc->funcs->primary_plane_enable_ex(dc, output);
>>   }
>>   
>>   static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
>> @@ -88,10 +77,8 @@ static void vs_primary_plane_atomic_disable(struct
>> drm_plane *plane,
>>   	unsigned int output = vcrtc->id;
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_FB_EN);
>> -
>> -	vs_primary_plane_commit(dc, output);
>> +	if (dc->funcs->primary_plane_disable_ex)
>> +		dc->funcs->primary_plane_disable_ex(dc, output);
>>   }
>>   
>>   static void vs_primary_plane_atomic_update(struct drm_plane *plane,
>> @@ -133,18 +120,11 @@ static void
>> vs_primary_plane_atomic_update(struct drm_plane *plane,
>>   	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
>>   		     fb->pitches[0]);
>>   
>> -	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>> crtc_y));
>> -	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>> crtc_w,
>> -					 state->crtc_y + state-
>>> crtc_h));
>>   	regmap_write(dc->regs, VSDC_FB_SIZE(output),
>>   		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state-
>>> crtc_h));
>>   
>> -	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>> -		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>> -
>> -	vs_primary_plane_commit(dc, output);
>> +	if (dc->funcs->primary_plane_update_ex)
>> +		dc->funcs->primary_plane_update_ex(dc, output,
>> state);
>>   }
>>   
>>   static const struct drm_plane_helper_funcs
>> vs_primary_plane_helper_funcs = {

