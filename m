Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8473C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1YmJ2Yl5V2ZhsO1UKkB3t/Z4MofhOH7vUCN9ENl/oo=; b=gtYOWq2tKerEoHmyLZlFuGv0MA
	hwd6lZh/VV7lOJ62z8x6dg/3LAv/rD7v9Zcn9rwKFg/wyulkPDGO0Tem5ha4ZBSB2j5EVqxq6Uik/
	jmejETY4+bErsMucmivaD3BtIv9KUmgNHslOK29Y24/H5WoSZ1DzfhjRPJnVBMZoxaZGbQf/KYd+W
	ElxEjzOF5j+P+jO27/WRJglyBNIiTyESTrYbHk0hHYqArlyi7J6S49LYnmeOGMmG5wik9ldMEh/nD
	TbGq47EV8k9VlkpScjne7fhvx+a3+S0HEEXEZAssoraDEVFZpMP9FIV5kPhqhzTGka5KVcLVMGGNy
	h14TSqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tssBE-0000000CjMx-3sWd;
	Thu, 13 Mar 2025 23:41:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tss9Z-0000000CiyM-3T3g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 23:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16855A46B67;
	Thu, 13 Mar 2025 23:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A954C4CEDD;
	Thu, 13 Mar 2025 23:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741909192;
	bh=2z6ezAeNvjahNZFYCeyRYH8PF3ZV80Mda54e9RYJ4lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gehplF6Kr094W2laWojCAjVVZde9HUHvIjfCgZvzyJngfZhs4l0uAUXg29wXsV+ZN
	 ig/371z3sEYSRRq342+7qbQfCdakmwa3MXV+SdmWzp5zCPbsrY7SH1B8Gb7e33cgss
	 Xu/yLTASQ3MDuNQSojFg/rPHSHSQYw7ViNbTBNlM5i18EvPS6TjWCDLF613o7aN4mr
	 Mvzxnwp8hmbseP8GifmaXZKh9kyo9b08QX/t4ff0/c3BEiJBiuMuLDRD1sSxxMFArp
	 nJq9gTceI94W+5og0J5plRjU4nPNydm5TB93O9j0nQFhPIbyExS7JmN8nT+g2BAw2Y
	 BeX+y0Li4e4/Q==
Date: Thu, 13 Mar 2025 18:39:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Message-ID: <r6xikx2idlzwc4xl7doap3v5ug3a6qtg65jwqjuekiv7tvbwzn@5nk4c7nl2zws>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-1-ebf4b9a5e916@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-1-ebf4b9a5e916@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_163953_993449_246DED60 
X-CRM114-Status: GOOD (  32.19  )
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

On Thu, Mar 13, 2025 at 12:29:38PM +0530, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 171 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..7d784db8b7441e886d94ded1d3e3258dda46674c 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2960,3 +2960,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	int ret;
> +	u32 val;
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	mb();
> +	udelay(1);
> +
> +	return wait_for_pll_enable_lock(pll);
> +}
> +
> +static int clk_alpha_pll_slew_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	unsigned long freq_hz;
> +	const struct pll_vco *curr_vco, *vco;
> +	u32 l, alpha_width = pll_alpha_width(pll);
> +	u64 a;
> +
> +	freq_hz =  alpha_pll_round_rate(rate, parent_rate, &l, &a, alpha_width);

Double space here.

> +	if (freq_hz != rate) {
> +		pr_err("alpha_pll: Call clk_set_rate with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	curr_vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +	if (!curr_vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	vco = alpha_pll_find_vco(pll, freq_hz);
> +	if (!vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Dynamic pll update will not support switching frequencies across
> +	 * vco ranges. In those cases fall back to normal alpha set rate.
> +	 */
> +	if (curr_vco->val != vco->val)
> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
> +
> +	a = a << (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);

Above this function is written to deal with both alpha bitwidths, but
here it's assumed to only be one of the cases.

It would be nice to get this cleaned up somehow, because we now have
this shift 6 times in slightly different forms.

> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);

In a number of places in the driver alpha_width is compared to 32 bits
to see if this should be written or not. Perhaps that's not applicable
here, but again, if so then why is it dynamic above?


Also, how about upper_32_bits() and lower_32_bits() to make it clear
what's going on here?

> +
> +	/* Ensure that the write above goes through before proceeding. */

That's not what mb() does.

Regards,
Bjorn

> +	mb();
> +
> +	if (clk_hw_is_enabled(hw))
> +		return clk_alpha_pll_slew_update(pll);
> +
> +	return 0;
> +}
> +
> +/*
> + * Slewing plls should be bought up at frequency which is in the middle of the
> + * desired VCO range. So after bringing up the pll at calibration freq, set it
> + * back to desired frequency(that was set by previous clk_set_rate).
> + */
> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
> +{
> +	unsigned long calibration_freq, freq_hz;
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *parent;
> +	const struct pll_vco *vco;
> +	u32 l, alpha_width = pll_alpha_width(pll);
> +	int rc;
> +	u64 a;
> +
> +	parent = clk_hw_get_parent(hw);
> +	if (!parent) {
> +		pr_err("alpha pll: no valid parent found\n");
> +		return -EINVAL;
> +	}
> +
> +	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +	if (!vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * As during slewing plls vco_sel won't be allowed to change, vco table
> +	 * should have only one entry table, i.e. index = 0, find the
> +	 * calibration frequency.
> +	 */
> +	calibration_freq = (pll->vco_table[0].min_freq + pll->vco_table[0].max_freq) / 2;
> +
> +	freq_hz = alpha_pll_round_rate(calibration_freq, clk_hw_get_rate(parent),
> +					&l, &a, alpha_width);
> +	if (freq_hz != calibration_freq) {
> +		pr_err("alpha_pll: call clk_set_rate with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup PLL for calibration frequency */
> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_VCO_MASK << PLL_VCO_SHIFT,
> +				vco->val << PLL_VCO_SHIFT);
> +
> +	/* Bringup the pll at calibration frequency */
> +	rc = clk_alpha_pll_enable(hw);
> +	if (rc) {
> +		pr_err("alpha pll calibration failed\n");
> +		return rc;
> +	}
> +
> +	/*
> +	 * PLL is already running at calibration frequency.
> +	 * So slew pll to the previously set frequency.
> +	 */
> +	freq_hz = alpha_pll_round_rate(clk_hw_get_rate(hw),
> +			clk_hw_get_rate(parent), &l, &a, alpha_width);
> +
> +	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
> +		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
> +
> +	/* Setup the PLL for the new frequency */
> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN, PLL_ALPHA_EN);
> +
> +	return clk_alpha_pll_slew_update(pll);
> +}
> +
> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
> +{
> +	int rc;
> +
> +	rc = clk_alpha_pll_calibrate(hw);
> +	if (rc)
> +		return rc;
> +
> +	return clk_alpha_pll_enable(hw);
> +}
> +
> +const struct clk_ops clk_alpha_pll_slew_ops = {
> +	.enable = clk_alpha_pll_slew_enable,
> +	.disable = clk_alpha_pll_disable,
> +	.recalc_rate = clk_alpha_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = clk_alpha_pll_slew_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_slew_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 79aca8525262211ae5295245427d4540abf1e09a..1d19001605eb10fd8ae8041c56d951e928cbbe9f 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -204,6 +204,7 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>  #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
>  
>  extern const struct clk_ops clk_alpha_pll_regera_ops;
> +extern const struct clk_ops clk_alpha_pll_slew_ops;
>  
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
> 
> -- 
> 2.48.1
> 

