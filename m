Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C809C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaySX+dDAFpfo2mVMB1VXeR4nw4jJEMDM9BfBSCBD+w=; b=KSD/Dat4yaAT7tmhNaJ1bo2OO0
	aUAtX9/H6knlRDNhOqx+askOZdp/urw6WMmLtR2exXKCXvLiOlkhrJLBvuSzJCiLYvOqMWaBISXRO
	6ckWSsOdHwxxD6yzaAeUxAhDx0ZNMtb/Xty6OGbI9Q34652vRRR93QI4NF6P6GvjtrxMDxn1i+MyZ
	jqZBLwYTOzveafjoz4KgQeDjZQTOm5Vz7sXwMM4aPGK0tzQiHV8PnJ71Bj/6/UymGj4Th1i7mDh3Z
	48p5dud+U9oTfdYtYq3TlH+DRZf/+CfVs45HjsnQ4RG2fQ0scMnU1fyL8S15hn8MIar8uFFpCAFmY
	IjQiJEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9ia-00000005g5y-15li;
	Tue, 08 Jul 2025 14:54:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9ZX-00000005eHH-2rbg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:45:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E830153B;
	Tue,  8 Jul 2025 07:45:15 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBFA03F694;
	Tue,  8 Jul 2025 07:45:24 -0700 (PDT)
Date: Tue, 8 Jul 2025 15:45:22 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Message-ID: <aG0u57dpLnK2WnIT@raptor>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
 <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
 <20250707153710.GB2182465@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707153710.GB2182465@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074527_826203_E9B01903 
X-CRM114-Status: GOOD (  44.60  )
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

Hi Leo,

