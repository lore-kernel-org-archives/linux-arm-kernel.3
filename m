Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C80DCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXacauNp8DBtcKKLQk+F2y+eDDeMTpyGi8C4OOfHboY=; b=kGDgwvI4u9kJzj2LQttCI6Ry4f
	/8FJjrJmxDNLBkS75/rikXsRN9YwCOmp6v8e/IL/Rcp0Dt6Sex805Rc2AbSnOxLPecRVMyOoq8XGd
	Y33Fjkv+v5LlCpfHRK43FzHk/1Vrv4OMoXTqMFZj6NS0olJdDtbtG7a1kZMdfUwmOWtI6pgwrSiVp
	PGck7r5ny0dM0+yt5cEnLBMwpf1DS9WJqO+KqyqtDM7/2wzz5CmiaSzHvm6kt9HbFeeacRVRYDrtf
	Nouj/5QkyheG8tggoOg2OKuyfnEzuYWFkv0LO3gs4hVUo8jDs8PZEM+wnkQAZ5jJqq2omYXtrW09a
	wiHrym9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8Y7-0000000ERDU-3PbF;
	Mon, 15 Jun 2026 14:44:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8Y6-0000000ERCS-1L0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:44:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF520601E7;
	Mon, 15 Jun 2026 14:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA241F00A3A;
	Mon, 15 Jun 2026 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534665;
	bh=gXacauNp8DBtcKKLQk+F2y+eDDeMTpyGi8C4OOfHboY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqfRPOzJRRETlXjTHwoJ0LVllinpBVW3M3PmcS7bcQc/SdgdrBjvGWLXVB1gHLw0H
	 8MMNUdbrkpA6X26GwElWrco77BWp+BlABMZ9+DikwvpTT73sovc/+ukR1xXgnigS3N
	 qVd4HCgEeVnKvTHuzfEa4m5HGyk9TW5Lvmcz/r4i4veVLCM4o5UkdByyt0wRb6Dyj8
	 A5NcS7GsfVU6Rp2eqIk4cmeD8T8V65/nQTiKcICMVUjW3Wu4ZL0zLFpCRle2nC7qge
	 XG6WYCAXlv1N5YFnYtRv62tk3iex2Nyk/ORvR/wqSRze+Km5Iv2l3onJzFSX+5Ks22
	 ExwXYWuAnRHcw==
Date: Mon, 15 Jun 2026 15:44:20 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <ajAPxKUTp66IRMMF@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <ai_yj7GA_q1hD9cr@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_yj7GA_q1hD9cr@J2N7QTR9R3.cambridge.arm.com>
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

On Mon, Jun 15, 2026 at 01:39:43PM +0100, Mark Rutland wrote:
> On Sun, Jun 14, 2026 at 12:04:44PM +0100, Will Deacon wrote:
> > On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> 
> > >  static inline void flush_tlb_mm(struct mm_struct *mm)
> > >  {
> > >  	unsigned long asid;
> > > +	bool local;
> > >  
> > > -	dsb(ishst);
> > > +	local = flush_tlb_user_pre(mm, TLBF_NONE);
> > >  	asid = __TLBI_VADDR(0, ASID(mm));
> > > -	__tlbi(aside1is, asid);
> > > -	__tlbi_user(aside1is, asid);
> > > -	__tlbi_sync_s1ish(mm);
> > > +	if (local) {
> > > +		__tlbi(aside1, asid);
> > > +		__tlbi_user(aside1, asid);
> > > +		dsb(nsh);
> > > +	} else {
> > > +		__tlbi(aside1is, asid);
> > > +		__tlbi_user(aside1is, asid);
> > > +		__tlbi_sync_s1ish(mm);
> > > +	}
> > > +	flush_tlb_user_post(local);
> > 
> > I think you've changed this since Ryan's original patch, but why are you
> > only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
> > the erratum workaround when running as a VM if the vCPU is migrated?
> 
> The errata mitigated by __tlbi_sync_s1ish() only affect broadcast
> maintenance (the 'ish' in the name was intended to convey that). No
> workaround is necessary for local TLB maintenance; aside from anything
> else, when some PE executes the DSB to complete the maintenance, that
> DSB alone is sufficient to complete memory accesses made by that PE.
> 
> If it would make things clearer, we could add a __tlbi_sync_s1nsh()
> helper for the local case, which would boil down to a DSB NSH.

No, I don't think that's what I'm concerned about.

> Regardless of the erratum, to correctly handle a vCPU being migrated
> from pCPU-x to pCPU-y, we rely on:
> 
> * The host to set HCR_EL2.FB to ensure that TLB maintenance is
>   broadcast to the ISH domain.
> 
> * The host to set HCR_EL2.BSU to ensure the DSB is upgrade to ISH such
>   that any guest-issued DSB NSH will it can complete any TLB maintenance
>   that was upgraded to ISH.
> 
> * The host to issue a DSB ISH on pCPU-x before the vCPU can run on
>   pCPU-y, to complete any outstanding maintenance that was issued on
>   pCPU-x. IIUC a DSB ISH on pCPU-y is not architecturally sufficient; it
>   must be executed on the same CPU which issued the TLB maintenance.
> 
> ... but as above, all of that should be independent of any of the errata
> that require the workaround.

Yes, I understand all of the above but the case I'm struggling with is
where a vCPU runs on a system that needs the TLB invalidation to be
performed twice. For non-broadcast invalidation (from the guest
perspective), this patch will mean that it only performs the
invalidation once. So if the vCPU migrates to another physical CPU, can
that effectively undo the HCR_EL2.FB upgrade unless KVM issues TLB
invalidation as well as a DSB on migration?

Maybe I'm missing something, as it looks like upstream already elides
the call to __tlbi_sync_s1ish() for the NOBROADCAST case.

Will

