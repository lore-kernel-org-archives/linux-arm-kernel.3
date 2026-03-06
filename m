Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB0CF0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlP1eTpgZsQ+pjJnmluRsN5zeM1zUZ/40ysrIlgf3yI=; b=bYnEHP+ceRffBO8hfdQjaYNN++
	rvgXKOYscfUdcjMKZUrHZn+13V+SGPi7Bo4qW8itutlW8UYPuGCR1MunsTINlQlZAUqF41jo8oodV
	EjUvPHRB+hDiH7eIgVR5SaAc5TA4uecrvS3AA2Drfv6/JWHROaZqwC8HPoAXMnEyZhkL3lqnPPMG3
	lpFTLEhVtJwNxkyZYfRju1VqvMev7POwvydad7xMWmL6ZEJ5DCvrIarQjqdXIA6XM774VZNuZobhf
	GxLHPkNoOMgWvOuTGiyWs0iAGm8aCRrrgRdeGMQEM1zb+v2+/Wb0OqVyrWa+ze7YFPT+fNnYQSH54
	iAVPVPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTrD-00000003aca-3rzH;
	Fri, 06 Mar 2026 12:00:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTrB-00000003ac4-1In0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:00:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A71B1655;
	Fri,  6 Mar 2026 04:00:28 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B16D53F836;
	Fri,  6 Mar 2026 04:00:32 -0800 (PST)
Date: Fri, 6 Mar 2026 12:00:30 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <aarB3iv8963UDn5E@arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-4-catalin.marinas@arm.com>
 <aamT6-Mvr9nI1unq@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamT6-Mvr9nI1unq@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040037_441748_25A627B2 
X-CRM114-Status: GOOD (  38.18  )
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

On Thu, Mar 05, 2026 at 02:32:11PM +0000, Will Deacon wrote:
> On Mon, Mar 02, 2026 at 04:57:56PM +0000, Catalin Marinas wrote:
> > C1-Pro acknowledges DVMSync messages before completing the SME/CME
> > memory accesses. Work around this by issuing an IPI+DSB to the affected
> > CPUs if they are running in EL0 with SME enabled.
> 
> Just to make sure I understand the implications, but this _only_ applies
> to explicit memory accesses from the SME unit and not, for example, to
> page-table walks initiated by SME instructions?

Yes, only explicit accesses from the SME unit (CME).

> > @@ -575,6 +576,14 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
> >  };
> >  #endif
> >  
> > +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> > +static void cpu_enable_sme_dvmsync(const struct arm64_cpu_capabilities *__unused)
> > +{
> > +	if (this_cpu_has_cap(ARM64_WORKAROUND_SME_DVMSYNC))
> > +		sme_enable_dvmsync();
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_38
> >  static const struct midr_range erratum_ac03_cpu_38_list[] = {
> >  	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> > @@ -901,6 +910,16 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
> >  		.matches = need_arm_si_l1_workaround_4311569,
> >  	},
> >  #endif
> > +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> > +	{
> > +		.desc = "C1-Pro SME DVMSync early acknowledgement",
> > +		.capability = ARM64_WORKAROUND_SME_DVMSYNC,
> > +		.cpu_enable = cpu_enable_sme_dvmsync,
> > +		/* C1-Pro r0p0 - r1p2 (the latter only when REVIDR_EL1[0]==0 */
> > +		ERRATA_MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 2),
> > +		MIDR_FIXED(MIDR_CPU_VAR_REV(1, 2), BIT(0)),
> > +	},
> > +#endif
> 
> An alternative to this workaround is just to disable SME entirely, perhaps
> by passing 'arm64.nosme' on the cmdline. Maybe we should disable the
> workaround in that case?

Good point, the workaround isn't necessary if the SME is off. I can add
an extra check, though given that no-one would run in user-space with
TIF_SME, the overhead is only in the sme_active_cpus mask checking.

> > @@ -1358,6 +1360,85 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
> >  	put_cpu_fpsimd_context();
> >  }
> >  
> > +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> > +
> > +/*
> > + * SME/CME erratum handling
> > + */
> > +static cpumask_var_t sme_dvmsync_cpus;
> > +static cpumask_var_t sme_active_cpus;
> > +
> > +void sme_set_active(unsigned int cpu)
> > +{
> > +	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
> > +		return;
> > +	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
> > +		return;
> > +
> > +	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
> > +		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
> > +
> > +	cpumask_set_cpu(cpu, sme_active_cpus);
> > +
> > +	/*
> > +	 * Ensure subsequent (SME) memory accesses are observed after the
> > +	 * cpumask and the MMCF_SME_DVMSYNC flag setting.
> > +	 */
> > +	smp_mb();
> 
> I can't convince myself that a DMB is enough here, as the whole issue
> is that the SME memory accesses can be observed _after_ the TLB
> invalidation. I'd have thought we'd need a DSB to ensure that the flag
> updates are visible before the exception return.

This is only to ensure that the sme_active_cpus mask is observed before
any SME accesses. The mask is later used to decide whether to send the
IPI. We have something like this:

P0
	STSET	[sme_active_cpus]
	DMB
	SME access to [addr]

P1
	TLBI	[addr]
	DSB
	LDR	[sme_active_cpus]
	CBZ	out
	Do IPI
out:

If P1 did not observe the STSET to [sme_active_cpus], P0 should have
received and acknowledged the DVMSync before the STSET. Is your concern
that P1 can observe the subsequent SME access but not the STSET?

No idea whether herd can model this (I only put this in TLA+ for the
main logic check but it doesn't do subtle memory ordering).

> > +void sme_do_dvmsync(void)
> > +{
> > +	/*
> > +	 * This is called from the TLB maintenance functions after the DSB ISH
> > +	 * to send hardware DVMSync message. If this CPU sees the mask as
> > +	 * empty, the remote CPU executing sme_set_active() would have seen
> > +	 * the DVMSync and no IPI required.
> > +	 */
> > +	if (cpumask_empty(sme_active_cpus))
> > +		return;
> > +
> > +	preempt_disable();
> > +	smp_call_function_many(sme_active_cpus, sme_dvmsync_ipi, NULL, true);
> > +	preempt_enable();
> > +}
> 
> Why do we care about all CPUs using SME, rather than limiting it to the
> set of CPUs using SME with the mm we've invalidated? This looks like it
> will result in unnecessary cross-calls when multiple tasks are using SME
> (especially as the mm flag is only cleared on fork).

Yes, it's a possibility but I traded it for simplicity. We also have the
TTU case where we don't have an mm and we don't want to broadcast to all
CPUs either, hence an sme_active_cpus mask. As I just replied on patch
2, for the TLB batching we wouldn't be able to use a cpumask in the
batching structure since, per the ordering above, we need the DVMSync
before checking if/where to send the IPI to.

For the typical TLBI (not TTU), we can track a per-mm mask passed down
to this function (I have patches doing this but it didn't make a
significant difference in benchmarks). However, for upstream we may want
to use mm_cpumask() for something else in the future (FEAT_TLBID; work
in progress), so we should probably add a different mask. Well, C1-Pro
doesn't support FEAT_TLBID, so we could disable the workaround and use
the same mm_cpumask(); it just gets messier.

We can keep the sme_active_cpus for the TTU case and easily add a
cpumask for the other TLBI cases where we have the mm. Is it worth it? I
don't think so if the only SME apps are some benchmarks ;).

(for the Android backports I did not want to break KMI by expanding
kernel data structures; of course, not a concern for mainline but the
only users of this workaround are likely to be using GKI than upstream)

-- 
Catalin

