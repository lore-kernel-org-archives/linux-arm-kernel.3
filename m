Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D530C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xOuoQOHTjKwZe+2mV2V4jjmjJc9BzXKGHyKuC+khKQ=; b=Rw6x6paTFL60ITomtB+zI2gemD
	2wI3zzK4QnE9OjnE/eQq2J5p0Tf9ga/bZXlUXLJ3vXy3n+EUJOYL0m9ZiIhj/tErrc2v7oEkhsGJf
	8JJFFfbKbiWlAyxCM5fKnVe3FqaP+aP2evx0h43y6CZ8Z7ynuvlC9ylz551apPiOcrGwm7LpnPTUO
	xUuWtzL+YmHnjmueSuMpYbRfJSd5GyeCvvrlReK5+GLC2IDPjZhe3tQzQmnprip4+XdjFNANbdD46
	LCE/ygW044YVHm4Ja3jYxyyIyqv0g9qPxsI++6Bi9+o26LUo3DtkMLaHYPRcrqH/4JxK8IpkAobrF
	/d+d/jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJfA-00000002Ni5-1PLv;
	Mon, 14 Jul 2025 13:56:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJVh-00000002M8F-1vku
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E4C7A5710D;
	Mon, 14 Jul 2025 13:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FA9C4CEED;
	Mon, 14 Jul 2025 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752500784;
	bh=z6HOlc4d4/6v9yiOT75dMW3Y+Io2teVHe4b1UBdhmCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIBZiCJTIKcoMWgz53SvYqU3ji9dzJEOTX+rFPy95fViBAusWB9EkY/w4W3up1gyR
	 QHtxlLIZCjXLRof2AjpP3ONdEVpxnTBsQwfhFTzHy8qR+f9lhU9dJWPhG+svZCkJFc
	 Z11jlBcwl4r/tXv+Q0sQz9nUT0PM1i6aApkMVyLvn+V/2FGDBOVgGW7IRhVayckknz
	 WEwRr2aAhGQBblBdnkpp3MX24zHuQshjSxoHUeyM+LyiPOrqm6eKZy3lZkIYK4eyc5
	 eHO7nemJ3YhytIe6vz1zpmz5NyE5cnRApAjw1rerqH2HFcYjcBFAnwziN3FGhbzA+5
	 D/g+8lPwKKRmA==
Date: Mon, 14 Jul 2025 14:46:16 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 03/10] perf: arm_spe: Add support for FEAT_SPE_EFT
 extended filtering
Message-ID: <aHUKKPySsJ4ne-EE@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-3-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-3-71b0c9f98093@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_064625_621853_86A613D4 
X-CRM114-Status: GOOD (  29.63  )
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

