Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98819C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9jxxoNk0Zci913QIrLSshdt2n65M0x+d9IlMGmwHh4=; b=Un+8206ox+x1b1T9X0tAddbExI
	W5i+Ex2gNk2ZTSMyDNKH53tBhoaXGSbpDhMGb18R70KUd3K178Dfk+Aw8YE2cZk2PDnAy4KhdTQvg
	r1cKuwGr8s6Zd4ZAT1P0uyN4MxGMTuNE4xQCKlzCB/kxON5tDo9YGGiXOJZ50ltiePmbju6hP6b0n
	yWVAr41yYXjtDoihqfr+KkwARWIp7m2nvuEjy4ziCOkcjSnGLkA8f3oyjmU05qbhdFlBytqmKDLAx
	UOKFMinusYCJENuzrlba4wMcE4Epk0vhEgbAkDjIJgK1CvCZAERHBUSuyWBq4O6Kbl3eNqf8ZuQEQ
	wO+LRFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJVi-0000000AXrp-1NyO;
	Tue, 21 Jul 2026 23:04:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJVf-0000000AXq4-08pl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784675062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z9jxxoNk0Zci913QIrLSshdt2n65M0x+d9IlMGmwHh4=;
	b=FnjSBgfAWd47cgN+YbhAGxu2OgFGLRDnsB20R3l2D6/+M03T0bj3CgDHDJAV+8SZFbxhHm
	j9BzVLeIWBH5tH6fOlcN4XOkrPQr+2wxWGiqqNWqwEyxKl52yHzEc7NDTcLp39oUHlxWg7
	RxIn765VgodpXmZHk+GramAxR+g+M9E=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-Gxw5WDrnPqS1AM0dDSrGwg-1; Tue, 21 Jul 2026 19:04:20 -0400
X-MC-Unique: Gxw5WDrnPqS1AM0dDSrGwg-1
X-Mimecast-MFC-AGG-ID: Gxw5WDrnPqS1AM0dDSrGwg_1784675060
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso183694401cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 16:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675060; x=1785279860;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9jxxoNk0Zci913QIrLSshdt2n65M0x+d9IlMGmwHh4=;
        b=DprQUa3tFzDv6j22/ROtbiJtyC7uSj7kObb2WSDfUuFnr+uGylJGwGDvfhaovA8yRz
         /Apv2vVbfTQ0wt/ovdN6+VY1aU8XDPSSrXfKQ1MNO/oh33IP3GP/fBmOW44xdB6GABC8
         tfy0GTojvyyFdvhZOPUduolLU/2+1MkyNhPfj+UKaCe/rnTViDv1QK0mhvPMPlbBUZ2/
         hwt63KlsKj3orKQDvl0Oy7V6pNlkhO3kYZHR8AZdcDoYj//OFPYasDOrmxYW495flHLr
         4EVc3qSXYiB7w74grdGRVtIeVkMVtn6zs5EjVI7dg2pJf7WWZeqebvhH938wAj1R+noe
         QMkw==
X-Forwarded-Encrypted: i=1; AHgh+RpGfuIfiHtzgcHRb8V44mdCjDZ/4SpYHB7EXs/CRN86O32F+vyMQ7/97ETiAHVKoKBlT+Y2UPaWMU31rF0H7n7m@lists.infradead.org
X-Gm-Message-State: AOJu0YzkSmur/0/9Vsh+jIFVxoisWVYsrWEAwNx4yTc6RHVlNRNL8AjE
	oJCfA64KKNqrT/Vak5MXfi1hsZRUwW66h+JKVURgplCF8NIMYzFl0j5Bc8VOKiolp00yf3dL6lR
	HyfbKtggTHIVaat1bbHJNPCtnAw13yEATtjcrxxWJVAgksKSO93RJIrHSxzAZZ5R5LYCFRnS5bN
	r9
X-Gm-Gg: AR+sD1364M+gePWzN8BxFz9GNN6D9ngw/3m/QjCB5dIw5ghA8dq6C38fM+7oQxbCtBp
	6c8r4oSu/xSl7NEKvbYKK4DBs8nc+3w4KC5Iu5qQf3mRovh1ydrMly3cvwvamYI2sJXpvuaAFgG
	dZaK6taTzpuJ1KTRe/yRL0ozPgNyAoIKQryVOAvCaa5RoJCDu1gVJk/mRhsyy69h2EXEADUBOLe
	zV4vKPsNoSYIw47gP3HO5alAuWqfs8No+WvzNcgtWHUiyz87xSIfMsgVrgUVb30mkD6/E9VApdk
	LuqAZM2oS/RT0J8Txce9CmoZIJ1bQwQlJVOJ5rCTWCfrq+ExKsb/7tzTHomD6o1a84Qqr/GsKq+
	XUjmoUddjY2hCsldcTmBJLaHqmCKT0QyLLfo=
