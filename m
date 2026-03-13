Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7FD105F7BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EScH/iZRrWyJvokcgkUDFUYdd2laUzZcUnk1Bjef3WI=; b=z2iabt42JXwMYT7cY1YlLFLJK2
	bzZXM0CjbX7nM7lQyLDOFnrLrztJlxq8S2ADoVf8nuyt5N6yYIqlkKes7IjWXsMwQumDJPp3oboDL
	ci2dZmK1JqaWe1HJyeiVeTpI1cn2bvTa2/knHyWVTGh8wg6WIusP1WQTLrJ7L5zhQzy4Tcjbaa10i
	Qo6eaAjgL+BgTSGVrFEiLHlZ4XSOfKxgRSICbqcNw8xbed5cRBPccp2ZR7oF2IaM9eIwewCS55+Ql
	MKL5qxQOAyMbC7SJRp4aTF21AgpoBUtmhu6kPh2JJ3eD+73N4/T8b3OtrxxdilJqXnm5wxnjUrQIs
	gmbZWFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14tt-00000000b8W-022Z;
	Fri, 13 Mar 2026 15:58:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14tq-00000000b7R-2toR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62BD143E55;
	Fri, 13 Mar 2026 15:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1672CC19421;
	Fri, 13 Mar 2026 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773417486;
	bh=D5PZYTno7wOL/03mIkv0E+olwq3141aLAIhD7Irlnrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbwkpZr23ptn7RjEE1ds5M5eycyiQfArVY32wh34TPy0ZCw0IknmU11KovTOclJaq
	 mmEiJMMzLrCZ2+9CJU6qaEe8bCRtuH0KYq9IwADrH+0+bZLGMGpWW9E3y0OWvG1KnJ
	 f1orJ+SeoI1hJpAnLijhT39gszxlOYhtrCt00F3xNNZutL0b95lFJdvv/3KEdI+NGA
	 HTMKN7Oep24UfQJPVifqg20cEEQAXqU4vfQthysWK6URuyAe/pQLuYn9hNF2yOklGC
	 vFJj/2Czq6st4ipiOdasgaJtXALdXU32VNODpgVJ283iFEMPbcORYUeHFxtTZI0fmE
	 3Q3B/h9jm6whQ==
Date: Fri, 13 Mar 2026 15:58:00 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <abQ0CKop8Sy3hqhC@willie-the-truck>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-4-catalin.marinas@arm.com>
 <aamT6-Mvr9nI1unq@willie-the-truck>
 <aarB3iv8963UDn5E@arm.com>
 <c4a302df-511b-40b2-97f2-06576748c999@arm.com>
 <abA6N6ctPoscIbBe@arm.com>
 <abLT05Nq-9J-uBEY@willie-the-truck>
 <abQx6Q_FJH92cjXj@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQx6Q_FJH92cjXj@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085806_772138_554111F9 
X-CRM114-Status: GOOD (  40.94  )
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

