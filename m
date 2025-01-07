Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B37E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EYC0T76ByQZcJbAbKWoZkjglkyUuah6iWq4ib5v/LA=; b=tnnkQ3UO4gHb8OhMYllu/OCd9c
	YPno2uQvi+XMQOipTuPPGTMmPov7Fr5lzWG/6gsuun0qJ2z69aTq1WS/pLDiEarYKk1FaJw5bsGjj
	uCa7XentzSyYiqeb4EsIG+HzsT3CYXo18dmPwaR9ce4+7yDDG1aTt639o7sQRBdcpxIl3W8gjK//s
	jxIXsmyAsa1yStjJSU/KxYurN8NrEVI63xTGxLHsqmukhurl/ahk9YXm7924Udvr5GttkwUq1b2Cs
	DPE5QBS2HfYNu0v76OLXi7meRxBz+HZ64xkNHmoBjuCajafjvCsp75h2/rhfYOMHolabRCq+wB1Oy
	+OGy+90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDiB-00000005ujq-3W5T;
	Tue, 07 Jan 2025 17:49:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDYd-00000005tOK-0GV0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63F7FA41B1F;
	Tue,  7 Jan 2025 17:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8E2C4CED6;
	Tue,  7 Jan 2025 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736271597;
	bh=bC0Vjd7rRZHPln6p604z6wqdtBBsP1GgN3w/1l4oKoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqyVLnXjjRsPz9sT60cqkyLe+0aJppf2xeVF2/aVlPTMNpSIhwmUZ/l2TpHI7LM9b
	 m0IeLxWD7yTzJZmPzOPOR2jT3O3QwhxAqapmFHtVHW0QRx71zyV7TgDSXtRpTiWqIV
	 eXAFymlyfpJe5JQ33ms2SwdjgVGfTKrlF4QgEsbLGCz1bDVH4OkBZ5ZxiCwazuIaiE
	 QtOejTF/pF7IOJQTDk3NMh548h/uYHrRrosK7Ntd+anHvU2HON2QGBZDm5XkahhfVx
	 FpeU36MT4cbyVKbCVCIRdzpd96w+CxYVgRGwZylpK7TFypf9JpjGtoyKhvTu42qteE
	 GK3qykviouzAA==
Date: Tue, 7 Jan 2025 17:39:51 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
	irogers@google.com, yeoreum.yun@arm.com, mark.rutland@arm.com,
	robh@kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 1/5] perf: arm_spe: Add format option for discard mode
Message-ID: <20250107173950.GA8111@willie-the-truck>
References: <20241224104414.179365-1-james.clark@linaro.org>
 <20241224104414.179365-2-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224104414.179365-2-james.clark@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_093959_232419_03636509 
X-CRM114-Status: GOOD (  22.12  )
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

On Tue, Dec 24, 2024 at 10:44:08AM +0000, James Clark wrote:
> FEAT_SPEv1p2 (optional from Armv8.6) adds a discard mode that allows all
> SPE data to be discarded rather than written to memory. Add a format
> bit for this mode.
> 
> If the mode isn't supported, the format bit isn't published and attempts
> to use it will result in -EOPNOTSUPP. Allocating an aux buffer is still
> allowed even though it won't be written to so that old tools continue to
> work, but updated tools can choose to skip this step.
> 
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/perf/arm_spe_pmu.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index fd5b78732603..9aaf3f98e6f5 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -193,6 +193,9 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>  #define ATTR_CFG_FLD_store_filter_CFG		config	/* PMSFCR_EL1.ST */
>  #define ATTR_CFG_FLD_store_filter_LO		34
>  #define ATTR_CFG_FLD_store_filter_HI		34
> +#define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
> +#define ATTR_CFG_FLD_discard_LO			35
> +#define ATTR_CFG_FLD_discard_HI			35
>  
>  #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
>  #define ATTR_CFG_FLD_event_filter_LO		0
> @@ -216,6 +219,7 @@ GEN_PMU_FORMAT_ATTR(store_filter);
>  GEN_PMU_FORMAT_ATTR(event_filter);
>  GEN_PMU_FORMAT_ATTR(inv_event_filter);
>  GEN_PMU_FORMAT_ATTR(min_latency);
> +GEN_PMU_FORMAT_ATTR(discard);
>  
>  static struct attribute *arm_spe_pmu_formats_attr[] = {
>  	&format_attr_ts_enable.attr,
> @@ -228,9 +232,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>  	&format_attr_event_filter.attr,
>  	&format_attr_inv_event_filter.attr,
>  	&format_attr_min_latency.attr,
> +	&format_attr_discard.attr,
>  	NULL,
>  };
>  
> +static bool discard_unsupported(struct arm_spe_pmu *spe_pmu)
> +{
> +	return spe_pmu->pmsver < ID_AA64DFR0_EL1_PMSVer_V1P2;
> +}

Why not add a new SPE_PMU_FEAT_* for this and handle it in a similar
way to other optional hardware features?

Will

