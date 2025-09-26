Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F919CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeqyLlf/wmLuKZRqaX2GHEYBPhLXtxsS6sL6rlWRZy8=; b=2ip7ocaNKrFY6i7geMiBWe+AXW
	/DTRbti2SxBfTHYRaX6Go5A62kuFy9mCuUwfdR6DKhA/lb7Osb+IoEl0qQuTOBMmuPMYWFLXVBb7a
	AWS08lvi+VVaMxk6ycFTCKRx9QAeslJJN9WBf/1BqacIcXy/ejnIwlSs+NfgvJgBB4sFT8wFJ9YFA
	Zhr2efxDaNvBLWA8MIp/h2rgqULPI/ZHgeZLMhmIvZbKipy4mGodiFPwY7IBOTGvtAvHpZRxPI+gV
	5Fd6crVog0XWQIfiuImKa/spuQo9FeeiyHKF/grWOT3CGQ+iLpuOgR6H2E4HPf4wKWEhopST/3Znv
	EDLudvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25kQ-00000000QbN-0IlL;
	Fri, 26 Sep 2025 10:32:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25kM-00000000QYF-37s6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:32:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3FF8168F;
	Fri, 26 Sep 2025 03:32:03 -0700 (PDT)
Received: from [10.57.32.231] (unknown [10.57.32.231])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BE2D3F5A1;
	Fri, 26 Sep 2025 03:32:09 -0700 (PDT)
Message-ID: <1ff12bce-1369-48e9-8807-3a7ecd8e1559@arm.com>
Date: Fri, 26 Sep 2025 11:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, suzuki.poulose@arm.com, mark.rutland@arm.com,
 treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
 rwiley@nvidia.com, sdonthineni@nvidia.com
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-6-bwicaksono@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250923001840.1586078-6-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_033214_889452_4F041C3A 
X-CRM114-Status: GOOD (  21.89  )
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

