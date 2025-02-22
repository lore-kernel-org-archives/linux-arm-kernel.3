Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C16C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CgxyAkzkzC+kqLdjAZT0dTilq3ap9KRK2oKmLc5R7w=; b=28iYSeHscQb7B+jruw1HsxBnGZ
	CzCVJlNvGgAqv+8lEvXCUwaI0z+osoIXnhibM/Y7kVRz6IiQWiyNXmtTCc/2BKc5ArdyWFetH19Ji
	kXXFvOKnrj5mDfKQudULV6TltRbyd8Yydw3+afaezX6YEW9bZ/Zi9mvUbim0QF4PU1wUCXtRc/Ips
	s5UTrE+dpXR/AXWqZ8V65gWnbSnT+J13q8YHHPaZb/39LEKzec+oGXlcSW0OLOXZrFvYtqDw9mJgO
	34d0mvuQAyuuZSdsyszMhZOF2L4PGNO84mG8e+hLivLa+9oSsWrJVs4lQ1NbUuaWXA5LGXfkFUOY6
	OnO9ohBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpPi-000000084ah-0ADC;
	Sat, 22 Feb 2025 13:19:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpOE-000000084UG-2i6o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 13:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1550F5C572C;
	Sat, 22 Feb 2025 13:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221E4C4CED1;
	Sat, 22 Feb 2025 13:17:49 +0000 (UTC)
Date: Sat, 22 Feb 2025 13:17:47 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/14] arm64/mm: Avoid barriers for invalid or
 userspace mappings
Message-ID: <Z7nOe78W4JXFAkMb@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-8-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140809.1702789-8-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_051754_772665_EC1866B9 
X-CRM114-Status: GOOD (  37.52  )
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

On Mon, Feb 17, 2025 at 02:07:59PM +0000, Ryan Roberts wrote:
> __set_pte_complete(), set_pmd(), set_pud(), set_p4d() and set_pgd() are
> used to write entries into pgtables. And they issue barriers (currently
> dsb and isb) to ensure that the written values are observed by the table
> walker prior to any program-order-future memory access to the mapped
> location.
> 
> Over the years some of these functions have received optimizations: In
> particular, commit 7f0b1bf04511 ("arm64: Fix barriers used for page
> table modifications") made it so that the barriers were only emitted for
> valid-kernel mappings for set_pte() (now __set_pte_complete()). And
> commit 0795edaf3f1f ("arm64: pgtable: Implement p[mu]d_valid() and check
> in set_p[mu]d()") made it so that set_pmd()/set_pud() only emitted the
> barriers for valid mappings.

The assumption probably was that set_pmd/pud() are called a lot less
often than set_pte() as they cover larger address ranges (whether table
or leaf).

> set_p4d()/set_pgd() continue to emit the barriers unconditionally.

We probably missed them, should have been the same as set_pmd().

> This is all very confusing to the casual observer; surely the rules
> should be invariant to the level? Let's change this so that every level
> consistently emits the barriers only when setting valid, non-user
> entries (both table and leaf).

Also see commit d0b7a302d58a ("Revert "arm64: Remove unnecessary ISBs
from set_{pte,pmd,pud}"") why we added back the ISBs to the pmd/pud
accessors and the last paragraph on why we are ok with the spurious
faults for PTEs.

For user mappings, the translation fault is routed through the usual
path that can handle mapping new entries, so I think we are fine. But
it's worth double-checking Will's comment (unless he only referred to
kernel table entries).

> It seems obvious that if it is ok to elide barriers all but valid kernel
> mappings at pte level, it must also be ok to do this for leaf entries at
> other levels: If setting an entry to invalid, a tlb maintenance
> operation must surely follow to synchronise the TLB and this contains
> the required barriers.

Setting to invalid is fine indeed, handled by the TLB flushing code,
hence the pmd_valid() checks.

> If setting a valid user mapping, the previous
> mapping must have been invalid and there must have been a TLB
> maintenance operation (complete with barriers) to honour
> break-before-make.

That's not entirely true for change_protection() for example or the
fork() path when we make the entries read-only from writeable without
BBM. We could improve these cases as well, I haven't looked in detail.
ptep_modify_prot_commit() via change_pte_range() can defer the barriers
to tlb_end_vma(). Something similar on the copy_present_ptes() path.

> So the worst that can happen is we take an extra
> fault (which will imply the DSB + ISB) and conclude that there is
> nothing to do. These are the arguments for doing this optimization at
> pte level and they also apply to leaf mappings at other levels.

It's worth clarifying Will's comment in the commit I mentioned above.

> For table entries, the same arguments hold: If unsetting a table entry,
> a TLB is required and this will emit the required barriers. If setting a
> table entry, the previous value must have been invalid and the table
> walker must already be able to observe that. Additionally the contents
> of the pgtable being pointed to in the newly set entry must be visible
> before the entry is written and this is enforced via smp_wmb() (dmb) in
> the pgtable allocation functions and in __split_huge_pmd_locked(). But
> this last part could never have been enforced by the barriers in
> set_pXd() because they occur after updating the entry. So ultimately,
> the wost that can happen by eliding these barriers for user table
> entries is an extra fault.
> 
> I observe roughly the same number of page faults (107M) with and without
> this change when compiling the kernel on Apple M2.

That's microarch specific, highly dependent on timing, so you may never
see a difference.

> +static inline bool pmd_valid_not_user(pmd_t pmd)
> +{
> +	/*
> +	 * User-space table entries always have (PXN && !UXN). All other
> +	 * combinations indicate it's a table entry for kernel space.
> +	 * Valid-not-user leaf entries follow the same rules as
> +	 * pte_valid_not_user().
> +	 */
> +	if (pmd_table(pmd))
> +		return !((pmd_val(pmd) & (PMD_TABLE_PXN | PMD_TABLE_UXN)) == PMD_TABLE_PXN);
> +	return pte_valid_not_user(pmd_pte(pmd));
> +}

With the 128-bit format I think we lost the PXN/UXNTable bits, though we
have software bits if we need to. I just wonder whether it's worth the
hassle of skipping some barriers for user non-leaf entries. Did you see
any improvement in practice?

-- 
Catalin

