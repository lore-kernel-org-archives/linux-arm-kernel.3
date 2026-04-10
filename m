Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F37F45A0A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 19:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v670NnsoxWlKUTr3940NLyOr/jOTuRUMEsStTql9OHc=; b=b2xZV32OfiaTP1hMMO5dIskMai
	Mmi9y66Bgpk/tdcuTGHcUxgRFA0vTjWOH/AX8ohZSzqLwt/b0eJSr2bk7qeBVzAmb7QB2hiimTkGH
	fu29ciAy39EUUwtTSVwZaLNIjYqiLxx7Ut0K9dWpkKoH+DIRPe2YdTBJv6KaJC7BoLNJMdZFaA6gF
	OFhn+s8QUB+oWZgjAJNfH5Z80RhJGAc8XkPvtps5bUS40tpZYlGS3QOxaVTMTa+BiARwnwRwTySUJ
	qzKUxJx0DY9/y5/AGTQv3BKdjfE1WIZWo5kweOYluXqU7zlIX6rQVpcX6McrfL48BHxpsDy8TASkU
	w5y6lSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHRb-0000000CizI-3QQi;
	Fri, 10 Apr 2026 19:23:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHRY-0000000CiyW-3BAE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 19:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E629F43EFF;
	Fri, 10 Apr 2026 19:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915C6C19421;
	Fri, 10 Apr 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775848982;
	bh=ozrCrYL6e8byQP619l02L+9+JeBh8zbhRwIZwZNxBxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJW01JoGdfEqKvhw96/n96uGQBJjM+TK1VwRzstxRz0C5buUJ0Ek+9G559kbDB7OD
	 xLeXEU2fWyNXvla5DmDzX8iCN5v9hbrgOhQyknY5nTWdC/CYPPiSMBPOvxNhf1An6/
	 aK9Vo5QCAbRqQc4f5I1UnG5SFBWAnQ6MydOIamJvD2R2AECraH/KTdZb46g/BgNlpc
	 KNBCLG0NEcTPtEW6tJrS+z6YbBORm3XbfOWT8eYgjifPMZPtiGqg3iE3hc5q95Ti2g
	 7KdHY0jQOebzY5535WIQYkMH1rliJFS+PMn4RhFAqZPBcVPYKzrf0SYBYcukQqk81f
	 sVfKr+/DC/qcA==
Date: Fri, 10 Apr 2026 14:23:00 -0500
From: Rob Herring <robh@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/4] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <20260410192300.GA1050337-robh@kernel.org>
References: <20260318171706.2840512-1-puranjay@kernel.org>
 <20260318171706.2840512-4-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318171706.2840512-4-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_122304_840572_4AD12D6E 
X-CRM114-Status: GOOD (  39.37  )
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

On Wed, Mar 18, 2026 at 10:16:57AM -0700, Puranjay Mohan wrote:
> Enable the bpf_get_branch_snapshot() BPF helper on ARM64 by implementing
> the perf_snapshot_branch_stack static call for ARM's Branch Record Buffer
> Extension (BRBE).
> 
> The BPF helper bpf_get_branch_snapshot() allows BPF programs to capture
> hardware branch records on-demand. This was previously only available on
> x86 (Intel LBR) but not on ARM64 despite BRBE being available since
> ARMv9.
> 
> BRBE is paused before disabling interrupts because local_irq_save() can
> trigger trace_hardirqs_off() which performs stack walking and pollutes
> the branch buffer. The sysreg read/write and ISB used to pause BRBE are
> branchless, so pausing first avoids this pollution.
> 
> All exceptions are masked after pausing BRBE using local_daif_save() to
> prevent pseudo-NMI from PMU counter overflow from interfering with the
> snapshot read. A PMU overflow arriving between the pause and
> local_daif_save() can re-enable BRBE via the interrupt handler; the
> snapshot detects this by re-checking BRBFCR_EL1.PAUSED and bailing out.
> 
> Branch records are read using the existing perf_entry_from_brbe_regset()
> helper with a NULL event pointer, which bypasses event-specific filtering
> and captures all recorded branches. The BPF program is responsible for
> filtering entries based on its own criteria. The BRBE buffer is
> invalidated after reading to maintain contiguity for other consumers.
> 
> On heterogeneous big.LITTLE systems, only some CPUs may implement
> FEAT_BRBE. The perf_snapshot_branch_stack static call is system-wide, so
> a per-CPU brbe_active flag is used to prevent BRBE sysreg access on CPUs
> that do not implement FEAT_BRBE, where such access would be UNDEFINED.

Is this something you've seen? IIRC, the existing assumption is all CPUs 
have FEAT_BRBE or that perf has been limited to those CPUs. It is 
allowed that the number of records can vary.