On 2025-09-23 1:18 am, Besar Wicaksono wrote:
> Support NVIDIA PMU that utilizes the optional event filter2 register.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>   drivers/perf/arm_cspmu/nvidia_cspmu.c | 176 +++++++++++++++++++-------
>   1 file changed, 133 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index ac91dc46501d..e06a06d3407b 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -40,10 +40,21 @@
>   
>   struct nv_cspmu_ctx {
>   	const char *name;
> -	u32 filter_mask;
> -	u32 filter_default_val;
> +
>   	struct attribute **event_attr;
>   	struct attribute **format_attr;
> +
> +	u32 filter_mask;
> +	u32 filter_default_val;
> +	u32 filter2_mask;
> +	u32 filter2_default_val;
> +
> +	u32 (*get_filter)(const struct perf_event *event);
> +	u32 (*get_filter2)(const struct perf_event *event);

Callbacks for this seem like complete overkill - you already know 
whether a given implementation cares about each filter via 
.filter{,2}_mask being nonzero, so unless you intend to have wildly 
different event encodings across implementations, a simple conditional 
extension of the existing nv_cspmu_event_filter() logic should be all 
you need.

Thanks,
Robin.

> +
> +	void *data;
> +
> +	int (*init_data)(struct arm_cspmu *cspmu);
>   };
>   
>   static struct attribute *scf_pmu_event_attrs[] = {
> @@ -144,6 +155,7 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
>   static struct attribute *generic_pmu_format_attrs[] = {
>   	ARM_CSPMU_FORMAT_EVENT_ATTR,
>   	ARM_CSPMU_FORMAT_FILTER_ATTR,
> +	ARM_CSPMU_FORMAT_FILTER2_ATTR,
>   	NULL,
>   };
>   
> @@ -184,13 +196,36 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
>   	return filter_val;
>   }
>   
> +static u32 nv_cspmu_event_filter2(const struct perf_event *event)
> +{
> +	const struct nv_cspmu_ctx *ctx =
> +		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> +
> +	const u32 filter_val = event->attr.config2 & ctx->filter2_mask;
> +
> +	if (filter_val == 0)
> +		return ctx->filter2_default_val;
> +
> +	return filter_val;
> +}
> +
>   static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
>   				   const struct perf_event *event)
>   {
> -	u32 filter = nv_cspmu_event_filter(event);
> -	u32 offset = PMEVFILTR + (4 * event->hw.idx);
> +	u32 filter, offset;
> +	const struct nv_cspmu_ctx *ctx =
> +		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> +	offset = 4 * event->hw.idx;
>   
> -	writel(filter, cspmu->base0 + offset);
> +	if (ctx->get_filter) {
> +		filter = ctx->get_filter(event);
> +		writel(filter, cspmu->base0 + PMEVFILTR + offset);
> +	}
> +
> +	if (ctx->get_filter2) {
> +		filter = ctx->get_filter2(event);
> +		writel(filter, cspmu->base0 + PMEVFILT2R + offset);
> +	}
>   }
>   
>   static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> @@ -210,74 +245,120 @@ enum nv_cspmu_name_fmt {
>   struct nv_cspmu_match {
>   	u32 prodid;
>   	u32 prodid_mask;
> -	u64 filter_mask;
> -	u32 filter_default_val;
>   	const char *name_pattern;
>   	enum nv_cspmu_name_fmt name_fmt;
> -	struct attribute **event_attr;
> -	struct attribute **format_attr;
> +	struct nv_cspmu_ctx template_ctx;
> +	struct arm_cspmu_impl_ops ops;
>   };
>   
>   static const struct nv_cspmu_match nv_cspmu_match[] = {
>   	{
>   	  .prodid = 0x10300000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
> -	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_pcie_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = pcie_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = pcie_pmu_format_attrs,
> +		.filter_mask = NV_PCIE_FILTER_ID_MASK,
> +		.filter_default_val = NV_PCIE_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x10400000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> -	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = nvlink_c2c_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = nvlink_c2c_pmu_format_attrs,
> +		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x10500000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> -	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = nvlink_c2c_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = nvlink_c2c_pmu_format_attrs,
> +		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x10600000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
> -	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_cnvlink_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> -	  .format_attr = cnvlink_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = mcf_pmu_event_attrs,
> +		.format_attr = cnvlink_pmu_format_attrs,
> +		.filter_mask = NV_CNVL_FILTER_ID_MASK,
> +		.filter_default_val = NV_CNVL_FILTER_ID_MASK,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0x2CF00000,
>   	  .prodid_mask = NV_PRODID_MASK,
> -	  .filter_mask = 0x0,
> -	  .filter_default_val = 0x0,
>   	  .name_pattern = "nvidia_scf_pmu_%u",
>   	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = scf_pmu_event_attrs,
> -	  .format_attr = scf_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = scf_pmu_event_attrs,
> +		.format_attr = scf_pmu_format_attrs,
> +		.filter_mask = 0x0,
> +		.filter_default_val = 0x0,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = NULL,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   	{
>   	  .prodid = 0,
>   	  .prodid_mask = 0,
> -	  .filter_mask = NV_GENERIC_FILTER_ID_MASK,
> -	  .filter_default_val = NV_GENERIC_FILTER_ID_MASK,
>   	  .name_pattern = "nvidia_uncore_pmu_%u",
>   	  .name_fmt = NAME_FMT_GENERIC,
> -	  .event_attr = generic_pmu_event_attrs,
> -	  .format_attr = generic_pmu_format_attrs
> +	  .template_ctx = {
> +		.event_attr = generic_pmu_event_attrs,
> +		.format_attr = generic_pmu_format_attrs,
> +		.filter_mask = NV_GENERIC_FILTER_ID_MASK,
> +		.filter_default_val = NV_GENERIC_FILTER_ID_MASK,
> +		.filter2_mask = NV_GENERIC_FILTER_ID_MASK,
> +		.filter2_default_val = NV_GENERIC_FILTER_ID_MASK,
> +		.get_filter = nv_cspmu_event_filter,
> +		.get_filter2 = nv_cspmu_event_filter2,
> +		.data = NULL,
> +		.init_data = NULL
> +	  },
>   	},
>   };
>   
> @@ -310,6 +391,14 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
>   	return name;
>   }
>   
> +#define SET_OP(name, impl, match, default_op) \
> +	do { \
> +		if (match->ops.name) \
> +			impl->name = match->ops.name; \
> +		else if (default_op != NULL) \
> +			impl->name = default_op; \
> +	} while (false)
> +
>   static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
>   {
>   	struct nv_cspmu_ctx *ctx;
> @@ -330,20 +419,21 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
>   			break;
>   	}
>   
> -	ctx->name		= nv_cspmu_format_name(cspmu, match);
> -	ctx->filter_mask	= match->filter_mask;
> -	ctx->filter_default_val = match->filter_default_val;
> -	ctx->event_attr		= match->event_attr;
> -	ctx->format_attr	= match->format_attr;
> +	/* Initialize the context with the matched template. */
> +	memcpy(ctx, &match->template_ctx, sizeof(struct nv_cspmu_ctx));
> +	ctx->name = nv_cspmu_format_name(cspmu, match);
>   
>   	cspmu->impl.ctx = ctx;
>   
>   	/* NVIDIA specific callbacks. */
> -	impl_ops->set_cc_filter			= nv_cspmu_set_cc_filter;
> -	impl_ops->set_ev_filter			= nv_cspmu_set_ev_filter;
> -	impl_ops->get_event_attrs		= nv_cspmu_get_event_attrs;
> -	impl_ops->get_format_attrs		= nv_cspmu_get_format_attrs;
> -	impl_ops->get_name			= nv_cspmu_get_name;
> +	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
> +	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
> +	SET_OP(get_event_attrs, impl_ops, match, nv_cspmu_get_event_attrs);
> +	SET_OP(get_format_attrs, impl_ops, match, nv_cspmu_get_format_attrs);
> +	SET_OP(get_name, impl_ops, match, nv_cspmu_get_name);
> +
> +	if (ctx->init_data)
> +		return ctx->init_data(cspmu);
>   
>   	return 0;
>   }

