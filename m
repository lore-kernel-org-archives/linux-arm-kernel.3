Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E87CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUQyrtOL8NOHCajM9hiI+JxRUujYqE2VpnERpyUoFds=; b=zNPh2PhB6dSlwT3qWYlGaSJ3/i
	YgxR4fvnkuVdTczh2zD702sGi1QWDOMtE6K6rOwLKZevq+AfyxPs5rV8IlUGE3tCUswvG8hj0yjKh
	MOljFbrJDGGHQPh4t3wzhvcr5/+KLeNFI/2u24VmZftG2vQx2UdcToAwUipIuNFVlzneuN7tYUnvv
	T8cE2qyBSLJKy95c+/fu+etr9pkHzujb5650Hh/huIxZZRr6Nrp+hoK88C4qCPaFw7h1to7mufZmw
	eFAc3Bj4N7GGRHtc8A+DXKgGSYa0sTZUTSNlkKtgxxTbSp1no0SCkNcnW6VYyI1MGJTxynSVDRilH
	ee4iZvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFM0-00000006ycT-3Mpn;
	Fri, 09 Oct 2026 18:30:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLr-00000006yV0-1n2n
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 18:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KUQyrtOL8NOHCajM9hiI+JxRUujYqE2VpnERpyUoFds=; b=o3StfeT7nVOd7wDQN13s7lGd7l
	In/WYxSPrj+zcXR4hlQ+EYFkiLsByo52fx+bWzInbY9hfph8NG7NtAUxHoUC7yCfmlc5aAla8rN2h
	uMpnGMpgGFJdbAZ5rj53rFOkQd5tAxqvBSV3eFfnYS8I8dJ5CTAets7QTL/ebsI99Fo1FeGdS4Uu5
	iiNEiIA5ks10mKGiUjZaizHQ3HUJJibUNWiX5sT/uOVxoYuOITIxbkVOTJc/jYyMWAM2+DV02BcWp
	/EZSbtp3OS9wmo+YigsImztz+veIKTahOdPEp2sMSRFUQW9iP4cJ43L18YryF7UOJtBlqoZWrs1YH
	2EwrHYbA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFFLo-0000000BWmk-1xOr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so1858265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570587; x=1792175387; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUQyrtOL8NOHCajM9hiI+JxRUujYqE2VpnERpyUoFds=;
        b=gyxCH1yB9lHSmAftFDlyrqPL9bZolWe6rXmBDU6D87fagl0krmq9fBi5e3y03rF5ST
         syn4tYVweLzntYzAHHrAsXqNjleTN+ic9jpZBMB6xof5cx/lwHIxuiCsJFWsmdHgH61h
         SgerZg7JDU8NzC1/Z3674y2lg54WPnyP49uNMVfkqulkHpXiWrwch6YRCxrmV39xPPTT
         FJRm4F9T1sDqceeDi8J3FHwsyWVK3EjK14An9+lyHPp9/2VLB5tup/ENyvlGpHWcHnf6
         7tH8rB6wZGhCc/nGbaC4b6GhrQF1RboFxji0bgQ3knD1DgyYctjsaF19IS/hlClfbCup
         Me0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570587; x=1792175387;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUQyrtOL8NOHCajM9hiI+JxRUujYqE2VpnERpyUoFds=;
        b=2iJ3q+mUsHXHJrLGZL3LPs/KTapD4zIx2g6X9G79qQLoVm9N5s5mKrae2jKB3c8vPH
         nHTqc0m4wqSkd9uJJUncvpqcsLWSD4XWFwIeSevGjQpy51Vtjjs1a7rPtNPFTd8j0iu9
         Ecvc88e78vH1V5zkvK6HLSnepFC5hTZNC1JuEOGs8EdNx3OvGHH+QbvHhWoQBK4dByYw
         +RmPb/3oRLtZj6E4bUmawVi65qH4JKW6Ay7CtQvyDqosKxbQ9WkIcIcOLpfOh9mvglCx
         y4y8d4JKOB4gCBI5D+UfTK3/3pLn8coOg8H7btB9wGWR99d4oyZEG+AoF39YmM16q+up
         UQbw==
X-Forwarded-Encrypted: i=1; AKwUvBwfAGNZDNI0x8hon4dauCMDjx38aIUuoXQuIdwMV7dBByBaNyVHAMpPmCITgaSD+0QxgwxnqfgatpiPEo4IayRf@lists.infradead.org
X-Gm-Message-State: AFuF++lrUQPUIqv6kGHQj+ErxaNAEPRf3nGX4uIC/O/QsmOPtlcZmYRq
	+66Jvc+6QWDIs8ccctpKdM2N8/0gAHjnajmbuGOm4K/BmbPpmTGutHP7e3g1MhcFuH0=
