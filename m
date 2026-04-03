Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C6CE8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VUq3iHyJBlap7+8lACX3iuj8cpAeT8KumT6dvPCbu8=; b=jDxYBtZZG+ZGGmQ8iPZhvcwMkE
	o4vd/5kYvbRsU0gyZzhadjcujBBfH2XTMAJVZliVUxeTj3Z6ATA3g+Tj7A6JeEGXKUKUBxEwOSdr9
	O3iZsLnJ0yuVFsFYnEf0KK4+C0TokD45/mBnNj0ZFUhHeS22H5q20snsPzlJ+mi/i9ikVEekG8VZ9
	GxWNChh+PJUy1QCeOqBrfYohiLOGrRD0cXi0wv4bnU+CmE+ALgyNB+tiG86pMKtXsbucfodzwivkO
	figmF073jXks+IcHrOdaUwc34kxfTu+VUuv8TNaaEREAesxunwrQeZQa5PWsht/WuCMDyw0JuofRp
	B5W7MJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8g7b-00000002Blo-3iuC;
	Fri, 03 Apr 2026 15:07:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8g7Y-00000002Bl3-1kHA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 15:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775228859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9VUq3iHyJBlap7+8lACX3iuj8cpAeT8KumT6dvPCbu8=;
	b=C6a+waV0NZN2gjf0QlepyOz/Ca8kgfHrSXGJ4nC081tq8R1hjGiYJxuTg7s8RLGTi/OI8q
	bLDajzk9ka5Q3URCE0yjQoi+SJy6CrF9ei8uBtTfF8IesE4qFhPloidAL1IkyBtpGHCiLs
	dkL4o3wvnT3esCwM0I/8382BVWGGitI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-6bDClS0AM76UK3fEjmvXFQ-1; Fri, 03 Apr 2026 11:07:38 -0400
X-MC-Unique: 6bDClS0AM76UK3fEjmvXFQ-1
X-Mimecast-MFC-AGG-ID: 6bDClS0AM76UK3fEjmvXFQ_1775228857
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954803bd74so21790856d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228857; x=1775833657;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VUq3iHyJBlap7+8lACX3iuj8cpAeT8KumT6dvPCbu8=;
        b=M7W/uJ3UedLZPoVNqEpjrRun2YGNJIJonlm43HD9uDICCbTj4tVdgkC1pEsA3Qt+Rr
         aYcVMDy/JzVhsURUTPRzL/6tqVP2DQGhrwgSUfC5JRR/8Qt3EchMFGYmq9kCOiVMdCyC
         8MuxNxHOlcNlyL+hBQYnYQq8ANrZZ65P71Q3HvihH94qX9ctJiYV90jcgBNS5KQc4ZyS
         c0bFubvqj1q7LJ4V2CKYHEYZx1YIA5rf6GxGPoYRTVotr6wkSoJ5yA3YKK9R8XzblpKI
         0a8D+S24cJZHzgZiMtbkmpXuSSiNIbIPclDlKLfSA0ZmT79Ul6mjnvdf9B/PVVAngC+h
         2+vg==
X-Forwarded-Encrypted: i=1; AJvYcCVEkFJG6UyxgYVDPwhQ8iKLU4NCV//6Li/nhfvrmXu3Wgl7fe5jBHK4Zc4bY7eMqsbkGc+AwZbTCJrH6fradBD7@lists.infradead.org
X-Gm-Message-State: AOJu0YzzXEO6uF+rhGR2NCd+7Lm9z7h7EL/1UgXibmU26gqd6yiC9DRM
	lwPVWmdZkgCPkLwa9PS9sOsOLxYGkN9g3PGAXT+OyTzPVEeAcNWX6UrTlzJ5imj68EknmxnqZc/
	Luv6cDuzwtGKZpRYggKhzZg2i8xqWQcVJv9jRpAllB8KvAwvf37nExXSa025xfKe73RIAAWvc7i
	2I
X-Gm-Gg: AeBDieuKlUt7IXHNQIVsfInYM4uGq8MdHKjvIV6V7SrcNf7KzRLQ6FN2dvNAnw+WPOd
	fHlaN07d9IADt9rU+/HqmogjmE2S97wYEhRGK9T3+HJOueN2Jf2/sIsjBes4aZAilzEFzaqJYir
	mNvHm1Zhdc+evnjixw54Pj8g/ypBCqyyxigGmypCaHaKJaOK04uw70xb7wIAhNh4847O3yZrSDF
	ZAfGMqQ0eANU8J9fDgLgk0ktNZfDJt0L82fGndvhqx1UOJWLiLN4DrljrPhKL9QNJn4G0Nj1P9P
	WXm8ixCd62oDUt56zqr5dKqWK2UX6rRJ5F4frryw8EvaP8vvX9u7MNXgIizrqjwNy+hrXPvB7Ac
	uqjEWwjVlvQHqtoU+iYo2jjedd1wQt7o0C7OQU9xji3auSEwKuq+TtVbW
