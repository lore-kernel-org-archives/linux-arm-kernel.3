Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BE6C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CclLvD/dbhPqEKG4Jh4VZEC1Q5fl932J2+ffSVktIc=; b=4VB0gqrFAPj4AGZRWyjk4s6QV4
	AJx0u8Mzf3jzXkGNBbwwuWkqO2vPP71nru5vUxLK+V0NbGPPyp1SS6YwS1UxkqDmET7HQrSVUJEar
	2c3cs77IzG8HZ005SjyltBE48ehf8YZ9qbDPAM46kgRVovZvrol79JB+RVA5oQnLA0XTWojoA2WGX
	Ps2kSbrchPOnakDOHTYgwCguC4MjWrdi6gUpBGfeyXyrp4tkW4PBV4pKaJ0z8ttBjZaGzYZsfXpar
	ne4bUuz5sQqFamRXgFIfiJI6mEF6wFRT/4Q6Y4fWXjWmP/Z7bGM/hdPQUs9QKtLzMYyG7fTaJJ/Sp
	JolUQVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpU1T-0000000B38u-0dBF;
	Thu, 30 Jul 2026 16:54:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpU1P-0000000B37l-18Pa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785430454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2CclLvD/dbhPqEKG4Jh4VZEC1Q5fl932J2+ffSVktIc=;
	b=SZgZaEO3cK8rB2iPsRJctLiWxmi1HpxIj6dX9Sx5rrSG8H4BdemzO9gMHuaG85LLBtJTYi
	yLpPlUggR19oHbr6itiBbmFiCTIz1pl9rFKpIaARLcNmqNtrsCjh/dt03HMrYMniYdN7xR
	QMcYSWH5/3TyZRQUB1o9utqr8CXk7DU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ru1GxGbpNi6KuivunF0N6w-1; Thu, 30 Jul 2026 12:54:09 -0400
X-MC-Unique: ru1GxGbpNi6KuivunF0N6w-1
X-Mimecast-MFC-AGG-ID: ru1GxGbpNi6KuivunF0N6w_1785430448
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f582244e9eso883597b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430448; x=1786035248;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CclLvD/dbhPqEKG4Jh4VZEC1Q5fl932J2+ffSVktIc=;
        b=Z5mQHuIeyIHcK9tjiRi5rB0VJH7Bnl0zWWY6ViuDi5upFwtlk4XMUD4bxuCY2NPlG2
         SzRME2/AwV/MvDW/ABhM1LmMXaYHaZcAKbg7eetX8lsgUqm9QDhBRuFJGhWs3cxhgSvF
         Zv3GXc3iT0F4qEDbomHzUXxmSy3MhP2RgEvE+hHY+e3bX3SuinSOdR8OCUIprXIcLPGC
         wPxCIj1z3LeLAQ0Sg1Cr7Hbc3uJ3T3xEWEezyLL4h4+59UQ3X8uOuvO1KC7CzdTPrFfq
         5TRtvwaSVET79umR+dFapnPQEeCTg96XZJmrrFBuZ0Xs1ojSITFqbc0pPtOsUy2DT3tn
         mSww==
X-Forwarded-Encrypted: i=1; AHgh+RrgsInIZDyMoDIqRg9fbR0QOIrs9D2pFflMnN8InP/tayU++hELL2tbtS/sXS2Uc9goQ5K6KAqdbm+oJCMdVlb2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5OiuiJ27kqq4LFEokdSoDrd4pqLvs3REWFX2Nz+OGlRIW9gBv
	HZRIZ4L8bZ/lJ5EDBWUYVZBk8yp2rs/V7kycA9ZRW+RbDUdk8DfIMZkuFk87DnDqUUtVoUNGd7v
	k0mEZ+T259gVQdhDkMB65yiCNlVAupvASD2Api+zF/ik1r8L7xng7d2D7ze0PFDs9nNReJrlCuB
	u2
