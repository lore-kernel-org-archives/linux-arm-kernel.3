Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6184CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdQztf5+BODzQ2BKQCG0woCEoi72g1h/Yx/ZUsCJKos=; b=gDkZ1u/80ZMxBwV0mQlQLjif3K
	N4Q233j6xE2iWRjRRojrOtm4WHsOmk3QnJa8ud4221xfMvZ772xaYyy0ehnePUUo+K7lRXUa1u+RA
	HQxkJWYtUfLC2utHaFipg2nCVLOjaaeAskozmx8aHIVXZl5+/wEi3qyzpIgC6C8GAE25l6vhmSZh+
	HHi/yO453QO62w0tioPfDVcZf03R26Zcb6jdDAU8RBD+86aIce9Xes6OVJJqIaMwr3pRKx1Nuwu30
	q1fGNuqDonexak7XXe0fsFu/Nec4voRJToPp6Xl9fdfXVNNUeMI1vLhc88opM5K3yeZBE1cDXyVEY
	/mo7RQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWYK-00000003DTS-0XEB;
	Mon, 08 Jun 2026 09:45:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWYH-00000003DSH-3q85
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:45:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8423f420455so1650266b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911949; x=1781516749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdQztf5+BODzQ2BKQCG0woCEoi72g1h/Yx/ZUsCJKos=;
        b=poXNN1bM80JCusyNYrcpGNELc0Y+607Ldwg6vWzZWsc9eVO5N5psly0KMKHn3EJPcf
         gFWLmMS/fMP12PDPm8AS4p476RykH3q/Yq6YSkZ4Jx93mrJANtBVcfWAztJkLVGSx+L0
         oyeNQWplTDPoiMPZ9lNOKAm8r9z8RgOFylVz4rnxpbCXjgmQkX3PVRjyCkxU26G2RGGz
         NgX87ATpXh/u16/hghErC/kYhzC7inCaXhX2F8rlEQvlNQo+Vy19jK5O8LmCwr++lMir
         JWJt3B/yBWelAyXul4NwhPhbdvQAjXmz3q2f9teOHvI4k2Iji9FWvBCOiV0E0YMOs/6r
         h5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911949; x=1781516749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdQztf5+BODzQ2BKQCG0woCEoi72g1h/Yx/ZUsCJKos=;
        b=exOwgnjZ7rd08H2FOhcgDzOdmMKjuf8m50patUKCIF7MsfpML6CZvPcirKjAa21KHo
         a6aiL7/WcH3YstRQY97pu+gYUZjF1n1ZfoMW5KgfygLtyRXYalGWlpn08CERfn2Xt8tn
         yrbZow5jPyN5Q1s1i4lhH+n3Qz8kJD+oLoSVccNChRByjY7yfihtoP1Ufwe4hBGPi2Kz
         hmbFZ9jBGlNc7TPTuc3cptguSStjBmPO23sH1idYebs9x+tAqVV5ZAO+5eJjAH5qj943
         JZKNgiEsHFlaFBzlthx2VTki1tifMTvjvGQilmLSDqwVdsBhWyajJEGu9U2+BexsNie3
         8P0g==
X-Forwarded-Encrypted: i=1; AFNElJ9NKWhyQ1VqacqeWthozZEQ2wsGCSVslEENdfuXgN9LS1PNr+whkjcAYzWSnFnITPrITIeZmBTSo+oskePFXl9z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpx4eVYRquuTZ1k2X5k/96JQ2MmL27XY9nXl0/Xs8uzHEn+ymZ
	879LN/KuXGvb+ZxDR0GUWtoc6yXEX8Iry5LR0jpsjbpu+/LAKIcA84tI
X-Gm-Gg: Acq92OEnr8dVRMDu8+VWbrcpQwE9X98/3UOF8jn+kF0AyhKJ6A43U+Tojt3oOyTrtH7
	SywbSae++T3J6H6NCE6y9B3WxWUUu9mMnRkbN5Cmk+xJbE7z6SVjb3KjSeeL7p5S6GcY8XRS16f
	bc5Upve8h+2QOLW+95LK/bECPyw1ArYdu8b5Q+cJ/hFvaRUeMHVbXiIerzMHiXUasFJItKiPYog
	qtXC+/3+e9c1u2qU8SVDnAcATJoM/E0JetN/so55GqkPS65QdEbc1RR20+US7PbHDBo+pM1h1uR
	IC2LzV/Z26xgpTn/ybGLbauvwnmzI/xxzfxhI6dydfqfIzm18K85hXmORJRY1bQGJDWViAFQ99I
	hQwUWyKOZz/HiHeCGKyfS6reGxYrHepixTKzWVFoKeMRzmVVLDoYid3i6RbkEMsSRX8sqCwXN1H
	2BbJoWOTtBC0qeo03alB8KeLPNZhZrE466X3j0DS1Y4NcgmHF9buxO5gGt7NtQ7hKMMhCKLkkL3
	man+i7+4ezY2SY=
