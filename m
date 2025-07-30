Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E8EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjPNvqQW+32U0GZ3uLKkhcL506IfzWiZDDMxQSP3GIc=; b=JxwRpMd9J6MVK7d93GXfRfYCy2
	ifKXhcrcDQ+qPuRjzE/UV/3fUg/Sa575h4C3JXYaS01vdk/i9yqVk6kqPHT2ZBRqS6W92YfrSfEoy
	t9xE5PoNl1/TRkadPFGJMjb+NIzweR8Y0JeNPoyMYBQWkYlpYWvn6IKpfAsbW3UvdyMKFiQfW3muX
	t23EIucG5WVSVqVgubL50w+ICNRiszhCsQFT4vGIGYgm1XwxoxWO5nyShh04ws6JUtBiLax0BgrxH
	FvyVY+XqBlT2pIo3QnZeiGRRKjd6Cr8hEyU+ix4w2OX0CDGW0BqsjfuQ7Q0jIgUnNXk5iJ+xgigf+
	F4FGktrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3Ui-00000001AVG-3LBf;
	Wed, 30 Jul 2025 09:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3SC-00000001A6d-2xaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:50:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 161511BC0;
	Wed, 30 Jul 2025 02:50:22 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E04AD3F7BD;
	Wed, 30 Jul 2025 02:50:27 -0700 (PDT)
Date: Wed, 30 Jul 2025 10:50:17 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
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
Message-ID: <aInqMPBzi7YnIxOB@raptor>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
 <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
 <20250707153710.GB2182465@e132581.arm.com>
 <aG4_uYJgpMXo3QHQ@raptor>
 <20250714085849.GC1093654@e132581.arm.com>
 <0c53164a-306a-4cb7-9085-bba8985c32e7@linaro.org>
 <20250721152134.GF3137075@e132581.arm.com>
 <10e9cb52-2476-4c13-8632-0a85830f98dd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10e9cb52-2476-4c13-8632-0a85830f98dd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_025032_820747_B1D4CC74 
X-CRM114-Status: GOOD (  44.72  )
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

On Tue, Jul 22, 2025 at 03:46:11PM +0100, James Clark wrote:
> 
> 
> On 21/07/2025 4:21 pm, Leo Yan wrote:
> > On Mon, Jul 21, 2025 at 02:20:15PM +0100, James Clark wrote:
> > 
> > [...]
> > 
> > > > > Thought about this some more.
> > > > > 
> > > > > Before:
> > > > > 
> > > > > arm_spe_pmu_buf_get_fault_act:
> > > > >     <drain buffer>
> > > > >     ISB
> > > > > arm_spe_perf_aux_output_begin:
> > > > >     PMBLIMITR_EL1.E = 1
> > > > > ISB
> > > > > PMBSR_EL1.S = 0
> > > > > ERET
> > > > > 
> > > > > Now:
> > > > > 
> > > > > PMBLIMITR_EL1 = 0
> > > > > ISB
> > > > > 
> > > > > PMBSR_EL1.S = 0
> > > > > arm_spe_perf_aux_output_begin:
> > > > >     ISB
> > > > >     PMBLIMITR_EL1.E = 1
> > > > > ERET
> > > > > 
> > > > > I don't see much of a difference between the two sequences - the point after
> > > > > which we can be sure that profiling is enabled remains the ERET from the
> > > > > exception return.  The only difference is that, before this change, the ERET
> > > > > synchronized clearing the PMBSR_EL1.S bit, now it synchronizes setting the
> > > > > PMBLIMITR_EL1.E bit.
> > > > > 
> > > > > Thoughts?
> > > > 
> > > > To make the discussion easier, I'll focus on the trace enabling flow
> > > > in this reply.
> > > > 
> > > > My understanding of a sane flow would be:
> > > > 
> > > >     arm_spe_pmu_irq_handler() {
> > > >       arm_spe_perf_aux_output_begin() {
> > > >             SYS_PMBPTR_EL1 = base;
> > > > 
> > > >             ISB // Synchronization between SPE register setting and
> > > >                 // enabling profiling buffer.
> > > >             PMBLIMITR_EL1.E = 1;
> > > >       }
> > > >       ISB // Context synchronization event to ensure visibility to SPE
> > > >     }
> > > > 
> > > >     ... start trace ... (Bottom half, e.g., softirq, etc)
> > > > 
> > > >     ERET
> > > > 
> > > > In the current code, arm_spe_perf_aux_output_begin() is followed by an
> > > > ISB, which serves as a context synchronization event to ensure
> > > > visibility to the SPE. After that, it ensures that the trace unit will
> > > > function correctly.
> > > > 
> > > 
> > > But I think Alex's point is that in the existing code the thing that finally
> > > enables trace (PMBSR_EL1.S = 0) isn't followed by an isb(), only an ERET. So
> > > the new flow isn't any different in that regard.
> > 
> > Thanks for explanation.
> > 
> > > > I understand that the Software Usage PKLXF recommends using an ERET as
> > > > the synchronization point. However, between enabling the profiling
> > > > buffer and the ERET, the kernel might execute other operations (e.g.,
> > > > softirqs, tasklets, etc.).
> > > 
> > > Isn't preemption disabled? Surely that's not possible. Even if something did
> > > run it wouldn't be anything that touches the SPE registers, and we're sure
> > > there's an isb() between setting up the buffer and the final PMBLIMITR_EL1.E
> > > = 1
> > 
> > Yes, bottom half runs in preemtion disabled state. See:
> > 
> >    el1_interrupt() -> __el1_irq() -> irq_exit_rcu() -> invoke_softirq()
> > 
> > In some cases, sotfirq and tasklet might even cause long latency (I
> > believe it can be milliseconds or even longer), this is why ftrace
> > "irqsoff" tracer is used to profile latency caused by irq off state.
> > 
> > Bottom half does not modify SPE registsers, but it can be a long road
> > between enabling SPE trace and ERET.
> > 
> > > > Therefore, it seems to me that using ERET as the synchronization point
> > > > may be too late. This is why I think we should keep an ISB after
> > > > arm_spe_perf_aux_output_begin().
> > > 
> > > Wouldn't that make the ERET too late even in the current code then? But I
> > > think we're agreeing there's no issue there?
> > 
> > I would say ERET is too late for current code as well.
> > 
> > Thanks,
> > Leo

Thanks for the explanation and the analysis. I think we were looking at the
patch from different point of views: I was interested in not changing the
current behaviour, you were saying that the existing behaviour can be improved
upon.

> Ok I get it now. The point is that there is stuff in between the return in
> the SPE IRQ handler and the actual ERET. If someone is interested in
> sampling the kernel then they might miss sampling a small amount of that.
> 
> It's not a correctness thing, just reducing potential gaps in the samples. I
> can add another commit to add it, but it doesn't look like it would be a
> fixes commit either, just an improvement. And the same issue applies to the
> existing code too.

I agree here, this looks on an improvement on existing behaviour. I would keep
it as a patch separate from this series, as it's not a fix, and it's not related
to to the rules from DEN0154.

Thanks,
Alex

