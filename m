Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820B8C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYABYwpx6ruAb5bhUwEW7oIyVa3yNnOD8j4tVtfIkMg=; b=bORkX7UiZGBlWKK4tCbOgsK1em
	b5AB4HS/rowDdvNlGoXfyZcXqlP7nbVbBjvASCeR/J5NvN1zrPzztvmOV2rJduR6KA3px9XyVeJg0
	3H+eMFX77ls0giiYW10aBj2L8WjtQc1FcMEEx8lHVXXhgdnBIb+s7PMyPeJDpx3tSixCUzUuXeE1o
	pK1cCVmVNs7b5lkewFQeTr4huYzgjYZLP8MXZDgRX6hMLjyo4j0GBYL0F7feJ9q5CaASqkF1ZCVHq
	i4+CsD5wHrm3akD4DoBaD8C0XpEf/SrQHhn0rsjvfVeSQAh4pMCPiZkK+lTf3zqD4ynuuNajkJnUW
	GxSNcJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvJe-000000003d5-2oze;
	Mon, 03 Aug 2026 16:15:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvJb-000000003bb-1aMD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYABYwpx6ruAb5bhUwEW7oIyVa3yNnOD8j4tVtfIkMg=;
	b=Sc5hXVLp2o4Yb4qOyPjEfxn1Bas+/R22GJ5m2+p15kBu/jB7dvxbhGD6uKQ+ADZD8+5WUi
	bjJrMgUO9FDFsyiFPGUwiAneb8OnNztYlaXjCd4Nozby201eF97mWwg0leEKksXFMrJSUJ
	wwOIYW3CQUq0o6YbiySfHdueprfgl3k=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-uVR1-0fTPgWgXVNeTCFJ3g-1; Mon, 03 Aug 2026 12:14:51 -0400
X-MC-Unique: uVR1-0fTPgWgXVNeTCFJ3g-1
X-Mimecast-MFC-AGG-ID: uVR1-0fTPgWgXVNeTCFJ3g_1785773691
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e85096e65so79517277b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773691; x=1786378491;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TYABYwpx6ruAb5bhUwEW7oIyVa3yNnOD8j4tVtfIkMg=;
        b=N/Z6AZ44X/hZ+yKVijQxuEUNhcVuo7clRa/LH5wbsa3+Az8EE9gSZwcQiBT4vUVRTE
         ia6/QCCUOccs6seIi6JRhbSiERCV7hYnAuvtqtCFmjCIx5Uj35zANegfcAppST8xQyO4
         jW3dAxOMNOjsiXZm6fsqM/IteIFA4cgeSoDijGkc/VVvR0nQLKHbAy3ioXnTEQaOyb4t
         bJ/Li9FRls5pMazC5HJlRKT8MrdMojC/zIK0uoTcrJ479lXRiy5S9n3D0r0aMIzob02z
         HU6hIEFPQJnxZ7fqf2os6S9E7thYameKA8XIHrzCIOg4t9/dOhp7Qf2bXacL1CqWIfrB
         iLtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpX+/h95nHu0tejEHRYU/tPBPDknNb7Y+Fg+7ZCELUGY4NyENtFwf0EjSDQ4H4oP+PhwyquWgBbrZ0RL3oijxfX@lists.infradead.org
X-Gm-Message-State: AOJu0YwovU2vrceUpPNqNz6p2fkzODAWkrpE8UjgLum0tMiMN7sZt0ig
	aIVT+rHx/pQPY97n8CmQLPlE8yREM2707ZwRvOOXoH8reHJ2ZAbHlCVNALsso+BAfr5dulsiPRM
	wTgiRdxAIR3xAWj9Pi8ouIv3JziRNVyed2O2TsZjddIRID+MxTrCtv3VLIlR8XwJaaacjI9I9ID
	Uc
