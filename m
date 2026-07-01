Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570B7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhz8Osel0Z6LhhauwhRFeu/E1Pq2KxQzjqBlcOqx9fI=; b=FXkAVoIHD3yxQCOKzJ0e72xxWN
	qXrOKmDll9MbrYBSV/XpzTpx0402Ugo7b6bRBOQEKwBhJMpN8Nz9GdtGeUaabeiOvoH/iVdtVX6OC
	ieNYYnX832AqrgYbY5R4DhjBw+92aj7gl29FPjOQgojPnC1Qx9o1TqhjZnbPZP7vHbdGKYASvgaY3
	VqEwir+hHEqJ7bFi8iH7mqqAj4WGD6iobUbiC8sYSiEHrEAx7H6hSc/mreHI+kj05fag484aIv7Fu
	GZBJYgJMeOi1yJf4rMEsWz+31BYY6XLJfpFu9TM5tH9P8aNUmp/gmNJzYcB9Kr5pTj6kEmeY5VKum
	2C5AAZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1zW-000000030f4-0Hzm;
	Wed, 01 Jul 2026 20:57:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1zU-000000030ey-2Oe8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:57:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1639641750;
	Wed,  1 Jul 2026 20:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8F21F000E9;
	Wed,  1 Jul 2026 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782939424;
	bh=rhz8Osel0Z6LhhauwhRFeu/E1Pq2KxQzjqBlcOqx9fI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kEtg8nEiGvjv/8a71xiRttxC7Kqa9pB2Qu4HYfeIltrKcKNOQw1AzMvTCVWtzmUhb
	 CsjGgk3Uxmdhq3LJSyFku/nNsZ/O4geD3bLoHM+KRQ9oesNBKYneg4DPbby74vKSch
	 C3ZNh47Dm5wrGpdYtrE8Tpp9NsF19FbS6gsaS/wBs/c46cO49FGWhzemzBm/GNRSFa
	 Tkwjt4sxJTTKGtd6YjT059ZfCjYweD+63qEWhwWtgBfuEVsLI+ZFI1unZu7OMvBnTA
	 wUl8IAsMqNFqRn+O2tMGjlCRQllt07fsjn6DrxSqGu11YTi2D538Vt9CUa0thtrtyN
	 fwje7yCv7HZVQ==
Message-ID: <31d36023-d728-4eee-90f8-158c7066f565@kernel.org>
Date: Wed, 1 Jul 2026 22:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: opaque hardware page-table entry handles
To: Usama Anjum <usama.anjum@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 6/24/26 16:09, Usama Anjum wrote:
> Hi all,

Hi!

> 
> This is a direction-check with the wider community before spending time on the
> development. This picks up the idea that was raised and broadly agreed in the
> earlier thread (Ryan Roberts, Lorenzo Stoakes, David Hildenbrand) [1].
> 
> The problem
> -----------
> Core MM code reaches page-table entries by raw pointer dereference (pte_t *,
> pmd_t *, *pud, ...) in places, implicitly assuming a single, uniform
> representation. Sprinkling getters wouldn't solve the problem entirely. The
> problem is one level up: the *pointer type* itself is overloaded. At each level
> there are really three distinct things:
> 
>   1. a page-table entry value (pte_t, pmd_t, ...)
>   2. a pointer to an entry value, e.g. a pXX_t on the stack
>   3. a pointer to a live entry in the hardware page table
> 
> Today (2) and (3) share the same type - pte_t *, pmd_t *, and so on. Nothing
> distinguishes a pointer into a live table from a pointer to a stack copy.

Yes, I just stumbled over that myself while working on Levi on some folded page
table optimizations for pdgp_get() and friends.

The stack usage is nasty. Calling ptep_get() on stack values makes no sense.
Reading actual page table values without ptep_get() is suboptimal. Punching
stack pointers into functions that don't expect the, is shaky.

> 
> A pointer to an on-stack entry value and a pointer to a live hardware entry have
> the same type, so the compiler cannot distinguish them. Passing the stack
> pointer to an arch helper that expects a hardware-entry pointer compiles fine,
> but is wrong - a bug class the type system makes invisible. It also blocks
> evolution: an arch helper may need to read beyond the addressed entry (e.g.
> adjacent or contiguous entries), which only makes sense for a real page-table
> pointer, not a stack copy.
> 
> The idea
> --------
> Give (3) its own opaque type that cannot be dereferenced:
> 
>     /* opaque handle to a HW page-table entry; not dereferenceable */
>     typedef struct {
> 	pte_t *ptr;
>     } hw_ptep;

