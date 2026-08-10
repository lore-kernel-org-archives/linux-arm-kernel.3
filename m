Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A4DC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHJ83uvM1NCh1qyCT+sxeUDWxe5LiEwDoP2C2a4ZwKQ=; b=uKoCGtGvyt+CXlbUsPqlVFOj/1
	l7ZkpbiPpPsR4Hb9mnJJoJoaNm6JiMEitfYj9+tfjN3J6WJrXsxReLVqcQX11LyWZPAD6YYm8Z/jh
	eQxTVP1XzJ6C/IYQoIccdowtv6GJr00nCD6cGW3rDY/HMKsyF0rWcnADRAzk9Q9zmEhiLAMCLtfvZ
	kEn5Oo4WiU06vSoenUDqiuTKEkhZlQ0k2WKCN1Qvb4T8XsRpoy1hfQSaxUbIGqAc2qM6nQpfZcs7q
	LGu0xNSbDuESVKMU5m7ApPJ+Jx3ryCtsjz04SaRW9kBX3b5e0VA+9xq/q2YqEhp6xoeBojRThkiiM
	stnLfz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXbX-0000000CuTh-1kcc;
	Mon, 10 Aug 2026 21:32:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXbU-0000000CuSy-0rvS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xHJ83uvM1NCh1qyCT+sxeUDWxe5LiEwDoP2C2a4ZwKQ=;
	b=bm+LRypHZ8Ok2H+t9+wiOz5U77D8Jt0AM38i3xCLpTB0UbpdhkselTHellpTE4PkUhJDBD
	Wtkj1GdB8jT541+Vv94CAoqDPo8NxTWbBfrFvjLE0pHbrptg+eAPkDhb+eeps9q8JYQdzM
	OcNtI+o5aheCwL8jE1GoCKOIqac8NyU=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-efejkfhSOkKdll5cFCJp7A-1; Mon, 10 Aug 2026 17:32:07 -0400
X-MC-Unique: efejkfhSOkKdll5cFCJp7A-1
X-Mimecast-MFC-AGG-ID: efejkfhSOkKdll5cFCJp7A_1786397527
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-668a55b1809so7070023d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397527; x=1787002327;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHJ83uvM1NCh1qyCT+sxeUDWxe5LiEwDoP2C2a4ZwKQ=;
        b=e2D+mnKAFQR27odx53Gx91rWlX+TXH3t1sv2/FY2F1QrQazeqfv7CrRkA4QFBJyF3b
         lrUFcUrZfuUnYETnb6tctVn0DnExVnOKBoNXw8FUg84LOOaT9JaEtQJ4QobcNnzy5Ine
         3vWsEhD3RwNtTpSjCMOzeTUL1PiD6FfaX0PBRkcFzYmzCMNOmDOWDwHymrXS+j/ekEMW
         V8/l33GhFwQKbUCink4B2AGqa9403ZQ6lJXohYT1V2+45IvsQewUq4cUUiVWIePZFW7N
         e60+m2u2Tx9thvs1QKjbUMYW60yI6KTyPcHL5HSw3JDYt046OPBaFb6SuWQf2KL7RbLx
         rVrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUB+S4Zn/YQzLd6b+FzvjPlYhbJQ54Apn6/Inl0Em3ErW0fX84Q4++D3x91wSRuCmR0t5Nn5ii6Sjfrvq9Zfwm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyua2zlV+j5Wz19CCcsM/IQH/R4yDEq0zIFwIIsF8g5TlwVgBpI
	FQ0nY2X+sTaqymn27j3t1mchsrTFqQFjLh1jZYRlDBbrPlM2T1CsKPc79AP9iqCD+QY5UEkukfG
	Ilx/zkbc6o0XLAhmQSlku5Zui+ycY+KUfu9W+VuOWdsEaaWnnDFMcFy4skDm5yRrRV3JQH2FAoT
	Im
X-Gm-Gg: AR+sD121OouhzgPJ5rvjP8Zx3ByviRTTNGhjNuBPbWn0B6nB01/ndISBUHvteKjVlIM
	tPs4u1aoFistSsPeZHPNY/p4U86njP4AfDOE+v0bchjCC/ICrDkpwsrYdAcpThIl+kUeJmJD2tj
	8CjW9A1IFtrewB2j1hMO1VxPY+m/0MhrcoKlxYyUAEtqUSyL2JFc+DlUSJWW5jSlVZCNH1krFBz
	d18gSD3MBZtrJv13x6DZ6Hm7BIvDN6xLHWYjlZPtQXJY/4JiYVDQPwtAc5DnUfHZIXC0ARDIBwA
	9HoI0focszMo7iY/m4fja35+2qrA4XvUBr5n74kjOi/OyTwEk7SNA/AuYv28g379SinCOKPtGiT
	8N7zLyxCW6XuM7sbaXfJBrBCxtnIBqIrabGs=
X-Received: by 2002:a53:dd03:0:b0:664:a1a9:9921 with SMTP id 956f58d0204a3-66ad7395a61mr10386259d50.48.1786397526738;
        Mon, 10 Aug 2026 14:32:06 -0700 (PDT)
X-Received: by 2002:a53:dd03:0:b0:664:a1a9:9921 with SMTP id 956f58d0204a3-66ad7395a61mr10386183d50.48.1786397525909;
        Mon, 10 Aug 2026 14:32:05 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acacdbe56sm7218877d50.1.2026.08.10.14.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:32:05 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:32:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <anpDUnVfh1KAsRzr@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-10-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260804163807.1285869-10-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o7bXiDbnx4MOtS2d7_CbCAwwBw2Q4tVuzt_iuBkBAuQ_1786397527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_143216_471570_F3E41082 
X-CRM114-Status: GOOD (  26.38  )
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

Hi Yu-Chun,