On Thu, Jun 05, 2025 at 11:49:01AM +0100, James Clark wrote:
> FEAT_SPE_EFT (optional from Armv9.4) adds mask bits for the existing
> load, store and branch filters. It also adds two new filter bits for
> SIMD and floating point with their own associated mask bits. The current
> filters only allow OR filtering on samples that are load OR store etc,
> and the new mask bits allow setting part of the filter to an AND, for
> example filtering samples that are store AND SIMD. With mask bits set to
> 0, the OR behavior is preserved, so the unless any masks are explicitly
> set old filters will behave the same.
> 
> Add them all and make them behave the same way as existing format bits,
> hidden and return EOPNOTSUPP if set when the feature doesn't exist.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/perf/arm_spe_pmu.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index d9f6d229dce8..9309b846f642 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -86,6 +86,7 @@ struct arm_spe_pmu {
>  #define SPE_PMU_FEAT_ERND			(1UL << 5)
>  #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>  #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> +#define SPE_PMU_FEAT_EFT			(1UL << 8)
>  #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>  	u64					features;
>  
> @@ -197,6 +198,27 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>  #define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
>  #define ATTR_CFG_FLD_discard_LO			35
>  #define ATTR_CFG_FLD_discard_HI			35
> +#define ATTR_CFG_FLD_branch_filter_mask_CFG	config	/* PMSFCR_EL1.Bm */
> +#define ATTR_CFG_FLD_branch_filter_mask_LO	36
> +#define ATTR_CFG_FLD_branch_filter_mask_HI	36
> +#define ATTR_CFG_FLD_load_filter_mask_CFG	config	/* PMSFCR_EL1.LDm */
> +#define ATTR_CFG_FLD_load_filter_mask_LO	37
> +#define ATTR_CFG_FLD_load_filter_mask_HI	37
> +#define ATTR_CFG_FLD_store_filter_mask_CFG	config	/* PMSFCR_EL1.STm */
> +#define ATTR_CFG_FLD_store_filter_mask_LO	38
> +#define ATTR_CFG_FLD_store_filter_mask_HI	38
> +#define ATTR_CFG_FLD_simd_filter_CFG		config	/* PMSFCR_EL1.SIMD */
> +#define ATTR_CFG_FLD_simd_filter_LO		39
> +#define ATTR_CFG_FLD_simd_filter_HI		39
> +#define ATTR_CFG_FLD_simd_filter_mask_CFG	config	/* PMSFCR_EL1.SIMDm */
> +#define ATTR_CFG_FLD_simd_filter_mask_LO	40
> +#define ATTR_CFG_FLD_simd_filter_mask_HI	40
> +#define ATTR_CFG_FLD_float_filter_CFG		config	/* PMSFCR_EL1.FP */
> +#define ATTR_CFG_FLD_float_filter_LO		41
> +#define ATTR_CFG_FLD_float_filter_HI		41
> +#define ATTR_CFG_FLD_float_filter_mask_CFG	config	/* PMSFCR_EL1.FPm */
> +#define ATTR_CFG_FLD_float_filter_mask_LO	42
> +#define ATTR_CFG_FLD_float_filter_mask_HI	42
>  
>  #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
>  #define ATTR_CFG_FLD_event_filter_LO		0
> @@ -215,8 +237,15 @@ GEN_PMU_FORMAT_ATTR(pa_enable);
>  GEN_PMU_FORMAT_ATTR(pct_enable);
>  GEN_PMU_FORMAT_ATTR(jitter);
>  GEN_PMU_FORMAT_ATTR(branch_filter);
> +GEN_PMU_FORMAT_ATTR(branch_filter_mask);
>  GEN_PMU_FORMAT_ATTR(load_filter);
> +GEN_PMU_FORMAT_ATTR(load_filter_mask);
>  GEN_PMU_FORMAT_ATTR(store_filter);
> +GEN_PMU_FORMAT_ATTR(store_filter_mask);
> +GEN_PMU_FORMAT_ATTR(simd_filter);
> +GEN_PMU_FORMAT_ATTR(simd_filter_mask);
> +GEN_PMU_FORMAT_ATTR(float_filter);
> +GEN_PMU_FORMAT_ATTR(float_filter_mask);
>  GEN_PMU_FORMAT_ATTR(event_filter);
>  GEN_PMU_FORMAT_ATTR(inv_event_filter);
>  GEN_PMU_FORMAT_ATTR(min_latency);
> @@ -228,8 +257,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>  	&format_attr_pct_enable.attr,
>  	&format_attr_jitter.attr,
>  	&format_attr_branch_filter.attr,
> +	&format_attr_branch_filter_mask.attr,
>  	&format_attr_load_filter.attr,
> +	&format_attr_load_filter_mask.attr,
>  	&format_attr_store_filter.attr,
> +	&format_attr_store_filter_mask.attr,
> +	&format_attr_simd_filter.attr,
> +	&format_attr_simd_filter_mask.attr,
> +	&format_attr_float_filter.attr,
> +	&format_attr_float_filter_mask.attr,
>  	&format_attr_event_filter.attr,
>  	&format_attr_inv_event_filter.attr,
>  	&format_attr_min_latency.attr,
> @@ -250,6 +286,16 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>  	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>  		return 0;
>  
> +	if ((attr == &format_attr_branch_filter_mask.attr ||
> +	     attr == &format_attr_load_filter_mask.attr ||
> +	     attr == &format_attr_store_filter_mask.attr ||
> +	     attr == &format_attr_simd_filter.attr ||
> +	     attr == &format_attr_simd_filter_mask.attr ||
> +	     attr == &format_attr_float_filter.attr ||
> +	     attr == &format_attr_float_filter_mask.attr) &&
> +	     !(spe_pmu->features & SPE_PMU_FEAT_EFT))
> +		return 0;
> +
>  	return attr->mode;
>  }
>  
> @@ -341,8 +387,15 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>  	u64 reg = 0;
>  
>  	reg |= FIELD_PREP(PMSFCR_EL1_LD, ATTR_CFG_GET_FLD(attr, load_filter));
> +	reg |= FIELD_PREP(PMSFCR_EL1_LDm, ATTR_CFG_GET_FLD(attr, load_filter_mask));
>  	reg |= FIELD_PREP(PMSFCR_EL1_ST, ATTR_CFG_GET_FLD(attr, store_filter));
> +	reg |= FIELD_PREP(PMSFCR_EL1_STm, ATTR_CFG_GET_FLD(attr, store_filter_mask));
>  	reg |= FIELD_PREP(PMSFCR_EL1_B, ATTR_CFG_GET_FLD(attr, branch_filter));
> +	reg |= FIELD_PREP(PMSFCR_EL1_Bm, ATTR_CFG_GET_FLD(attr, branch_filter_mask));
> +	reg |= FIELD_PREP(PMSFCR_EL1_SIMD, ATTR_CFG_GET_FLD(attr, simd_filter));
> +	reg |= FIELD_PREP(PMSFCR_EL1_SIMDm, ATTR_CFG_GET_FLD(attr, simd_filter_mask));
> +	reg |= FIELD_PREP(PMSFCR_EL1_FP, ATTR_CFG_GET_FLD(attr, float_filter));
> +	reg |= FIELD_PREP(PMSFCR_EL1_FPm, ATTR_CFG_GET_FLD(attr, float_filter_mask));
>  
>  	if (reg)
>  		reg |= PMSFCR_EL1_FT;
> @@ -716,6 +769,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>  	u64 reg;
>  	struct perf_event_attr *attr = &event->attr;
>  	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
> +	const u64 feat_spe_eft_bits = PMSFCR_EL1_LDm | PMSFCR_EL1_STm |
> +				      PMSFCR_EL1_Bm | PMSFCR_EL1_SIMD |
> +				      PMSFCR_EL1_SIMDm | PMSFCR_EL1_FP |
> +				      PMSFCR_EL1_FPm;