On Fri, Mar 13, 2026 at 03:48:57PM +0000, Catalin Marinas wrote:
> On Thu, Mar 12, 2026 at 02:55:15PM +0000, Will Deacon wrote:
> > On Tue, Mar 10, 2026 at 03:35:19PM +0000, Catalin Marinas wrote:
> > > On Mon, Mar 09, 2026 at 10:13:20AM +0000, Vladimir Murzin wrote:
> > > > On 3/6/26 12:00, Catalin Marinas wrote:
> > > > >>> @@ -1358,6 +1360,85 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
> > > > >>>  	put_cpu_fpsimd_context();
> > > > >>>  }
> > > > >>>  
> > > > >>> +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> > > > >>> +
> > > > >>> +/*
> > > > >>> + * SME/CME erratum handling
> > > > >>> + */
> > > > >>> +static cpumask_var_t sme_dvmsync_cpus;
> > > > >>> +static cpumask_var_t sme_active_cpus;
> > > > >>> +
> > > > >>> +void sme_set_active(unsigned int cpu)
> > > > >>> +{
> > > > >>> +	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
> > > > >>> +		return;
> > > > >>> +	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
> > > > >>> +		return;
> > > > >>> +
> > > > >>> +	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
> > > > >>> +		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
> > > > >>> +
> > > > >>> +	cpumask_set_cpu(cpu, sme_active_cpus);
> > > > >>> +
> > > > >>> +	/*
> > > > >>> +	 * Ensure subsequent (SME) memory accesses are observed after the
> > > > >>> +	 * cpumask and the MMCF_SME_DVMSYNC flag setting.
> > > > >>> +	 */
> > > > >>> +	smp_mb();
> > > > >>
> > > > >> I can't convince myself that a DMB is enough here, as the whole issue
> > > > >> is that the SME memory accesses can be observed _after_ the TLB
> > > > >> invalidation. I'd have thought we'd need a DSB to ensure that the flag
> > > > >> updates are visible before the exception return.
> > > > > 
> > > > > This is only to ensure that the sme_active_cpus mask is observed before
> > > > > any SME accesses. The mask is later used to decide whether to send the
> > > > > IPI. We have something like this:
> > > > > 
> > > > > P0
> > > > > 	STSET	[sme_active_cpus]
> > > > > 	DMB
> > > > > 	SME access to [addr]
> > > > > 
> > > > > P1
> > > > > 	TLBI	[addr]
> > > > > 	DSB
> > > > > 	LDR	[sme_active_cpus]
> > > > > 	CBZ	out
> > > > > 	Do IPI
> > > > > out:
> > > > > 
> > > > > If P1 did not observe the STSET to [sme_active_cpus], P0 should have
> > > > > received and acknowledged the DVMSync before the STSET. Is your concern
> > > > > that P1 can observe the subsequent SME access but not the STSET?
> > > > > 
> > > > > No idea whether herd can model this (I only put this in TLA+ for the
> > > > > main logic check but it doesn't do subtle memory ordering).
> > > > 
> > > > JFYI, herd support for SME is still work-in-progress (specifically it misses
> > > > updates in cat), yet it can model VMSA.
> > > > 
> > > > IIUC, expectation here is that either
> > > > - P1 observes sme_active_cpus, so we have to do_IPI or
> > > > - P0 observes TLBI (say shutdown, so it must fault)
> > > > 
> > > > anything else is unexpected/forbidden.
> > > > 
> > > > AArch64 A
> > > > variant=vmsa
> > > > {
> > > >  int x=0;
> > > >  int active=0;
> > > > 
> > > >  0:X1=active;
> > > >  0:X3=x;
> > > > 
> > > >  1:X0=(valid:0);
> > > >  1:X1=PTE(x);
> > > >  1:X2=x;
> > > >  1:X3=active;
> > > >  
> > > > }
> > > >  P0                                 | P1                                            ;
> > > >  MOV W0,#1                          | STR X0,[X1]                                   ;
> > > >  STR W0,[X1] (* sme_active_cpus  *) | DSB ISH                                       ;
> > > >  DMB SY                             | LSR X9,X2,#12                                 ;
> > > >  LDR W2,[X3] (* access to [addr] *) | TLBI VAAE1IS,X9 (* [addr] *)                  ;
> > > >                                     | DSB ISH                                       ;
> > > >                                     | LDR W4,[X3]     (* sme_active_cpus *)         ;
> > > > 
> > > > exists ~(1:X4=1 \/ fault(P0,x))
> > > > 
> > > > Is that correct understanding? Have I missed anything?
> > > 
> > > Yes, I think that's correct. Another tweak specific to this erratum
> > > would be for P1 to do a store to x via another mapping after the
> > > TLBI+DSB and the P0 load should not see it.
> > > 
> > > Even with the CPU erratum, if the P1 DVMSync is received/acknowledged by
> > > P0 before its STR to sme_active_cpus, I don't see how the subsequent SME
> > > load would overtake the STR given the DMB. The erratum messed up the
> > > DVMSync acknowledgement, not the barriers.
> > 
> > I'm still finding this hard to reason about.
> > 
> > Why can't:
> > 
> > 1. P0 translates its SME load and puts the valid translation into its TLB
> > 2. P1 runs to completion, sees sme_active_cpus as 0 and so doesn't IPI
> > 3. P0 writes to sme_active_cpus and then does the SME load using the
> >    translation from (1)
> > 
> > I guess it's diving into ugly corners of what the erratum actually is...
> 
> From discussing with the microarchitects at the time, a DMB ISH was
> sufficient on the ERET path. Whether they thought about your scenario,
> not sure. Memory ordering isn't broken by this bug, only the DVMSync
> acknowledgement not waiting for the CME unit (shared by multiple CPUs)
> to complete an in-flight memory access. My assumption is that step (1)
> won't actually start until the STR in (3) is issued and this would
> include the TLB lookup.

Maybe, but that sounds slow...

> Anyway, I'll ask them again to be sure.

Thanks.

If you're speaking to them, it might also be worth asking whether or not
the exception return alone is sufficient (given that we run with IESB=1).

Will

