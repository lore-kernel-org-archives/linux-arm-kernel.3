Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A220C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TuIAy7R2R+vWDnEH5tOb3LwFoYJyYluhSYrJLbDs80=; b=u7vHWiAub6FjhAUeYwLkHbmayh
	hqfRzrKojmc24MV90C1Ua0UltJ4Mf5tkhV+O3jZJaeH0KpxrGrCdt9TDFQn+aI2x/ZiAoKqomcHIE
	stFxXAl2Afanhxmjl7qPo0SkpO6WXsymEOoJaA8TqTCz4IZD0KX2tuQhtIX689aj/SrP63j8o3ux/
	v4RroGqEdaMUX+hUvB2ILR8m0pr4qoeO2j/ep8VUyPjDXoXgBvyW7ipMKCuZTZYBZeQ0wVffia9h2
	ZbawuqClpW3D72yvzFu7A3GhnmrkVUxHUqgZo0VZL9mgHNwSi7x6NSXbFS7Qy+6sXSjWRb+i/QytR
	f8vVRrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ckc-0000000Dlr0-2wxy;
	Wed, 02 Sep 2026 04:39:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cka-0000000DlqR-1uQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:39:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78ADE1596;
	Tue,  1 Sep 2026 21:38:58 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7692D3F7D8;
	Tue,  1 Sep 2026 21:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788323942; bh=lsYDvIHWzI7Z9foYuzRf+3oBreuXwlUShNlsSn4ADPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL0K6Pk8Tssm6JHp0t8VZ4HINef7UJdYngfT3+Wl0ltc3Z0oEPcirHdU2lPXKwQTH
	 Fdq8I9j6i/SHqQ7ILgZ9Bm2Fk1YEoHiN9nlM0NIl7tfOIEzvCErbM5DC0yL0MukMlF
	 U+5WcylKG0URS5kCkwvLgmPSmzaOPqyRsyPuy6NA=
Date: Wed, 2 Sep 2026 10:08:58 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <xwyaihtgvjonk4wqmllsnzkq2ch63bhfzmvh6353ds6tpjuaww@lmu7ltps4il5>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901131823.15799-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_213904_605030_930F7768 
X-CRM114-Status: GOOD (  29.72  )
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

On Tue, Sep 01, 2026 at 03:18:23PM +0200, Karl Mehltretter wrote:
> huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
> permissions. For contiguous PTE mappings, break-before-make (BBM)
> requires a TLB invalidation after clearing the set and before making any
> entry valid again.

Agreed.

> 
> Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
> get_clear_flush()") removed this invalidation, relying on the deferred
> flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
> TLB invalidation for BBM on contiguous ptes") restored it for
> huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
> late for the break step. The modify-prot path has the same problem.

The commit 410982303772 ("arm64: hugetlb: Restore TLB invalidation for BBM
on contiguous ptes") should also have fixed huge_ptep_modify_prot_start()
while at it ?

> 
> Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
> invalidated during the break step. Leave huge_ptep_get_and_clear()
> unchanged because it is also used by teardown paths, where the deferred
> flush is sufficient.

Makes sense.

> 
> Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")

Probably OK as the earlier commit 410982303772 also blames the same.

> Assisted-by: LLM

So you did not actually see this problem on a system ?

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> An instrumented QEMU detected the missing break-step TLBI on an unpatched
> kernel and none with this change. A fork() control exercising
> huge_ptep_set_wrprotect() remained clean. No user-visible failure was
> reproduced.

No user-visiable failure was reported even without this change ?
Missing TLBI as seen in QEMU is the only clue here ?

> 
> The QEMU checker was exercised with 4K and 64K base-page kernels. The
> patched kernel passed the LTP hugetlb tests with both -cpu max and -cpu
> cortex-a72 (16 TPASS and no failures).
> 
> Testing on Neoverse N1 hardware would be welcome, as it can use the
> contiguous hint and can be configured to report TLB conflicts.

But you have not seen any real TLB conflicts even on custom QEMU ?

> 
>  arch/arm64/mm/hugetlbpage.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa..bb53a04b73b2 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -517,6 +517,11 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>  {
>  	unsigned long psize = huge_page_size(hstate_vma(vma));
> +	pte_t pte = __ptep_get(ptep);
> +
> +	/* The break step for contiguous PTEs must include the TLB flush. */

Probably helpful to mention here that subsequent huge_ptep_get_and_clearI()
in the function depends on deferred TLB flush mechanism which would not be
accurate for contig HugeTLB pages.

> +	if (pte_cont(pte))
> +		return huge_ptep_clear_flush(vma, addr, ptep);
>  
>  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>  		/*
> @@ -524,7 +529,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
>  		 * when the permission changes from executable to non-executable
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
> -		if (pte_user_exec(__ptep_get(ptep)))
> +		if (pte_user_exec(pte))
>  			return huge_ptep_clear_flush(vma, addr, ptep);
>  	}
>  	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep, psize);
> 
> base-commit: 786262be6048deab760f68c8acc2c85607165894
> -- 
> 2.53.0

Overall LGTM but will need some more testing.

