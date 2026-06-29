Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96787C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 03:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHpuX3/a4rLx+oG6FpCTCKFsJQAXtFDQXA44kUZyzFE=; b=vnkuxC5UIvVqAGt4+vA6XHfyXQ
	d3IFkiFBLvPvYjTyv0UaSvCYvyN6E9EA+ISWWp5BBGDAjVw885rbLF3HNtyKcbQMlVA845C9ocmyK
	ukKOmSwTpj2hD1QFoYqHghPYPQNq18Haxr3IvbKx7308BaWz5l+K5nU4cyDvZhzj07JGnIoXMWuLI
	91Lz7AwcYMCBH9IGQfF5e0HNv/U3uEsbj9PSdIOs3UyDduoMw+z/SOyRkmCD8sj9othk2ZWXi9HDa
	Tzoov3noTrw36Xvn95YQGo2U0xuzZwexgfhwhBVFMYSIB6BST2f7NaAiNRMSE6Q2iZFCSmuZiBFJ+
	W70yz19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we33A-0000000DeKp-0Ywg;
	Mon, 29 Jun 2026 03:52:48 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we337-0000000DeKR-3UbB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 03:52:47 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-846970f0acaso703045b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782705165; x=1783309965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHpuX3/a4rLx+oG6FpCTCKFsJQAXtFDQXA44kUZyzFE=;
        b=dsbb3sd0ZAUC49OCLrqino3w4t23c7sqF2efZdDCq9F/0IvFnlbGfgm5Z2vWRT/9oY
         iPy8LNUHSh9NYuckI8U51rLTvetX7JkEC5va7IepPRFXchGpx5KkBypxkW/hAIEWNiwH
         Ahbpdjydyy0at5Dk1S/W59W0iSN/wF0J+7wK0D4LFzyhXEHivlSdSkBMy97Mp9z/Ru5C
         3yNVClFqDh9Bs88r3T29jK9u8QK4AWXO+W1cFYuB4xhbhatFfHcDGbf0kUf6ohrMLAFm
         R8khFoYCZT5/hW/U+MuFMvBR6A2A33kKeGpit/gIl/fV/MFWMTL4DZ18A2YpNnZNdc/i
         5gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782705165; x=1783309965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHpuX3/a4rLx+oG6FpCTCKFsJQAXtFDQXA44kUZyzFE=;
        b=c9dYfE6dlYyWkRg8Wc5wmq4jqOa98P9ulcqrM/mQLGSv3xc9GtfMP6cl/pQ3J/EyNH
         EmEC74KqpC9x1tzSEXfyPxkc/BbXnT5sTS6tPr0xT1w58xcU7ueolhD8+nzMqzkz6j3U
         0m2skQ9e1BoRWn60jykBPdelVakx+bz16NyvqyI+H0O6t45yFq6dGJv3ceQ7Qotcub66
         8d3z/e9cS51AVLX2/HIz0KNCk6e+/AbZ+IS0D+UZxtoFDj4WbozvaOA3t6475G+8QXbs
         sYpKb6treJmV1Uiu29NZmn3QkWJdle4MByeM2dr3x9OnebH3xvfXazcWFGzzlveIkjzE
         HSdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq//fQH/745u3gaVPgWGXxeF+MSXlz/2nHLMhQnVkyk8Ul2uSPfCyzAiz9zI+i0WJqhAG9yRcrFDVLHTuF9NGM5@lists.infradead.org
X-Gm-Message-State: AOJu0YweXJ/RaWUBzVTbKR6sxytrYXNQT5a9KmmNwKPU9rwyOMPM8HKT
	BcScctHpLLBlY7CbClPdwH/LIV5LBdU/VNiVOnElEBVM1eSwbMaoNBFT