On Mon, Jul 07, 2025 at 04:37:10PM +0100, Leo Yan wrote:
> On Mon, Jul 07, 2025 at 12:39:57PM +0100, James Clark wrote:
> 
> [...]
> 
> > > > @@ -661,16 +666,24 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
> > > >   	 */
> > > >   	irq_work_run();
> > > > +	/*
> > > > +	 * arm_spe_pmu_buf_get_fault_act() already drained, and PMBSR_EL1.S == 1
> > > > +	 * means that StatisticalProfilingEnabled() == false. So now we can
> > > > +	 * safely disable the buffer.
> > > > +	 */
> > > > +	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
> > > > +	isb();
> > > > +
> > > > +	/* Status can be cleared now that PMBLIMITR_EL1.E == 0 */
> > > > +	write_sysreg_s(0, SYS_PMBSR_EL1);
> > > > +
> > > 
> > > An important thing is about sequence:
> > > As described in arm_spe_pmu_disable_and_drain_local(), should we always
> > > clear ELs bits in PMSCR_EL1 before clear PMBLIMITR_EL1.E bit? As a
> > > reference, we could see TRBE always clear ELx bits before disable trace
> > > buffer.
> > > 
> > > And a trivial flaw:
> > > 
> > > If the TRUNCATED flag has been set, the irq_work_run() above runs the
> > > IRQ work to invoke the arm_spe_pmu_stop() to disable trace buffer, which
> > > clear SYS_PMBLIMITR_EL1.E bit. This is why the current code does not
> > > explictly clear SYS_PMBLIMITR_EL1.E bit.
> > > 
> > > With this patch, the interrupt handler will clear SYS_PMBLIMITR_EL1.E
> > > bit twice for a trunacated case.
> > 
> > I suppose that's a rarer case that we don't necessarily have to optimize
> > for. I don't think it will do any harm, but is it even possible to avoid?
> > 
> > There are already some other duplications in the driver, for example in
> > arm_spe_pmu_stop() we call arm_spe_pmu_disable_and_drain_local() which
> > drains, and then arm_spe_pmu_buf_get_fault_act() which also drains again.
> 
> If we don't need to worry about duplicated operations in the truncated
> case, then for easier maintenance and better readability, I'm wondering
> if we could simplify the interrupt handler as follows:
> 
>     arm_spe_pmu_irq_handler()
>     {
>         ...
> 
>         act = arm_spe_pmu_buf_get_fault_act(handle);
>         if (act == SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
>                 return IRQ_NONE;
> 
>         arm_spe_pmu_disable_and_drain_local();
> 
>         /* Status can be cleared now that PMBLIMITR_EL1.E == 0 */
>         write_sysreg_s(0, SYS_PMBSR_EL1);
>         isb();
> 
>         switch (act) {
>             ...
>         }
>     }
> 
> This approach complies with DEN0154 - we must clear PMBLIMITR_EL1.E
> before writing to other SPE system registers (e.g., PMBSR).
> 
> The reason for using arm_spe_pmu_disable_and_drain_local() is that we
> first need to disable profiling instructions by clearing PMSCR_EL1/EL2,
> and then is it safe to disable the profiling buffer.

Sampling is disabled when ProfilingBufferEnabled() = false (look at the
pseudocode for SPEPreExecution() in the Arm ARM).  ProfilingBufferEnabled() =
false if PMBLIMITR_EL1.E = 0 *or* PMBSR_EL1.S = 1.

One way to think about it is: if PMBLIMITR_EL1.E = 0, then there's no point in
sampling instructions and creating records because the profiling unit cannot
write them to memory; and if PMBSR_EL1.S = 1, something went wrong with the
buffer, or the buffer is full, and similarly there's no point in sampling
instructions and creating records because, again, the profiling unit cannot
write them to memory.

> 
> [...]
> 
> > > >   	case SPE_PMU_BUF_FAULT_ACT_OK:
> > > >   		/*
> > > > @@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
> > > >   		 * PMBPTR might be misaligned, but we'll burn that bridge
> > > >   		 * when we get to it.
> > > >   		 */
> > > > -		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
> > > > +		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
> > > >   			arm_spe_perf_aux_output_begin(handle, event);
> > > > -			isb();
> > > 
> > > I am a bit suspecious we can remove this isb().
> > > 
> > > As a reference to the software usage PKLXF in Arm ARM (DDI 0487 L.a),
> > > after enable TRBE trace unit, an ISB is mandatory. Maybe check a bit
> > > for this?
> >
> > Wasn't this isb() to separate the programming of the registers with the
> > status register clear at the end of this function to enable profiling?
> 
> Enabling profiling buffer followed an isb() is not only for separating
> other register programming.
> 
> As described in section D17.9, Synchronization and Statistical Profiling
> in Arm ARM:
> 
>   "A Context Synchronization event guarantees that a direct write to a
>   System register made by the PE in program order before the Context
>   synchronization event are observable by indirect reads and indirect
>   writes of the same System register made by a profiling operation
>   relating to a sampled operation in program order after the Context
>   synchronization event."
> 
> My understanding is: after the ARM SPE profiling is enabled, the
> followed ISB is a Synchronization to make sure the system register
> values are observed by SPE. And we cannot rely on ERET, especially if
> we are tracing the kernel mode.

DDI 0487L.a, rule R_BWCFK: If the Effective value of SCTLR_ELx.EOS is 1, the
exception return is a Context synchronization event.

Linux always sets EOS.

Thanks,
Alex

> 
> Thanks,
> Leo
> 
> > But now we enable profiling with the write to PMBLIMITR_EL1 in
> > arm_spe_perf_aux_output_begin() and the last thing here is the ERET. That's
> > specifically mentioned as enough synchronization in PKLXF:
> > 
> >   In the common case, this is an ERET instruction that returns to a
> >   different Exception level where tracing is allowed.
> > 
> > > > -		}
> > > >   		break;
> > > >   	case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:
> > > >   		/* We've seen you before, but GCC has the memory of a sieve. */
> > > >   		break;
> > > >   	}
> > > > -	/* The buffer pointers are now sane, so resume profiling. */
> > > > -	write_sysreg_s(0, SYS_PMBSR_EL1);
> > > >   	return IRQ_HANDLED;
> > > >   }
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > 

