Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C777FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afZH9eP+KoE3Ta3oJntXN/TPimtdYin4QgRicypPySg=; b=eN7tNAoD72hqpo7SkfsdMeD5bg
	CRiI5pMJey57XlZ1PSvTzceHTRc5K0iYKY/dEQRAM/cX3uoa1xX3m4J3z9FwtCRk69OxjWHxYVxb0
	no8CZPys+yvlYIbdjbVhR1OKWDiFDAXLbyHFVNeTb0jjt+6+BwuzYvbmqpXR5RAttzRYIwVxIwTMc
	w7E2UE7PjCtwQNGF+zwRvehs7jNGbWX9+8uqw85aMbQs+BFgYrNbSUL2iQGzO+KFSVECAYD/bb/6n
	O51fiA7MPXKjWkbDCG2HsCXVEvrgM9KNw3ogpMU40qt6Rc7OJHuZJ2qRUkTWAWgIZwTJiDiGzWXvy
	8q47sqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnXy-0000000H3RQ-3Rsd;
	Wed, 17 Jun 2026 10:31:02 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnXw-0000000H3R5-3pBI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:31:02 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c8584e80bd9so2132174a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692260; x=1782297060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afZH9eP+KoE3Ta3oJntXN/TPimtdYin4QgRicypPySg=;
        b=mQTyI0w6tqK4exkO0i0oL/YueMBX81pncULRpY9Ef03/XZV7xj/zY0tZJHmswBMBlN
         s+dnZHH2gXtRcvI0Yc0qJCpacTmKWGb2iT8yo9bC+/j+0FwbbL5p3SMi9KEyGUHlGi8+
         KZisNdzD79rtx8Pxp37PeCdYd/0nZTqao2se/020f3odr9biihHL0FWXbm/XChb6dg+r
         gyFtE8HnEjLt83iDeRMfzNjwvcHrgyNxsiZFwH7H1UEOUdCDFFhlepWUc2sGAO9FcPXC
         a8kybYvZIioWIu37ECNo+/IPNU3AAA3l303ghKqjuInpvJKwJacWXC0sIf9yQlazTkQP
         cs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692260; x=1782297060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afZH9eP+KoE3Ta3oJntXN/TPimtdYin4QgRicypPySg=;
        b=s5OmdxNz9qYLjApQapJlz41soTOHDckcrh2s+Nroq4SDzEjfT8sqPCCodkx8F8uY7n
         QRWvAF7tKffvq++oPWqYwTXJlmJWRUOmU/wMds5jNRFsz9AEOzvZKr/8tbDb5+JcLHtu
         KdR5dXNX3+zsbdvYNDpyZ2KqigzjW6/yQMEajI47mkgiWPOk/ixidNghEUr3QSdqx92I
         rVV2WvExmpi/ENsC4JJL70qT4dNrCWJBI2TpPQiUKdo4RZ7/RQr1g0okc+VMViJdDa05
         WJHB/juV9FamtAgzngmfxmtDID1YHiA1s+V+X5VujVDmQXvrIJrn2cB1Zac4HE7ZB9+y
         dGew==
X-Forwarded-Encrypted: i=1; AFNElJ9YgXHVtDTY80haXhB8SLlJqXc7shmuWFLRC2lw/HwCizOhUGszAU162c0u5zUXvDRpqd0vwPwK3BAZSne8FgBk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8JEtnvb7PKUnjaOA7hSy785pDOCd6X7JWPp+kZ/r/fD2EuqXk
	MbMbC7qnVoBvRh92IIhYRl42q+S55GgWlmiPIXI9sT7PF7NiLIo2wsID
X-Gm-Gg: AfdE7ckALhzl67bJLoeBbbVNquKmbQlitixo4elaOmFer2zet3Jc1MKp9G7ScCgavFb
	N7u6URdXCM34nLYsTn5Vzhp7BIwkCjF8qeSADxIo0CBFM9fErtsv0+LKx1lJfwCujIdVaveSg27
	CTJdkyo3XeOtAC7GlgQKEqSbj6joyapHtTxOHaI5Ne1vNpl6sQh1BUSGmpNSFKdUbw+EDgmgHM9
	fWmz3+HBWgwrfbGbKuQvjb/gBxNbC/ripqrUAHOtLWUVn7+xzn6v+AYl8SUXE9cl56TvUTJeuCH
	A7f39ILgybFEoIk9PbYekwQ3TTg3blmFn6ZEVPXYBNddHMSxSGaekkXfmEt+Fkb5sUYyUCF3N7b
	iXE7hXsESqFPeyXvyWcDS+cfvvqOE5m/mmh0uTeWOMt/m+iVNp74Qy7sQCLNL78oWoC24HHaA4h
	rXcEtzPaVtZh4vRbIa/UirJqt0u3GgFFhHiuxpwN29YcUkulM6oAE5KtHb0GlChVSjbQ==
X-Received: by 2002:a17:902:ce91:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c6bc23de79mr28853095ad.25.1781692259833;
        Wed, 17 Jun 2026 03:30:59 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a47f8sm150830775ad.47.2026.06.17.03.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:30:59 -0700 (PDT)
Message-ID: <4414042f-56e2-495a-81c3-0040c8e1b01f@gmail.com>
Date: Wed, 17 Jun 2026 18:30:56 +0800
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
X-CRM114-CacheID: sfid-20260617_033100_955972_1E9CB725 
X-CRM114-Status: GOOD (  18.70  )
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
>
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
I will add a set of unified IRQ bit definitions (e.g. 
`VSDC_IRQ_VSYNC(n)`) in a shared header. Each `irq_ack` implementation 
will translate its hardware-specific register bits into those unified 
bits before returning, so `vs_drm_handle_irq` can use the unified 
definitions without knowing which register layout was used. Currently 
the VSYNC bits (BIT(0)/BIT(1)) coincide between DC8200 0x0010 and DC8000 
0x147C, so the translation is trivial; this change will prevent future 
confusion from diverging bit meanings (such as BIT(2)).
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
>>
>>

