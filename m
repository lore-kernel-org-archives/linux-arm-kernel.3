Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6668C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3UQyuO3+ny1TOHAc+RHzlgmaR1yU7eVuQL9qsCyH2U=; b=4MciA+b97C4Ikk2kVn6mFLrD5q
	oUPYmM52tq9Cd0fVKDmIQDNwz8MrjidC67+wjHwxbfMCS4gFvelFAjGjSUlQa6JOMDe2iKr+Tig1c
	SRB+lS72QQW2PYHRORcPBTON7h6rm7avVE/UtNSbz3Kofzt20x1p8Cy31oKxNyeqyLBHxiaA+Ir7j
	8oFK1C5gIN9vVEsppKXPAb2F0rp+NhBUjd4bO/Sg16qkf9NA8YTGC0IJBPdwWZ2DsdJCoRvcy9CLi
	KBNH1QZy0BTuOwKdLOWYaladwhMGHxGUyoU4D2SW6KHzy1kQ6j5Dp3c/LJXTO4Uzgcur6bx6ISprm
	bzKym6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtkm-00000000Ehz-3feE;
	Mon, 21 Jul 2025 16:52:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsKg-000000003zf-0tF5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 15:21:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82349153B;
	Mon, 21 Jul 2025 08:21:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80A33F6A8;
	Mon, 21 Jul 2025 08:21:36 -0700 (PDT)
Date: Mon, 21 Jul 2025 16:21:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Message-ID: <20250721152134.GF3137075@e132581.arm.com>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
 <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
 <20250707153710.GB2182465@e132581.arm.com>
 <aG4_uYJgpMXo3QHQ@raptor>
 <20250714085849.GC1093654@e132581.arm.com>
 <0c53164a-306a-4cb7-9085-bba8985c32e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c53164a-306a-4cb7-9085-bba8985c32e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_082138_338135_5BE1B1EC 
X-CRM114-Status: GOOD (  29.43  )
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

On Mon, Jul 21, 2025 at 02:20:15PM +0100, James Clark wrote:

[...]

> > > Thought about this some more.
> > > 
> > > Before:
> > > 
> > > arm_spe_pmu_buf_get_fault_act:
> > >    <drain buffer>
> > >    ISB
> > > arm_spe_perf_aux_output_begin:
> > >    PMBLIMITR_EL1.E = 1
> > > ISB
> > > PMBSR_EL1.S = 0
> > > ERET
> > > 
> > > Now:
> > > 
> > > PMBLIMITR_EL1 = 0
> > > ISB
> > > 
> > > PMBSR_EL1.S = 0
> > > arm_spe_perf_aux_output_begin:
> > >    ISB
> > >    PMBLIMITR_EL1.E = 1
> > > ERET
> > > 
> > > I don't see much of a difference between the two sequences - the point after
> > > which we can be sure that profiling is enabled remains the ERET from the
> > > exception return.  The only difference is that, before this change, the ERET
> > > synchronized clearing the PMBSR_EL1.S bit, now it synchronizes setting the
> > > PMBLIMITR_EL1.E bit.
> > > 
> > > Thoughts?
> > 
> > To make the discussion easier, I'll focus on the trace enabling flow
> > in this reply.
> > 
> > My understanding of a sane flow would be:
> > 
> >    arm_spe_pmu_irq_handler() {
> >      arm_spe_perf_aux_output_begin() {
> >            SYS_PMBPTR_EL1 = base;
> > 
> >            ISB // Synchronization between SPE register setting and
> >                // enabling profiling buffer.
> >            PMBLIMITR_EL1.E = 1;
> >      }
> >      ISB // Context synchronization event to ensure visibility to SPE
> >    }
> > 
> >    ... start trace ... (Bottom half, e.g., softirq, etc)
> > 
> >    ERET
> > 
> > In the current code, arm_spe_perf_aux_output_begin() is followed by an
> > ISB, which serves as a context synchronization event to ensure
> > visibility to the SPE. After that, it ensures that the trace unit will
> > function correctly.
> > 
> 
> But I think Alex's point is that in the existing code the thing that finally
> enables trace (PMBSR_EL1.S = 0) isn't followed by an isb(), only an ERET. So
> the new flow isn't any different in that regard.

Thanks for explanation.

> > I understand that the Software Usage PKLXF recommends using an ERET as
> > the synchronization point. However, between enabling the profiling
> > buffer and the ERET, the kernel might execute other operations (e.g.,
> > softirqs, tasklets, etc.).
> 
> Isn't preemption disabled? Surely that's not possible. Even if something did
> run it wouldn't be anything that touches the SPE registers, and we're sure
> there's an isb() between setting up the buffer and the final PMBLIMITR_EL1.E
> = 1

Yes, bottom half runs in preemtion disabled state. See:

  el1_interrupt() -> __el1_irq() -> irq_exit_rcu() -> invoke_softirq()

In some cases, sotfirq and tasklet might even cause long latency (I
believe it can be milliseconds or even longer), this is why ftrace
"irqsoff" tracer is used to profile latency caused by irq off state.

Bottom half does not modify SPE registsers, but it can be a long road
between enabling SPE trace and ERET.

> > Therefore, it seems to me that using ERET as the synchronization point
> > may be too late. This is why I think we should keep an ISB after
> > arm_spe_perf_aux_output_begin().
> 
> Wouldn't that make the ERET too late even in the current code then? But I
> think we're agreeing there's no issue there?

I would say ERET is too late for current code as well.

Thanks,
Leo