On Wed, Aug 05, 2026 at 12:38:05AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the CRT (Clock, Reset, and Test) domain clock controller
> on the Realtek RTD1625 SoC. This driver provides essential clock sources
> (including PLLs), gating, and multiplexing functionalities for the
> platform's peripherals.
> 
> Because the reset controller shares the same register space with this
> CRT clock controller, this driver also acts as the parent device and
> registers the reset controller as an auxiliary device on the auxiliary
> bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v12:
> - Replace of_device_get_match_data() with device_get_match_data().
> - Use module_platform_driver().
> - Add spaces near {}.
> - Remove .suppress_bind_attrs and add .remove callback.
> ---
>  drivers/clk/realtek/Kconfig           |  15 +
>  drivers/clk/realtek/Makefile          |   1 +
>  drivers/clk/realtek/clk-rtd1625-crt.c | 798 ++++++++++++++++++++++++++
>  3 files changed, 814 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
> 
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index 2ff780581ae0..94a92b29d891 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -30,4 +30,19 @@ config RTK_CLK_COMMON
>  config RTK_CLK_PLL_MMC
>  	bool
>  
> +config CLK_RTD1625
> +	tristate "RTD1625 Clock Controller"
> +	depends on RESET_CONTROLLER
> +	select RESET_RTD1625
> +	select RTK_CLK_COMMON
> +	select RTK_CLK_PLL_MMC
> +	help
> +	  Support for the clock controller on Realtek RTD1625 SoCs.
> +
> +	  This driver provides clock sources, gating, multiplexing, and
> +	  reset control for peripherals on the RTD1625 platform.
> +
> +	  Say Y here if your system is based on the RTD1625 and you need
> +	  its peripheral devices to function.
> +
>  endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 52b9cb9c2323..52d5d1b18104 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -8,3 +8,4 @@ clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/clk-rtd1625-crt.c
> new file mode 100644
> index 000000000000..982ef73785ac
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c
> @@ -0,0 +1,798 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include "clk-pll.h"
> +#include "clk-regmap-gate.h"
> +#include "clk-regmap-mux.h"
> +
> +#define RTD1625_CRT_CLK_MAX	172
> +#define RTD1625_CRT_RSTN_MAX	123
> +
> +#define RTD1625_REG_PLL_ACPU1			0x10c
> +#define RTD1625_REG_PLL_ACPU2			0x110
> +#define RTD1625_REG_PLL_SSC_DIG_ACPU0		0x5c0
> +#define RTD1625_REG_PLL_SSC_DIG_ACPU1		0x5c4
> +#define RTD1625_REG_PLL_SSC_DIG_ACPU2		0x5c8
> +#define RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2	0x5dc
> +
> +#define RTD1625_REG_PLL_VE1_1			0x114
> +#define RTD1625_REG_PLL_VE1_2			0x118
> +#define RTD1625_REG_PLL_SSC_DIG_VE1_0		0x580
> +#define RTD1625_REG_PLL_SSC_DIG_VE1_1		0x584
> +#define RTD1625_REG_PLL_SSC_DIG_VE1_2		0x588
> +#define RTD1625_REG_PLL_SSC_DIG_VE1_DBG2	0x59c
> +
> +#define RTD1625_REG_PLL_GPU1			0x1c0
> +#define RTD1625_REG_PLL_GPU2			0x1c4
> +#define RTD1625_REG_PLL_SSC_DIG_GPU0		0x5a0
> +#define RTD1625_REG_PLL_SSC_DIG_GPU1		0x5a4
> +#define RTD1625_REG_PLL_SSC_DIG_GPU2		0x5a8
> +#define RTD1625_REG_PLL_SSC_DIG_GPU_DBG2	0x5bc
> +
> +#define RTD1625_REG_PLL_NPU1			0x1c8
> +#define RTD1625_REG_PLL_NPU2			0x1cc
> +#define RTD1625_REG_PLL_SSC_DIG_NPU0		0x800
> +#define RTD1625_REG_PLL_SSC_DIG_NPU1		0x804
> +#define RTD1625_REG_PLL_SSC_DIG_NPU2		0x808
> +#define RTD1625_REG_PLL_SSC_DIG_NPU_DBG2	0x81c
> +
> +#define RTD1625_REG_PLL_VE2_1			0x1d0
> +#define RTD1625_REG_PLL_VE2_2			0x1d4
> +#define RTD1625_REG_PLL_SSC_DIG_VE2_0		0x5e0
> +#define RTD1625_REG_PLL_SSC_DIG_VE2_1		0x5e4
> +#define RTD1625_REG_PLL_SSC_DIG_VE2_2		0x5e8
> +#define RTD1625_REG_PLL_SSC_DIG_VE2_DBG2	0x5fc
> +
> +#define RTD1625_REG_PLL_HIFI1			0x1d8
> +#define RTD1625_REG_PLL_HIFI2			0x1dc
> +#define RTD1625_REG_PLL_SSC_DIG_HIFI0		0x6e0
> +#define RTD1625_REG_PLL_SSC_DIG_HIFI1		0x6e4
> +#define RTD1625_REG_PLL_SSC_DIG_HIFI2		0x6e8
> +#define RTD1625_REG_PLL_SSC_DIG_HIFI_DBG2	0x6fc
> +
> +#define RTD1625_REG_PLL_BUS1	0x524
> +
> +#define RTD1625_REG_PLL_SSC_DIG_DDSA1	0x564
> +
> +#define RTD1625_REG_PLL_SSC_DIG_DCSB1	0x544
> +
> +static const char * const clk_gpu_parents[] = {"pll_gpu", "clk_sys"};
> +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x28, 12, 0x1);
> +static const char * const clk_ve_parents[] = {"pll_vo", "clk_sysh", "pll_ve1", "pll_ve2"};
> +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 0, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 3, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 6, 0x3);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_misc, CLK_IS_CRITICAL, 0x50, 0, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_pcie0, 0, 0x50, 2, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_gspi, 0, 0x50, 6, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_iso_misc, 0, 0x50, 10, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sds, 0, 0x50, 12, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_hdmi, 0, 0x50, 14, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_gpu, "clk_gpu", CLK_SET_RATE_PARENT, 0x50, 18, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ve1, "clk_ve1", CLK_SET_RATE_PARENT, 0x50, 20, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ve2, "clk_ve2", CLK_SET_RATE_PARENT, 0x50, 22, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_md, 0, 0x54, 4, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_tp, CLK_IS_CRITICAL, 0x54, 6, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_rcic, 0, 0x54, 8, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_nf, 0, 0x54, 10, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_emmc, 0, 0x54, 12, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sd, 0, 0x54, 14, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sdio_ip, 0, 0x54, 16, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mipi_csi, 0, 0x54, 18, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_emmc_ip, "pll_emmc", CLK_SET_RATE_PARENT, 0x54, 20, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sdio, 0, 0x54, 22, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sd_ip, 0, 0x54, 24, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_tpb, 0, 0x54, 28, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_sc1, "clk_en_misc", 0, 0x54, 30, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_i2c_3, "clk_en_misc", 0, 0x58, 0, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_jpeg, 0, 0x58, 4, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_acpu, "pll_acpu", CLK_SET_RATE_PARENT,
> +			   0x58, 6, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_sc0, "clk_en_misc", 0, 0x58, 10, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_hdmirx, 0, 0x58, 26, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_hse, CLK_IS_CRITICAL, 0x58, 28, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_fan, 0, 0x5c, 2, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sata_wrap_sys, 0, 0x5c, 8, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sata_wrap_sysh, 0, 0x5c, 10, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_sata_mac_sysh, 0, 0x5c, 12, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_r2rdsc, 0, 0x5c, 14, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_pcie1, 0, 0x5c, 18, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_i2c_4, "clk_en_misc", 0, 0x5c, 20, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_i2c_5, "clk_en_misc", 0, 0x5c, 22, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_tsio, 0, 0x5c, 24, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ve4, "clk_ve4", CLK_SET_RATE_PARENT,
> +			   0x5c, 26, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_edp, 0, 0x5c, 28, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_tsio_trx, 0, 0x5c, 30, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_pcie2, 0, 0x8c, 0, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_earc, 0, 0x8c, 4, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_lite, 0, 0x8c, 6, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mipi_dsi, 0, 0x8c, 8, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_npupp, 0, 0x8c, 10, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_npu, 0, 0x8c, 12, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu0, 0, 0x8c, 14, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu1, 0, 0x8c, 16, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_nsram, 0, 0x8c, 18, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_hdmitop, 0, 0x8c, 20, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu_iso_npu, 0, 0x8c, 24, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_keyladder, 0, 0x8c, 26, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_ifcp_klm, 0, 0x8c, 28, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_ifcp, 0, 0x8c, 30, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_genpw, 0, 0xb0, 0, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_chip, 0, 0xb0, 2, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_ip, 0, 0xb0, 4, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mdlm2m, 0, 0xb0, 6, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_mdl_xtal, 0, 0xb0, 8, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_test_mux, 0, 0xb0, 10, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_dla, 0, 0xb0, 12, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_tpcw, 0, 0xb0, 16, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_gpu_ts_src, 0, 0xb0, 18, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_vi, 0, 0xb0, 22, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_lvds1, 0, 0xb0, 24, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_lvds2, 0, 0xb0, 26, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_aucpu, 0, 0xb0, 28, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur1, "clk_en_ur_top", 0, 0x884, 0, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur2, "clk_en_ur_top", 0, 0x884, 2, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur3, "clk_en_ur_top", 0, 0x884, 4, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur4, "clk_en_ur_top", 0, 0x884, 6, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur5, "clk_en_ur_top", 0, 0x884, 8, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur6, "clk_en_ur_top", 0, 0x884, 10, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur7, "clk_en_ur_top", 0, 0x884, 12, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur8, "clk_en_ur_top", 0, 0x884, 14, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_ur9, "clk_en_ur_top", 0, 0x884, 16, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_ur_top, CLK_IS_CRITICAL, 0x884, 18, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_i2c_7, "clk_en_misc", 0, 0x884, 28, 1);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_i2c_6, "clk_en_misc", 0, 0x884, 30, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_spi0, 0, 0x894, 0, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_spi1, 0, 0x894, 2, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_spi2, 0, 0x894, 4, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_lsadc0, 0, 0x894, 16, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_lsadc1, 0, 0x894, 18, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_isomis_dma, 0, 0x894, 20, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_dptx, 0, 0x894, 24, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_npu_mipi_csi, 0, 0x894, 26, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_edptx, 0, 0x894, 28, 1);
> +
> +#define FREQ_NF_MASK       0x7ffff
> +#define FREQ_NF(_r, _nf)   {.rate = _r, .val = (_nf),}
> +
> +static struct clk_fixed_rate pll_vo = {
> +	.fixed_rate = 634500000,
> +	.hw.init = CLK_HW_INIT_NO_PARENT("pll_vo", &clk_fixed_rate_ops, 0),
> +};
> +
> +static const struct rtk_freq_table acpu_tbl[] = {
> +	FREQ_NF(513000000, 0x11000),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct rtk_freq_table ve_tbl[] = {
> +	FREQ_NF(553500000, 0x12800),
> +	FREQ_NF(661500000, 0x16800),
> +	FREQ_NF(688500000, 0x17800),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct rtk_freq_table bus_tbl[] = {
> +	FREQ_NF(513000000, 0x11000),
> +	FREQ_NF(540000000, 0x12000),
> +	FREQ_NF(553500000, 0x12800),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct rtk_freq_table ddsa_tbl[] = {
> +	FREQ_NF(432000000, 0xe000),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct rtk_freq_table gpu_tbl[] = {
> +	FREQ_NF(405000000, 0xd000),
> +	FREQ_NF(540000000, 0x12000),
> +	FREQ_NF(661500000, 0x16800),
> +	FREQ_NF(729000000, 0x19000),
> +	FREQ_NF(810000000, 0x1c000),
> +	FREQ_NF(850500000, 0x1d800),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct rtk_freq_table hifi_tbl[] = {
> +	FREQ_NF(756000000, 0x1a000),
> +	FREQ_NF(810000000, 0x1c000),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct rtk_freq_table npu_tbl[] = {
> +	FREQ_NF(661500000, 0x16800),
> +	FREQ_NF(729000000, 0x19000),
> +	FREQ_NF(810000000, 0x1c000),
> +	FREQ_TABLE_END
> +};
> +
> +static const struct reg_sequence pll_acpu_seq_power_on[] = {
> +	{RTD1625_REG_PLL_ACPU2,         0x5},
> +	{RTD1625_REG_PLL_ACPU2,         0x7},
> +	{RTD1625_REG_PLL_ACPU1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU2, 0x1e1f8e},
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5, 200},
> +	{RTD1625_REG_PLL_ACPU2,         0x3},
> +};
> +
> +static const struct reg_sequence pll_acpu_seq_power_off[] = {
> +	{RTD1625_REG_PLL_ACPU2,         0x4},
> +};
> +
> +static const struct reg_sequence pll_acpu_seq_pre_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
> +};
> +
> +static const struct reg_sequence pll_acpu_seq_post_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5},
> +};
> +
> +static struct rtk_clk_regmap_pll pll_acpu = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_acpu", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
> +	.seq_power_on          = pll_acpu_seq_power_on,
> +	.num_seq_power_on      = ARRAY_SIZE(pll_acpu_seq_power_on),
> +	.seq_power_off         = pll_acpu_seq_power_off,
> +	.num_seq_power_off     = ARRAY_SIZE(pll_acpu_seq_power_off),
> +	.seq_pre_set_freq      = pll_acpu_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_acpu_seq_pre_set_freq),
> +	.seq_post_set_freq     = pll_acpu_seq_post_set_freq,
> +	.num_seq_post_set_freq = ARRAY_SIZE(pll_acpu_seq_post_set_freq),
> +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_ACPU1,
> +	.freq_tbl              = acpu_tbl,
> +	.freq_mask             = FREQ_NF_MASK,
> +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2,
> +	.freq_ready_mask       = BIT(20),
> +	.freq_ready_val        = BIT(20),
> +	.power_reg             = RTD1625_REG_PLL_ACPU2,
> +	.power_mask            = 0x7,
> +	.power_val_on          = 0x3,
> +	.lock                  = __SPIN_LOCK_UNLOCKED(pll_acpu.lock),
> +};
> +
> +static const struct reg_sequence pll_ve1_seq_power_on[] = {
> +	{RTD1625_REG_PLL_VE1_2,         0x5},
> +	{RTD1625_REG_PLL_VE1_2,         0x7},
> +	{RTD1625_REG_PLL_VE1_1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x5, 200},
> +	{RTD1625_REG_PLL_VE1_2,         0x3},
> +};
> +
> +static const struct reg_sequence pll_ve1_seq_power_off[] = {
> +	{RTD1625_REG_PLL_VE1_2,         0x4},
> +};
> +
> +static const struct reg_sequence pll_ve1_seq_pre_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x4},
> +};
> +
> +static const struct reg_sequence pll_ve1_seq_post_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_VE1_0, 0x5},
> +};
> +
> +static struct rtk_clk_regmap_pll pll_ve1 = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_ve1", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
> +	.seq_power_on          = pll_ve1_seq_power_on,
> +	.num_seq_power_on      = ARRAY_SIZE(pll_ve1_seq_power_on),
> +	.seq_power_off         = pll_ve1_seq_power_off,
> +	.num_seq_power_off     = ARRAY_SIZE(pll_ve1_seq_power_off),
> +	.seq_pre_set_freq      = pll_ve1_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_ve1_seq_pre_set_freq),
> +	.seq_post_set_freq     = pll_ve1_seq_post_set_freq,
> +	.num_seq_post_set_freq = ARRAY_SIZE(pll_ve1_seq_post_set_freq),
> +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_VE1_1,
> +	.freq_tbl              = ve_tbl,
> +	.freq_mask             = FREQ_NF_MASK,
> +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_VE1_DBG2,
> +	.freq_ready_mask       = BIT(20),
> +	.freq_ready_val        = BIT(20),
> +	.power_reg             = RTD1625_REG_PLL_VE1_2,
> +	.power_mask            = 0x7,
> +	.power_val_on          = 0x3,
> +	.lock                  = __SPIN_LOCK_UNLOCKED(pll_ve1.lock),
> +};
> +
> +static struct rtk_clk_regmap_pll pll_ddsa = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_ddsa", "osc27m", &rtk_clk_pll_ro_ops,
> +				    CLK_GET_RATE_NOCACHE),
> +	.freq_reg     = RTD1625_REG_PLL_SSC_DIG_DDSA1,
> +	.freq_tbl     = ddsa_tbl,
> +	.freq_mask    = FREQ_NF_MASK,
> +	.lock         = __SPIN_LOCK_UNLOCKED(pll_ddsa.lock),
> +};
> +
> +static struct rtk_clk_regmap_pll pll_bus = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_bus", "osc27m", &rtk_clk_pll_ro_ops,
> +				    CLK_GET_RATE_NOCACHE),
> +	.freq_reg     = RTD1625_REG_PLL_BUS1,
> +	.freq_tbl     = bus_tbl,
> +	.freq_mask    = FREQ_NF_MASK,
> +	.lock         = __SPIN_LOCK_UNLOCKED(pll_bus.lock),
> +};
> +
> +static CLK_FIXED_FACTOR(clk_sys, "clk_sys", "pll_bus", 2, 1, 0);
> +
> +static struct rtk_clk_regmap_pll pll_dcsb = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_dcsb", "osc27m", &rtk_clk_pll_ro_ops,
> +				    CLK_GET_RATE_NOCACHE),
> +	.freq_reg     = RTD1625_REG_PLL_SSC_DIG_DCSB1,
> +	.freq_tbl     = bus_tbl,
> +	.freq_mask    = FREQ_NF_MASK,
> +	.lock         = __SPIN_LOCK_UNLOCKED(pll_dcsb.lock),
> +};
> +
> +static CLK_FIXED_FACTOR(clk_sysh, "clk_sysh", "pll_dcsb", 1, 1, 0);
> +
> +static const struct reg_sequence pll_gpu_seq_power_on[] = {
> +	{RTD1625_REG_PLL_GPU2,         0x5},
> +	{RTD1625_REG_PLL_GPU2,         0x7},
> +	{RTD1625_REG_PLL_GPU1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x5, 200},
> +	{RTD1625_REG_PLL_GPU2,         0x3},
> +};
> +
> +static const struct reg_sequence pll_gpu_seq_power_off[] = {
> +	{RTD1625_REG_PLL_GPU2,         0x4},
> +};
> +
> +static const struct reg_sequence pll_gpu_seq_pre_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x4},
> +};
> +
> +static const struct reg_sequence pll_gpu_seq_post_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_GPU0, 0x5},
> +};
> +
> +static struct rtk_clk_regmap_pll pll_gpu = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_gpu", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),