X-Received: by 2002:a05:6214:3116:b0:8a3:a172:46b0 with SMTP id 6a1803df08f44-8a705194a7cmr47589846d6.44.1775228856601;
        Fri, 03 Apr 2026 08:07:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3116:b0:8a3:a172:46b0 with SMTP id 6a1803df08f44-8a705194a7cmr47589096d6.44.1775228856001;
        Fri, 03 Apr 2026 08:07:36 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf51b6sm60006436d6.17.2026.04.03.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:07:35 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:07:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <ac_XtHzDpIjHW8xT@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-8-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E66sgEszZ1v_z5gNHBpkyH3AgiRvrfrhWwuPOoPTd6g_1775228857
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_080740_615746_739C390C 
X-CRM114-Status: GOOD (  30.20  )
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

Hi Yu-Chun and Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
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
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> - Move to_clk_pll_mmc() from clk-pll.h to clk-pll-mmc.c to limit its scope.
> - Change offset type from int to unsigned int.
> ---
>  MAINTAINERS                       |   8 +
>  drivers/clk/realtek/Kconfig       |   3 +
>  drivers/clk/realtek/Makefile      |   2 +
>  drivers/clk/realtek/clk-pll-mmc.c | 410 ++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h     |  13 +
>  5 files changed, 436 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8318156a02b5..4b28af4b26b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22245,6 +22245,14 @@ F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
>  
> +REALTEK SOC PLL CLOCK FOR MMC SUPPORT
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Jyan Chou <jyanchou@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	drivers/clk/realtek/clk-pll-mmc.c
> +
>  REALTEK SPI-NAND
>  M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
>  S:	Maintained
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index bc47d3f1c452..b31a31e57b3a 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -25,4 +25,7 @@ config RTK_CLK_COMMON
>  	  multiple Realtek clock implementations, and include integration
>  	  with reset controllers where required.
>  
> +config RTK_CLK_PLL_MMC
> +	bool
> +
>  endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index f90dc57fcfdb..fd7d777902c8 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -7,3 +7,5 @@ clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
> new file mode 100644
> index 000000000000..d28c7027d3f0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define PLL_EMMC1_OFFSET           0x0
> +#define PLL_EMMC2_OFFSET           0x4
> +#define PLL_EMMC3_OFFSET           0x8
> +#define PLL_EMMC4_OFFSET           0xc
> +#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
> +#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
> +#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
> +
> +#define PLL_MMC_SSC_DIV_N_VAL      0x1b
> +
> +#define PLL_PHRT0_MASK             BIT(1)
> +#define PLL_PHSEL_MASK             GENMASK(4, 0)
> +#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
> +#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
> +#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
> +#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
> +#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
> +#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
> +#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
> +#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
> +#define PLL_EN_SSC_EMMC_MASK       BIT(0)
> +#define PLL_FLAG_INITAL_EMMC_MASK  BIT(1)
> +
> +#define PLL_PHRT0_SHIFT            1
> +#define PLL_SSCPLL_RS_SHIFT        10
> +#define PLL_SSCPLL_ICP_SHIFT       5
> +#define PLL_SSC_DIV_EXT_F_SHIFT    13
> +#define PLL_PI_IBSELH_SHIFT        27
> +#define PLL_SSC_DIV_N_SHIFT        16
> +#define PLL_NCODE_SSC_EMMC_SHIFT   13
> +#define PLL_FLAG_INITAL_EMMC_SHIFT 8
> +
> +#define CYCLE_DEGREES              360
> +#define PHASE_STEPS                32
> +#define PHASE_SCALE_FACTOR         1125
> +
> +static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +
> +	return container_of(clkr, struct clk_pll_mmc, clkr);
> +}
> +
> +static inline int get_phrt0(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &reg);
> +	if (ret)
> +		return ret;
> +
> +	*val = (reg >> PLL_PHRT0_SHIFT) & PLL_PHRT0_MASK;

Sashiko reports the following:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    With PLL_PHRT0_SHIFT defined as 1 and PLL_PHRT0_MASK as BIT(1) (0x02), shifting
    right by 1 moves the target bit 1 to position 0, but masking with 0x02 checks
    position 1 of the shifted value.
    
    Will this cause clk_pll_mmc_is_enabled() to always evaluate to false since it
    expects val == 0x1?

