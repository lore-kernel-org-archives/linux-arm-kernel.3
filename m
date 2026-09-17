Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA6C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 04:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1raU+CaqI1GLp8zDPqWDq7KLcJI6Jq0QHu92NyCig0=; b=Bf4z1V0luXHfvipp6PrwcU6b66
	53YIAYrwt2Av9czA+kQNFfKf+Ysb3S4Uzcu6ccy6/bXNcBigt9k/Oa2pc0Pl7Y/evUzJsp1JLAtX9
	cZTplHsQT37zM/e4DBWgSuyGUqu9Rx9esPrxVeVfWZtuSHbObOvWoxb0UrHP2MtsNw3BCD6DrNjcY
	DrE9giuZEZsHpJ1s4DuP/54YyUJ2lyTkuum2IwBd4WoPofqmf8GbCBvln6US2bmIugLAAx+459jxw
	YNP2O9CE4TfBTrV5n+8KSiFJQHUnlHZrChnoIl71qA2/xjv3ZN+n+vRg4QyTZ7kbknHBHjCeBNalM
	ncoGZhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73aM-0000000AYuh-3KTI;
	Thu, 17 Sep 2026 04:18:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73aJ-0000000AYuK-2yEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 04:18:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685F61476;
	Wed, 16 Sep 2026 21:18:49 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B8FD3F882;
	Wed, 16 Sep 2026 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789618733; bh=qX2pKJSt+jbXVDMn1VIn5tjWN9rlhtAz20MEdFpS9BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obxnpRuDgn1BP2nOU1Vovtq9joyGzBs6NtdCxr476bPAgUJ6iu0l89qcfyFvS4bd9
	 8TKZ3sYcFvvmnBZpnmEwKRMjkMvnjgEyRSJAQ5ab7vP0JwXmReJbkqQFnPSGSqgj6Q
	 eZbJAQH7mV04PfWF029nyZb7q7W2JBXHLc9gNeNY=
Date: Thu, 17 Sep 2026 09:48:49 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 04/14] arm64/mm: Route all pgtable atomics to central
 helpers
Message-ID: <vuetqfctrtbm5e7ay7owffyqkoopeqaxlle37uu5byhf5oeu7k@aplgoj4fijip>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-5-anshuman.khandual@arm.com>
 <ef85271a-a1a3-4b9b-8c99-c1f871a13c6b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef85271a-a1a3-4b9b-8c99-c1f871a13c6b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_211855_791545_B436F644 
X-CRM114-Status: GOOD (  17.16  )
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

On Wed, Sep 16, 2026 at 03:39:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Route all cmpxchg() operations performed on various page table entries to a
> > new ptval_cmpxchg_relaxed() helper. Similarly route all xchg() operations
> > performed on page table entries to a new ptval_xchg_relaxed() helper.
> > 
> > Currently these helpers just forward to the same APIs that were previously
> > called direct, but in future we will change the routing for D128 which is
> > too long to use the standard APIs.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> 
> [...]
> 
> >  	case PAGE_SIZE:
> > @@ -1400,7 +1411,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
> >  	do {
> >  		old_pte = pte;
> >  		pte = pte_wrprotect(pte);
> > -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> > +		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
> >  					       pte_val(old_pte), pte_val(pte));
> 
> Indentation goes out of sync here.
> 
> >  	} while (pte_val(pte) != pte_val(old_pte));
> >  }
> > @@ -1438,7 +1449,7 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
> >  		if (flags & CYDP_CLEAR_DIRTY)
> >  			pte = pte_mkclean(pte);
> >  
> > -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> > +		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
> >  					       pte_val(old_pte), pte_val(pte));
> 
> Same here

OK - will fix the alignment on both the above instances.

> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David

