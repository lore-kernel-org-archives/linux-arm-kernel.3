Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B9C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cza9Th0sPiRMc13Ig3jOFIk7DARH9TKpcluZTG4rxs=; b=HPI4EX3/jlJB2Tjkzp2GmmxpPk
	xAqozGdOVaymy8Ln4FzRQBu+JJiRKpw9mPcfGnDksKphbjoNuoc/mV+wg8CiImkzL0r4okiZ8lH9o
	68QWdY/WCnbWu0mGsyhr6lSp35HcK+VB3/zJE8KbBO6aMTLYEwzIxNLfBVWK7QStfMRTvOXWa6/6K
	imAUiim5TDEqoz48KOCf2lPeNt04dBsm7Bb8qdJ1DRVEZ++bmipTml27OECMiZB8TQrmemFoUfip4
	mqMppvYYAmhevadHq6EHtkDh0Khafc6tEg3qXzt+9T9raG6Uv2fqwNLCwnY8dWuM8jSObxHnOL4mK
	mOxQir5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74yY-0000000Aczq-1eZr;
	Thu, 17 Sep 2026 05:48:02 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74yV-0000000AczU-01jE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:48:00 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so424803b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789624077; x=1790228877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8cza9Th0sPiRMc13Ig3jOFIk7DARH9TKpcluZTG4rxs=;
        b=kxcCYVAypHisVp4mOlHMXMx9pFqno11DRyrRi7JhYONCaq3ZBtkJUAxgeq0gWxP6LZ
         UZSFupcadqtG+VGR4PTyU/qUs4EjayGcHrM2pG0NDKe1+7+vlzEVwseRgFg2Ey7/bp3t
         omKxJJODRbRBrz4qTskshxnaLomUEUKSkvXhM7RFL7h7hcU/O1qGnKxagu177Ukhl57D
         YfnK/mh3So357xxfn7ocjFNHFIeAz44jyb07TH2b9MeEYeCxnqjbauXhYV6SZyMJiWQh
         1wsLuOgodMHFA1BMab7yzvMDPvkVIeWVHWRx3GZ3ucNXrpCPaJA/NwrAjNT0p3XEf8tR
         VIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624077; x=1790228877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cza9Th0sPiRMc13Ig3jOFIk7DARH9TKpcluZTG4rxs=;
        b=N2hqWB10ft5MHorZk3Ked3gz0Y9RXfYz4oB0/f9oS5Wqa6c7zHrRqQw4eAVXmpIVkI
         aMwcziYu0MeHlUWL/Wsrj7KUJbBLgHequz0jaV+QTcUBC3XbBYjyIqu9eUV+znYaHC/5
         PZ0jvL3CzpVB8yjrv/qvae+kCByfUUH349uJAzwr1ZjtMbvDuI+aKwa6rxuDENnLej2t
         zsKWw/GTbF/DrahOLSqSGFqMcrYFIlOuRklHV0h+Qx+wc2Fc825oTzX4bAcCJyA70fkh
         QoXa/jSmMTz6PJq4P2h5P4nxWEwt4jjNVdgwnALU2CKWsLMssO8ZFFMDrZ1CYkCtEteA
         uWnw==
X-Forwarded-Encrypted: i=1; AKwUvBwM5+W6f3ogG4njU4Zwh12F0g+YOf04CVvu68TPG50RnWxp6H6yUgVpggvFP77DmkMuBSDJS5ZrTkkUSRAmi0H9@lists.infradead.org
X-Gm-Message-State: AFuF++m9aBpmXB3nEG9Ph9KPxmKh10w+lRtZDQb7ypDjBsUeJ+tC/q1g
	v3FKPEnN4YFowrb1/ZMFC70eyJNbBG57cJ32JhTGBDQ2i7GPSVVdFvZT
