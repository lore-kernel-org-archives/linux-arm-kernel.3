Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0199C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwiCyC2lO5WEqro7WiPCs85r1Xu3wKSrunx6M8qjcBs=; b=MdJBAfcNiglkBobmO0fVn+Gss2
	lS+zYw8TKao4JqfKeTPzZeqr0L3Qhy4Ko1HzmfQZSHlpbObefhTiRDBPDxIeeWGiMpHP5RGwiFnaL
	f7JqMBZbbeWwgUw58lGNqabdj+KrZKtDsJqYc1PBHLFLI3vovx8AabpObYQyI8Yh++9gUZhIpP50d
	SfziRKAK9PmOVP2NHsmKktbaMbtf1NmimQmXF2WrlsipqbuGzn3S67x+szJUq4BF9fySBmYKR+pXj
	Om+xvVHBttnePimVfiaMUcCw/bbhWXrztBCVVPiYKizxyZmNtke4Fdxk9JoLS4fd1eXhLoynSQZ9e
	E3Qgsa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTTi-00000008ZYt-25EL;
	Wed, 09 Jul 2025 12:00:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRji-00000008FoH-275h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43FAC153B;
	Wed,  9 Jul 2025 03:08:58 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 142A33F694;
	Wed,  9 Jul 2025 03:09:07 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:08:57 +0100
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
Message-ID: <aG4_uYJgpMXo3QHQ@raptor>
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
X-CRM114-CacheID: sfid-20250709_030910_628893_6338879E 
X-CRM114-Status: GOOD (  41.47  )
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

Hi Leo, James,

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

Thought about this some more.

Before:

arm_spe_pmu_buf_get_fault_act:
  <drain buffer>
  ISB
arm_spe_perf_aux_output_begin:
  PMBLIMITR_EL1.E = 1
ISB
PMBSR_EL1.S = 0
ERET

Now:

PMBLIMITR_EL1 = 0
ISB

PMBSR_EL1.S = 0
arm_spe_perf_aux_output_begin:
  ISB
  PMBLIMITR_EL1.E = 1
ERET

I don't see much of a difference between the two sequences - the point after
which we can be sure that profiling is enabled remains the ERET from the
exception return.  The only difference is that, before this change, the ERET
synchronized clearing the PMBSR_EL1.S bit, now it synchronizes setting the
PMBLIMITR_EL1.E bit.

Thoughts?

Thanks,
Alex