I guess the proper way of doing it would really be for hw_ptes to have a
distinct type, to completely decouple both concepts.

That's where the fun begins :(

We'd need hw_ptep++ to jump to the next entry in the page table. Assuming we're
on 32bit and have 64bit entries, would that work with the hw_ptep? hw_pte_next()
is rather nasty.

So, similar to what Pedro says

typedef struct {
	pte_t __pte;
} hw_pte_t;

And then simply use

hw_pte_t *hptep;


> 
> With this:
> 
>   - a stack value can no longer masquerade as a hardware table entry,

Right. What we don't care about is if someone deliberately would instantiate a
hw_pte_t above on the stack. We can catch that more easily.

>   - a hardware handle can no longer be raw-dereferenced,

That's the important part, yes.

>   - cases that genuinely operate on a value can be refactored to pass the value
>     and let the caller, which knows whether it holds a handle or a stack copy,
>     read it once.

The question is if these cases really just support one type of pointer (I assume
so).

> 
> The overload becomes a compile-time type error instead of a silent runtime bug,
> and converting the tree forces every such site to be made explicit. This gives
> us a framework where the architecture can completely virtualize the pgtable if
> it likes; and the compiler can enforce that higher level code can't accidentally
> work around it.
> 
> It is opt-in by architectures and incremental. The generic definition is
> just an alias, so arches that do not care build unchanged:
> 
>     typedef pte_t *hw_ptep;

Like Pedro says, pointer typedefs are really nasty.

> 
> An arch flips to the strong struct type when it is ready, and only then does
> it get the stronger checking. This lets the conversion land gradually.
> 
> Beyond fixing the latent bug class, this abstraction is an enabler for upcoming
> features that need tighter control over how page tables are accessed and
> manipulated.
> 
> Getter flavours
> ---------------
> While converting, it is useful to have two accessor flavours at each level:
> 
>   - pXXp_get(hw_ptep)        plain C dereference (compiler may optimize)

That's just what we have. Defaults to READ_ONCE().

>   - pXXp_get_once(hw_ptep)   single-copy-atomic, not torn, elided or
>                              duplicated by the compiler

Why do we need this and what would we use it for?

> 
> Keeping them distinct simplifies the conversion and avoids re-introducing the
> class of lockless-read bugs seen on 32-bit.
> 
> Example conversion
> ------------------
> Most of the conversion is mechanical.
> 
>   -static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   -		pte_t *ptep, pte_t pte, unsigned int nr)
>   +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   +		hw_ptep ptep, pte_t pte, unsigned int nr)

hw_pte_t *ptep, pte_t pte, unsigned int nr)

or (with sw ptep)

pte_t *ptep, pte_t pte, unsigned int nr)

>    {
>    	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>    	for (;;) {
>    		set_pte(ptep, pte);
>    		if (--nr == 0)
>    			break;
>   -		ptep++;
>   +		ptep = hw_pte_next(ptep);

We should really just let ptep++ work as before.

>    		pte = pte_next_pfn(pte);
>    	}
>    }
> 
> The bulk of work is this kind of rote substitution. The genuine work is the
> handful of sites that turn out to be operating on a stack copy rather than a
> live entry - those are exactly the ones the new type forces us to surface and 
> fix.
> 
> Estimated churn:
> ----------------
> Half way through the prototyping converting only PTE and PMD levels:
>   77 files changed, +1801 / -1425
>   ~57 files reference the new types
> 
> So the line count will grow once PUD/P4D/PGD and the remaining call sites are
> converted; expect meaningfully more churn than the numbers above.
> 
> Introduce the type as an alias, convert one helper family per patch, and flip
> an arch to the strong type last - with non-opted arches building unchanged at
> every step.
> 
> Open questions
> --------------
>   - Is the type-safety + future-feature enablement worth the churn?

We have to minimize the churn. But yes, we really have to find a way to stop
ptep_get() and friends getting used on stack variables, or *ptep getting used
without ptep_get().

We have object_is_on_stack(), but that doesn't really allow for compile-time
checks ... and I don't know how safe it is in general.

>   - Naming: hw_ptep/hw_pmdp vs something else?

Really avoid ptep typedefs.

>   - Should all five levels be converted before merging anything, or is a staged
>     PTE-and-PMD then landing others acceptable?
>   - Do we want the two getter flavours (pXXp_get / pXXp_get_once) at every
>     level?

I'm still not sure about the _once() really, and if we need that right now. We
survived without is so far, why do we need it now?


-- 
Cheers,

David

