Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FCEC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOFg3uB1MZbh2ZCAZYuGZSOt7Ipd4Py1U2yaIA/Pc7s=; b=4p0y0S4W5iKiObtZnKMxOdxNbZ
	jc/X3c00Sm0mqPvmjdOTVwCwTinc2E7jwpYrZR8ivHba4PFdjcWDf5AXI6D1HkyV4K2+cQvRQ0t6i
	Ry+fuMTedMwThxPvap7Gv0VXtxkrHVW5jaxsnp+hxd+HweOl/bBD5584XKwkHkSQybGZMIno3WaUv
	PGL72aMv2DSP1wYiEZBD00esKC0V9Dtgqr6EW0p7+psRQtN7uGSmyijbLBGzh7uCDAehA5p+ZpOso
	8CjDre+hKXXOQDJ0+sTNp49PrwLRQYcDjEU0WwhElUMyqjHt/bF+b7G4ZGP34K6TS3LTCOaLL1lzU
	gMJmL1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK1L-00000002Rr2-1lcs;
	Mon, 14 Jul 2025 14:19:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJnl-00000002Pkx-4AO9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73C745C61E3;
	Mon, 14 Jul 2025 14:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D899C4CEF0;
	Mon, 14 Jul 2025 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752501905;
	bh=EocI6ObgL37liRI9WW5f9BVNKTK6gn6068Ri6+WKImA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBMuCA4uFQ3xCg5qkj4+X2S3Ok65SznAs4mYRq4MasZAhb1BpMWeQE25kkJH954uJ
	 R3LURzdGggBqtucYDUtIfRB7Ax9fBM6wEiqNwqOP+WJK1zUVzXzPCqMUIH0HypBzRI
	 y+IC0h4gUcrirH82AHDJsnrRtCT/eyxpxV0xI1K5tdVL0TWCwCFw7j47mu9LVDUV72
	 d/3gCb1QtXktwVefouUVdtJcWdIbhP9JYDJ7m0XvETMOTR9FC46AHanPX0QBZuRd8C
	 6VC7dG9feVMjOGFWq/ssZ0TTAajh+NWaPNqI/qndjACqaQ/5OZOtJhuZ1DV7kBdayi
	 zhSWHfWJn1ALg==
Date: Mon, 14 Jul 2025 15:04:58 +0100
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
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on
 data source
Message-ID: <aHUOig-kaRo15ZH5@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_070506_118563_F2F92AA2 
X-CRM114-Status: GOOD (  26.15  )
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

On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
> when any of the filter bits are set.
> 
> Each bit maps to data sources 0-63 described by bits[0:5] in the data
> source packet (although the full range of data source is 16 bits so
> higher value data sources can't be filtered on). The filter is an OR of
> all the bits, so for example setting bits 0 and 3 filters packets from
> data sources 0 OR 3.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/perf/arm_spe_pmu.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 9309b846f642..d04318411f77 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -87,6 +87,7 @@ struct arm_spe_pmu {
>  #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>  #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
>  #define SPE_PMU_FEAT_EFT			(1UL << 8)
> +#define SPE_PMU_FEAT_FDS			(1UL << 9)
>  #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>  	u64					features;
>  
> @@ -232,6 +233,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>  #define ATTR_CFG_FLD_inv_event_filter_LO	0
>  #define ATTR_CFG_FLD_inv_event_filter_HI	63
>  
> +#define ATTR_CFG_FLD_data_src_filter_CFG	config4	/* PMSDSFR_EL1 */
> +#define ATTR_CFG_FLD_data_src_filter_LO	0
> +#define ATTR_CFG_FLD_data_src_filter_HI	63
> +
>  GEN_PMU_FORMAT_ATTR(ts_enable);
>  GEN_PMU_FORMAT_ATTR(pa_enable);
>  GEN_PMU_FORMAT_ATTR(pct_enable);
> @@ -248,6 +253,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
>  GEN_PMU_FORMAT_ATTR(float_filter_mask);
>  GEN_PMU_FORMAT_ATTR(event_filter);
>  GEN_PMU_FORMAT_ATTR(inv_event_filter);
> +GEN_PMU_FORMAT_ATTR(data_src_filter);
>  GEN_PMU_FORMAT_ATTR(min_latency);
>  GEN_PMU_FORMAT_ATTR(discard);
>  
> @@ -268,6 +274,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>  	&format_attr_float_filter_mask.attr,
>  	&format_attr_event_filter.attr,
>  	&format_attr_inv_event_filter.attr,
> +	&format_attr_data_src_filter.attr,
>  	&format_attr_min_latency.attr,
>  	&format_attr_discard.attr,
>  	NULL,
> @@ -286,6 +293,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>  	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>  		return 0;
>  
> +	if (attr == &format_attr_data_src_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_FDS))
> +		return 0;
> +
>  	if ((attr == &format_attr_branch_filter_mask.attr ||
>  	     attr == &format_attr_load_filter_mask.attr ||
>  	     attr == &format_attr_store_filter_mask.attr ||
> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>  	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>  		reg |= PMSFCR_EL1_FnE;
>  
> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
> +		reg |= PMSFCR_EL1_FDS;

Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
that setting bits to 1 _excludes_ the FDS filtering.

>  	if (ATTR_CFG_GET_FLD(attr, min_latency))
>  		reg |= PMSFCR_EL1_FL;
>  
> @@ -430,6 +443,12 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
>  	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
>  }
>  
> +static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
> +{
> +	struct perf_event_attr *attr = &event->attr;
> +	return ATTR_CFG_GET_FLD(attr, data_src_filter);
> +}
> +
>  static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
>  {
>  	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
> @@ -788,6 +807,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>  	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
>  		return -EOPNOTSUPP;
>  
> +	if (arm_spe_event_to_pmsdsfr(event) &&
> +	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
> +		return -EOPNOTSUPP;

Same question here.

Will