X-Gm-Gg: AR+sD11eq0WwP1emtNO8PhK59/Y21bSP3/2p5xXbMLhlcyyPu6fGN9MKBmVtDiTOXRX
	K8LP773flwdcLf/RNLynpEwEuJZBHdcZjxeV4WU8sSCynjKR0ROYHPfqYvWFINGeskwvtJb7y27
	vj0mkZu/Y6aufsLVN1MSGrPX3dYE066HpFbWNSUGt+TYP+EpAawR/c1PcmC1/7tUIT2Q5vHshXo
	R0+2MyAAbxo46d5JMQ3CQCT4m7aJNtNs6cpFQDRzXzMVfIpIVbtMRmk2jEEzFBf3N54rwfR+Vix
	IVz5y5tGMSjwyPCQT9f17JdsjvJ7X9FsMMr59OjmiElt9znj6j4j4cm5/Zi/f5uk+EgQf7etz5N
	uO2NT6JqcxHFAtXFP+g8Mn7X87QY2W6gh/go=
X-Received: by 2002:a05:690c:e3f0:b0:81c:eca8:dbaf with SMTP id 00721157ae682-81fd4bed013mr148250477b3.31.1785773690493;
        Mon, 03 Aug 2026 09:14:50 -0700 (PDT)
X-Received: by 2002:a05:690c:e3f0:b0:81c:eca8:dbaf with SMTP id 00721157ae682-81fd4bed013mr148250027b3.31.1785773689959;
        Mon, 03 Aug 2026 09:14:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6fcasm57682727b3.29.2026.08.03.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:14:49 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:14:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 07/12] clk: zte: Add zx PLL support infrastructure
Message-ID: <anC-d-cNuHoYD7px@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cn2ySUVmtN7888ALliJ02sHd3jIHZj4O0DNyZ3X_AOA_1785773691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091459_572848_1570BCCB 
X-CRM114-Status: GOOD (  62.46  )
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