X-Gm-Gg: AYBFou2mr9vmPL3YMmS3uOHgupsMforM6K3vhcJhqwdxvjQHQjjmvaNJqtNDN7DTXr6
	02eVsMnMsatTOIYN+6NVhFpfcIp28qdiEMRVYczA7dGFO5Vkej3qpPvbdZwmB1TOILsMiGTAAkZ
	zQudmgjtKDMbgi31GiqNL2CgvnY50y2KN/xHMi7CF9NXRibGDQ4Nk/2YR556ygNHB+sqY/r0WhW
	wbr+GxOI2mekt7HlQhiUWMyeIiWvJWcszEQkUk+c9xhgCComvxijWXpKCIiI9sumAYdcbgGig+u
	f1XRXr74GEJlKESMKbhChiS4FNdrODlhR9tuv8rXlyWqjYOzLaFt8grqZyHuxTw9n1RmAo5LtN3
	aU85JDzRUQBXEd/+uo/UAaFrwzWeG5/nQIw6snBCZrQGHo1CS7OHADS3TYHFEnVLaGYQzK2DIiN
	QI60Ka+wxAwTbyNtRQ7xy7OB6MnnXAFM8S6Z8jAXDzbHTCOt9Haj/hU3CstoyfJz5zBelT/RBXq
	DoaNAT7/2swc3Ho9/SCuyZheEJvHZUz65gXRYPraNksT5RtR/IdOty9AKBQRKya1A==
X-Received: by 2002:a05:6a00:2d02:b0:855:74f7:40c2 with SMTP id d2e1a72fcca58-87238d83d98mr10732501b3a.14.1789624077207;
        Wed, 16 Sep 2026 22:47:57 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87200c58282sm2253352b3a.15.2026.09.16.22.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:47:56 -0700 (PDT)
Message-ID: <8c86d372-20a6-4327-a5a1-27d806ec06cb@gmail.com>
Date: Thu, 17 Sep 2026 13:47:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-4-a0987203069@gmail.com>
 <eacd63daeef147657329edbad4cff7b85f2dba8c.camel@iscas.ac.cn>
 <0e3ac531-aae3-402d-9d24-87d75295f382@gmail.com>
 <3db5c4507f68bae2d6b1679bb29ad9f7fd2e4ad8.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <3db5c4507f68bae2d6b1679bb29ad9f7fd2e4ad8.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_224759_097435_EDDF75E1 
X-CRM114-Status: GOOD (  14.40  )
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