X-Received: by 2002:a05:6214:2301:b0:8ce:ca7d:b099 with SMTP id 6a1803df08f44-9077832dd19mr216149256d6.18.1784675059749;
        Tue, 21 Jul 2026 16:04:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2301:b0:8ce:ca7d:b099 with SMTP id 6a1803df08f44-9077832dd19mr216148766d6.18.1784675059293;
        Tue, 21 Jul 2026 16:04:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e13d1sm7062316d6.28.2026.07.21.16.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:04:18 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:04:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v3 09/18] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <al_68GlP01W0US0x@redhat.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-9-8e6d99ab3ad2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-9-8e6d99ab3ad2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rs3LUKtxGaduJiqV6fwTJqhuEk8H_GZONmh0y20H018_1784675060
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_160423_149232_0BA5B002 
X-CRM114-Status: GOOD (  27.07  )
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

Hi Louis-Alexis,

On Mon, Jul 20, 2026 at 12:04:19PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  13 ++
>  drivers/clk/mediatek/Makefile                |   1 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 196 +++++++++++++++++++++++++++
>  3 files changed, 210 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 2c09fd729bab..f67dfb6cd019 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -815,6 +815,19 @@ config COMMON_CLK_MT8188_WPESYS
>  	help
>  	  This driver supports MediaTek MT8188 Warp Engine clocks.
>  
> +config COMMON_CLK_MT8189
> +	tristate "Clock driver for MediaTek MT8189"
> +	depends on ARM64 || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	select COMMON_CLK_MEDIATEK_FHCTL
> +	default ARCH_MEDIATEK
> +	help
> +	  Enable this option to support the clock management for MediaTek MT8189 SoC. This
> +	  includes handling of all primary clock functions and features specific to the MT8189
> +	  platform. Enabling this driver ensures that the system's clock functionality aligns
> +	  with the MediaTek MT8189 hardware capabilities, providing efficient management of
> +	  clock speeds and power consumption.
> +
>  config COMMON_CLK_MT8192
>  	tristate "Clock driver for MediaTek MT8192"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index d8736a060dbd..66577ccb9b93 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> new file mode 100644
> index 000000000000..0657a50c30d9
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

The list of includes here seems excessive, especially compared to the
later files in this series.

> +
> +#include "clk-fhctl.h"
> +#include "clk-mtk.h"
> +#include "clk-pll.h"
> +
> +#include <dt-bindings/clock/mediatek,mt8189-clk.h>
> +
> +#define MT8189_PLL_FMAX		(3800UL * MHZ)
> +#define MT8189_PLL_FMIN		(1500UL * MHZ)
> +#define MT8189_PLLEN_OFS	0x70
> +#define MT8189_INTEGER_BITS	8
> +
> +#define PLL_SETCLR(_id, _name, _reg, _en_setclr_bit,		\
> +			_rstb_setclr_bit, _flags, _pd_reg,	\
> +			_pd_shift, _tuner_reg, _tuner_en_reg,	\
> +			_tuner_en_bit, _pcw_reg, _pcw_shift,	\
> +			_pcwbits) {				\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.en_reg = MT8189_PLLEN_OFS,			\
> +		.reg = _reg,					\
> +		.pll_en_bit = _en_setclr_bit,			\
> +		.rst_bar_mask = BIT(_rstb_setclr_bit),		\
> +		.flags = _flags,				\
> +		.fmax = MT8189_PLL_FMAX,			\
> +		.fmin = MT8189_PLL_FMIN,			\
> +		.pd_reg = _pd_reg,				\
> +		.pd_shift = _pd_shift,				\
> +		.tuner_reg = _tuner_reg,			\
> +		.tuner_en_reg = _tuner_en_reg,			\
> +		.tuner_en_bit = _tuner_en_bit,			\
> +		.pcw_reg = _pcw_reg,				\
> +		.pcw_shift = _pcw_shift,			\
> +		.pcwbits = _pcwbits,				\
> +		.pcwibits = MT8189_INTEGER_BITS,		\
> +	}

There is no .ops set. mtk_clk_register_pll() in drivers/clk/mediatek/clk-pll.c
will use mtk_pll_ops when no ops is set. mtk_pll_prepare() reads/writes
pll->pwr_addr.

