Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3A1C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26RWSptk/C63igaxaf9XNA+m7yprosJiCw82r9jduVA=; b=CqEkFPDH47e0dmoCEyYYxVqr0u
	keDfOHu22+ZiTO0nkEIViRlCtK5GzjhRbwp+fbHKqW8+edqbnEQ9ZHN2xxa+qDHK/3UMakdlpWwgA
	h5otAxcHjk0r//4SX9VhhqO67ZDMG7qLyZGH3Zj/e7OzX8eORoGJFiFS+C8X9KCvCVcbhqcPLlwqs
	oGHSSQeG8rr6BW34vjaBVihSOZPGH6hQAkZHHhjK2XFb3FhsK5rf1Wn7pBqx3dlNuGZ54lh9ItESB
	LBjLiDviti7CMSyYmLYGCnDquW7SuPSBZy0tHG0i9eplV7/3AC4rIq3tfOdVP8yT0ymkBUEy5AtXR
	QDwfK1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50oO-0000000Ggxy-0HAj;
	Fri, 11 Sep 2026 12:57:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50oK-0000000Ggwv-2uS5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:56:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E55A660234;
	Fri, 11 Sep 2026 12:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788291F000FF;
	Fri, 11 Sep 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131415;
	bh=26RWSptk/C63igaxaf9XNA+m7yprosJiCw82r9jduVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fT92RkC+ibTCcn9cCVhyDl4u/8y0VNLIm9tYZNJL9HCP9aOe52WAqpLSRJpgxO7FA
	 IK9GVZqYgru/xUYeIPop5kiDiMW8xzZ2kGNTsHHChcPhuIdo90bT/0XQI4x7o1L4K9
	 aGi0EBWUz7jFwrpYP6gW2KJqZKDOa9h8zcSy3bl6RIjsQ0dnHPHIzbvZ3A6Ot/+A5U
	 spvnwG0EWVVnszLQc1NCzEr/di7vRDdxQmlD/Sc09MmLZpUJmXfpL+9YKyGqWqphAS
	 QlCK7UBhXCNSYwZUFL+dtP4dmhrFA73nM+zAv5OpWBqYNF2sRMSuqKpss3EFOypyKg
	 HUeR7MwIWbc+w==
Date: Fri, 11 Sep 2026 13:56:50 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery
 for CPU onlining
Message-ID: <aqP6kv9ZfNRWmngj@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-19-will@kernel.org>
 <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
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

On Tue, Sep 08, 2026 at 09:05:18PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 0:40, Will Deacon 写道:
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > index 17868b497d7c..bec4bc1b12db 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -393,7 +393,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
> >  	mov	x0, x20
> >  	bl	finalise_el2
> >  
> > -	str_l	xzr, __early_cpu_boot_status, x3
> >  	adr_l	x5, vectors
> >  	msr	vbar_el1, x5
> >  	isb
> > @@ -439,15 +438,15 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
> >   * with MMU turned off.
> >   *
> >   * update_early_cpu_boot_status tmp, status
> > - *  - Corrupts tmp1, tmp2
> > - *  - Writes 'status' to __early_cpu_boot_status and makes sure
> > + *  - Corrupts tmp1
> 
> Corrupts tmp1, tmp2 ?

Well spotted, thanks.

> > @@ -125,45 +135,42 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
> >  
> >  void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
> >  {
> > -	long status;
> > +	union secondary_status status;
> >  
> >  	if (is_alive)
> >  		return;
> >  
> > -	secondary_data.task = NULL;
> > -	status = READ_ONCE(secondary_data.status);
> > -	if (status == CPU_MMU_OFF)
> > -		status = READ_ONCE(__early_cpu_boot_status);
> > -
> >  	/* A CPU has failed to boot. Try to figure out what happened. */
> > -	switch (status & CPU_BOOT_STATUS_MASK) {
> > -	default:
> > -		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
> > -		       cpu, status);
> > -		cpus_stuck_in_kernel++;
> > -		break;
> > -	case CPU_KILL_ME:
> > -		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
> > -			set_cpu_present(cpu, false);
> > +	if (smp_parallel_bringup)
> > +		pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
> 
> For some production systems, restarting to reproduce the issue may be
> troublesome.

These errors _really_ shouldn't happen with production systems. They are
caused by critical, deterministic errors such as the secondary CPU not
supporting the system page size. If you can't reboot in that situation,
then you have no system!

The parallel bringup code will detect the issue, it just won't be able
to tell you which CPU caused which issue.

> > +	if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask)) {
> > +		set_cpu_present(cpu, false);
> >  		if (!op_cpu_kill(cpu)) {
> >  			pr_crit("CPU%u: died during early boot\n", cpu);
> > -			break;
> > +			return;
> >  		}
> > -		pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
> > -		fallthrough;
> > -	case CPU_STUCK_IN_KERNEL:
> > -		pr_crit("CPU%u: is stuck in kernel\n", cpu);
> > -		if (status & CPU_STUCK_REASON_52_BIT_VA)
> > -			pr_crit("CPU%u: does not support 52-bit VAs\n", cpu);
> > -		if (status & CPU_STUCK_REASON_NO_GRAN) {
> > -			pr_crit("CPU%u: does not support %luK granule\n",
> > -				cpu, PAGE_SIZE / SZ_1K);
> > -		}
> > -		cpus_stuck_in_kernel++;
> > -		break;
> > -	case CPU_PANIC_KERNEL:
> > -		panic("CPU%u detected unsupported configuration\n", cpu);
> >  	}
> > +
> > +	pr_crit_once("CPUs may be stuck in kernel\n");
> 
> Need we print the "cpu"

You should already get something like:

  CPUn: will not boot

so I don't think we need anything extra (as, as above, we don't know
exactly which CPUs are stuck).

> >  static void init_gic_priority_masking(void)
> > @@ -407,12 +414,8 @@ void __noreturn cpu_die_early(void)
> >  
> >  	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
> 
> It seems unsafe for multiple secondary CPUs to update
> cpu_died_early_mask concurrently.

Why? cpumask_set_cpu() is atomic and each CPU only sets their own bit.

Will