X-Gm-Gg: AfdE7ck6zheqvY6X29iXygR4xuq++eP1wsX2vHbth0kEf9CUOkHKbORIj+IcQqppGkj
	lBoc17mc5X3c7e+PI7+7zei/xlhTNwrpNsf+5+sjlOM7v1CocPsF/0SZ/zecEPc9unrdLZW7/fE
	9LPfgM/GoXZgQP1Y5OVRDbsWOqFkhQzZoWo7O3w++shPaI44J592LRgEiFkxs7Nz7ZvCP6g1BYO
	IiAFB8xU1FvAZf1a9KPEJqsH6YHhHMUy3w6kRhUF3q42opmhiYTWZawVX5jkZIrU+QKdkppr3I4
	zwkcQJh55GP1SynqPNxW9EcAnXW+ZoGagHZKm+Eti4LvR4ev2AbnDFL6rag5TM+8eoeHVUBOpBp
	gBVKiImjfVnTmB33vWGWSCfPeD07uKYcNf0Rhh2H5xW5l1eXKUB7MwQYH+nVj6ZHefhhG0Og1tZ
	s4tgMvvaGhy8BqNzXOe9GZzFu/DpzUN+Nwh0JccYpiFMw1QCNodhHmu+5HNzDeKAG3GQ==
X-Received: by 2002:a05:6a00:a253:b0:847:904c:8452 with SMTP id d2e1a72fcca58-847904c8acbmr387489b3a.38.1782705164634;
        Sun, 28 Jun 2026 20:52:44 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8477d93c895sm1555761b3a.60.2026.06.28.20.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 20:52:43 -0700 (PDT)
Message-ID: <c9630909-6361-44b8-ab6b-4e625bcf7e36@gmail.com>
Date: Mon, 29 Jun 2026 11:52:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-4-a0987203069@gmail.com>
 <c842f858313732bd774abd2840cc97f730ac2e9f.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <c842f858313732bd774abd2840cc97f730ac2e9f.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_205245_924690_3F5C6EFF 
X-CRM114-Status: GOOD (  21.27  )
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


On 6/26/2026 4:02 PM, Icenowy Zheng wrote:
> 在 2026-06-25四的 17:44 +0800，Joey Lu写道：
>> The DC8200 and DCUltraLite share a broadly similar register layout
>> but
>> differ in how the bridge, CRTC, primary plane and IRQ paths are
>> driven.
>> Introduce a vs_dc_funcs vtable so each variant can supply its own
>> implementation without scattering conditionals across multiple files.
>>
>> Add a generation field to struct vs_chip_identity to distinguish
>> variants.
>> Extract the DC8200-specific hardware ops into vs_dc8200.c and add
>> unified
>> IRQ bit definitions so implementations can translate hardware-
>> specific
>> bits to a common set.  Update the shared code to dispatch through
>> dc->funcs.
>>
>> No behaviour change for existing DC8200 platforms.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile          |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
>>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
>>   drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.h           |  32 +++++
>>   drivers/gpu/drm/verisilicon/vs_dc8200.c       | 115
>> ++++++++++++++++++
>>   drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
>>   drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
>>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
>>   11 files changed, 214 insertions(+), 54 deletions(-)
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
>> index dc7c85b07fe3..3fbc8d57f8a1 100644
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
>> index 0b8a35d09cd2..1c4aac708669 100644
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
>> +	if (dc->funcs->crtc_disable_ex)
>> +		dc->funcs->crtc_disable_ex(dc, output);
>>   }
>>   
>>   static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>> @@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc
>> *crtc,
>>   	drm_WARN_ON(&dc->drm_dev->base,
>>   		    clk_prepare_enable(dc->pix_clk[output]));
>>   
>> +	if (dc->funcs->crtc_enable_ex)
>> +		dc->funcs->crtc_enable_ex(dc, output);
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
>> index ed1016f18758..825f5dd6bf17 100644
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
>> +	void (*crtc_enable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*crtc_disable_ex)(struct vs_dc *dc, unsigned int
>> output);
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
>> index 000000000000..17378f4ef96d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> @@ -0,0 +1,115 @@
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
>> +#include "vs_drm.h"
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
>> +	u32 hw_irqs, unified = 0;
>> +	unsigned int i;
>> +
>> +	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &hw_irqs);
>> +
>> +	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
>> +		if (hw_irqs & VSDC_TOP_IRQ_VSYNC(i))
>> +			unified |= VSDC_IRQ_VSYNC(i);
>> +	}
> Maybe add a drm_WARN_ONCE for unknown hardware IRQ bit?
>
> Well, with this addressed,
>
> ```
> Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ```
>
> Thanks,
> Icenowy
I will add a `drm_WARN_ONCE` after the IRQ translation loop in
`vs_dc8200_irq_ack` to catch any unknown hardware IRQ bits.


