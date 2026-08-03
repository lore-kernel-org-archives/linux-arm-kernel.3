Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7564CC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF3MmI86y2BChVqhm8vdVAw/xAkrV44X6MqoOsmdA58=; b=y0j4LnkozTMlVbqHL/CVerOj9x
	FzZwtEUmvwORZzfLQFjZLZrbqvk+AG6sp6Lgltt+Kbc2XZS5lkVYusi+RbVc7Dn81bBpvCa+Op2GQ
	KaCmytwWLVBlqLi4FASsbVnq+QhyDhTvvGhbQEGJR/8C5ps4L3Gri/aTSXJOO9IlFYoacCrVbhQNj
	RW52CD5eSrUCcRL8lXbs3znuC/3wbfESdqhKyCwqVH042JPeNFWkiUmKam//1OT/O55T4hTIkXYjw
	VICGA9ZaWzJwovdiOUPtTiG5theZNMltp8MjdPfAeRCiYdoLKoAUXmmTQPRxm1BWt4rpXrBTWMOit
	ZIWfevGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquL7-0000000HTx8-2Xhi;
	Mon, 03 Aug 2026 15:12:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquL4-0000000HTvb-38tx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785769945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jF3MmI86y2BChVqhm8vdVAw/xAkrV44X6MqoOsmdA58=;
	b=HHUj5lacBpmFjEes7/hIsyN8s3nTBWen7w/vLY3FXSL8hNDAcvCtHFMXjufvb/XXXZeWy2
	X2CPJXcvCGq3Ga9kazQ1YEp2G8SEG/qboI9h+UIVos5tjfxsUdm59+fu6gHVyBje6Pjjmm
	qtLmGNbKPcQk4mJJwyQ0v97LiYT/Bg8=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694--eePSkbUMpuRBE3t4BKrbQ-1; Mon, 03 Aug 2026 11:12:23 -0400
X-MC-Unique: -eePSkbUMpuRBE3t4BKrbQ-1
X-Mimecast-MFC-AGG-ID: -eePSkbUMpuRBE3t4BKrbQ_1785769943
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-667d0d587e0so4702171d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785769943; x=1786374743;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jF3MmI86y2BChVqhm8vdVAw/xAkrV44X6MqoOsmdA58=;
        b=kIrDPzV1V90XM4SycvOD1qhguYCoMc1GC3v4/qWRCxvC9ibWksF0H0ewbRQDRjFBn9
         eWmrSzzA6es+Z1vYxoRx1Fc3/zdwEhe89rmadYQ1wFIa+VbzlALKlvzI8k/F28tIgroR
         uHIVV5bZb1YJy3Js62i35vhX0a97KLXl9l//9+30FVl84S0U1HHls+rduv2Nln3XFO+1
         16CyvBr6Wv3Rx2XbKpw3WDSeGMsKEILDDXqLZgpEow1W5hP5O+9GxgUPbkGqMWjGuh/h
         0SKdSkbxOdhoo1eoFblJUoUteMbJQJHiVgg3i0UDa7EG5HhQZn6PBaXA17wZgD70LIb4
         Bj1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoJPHe3wAALHouMrBNBgsgPSAK1NWE2QWJHVz3KHHTl6YcJPlcqpY0XuACM7UVmL2hvSClMuDPh8WXLThQEKEDQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1YtsMZO59QwabjCt85f7z5jZmuU0wie71g7yk/MQtY/W/we3n
	qEIGAyfaOortucVe5FS5Arg4sTe7wtmgjJv/HxorLFCUg8NmyBgo5FXBApnGz3DPjGNIdKVaZjb
	mlYWWuuJGgDNFSRi22YQH4DwtY+ZHFcqqLeDm/Dafgz/bzu7MXlWw7GfOs+qCJ0m56t1gvkiVd0
	vl
X-Gm-Gg: AR+sD13zu1nBha316466aGe7hptmEZVoi1tPfrdOfrWewvfSiiRuUngOowjXxgao/uC
	07jJ7jIfC5v1GXvfYttt6DASccwkSjFzryNvwKgzwK5vBxDWImBIVnjpV13UkF4h2GwR3FuYrgK
	Hd/7CfA1J+w9tW/vo8EfzZPOriRTZi2DTRHvNFQX7pUo24rRyggeDARyWjsMguSTsEd2m03SDYV
	oFBAJln7nENECUbWotCv5yRHp4takBdR9UBFYbaqNI7W7hn6dx6TAWSqN8gW5kccB9sbs04iU+v
	yfWbel7Q1vRiHgZFUmhzrFv2kyA+0zfWT1wNf/Q9iDzd+Q89jd5vcjRAAaNZBRdBRYJoJ8EqCfP
	iq2oKYo7BbdPYlin3PSBArf+ER3ghNc93aVM=
X-Received: by 2002:a05:690e:2244:b0:663:9a0a:7b80 with SMTP id 956f58d0204a3-6694f08c75fmr9214977d50.19.1785769942538;
        Mon, 03 Aug 2026 08:12:22 -0700 (PDT)
X-Received: by 2002:a05:690e:2244:b0:663:9a0a:7b80 with SMTP id 956f58d0204a3-6694f08c75fmr9214934d50.19.1785769942042;
        Mon, 03 Aug 2026 08:12:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948fc7ef2sm5945641d50.13.2026.08.03.08.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:12:21 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:12:18 -0400
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
Subject: Re: [PATCH v5 16/25] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <anCv0ga226obZg2g@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-16-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-16-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: siarvkE9RFVxEajTrbkv7SWXoCNBiMN-r82NlGJ_d6Q_1785769943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081226_933831_DF680AFA 
X-CRM114-Status: GOOD (  32.40  )
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