X-Gm-Gg: AR+sD10xOwN1EChvp6ga4VEYeaINf7cO/ln2PE9IyvaTLh5LrXgh44jr4qqLs0PzIM2
	Nnr0JG8dPM+g9fSoDSIw2BpGO4hf93jCV4u5xXSLiff7gSAa10ZcAMUTY3FkH3zdBWE4sHj6s0b
	hRu2jKc6uJdXAxOSGEBb58G7CYco41MeqYeLkfgxSvv/mn9eY12lIoTs+jQ295XBPtiwFkTXWER
	4I30kS2RMd3NzjWZbBPxFFvFAu7Ed6szH9NK1rV3rXE3SF1yd17v3gVHFOY4DpLjMhceczwSP7e
	BOG/pW20qIRI4tNzx+IbTX1VztyD5CwZT+Xwkwx2cL4V6BNiMveUhn7mM64euHzZxah46lAPpdl
	9OB5Jd7/AOCdeiXCN5qyWiQUZrULwv/jhwxw=
X-Received: by 2002:a05:690c:c9d:b0:81e:eaaa:535b with SMTP id 00721157ae682-81fb8a39ba0mr22894837b3.35.1785430447604;
        Thu, 30 Jul 2026 09:54:07 -0700 (PDT)
X-Received: by 2002:a05:690c:c9d:b0:81e:eaaa:535b with SMTP id 00721157ae682-81fb8a39ba0mr22894367b3.35.1785430446693;
        Thu, 30 Jul 2026 09:54:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb87315cdsm13562347b3.0.2026.07.30.09.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:54:05 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:54:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <amuBqi43ce9bYbir@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-10-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zJETnMwAVKsBHhtDCuJsJlk88J1fTLklCpEDAay2Ruw_1785430448
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_095415_528657_A66752F4 
X-CRM114-Status: GOOD (  25.17  )
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

On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
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
> Changes in v11:
> - Add pll_vo fixed-rate clock (634.5 MHz)
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Kconfig           |  15 +
>  drivers/clk/realtek/Makefile          |   1 +
>  drivers/clk/realtek/clk-rtd1625-crt.c | 802 ++++++++++++++++++++++++++
>  3 files changed, 818 insertions(+)
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
> index 97447e92bc35..15b9eec74e36 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -8,3 +8,4 @@ clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/clk-rtd1625-crt.c
> new file mode 100644
> index 000000000000..1352c3056a5c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c
> @@ -0,0 +1,802 @@
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
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
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
> +static struct rtk_clk_regmap * const rtd1625_crt_regmap_clks[] = {
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
> +	desc = of_device_get_match_data(&pdev->dev);

of_device_get_match_data() is deprecated. Use
device_get_match_data(&pdev->dev) instead. You should be able to drop
the linux/of_device.h include at the top.


> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);
> +}
> +
> +static const struct of_device_id rtd1625_crt_match[] = {
> +	{.compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc,},

Add a space after the { and before the ending }.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> +
> +static struct platform_driver rtd1625_crt_driver = {
> +	.probe = rtd1625_crt_probe,
> +	.driver = {
> +		.name = "rtk-rtd1625-crt-clk",
> +		.of_match_table = rtd1625_crt_match,
> +		.suppress_bind_attrs = true,

This driver is listed as a tristate in the Kconfig but then you have
this. Is the intention of this driver to be built in only?

> +	},
> +};
> +
> +static int __init rtd1625_crt_init(void)
> +{
> +	return platform_driver_register(&rtd1625_crt_driver);
> +}
> +subsys_initcall(rtd1625_crt_init);

Is there a reason that you can't use module_platform_driver() to have
this registered at the device_initcall level?

Brian


> +
> +MODULE_DESCRIPTION("Realtek RTD1625 CRT Clock Controller Driver");
> +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_CLK");
> -- 
> 2.43.0
> 


