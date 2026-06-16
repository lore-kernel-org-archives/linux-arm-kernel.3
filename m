Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7459CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 06:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byQu1Tk3MXMGbqyZ6J7Cc8mUP19MIC/JQ6rKwB/blok=; b=Ntm+6kVcCHOxN5uDBAZVCtrMEf
	jv24k6y8PQNcZKIOp/bje4Boypu1t8mYhokyMRNXSti6E9LQiznfFVBnCmYh73seWTxuhP2V0mEP9
	7fRq8C6IUTGK2ajvrDWxzORV0v8YVhiebs1SR6xzZxrEFkoOw2MLT0jF0WyAElpImcXloZwcRWLQA
	3xZ3RczhYCOREF7pyvcbrDqTeENEnINuudNAGgJ20mtUSeY8Ji3vO0vbaIkW2qXC06N2hTizUPcNq
	dXdYF1e/3+JLc/feSmqgThehjY1WJBhYXKnQ4D4ZaQIcLUdT75nt9BNRA15rEN1oWuIJYbA2IE9Wq
	Otzr3DWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZN3C-0000000FIsk-04d0;
	Tue, 16 Jun 2026 06:13:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZN37-0000000FIr7-3VUr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 06:13:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C3B1A25;
	Mon, 15 Jun 2026 23:13:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B49CF3F915;
	Mon, 15 Jun 2026 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781590403; bh=exst6UNP21nLNsBJWnmpOUh16QRNJ3gQ5GYP670UxIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzALwveidHDsEbArVnisKQZ3yaixccqQmiUQh3STPwxjLqhCecxAP+ZevZwqvgRHU
	 UvtAC6KOwm3o6BoIqw02MNkzCN/fPxrJdmPDkrgoynqcjlnDDSHVqE7JLMz24hbrW3
	 l8De9EYtRrR/OzTf0fOg/cDl/H3pCPAWGDG9kn0U=
Date: Tue, 16 Jun 2026 07:13:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajDpc1-c2_zhycr6@J2N7QTR9R3>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <ai_yj7GA_q1hD9cr@J2N7QTR9R3.cambridge.arm.com>
 <ajAPxKUTp66IRMMF@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAPxKUTp66IRMMF@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_231326_055140_2D1FB9BA 
X-CRM114-Status: GOOD (  37.49  )
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

On Mon, Jun 15, 2026 at 03:44:20PM +0100, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 01:39:43PM +0100, Mark Rutland wrote:
> > On Sun, Jun 14, 2026 at 12:04:44PM +0100, Will Deacon wrote:
> > > On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> > 
> > > >  static inline void flush_tlb_mm(struct mm_struct *mm)
> > > >  {
> > > >  	unsigned long asid;
> > > > +	bool local;
> > > >  
> > > > -	dsb(ishst);
> > > > +	local = flush_tlb_user_pre(mm, TLBF_NONE);
> > > >  	asid = __TLBI_VADDR(0, ASID(mm));
> > > > -	__tlbi(aside1is, asid);
> > > > -	__tlbi_user(aside1is, asid);
> > > > -	__tlbi_sync_s1ish(mm);
> > > > +	if (local) {
> > > > +		__tlbi(aside1, asid);
> > > > +		__tlbi_user(aside1, asid);
> > > > +		dsb(nsh);
> > > > +	} else {
> > > > +		__tlbi(aside1is, asid);
> > > > +		__tlbi_user(aside1is, asid);
> > > > +		__tlbi_sync_s1ish(mm);
> > > > +	}
> > > > +	flush_tlb_user_post(local);
> > > 
> > > I think you've changed this since Ryan's original patch, but why are you
> > > only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
> > > the erratum workaround when running as a VM if the vCPU is migrated?
> > 
> > The errata mitigated by __tlbi_sync_s1ish() only affect broadcast
> > maintenance (the 'ish' in the name was intended to convey that). No
> > workaround is necessary for local TLB maintenance; aside from anything
> > else, when some PE executes the DSB to complete the maintenance, that
> > DSB alone is sufficient to complete memory accesses made by that PE.
> > 
> > If it would make things clearer, we could add a __tlbi_sync_s1nsh()
> > helper for the local case, which would boil down to a DSB NSH.
> 
> No, I don't think that's what I'm concerned about.

I *think* you're missing the shape of the errata; more on that below.

> > Regardless of the erratum, to correctly handle a vCPU being migrated
> > from pCPU-x to pCPU-y, we rely on:
> > 
> > * The host to set HCR_EL2.FB to ensure that TLB maintenance is
> >   broadcast to the ISH domain.
> > 
> > * The host to set HCR_EL2.BSU to ensure the DSB is upgrade to ISH such
> >   that any guest-issued DSB NSH will it can complete any TLB maintenance
> >   that was upgraded to ISH.
> > 
> > * The host to issue a DSB ISH on pCPU-x before the vCPU can run on
> >   pCPU-y, to complete any outstanding maintenance that was issued on
> >   pCPU-x. IIUC a DSB ISH on pCPU-y is not architecturally sufficient; it
> >   must be executed on the same CPU which issued the TLB maintenance.
> > 
> > ... but as above, all of that should be independent of any of the errata
> > that require the workaround.
> 
> Yes, I understand all of the above but the case I'm struggling with is
> where a vCPU runs on a system that needs the TLB invalidation to be
> performed twice. For non-broadcast invalidation (from the guest
> perspective), this patch will mean that it only performs the
> invalidation once. So if the vCPU migrates to another physical CPU, can
> that effectively undo the HCR_EL2.FB upgrade unless KVM issues TLB
> invalidation as well as a DSB on migration?
> 
> Maybe I'm missing something, as it looks like upstream already elides
> the call to __tlbi_sync_s1ish() for the NOBROADCAST case.

The key thing is that these errata only affect the completion of memory
accesses, and only those accesses made by other (physical) PEs.

A single TLBI will correctly remove the actual TLB entries, and
HCR_EL2.{FB,BSU} will still ensure that TLB entries are removed from the
TLBs of other PEs.

The errata only prevent completion of memory accesses made on other
(physical) PEs, and:

* For accesses made by the vCPU which is issuing the TLBI(s):

  - Regardless of the errata, the hypervisor has to ensure that when a
    vCPU is migrated from pCPU-x to pCPU-y, any prior CMOs or TLBIs are
    completed, which requires the host to execute a DSB ISH on pCPU-x
    before the vCPU can be run on pCPU-y.

    Maybe we have a latent bug here?

  - Within the context of the vCPU thread, a DSB {NSH,ISH,OSH} will
    complete all prior accesses made by the vCPU *regardless* of any TLB
    invalidation.

* For accesses made by *other* vCPUs, either:

  - Software in the VM intended to complete concurrency accesses made by
    other vCPUs. In which case, regardless of the errata, using a local
    TLBI alone is a software bug since that's not guaranteed to affect
    other PEs.

  - Software did not intend to complete accesses made by other vCPUs.
    In which case, it's fine that they may have uncompleted accesses.

... but maybe I'm still missing your concern?

Mark.

