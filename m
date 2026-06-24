Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6CCCDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:Cc:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DCLmR55W2y2LcSwcefjaxs66OcgM2Bl6pzHm0IePw4I=; b=wmLglaALsm1y+u3oWAMxOjSO58
	DD4I9f9uu0bs/CqWKswqIHkxu7CSJwa7p/KoT2blYaTc3lItpMUIqBlhXoo5eivlbXoZtCtObnrg7
	t00F/xeF4UnsXHXAjf+VKu4G1mWp2gNeWtfsnoZYnasAnuvQXCfGURXU+kbclhaYecWadGYclaG8E
	PmhTCpuk5j4/TLtcf9WTCAeAEJehLDvncY4F7Fl6SHTVsDlAl00a4Vfe4TkPMsezv1JpP3/ySV/NX
	M8Oix5BqKZfUyoXj4i+9lbCDLPK/0NqrZTC9eiBWVN/4v3UjgpzEwc3aAZ3+kU2FgvMbar/J2uaGs
	VtYLnINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOI1-00000007t9j-1qtL;
	Wed, 24 Jun 2026 14:09:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOHy-00000007t8W-1XGf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 14:09:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FB271E4D;
	Wed, 24 Jun 2026 07:09:07 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4CB93F62B;
	Wed, 24 Jun 2026 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782310151; bh=w4/5Am6wou3JOsUXE2kUVgm79vny+93dIdQA8wNcKUc=;
	h=Date:Cc:From:To:Subject:From;
	b=OiNFnmXNtLXavewQIhaLvL+L4iTjRXShbqIIuYDnv+MORl8xz3QYtigtIv8ACszD9
	 oFKXRHjRFjnqtGe4ewvOW9Gszi3zt8j3sz5vkpJOiQJkCtV9E6JCjwWRb4P87igMFB
	 nxt+LdBme0INFrj+HgX2KsZwYmZaL1hwixjWlfmg=
Message-ID: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
Date: Wed, 24 Jun 2026 15:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Usama Anjum <usama.anjum@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Subject: mm: opaque hardware page-table entry handles
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_070914_501478_91D20ED7 
X-CRM114-Status: GOOD (  20.19  )
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

Hi all,

This is a direction-check with the wider community before spending time on the
development. This picks up the idea that was raised and broadly agreed in the
earlier thread (Ryan Roberts, Lorenzo Stoakes, David Hildenbrand) [1].

The problem
-----------
Core MM code reaches page-table entries by raw pointer dereference (pte_t *,
pmd_t *, *pud, ...) in places, implicitly assuming a single, uniform
representation. Sprinkling getters wouldn't solve the problem entirely. The
problem is one level up: the *pointer type* itself is overloaded. At each level
there are really three distinct things:

  1. a page-table entry value (pte_t, pmd_t, ...)
  2. a pointer to an entry value, e.g. a pXX_t on the stack
  3. a pointer to a live entry in the hardware page table

Today (2) and (3) share the same type - pte_t *, pmd_t *, and so on. Nothing
distinguishes a pointer into a live table from a pointer to a stack copy.

A pointer to an on-stack entry value and a pointer to a live hardware entry have
the same type, so the compiler cannot distinguish them. Passing the stack
pointer to an arch helper that expects a hardware-entry pointer compiles fine,
but is wrong - a bug class the type system makes invisible. It also blocks
evolution: an arch helper may need to read beyond the addressed entry (e.g.
adjacent or contiguous entries), which only makes sense for a real page-table
pointer, not a stack copy.

The idea
--------
Give (3) its own opaque type that cannot be dereferenced:

    /* opaque handle to a HW page-table entry; not dereferenceable */
    typedef struct {
	pte_t *ptr;
    } hw_ptep;

With this:

  - a stack value can no longer masquerade as a hardware table entry,
  - a hardware handle can no longer be raw-dereferenced,
  - cases that genuinely operate on a value can be refactored to pass the value
    and let the caller, which knows whether it holds a handle or a stack copy,
    read it once.

The overload becomes a compile-time type error instead of a silent runtime bug,
and converting the tree forces every such site to be made explicit. This gives
us a framework where the architecture can completely virtualize the pgtable if
it likes; and the compiler can enforce that higher level code can't accidentally
work around it.

It is opt-in by architectures and incremental. The generic definition is
just an alias, so arches that do not care build unchanged:

    typedef pte_t *hw_ptep;

An arch flips to the strong struct type when it is ready, and only then does
it get the stronger checking. This lets the conversion land gradually.

Beyond fixing the latent bug class, this abstraction is an enabler for upcoming
features that need tighter control over how page tables are accessed and
manipulated.

Getter flavours
---------------
While converting, it is useful to have two accessor flavours at each level:

  - pXXp_get(hw_ptep)        plain C dereference (compiler may optimize)
  - pXXp_get_once(hw_ptep)   single-copy-atomic, not torn, elided or
                             duplicated by the compiler

Keeping them distinct simplifies the conversion and avoids re-introducing the
class of lockless-read bugs seen on 32-bit.

Example conversion
------------------
Most of the conversion is mechanical.

  -static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
  -		pte_t *ptep, pte_t pte, unsigned int nr)
  +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
  +		hw_ptep ptep, pte_t pte, unsigned int nr)
   {
   	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
   	for (;;) {
   		set_pte(ptep, pte);
   		if (--nr == 0)
   			break;
  -		ptep++;
  +		ptep = hw_pte_next(ptep);
   		pte = pte_next_pfn(pte);
   	}
   }

The bulk of work is this kind of rote substitution. The genuine work is the
handful of sites that turn out to be operating on a stack copy rather than a
live entry - those are exactly the ones the new type forces us to surface and 
fix.

Estimated churn:
----------------
Half way through the prototyping converting only PTE and PMD levels:
  77 files changed, +1801 / -1425
  ~57 files reference the new types

So the line count will grow once PUD/P4D/PGD and the remaining call sites are
converted; expect meaningfully more churn than the numbers above.

Introduce the type as an alias, convert one helper family per patch, and flip
an arch to the strong type last - with non-opted arches building unchanged at
every step.

Open questions
--------------
  - Is the type-safety + future-feature enablement worth the churn?
  - Naming: hw_ptep/hw_pmdp vs something else?
  - Should all five levels be converted before merging anything, or is a staged
    PTE-and-PMD then landing others acceptable?
  - Do we want the two getter flavours (pXXp_get / pXXp_get_once) at every
    level?

[1] https://lore.kernel.org/all/a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com

Thanks,
Usama

