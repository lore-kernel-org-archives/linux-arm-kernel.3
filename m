Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765DDF33A74
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbCQueaJiNrL46u9K2+vA32OpLp/TxgEjPJUL+Wg6Bg=; b=OKhwKLvskHBKMNWU8Fhb6x580v
	5dIOrYSFRkencYeY07sz5AQsi1HZ1Ny0cV7vLWMJERVCy71ZS74GCmIKV9KAt/enuSaUBq0f8yu3Q
	HXyvO5eqrhxBfpK0IOyAmQV51ufu/dysHUPo4kFMpOegNUHt4ho/RVz4gUuAsuobUYOjYMz2bc98f
	nBZLzk8zuPmS5GDmqZH8DE7iShADeem1A9slrVJ+9yrQ41XgiAjkCIReS/6DHo4h7BGwjrAeKwU3d
	9XVut5Z0Tlawsqd/4jBOy2YjrlV6WdkiUEBKbKsa0sYHKqfloZW66+MTZTA/WnT3FoS1pYLK+F/pA
	leqkmf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9kT-00000001zmL-2MbA;
	Thu, 05 Mar 2026 14:32:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9kR-00000001zlq-1DKT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEE48436D7;
	Thu,  5 Mar 2026 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A87C116C6;
	Thu,  5 Mar 2026 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721137;
	bh=BDxRqGoVPIAZP5jThA2TA1n7z0JYbMMJCM69Dd0B96Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6BMuB0LQdQojB3SzJVF9cI/GNdjZ45yhkZv+0JndOxbsgW6Vl/hDYpq0QPcMKtYZ
	 SY9Q4MyF0P76suZ/AszzmZNjB3ZXonECq1868uUCyaw9UvQ+b2JL2ytjyiliWXUr0c
	 F69z9IR4flhpaVv7sz5fsNLsttVVpefU+nUnlB+2I6v0tWq5YQBT668+Yb+v1VWxuC
	 1gV+MRpdNXgdgZGIDOHHMQC/dVJZkI/dBQtEjEzrro4Q9jiMHyS3+waWrW4FtDhqWe
	 h4cM2WIlOqd+ScCMfHaahf7CsHuKlMbiqLva0QDQcxzbPH5MODVf3X3+mjXp/nNtK3
	 EC0FX8Hsh+S9Q==
Date: Thu, 5 Mar 2026 14:32:11 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <aamT6-Mvr9nI1unq@willie-the-truck>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-4-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302165801.3014607-4-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_063219_369741_2B6B8B11 
X-CRM114-Status: GOOD (  25.97  )
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

On Mon, Mar 02, 2026 at 04:57:56PM +0000, Catalin Marinas wrote:
> C1-Pro acknowledges DVMSync messages before completing the SME/CME
> memory accesses. Work around this by issuing an IPI+DSB to the affected
> CPUs if they are running in EL0 with SME enabled.

Just to make sure I understand the implications, but this _only_ applies
to explicit memory accesses from the SME unit and not, for example, to
page-table walks initiated by SME instructions?

> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/Kconfig                | 12 +++++
>  arch/arm64/include/asm/cpucaps.h  |  2 +
>  arch/arm64/include/asm/cputype.h  |  2 +
>  arch/arm64/include/asm/fpsimd.h   | 29 +++++++++++
>  arch/arm64/include/asm/mmu.h      |  1 +
>  arch/arm64/include/asm/tlbflush.h | 17 +++++++
>  arch/arm64/kernel/cpu_errata.c    | 19 ++++++++
>  arch/arm64/kernel/entry-common.c  |  3 ++
>  arch/arm64/kernel/fpsimd.c        | 81 +++++++++++++++++++++++++++++++
>  arch/arm64/kernel/process.c       |  7 +++
>  arch/arm64/tools/cpucaps          |  1 +
>  11 files changed, 174 insertions(+)

[...]

> @@ -575,6 +576,14 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
>  };
>  #endif
>  
> +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> +static void cpu_enable_sme_dvmsync(const struct arm64_cpu_capabilities *__unused)
> +{
> +	if (this_cpu_has_cap(ARM64_WORKAROUND_SME_DVMSYNC))
> +		sme_enable_dvmsync();
> +}
> +#endif
> +
>  #ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_38
>  static const struct midr_range erratum_ac03_cpu_38_list[] = {
>  	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> @@ -901,6 +910,16 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		.matches = need_arm_si_l1_workaround_4311569,
>  	},
>  #endif
> +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> +	{
> +		.desc = "C1-Pro SME DVMSync early acknowledgement",
> +		.capability = ARM64_WORKAROUND_SME_DVMSYNC,
> +		.cpu_enable = cpu_enable_sme_dvmsync,
> +		/* C1-Pro r0p0 - r1p2 (the latter only when REVIDR_EL1[0]==0 */
> +		ERRATA_MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 2),
> +		MIDR_FIXED(MIDR_CPU_VAR_REV(1, 2), BIT(0)),
> +	},
> +#endif

An alternative to this workaround is just to disable SME entirely, perhaps
by passing 'arm64.nosme' on the cmdline. Maybe we should disable the
workaround in that case?

> @@ -1358,6 +1360,85 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>  	put_cpu_fpsimd_context();
>  }
>  
> +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> +
> +/*
> + * SME/CME erratum handling
> + */
> +static cpumask_var_t sme_dvmsync_cpus;
> +static cpumask_var_t sme_active_cpus;
> +
> +void sme_set_active(unsigned int cpu)
> +{
> +	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
> +		return;
> +	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
> +		return;
> +
> +	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
> +		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
> +
> +	cpumask_set_cpu(cpu, sme_active_cpus);
> +
> +	/*
> +	 * Ensure subsequent (SME) memory accesses are observed after the
> +	 * cpumask and the MMCF_SME_DVMSYNC flag setting.
> +	 */
> +	smp_mb();

I can't convince myself that a DMB is enough here, as the whole issue
is that the SME memory accesses can be observed _after_ the TLB
invalidation. I'd have thought we'd need a DSB to ensure that the flag
updates are visible before the exception return.

> +void sme_do_dvmsync(void)
> +{
> +	/*
> +	 * This is called from the TLB maintenance functions after the DSB ISH
> +	 * to send hardware DVMSync message. If this CPU sees the mask as
> +	 * empty, the remote CPU executing sme_set_active() would have seen
> +	 * the DVMSync and no IPI required.
> +	 */
> +	if (cpumask_empty(sme_active_cpus))
> +		return;
> +
> +	preempt_disable();
> +	smp_call_function_many(sme_active_cpus, sme_dvmsync_ipi, NULL, true);
> +	preempt_enable();
> +}

Why do we care about all CPUs using SME, rather than limiting it to the
set of CPUs using SME with the mm we've invalidated? This looks like it
will result in unnecessary cross-calls when multiple tasks are using SME
(especially as the mm flag is only cleared on fork).

Will

