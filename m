Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6257B1067040
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE75C+IEg2r5mqM/kB2MdkT+7U9DaKyhnoTn/TJC2qw=; b=z8/1wshP25qgyWu5G95fPYlix2
	O+yXXWH5zy9b6XUP8K9e60yNIvmep/VmsguDBKfVXR9AAV2Ksll7qOoD50DpNSqMUkB2UIMq9I6po
	fkIMWUsgRc7WhyIfWeD2s9QkjJq2BgRnvK8Imz4N7IIyt+hVB7hMohhIk3q8E6GZHwfToIlRIBBqn
	1PChEUtD3XwgxCyRuuk6vH6myQGYc/i6NYOmn+L6ahVhRGNhrYeq4M2tKyGV9lno/LjBCJDeuyELJ
	1KqhxSEiv/Sa3jVDIhIVXPpBdHDL5patY3jdWCF5GM8/Jm2GslL+wCEcisYZP3+al1d5HpgZOQ1KJ
	DybMj9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hWY-0000000EHYU-0iyZ;
	Thu, 12 Mar 2026 15:00:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hWJ-0000000EHQ6-42sh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0F2260054;
	Thu, 12 Mar 2026 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8657EC4CEF7;
	Thu, 12 Mar 2026 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327614;
	bh=Bvfj4M9wOZN26ZrO1w2x3U/CjU3/U2blXyrROwg1/O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stHalg5tN/tCQTqK8QkAQG1G+kp8irbCf9x/WO4Tbgwwc/6SzIM8e6OxrMJ789Btl
	 LJ9d1wosZ0fK82Vf0aK7/qFf2n7iRSCCTckD7Mb2+NI1JSXKpKMiiIkoamC4+PgqU+
	 HU653idYS5q4YiYdFt1Tbf94nfTyXnnHum9JyaPhI2/HV5ybJ5prVbTiAf4FcEZDxt
	 F0fd4rcsIKoYyJlYB2lVM6ITYOldwb30vamCZaY7oUfpdKEelYCxbM0BoTqAduG6qF
	 51OAhPZIyHL+WE25B9gOpYRnU2NZ4BaOvOEXn1AegLW/l2ffjBmHclblvkr2FBSNXJ
	 i6taa5Z5WthwA==
Date: Thu, 12 Mar 2026 15:00:09 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/4] arm64: tlb: Pass the corresponding mm to
 __tlbi_sync_s1ish()
Message-ID: <abLU-cJLxgdpJ9C4@willie-the-truck>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-3-catalin.marinas@arm.com>
 <aamULrOkm8jd_9UY@willie-the-truck>
 <aanXM7YWMAJW6qk7@arm.com>
 <aaq3Vun0ZSSdXyXV@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaq3Vun0ZSSdXyXV@arm.com>
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

On Fri, Mar 06, 2026 at 11:15:34AM +0000, Catalin Marinas wrote:
> On Thu, Mar 05, 2026 at 07:19:15PM +0000, Catalin Marinas wrote:
> > On Thu, Mar 05, 2026 at 02:33:18PM +0000, Will Deacon wrote:
> > > On Mon, Mar 02, 2026 at 04:57:55PM +0000, Catalin Marinas wrote:
> > > > @@ -391,7 +391,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > > >   */
> > > >  static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > > >  {
> > > > -	__tlbi_sync_s1ish();
> > > > +	__tlbi_sync_s1ish(NULL);
> > > 
> > > Hmm, it seems a bit rubbish to pass NULL here as that means that we'll
> > > deploy the mitigation regardless of the mm flags when finishing the
> > > batch.
> > > 
> > > It also looks like we could end up doing the workaround multiple times
> > > if arch_tlbbatch_add_pending() is passed a large enough region that we
> > > call __flush_tlb_range_limit_excess() fires.
> > > 
> > > So perhaps we should stash the mm in 'struct arch_tlbflush_unmap_batch'
> > > alongside some state to track whether or not we have uncompleted TLB
> > > maintenance in flight?
> > 
> > The problem is that arch_tlbbatch_flush() can be called to synchronise
> > multiple mm structures that were touched by TTU. We can't have the mm in
> > arch_tlbflush_unmap_batch. But we can track if any of the mms had
> > MMCF_SME_DVMSYNC flag set, something like below (needs testing, tidying
> > up). TBH, I did not notice any problem in benchmarking as I guess we
> > haven't exercised the TTU path much, so did not bother to optimise it.
> > 
> > For the TTU case, I don't think we need to worry about the excess limit
> > and doing the IPI twice. But I'll double check the code paths tomorrow.
> > 
> > diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
> > index fedb0b87b8db..e756eaca6cb8 100644
> > --- a/arch/arm64/include/asm/tlbbatch.h
> > +++ b/arch/arm64/include/asm/tlbbatch.h
> > @@ -7,6 +7,8 @@ struct arch_tlbflush_unmap_batch {
> >  	 * For arm64, HW can do tlb shootdown, so we don't
> >  	 * need to record cpumask for sending IPI
> >  	 */
> > +
> > +	bool sme_dvmsync;
> >  };
> > 
> >  #endif /* _ARCH_ARM64_TLBBATCH_H */
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index e3ea0246a4f4..c1141a684854 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -201,10 +201,15 @@ do {										\
> >   * Complete broadcast TLB maintenance issued by the host which invalidates
> >   * stage 1 information in the host's own translation regime.
> >   */
> > -static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
> > +static inline void __tlbi_sync_s1ish_no_sme_dvmsync(void)
> >  {
> >  	dsb(ish);
> >  	__repeat_tlbi_sync(vale1is, 0);
> > +}
> > +
> > +static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
> > +{
> > +	__tlbi_sync_s1ish_no_sme_dvmsync();
> >  	sme_dvmsync(mm);
> >  }
> > 
> > @@ -408,7 +413,11 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >   */
> >  static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> >  {
> > -	__tlbi_sync_s1ish(NULL);
> > +	__tlbi_sync_s1ish_no_sme_dvmsync();
> > +	if (batch->sme_dvmsync) {
> > +		batch->sme_dvmsync = false;
> > +		sme_dvmsync(NULL);
> > +	}
> >  }
> > 
> >  /*
> > @@ -613,6 +622,8 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
> >  		struct mm_struct *mm, unsigned long start, unsigned long end)
> >  {
> >  	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
> > +	if (test_bit(ilog2(MMCF_SME_DVMSYNC), &mm->context.flags))
> > +		batch->sme_dvmsync = true;
> >  }
> 
> While writing a reply to your other comments, I realised why this
> wouldn't work (I had something similar but dropped it) - we can have the
> flag cleared here (or mm_cpumask() if we are to track per-mm) but we
> have not issued the DVMSync yet. The task may start using SME before
> arch_tlbbatch_flush() and we just missed it. Any checks on whether to
> issue the IPI like reading flags needs to be after the DVMSync.

Ah, yeah. I wonder if it's worth detecting the change of mm in
arch_tlbbatch_add_pending() and then pro-actively doing the DSB on CPUs
with the erratum? I suppose it depends on how often SME is being used.

Will