I'm not sure this constant is adding much, especially as its defined
quite a long way from its single user.

>  
>  	/* This is, of course, deeply driver-specific */
>  	if (attr->type != event->pmu->type)
> @@ -761,6 +818,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>  	    !(spe_pmu->features & SPE_PMU_FEAT_FILT_LAT))
>  		return -EOPNOTSUPP;
>  
> +	if ((reg & feat_spe_eft_bits) &&
> +	    !(spe_pmu->features & SPE_PMU_FEAT_EFT))
> +		return -EOPNOTSUPP;

You could probably just spell out the entire thing tbh. It's verbose,
but it's also pretty clear and it means we have everything in one place:

	if ((FIELD_GET(PMSFCR_EL1_LDm, reg) ||
	     FIELD_GET(PMSFCR_EL1_STm, reg) ||
	     FIELD_GET(PMSFCR_EL1_Bm, reg) ||
	     FIELD_GET(PMSFCR_EL1_SIMD, reg) ||
	     FIELD_GET(PMSFCR_EL1_SIMDm, reg) ||
	     FIELD_GET(PMSFCR_EL1_FP, reg) ||
	     FIELD_GET(PMSFCR_EL1_FPm, reg)) &&
           !(spe_pmu->features & SPE_PMU_FEAT_EFT))
		return -EOPNOTSUPP;

Will