> +	return 0;
> +}
> +
> +static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
> +				  PLL_PHRT0_MASK, val << PLL_PHRT0_SHIFT);
> +}
> +
> +static inline int get_phsel(struct clk_pll_mmc *clkm, int id, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +	u32 sft = id ? 8 : 3;

Put variables in reverse Christmas tree order.

> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val >> sft) & PLL_PHSEL_MASK;
> +	return 0;
> +}
> +
> +static inline int set_phsel(struct clk_pll_mmc *clkm, int id, u32 val)
> +{
> +	u32 sft = id ? 8 : 3;
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
> +				  PLL_PHSEL_MASK << sft, val << sft);
> +}
> +
> +static inline int set_sscpll_rs(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_SSCPLL_RS_MASK, val << PLL_SSCPLL_RS_SHIFT);
> +}
> +
> +static inline int set_sscpll_icp(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_SSCPLL_ICP_MASK, val << PLL_SSCPLL_ICP_SHIFT);
> +}
> +
> +static inline int get_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & PLL_SSC_DIV_EXT_F_MASK) >> PLL_SSC_DIV_EXT_F_SHIFT;
> +	return 0;
> +}
> +
> +static inline int set_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_SSC_DIV_EXT_F_MASK,
> +				  val << PLL_SSC_DIV_EXT_F_SHIFT);
> +}
> +
> +static inline int set_pi_ibselh(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_PI_IBSELH_MASK, val << PLL_PI_IBSELH_SHIFT);
> +}
> +
> +static inline int set_ssc_div_n(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET,
> +				  PLL_SSC_DIV_N_MASK, val << PLL_SSC_DIV_N_SHIFT);
> +}
> +
> +static inline int get_ssc_div_n(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & PLL_SSC_DIV_N_MASK) >> PLL_SSC_DIV_N_SHIFT;
> +	return 0;
> +}
> +
> +static inline int set_pow_ctl(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, val);
> +}
> +
> +static inline int get_pow_ctl(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = raw_val;
> +
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
> +{
> +	struct clk_hw *hwp = clk_hw_get_parent(hw);
> +	struct clk_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;
> +
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;

Are you checking to see if these two pointers are the same? If so, what
do you think about this instead?

    hw == &clkm->phase0_hw

> +	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
> +	ret = set_phsel(clkm, phase_id, val);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_phase_get_phase(struct clk_hw *hw)
> +{
> +	struct clk_hw *hwp;
> +	struct clk_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;
> +
> +	hwp = clk_hw_get_parent(hw);
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;
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
> +	.set_phase = clk_pll_mmc_phase_set_phase,
> +	.get_phase = clk_pll_mmc_phase_get_phase,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "REALTEK_CLK");
> +
> +static int clk_pll_mmc_prepare(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	return set_pow_ctl(clkm, 7);
> +}
> +
> +static void clk_pll_mmc_unprepare(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_pow_ctl(clkm, 0);
> +}
> +
> +static int clk_pll_mmc_is_prepared(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
> +static int clk_pll_mmc_enable(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	int ret;
> +
> +	ret = set_phrt0(clkm, 1);
> +	if (ret)
> +		return ret;
> +
> +	udelay(10);
> +	return 0;
> +}
> +
> +static void clk_pll_mmc_disable(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_phrt0(clkm, 0);
> +	udelay(10);
> +}
> +
> +static int clk_pll_mmc_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
> +static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val, ext_f;
> +	int ret;
> +
> +	ret = get_ssc_div_n(clkm, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = get_ssc_div_ext_f(clkm, &ext_f);
> +	if (ret)
> +		return ret;
> +
> +	return parent_rate / 4 * (val + 2) + (parent_rate / 4 * ext_f) / 8192;
> +}
> +
> +static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{

Should there be a check for a parent rate of zero before the division is
done?

> +	u32 val = DIV_ROUND_CLOSEST(req->rate * 4, req->best_parent_rate);
> +
> +	req->rate = req->best_parent_rate * val / 4;
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
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
> +	switch (val) {
> +	case 31 ... 46:
> +		ret |= set_pi_ibselh(clkm, 3);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 2);
> +		break;
> +
> +	case 20 ... 30:
> +		ret |= set_pi_ibselh(clkm, 2);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 10 ... 19:
> +		ret |= set_pi_ibselh(clkm, 1);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 5 ... 9:
> +		ret |= set_pi_ibselh(clkm, 0);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 0);
> +		break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << PLL_NCODE_SSC_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_FCODE_SSC_EMMC_MASK, 321);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC4_OFFSET,
> +				 PLL_GRAN_EST_EM_MC_MASK, 5985);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_EN_SSC_EMMC_MASK, 0x1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_EN_SSC_EMMC_MASK, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK,
> +				 0x1 << PLL_FLAG_INITAL_EMMC_SHIFT);

It looks like the rate and parent rate are not used in this function.
Will this always end up with the same rate when everything is
successful?

Brian


