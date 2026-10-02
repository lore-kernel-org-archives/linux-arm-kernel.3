Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF399CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNIqItMeAufPumNs79NYW3dgscKCUX9sisD/E7hNJnU=; b=NZaFLWcw2YjEsysDzPsjNa72CD
	t5V9WIY7UAjSw0ZglT2ERh12me90hWIziQUlzEluZQnSwEQi2pxE6yMyDVEToZxpJY8+giA/RF7LJ
	pUHvIAYwcuS1V9kWdeiFIcrQrRGLdktrH7ul43khatb8PjwOv1XdsOIGx5WFFes0mI8Igvmfu1dMf
	JL/KEK5QD+DET7SLNDt5IKNX+ElEepmZFiEizmEk2z1ez09/baF6Dv4sSvqJnnkfYsCPpBTtTV2ud
	ta6wNNLU56qpAWpzO0j5FJr9OpLsv/X2Uu9w/aCQyfCXKXPZYdULXG2tEa3OBlBk0mXnR9dvAevae
	ihMmMcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbmz-0000000BW4E-2IAO;
	Fri, 02 Oct 2026 11:50:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbmx-0000000BW47-2K2r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9C7E411B1;
	Fri,  2 Oct 2026 11:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAD61F000FF;
	Fri,  2 Oct 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790941854;
	bh=TNIqItMeAufPumNs79NYW3dgscKCUX9sisD/E7hNJnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hv/cbbP/HIrtze3kRTnp+L1uL6mF8s/alL0s1lApvKA7IgNBrJTyWQ+ceCSyCrkwb
	 DQAMVzQPUjLNA032sGqDch+DQEbjLtYuKi2uthMbN5kLSdIQy+KtOrSYgkN0UpmiMa
	 59OBwQIBx2sMNgJrbn6yk9vUgmosutjbLskqMRbDecviaiXWT1rc/sq7ha1bNCkMgJ
	 lvUw8X/KV1/KvTDtriDODMPR2g/TSwFFqB8Hqb4W6jNzyVCEibDhip6WN6ac0+/Zrg
	 64Oik4Cbl9nLjO5kUJIq9yCeRhQ0XgLc+EZdGYO0gt32om8GZDm8iHJRANzbmMG9Ly
	 3NdDJJMcwKQ7A==
Date: Fri, 2 Oct 2026 12:50:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 08/15] KVM: arm64: Enforce EXLOCK for SPSR and ELR
Message-ID: <ar-UxijB8qEtp4DV@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-8-3556644cd927@kernel.org>
 <ar5thpZI5GiCfVRR@gremlin>
 <659cba01-3c53-4eb8-9124-7c62d266a64f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <659cba01-3c53-4eb8-9124-7c62d266a64f@sirena.org.uk>
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

On Thu, Oct 01, 2026 at 10:11:49PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 05:26:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Sep 30, 2026 at 10:48:18PM +0100, Mark Brown wrote:
> > > As per I_CFFNS and the pseudocode for the SPSR_ELx and ELR_ELx registers
> > > a GCS exception with ExType 1 is generated for attempts to write to
> > > those registers when both GCSCR_ELx.EXLOCKEN and PSTATE.EXLOCK are set.
>
> > From [4] I see I_CFFNS is defined as:
>
> > "When an MSR instruction would write to the relevant ELR_ELx or SPSR_ELx
> > for the current Exception level ELy, the Effective value of
> > GCSCR_ELy.EXLOCKEN and PSTATE.EXLOCK may prevent the write."
>
> > So the lock applies to writes to the current EL's own ELR/SPSR rather than
> > to any ELR_ELx/SPSR_ELx the current EL can write to?
>
> VHE and NV complicate things so "own" isn't just the same ELx, but my
> text above definitely oversimplifies too much and so is wrong.

It's all incredibly tricky and I felt my brain melting out of my head going
through the psuedocode/definition yesterday so it's understandable :)

>
> For example refering to the pseudocode for ELR_EL1 and SPSR_EL1 we see
> in the MSR handling:
>
>   elsif PSTATE.EL == EL2 then
>       if IsFeatureImplemented(FEAT_GCS) && GetCurrentEXLOCKEN() && !Halted() && PSTATE.EXLOCK == '1' && ELIsInHost(EL2) then
>           EXLOCKException();
>
> and note the use of ELx for ELR/SPSR and ELy for the current exception
> level and GCSCR in I_CFFNS (ie, ELx vs ELy).  My interpretation here is
> that the use of "the relevant" rather than just using ELx throughout is
> an effort to cover the complications resulting from VHE and NV.  With
> the above pseudocode writes to the EL1 register from EL2 are also
> covered when we're in host mode - the fact that we're in host mode makes
> the EL1 access relevant.

Yeah agreed.

>
> I'll reword what I've written in the commit log, like I say it's wrong.

Ack thanks!

>
> > So... TL;DR is, shouldn't this function look like:
> >
> > static inline bool sysregs_exlocked(struct kvm_vcpu *vcpu)
> > {
> > 	if (!kvm_has_gcs(vcpu->kvm))
> > 		return false;
> >
> > 	if (!(vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT))
> > 		return false;
> >
> > 	if (is_hyp_ctxt(vcpu))
> > 		return false;
> >
> > 	return vcpu_read_sys_reg(vcpu, GCSCR_EL1) & GCSCR_ELx_EXLOCKEN;
> > }
>
> I think so, but I'll check through again.

Thanks!

>
> The confusions you identified in the bit of your mail above this were
> the result of me doing some but on all of the simplifications.  I was
> trying to make things clearer by including some code that couldn't run
> so it was more obvious that things correspond to the pseudocode, but
> really that shouldn't have had any simplifications in it - we should
> either have all the simplifications or none of them.  I'll add more
> comments instead.

Yeah it's all very complicated, unfortunately I think, the psuedocode had me
stumped a lot when I was reading it...

Definitely agree on all-or-nothing. If we did go the 'all' route, then we'd
need to put in the ELIsInHost(EL2) conditional too
i.e. vcpu_el2_e2h_is_set() as well.

But I think simplifying that is also valid, as the resultant function above
is a lot easier to reason about and avoids people having to figure out that
certain bits are irrelevant (though comments could square that off too!)

>
> > > +	/*
> > > +	 * Note that the EXLOCKEN for the running EL is checked
> > > +	 * regardless of the register written to.
> > > +	 */
> >
> > This seems to contradict [4] - the register written to is what decides
> > whether the lock applies?
>
> [4] is section D11.4.1 of DDI0487 M.d, containing rule I_CFFNS discussed
> above.  My intent there is to express that if EXLOCK exceptions might be
> generated we check EXLOCKEN for the running EL, not one influenced by
> the written register.  Some combinations of register, EL and system
> state do not generate exceptions but those that do use the current EL's
> EXLOCKEN rather than an _ELx register using GCSCR_ELx.EXLOCKEN.

Yeah that's clear thanks!

IOW - the register/El/state decides _whether_ an exception can be raised,
the running EL's EXLOCKEN is what is consulted _when_ it can be raised.

--
Cheers, Lorenzo

