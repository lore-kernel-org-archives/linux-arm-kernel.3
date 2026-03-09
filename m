Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC4DF3C240
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31+F2gDlQ30tpZsEiu/KuHSKbC2gt2ssTB8/R/MXvmw=; b=MWEXDn7hG7m76xpR/M9ORh8yWy
	Kkv2kXjJJXFhoGAniM8Rinwc2HQCIe/XKo1t2IwjOQju26Pg7xTYp9M3LtHKAVwBACPcE+BoeBv2l
	ZxvHNFGbrZx4KClmfabjQpl4ZsClTYeCgtRuBpf//y/hd0oHsv+Zu4Z+oA5kXYDtFc/hbMHOuAwGN
	49y7quy1xoErJSv7EgrWxMCvUhXLLfFbzhoHofS4Sk78pS0ySCjdML+lQE8Qmi7Dcqf4WMnvTQ/g9
	DhsTt39kafqwaY8LpdA6BpOXcq/iqiz4DFNfxUHEZD3zTP+pl7KC42RVp/hqW6Q5eUhYSzT1jpAff
	mJuxd4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZTt-00000007I6n-0Ife;
	Mon, 09 Mar 2026 12:13:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZTp-00000007I6P-1aV0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:13:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63551516;
	Mon,  9 Mar 2026 05:12:51 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B3983F7BD;
	Mon,  9 Mar 2026 05:12:56 -0700 (PDT)
Date: Mon, 9 Mar 2026 12:12:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 1/4] arm64: tlb: Use __tlbi_sync_s1ish_kernel() for
 kernel TLB maintenance
Message-ID: <aa65QbpFfAcdqDaQ@J2N7QTR9R3>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-2-catalin.marinas@arm.com>
 <aabeUlR3QcBg7GmM@J2N7QTR9R3.cambridge.arm.com>
 <aaloumkRhnlu7gux@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaloumkRhnlu7gux@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_051301_543969_B9565978 
X-CRM114-Status: GOOD (  33.26  )
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

On Thu, Mar 05, 2026 at 11:27:54AM +0000, Catalin Marinas wrote:
> On Tue, Mar 03, 2026 at 01:12:50PM +0000, Mark Rutland wrote:
> > On Mon, Mar 02, 2026 at 04:57:54PM +0000, Catalin Marinas wrote:

> > > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > > index 1416e652612b..19be0f7bfca5 100644
> > > --- a/arch/arm64/include/asm/tlbflush.h
> > > +++ b/arch/arm64/include/asm/tlbflush.h
> > > @@ -191,6 +191,12 @@ static inline void __tlbi_sync_s1ish(void)
> > >  	__repeat_tlbi_sync(vale1is, 0);
> > >  }
> > >  
> > > +static inline void __tlbi_sync_s1ish_kernel(void)
> > > +{
> > > +	dsb(ish);
> > > +	__repeat_tlbi_sync(vale1is, 0);
> > > +}
> > > +
> > >  /*
> > >   * Complete broadcast TLB maintenance issued by hyp code which invalidates
> > >   * stage 1 translation information in any translation regime.
> > > @@ -299,7 +305,7 @@ static inline void flush_tlb_all(void)
> > >  {
> > >  	dsb(ishst);
> > >  	__tlbi(vmalle1is);
> > > -	__tlbi_sync_s1ish();
> > > +	__tlbi_sync_s1ish_kernel();
> > >  	isb();
> > >  }
> > 
> > The commit message is correct that flush_tlb_all() is only used for
> > kernel mappings today, via flush_tlb_kernel_range(), so this is safe.
> 
> Unfortunately, it's also used by the core code -
> hugetlb_vmemmap_restore_folios() (and another function in this file).

Sorry, I missed that.

AFAICT even with that it's only used for kernel mappings, though it's
not clear to me exactly what the xen balloon driver is doing.

> > However, the big comment block around line 200 says:
> > 
> > 	flush_tlb_all()
> > 		Invalidate the entire TLB (kernel + user) on all CPUs
> > 
> > ... and:
> > 
> > 	local_flush_tlb_all()
> > 		Same as flush_tlb_all(), but only applies to the calling CPU.
> > 
> > ... where the latter is used for user mappings (upon ASID overflow), so
> > I think there's some risk of future confusion.
> 
> Ignoring this erratum, the statements are still correct for arm64 as it
> flushes both kernel and user, though I see what you mean w.r.t. its
> intended use.

My concern was just in the presence of this erratum, since we skip the
workaround in flush_tlb_all() by calling __tlbi_sync_s1ish_kernel().

As below, I agree this doesn't need to change now.

> > To minimize the risk that flush_tlb_all() gets used for user mappings in
> > future, how about we rename flush_tlb_all() => flush_tlb_kernel_all(), and
> > update those comments:
> > 
> > 	flush_tlb_kernel_all()
> > 		Invalidate all kernel mappings on all CPUs.
> > 		Should not be used to invalidate user mappings.
> > 
> > 	local_flush_tlb_all()
> > 		Invalidate all (kernel + user) mappings on the calling CPU.
> > 
> > Note: I chose flush_tlb_kernel_all() rather than flush_tlb_all_kernel()
> > __flush_tlb_kernel_{pgtable,range}, with 'kernel' before the operation/scope.
> 
> I'm fine to update the comments but, for backporting, I'd not change the
> function name as it will have to touch core code. Ideally we should go
> around and change the other architectures to follow the same semantics
> (I briefly looked at x86 and powerpc and they also seem to use
> flush_tlb_all() only for kernel mappings).
> 
> So, I think it's better to do this cleanup separately ;).

That's fair enough, and my ack stands even without any changes.

Mark.