On Sat, Aug 01, 2026 at 01:21:02PM +0200, Louis-Alexis Eyraud wrote:
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
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 203 +++++++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
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
> index 000000000000..a50a8979b849
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> @@ -0,0 +1,203 @@
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
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
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
> +#define MT8189_PLLEN_SET_OFS	0x74
> +#define MT8189_PLLEN_CLR_OFS	0x78
> +#define MT8189_RSTBAR_OFS	0x80
> +#define MT8189_RSTBAR_SET_OFS	0x84
> +#define MT8189_RSTBAR_CLR_OFS	0x88
> +#define MT8189_INTEGER_BITS	8
> +
> +#define PLL_SETCLR(_id, _name, _reg, _pwr_reg, _en_setclr_bit,		\
> +			_rstb_setclr_bit, _flags, _pd_reg,	\
> +			_pd_shift, _tuner_reg, _tuner_en_reg,	\
> +			_tuner_en_bit, _pcw_reg, _pcw_shift,	\
> +			_pcwbits) {				\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.en_reg = MT8189_PLLEN_OFS,			\
> +		.en_set_reg = MT8189_PLLEN_SET_OFS,		\
> +		.en_clr_reg = MT8189_PLLEN_CLR_OFS,		\
> +		.reg = _reg,					\
> +		.pwr_reg = _pwr_reg,				\
> +		.pll_en_bit = _en_setclr_bit,			\
> +		.rst_bar_reg = MT8189_RSTBAR_OFS,		\
> +		.rst_bar_set_reg = MT8189_RSTBAR_SET_OFS,	\
> +		.rst_bar_clr_reg = MT8189_RSTBAR_CLR_OFS,	\
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
> +		.ops = &mtk_pll_setclr_ops,			\
> +	}
> +
> +static const struct mtk_pll_data apmixed_plls[] = {
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_LL, "armpll-ll", 0x204, 0x210, 18,
> +		   0, PLL_AO, 0x208, 24, 0, 0, 0, 0x208, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_BL, "armpll-bl", 0x214, 0x220, 17,
> +		   0, PLL_AO, 0x218, 24, 0, 0, 0, 0x218, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_CCIPLL, "ccipll", 0x224, 0x230, 16,
> +		   0, PLL_AO, 0x228, 24, 0, 0, 0, 0x228, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MAINPLL, "mainpll", 0x304, 0x310, 15,
> +		   2, HAVE_RST_BAR | PLL_AO,
> +		   0x308, 24, 0, 0, 0, 0x308, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_UNIVPLL, "univpll", 0x314, 0x320, 14,
> +		   1, HAVE_RST_BAR, 0x318, 24, 0, 0, 0, 0x318, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MMPLL, "mmpll", 0x324, 0x330, 13,
> +		   0, HAVE_RST_BAR, 0x328, 24, 0, 0, 0, 0x328, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MFGPLL, "mfgpll", 0x504, 0x510, 7,
> +		   0, 0, 0x508, 24, 0, 0, 0, 0x508, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APLL1, "apll1", 0x404, 0x414, 11,
> +		   0, 0, 0x408, 24, 0x040, 0x00c, 0, 0x40c, 0, 32),
> +	PLL_SETCLR(CLK_APMIXED_APLL2, "apll2", 0x418, 0x428, 10,
> +		   0, 0, 0x41c, 24, 0x044, 0x00c, 1, 0x420, 0, 32),
> +	PLL_SETCLR(CLK_APMIXED_EMIPLL, "emipll", 0x334, 0x340, 12,
> +		   0, PLL_AO, 0x338, 24, 0, 0, 0, 0x338, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APUPLL2, "apupll2", 0x614, 0x620, 2,
> +		   0, 0, 0x618, 24, 0, 0, 0, 0x618, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APUPLL, "apupll", 0x604, 0x610, 3,
> +		   0, 0, 0x608, 24, 0, 0, 0, 0x608, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_TVDPLL1, "tvdpll1", 0x42c, 0x438, 9,
> +		   0, 0, 0x430, 24, 0, 0, 0, 0x430, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_TVDPLL2, "tvdpll2", 0x43c,  0x448, 8,
> +		   0, 0, 0x440, 24, 0, 0, 0, 0x440, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_ETHPLL, "ethpll", 0x514, 0x520, 6,
> +		   0, 0, 0x518, 24, 0, 0, 0, 0x518, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MSDCPLL, "msdcpll", 0x524, 0x530, 5,
> +		   0, 0, 0x528, 24, 0, 0, 0, 0x528, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_UFSPLL, "ufspll", 0x534, 0x540, 4,
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
> +			.ops = &mtk_pllfh_setclr_ops,		\
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
> +	const u8 *fhctl_node = "mediatek,mt8189-fhctl";
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));

So I know this is how the existing drivers are written. This calls
of_iomap(), and the iounmap is called by mtk_clk_unregister_pllfhs().
I usually like to see things in pairs to make it easier to review
where there's some register, and an unregister with the same name.

Could the fhctl_parse_dt() call be moved into
mtk_clk_register_pllfhs() ?

Additionally fhctl_parse_dt() sets some state variables that are never
cleared in the unregister:

                pllfh->state.fh_enable = 1;
                pllfh->state.ssc_rate = ssc_rate;
                pllfh->state.base = base;

Just a quick glance though I think this is fine.

Brian