Icenowy Zheng 於 2026/9/16 下午 05:39 寫道:
> 在 2026-09-15二的 10:06 +0800，Joey Lu写道：
>> Icenowy Zheng 於 2026/9/14 下午 11:00 寫道:
>>> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
>>>> The DC8200 and DCUltraLite share a broadly similar register
>>>> layout
>>>> but
>>>> differ in how the bridge, CRTC, primary plane and IRQ paths are
>>>> driven.
>>>> Introduce a vs_dc_funcs vtable so each variant can supply its own
>>>> implementation without scattering conditionals across multiple
>>>> files.
>>>>
>>>> Add a generation field to struct vs_chip_identity to distinguish
>>>> variants.
>>>> Extract the DC8200-specific hardware ops into vs_dc8200.c and add
>>>> unified
>>>> IRQ bit definitions so implementations can translate hardware-
>>>> specific
>>>> bits to a common set.  Update the shared code to dispatch through
>>>> dc->funcs.
>>>>
>>>> No behaviour change for existing DC8200 platforms.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>>> ---
>>>>    drivers/gpu/drm/verisilicon/Makefile          |   2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
>>>>    drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.h           |  32 +++++
>>>>    drivers/gpu/drm/verisilicon/vs_dc8200.c       | 121
>>>> ++++++++++++++++++
>>>>    drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
>>>>    drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
>>>>    drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
>>>>    drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
>>>>    .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
>>>>    11 files changed, 220 insertions(+), 54 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
>>>>
>>>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>>>> b/drivers/gpu/drm/verisilicon/Makefile
>>>> index 426f4bcaa834d..9d4cd16452fa1 100644
>>>> --- a/drivers/gpu/drm/verisilicon/Makefile
>>>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>>>> @@ -1,6 +1,6 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>    
>>>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o
>>>> vs_hwdb.o \
>>>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>>>> vs_drm.o vs_hwdb.o \
>>>>    	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>>>    
>>>>    obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> index dc7c85b07fe32..3fbc8d57f8a1e 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> @@ -162,15 +162,8 @@ static void vs_bridge_enable_common(struct
>>>> vs_crtc *crtc,
>>>>    			VSDC_DISP_PANEL_CONFIG_DE_EN |
>>>>    			VSDC_DISP_PANEL_CONFIG_DAT_EN |
>>>>    			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>> -	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>> -			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			
>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			VSDC_DISP_PANEL_START_RUNNING(output));
>>>> -
>>>> -	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>> id),
>>>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>> +
>>>> +	dc->funcs->panel_enable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static void vs_bridge_atomic_enable_dpi(struct drm_bridge
>>>> *bridge,
>>>> @@ -228,14 +221,7 @@ static void vs_bridge_atomic_disable(struct
>>>> drm_bridge *bridge,
>>>>    	struct vs_dc *dc = crtc->dc;
>>>>    	unsigned int output = crtc->id;
>>>>    
>>>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC
>>>> |
>>>> -			
>>>> VSDC_DISP_PANEL_START_RUNNING(output));
>>>> -	regmap_clear_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>> -			  VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>> -
>>>> -	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>> id),
>>>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>> +	dc->funcs->panel_disable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c
>>>> b/drivers/gpu/drm/verisilicon/vs_crtc.c
>>>> index c24c1588cbe69..2d4bf6af1f56e 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
>>>> @@ -16,10 +16,33 @@
>>>>    #include "vs_crtc_regs.h"
>>>>    #include "vs_crtc.h"
>>>>    #include "vs_dc.h"
>>>> -#include "vs_dc_top_regs.h"
>>>>    #include "vs_drm.h"
>>>>    #include "vs_plane.h"
>>>>    
>>>> +static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
>>>> +				  struct drm_atomic_commit
>>>> *state)
>>>> +{
>>>> +	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>>> +	struct vs_dc *dc = vcrtc->dc;
>>>> +	unsigned int output = vcrtc->id;
>>>> +
>>>> +	if (dc->funcs->crtc_begin)
>>>> +		dc->funcs->crtc_begin(dc, output);
>>>> +}
>>>> +
>>>> +static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
>>>> +				  struct drm_atomic_commit
>>>> *state)
>>>> +{
>>>> +	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>>> +	struct vs_dc *dc = vcrtc->dc;
>>>> +	unsigned int output = vcrtc->id;
>>>> +
>>>> +	if (dc->funcs->crtc_flush)
>>>> +		dc->funcs->crtc_flush(dc, output);
>>>> +
>>>> +	drm_crtc_vblank_atomic_flush(crtc, state);
>>>> +}
>>>> +
>>>>    static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
>>>>    				   struct drm_atomic_commit
>>>> *state)
>>>>    {
>>>> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct
>>>> drm_crtc
>>>> *crtc,
>>>>    	drm_crtc_vblank_off(crtc);
>>>>    
>>>>    	clk_disable_unprepare(dc->pix_clk[output]);
>>>> +
>>>> +	if (dc->funcs->crtc_disable_ex)
>>>> +		dc->funcs->crtc_disable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>>>> @@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct
>>>> drm_crtc
>>>> *crtc,
>>>>    	drm_WARN_ON(&dc->drm_dev->base,
>>>>    		    clk_prepare_enable(dc->pix_clk[output]));
>>>>    
>>>> +	if (dc->funcs->crtc_enable_ex)
>>>> +		dc->funcs->crtc_enable_ex(dc, output);
>>>> +
>>>>    	drm_crtc_vblank_on(crtc);
>>>>    }
>>>>    
>>>> @@ -119,7 +148,8 @@ static bool vs_crtc_mode_fixup(struct
>>>> drm_crtc
>>>> *crtc,
>>>>    }
>>>>    
>>>>    static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs
>>>> = {
>>>> -	.atomic_flush	= drm_crtc_vblank_atomic_flush,
>>>> +	.atomic_begin	= vs_crtc_atomic_begin,
>>>> +	.atomic_flush	= vs_crtc_atomic_flush,
>>>>    	.atomic_enable	= vs_crtc_atomic_enable,
>>>>    	.atomic_disable	= vs_crtc_atomic_disable,
>>>>    	.mode_set_nofb	= vs_crtc_mode_set_nofb,
>>>> @@ -132,7 +162,7 @@ static int vs_crtc_enable_vblank(struct
>>>> drm_crtc
>>>> *crtc)
>>>>    	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>>>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>>>> +	dc->funcs->enable_vblank(dc, vcrtc->id);
>>>>    
>>>>    	return 0;
>>>>    }
>>>> @@ -142,7 +172,7 @@ static void vs_crtc_disable_vblank(struct
>>>> drm_crtc *crtc)
>>>>    	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>>>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>>>> +	dc->funcs->disable_vblank(dc, vcrtc->id);
>>>>    }
>>>>    
>>>>    static const struct drm_crtc_funcs vs_crtc_funcs = {
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> index dad9967bc10b8..9729b693d360e 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>>>> @@ -8,9 +8,7 @@
>>>>    #include <linux/of.h>
>>>>    #include <linux/of_graph.h>
>>>>    
>>>> -#include "vs_crtc.h"
>>>>    #include "vs_dc.h"
>>>> -#include "vs_dc_top_regs.h"
>>>>    #include "vs_drm.h"
>>>>    #include "vs_hwdb.h"
>>>>    
>>>> @@ -33,7 +31,7 @@ static irqreturn_t vs_dc_irq_handler(int irq,
>>>> void
>>>> *private)
>>>>    	struct vs_dc *dc = private;
>>>>    	u32 irqs;
>>>>    
>>>> -	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
>>>> +	irqs = dc->funcs->irq_ack(dc);
>>>>    
>>>>    	vs_drm_handle_irq(dc, irqs);
>>>>    
>>>> @@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device
>>>> *pdev)
>>>>    	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>>>> identity.model,
>>>>    		 dc->identity.revision, dc-
>>>>> identity.customer_id);
>>>>    
>>>> +	dc->funcs = &vs_dc8200_funcs;
>>>> +
>>>>    	if (port_count > dc->identity.display_count) {
>>>>    		dev_err(dev, "too many downstream ports than HW
>>>> capability\n");
>>>>    		ret = -EINVAL;
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>>>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>>>> index ed1016f18758e..825f5dd6bf174 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>>>> @@ -14,6 +14,7 @@
>>>>    #include <linux/reset.h>
>>>>    
>>>>    #include <drm/drm_device.h>
>>>> +#include <drm/drm_plane.h>
>>>>    
>>>>    #include "vs_hwdb.h"
>>>>    
>>>> @@ -22,6 +23,34 @@
>>>>    
>>>>    struct vs_drm_dev;
>>>>    struct vs_crtc;
>>>> +struct vs_dc;
>>>> +
>>>> +struct vs_dc_funcs {
>>>> +	/* Bridge: atomic_enable, atomic_disable */
>>>> +	void (*panel_enable_ex)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +	void (*panel_disable_ex)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +
>>>> +	/* CRTC: atomic_begin, atomic_flush */
>>>> +	void (*crtc_begin)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +	void (*crtc_flush)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +
>>>> +	/* CRTC: atomic_enable, atomic_disable */
>>>> +	void (*crtc_enable_ex)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +	void (*crtc_disable_ex)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +
>>>> +	/* CRTC: enable_vblank, disable_vblank */
>>>> +	void (*enable_vblank)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +	void (*disable_vblank)(struct vs_dc *dc, unsigned int
>>>> output);
>>>> +
>>>> +	/* Primary plane: atomic_enable, atomic_disable,
>>>> atomic_update */
>>>> +	void (*primary_plane_enable_ex)(struct vs_dc *dc,
>>>> unsigned
>>>> int output);
>>>> +	void (*primary_plane_disable_ex)(struct vs_dc *dc,
>>>> unsigned
>>>> int output);
>>>> +	void (*primary_plane_update_ex)(struct vs_dc *dc,
>>>> unsigned
>>>> int output,
>>>> +					struct drm_plane_state
>>>> *state);
>>>> +
>>>> +	/* IRQ acknowledge */
>>>> +	u32 (*irq_ack)(struct vs_dc *dc);
>>>> +};
>>>>    
>>>>    struct vs_dc {
>>>>    	struct regmap *regs;
>>>> @@ -33,6 +62,9 @@ struct vs_dc {
>>>>    
>>>>    	struct vs_drm_dev *drm_dev;
>>>>    	struct vs_chip_identity identity;
>>>> +	const struct vs_dc_funcs *funcs;
>>>>    };
>>>>    
>>>> +extern const struct vs_dc_funcs vs_dc8200_funcs;
>>>> +
>>>>    #endif /* _VS_DC_H_ */
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>>>> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>>>> new file mode 100644
>>>> index 0000000000000..77752d0cb28b0
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>>>> @@ -0,0 +1,121 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
>>>> + */
>>>> +
>>>> +#include <linux/regmap.h>
>>>> +
>>>> +#include <drm/drm_print.h>
>>>> +
>>>> +#include "vs_bridge_regs.h"
>>>> +#include "vs_dc.h"
>>>> +#include "vs_dc_top_regs.h"
>>>> +#include "vs_drm.h"
>>>> +#include "vs_plane.h"
>>>> +#include "vs_primary_plane_regs.h"
>>>> +
>>>> +static void vs_dc8200_panel_enable_ex(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> +{
>>>> +	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>> +			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> +			
>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> +			VSDC_DISP_PANEL_START_RUNNING(output));
>>>> +
>>>> +	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(output),
>>>> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>> +}
>>>> +
>>>> +static void vs_dc8200_panel_disable_ex(struct vs_dc *dc,
>>>> unsigned
>>>> int output)
>>>> +{
>>>> +	regmap_clear_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>> +			  VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC
>>>> |
>>>> +			
>>>> VSDC_DISP_PANEL_START_RUNNING(output));
>>>> +
>>>> +	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(output),
>>>> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>> +}
>>>> +
>>>> +static void vs_dc8200_enable_vblank(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> +{
>>>> +	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>>>> +			VSDC_TOP_IRQ_VSYNC(output));
>>>> +}
>>>> +
>>>> +static void vs_dc8200_disable_vblank(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> +{
>>>> +	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>>>> +			  VSDC_TOP_IRQ_VSYNC(output));
>>>> +}
>>>> +
>>>> +static void vs_dc8200_plane_commit(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> +{
>>>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> +			VSDC_FB_CONFIG_EX_COMMIT);
>>>> +}
>>>> +
>>>> +static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc,
>>>> unsigned int output)
>>>> +{
>>>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> +			VSDC_FB_CONFIG_EX_FB_EN);
>>>> +	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>>>> +			
>>>> VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>>>> +
>>>> +	vs_dc8200_plane_commit(dc, output);
>>>> +}
>>>> +
>>>> +static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
>>>> unsigned int output)
>>>> +{
>>>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> +			VSDC_FB_CONFIG_EX_FB_EN);
>>> I think I messed up the DC8200 codepath here -- the FB_EN bit
>>> should be
>>> cleared instead of set.
>>>
>>> Would you mind I fix this when applying, or would you send a new
>>> revision fixing this?
>>>
>>> In the latter case, should I send a fix to the current code before?
>>>
>>> Thanks,
>>> Icenowy
>> Please go ahead and fix it when applying -- I'm happy with that.
>> Thanks!
> I'm going to apply [1] to the fixes branch, which seems to be
> introducing merge conflict with this patch.
>
> In addition, checkpatch.pl reports some parenthesis alignment issues on
> this patch.
>
> Maybe it's worth sending a v7 resolving all these problems on this
> patch (DC8200 FB_EN clear_bits, parenthesis alignment, rebase on [1]).
>
> Thanks,
> Icenowy
>
> [1]
> https://lore.kernel.org/all/20260910095000.3505878-1-zhengxingda@iscas.ac.cn/
Understood. The conflict is from a commit that landed after v6 went out, 
a rebase resolves it cleanly.
I'll fix the parenthesis-alignment issues too, and send v7 rebased on 
top, including the port@1
restriction from patch 1 and the DC8200 FB_EN set/clear fix as its own 
dedicated commit.

