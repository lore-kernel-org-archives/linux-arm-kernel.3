Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E05C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79wOhTiHIv836UiQ9THANpQa0X+qhaYPofZFKsXWsHs=; b=VUABUwhFsbTP+SVdB7Eu0mhMB6
	wUxJc682/j8DTtvRn/Rd6ewmkMQ6wE3/Pwdw95cT4AG7eEeJJDaKSrKwCcDNIj9GR5w7j1v/rsPgD
	XtG1hYjKA5LDkpkBFHFwSokwAP1fpQ531naLih9UzlOH63hNeCMhBPa2GaieCeM504is2OzN1mZ73
	1Kg1SektE2DOU1F3cfZdWDoa0RnYvfXhdLs6W5M2GjZyAQCVKYxwgJ8JgIz+7Q1aJThAmOmkK5V11
	rsPBq8bCrMWs1KLhFexAVdEfa+8NEhUeVDDXGQgASYX7qibOUthUfhodF8qyVJLvE5B6qAfW9It1t
	UIJUlvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79UB-0000000B79I-0ko2;
	Thu, 17 Sep 2026 10:36:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79U8-0000000B78Z-0MoK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1947C1476;
	Thu, 17 Sep 2026 03:36:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F8EB3FAA1;
	Thu, 17 Sep 2026 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789641413; bh=HFJCSpH6FLoOTK/OMrzkNYKid6wglsq3WkOL5d44zXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6ceyb1dKbKDTE5CusZ/Ez78cvFyWYSRzt51rGQj21EJGMTXwtEoWVwN+MKWmPxAa
	 +i6+l/BOQYpzJKhugeyBhipf5dPVdu+voBzZNIuWyAf6B9teCVjp56PmIpVl/d0D1x
	 WU7VtqOhSd0OYneIlsRPF1fDHFjVDDdly5Kq3OU4=
Date: Thu, 17 Sep 2026 11:36:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <aqvCwM_73qMpqzvV@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <aqrGPK0lFBFXL2qY@arm.com>
 <985520fa-99b0-4620-bfee-8e6321b36104@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985520fa-99b0-4620-bfee-8e6321b36104@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_033656_215982_3D903A3C 
X-CRM114-Status: GOOD (  28.80  )
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

Hi Suzuki,

On Thu, Sep 17, 2026 at 10:03:14AM +0100, Suzuki K Poulose wrote:
> On 16/09/2026 17:39, Catalin Marinas wrote:
> > On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > index 75c3e463df2ef..dc3a87902a60c 100644
> > > --- a/arch/arm64/mm/fault.c
> > > +++ b/arch/arm64/mm/fault.c
> > > @@ -914,6 +914,24 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
> > >   	return 0;
> > >   }
> > > +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > +{
> > > +	const struct fault_info *inf = esr_to_fault_info(esr);
> > > +	unsigned long addr = untagged_addr(far);
> > > +
> > > +	die_kernel_fault(inf->name, addr, esr, regs);
> > > +	return 0;
> > > +}
> > > +
> > > +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > +{
> > > +	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
> > > +	    fixup_exception(regs, esr))
> > > +		return 0;
> > > +
> > > +	return 1;
> > > +}
> > 
> > We discussed briefly offline. With the latest patches around, would we
> > ever end up with private memory mapped in the VMM and hence the GPF? If
> > not, I would still keep this handling but add a
> > WARN_ON_ONCE(user_mode(regs)).
> > 
> > However, can we end up delegating a non-guest_memfd memslot page as
> > protected?
> > 
> > I played a bit with codex and it reckons it's possible if a guest_memfd
> > memslot is deleted after its IPA range has been initialised with
> > RIPAS=RAM. Removing the memslot unmaps and undelegates any data pages
> > but leaves the RMM state as RAM. The VMM can then install an ordinary
> > memslot over the same GPA range.
> 
> This should be prevented by the following predicates:
> 
> 1) Realms only support guest_memfd backed memslots for mappable memory.
> 2) Memslots cannot be created after the Realm is created, as is with the
> protected VMs. (This check seems to have been lost over the iterations,
>  but should be reinstated).

If that's the intended model, I think it should work. But v18 doesn't
enforce either of them. I noticed the second predicate for pKVM only -
your 'Widen the scope of "protected" VMs' patch makes this restriction
explicit to pKVM.

For the first one, if !kvm_slot_has_gmem(), it simply continues with the
registration.

> > A subsequent private-IPA S2 fault sees the non-guest_memfd slot, takes
> > user_mem_abort(), GUPs the user page and passes it to
> > realm_map_protected(). The userspace mapping remains present, so a later
> > EL0 access can generate a GPF.
> 
> The Realm mem abort code should prevent this by ensuring that the
> memslot is backed by gmem for private_faults. With the mandate of
> in-place conversion, even the shared pages must come from the
> gmem backed memslots.

IIUC this only works if the memslot is gmem but I can't see what
prevents ordinary slots from being assigned to realms. I think we can
enter the user_mem_abort() -> realm_map_ipa() for ordinary slots unless
we prevent the deletion of the original slots and enforce gmem only
slots early.

-- 
Catalin