X-Received: by 2002:a05:6a00:bc81:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-842b0f6f508mr14352160b3a.32.1780911948844;
        Mon, 08 Jun 2026 02:45:48 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428235006dsm18133897b3a.13.2026.06.08.02.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:45:48 -0700 (PDT)
Message-ID: <98eb7772-257f-4fa7-8e9b-51a635cb12dd@gmail.com>
Date: Mon, 8 Jun 2026 17:45:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-4-a0987203069@gmail.com>
 <399cd127b56b4a2fb3161865a681606e04e6b2c6.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <399cd127b56b4a2fb3161865a681606e04e6b2c6.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_024549_973048_AE299359 
X-CRM114-Status: GOOD (  26.99  )
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


On 6/8/2026 2:24 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 10:32 +0800，Joey Lu写道：
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
>>    bridge_enable / bridge_disable - PANEL_CONFIG/START + CONFIG_EX
>> commit
>>    enable_vblank / disable_vblank - TOP_IRQ_EN VSYNC bit
>>    plane_enable_ex / disable_ex / update_ex - FB_CONFIG_EX path
>>    irq_handler - reads TOP_IRQ_ACK
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
>>   drivers/gpu/drm/verisilicon/vs_dc.h           |  33 ++++++
>>   drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107
>> ++++++++++++++++++
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
>>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
>>   9 files changed, 197 insertions(+), 51 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
> ============ 8< ==================
>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>> index 7a93049368db..6a9af10c64e6 100644
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
>> +	dc->funcs->bridge_enable(dc, output);
> The code here being called "bridge" is only internal to kernel. Naming
> it in such a way is okay, but maybe naming it "panel" is better
> (because they're configuring PANEL-named registers).
>
> And, as the common code setting common fields of DcregPanelConfig0 is
> still here, maybe the helper name should be named "panel_enable_ex" (or
> "bridge_enable_ex") ?
Understood. I will rename `bridge_enable`/`bridge_disable` to 
`panel_enable_ex`/`panel_disable_ex` throughout: in `vs_dc_funcs`, 
`vs_dc8200.c`, `vs_dc8000.c`, and the call sites in `vs_bridge.c`.
>>   }
>>   
>>   static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
> ====== 8< ==============
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index dad9967bc10b..c94957024189 100644
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
>> +	irqs = dc->funcs->irq_handler(dc);
> The IRQ isn't handled in this helper.
>
> So maybe call it "irq_ack"?
Understood. I will rename `irq_handler` to `irq_ack` in `vs_dc_funcs`, 
`vs_dc8200.c`, `vs_dc8000.c`, and the call site in `vs_dc.c`.
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
>> index ed1016f18758..d77d4a1babdf 100644
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
>> +	void (*bridge_enable)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*bridge_disable)(struct vs_dc *dc, unsigned int
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
>> +	void (*plane_enable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*plane_disable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*plane_update_ex)(struct vs_dc *dc, unsigned int
>> output,
>> +				struct drm_plane_state *state);
>> +
>> +	/* IRQ handler */
>> +	u32 (*irq_handler)(struct vs_dc *dc);
> See my comments elsewhere for the helper naming.
Understood. I will rename all vtable members per the comments above: 
`panel_enable_ex`, `panel_disable_ex`, `primary_plane_enable`, 
`primary_plane_disable`, `primary_plane_update`, `irq_ack`.
>> +};
>>   
>>   struct vs_dc {
>>   	struct regmap *regs;
> ============= 8< =================
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
>> index 1f2be41ae496..75bc36a078f7 100644
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
>> +	if (dc->funcs->plane_enable_ex)
>> +		dc->funcs->plane_enable_ex(dc, output);
> Please note that all theae codes are for primary planes, maybe the
> helper should be named mentioning primary. Overlay planes will need a
> different codepath because they change different registers.
>
> Thanks,
> Icenowy
Understood. To avoid confusion, I will rename `plane_enable_ex`, 
`plane_disable_ex`, and `plane_update_ex` to `primary_plane_enable`, 
`primary_plane_disable`, and `primary_plane_update` in `vs_dc_funcs`, 
`vs_dc8200.c`, and `vs_primary_plane.c`.
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
>> +	if (dc->funcs->plane_disable_ex)
>> +		dc->funcs->plane_disable_ex(dc, output);
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
>> +	if (dc->funcs->plane_update_ex)
>> +		dc->funcs->plane_update_ex(dc, output, state);
>>   }
>>   
>>   static const struct drm_plane_helper_funcs
>> vs_primary_plane_helper_funcs = {

