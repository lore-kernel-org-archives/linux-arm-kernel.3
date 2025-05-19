Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CCC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpvZsMRBltkzQjlyS/LUjDBjDPIq1VPZQgpjPnlDbIg=; b=d1CSEKV2D0c4hlfBtiaQH4b62L
	FoyK7Leu+qAfF8bm4ZkEIWlrM27GfukeU82aCHdk03ONIRx05SbH5DnQseTtaeHiQCQGMF9FDhBCm
	Xx6C2VChFsmYPxspvPigm24VViEb8lfGv8UNvTpGdUq6rICkG90LbfaU+AMZjBUPy2zq7gpwmYHPR
	OIEjo4ZghD+yiSyGxjmBhvo3pOknl2EGtVDKlrTXjrFzr7UgxbnNZYsp34p9l8ot/eYDJye9ViLkA
	DtZzDS0A4J4AYPlTzsyqWxGpradbcpnMIZ1zEIk55FFWy8UVEropcEhFqr/ezXZJ53RaN4zASLhU4
	jvDPziWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2u9-00000009hxn-2zAM;
	Mon, 19 May 2025 15:59:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH24T-00000009WjJ-1yMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A23155C4885;
	Mon, 19 May 2025 15:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFAFC4CEE9;
	Mon, 19 May 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667188;
	bh=NxCscuWDEk40ScYO6BS2xsUrg53DUDC+eeyYtmp5F9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyKlxc9JGfp8zqj+F7Qo0tV+o1iYgCctIO5AHaP9Js5pqYnaaldq2+b32dJmiapmM
	 OPgDd1FtR8UdhM/f6W10ClhUUlXzZ9qcG+iCOL9KYzyrg8kJXeML64MoOM0HRBci98
	 /K+O0amOXixJxEna0qr8KNl+0Gbx4wy9U1Rd5muimUpe5zJqAbA1R6rk15olRjM6rL
	 u2BVzsXM7XUUNpEnlA/GKgXUx0UcxbM+l6aOABY/JWXsZC8sEMX2q0+8ceuXjpMvtx
	 EkM0n9Feo1KtJIWu+foOa12t7SJgAlkLBeBas0qmM1S/iY98JYUUK3930sW+IatGGI
	 NJjuJvUsxg6xg==
Date: Mon, 19 May 2025 16:06:22 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
Message-ID: <20250519150621.GA17177@willie-the-truck>
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_080629_625906_C0486383 
X-CRM114-Status: GOOD (  31.38  )
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

Hey Rob,

On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> The ARMv9.2 architecture introduces the optional Branch Record Buffer
> Extension (BRBE), which records information about branches as they are
> executed into set of branch record registers. BRBE is similar to x86's
> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
> (BHRB).

Since you picked this up from v19, the driver has changed considerably
and I presume you will be continuing to extend it in future as the
architecture progresses. Perhaps having you listed as Author (and
crucially, in git blame :p) with Anshuman as a Co-developed-by: would be
more appropriate?

> ---
>  drivers/perf/Kconfig         |  11 +
>  drivers/perf/Makefile        |   1 +
>  drivers/perf/arm_brbe.c      | 802 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/perf/arm_brbe.h      |  47 +++
>  drivers/perf/arm_pmu.c       |  15 +-
>  drivers/perf/arm_pmuv3.c     | 129 ++++++-
>  include/linux/perf/arm_pmu.h |   8 +
>  7 files changed, 1006 insertions(+), 7 deletions(-)

Do you know if James Clark's tests [1] are going to be respun for the
perf tool? It would be handy to have some way to test this new
functionality.

> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 4e268de351c4..3be60ff4236d 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -223,6 +223,17 @@ config ARM_SPE_PMU
>  	  Extension, which provides periodic sampling of operations in
>  	  the CPU pipeline and reports this via the perf AUX interface.
>  
> +config ARM64_BRBE
> +	bool "Enable support for branch stack sampling using FEAT_BRBE"
> +	depends on ARM_PMUV3 && ARM64
> +	default y
> +	help
> +	  Enable perf support for Branch Record Buffer Extension (BRBE) which
> +	  records all branches taken in an execution path. This supports some
> +	  branch types and privilege based filtering. It captures additional
> +	  relevant information such as cycle count, misprediction and branch
> +	  type, branch privilege level etc.

It's a shame that this can't be modular, but I suppose the tight
integration with the CPU PMU driver precludes that. Oh well.

> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> new file mode 100644
> index 000000000000..2f254bd40af3
> --- /dev/null
> +++ b/drivers/perf/arm_brbe.c

(The driver code looks fine to me but I'd like an Ack from Mark on the
UAPI).

> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 2f33e69a8caf..df9867c0dc57 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -99,7 +99,7 @@ static const struct pmu_irq_ops percpu_pmunmi_ops = {
>  	.free_pmuirq = armpmu_free_percpu_pmunmi
>  };
>  
> -static DEFINE_PER_CPU(struct arm_pmu *, cpu_armpmu);
> +DEFINE_PER_CPU(struct arm_pmu *, cpu_armpmu);
>  static DEFINE_PER_CPU(int, cpu_irq);
>  static DEFINE_PER_CPU(const struct pmu_irq_ops *, cpu_irq_ops);
>  
> @@ -317,6 +317,11 @@ armpmu_del(struct perf_event *event, int flags)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  
> +	if (has_branch_stack(event)) {
> +		hw_events->branch_users--;
> +		perf_sched_cb_dec(event->pmu);
> +	}

Shouldn't we decrement this *after* calling armpmu_stop()?

> +
>  	armpmu_stop(event, PERF_EF_UPDATE);
>  	hw_events->events[idx] = NULL;
>  	armpmu->clear_event_idx(hw_events, event);

[...]

> +static int branch_records_alloc(struct arm_pmu *armpmu)
> +{
> +	struct perf_branch_stack *branch_stack_cpu;
> +	struct perf_branch_stack __percpu *branch_stack;
> +	size_t size = struct_size(branch_stack_cpu, entries, brbe_num_branch_records(armpmu));
> +	int cpu;
> +
> +	branch_stack = __alloc_percpu_gfp(size, __alignof__(*branch_stack_cpu),
> +					  GFP_KERNEL);
> +	if (!branch_stack)
> +		return -ENOMEM;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct pmu_hw_events *events_cpu;
> +
> +		events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
> +		branch_stack_cpu = per_cpu_ptr(branch_stack, cpu);
> +		events_cpu->branch_stack = branch_stack_cpu;
> +	}
> +	return 0;
>  }

How does this work in a heterogeneous system? Shouldn't we at least
scope the allocation to the CPUs associated with this PMU?

>  static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
> @@ -1255,7 +1367,15 @@ static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
>  	if (ret)
>  		return ret;
>  
> -	return probe.present ? 0 : -ENODEV;
> +	if (!probe.present)
> +		return -ENODEV;
> +
> +	if (brbe_num_branch_records(cpu_pmu)) {
> +		ret = branch_records_alloc(cpu_pmu);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
>  }
>  
>  static void armv8pmu_disable_user_access_ipi(void *unused)
> @@ -1314,6 +1434,7 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu, char *name,
>  	cpu_pmu->set_event_filter	= armv8pmu_set_event_filter;
>  
>  	cpu_pmu->pmu.event_idx		= armv8pmu_user_event_idx;
> +	cpu_pmu->pmu.sched_task		= armv8pmu_sched_task;

Can we avoid assigning this unless BRBE actually probed?

Will

[1] https://gitlab.arm.com/linux-arm/linux-jc/-/commit/3a7ddce70c2daadb63fcc511de0a89055ca48b32