On Sun, Aug 02, 2026 at 11:33:39PM +0300, Stefan Dösinger wrote:
> I am guessing how much of this is reusable among other zx chips or even
> differently named ZTE platforms (if there are any). From reading the old
> zx2967 code, I think the PLL code would be reusable there, maybe with
> platform-specific bitmasks but otherwise the same logic.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 9:
> *) Take req->min_rate and req->max_rate into account when looking for
> possible PLL configurations (sashiko). In practice the code will still
> only ever encounter a fixed request to set dpll to 491.52 MHz.
> 
> *) The same code style changes Brian requested on the other clk patches.
> 
> Version 8:
> *) Document the behavior of unlocked PLLs better: They don't pass
> through their reference/parent, but pass through the fixed clock-26m
> oscillator, even if their reference clock is something else.
> *) dpll has working fractionals. Add this in the comment, but there is
> no actual code support for it - the LTE hardware doesn't need it.
> 
> As for Sashiko's comments on the .set_rate implementation: In practice
> .set_rate will only ever set one rate, 491.52 MHz for dpll. All other
> PLLs are bootloader configured. Dpll could be handled by writing a magic
> constant into its config.
> 
> I want to have the rate finding code as documentation, and maybe there
> is more elaborate future use for it (e.g. more flexible underclocking),
> but attempts to handle eventualities like rate searches or misconfigured
> bootloader values would be dead code.
> 
> Version 7:
> *) Always keep unknownpll enabled when prepared so dpll can acquire a
> lock in its prepare() function.
> *) Clean up error reporting a bit (Sashiko)
> 
> Version 6:
> *) Use abs_diff to compare target and candidate PLL rate (Sashiko).
> *) Use req->best_parent_rate in zx29_pll_determine_rate. Add a TODO
> comment about the parent rate flexibility.
> 
> Version 5: Fix some issues pointed out by Sashiko: NULL dev,
> zx29_pll_recalc_rate error handling, disable PLL again on enable error.
> ---
>  drivers/clk/zte/pll-zx.c | 568 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 565 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index fc76c6524a16..e61b462ec0b4 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
> @@ -4,15 +4,577 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/math.h>
> +#include <linux/rational.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
>  
>  #include "clk-zx.h"
>  
> +/*
> + * This code has only been tested with zx297520v3 PLLs, but from reading the zx296718 clock code it
> + * looks like PLL registers are similar. ZTE's sources explain the PLL register contents only in a
> + * .cmm file (A Lauterbach TRACE32 script) and some unused headers in their U-Boot code dump, which
> + * may not be accurate. When calculating the frequencies from the default PLL configuration the
> + * results match the fixed rate clocks from their clock driver.
> + *
> + * The 26 MHz and 32 kHz clocks can be easily observed with the timers. The 104 MHz output can be
> + * observed through the UART. One 122.88 MHz clock can be observed through the TDM device. All
> + * others can only be indirectly inferred, e.g. by comparing CPU speed or SDIO transfer rate between
> + * the fixed 26 MHz oscillator and the provided PLL frequency.
> + *
> + * The formula to calculate the clock is ((ref / refdiv) * fbdiv) / postdiv1 / postdiv2. The masks
> + * are given below. There are a few control flags:
> + *
> + * Bit 31: Disables the PLL, but passes clock-26m through unmodified. Whether POSTDIV_OUT_DISABLE
> + *         still matters is different between PLLs.
> + * Bit 30: Returns if the PLL is locked
> + * Bit 29: Not named in ZTE's code, but can be set. There is no obvious impact. Lock times are
> + *         unchanged, so it doesn't influence or bypass lock detection. It doesn't raise any IRQs or
> + *         influence GPIOs.
> + * Bit 27: Given its name it likely disables the Delta-Sigma Modulator, if one exists at all. The
> + *         boot ROM sets it on every PLL. Unsetting it marginally decreases the time it takes to
> + *         lock to the reference clock (from ~400 us to ~300 us).
> + * Bit 24: Bypasses the VCO, but still applies refdiv and postdiv. Doesn't matter if PLL_DISABLE=1.
> + *
> + * NB: Some PLLs have an automatic bypass logic that forwards clock-26m (REGARDLESS of reference)
> + * when they don't have a lock, regardless of reason. This can be triggered by disabling the PLL,
> + * setting an out-of-spec VCO frequency or disabling the parent. This shouldn't matter in regular
> + * operation, but caused me some confusion when reverse engineering the clock tree. E.g. clock-26m->
> + * unknownpll(disabled) -> dpll(enabled) counterintuitively results in a 26 MHz output clock.
> + */
> +
> +#define ZX29_PLL_DISABLE			BIT(31)
> +#define ZX29_PLL_LOCKED				BIT(30)
> +#define ZX29_PLL_LOCK_FILTER			BIT(29)
> +#define ZX29_PLL_DSM_DISABLE			BIT(27)
> +#define ZX29_PLL_PARENT_MASK			GENMASK(26, 25)
> +#define ZX29_PLL_PARENT_SHIFT			25
> +#define ZX29_PLL_BYPASS				BIT(24)
> +#define ZX29_PLL_REFDIV_MASK			GENMASK(23, 18)
> +#define ZX29_PLL_REFDIV_SHIFT			18
> +#define ZX29_PLL_FBDIV_MASK			GENMASK(17, 6)
> +#define ZX29_PLL_FBDIV_SHIFT			6
> +#define ZX29_PLL_POSTDIV1_MASK			GENMASK(5, 3)
> +#define ZX29_PLL_POSTDIV1_SHIFT			3
> +#define ZX29_PLL_POSTDIV2_MASK			GENMASK(2, 0)
> +#define ZX29_PLL_POSTDIV2_SHIFT			0
> +
> +/*
> + * The second register has a 24 bit fractional value, which only matters when ZX29_PLL_DSM_DISABLE
> + * is not set, and only seems to matter for dpll. ZTE's firmware does not make use of the fractional
> + * and it is unimplemented in this driver. Experimental testing confirms that it has an impact on
> + * dpll.
> + *
> + * Bits 27:24 contain more flags:
> + *
> + * Bit 27: Setting ZX29_PLL_DACAP slows down the lock time and obviates the speed gained from
> + *         !DSM_DISABLE. No other effect observed.
> + *
> + * Bit 26: ZX29_PLL_4PHASE_OUT_DISABLE is set on some PLLs on boot but not on others. It is set on
> + *         boot on mpll and upll, but not gpll, dpll or unknownpll. I am not sure what it does
> + *         either. The SDIO devices break if they are fed from gpll with this flag set, but they
> + *         work OK if they are fed from mpll without this flag set.
> + *
> + * Bit 25: ZX29_PLL_POSTDIV_OUT_DISABLE seems to disable the PLL output entirely. Whether it is
> + *         bypassed by PLL_DISABLE differs between PLLs. gpll still produces an output clock if
> + *         PLL_DISABLE = 1 and POSTDIV_DISABLE = 1, but produces no output if PLL_DISABLE = 0 and
> + *         POSTDIV_DISABLE = 1. The dpll feeder ("unknownpll") at 0x100 produces no output clock if
> + *         both PLL_DISABLE and POSTDIV_DISABLE are set to 1.
> + *
> + * Bit 24: ZX29_PLL_VCO_OUT_DISABLE probably disables the output of the VCO clock without
> + *         post-VCO-dividers, but the raw VCO output is not a possible parent of any consumer clock,
> + *         so I could not confirm this. It does not disable the VCO entirely - that's what
> + *         PLL_DISABLE does.
> + *
> + * A spinlock should not be needed. PLLs don't share their registers with anything else and the
> + * global prepare mutex and enable spinlock should be enough. Beware of conflicts in reg2 between
> + * POSTDIV_OUT_DISABLE and the fractional value in case you find out how fractional dividers work
> + * and add support for them.
> + */
> +#define ZX29_PLL_REG2_OFFSET			4
> +#define ZX29_PLL_DACAP				BIT(27)
> +#define ZX29_PLL_4PHASE_OUT_DISABLE		BIT(26)
> +#define ZX29_PLL_POSTDIV_OUT_DISABLE		BIT(25)
> +#define ZX29_PLL_VCO_OUT_DISABLE		BIT(24)
> +#define ZX29_PLL_FRACT				GENMASK(23, 0)
> +
> +/*
> + * The VCO's frequency range is limited. The stock settings run the VCO between 960 and 1248 MHz.
> + * Ad-hoc testing with gpll suggests that at least this PLL remains stable down to about 7 MHz and
> + * up to 2 GHz and produces a clock that can be used by the SDIO controller. Attempting to run the
> + * mpll VCO at 624 MHz and setting postdiv1 = postdiv2 = 1 - which should result in the same output
> + * frequency - or running it at 1872 MHz with an effective post divider of 3 crashes the CPU. Most
> + * likely the PLLs become unstable outside their core range and the SDIO controller is much more
> + * forgiving than CPU and DRAM are.
> + */
> +#define ZX29_PLL_VCO_MAX_FREQ			(1300 * HZ_PER_MHZ)
> +#define ZX29_PLL_VCO_MIN_FREQ			(900 * HZ_PER_MHZ)
> +
> +struct zx29_clk_pll {
> +	struct clk_hw	hw;
> +	struct device	*dev;
> +	struct regmap	*map;
> +	u16		reg;
> +};
> +
> +static inline struct zx29_clk_pll *to_zx29_clk_pll(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct zx29_clk_pll, hw);
> +}
> +
> +static int zx29_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	int res;
> +
> +	res = regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static int zx29_pll_prepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 val = 0;
> +	int res;
> +
> +	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	/* Lock duration is usually between 300 us and 500 us */
> +	res = regmap_read_poll_timeout(pll->map, pll->reg, val, val & ZX29_PLL_LOCKED, 50, 2000);
> +	if (res) {
> +		regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +		dev_err(pll->dev, "%s: PLL prepare failed: %d. Config value 0x%08x\n",
> +			clk_hw_get_name(&pll->hw), res, val);
> +	}
> +	return res;
> +}
> +
> +static void zx29_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +}
> +
> +static int zx29_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	int res;
> +
> +	res = regmap_test_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +			       ZX29_PLL_POSTDIV_OUT_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static int zx29_pll_enable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	return regmap_clear_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +				 ZX29_PLL_POSTDIV_OUT_DISABLE);
> +}
> +
> +static void zx29_pll_disable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	regmap_set_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +			ZX29_PLL_POSTDIV_OUT_DISABLE);
> +}
> +
> +static unsigned long zx29_pll_get_rate(const struct zx29_clk_pll *pll, unsigned long parent_rate,
> +				       u32 setting)
> +{
> +	unsigned long refdiv, fbdiv, postdiv1, postdiv2, freq;
> +	const char *name = clk_hw_get_name(&pll->hw);
> +	u64 vco;
> +
> +	refdiv = (setting & ZX29_PLL_REFDIV_MASK) >> ZX29_PLL_REFDIV_SHIFT;
> +	fbdiv = (setting & ZX29_PLL_FBDIV_MASK) >> ZX29_PLL_FBDIV_SHIFT;
> +	postdiv1 = (setting & ZX29_PLL_POSTDIV1_MASK) >> ZX29_PLL_POSTDIV1_SHIFT;
> +	postdiv2 = (setting & ZX29_PLL_POSTDIV2_MASK) >> ZX29_PLL_POSTDIV2_SHIFT;
> +	dev_dbg(pll->dev, "%s: reference clock %lu Hz, PLL setting 0x%08x\n",
> +		name, parent_rate, setting);
> +
> +	if (!refdiv || !postdiv1 || !postdiv2) {
> +		dev_err(pll->dev, "%s: divide by zero (%lu, %lu, %lu)\n", name, refdiv, postdiv1,
> +			postdiv2);
> +		return 0;
> +	}
> +
> +	vco = div_u64((u64)parent_rate * fbdiv, refdiv);
> +	freq = div_u64(div_u64(vco, postdiv1), postdiv2);
> +	dev_dbg(pll->dev, "%s: refdiv %lu fbdiv %lu\n", name, refdiv, fbdiv);
> +	dev_dbg(pll->dev, "%s: postdiv1 %lu postdiv2 %lu\n", name, postdiv1, postdiv2);
> +
> +	dev_dbg(pll->dev, "%s: %lu MHz\n", name, freq / HZ_PER_MHZ);
> +
> +	return freq;
> +}
> +
> +static unsigned long zx29_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 val;
> +	int res;
> +
> +	res = regmap_read(pll->map, pll->reg, &val);
> +	if (res < 0) {
> +		dev_err(pll->dev, "%s: Failed to read PLL settings\n", clk_hw_get_name(&pll->hw));
> +		return 0;
> +	}
> +
> +	return zx29_pll_get_rate(pll, parent_rate, val);
> +}
> +
> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned long parent_rate,
> +				unsigned long rate, unsigned long min_rate, unsigned long max_rate)
> +{
> +	const unsigned int postdiv1_max = (1 << hweight32(ZX29_PLL_POSTDIV1_MASK)) - 1;
> +	const unsigned int postdiv2_max = (1 << hweight32(ZX29_PLL_POSTDIV2_MASK)) - 1;
> +	unsigned long fbdiv, refdiv, best_fbdiv = 0, best_refdiv = 0;
> +	u32 postdiv1 = 0, postdiv2 = 0, i, j, setting;
> +	const char *name = clk_hw_get_name(&pll->hw);
> +	long best = LONG_MAX;
> +
> +	/*
> +	 * This code produces the same VCO settings that the boot loader and stock firmware use for
> +	 * the standard frequencies. It has seen only very little manual testing beyond that.
> +	 *
> +	 * The goal is to find a VCO setting that gets us as close as possible to the desired output
> +	 * rate, while being within the VCO's operating limits and achievable with the input value
> +	 * range. It is iterating over possible post-VCO divider values (1-7)*(1-7) to look for
> +	 * valid VCO target frequencies and then looks for refdiv and fbdiv values to achieve the
> +	 * VCO frequency from the reference frequency.
> +	 */
> +	for (j = 1; j <= postdiv2_max; j++) {
> +		for (i = 1; i <= postdiv1_max; i++) {
> +			u64 vco = (u64)rate * i * j;
> +			unsigned long out;
> +
> +			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
> +				continue;
> +
> +			rational_best_approximation(vco, parent_rate,
> +						    (1 << hweight32(ZX29_PLL_FBDIV_MASK)) - 1,
> +						    (1 << hweight32(ZX29_PLL_REFDIV_MASK)) - 1,
> +						    &fbdiv, &refdiv);
> +			setting = fbdiv << ZX29_PLL_FBDIV_SHIFT;
> +			setting |= refdiv << ZX29_PLL_REFDIV_SHIFT;
> +			setting |= i << ZX29_PLL_POSTDIV1_SHIFT;
> +			setting |= j << ZX29_PLL_POSTDIV2_SHIFT;
> +			out = zx29_pll_get_rate(pll, parent_rate, setting);
> +
> +			if (out < min_rate || out > max_rate)
> +				continue;
> +
> +			if (abs_diff(out, rate) > best)
> +				continue;
> +
> +			if (abs_diff(out, rate) < best) {
> +				postdiv1 = i;
> +				postdiv2 = j;
> +				best_fbdiv = fbdiv;
> +				best_refdiv = refdiv;
> +				best = abs_diff(out, rate);
> +
> +				if (!best)
> +					goto search_done;
> +			}
> +		}
> +	}
> +search_done:
> +
> +	if (!postdiv1) {
> +		dev_err(pll->dev, "Did not find a setting for %lu Hz, parent %lu Hz\n",
> +			rate, parent_rate);
> +		return 0;
> +	}
> +
> +	dev_dbg(pll->dev, "%s: parent rate %lu\n", name, parent_rate);
> +	dev_dbg(pll->dev, "%s: found VCO dividers %u and %u\n", name, postdiv1, postdiv2);
> +	dev_dbg(pll->dev, "%s: VCO target rate %lu\n", name, rate * postdiv1 * postdiv2);
> +
> +	dev_dbg(pll->dev, "%s: Got fbdiv = %lu refdiv = %lu\n", name, best_fbdiv, best_refdiv);
> +
> +	setting = best_fbdiv << ZX29_PLL_FBDIV_SHIFT;
> +	setting |= best_refdiv << ZX29_PLL_REFDIV_SHIFT;
> +	setting |= postdiv1 << ZX29_PLL_POSTDIV1_SHIFT;
> +	setting |= postdiv2 << ZX29_PLL_POSTDIV2_SHIFT;
> +	dev_dbg(pll->dev, "%s: Final setting 0x%08x\n", name, setting);
> +
> +	return setting;
> +}
> +
> +static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	unsigned long new_rate;
> +	u32 setting;
> +
> +	/*
> +	 * TODO: DPLL can switch between two parents, one of which is another PLL. Take this into
> +	 * account when searching the config space and set req->best_parent_rate.
> +	 *
> +	 * In practice it shouldn't matter though. Dpll is always configured to a fixed frequency
> +	 * and is the only clock with a switchable parent.
> +	 */
> +	if (!req->best_parent_rate) {
> +		dev_err(pll->dev, "Did not expect best_parent_rate=0\n");
> +		return -EINVAL;
> +	}
> +
> +	setting = zx29_pll_calc_values(pll, req->best_parent_rate, req->rate, req->min_rate,
> +				       req->max_rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	new_rate = zx29_pll_get_rate(pll, req->best_parent_rate, setting);
> +	if (new_rate != req->rate) {
> +		dev_warn(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
> +			 req->rate, new_rate);

Could this also be dev_dbg() ?

> +		req->rate = new_rate;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 setting;
> +
> +	/*
> +	 * TODO: Implement gradual PLL rate change. PLLs can be changed while they are running and
> +	 * downstream hardware is generally fine with that. The exception is DRAM, which reads
> +	 * incorrect values if changed too fast.
> +	 *
> +	 * Changing the mpll rate is potentially useful for over/underclocking. Gating mpll is
> +	 * unrealistic because too many devices depend on it.
> +	 */
> +	setting = zx29_pll_calc_values(pll, parent_rate, rate, rate, rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	dev_info(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get_name(hw), setting);

dev_dbg()

Brian


