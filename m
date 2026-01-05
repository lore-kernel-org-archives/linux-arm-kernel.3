Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A8CC79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDFBiuQZN+R3SxapjpkGdnWygKtiITQyh9n3Fj4goiM=; b=jc2CAEFukUEU+u25BJuQd7NQLu
	ilAxY22HuQxC85T3NdzPtfknOeSvHbY+QncKpah63lxXkHxRkRPOpLMihNQeCJhKI/fO1JOciG6Gm
	SgZacdX//aPlxRkawig2rmMl/myyAOL57KW3XXpDzPTrbxpI8rw49jwgfPoElerM/rrD25lQlWmO8
	itw0Dw+VzQoFKxmXPSMVopjIK4O7uXbdDiRlpU9TX077g9+bLVI+wYl9V+XgrwWuPrcG/whh+/u+b
	iAuBTnRYqkc5JJqI6BFGGhD5iSkKx1oUZP2p9YK+eeBembBUlH9eUBE91v86fl9Mxuh/7RfEKQ2BW
	P7dPcJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcohw-0000000Bs2t-2tyh;
	Mon, 05 Jan 2026 17:49:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcohu-0000000Bs2J-0np2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:49:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 706F9339;
	Mon,  5 Jan 2026 09:49:20 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 926AF3F5A1;
	Mon,  5 Jan 2026 09:49:24 -0800 (PST)
Date: Mon, 5 Jan 2026 17:49:18 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC PATCH] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <aVv5nq5QTVDOz1Zk@J2N7QTR9R3>
References: <20260102214043.1410242-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102214043.1410242-1-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_094930_308961_30128845 
X-CRM114-Status: GOOD (  41.64  )
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

Hi Puranjay,

I have a number of techincal concerns with this, noted below. At a high
level, I don't think this makes sense without a better description of
the usage, and I suspect we'd need changes to bpf_get_branch_snapshot()
to be able to implement something useful.

On Fri, Jan 02, 2026 at 01:40:41PM -0800, Puranjay Mohan wrote:
> Enable the bpf_get_branch_snapshot() BPF helper on ARM64 by implementing
> the perf_snapshot_branch_stack static call for ARM's Branch Record
> Buffer Extension (BRBE).
> 
> The BPF helper bpf_get_branch_snapshot() allows BPF programs to capture
> hardware branch records on-demand. This was previously only available on
> x86 (Intel LBR, AMD BRS) but not on ARM64 despite BRBE being available
> since ARMv9.

When exactly can bpf_get_branch_snapshot() be called?

How is it expected to be used?

The driver is written on the expectation that BRBE records are only read
in the PMUv3 overflow handler.

> This implementation:
> 
> - Follows the x86 snapshot pattern (intel_pmu_snapshot_branch_stack)
> - Performs atomic snapshot by pausing BRBE, reading records, and
>   restoring previous state without disrupting ongoing perf events

If BRBE is stopped, then we lost contiguity of branch records (e.g. for
a series of branches A->B->C->D->E, we could record A->B->D->E). The
driver is intended to ensure contiguity of those records, and if that's
lost, we deliberately discard. That's why brbe_enable() calls
brbe_invalidate().

Restarting BRBE without discarding will produce bogus data for other
consumers. If BRBE is stopped, we *must* discard.

> - Reads branch records directly from BRBE registers without
>   event-specific filtering to minimize branch pollution

If BRBE is paused, there's no polution, so this rationale doesn't make
sense to me.

BRBE can be configured with various filters (specific to the event),
multiple events with distinct filters can be active simultaneously, and
if no branch-sampling events are active, BRBE won't record anything. I
do not think it makes sense to record whatever happens to be present,
without filtering. Regardless, BRBE won't be recording if you don't have
events. so this doesn't seem to make sense.

> - Handles all BRBE record types (complete, source-only, target-only)
> - Complies with ARM ARM synchronization requirements (ISB barriers per
>   rule PPBZP)
> - Reuses existing BRBE infrastructure (select_brbe_bank,
>   __read_brbe_regset, brbe_set_perf_entry_type, etc.)

This duplicates other code (e.g. the body of
brbe_read_filtered_entries()), and I don't think this is justified.

> 
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
> 
> This patch is only compile tested as I don't have access to hardware with BRBE.
> 
> ---
>  drivers/perf/arm_brbe.c  | 95 ++++++++++++++++++++++++++++++++++++++++
>  drivers/perf/arm_brbe.h  |  9 ++++
>  drivers/perf/arm_pmuv3.c |  5 ++-
>  3 files changed, 108 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> index ba554e0c846c..cda7bf522c06 100644
> --- a/drivers/perf/arm_brbe.c
> +++ b/drivers/perf/arm_brbe.c
> @@ -803,3 +803,98 @@ void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
>  done:
>  	branch_stack->nr = nr_filtered;
>  }
> +
> +/*
> + * ARM-specific callback invoked through perf_snapshot_branch_stack static
> + * call, defined in include/linux/perf_event.h. See its definition for API
> + * details. It's up to caller to provide enough space in *entries* to fit all
> + * branch records, otherwise returned result will be truncated to *cnt* entries.
> + *
> + * This is similar to brbe_read_filtered_entries but optimized for snapshot mode:
> + * - No filtering based on event attributes (captures everything)
> + * - Minimal branches to avoid polluting the branch buffer
> + * - Direct register reads without event-specific processing
> + */

As above I don't think these differences are necessary nor do I think we
should be duplicating this.

> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
> +{
> +	unsigned long flags;
> +	int nr_hw, nr_banks, nr_copied = 0;
> +	u64 brbidr, brbfcr, brbcr;
> +
> +	/*
> +	 * The sequence of steps to freeze BRBE should be completely inlined
> +	 * and contain no branches to minimize contamination of branch snapshot.
> +	 */
> +	local_irq_save(flags);

The PMU overflow interrupt can be delivered as a pNMI, so this can race
with that. Disabling interrupts is not sufficient.

If this is only called within a perf event overflow handler, then we
already have the necessary serialization.

> +
> +	/* Save current BRBE configuration */
> +	brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
> +	brbcr = read_sysreg_s(SYS_BRBCR_EL1);
> +
> +	/* Pause BRBE to freeze the buffer */
> +	write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> +	isb();
> +
> +	/* Read BRBIDR to determine number of records */
> +	brbidr = read_sysreg_s(SYS_BRBIDR0_EL1);
> +	if (!valid_brbidr(brbidr))
> +		goto out_restore;
> +
> +	nr_hw = FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr);
> +	nr_banks = DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> +
> +	/* Read branch records from BRBE banks */
> +	for (int bank = 0; bank < nr_banks; bank++) {
> +		int nr_remaining = nr_hw - (bank * BRBE_BANK_MAX_ENTRIES);
> +		int nr_this_bank = min(nr_remaining, BRBE_BANK_MAX_ENTRIES);
> +
> +		select_brbe_bank(bank);
> +
> +		for (int i = 0; i < nr_this_bank; i++) {
> +			struct brbe_regset bregs;
> +			struct perf_branch_entry *entry;
> +
> +			if (nr_copied >= cnt)
> +				goto out_restore;
> +
> +			if (!__read_brbe_regset(&bregs, i))
> +				goto out_restore;
> +
> +			entry = &entries[nr_copied];
> +			perf_clear_branch_entry_bitfields(entry);
> +
> +			/* Simple conversion without filtering */
> +			if (brbe_record_is_complete(bregs.brbinf)) {
> +				entry->from = bregs.brbsrc;
> +				entry->to = bregs.brbtgt;
> +			} else if (brbe_record_is_source_only(bregs.brbinf)) {
> +				entry->from = bregs.brbsrc;
> +				entry->to = 0;
> +			} else if (brbe_record_is_target_only(bregs.brbinf)) {
> +				entry->from = 0;
> +				entry->to = bregs.brbtgt;
> +			}
> +
> +			brbe_set_perf_entry_type(entry, bregs.brbinf);
> +			entry->cycles = brbinf_get_cycles(bregs.brbinf);
> +
> +			if (!brbe_record_is_target_only(bregs.brbinf)) {
> +				entry->mispred = brbinf_get_mispredict(bregs.brbinf);
> +				entry->predicted = !entry->mispred;
> +			}
> +
> +			if (!brbe_record_is_source_only(bregs.brbinf))
> +				entry->priv = brbinf_get_perf_priv(bregs.brbinf);
> +
> +			nr_copied++;
> +		}
> +	}
> +
> +out_restore:
> +	/* Restore BRBE to its previous state */
> +	write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> +	isb();
> +	write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> +	local_irq_restore(flags);
> +	return nr_copied;
> +}

As above, this is duplicating a lot of logic we already have. If we
really need this function, we should be sharing much more logic with
brbe_read_filtered_entries(), if not using that directly.

Mark.

> diff --git a/drivers/perf/arm_brbe.h b/drivers/perf/arm_brbe.h
> index b7c7d8796c86..c2a1824437fb 100644
> --- a/drivers/perf/arm_brbe.h
> +++ b/drivers/perf/arm_brbe.h
> @@ -10,6 +10,7 @@
>  struct arm_pmu;
>  struct perf_branch_stack;
>  struct perf_event;
> +struct perf_branch_entry;
>  
>  #ifdef CONFIG_ARM64_BRBE
>  void brbe_probe(struct arm_pmu *arm_pmu);
> @@ -22,6 +23,8 @@ void brbe_disable(void);
>  bool brbe_branch_attr_valid(struct perf_event *event);
>  void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
>  				const struct perf_event *event);
> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries,
> +				   unsigned int cnt);
>  #else
>  static inline void brbe_probe(struct arm_pmu *arm_pmu) { }
>  static inline unsigned int brbe_num_branch_records(const struct arm_pmu *armpmu)
> @@ -44,4 +47,10 @@ static void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
>  				       const struct perf_event *event)
>  {
>  }
> +
> +static inline int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries,
> +						 unsigned int cnt)
> +{
> +	return 0;
> +}
>  #endif
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..1a9f129a0f94 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1449,8 +1449,11 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu, char *name,
>  	cpu_pmu->set_event_filter	= armv8pmu_set_event_filter;
>  
>  	cpu_pmu->pmu.event_idx		= armv8pmu_user_event_idx;
> -	if (brbe_num_branch_records(cpu_pmu))
> +	if (brbe_num_branch_records(cpu_pmu)) {
>  		cpu_pmu->pmu.sched_task		= armv8pmu_sched_task;
> +		static_call_update(perf_snapshot_branch_stack,
> +				   arm_brbe_snapshot_branch_stack);
> +	}
>  
>  	cpu_pmu->name			= name;
>  	cpu_pmu->map_event		= map_event;
> 
> base-commit: c286e7e9d1f1f3d90ad11c37e896f582b02d19c4
> -- 
> 2.47.3
> 