X-Gm-Gg: AYBFou0pShpHyKARCS67TzF3d8ZQKYGPqLTzddeHoVrxW5Opq0KKBt+eNAAHIsSV7w0
	0iv9t/FoMNZSmObBHcjJRNAaPPqWBVLlSBnbhUHtmOhPGem/g88wPo47ZPyJQSRpOYPzhoZJRHx
	T+UCFEz8KcuET+P04XMlJhcC3ZaSCv+CT6stB9b5ALiyxSTb7Msy3EzGbSR53tm02NUDVAQISXb
	pW2YpFZExe87+nk0CA5N+xtqKb3aJznM6+teiMY8GFQ8+3VkYEZvhV9B4IrkWmotyLnmS8YK/pB
	ufQhPZj5p9DhXvXkJ1HqSckUYbcdPdCtyB4XK9Y4CIC5cL4VEPRp9vqlFh4oiR0b6N/tAIeCa1T
	V3Z9DRtF4kmzExBDPAC63Ui5cwTIl1+/4S2dlRvV788T5zbwmjq6tUDso4KFAkuKxli34/9LJ/K
	a2rRPpzCb1ERqjE1F2SJLPqokhjDX6mAIwsBhT2i8akB6IVblLRL5amVGI1z3ptpf6Ik7lBxybC
	pVx07ulfMlwbtPORw==
X-Received: by 2002:a05:600c:6215:b0:4a1:7811:6cc4 with SMTP id 5b1f17b1804b1-4a18e4fa5c9mr46277965e9.34.1791570586952;
        Fri, 09 Oct 2026 11:29:46 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm81412255e9.10.2026.10.09.11.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:46 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-9-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-9-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.18071910694635064414.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15968; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/gDtdpICbc2dl6QRANQG5U7sVbCcqdnYU9kYcSAZM1g=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaYGWnR12E1oZtTZqr1f9tVBPZur/2L/rXtl7xO08
 I2w6CHrjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExktiXD/+Azi96ZGyx7H92i
 Eaevnff/wKe3N+8umm0458WNzyZOKUkMf8U+XGRr+nT3kXNiyBHddPUjFd5LyuP/Jq7vr4tK9Fz
 5hxkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_192948_638842_CFE5995C 
X-CRM114-Status: GOOD (  22.65  )
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

> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index e8deccf93f94..00ef9c5ba969 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -26,4 +26,7 @@ config RTK_CLK_COMMON
>  	  infrastructure to spawn reset controllers via the auxiliary bus
>  	  where required.
>  
> +config RTK_CLK_PLL_MMC
> +	bool
> +
>  endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 217ccaf5644a..52b9cb9c2323 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -6,3 +6,5 @@ clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
> new file mode 100644
> index 000000000000..2ee90b5d8a38
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,430 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define RTK_PLL_EMMC1_OFFSET            0x0
> +#define RTK_PLL_EMMC2_OFFSET            0x4
> +#define RTK_PLL_EMMC3_OFFSET            0x8
> +#define RTK_PLL_EMMC4_OFFSET            0xc
> +#define RTK_PLL_SSC_DIG_EMMC1_OFFSET    0x0
> +#define RTK_PLL_SSC_DIG_EMMC3_OFFSET    0xc
> +#define RTK_PLL_SSC_DIG_EMMC4_OFFSET    0x10
> +
> +#define RTK_PLL_MMC_SSC_DIV_N_VAL       0x1b
> +
> +#define RTK_PLL_PHRT0_MASK              BIT(0)
> +#define RTK_PLL_PHSEL_MASK              GENMASK(4, 0)
> +#define RTK_PLL_SSCPLL_RS_MASK          GENMASK(12, 10)
> +#define RTK_PLL_SSCPLL_ICP_MASK         GENMASK(9, 5)
> +#define RTK_PLL_SSC_DIV_EXT_F_MASK      GENMASK(25, 13)
> +#define RTK_PLL_PI_IBSELH_MASK          GENMASK(28, 27)
> +#define RTK_PLL_SSC_DIV_N_MASK          GENMASK(23, 16)
> +#define RTK_PLL_NCODE_SSC_EMMC_MASK     GENMASK(20, 13)
> +#define RTK_PLL_FCODE_SSC_EMMC_MASK     GENMASK(12, 0)
> +#define RTK_PLL_GRAN_EST_EM_MC_MASK     GENMASK(20, 0)
> +#define RTK_PLL_EN_SSC_EMMC_MASK        BIT(0)
> +#define RTK_PLL_FLAG_INITIAL_EMMC_MASK  BIT(8)
> +
> +#define RTK_PLL_PHRT0_SHIFT             1
> +#define RTK_PLL_SSCPLL_RS_SHIFT         10
> +#define RTK_PLL_SSCPLL_ICP_SHIFT        5
> +#define RTK_PLL_SSC_DIV_EXT_F_SHIFT     13
> +#define RTK_PLL_PI_IBSELH_SHIFT         27
> +#define RTK_PLL_SSC_DIV_N_SHIFT         16
> +#define RTK_PLL_NCODE_SSC_EMMC_SHIFT    13
> +#define RTK_PLL_FLAG_INITIAL_EMMC_SHIFT 8
> +
> +#define CYCLE_DEGREES                   360
> +#define PHASE_STEPS                     32
> +#define PHASE_SCALE_FACTOR              1125
> +
> +static inline struct rtk_clk_regmap_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_pll_mmc, clkr);
> +}
> +
> +static inline int get_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET, &reg);
> +	if (ret)
> +		return ret;
> +
> +	*val = (reg >> RTK_PLL_PHRT0_SHIFT) & RTK_PLL_PHRT0_MASK;
> +
> +	return 0;
> +}
> +
> +static inline int set_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
> +				  RTK_PLL_PHRT0_MASK << RTK_PLL_PHRT0_SHIFT,
> +				  val << RTK_PLL_PHRT0_SHIFT);
> +}
> +
> +static inline int get_phsel(struct rtk_clk_regmap_pll_mmc *clkm, int id, u32 *val)
> +{
> +	u32 sft = id ? 8 : 3;
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val >> sft) & RTK_PLL_PHSEL_MASK;
> +
> +	return 0;
> +}
> +
> +static inline int set_phsel(struct rtk_clk_regmap_pll_mmc *clkm, int id, u32 val)
> +{
> +	u32 sft = id ? 8 : 3;
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
> +				  RTK_PLL_PHSEL_MASK << sft, val << sft);
> +}
> +
> +static inline int set_sscpll_rs(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSCPLL_RS_MASK, val << RTK_PLL_SSCPLL_RS_SHIFT);
> +}
> +
> +static inline int set_sscpll_icp(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSCPLL_ICP_MASK, val << RTK_PLL_SSCPLL_ICP_SHIFT);
> +}
> +
> +static inline int get_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & RTK_PLL_SSC_DIV_EXT_F_MASK) >> RTK_PLL_SSC_DIV_EXT_F_SHIFT;
> +
> +	return 0;
> +}
> +
> +static inline int set_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSC_DIV_EXT_F_MASK,
> +				  val << RTK_PLL_SSC_DIV_EXT_F_SHIFT);
> +}
> +
> +static inline int set_pi_ibselh(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_PI_IBSELH_MASK, val << RTK_PLL_PI_IBSELH_SHIFT);
> +}
> +
> +static inline int set_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET,
> +				  RTK_PLL_SSC_DIV_N_MASK, val << RTK_PLL_SSC_DIV_N_SHIFT);
> +}
> +
> +static inline int get_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & RTK_PLL_SSC_DIV_N_MASK) >> RTK_PLL_SSC_DIV_N_SHIFT;
> +
> +	return 0;
> +}
> +
> +static inline int set_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, val);
> +}
> +
> +static inline int get_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = raw_val;
> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
> +{
> +	struct clk_hw *hwp = clk_hw_get_parent(hw);
> +	struct rtk_clk_regmap_pll_mmc *clkm;
> +	int phase_id, ret;
> +	u32 val;
> +
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
> +	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
> +	ret = set_phsel(clkm, phase_id, val);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_phase_get_phase(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm;
> +	struct clk_hw *hwp;
> +	int phase_id, ret;
> +	u32 val;
> +
> +	hwp = clk_hw_get_parent(hw);
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
> +	ret = get_phsel(clkm, phase_id, &val);
> +	if (ret)
> +		return ret;
> +
> +	val = DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
> +
> +	return val;
> +}
> +
> +const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
> +	.set_phase = rtk_clk_regmap_pll_mmc_phase_set_phase,
> +	.get_phase = rtk_clk_regmap_pll_mmc_phase_get_phase,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "CLK_REALTEK");
> +
> +static int rtk_clk_regmap_pll_mmc_prepare(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	return set_pow_ctl(clkm, 7);
> +}
> +
> +static void rtk_clk_regmap_pll_mmc_unprepare(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_pow_ctl(clkm, 0);
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_is_prepared(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = get_pow_ctl(clkm, &val);
> +	if (ret)
> +		return 1;
> +
> +	return val != 0x0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	int ret;
> +
> +	ret = set_phrt0(clkm, 1);
> +	if (ret)
> +		return ret;

looks fairly close to the regular gate as it stand.
should your _pow be in there instead ?

> +
> +	udelay(10);
> +
> +	return 0;
> +}
> +
> +static void rtk_clk_regmap_pll_mmc_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_phrt0(clkm, 0);
> +	udelay(10);
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = get_phrt0(clkm, &val);
> +	if (ret)
> +		return 1;
> +
> +	return val == 0x1;
> +}
> +
> +static unsigned long rtk_clk_regmap_pll_mmc_recalc_rate(struct clk_hw *hw,
> +							unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val, ext_f;
> +	u64 rate, base;
> +	int ret;
> +
> +	ret = get_ssc_div_n(clkm, &val);
> +	if (ret)
> +		return 0;
> +
> +	ret = get_ssc_div_ext_f(clkm, &ext_f);
> +	if (ret)
> +		return 0;
> +
> +	base = parent_rate / 4;

So you've got a pre-divider

> +	rate = base * (val + 2);

Then an integer divider

> +	rate += div_u64(base * ext_f, 8192);

and finally the fractional part

> +
> +	return rate;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	u32 val = RTK_PLL_MMC_SSC_DIV_N_VAL + 2;
> +	u64 tmp;
> +
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	req->rate = req->best_parent_rate / 4 * val;

Here you seem to support only a single integer part setting

> +	tmp = (u64)(req->best_parent_rate / 4) * 1517;
> +	req->rate += tmp >> 13;

So nothing says that here that the math won't overflow

Could you explain the 1517 here ? I suppose it is linked to the 8192 above ?

> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = RTK_PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	/*
> +	 * The 'rate' and 'parent_rate' are intentionally unused here.
> +	 *
> +	 * Despite receiving various rate requests (e.g., 26MHz, 52MHz, 200MHz),
> +	 * this function consistently configures the hardware for 27MHz (0x1b).

Maybe you should fix the mmc driver then and properly request 27MHz if this what
you expect of this particular PLL. Just taking any request and setting something
else regardless is not OK.

> +	 * This is because these settings reflect the input reference clock
> +	 * frequency to the SSCPLL, not the final PLL output frequency.
> +	 *
> +	 * The actual frequency division to achieve the requested eMMC rate
> +	 * is handled internally by the downstream eMMC host controller.
> +	 */
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
> +				 0x0 << RTK_PLL_FLAG_INITIAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_n(clkm, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_ext_f(clkm, 1517);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_pi_ibselh(clkm, 2);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_sscpll_rs(clkm, 3);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_sscpll_icp(clkm, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
> +				 RTK_PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << RTK_PLL_NCODE_SSC_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
> +				 RTK_PLL_FCODE_SSC_EMMC_MASK, 321);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET,
> +				 RTK_PLL_GRAN_EST_EM_MC_MASK, 5985);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_EN_SSC_EMMC_MASK, 0x1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_EN_SSC_EMMC_MASK, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
> +				 0x1 << RTK_PLL_FLAG_INITIAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +
> +	return 0;
> +}
> +
> +const struct clk_ops rtk_clk_pll_mmc_ops = {
> +	.prepare          = rtk_clk_regmap_pll_mmc_prepare,
> +	.unprepare        = rtk_clk_regmap_pll_mmc_unprepare,
> +	.is_prepared      = rtk_clk_regmap_pll_mmc_is_prepared,

prepare is meant for slow (as in sleeping) operation.
I've seen no sleeping operation in your implementation.
If the regmap is slow, then there is problem because your using the same one
in enable/disable() which run under a spin lock

> +	.enable           = rtk_clk_regmap_pll_mmc_enable,
> +	.disable          = rtk_clk_regmap_pll_mmc_disable,
> +	.is_enabled       = rtk_clk_regmap_pll_mmc_is_enabled,
> +	.recalc_rate      = rtk_clk_regmap_pll_mmc_recalc_rate,
> +	.determine_rate   = rtk_clk_regmap_pll_mmc_determine_rate,
> +	.set_rate         = rtk_clk_regmap_pll_mmc_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> index 023b49bbcbee..d21793387eee 100644
> --- a/drivers/clk/realtek/clk-pll.h
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -44,4 +44,17 @@ struct rtk_clk_regmap_pll {
>  extern const struct clk_ops rtk_clk_pll_ops;
>  extern const struct clk_ops rtk_clk_pll_ro_ops;
>  
> +struct rtk_clk_regmap_pll_mmc {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int pll_ofs;
> +	unsigned int ssc_dig_ofs;
> +	struct clk_hw phase0_hw;
> +	struct clk_hw phase1_hw;

your phases and pll use completly different ops. Why do you to mix the 2 here ?

-- 
Jerome