> +
> +static const struct mtk_pll_data apmixed_plls[] = {
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_LL, "armpll-ll", 0x204, 18,
> +		   0, PLL_AO, 0x208, 24, 0, 0, 0, 0x208, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_BL, "armpll-bl", 0x214, 17,
> +		   0, PLL_AO, 0x218, 24, 0, 0, 0, 0x218, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_CCIPLL, "ccipll", 0x224, 16,
> +		   0, PLL_AO, 0x228, 24, 0, 0, 0, 0x228, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MAINPLL, "mainpll", 0x304, 15,
> +		   23, HAVE_RST_BAR | PLL_AO,
> +		   0x308, 24, 0, 0, 0, 0x308, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_UNIVPLL, "univpll", 0x314, 14,
> +		   23, HAVE_RST_BAR, 0x318, 24, 0, 0, 0, 0x318, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MMPLL, "mmpll", 0x324, 13,
> +		   23, HAVE_RST_BAR, 0x328, 24, 0, 0, 0, 0x328, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MFGPLL, "mfgpll", 0x504, 7,
> +		   0, 0, 0x508, 24, 0, 0, 0, 0x508, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APLL1, "apll1", 0x404, 11,
> +		   0, 0, 0x408, 24, 0x040, 0x00c, 0, 0x40c, 0, 32),
> +	PLL_SETCLR(CLK_APMIXED_APLL2, "apll2", 0x418, 10,
> +		   0, 0, 0x41c, 24, 0x044, 0x00c, 1, 0x420, 0, 32),
> +	PLL_SETCLR(CLK_APMIXED_EMIPLL, "emipll", 0x334, 12,
> +		   0, PLL_AO, 0x338, 24, 0, 0, 0, 0x338, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APUPLL2, "apupll2", 0x614, 2,
> +		   0, 0, 0x618, 24, 0, 0, 0, 0x618, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APUPLL, "apupll", 0x604, 3,
> +		   0, 0, 0x608, 24, 0, 0, 0, 0x608, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_TVDPLL1, "tvdpll1", 0x42c, 9,
> +		   0, 0, 0x430, 24, 0, 0, 0, 0x430, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_TVDPLL2, "tvdpll2", 0x43c, 8,
> +		   0, 0, 0x440, 24, 0, 0, 0, 0x440, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_ETHPLL, "ethpll", 0x514, 6,
> +		   0, 0, 0x518, 24, 0, 0, 0, 0x518, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MSDCPLL, "msdcpll", 0x524, 5,
> +		   0, 0, 0x528, 24, 0, 0, 0, 0x528, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_UFSPLL, "ufspll", 0x534, 4,
> +		   0, 0, 0x538, 24, 0, 0, 0, 0x538, 0, 22),
> +};
> +
> +#define FH(_pllid, _fhid, _offset) {				\
> +		.data = {					\
> +			.pll_id = _pllid,			\
> +			.fh_id = _fhid,				\
> +			.fh_ver = FHCTL_PLLFH_V2,		\
> +			.fhx_offset = _offset,			\
> +			.dds_mask = GENMASK(21, 0),		\
> +			.slope0_value = 0x6003c97,		\
> +			.slope1_value = 0x6003c97,		\
> +			.sfstrx_en = BIT(2),			\
> +			.frddsx_en = BIT(1),			\
> +			.fhctlx_en = BIT(0),			\
> +			.tgl_org = BIT(31),			\
> +			.dvfs_tri = BIT(31),			\
> +			.pcwchg = BIT(31),			\
> +			.dt_val = 0x0,				\
> +			.df_val = 0x9,				\
> +			.updnlmt_shft = 16,			\
> +			.msk_frddsx_dys = GENMASK(23, 20),	\
> +			.msk_frddsx_dts = GENMASK(19, 16),	\
> +		},						\
> +	}
> +
> +static struct mtk_pllfh_data pllfhs[] = {
> +	FH(CLK_APMIXED_ARMPLL_LL, 0, 0x003C),
> +	FH(CLK_APMIXED_ARMPLL_BL, 1, 0x0050),
> +	FH(CLK_APMIXED_CCIPLL, 2, 0x0064),
> +	FH(CLK_APMIXED_MAINPLL, 3, 0x0078),
> +	FH(CLK_APMIXED_MMPLL, 4, 0x008C),
> +	FH(CLK_APMIXED_MFGPLL, 5, 0x00A0),
> +	FH(CLK_APMIXED_EMIPLL, 6, 0x00B4),
> +	FH(CLK_APMIXED_TVDPLL1, 7, 0x00C8),
> +	FH(CLK_APMIXED_TVDPLL2, 8, 0x00DC),
> +	FH(CLK_APMIXED_MSDCPLL, 9, 0x00F0),
> +	FH(CLK_APMIXED_UFSPLL, 10, 0x0104),
> +	FH(CLK_APMIXED_APUPLL, 11, 0x0118),
> +	FH(CLK_APMIXED_APUPLL2, 12, 0x012c),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8189_apmixed[] = {
> +	{ .compatible = "mediatek,mt8189-apmixedsys" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_apmixed);
> +
> +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> +{
> +	int r;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	const u8 *fhctl_node = "mediatek,mt8189-fhctl";

Reverse Christmas tree.

Brian