The = alignment doesn't match the rest. Either make them all match for
consistency, or just don't  add the extra spaces at all.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

Brian


> +	.seq_power_on          = pll_gpu_seq_power_on,
> +	.num_seq_power_on      = ARRAY_SIZE(pll_gpu_seq_power_on),
> +	.seq_power_off         = pll_gpu_seq_power_off,
> +	.num_seq_power_off     = ARRAY_SIZE(pll_gpu_seq_power_off),
> +	.seq_pre_set_freq      = pll_gpu_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_gpu_seq_pre_set_freq),
> +	.seq_post_set_freq     = pll_gpu_seq_post_set_freq,
> +	.num_seq_post_set_freq = ARRAY_SIZE(pll_gpu_seq_post_set_freq),
> +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_GPU1,
> +	.freq_tbl              = gpu_tbl,
> +	.freq_mask             = FREQ_NF_MASK,
> +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_GPU_DBG2,
> +	.freq_ready_mask       = BIT(20),
> +	.freq_ready_val        = BIT(20),
> +	.power_reg             = RTD1625_REG_PLL_GPU2,
> +	.power_mask            = 0x7,
> +	.power_val_on          = 0x3,
> +	.lock                  = __SPIN_LOCK_UNLOCKED(pll_gpu.lock),
> +};
> +
> +static const struct reg_sequence pll_npu_seq_power_on[] = {
> +	{RTD1625_REG_PLL_NPU2,         0x5},
> +	{RTD1625_REG_PLL_NPU2,         0x7},
> +	{RTD1625_REG_PLL_NPU1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x5, 200},
> +	{RTD1625_REG_PLL_NPU2,         0x3},
> +};
> +
> +static const struct reg_sequence pll_npu_seq_power_off[] = {
> +	{RTD1625_REG_PLL_NPU2,         0x4},
> +	{RTD1625_REG_PLL_NPU1,         0x54010},
> +};
> +
> +static const struct reg_sequence pll_npu_seq_pre_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x4},
> +};
> +
> +static const struct reg_sequence pll_npu_seq_post_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_NPU0, 0x5},
> +};
> +
> +static struct rtk_clk_regmap_pll pll_npu = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_npu", "osc27m", &rtk_clk_pll_ops,
> +				    CLK_GET_RATE_NOCACHE),
> +	.seq_power_on          = pll_npu_seq_power_on,
> +	.num_seq_power_on      = ARRAY_SIZE(pll_npu_seq_power_on),
> +	.seq_power_off         = pll_npu_seq_power_off,
> +	.num_seq_power_off     = ARRAY_SIZE(pll_npu_seq_power_off),
> +	.seq_pre_set_freq      = pll_npu_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_npu_seq_pre_set_freq),
> +	.seq_post_set_freq     = pll_npu_seq_post_set_freq,
> +	.num_seq_post_set_freq = ARRAY_SIZE(pll_npu_seq_post_set_freq),
> +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_NPU1,
> +	.freq_tbl              = npu_tbl,
> +	.freq_mask             = FREQ_NF_MASK,
> +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_NPU_DBG2,
> +	.freq_ready_mask       = BIT(20),
> +	.freq_ready_val        = BIT(20),
> +	.power_reg             = RTD1625_REG_PLL_NPU2,
> +	.power_mask            = 0x7,
> +	.power_val_on          = 0x3,
> +	.lock                  = __SPIN_LOCK_UNLOCKED(pll_npu.lock),
> +};
> +
> +static CLK_FIXED_FACTOR(clk_npu, "clk_npu", "pll_npu", 1, 1, CLK_SET_RATE_PARENT);
> +static CLK_FIXED_FACTOR(clk_npu_mipi_csi, "clk_npu_mipi_csi", "pll_npu", 1, 1,
> +			CLK_SET_RATE_PARENT);
> +
> +static const struct reg_sequence pll_ve2_seq_power_on[] = {
> +	{RTD1625_REG_PLL_VE2_2,         0x5},
> +	{RTD1625_REG_PLL_VE2_2,         0x7},
> +	{RTD1625_REG_PLL_VE2_1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x5, 200},
> +	{RTD1625_REG_PLL_VE2_2,         0x3},
> +};
> +
> +static const struct reg_sequence pll_ve2_seq_power_off[] = {
> +	{RTD1625_REG_PLL_VE2_2,         0x4},
> +};
> +
> +static const struct reg_sequence pll_ve2_seq_pre_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x4},
> +};
> +
> +static const struct reg_sequence pll_ve2_seq_post_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_VE2_0, 0x5},
> +};
> +
> +static struct rtk_clk_regmap_pll pll_ve2 = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_ve2", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
> +	.seq_power_on          = pll_ve2_seq_power_on,
> +	.num_seq_power_on      = ARRAY_SIZE(pll_ve2_seq_power_on),
> +	.seq_power_off         = pll_ve2_seq_power_off,
> +	.num_seq_power_off     = ARRAY_SIZE(pll_ve2_seq_power_off),
> +	.seq_pre_set_freq      = pll_ve2_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_ve2_seq_pre_set_freq),
> +	.seq_post_set_freq     = pll_ve2_seq_post_set_freq,
> +	.num_seq_post_set_freq = ARRAY_SIZE(pll_ve2_seq_post_set_freq),
> +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_VE2_1,
> +	.freq_tbl              = ve_tbl,
> +	.freq_mask             = FREQ_NF_MASK,
> +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_VE2_DBG2,
> +	.freq_ready_mask       = BIT(20),
> +	.freq_ready_val        = BIT(20),
> +	.power_reg             = RTD1625_REG_PLL_VE2_2,
> +	.power_mask            = 0x7,
> +	.power_val_on          = 0x3,
> +	.lock                  = __SPIN_LOCK_UNLOCKED(pll_ve2.lock),
> +};
> +
> +static const struct reg_sequence pll_hifi_seq_power_on[] = {
> +	{RTD1625_REG_PLL_HIFI2,         0x5},
> +	{RTD1625_REG_PLL_HIFI2,         0x7},
> +	{RTD1625_REG_PLL_HIFI1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x5, 200},
> +	{RTD1625_REG_PLL_HIFI2,         0x3},
> +};
> +
> +static const struct reg_sequence pll_hifi_seq_power_off[] = {
> +	{RTD1625_REG_PLL_HIFI2,         0x4},
> +};
> +
> +static const struct reg_sequence pll_hifi_seq_pre_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x4},
> +};
> +
> +static const struct reg_sequence pll_hifi_seq_post_set_freq[] = {
> +	{RTD1625_REG_PLL_SSC_DIG_HIFI0, 0x5},
> +};
> +
> +static struct rtk_clk_regmap_pll pll_hifi = {
> +	.clkr.hw.init = CLK_HW_INIT("pll_hifi", "osc27m", &rtk_clk_pll_ops, CLK_GET_RATE_NOCACHE),
> +	.seq_power_on          = pll_hifi_seq_power_on,
> +	.num_seq_power_on      = ARRAY_SIZE(pll_hifi_seq_power_on),
> +	.seq_power_off         = pll_hifi_seq_power_off,
> +	.num_seq_power_off     = ARRAY_SIZE(pll_hifi_seq_power_off),
> +	.seq_pre_set_freq      = pll_hifi_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  = ARRAY_SIZE(pll_hifi_seq_pre_set_freq),
> +	.seq_post_set_freq     = pll_hifi_seq_post_set_freq,
> +	.num_seq_post_set_freq = ARRAY_SIZE(pll_hifi_seq_post_set_freq),
> +	.freq_reg              = RTD1625_REG_PLL_SSC_DIG_HIFI1,
> +	.freq_tbl              = hifi_tbl,
> +	.freq_mask             = FREQ_NF_MASK,
> +	.freq_ready_reg        = RTD1625_REG_PLL_SSC_DIG_HIFI_DBG2,
> +	.freq_ready_mask       = BIT(20),
> +	.freq_ready_val        = BIT(20),
> +	.power_reg             = RTD1625_REG_PLL_HIFI2,
> +	.power_mask            = 0x7,
> +	.power_val_on          = 0x3,
> +	.lock                  = __SPIN_LOCK_UNLOCKED(pll_hifi.lock),
> +};
> +
> +static CLK_FIXED_FACTOR(pll_emmc_ref, "pll_emmc_ref", "osc27m", 1, 1, 0);
> +
> +static struct rtk_clk_regmap_pll_mmc pll_emmc = {
> +	.pll_ofs        = 0x1f0,
> +	.ssc_dig_ofs    = 0x6b0,
> +	.clkr.hw.init   = CLK_HW_INIT("pll_emmc", "pll_emmc_ref", &rtk_clk_pll_mmc_ops, 0),
> +	.phase0_hw.init = CLK_HW_INIT("pll_emmc_vp0", "pll_emmc", &rtk_clk_pll_mmc_phase_ops, 0),
> +	.phase1_hw.init = CLK_HW_INIT("pll_emmc_vp1", "pll_emmc", &rtk_clk_pll_mmc_phase_ops, 0),
> +};
> +
> +static struct rtk_clk_regmap *rtd1625_crt_regmap_clks[] = {
> +	&clk_en_misc.clkr,
> +	&clk_en_pcie0.clkr,
> +	&clk_en_gspi.clkr,
> +	&clk_en_iso_misc.clkr,
> +	&clk_en_sds.clkr,
> +	&clk_en_hdmi.clkr,
> +	&clk_en_gpu.clkr,
> +	&clk_en_ve1.clkr,
> +	&clk_en_ve2.clkr,
> +	&clk_en_md.clkr,
> +	&clk_en_tp.clkr,
> +	&clk_en_rcic.clkr,
> +	&clk_en_nf.clkr,
> +	&clk_en_emmc.clkr,
> +	&clk_en_sd.clkr,
> +	&clk_en_sdio_ip.clkr,
> +	&clk_en_mipi_csi.clkr,
> +	&clk_en_emmc_ip.clkr,
> +	&clk_en_sdio.clkr,
> +	&clk_en_sd_ip.clkr,
> +	&clk_en_tpb.clkr,
> +	&clk_en_misc_sc1.clkr,
> +	&clk_en_misc_i2c_3.clkr,
> +	&clk_en_jpeg.clkr,
> +	&clk_en_acpu.clkr,
> +	&clk_en_misc_sc0.clkr,
> +	&clk_en_hdmirx.clkr,
> +	&clk_en_hse.clkr,
> +	&clk_en_fan.clkr,
> +	&clk_en_sata_wrap_sys.clkr,
> +	&clk_en_sata_wrap_sysh.clkr,
> +	&clk_en_sata_mac_sysh.clkr,
> +	&clk_en_r2rdsc.clkr,
> +	&clk_en_pcie1.clkr,
> +	&clk_en_misc_i2c_4.clkr,
> +	&clk_en_misc_i2c_5.clkr,
> +	&clk_en_tsio.clkr,
> +	&clk_en_ve4.clkr,
> +	&clk_en_edp.clkr,
> +	&clk_en_tsio_trx.clkr,
> +	&clk_en_pcie2.clkr,
> +	&clk_en_earc.clkr,
> +	&clk_en_lite.clkr,
> +	&clk_en_mipi_dsi.clkr,
> +	&clk_en_npupp.clkr,
> +	&clk_en_npu.clkr,
> +	&clk_en_aucpu0.clkr,
> +	&clk_en_aucpu1.clkr,
> +	&clk_en_nsram.clkr,
> +	&clk_en_hdmitop.clkr,
> +	&clk_en_aucpu_iso_npu.clkr,
> +	&clk_en_keyladder.clkr,
> +	&clk_en_ifcp_klm.clkr,
> +	&clk_en_ifcp.clkr,
> +	&clk_en_mdl_genpw.clkr,
> +	&clk_en_mdl_chip.clkr,
> +	&clk_en_mdl_ip.clkr,
> +	&clk_en_mdlm2m.clkr,
> +	&clk_en_mdl_xtal.clkr,
> +	&clk_en_test_mux.clkr,
> +	&clk_en_dla.clkr,
> +	&clk_en_tpcw.clkr,
> +	&clk_en_gpu_ts_src.clkr,
> +	&clk_en_vi.clkr,
> +	&clk_en_lvds1.clkr,
> +	&clk_en_lvds2.clkr,
> +	&clk_en_aucpu.clkr,
> +	&clk_en_ur1.clkr,
> +	&clk_en_ur2.clkr,
> +	&clk_en_ur3.clkr,
> +	&clk_en_ur4.clkr,
> +	&clk_en_ur5.clkr,
> +	&clk_en_ur6.clkr,
> +	&clk_en_ur7.clkr,
> +	&clk_en_ur8.clkr,
> +	&clk_en_ur9.clkr,
> +	&clk_en_ur_top.clkr,
> +	&clk_en_misc_i2c_7.clkr,
> +	&clk_en_misc_i2c_6.clkr,
> +	&clk_en_spi0.clkr,
> +	&clk_en_spi1.clkr,
> +	&clk_en_spi2.clkr,
> +	&clk_en_lsadc0.clkr,
> +	&clk_en_lsadc1.clkr,
> +	&clk_en_isomis_dma.clkr,
> +	&clk_en_dptx.clkr,
> +	&clk_en_npu_mipi_csi.clkr,
> +	&clk_en_edptx.clkr,
> +	&clk_gpu.clkr,
> +	&clk_ve1.clkr,
> +	&clk_ve2.clkr,
> +	&clk_ve4.clkr,
> +	&pll_ve1.clkr,
> +	&pll_ddsa.clkr,
> +	&pll_bus.clkr,
> +	&pll_dcsb.clkr,
> +	&pll_gpu.clkr,
> +	&pll_npu.clkr,
> +	&pll_ve2.clkr,
> +	&pll_hifi.clkr,
> +	&pll_emmc.clkr,
> +	&pll_acpu.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_crt_hw_data = {
> +	.num = RTD1625_CRT_CLK_MAX,
> +	.hws = {
> +		[RTD1625_CRT_CLK_EN_MISC]     = &__rtk_clk_regmap_gate_hw(&clk_en_misc),
> +		[RTD1625_CRT_CLK_EN_PCIE0]    = &__rtk_clk_regmap_gate_hw(&clk_en_pcie0),
> +		[RTD1625_CRT_CLK_EN_GSPI]     = &__rtk_clk_regmap_gate_hw(&clk_en_gspi),
> +		[RTD1625_CRT_CLK_EN_ISO_MISC] = &__rtk_clk_regmap_gate_hw(&clk_en_iso_misc),
> +		[RTD1625_CRT_CLK_EN_SDS]      = &__rtk_clk_regmap_gate_hw(&clk_en_sds),
> +		[RTD1625_CRT_CLK_EN_HDMI]     = &__rtk_clk_regmap_gate_hw(&clk_en_hdmi),
> +		[RTD1625_CRT_CLK_EN_GPU]      = &__rtk_clk_regmap_gate_hw(&clk_en_gpu),
> +		[RTD1625_CRT_CLK_EN_VE1]      = &__rtk_clk_regmap_gate_hw(&clk_en_ve1),
> +		[RTD1625_CRT_CLK_EN_VE2]      = &__rtk_clk_regmap_gate_hw(&clk_en_ve2),
> +		[RTD1625_CRT_CLK_EN_MD]       = &__rtk_clk_regmap_gate_hw(&clk_en_md),
> +		[RTD1625_CRT_CLK_EN_TP]       = &__rtk_clk_regmap_gate_hw(&clk_en_tp),
> +		[RTD1625_CRT_CLK_EN_RCIC]     = &__rtk_clk_regmap_gate_hw(&clk_en_rcic),
> +		[RTD1625_CRT_CLK_EN_NF]       = &__rtk_clk_regmap_gate_hw(&clk_en_nf),
> +		[RTD1625_CRT_CLK_EN_EMMC]     = &__rtk_clk_regmap_gate_hw(&clk_en_emmc),
> +		[RTD1625_CRT_CLK_EN_SD]       = &__rtk_clk_regmap_gate_hw(&clk_en_sd),
> +		[RTD1625_CRT_CLK_EN_SDIO_IP]  = &__rtk_clk_regmap_gate_hw(&clk_en_sdio_ip),
> +		[RTD1625_CRT_CLK_EN_MIPI_CSI] = &__rtk_clk_regmap_gate_hw(&clk_en_mipi_csi),
> +		[RTD1625_CRT_CLK_EN_EMMC_IP]  = &__rtk_clk_regmap_gate_hw(&clk_en_emmc_ip),
> +		[RTD1625_CRT_CLK_EN_SDIO]     = &__rtk_clk_regmap_gate_hw(&clk_en_sdio),
> +		[RTD1625_CRT_CLK_EN_SD_IP]    = &__rtk_clk_regmap_gate_hw(&clk_en_sd_ip),
> +		[RTD1625_CRT_CLK_EN_TPB]      = &__rtk_clk_regmap_gate_hw(&clk_en_tpb),
> +		[RTD1625_CRT_CLK_EN_MISC_SC1] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_sc1),
> +		[RTD1625_CRT_CLK_EN_MISC_I2C_3] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_i2c_3),
> +		[RTD1625_CRT_CLK_EN_ACPU]     = &__rtk_clk_regmap_gate_hw(&clk_en_acpu),
> +		[RTD1625_CRT_CLK_EN_JPEG]     = &__rtk_clk_regmap_gate_hw(&clk_en_jpeg),
> +		[RTD1625_CRT_CLK_EN_MISC_SC0] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_sc0),
> +		[RTD1625_CRT_CLK_EN_HDMIRX]   = &__rtk_clk_regmap_gate_hw(&clk_en_hdmirx),
> +		[RTD1625_CRT_CLK_EN_HSE]      = &__rtk_clk_regmap_gate_hw(&clk_en_hse),
> +		[RTD1625_CRT_CLK_EN_FAN]      = &__rtk_clk_regmap_gate_hw(&clk_en_fan),
> +		[RTD1625_CRT_CLK_EN_SATA_WRAP_SYS] =
> +			&__rtk_clk_regmap_gate_hw(&clk_en_sata_wrap_sys),
> +		[RTD1625_CRT_CLK_EN_SATA_WRAP_SYSH] =
> +			&__rtk_clk_regmap_gate_hw(&clk_en_sata_wrap_sysh),
> +		[RTD1625_CRT_CLK_EN_SATA_MAC_SYSH] =
> +			&__rtk_clk_regmap_gate_hw(&clk_en_sata_mac_sysh),
> +		[RTD1625_CRT_CLK_EN_R2RDSC]   = &__rtk_clk_regmap_gate_hw(&clk_en_r2rdsc),
> +		[RTD1625_CRT_CLK_EN_PCIE1]    = &__rtk_clk_regmap_gate_hw(&clk_en_pcie1),
> +		[RTD1625_CRT_CLK_EN_MISC_I2C_4] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_i2c_4),
> +		[RTD1625_CRT_CLK_EN_MISC_I2C_5] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_i2c_5),
> +		[RTD1625_CRT_CLK_EN_TSIO]     = &__rtk_clk_regmap_gate_hw(&clk_en_tsio),
> +		[RTD1625_CRT_CLK_EN_VE4]      = &__rtk_clk_regmap_gate_hw(&clk_en_ve4),
> +		[RTD1625_CRT_CLK_EN_EDP]      = &__rtk_clk_regmap_gate_hw(&clk_en_edp),
> +		[RTD1625_CRT_CLK_EN_TSIO_TRX] = &__rtk_clk_regmap_gate_hw(&clk_en_tsio_trx),
> +		[RTD1625_CRT_CLK_EN_PCIE2]    = &__rtk_clk_regmap_gate_hw(&clk_en_pcie2),
> +		[RTD1625_CRT_CLK_EN_EARC]     = &__rtk_clk_regmap_gate_hw(&clk_en_earc),
> +		[RTD1625_CRT_CLK_EN_LITE]     = &__rtk_clk_regmap_gate_hw(&clk_en_lite),
> +		[RTD1625_CRT_CLK_EN_MIPI_DSI] = &__rtk_clk_regmap_gate_hw(&clk_en_mipi_dsi),
> +		[RTD1625_CRT_CLK_EN_NPUPP]    = &__rtk_clk_regmap_gate_hw(&clk_en_npupp),
> +		[RTD1625_CRT_CLK_EN_NPU]      = &__rtk_clk_regmap_gate_hw(&clk_en_npu),
> +		[RTD1625_CRT_CLK_EN_AUCPU0]   = &__rtk_clk_regmap_gate_hw(&clk_en_aucpu0),
> +		[RTD1625_CRT_CLK_EN_AUCPU1]   = &__rtk_clk_regmap_gate_hw(&clk_en_aucpu1),
> +		[RTD1625_CRT_CLK_EN_NSRAM]    = &__rtk_clk_regmap_gate_hw(&clk_en_nsram),
> +		[RTD1625_CRT_CLK_EN_HDMITOP]  = &__rtk_clk_regmap_gate_hw(&clk_en_hdmitop),
> +		[RTD1625_CRT_CLK_EN_AUCPU_ISO_NPU] =
> +			&__rtk_clk_regmap_gate_hw(&clk_en_aucpu_iso_npu),
> +		[RTD1625_CRT_CLK_EN_KEYLADDER] = &__rtk_clk_regmap_gate_hw(&clk_en_keyladder),
> +		[RTD1625_CRT_CLK_EN_IFCP_KLM]  = &__rtk_clk_regmap_gate_hw(&clk_en_ifcp_klm),
> +		[RTD1625_CRT_CLK_EN_IFCP]      = &__rtk_clk_regmap_gate_hw(&clk_en_ifcp),
> +		[RTD1625_CRT_CLK_EN_MDL_GENPW] = &__rtk_clk_regmap_gate_hw(&clk_en_mdl_genpw),
> +		[RTD1625_CRT_CLK_EN_MDL_CHIP]  = &__rtk_clk_regmap_gate_hw(&clk_en_mdl_chip),
> +		[RTD1625_CRT_CLK_EN_MDL_IP]    = &__rtk_clk_regmap_gate_hw(&clk_en_mdl_ip),
> +		[RTD1625_CRT_CLK_EN_MDLM2M]    = &__rtk_clk_regmap_gate_hw(&clk_en_mdlm2m),
> +		[RTD1625_CRT_CLK_EN_MDL_XTAL]  = &__rtk_clk_regmap_gate_hw(&clk_en_mdl_xtal),
> +		[RTD1625_CRT_CLK_EN_TEST_MUX]  = &__rtk_clk_regmap_gate_hw(&clk_en_test_mux),
> +		[RTD1625_CRT_CLK_EN_DLA]       = &__rtk_clk_regmap_gate_hw(&clk_en_dla),
> +		[RTD1625_CRT_CLK_EN_TPCW]      = &__rtk_clk_regmap_gate_hw(&clk_en_tpcw),
> +		[RTD1625_CRT_CLK_EN_GPU_TS_SRC] = &__rtk_clk_regmap_gate_hw(&clk_en_gpu_ts_src),
> +		[RTD1625_CRT_CLK_EN_VI]        = &__rtk_clk_regmap_gate_hw(&clk_en_vi),
> +		[RTD1625_CRT_CLK_EN_LVDS1]     = &__rtk_clk_regmap_gate_hw(&clk_en_lvds1),
> +		[RTD1625_CRT_CLK_EN_LVDS2]     = &__rtk_clk_regmap_gate_hw(&clk_en_lvds2),
> +		[RTD1625_CRT_CLK_EN_AUCPU]     = &__rtk_clk_regmap_gate_hw(&clk_en_aucpu),
> +		[RTD1625_CRT_CLK_EN_UR1]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur1),
> +		[RTD1625_CRT_CLK_EN_UR2]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur2),
> +		[RTD1625_CRT_CLK_EN_UR3]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur3),
> +		[RTD1625_CRT_CLK_EN_UR4]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur4),
> +		[RTD1625_CRT_CLK_EN_UR5]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur5),
> +		[RTD1625_CRT_CLK_EN_UR6]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur6),
> +		[RTD1625_CRT_CLK_EN_UR7]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur7),
> +		[RTD1625_CRT_CLK_EN_UR8]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur8),
> +		[RTD1625_CRT_CLK_EN_UR9]       = &__rtk_clk_regmap_gate_hw(&clk_en_ur9),
> +		[RTD1625_CRT_CLK_EN_UR_TOP]    = &__rtk_clk_regmap_gate_hw(&clk_en_ur_top),
> +		[RTD1625_CRT_CLK_EN_MISC_I2C_7] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_i2c_7),
> +		[RTD1625_CRT_CLK_EN_MISC_I2C_6] = &__rtk_clk_regmap_gate_hw(&clk_en_misc_i2c_6),
> +		[RTD1625_CRT_CLK_EN_SPI0]      = &__rtk_clk_regmap_gate_hw(&clk_en_spi0),
> +		[RTD1625_CRT_CLK_EN_SPI1]      = &__rtk_clk_regmap_gate_hw(&clk_en_spi1),
> +		[RTD1625_CRT_CLK_EN_SPI2]      = &__rtk_clk_regmap_gate_hw(&clk_en_spi2),
> +		[RTD1625_CRT_CLK_EN_LSADC0]    = &__rtk_clk_regmap_gate_hw(&clk_en_lsadc0),
> +		[RTD1625_CRT_CLK_EN_LSADC1]    = &__rtk_clk_regmap_gate_hw(&clk_en_lsadc1),
> +		[RTD1625_CRT_CLK_EN_ISOMIS_DMA] = &__rtk_clk_regmap_gate_hw(&clk_en_isomis_dma),
> +		[RTD1625_CRT_CLK_EN_DPTX]      = &__rtk_clk_regmap_gate_hw(&clk_en_dptx),
> +		[RTD1625_CRT_CLK_EN_NPU_MIPI_CSI] =
> +			&__rtk_clk_regmap_gate_hw(&clk_en_npu_mipi_csi),
> +		[RTD1625_CRT_CLK_EN_EDPTX] = &__rtk_clk_regmap_gate_hw(&clk_en_edptx),
> +		[RTD1625_CRT_CLK_GPU]          = &__rtk_clk_regmap_mux_hw(&clk_gpu),
> +		[RTD1625_CRT_CLK_VE1]          = &__rtk_clk_regmap_mux_hw(&clk_ve1),
> +		[RTD1625_CRT_CLK_VE2]          = &__rtk_clk_regmap_mux_hw(&clk_ve2),
> +		[RTD1625_CRT_CLK_VE4]          = &__rtk_clk_regmap_mux_hw(&clk_ve4),
> +		[RTD1625_CRT_PLL_VE1]          = &__rtk_clk_regmap_pll_hw(&pll_ve1),
> +		[RTD1625_CRT_PLL_DDSA]         = &__rtk_clk_regmap_pll_hw(&pll_ddsa),
> +		[RTD1625_CRT_PLL_BUS]          = &__rtk_clk_regmap_pll_hw(&pll_bus),
> +		[RTD1625_CRT_CLK_SYS]          = &clk_sys.hw,
> +		[RTD1625_CRT_PLL_DCSB]         = &__rtk_clk_regmap_pll_hw(&pll_dcsb),
> +		[RTD1625_CRT_CLK_SYSH]         = &clk_sysh.hw,
> +		[RTD1625_CRT_PLL_GPU]          = &__rtk_clk_regmap_pll_hw(&pll_gpu),
> +		[RTD1625_CRT_PLL_NPU]          = &__rtk_clk_regmap_pll_hw(&pll_npu),
> +		[RTD1625_CRT_PLL_VE2]          = &__rtk_clk_regmap_pll_hw(&pll_ve2),
> +		[RTD1625_CRT_PLL_HIFI]         = &__rtk_clk_regmap_pll_hw(&pll_hifi),
> +		[RTD1625_CRT_PLL_EMMC_REF]     = &pll_emmc_ref.hw,
> +		[RTD1625_CRT_PLL_EMMC]         = &__rtk_clk_regmap_pll_mmc_hw(&pll_emmc),
> +		[RTD1625_CRT_PLL_EMMC_VP0]     = &pll_emmc.phase0_hw,
> +		[RTD1625_CRT_PLL_EMMC_VP1]     = &pll_emmc.phase1_hw,
> +		[RTD1625_CRT_PLL_ACPU]         = &__rtk_clk_regmap_pll_hw(&pll_acpu),
> +		[RTD1625_CRT_CLK_NPU]          = &clk_npu.hw,
> +		[RTD1625_CRT_CLK_NPU_MIPI_CSI] = &clk_npu_mipi_csi.hw,
> +		[RTD1625_CRT_PLL_VO]           = &pll_vo.hw,
> +		[RTD1625_CRT_CLK_MAX - 1]      = NULL,
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_crt_desc = {
> +	.clk_data  = &rtd1625_crt_hw_data,
> +	.clks      = rtd1625_crt_regmap_clks,
> +	.num_clks  = ARRAY_SIZE(rtd1625_crt_regmap_clks),
> +	.aux_name  = "rtd1625_crt_rst",
> +};
> +
> +static int rtd1625_crt_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc = device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);
> +}
> +
> +static const struct of_device_id rtd1625_crt_match[] = {
> +	{ .compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc, },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> +
> +static struct platform_driver rtd1625_crt_driver = {
> +	.probe = rtd1625_crt_probe,
> +	.remove = rtk_clk_remove,
> +	.driver = {
> +		.name = "rtk-rtd1625-crt-clk",
> +		.of_match_table = rtd1625_crt_match,
> +	},
> +};
> +
> +module_platform_driver(rtd1625_crt_driver)
> +
> +MODULE_DESCRIPTION("Realtek RTD1625 CRT Clock Controller Driver");
> +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_REALTEK");
> -- 
> 2.43.0
> 


