Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B979F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvAS0SAYBwTnSG6I7oe2XtFU4ro4P/wdqQ4dE06w1WY=; b=06EJlCuxesbZSZoI0fV5HDk2vP
	tEqIzZ0zGceZ7lxNKVuxWa1lF2ExY6hyn9S0mFwtWUdpaufbCj0haTTEDT6DZ8FYYGUs/eB7rpJol
	6voxov1inXLO+uk8Jqq0Z3tsWjW3e4ea3iFZLR/OISKFXGLuZ4uTewKI6RdDWWZQdUVyj+CHbP0kv
	qreZsaBl+8Lx7I8e0xrvCUMAvAxUiAkKbKAl2eMwZ3L+P9z4tT9Q6qZh5MOdtdDtNCgxKwCt24733
	FL5OZLH+u2ZWskKB4SBCCVJHkcWPNmCinxC9ubNAQXgZHU0G0dkEco13p6k3/qBUrRoZRkFEAvRbo
	2tOgMppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6sA-00000001gCf-1EUt;
	Thu, 05 Mar 2026 11:28:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6s7-00000001gBk-1qVz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:28:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F74E339;
	Thu,  5 Mar 2026 03:27:52 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 714873F836;
	Thu,  5 Mar 2026 03:27:57 -0800 (PST)
Date: Thu, 5 Mar 2026 11:27:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 1/4] arm64: tlb: Use __tlbi_sync_s1ish_kernel() for
 kernel TLB maintenance
Message-ID: <aaloumkRhnlu7gux@arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-2-catalin.marinas@arm.com>
 <aabeUlR3QcBg7GmM@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aabeUlR3QcBg7GmM@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_032803_620575_9EE292E0 
X-CRM114-Status: GOOD (  31.46  )
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

On Tue, Mar 03, 2026 at 01:12:50PM +0000, Mark Rutland wrote:
> On Mon, Mar 02, 2026 at 04:57:54PM +0000, Catalin Marinas wrote:
> > Add __tlbi_sync_s1ish_kernel() similar to __tlbi_sync_s1ish() and use it
> > for kernel TLB maintenance. Also use this function in flush_tlb_all()
> > which is only used in relation to kernel mappings. Subsequent patches
> > can differentiate between workarounds that apply to user only or both
> > user and kernel.
> > 
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> 
> This looks fine to me. I have one minor comment/naming nit below, but
> this looks functionally correct, and I'm happy to spin a follow-up for
> that.
> 
> With or without the changes below:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks Mark.

> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > index 1416e652612b..19be0f7bfca5 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -191,6 +191,12 @@ static inline void __tlbi_sync_s1ish(void)
> >  	__repeat_tlbi_sync(vale1is, 0);
> >  }
> >  
> > +static inline void __tlbi_sync_s1ish_kernel(void)
> > +{
> > +	dsb(ish);
> > +	__repeat_tlbi_sync(vale1is, 0);
> > +}
> > +
> >  /*
> >   * Complete broadcast TLB maintenance issued by hyp code which invalidates
> >   * stage 1 translation information in any translation regime.
> > @@ -299,7 +305,7 @@ static inline void flush_tlb_all(void)
> >  {
> >  	dsb(ishst);
> >  	__tlbi(vmalle1is);
> > -	__tlbi_sync_s1ish();
> > +	__tlbi_sync_s1ish_kernel();
> >  	isb();
> >  }
> 
> The commit message is correct that flush_tlb_all() is only used for
> kernel mappings today, via flush_tlb_kernel_range(), so this is safe.

Unfortunately, it's also used by the core code -
hugetlb_vmemmap_restore_folios() (and another function in this file).

> However, the big comment block around line 200 says:
> 
> 	flush_tlb_all()
> 		Invalidate the entire TLB (kernel + user) on all CPUs
> 
> ... and:
> 
> 	local_flush_tlb_all()
> 		Same as flush_tlb_all(), but only applies to the calling CPU.
> 
> ... where the latter is used for user mappings (upon ASID overflow), so
> I think there's some risk of future confusion.

Ignoring this erratum, the statements are still correct for arm64 as it
flushes both kernel and user, though I see what you mean w.r.t. its
intended use.

> To minimize the risk that flush_tlb_all() gets used for user mappings in
> future, how about we rename flush_tlb_all() => flush_tlb_kernel_all(), and
> update those comments:
> 
> 	flush_tlb_kernel_all()
> 		Invalidate all kernel mappings on all CPUs.
> 		Should not be used to invalidate user mappings.
> 
> 	local_flush_tlb_all()
> 		Invalidate all (kernel + user) mappings on the calling CPU.
> 
> Note: I chose flush_tlb_kernel_all() rather than flush_tlb_all_kernel()
> __flush_tlb_kernel_{pgtable,range}, with 'kernel' before the operation/scope.

I'm fine to update the comments but, for backporting, I'd not change the
function name as it will have to touch core code. Ideally we should go
around and change the other architectures to follow the same semantics
(I briefly looked at x86 and powerpc and they also seem to use
flush_tlb_all() only for kernel mappings).

So, I think it's better to do this cleanup separately ;).

-- 
Catalin

