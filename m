Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKGuvLmFhYoUNTuE2UQ9wRQ1NFuhx69a4NkUpM61zXE=; b=c+pn2EPMAiVqNrKnKf4LQ3FA1z
	2QyJhZ+vY4Tz/Nzy0FJO9nq0MPUYHrDPEpFyu5zHhzEl3kP5BcArJkKWrGn0nNWtOW7LpuEI68EvL
	SCkALjrq+geXzw2G+kfuE04KDhjQN/gyeAP5uGdNFmgLsXZ75A1O0EuEiGqs4naEM/xqd302BNZ/I
	PwIxHpIuXc5RbvMgh96nTA0ML6azw9MnbNe64VXvU1LmWh1A87zGXqbWpFEISFQx17koZIxvGwFqz
	bOiqL8Vab1BrXgEvjkdduWf56a+VdgWsLpdrORyTR9DzzEg93FBIvJg1az4nP8tmLdPuCjoawQbTa
	tLRtkN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticXE-0000000ButR-3dYV;
	Thu, 13 Feb 2025 16:57:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibtB-0000000Biv4-2UxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:16:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1A4926B9;
	Thu, 13 Feb 2025 08:16:53 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C902C3F762;
	Thu, 13 Feb 2025 08:16:32 -0800 (PST)
Date: Thu, 13 Feb 2025 16:16:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
Message-ID: <20250213161628.GF235556@e132581.arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_081633_721993_A40984C2 
X-CRM114-Status: GOOD (  25.46  )
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

On Sun, Feb 02, 2025 at 06:43:05PM -0600, Rob Herring (Arm) wrote:

[...]

> +void brbe_enable(const struct arm_pmu *arm_pmu)
> +{
> +       struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
> +       u64 brbfcr = 0, brbcr = 0;
> +
> +       /*
> +        * Merge the permitted branch filters of all events.
> +        */
> +       for (int i = 0; i < ARMPMU_MAX_HWEVENTS; i++) {
> +               struct perf_event *event = cpuc->events[i];
> +
> +               if (event && has_branch_stack(event)) {
> +                       brbfcr |= event->hw.branch_reg.config;
> +                       brbcr |= event->hw.extra_reg.config;
> +               }
> +       }
> +
> +       /*
> +        * If the record buffer contains any branches, we've already read them
> +        * out and don't want to read them again.
> +        * No need to sync as we're already stopped.
> +        */
> +       brbe_invalidate_nosync();
> +       isb(); // Make sure invalidate takes effect before enabling
> +
> +       /*
> +        * In VHE mode with MDCR_EL2.HPMN set to PMCR_EL0.N, the counters are
> +        * controlled by BRBCR_EL1 rather than BRBCR_EL2 (which writes to
> +        * BRBCR_EL1 are redirected to). Use the same value for both register
> +        * except keep EL1 and EL0 recording disabled in guests.
> +        */
> +       if (is_kernel_in_hyp_mode())
> +               write_sysreg_s(brbcr & ~(BRBCR_ELx_ExBRE | BRBCR_ELx_E0BRE), SYS_BRBCR_EL12);
> +       write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> +       isb(); // Ensure BRBCR_ELx settings take effect before unpausing
> +
> +       write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);

Seems to me, it is weird that first enable recording (BRBCR), then set
control register BRBFCR.  And the writing SYS_BRBFCR_EL1 not guarded
by a barrier is also a bit concerned.

> +}
> +
> +void brbe_disable(void)
> +{
> +       /*
> +        * No need for synchronization here as synchronization in PMCR write
> +        * ensures ordering and in the interrupt handler this is a NOP as
> +        * we're already paused.
> +        */
> +       write_sysreg_s(BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);

Maybe the Arm ARM causes the confusion for the description of the
PAUSED bit, I read it as this bit is a status bit to indicate
branch recording is paused.

> +}
> +
> +static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
> +       [BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },
> +       [BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
> +       [BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
> +       [BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
> +       [BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
> +       [BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
> +       [BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
> +       [BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
> +       [BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },

I saw this table cannot reflect the complete branch type.  We might
need to consider to extend the perf branch flags later.

If the 'new_type' is always zero, it is not necessary to maintain a
array with two items (the second one is always 0).

> +};
> +
> +static void brbe_set_perf_entry_type(struct perf_branch_entry *entry, u64 brbinf)
> +{
> +       int brbe_type = brbinf_get_type(brbinf);
> +
> +       if (brbe_type <= BRBINFx_EL1_TYPE_DEBUG_EXIT) {
> +               const int *br_type = brbe_type_to_perf_type_map[brbe_type];
> +
> +               entry->type = br_type[0];
> +               entry->new_type = br_type[1];
> +       }
> +}
> +
> +static int brbinf_get_perf_priv(u64 brbinf)
> +{
> +       int brbe_el = brbinf_get_el(brbinf);
> +
> +       switch (brbe_el) {
> +       case BRBINFx_EL1_EL_EL0:
> +               return PERF_BR_PRIV_USER;
> +       case BRBINFx_EL1_EL_EL1:
> +               return PERF_BR_PRIV_KERNEL;
> +       case BRBINFx_EL1_EL_EL2:
> +               if (is_kernel_in_hyp_mode())
> +                       return PERF_BR_PRIV_KERNEL;
> +               return PERF_BR_PRIV_HV;
> +       default:
> +               pr_warn_once("%d - unknown branch privilege captured\n", brbe_el);
> +               return PERF_BR_PRIV_UNKNOWN;
> +       }
> +}
> +
> +static void capture_brbe_flags(struct perf_branch_entry *entry,
> +                              const struct perf_event *event,
> +                              u64 brbinf)
> +{
> +       brbe_set_perf_entry_type(entry, brbinf);
> +
> +       if (!branch_sample_no_cycles(event))
> +               entry->cycles = brbinf_get_cycles(brbinf);
> +
> +       if (!branch_sample_no_flags(event)) {
> +               /* Mispredict info is available for source only and complete branch records. */
> +               if (!brbe_record_is_target_only(brbinf)) {
> +                       entry->mispred = brbinf_get_mispredict(brbinf);
> +                       entry->predicted = !entry->mispred;
> +               }
> +
> +               /*
> +                * Currently TME feature is neither implemented in any hardware
> +                * nor it is being supported in the kernel. Just warn here once
> +                * if TME related information shows up rather unexpectedly.
> +                */
> +               if (brbinf_get_lastfailed(brbinf) || brbinf_get_in_tx(brbinf))
> +                       pr_warn_once("Unknown transaction states\n");

If the branch is in transaction, we can set:

  entry->in_tx = 1;

> +       }
> +
> +       /*
> +        * Branch privilege level is available for target only and complete
> +        * branch records.
> +        */
> +       if (!brbe_record_is_source_only(brbinf))
> +               entry->priv = brbinf_get_perf_priv(brbinf);

This logic is not quite right.  In theory, if we check with above
condition (!brbe_record_is_source_only(brbinf)), it might be the
case both source and target are not valid.

Thanks,
Leo

