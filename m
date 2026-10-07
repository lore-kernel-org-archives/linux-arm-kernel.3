Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2019ACA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 02:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eVl9lZHm9sVTf50aIP8REHCgGFCjCWE1HzF4LMsxFY=; b=F90Y8HPvtBttZAydCoLDo2QRhx
	SPC+gMOH7hjqBk+VtFLQfczanxPchNr6KV0hiBEW8PgNS5nZOn2yboAqIDBsuI03jN6Q1SLoWFrH/
	n6z4Qk/1ukYX2hX64GnOxHrrvp0HLmVdJnlrN5k4+qbTXtHGNtuOTn3D/EmSCF89JEwpowzmFnIBL
	VKa8aBErAe0k9rV7Yl+5ePv5eUYdr+RlybqFl3PdhSEzIphT3qAX9Ydt04Oo6vroNAjKGY1CM3mQZ
	TK1VN/0KwEYD9jDO0UCU0D4J3VhxKRLXRqpyPObzfouaNw2sxwY33oSl/r/xWvY6Q6IqPbR3Qc6B6
	O3pHocEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEHbW-00000001eV5-3VMo;
	Wed, 07 Oct 2026 02:42:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEHbT-00000001eUg-2WFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 02:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136BF152B;
	Tue,  6 Oct 2026 19:41:52 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0AB63F86F;
	Tue,  6 Oct 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791340915; bh=s760qSaiBVVuc/LlAknuKVghmlM0TMznspZHDm1DREY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aw1QVinr2aO2c2FZnGj7T7Kqjx9TOzGUooCiuw2agzb1q4f/FKMKf13h2fkYMtblQ
	 MBrdedFXgG4ie9YnrLy1Nkc8/1quegvgmIIJkrQ5/A/44y3he0uM8VSA20x9PXwziZ
	 PwAKmcDr6d3jYWiZhWfNFUOp2n0arCI2kMqgP0Ww=
Date: Wed, 7 Oct 2026 08:11:52 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com
Subject: Re: [PATCH V3 1/4] arm64/mm: Use pmdp_get() for PMD accesses
Message-ID: <lqjq64vw6mlm27kp6ffms6auerj67avecc4ongedouumsrspjh@2f2eblm7wi4u>
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
 <20260924062214.1635078-2-anshuman.khandual@arm.com>
 <asPCv5Icdm7Z9mWF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asPCv5Icdm7Z9mWF@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_194159_781914_7FF0427C 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, Oct 05, 2026 at 04:31:28PM +0100, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 11:52:11AM +0530, Anshuman Khandual wrote:
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 763c5a411d64..9ad2d03e86ad 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -84,6 +84,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
> >  	arch_flush_lazy_mmu_mode();
> >  }
> >  
> > +#define pmdp_get pmdp_get
> > +static inline pmd_t pmdp_get(pmd_t *pmdp)
> > +{
> > +	return READ_ONCE(*pmdp);
> > +}
> 
> This is the same as the generic version. Does it need redefining?

Without this pmdp_get() override, replacing READ_ONCE() in pmdp_test_and_clear_young()
with pmdp_get() causes a build failure as pmpd_get() which is defined in the generic
pgtable header is not visible from inside platform specific pgtable header, even with
a forward declaration.

Earlier had moved pmdp_test_and_clear_young() inside arch/arm64/mm/mmu.c to avoid the
above described dependency problem. But then realised that pmdp_get() gets eventually
overridden on arm64 platform for D128, why not just redefine here it now as standard
READ_ONCE() to avoid the current build problem and the code movement.

Please find some context here from earlier discussions during V2.

https://lore.kernel.org/all/212067fe-1b16-4b87-87a7-4ce50847eb24@arm.com/

> 
> > +
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >  
> > @@ -811,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> >  }
> >  
> >  /* Find an entry in the third-level page table. */
> > -#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
> > +#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
> > +					 pte_index(addr) * sizeof(pte_t))
> 
> Why not make this change in the generic version?

Could you please elaborate on this ? pte_offset_phys() is arm64 specific helper which
is also local to this header file. AFAICT there is no generic version for this helper.

> 
> -- 
> Catalin