> 
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  drivers/perf/arm_brbe.c  | 79 +++++++++++++++++++++++++++++++++++++++-
>  drivers/perf/arm_brbe.h  |  9 +++++
>  drivers/perf/arm_pmuv3.c |  5 ++-
>  3 files changed, 90 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> index ba554e0c846c..527c2d5ebba6 100644
> --- a/drivers/perf/arm_brbe.c
> +++ b/drivers/perf/arm_brbe.c
> @@ -8,9 +8,13 @@
>   */
>  #include <linux/types.h>
>  #include <linux/bitmap.h>
> +#include <linux/percpu.h>
>  #include <linux/perf/arm_pmu.h>
> +#include <asm/daifflags.h>
>  #include "arm_brbe.h"
>  
> +static DEFINE_PER_CPU(bool, brbe_active);
> +
>  #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
>  				   BRBFCR_EL1_INDIRECT | \
>  				   BRBFCR_EL1_RTN      | \
> @@ -533,6 +537,8 @@ void brbe_enable(const struct arm_pmu *arm_pmu)
>  	/* Finally write SYS_BRBFCR_EL to unpause BRBE */
>  	write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
>  	/* Synchronization in PMCR write ensures ordering WRT PMU enabling */
> +
> +	this_cpu_write(brbe_active, true);
>  }
>  
>  void brbe_disable(void)
> @@ -544,6 +550,7 @@ void brbe_disable(void)
>  	 */
>  	write_sysreg_s(BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
>  	write_sysreg_s(0, SYS_BRBCR_EL1);
> +	this_cpu_write(brbe_active, false);
>  }
>  
>  static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
> @@ -618,10 +625,10 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
>  
>  	brbe_set_perf_entry_type(entry, brbinf);
>  
> -	if (!branch_sample_no_cycles(event))
> +	if (!event || !branch_sample_no_cycles(event))
>  		entry->cycles = brbinf_get_cycles(brbinf);
>  
> -	if (!branch_sample_no_flags(event)) {
> +	if (!event || !branch_sample_no_flags(event)) {
>  		/* Mispredict info is available for source only and complete branch records. */
>  		if (!brbe_record_is_target_only(brbinf)) {
>  			entry->mispred = brbinf_get_mispredict(brbinf);
> @@ -803,3 +810,71 @@ void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
>  done:
>  	branch_stack->nr = nr_filtered;
>  }
> +
> +/*
> + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> + * self-recording and return 0 if the snapshot state appears disturbed.
> + */
> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
> +{
> +	unsigned long flags;
> +	int nr_hw, nr_banks, nr_copied = 0;
> +	u64 brbidr, brbfcr, brbcr;
> +
> +	if (!cnt || !__this_cpu_read(brbe_active))
> +		return 0;
> +
> +	/* Pause BRBE first to avoid recording our own branches. */
> +	brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
> +	brbcr = read_sysreg_s(SYS_BRBCR_EL1);
> +	write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> +	isb();

Is there something that guarantees BRBE is enabled when you enter this 
function and that it is not disabled in this window? A context switch 
could disable it unless it's a global event for example.

> +
> +	/* Block local exception delivery while reading the buffer. */
> +	flags = local_daif_save();
> +
> +	/*
> +	 * A PMU overflow before local_daif_save() could have re-enabled
> +	 * BRBE, clearing the PAUSED bit. The overflow handler already
> +	 * restored BRBE to its correct state, so just bail out.
> +	 */
> +	if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED)) {
> +		local_daif_restore(flags);
> +		return 0;
> +	}
> +
> +	brbidr = read_sysreg_s(SYS_BRBIDR0_EL1);
> +	if (!valid_brbidr(brbidr))

This is not possibly true if brbe_active is true. If BRBIDR is not 
valid, then we would have rejected any event requesting branch stack.

> +		goto out;
> +
> +	nr_hw = FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr);
> +	nr_banks = DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> +
> +	for (int bank = 0; bank < nr_banks; bank++) {
> +		int nr_remaining = nr_hw - (bank * BRBE_BANK_MAX_ENTRIES);
> +		int nr_this_bank = min(nr_remaining, BRBE_BANK_MAX_ENTRIES);
> +
> +		select_brbe_bank(bank);
> +
> +		for (int i = 0; i < nr_this_bank; i++) {

I don't love all this being duplicated. Perhaps an iterator would help 
here (and the other copy):

static void next_slot(int *bank, int *bank_idx, int nr_hw)
{
	*bank_idx++;
	if (*bank_idx + (*bank * BRBE_BANK_MAX_ENTRIES) == nr_hw)
		bank = BRBE_MAX_BANKS;
	else if ((*bank_idx % BRBE_BANK_MAX_ENTRIES) == 0) {
		*bank_idx = 0;
		select_brbe_bank(++(*bank));
	}
	
} 

#define for_each_bank_slot(i, nr_hw) \
for (int bank = 0, int i = 0; bank < BRBE_MAX_BANKS; next_slot(&bank, 
&i))

Then here you just have:

for_each_bank_slot(i, FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr)) {
	...
}

Feel free to come up with better naming. :)

> +			if (nr_copied >= cnt)
> +				goto done;
> +
> +			if (!perf_entry_from_brbe_regset(i, &entries[nr_copied], NULL))
> +				goto done;
> +
> +			nr_copied++;
> +		}
> +	}
> +
> +done:
> +	brbe_invalidate();
> +out:
> +	/* Restore BRBCR before unpausing via BRBFCR, matching brbe_enable(). */
> +	write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> +	isb();
> +	write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> +	local_daif_restore(flags);
> +
> +	return nr_copied;
> +}