Thanks.
>>>> +
>>>> +	vs_dc8200_plane_commit(dc, output);
>>>> +}
>>>> +
>>>> +static void vs_dc8200_primary_plane_update_ex(struct vs_dc *dc,
>>>> unsigned int output,
>>>> +				       struct drm_plane_state
>>>> *state)
>>>> +{
>>>> +	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>>>> +		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>>>> crtc_y));
>>>> +	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>>>> +		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>>>> crtc_w,
>>>> +					 state->crtc_y + state-
>>>>> crtc_h));
>>>> +	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>>>> +		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>>>> +
>>>> +	vs_dc8200_plane_commit(dc, output);
>>>> +}
>>>> +
>>>> +static u32 vs_dc8200_irq_ack(struct vs_dc *dc)
>>>> +{
>>>> +	u32 hw_irqs, unified = 0, known = 0;
>>>> +	unsigned int i;
>>>> +
>>>> +	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &hw_irqs);
>>>> +
>>>> +	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
>>>> +		known |= VSDC_TOP_IRQ_VSYNC(i);
>>>> +		if (hw_irqs & VSDC_TOP_IRQ_VSYNC(i))
>>>> +			unified |= VSDC_IRQ_VSYNC(i);
>>>> +	}
>>>> +
>>>> +	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
>>>> +		      "Unknown hardware IRQ bits: %#x\n",
>>>> hw_irqs &
>>>> ~known);
>>>> +
>>>> +	return unified;
>>>> +}
>>>> +
>>>> +const struct vs_dc_funcs vs_dc8200_funcs = {
>>>> +	.panel_enable_ex		=
>>>> vs_dc8200_panel_enable_ex,
>>>> +	.panel_disable_ex		=
>>>> vs_dc8200_panel_disable_ex,
>>>> +	.enable_vblank			=
>>>> vs_dc8200_enable_vblank,
>>>> +	.disable_vblank			=
>>>> vs_dc8200_disable_vblank,
>>>> +	.primary_plane_enable_ex	=
>>>> vs_dc8200_primary_plane_enable_ex,
>>>> +	.primary_plane_disable_ex	=
>>>> vs_dc8200_primary_plane_disable_ex,
>>>> +	.primary_plane_update_ex	=
>>>> vs_dc8200_primary_plane_update_ex,
>>>> +	.irq_ack			= vs_dc8200_irq_ack,
>>>> +};
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_drm.c
>>>> b/drivers/gpu/drm/verisilicon/vs_drm.c
>>>> index fd259d53f49f1..24e9d0b008f31 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_drm.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_drm.c
>>>> @@ -25,7 +25,6 @@
>>>>    #include "vs_bridge.h"
>>>>    #include "vs_crtc.h"
>>>>    #include "vs_dc.h"
>>>> -#include "vs_dc_top_regs.h"
>>>>    #include "vs_drm.h"
>>>>    
>>>>    #define DRIVER_NAME	"verisilicon"
>>>> @@ -168,8 +167,8 @@ void vs_drm_handle_irq(struct vs_dc *dc, u32
>>>> irqs)
>>>>    	unsigned int i;
>>>>    
>>>>    	for (i = 0; i < dc->identity.display_count; i++) {
>>>> -		if (irqs & VSDC_TOP_IRQ_VSYNC(i)) {
>>>> -			irqs &= ~VSDC_TOP_IRQ_VSYNC(i);
>>>> +		if (irqs & VSDC_IRQ_VSYNC(i)) {
>>>> +			irqs &= ~VSDC_IRQ_VSYNC(i);
>>>>    			if (dc->drm_dev->crtcs[i])
>>>>    				drm_crtc_handle_vblank(&dc-
>>>>> drm_dev-
>>>>> crtcs[i]->base);
>>>>    		}
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_drm.h
>>>> b/drivers/gpu/drm/verisilicon/vs_drm.h
>>>> index 606338206a427..6a89c20879df7 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_drm.h
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_drm.h
>>>> @@ -6,6 +6,7 @@
>>>>    #ifndef _VS_DRM_H_
>>>>    #define _VS_DRM_H_
>>>>    
>>>> +#include <linux/bits.h>
>>>>    #include <linux/platform_device.h>
>>>>    #include <linux/types.h>
>>>>    
>>>> @@ -13,6 +14,13 @@
>>>>    
>>>>    struct vs_dc;
>>>>    
>>>> +/*
>>>> + * DC variants use different interrupt registers with diverging
>>>> bit
>>>> + * assignments; each irq_ack() implementation must translate its
>>>> + * hardware-specific bits into these definitions.
>>>> + */
>>>> +#define VSDC_IRQ_VSYNC(n)	BIT(n)
>>>> +
>>>>    struct vs_drm_dev {
>>>>    	struct drm_device base;
>>>>    
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>>>> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>>>> index 2a0f7c59afa3a..91524d16f7785 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>>>> @@ -94,6 +94,7 @@ static struct vs_chip_identity
>>>> vs_chip_identities[]
>>>> = {
>>>>    		.revision = 0x5720,
>>>>    		.customer_id = ~0U,
>>>>    
>>>> +		.generation = VSDC_GEN_DC8200,
>>>>    		.display_count = 2,
>>>>    		.max_cursor_size = 64,
>>>>    		.formats = &vs_formats_no_yuv444,
>>>> @@ -103,6 +104,7 @@ static struct vs_chip_identity
>>>> vs_chip_identities[] = {
>>>>    		.revision = 0x5721,
>>>>    		.customer_id = 0x30B,
>>>>    
>>>> +		.generation = VSDC_GEN_DC8200,
>>>>    		.display_count = 2,
>>>>    		.max_cursor_size = 64,
>>>>    		.formats = &vs_formats_no_yuv444,
>>>> @@ -112,6 +114,7 @@ static struct vs_chip_identity
>>>> vs_chip_identities[] = {
>>>>    		.revision = 0x5720,
>>>>    		.customer_id = 0x310,
>>>>    
>>>> +		.generation = VSDC_GEN_DC8200,
>>>>    		.display_count = 2,
>>>>    		.max_cursor_size = 64,
>>>>    		.formats = &vs_formats_with_yuv444,
>>>> @@ -121,6 +124,7 @@ static struct vs_chip_identity
>>>> vs_chip_identities[] = {
>>>>    		.revision = 0x5720,
>>>>    		.customer_id = 0x311,
>>>>    
>>>> +		.generation = VSDC_GEN_DC8200,
>>>>    		.display_count = 2,
>>>>    		.max_cursor_size = 64,
>>>>    		.formats = &vs_formats_no_yuv444,
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>>>> b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>>>> index 2065ecb730437..a15c8b5656044 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>>>> @@ -9,6 +9,11 @@
>>>>    #include <linux/regmap.h>
>>>>    #include <linux/types.h>
>>>>    
>>>> +enum vs_dc_generation {
>>>> +	VSDC_GEN_DC8000,
>>>> +	VSDC_GEN_DC8200,
>>>> +};
>>>> +
>>>>    struct vs_formats {
>>>>    	const u32 *array;
>>>>    	unsigned int num;
>>>> @@ -19,6 +24,7 @@ struct vs_chip_identity {
>>>>    	u32 revision;
>>>>    	u32 customer_id;
>>>>    
>>>> +	enum vs_dc_generation generation;
>>>>    	u32 display_count;
>>>>    	/*
>>>>    	 * The hardware only supports square cursor planes, so
>>>> this
>>>> field
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> index 2750016a7f2c3..85ba2068172db 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> @@ -54,12 +54,6 @@ static int
>>>> vs_primary_plane_atomic_check(struct
>>>> drm_plane *plane,
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -static void vs_primary_plane_commit(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> -{
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_COMMIT);
>>>> -}
>>>> -
>>>>    static void vs_primary_plane_atomic_enable(struct drm_plane
>>>> *plane,
>>>>    					   struct
>>>> drm_atomic_commit
>>>> *atomic_state)
>>>>    {
>>>> @@ -70,13 +64,8 @@ static void
>>>> vs_primary_plane_atomic_enable(struct
>>>> drm_plane *plane,
>>>>    	unsigned int output = vcrtc->id;
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_FB_EN);
>>>> -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>>>> -			
>>>> VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->primary_plane_enable_ex)
>>>> +		dc->funcs->primary_plane_enable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static void vs_primary_plane_atomic_disable(struct drm_plane
>>>> *plane,
>>>> @@ -89,10 +78,8 @@ static void
>>>> vs_primary_plane_atomic_disable(struct
>>>> drm_plane *plane,
>>>>    	unsigned int output = vcrtc->id;
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_FB_EN);
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->primary_plane_disable_ex)
>>>> +		dc->funcs->primary_plane_disable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static void vs_primary_plane_atomic_update(struct drm_plane
>>>> *plane,
>>>> @@ -138,18 +125,11 @@ static void
>>>> vs_primary_plane_atomic_update(struct drm_plane *plane,
>>>>    	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
>>>>    		     fb->pitches[0]);
>>>>    
>>>> -	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>>>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>>>> crtc_y));
>>>> -	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>>>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>>>> crtc_w,
>>>> -					 state->crtc_y + state-
>>>>> crtc_h));
>>>>    	regmap_write(dc->regs, VSDC_FB_SIZE(output),
>>>>    		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state-
>>>>> crtc_h));
>>>>    
>>>> -	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>>>> -		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->primary_plane_update_ex)
>>>> +		dc->funcs->primary_plane_update_ex(dc, output,
>>>> state);
>>>>    }
>>>>    
>>>>    static const struct drm_plane_helper_funcs
>>>> vs_primary_plane_helper_funcs = {

