Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAC4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJeMLnJVlGg+3yFfYY8ewvq+lahUXEA89ZCMNVqQriI=; b=qZZu873RYO3yBIHLOWlwQi7Oe9
	9GaYvf6X8kmiQIUD/CuYlgbvfaDvyXoeul95YHLXN9Ap/bv1arLeqDOgPePhq8JEvATH80k1vQMab
	X24NbGez1gJP+Q4fiq/NDG+cCGA2wypSHQS/dVWlm0GKDJvueD7r+Nde6FX8hI3g9JjcS2L7p+Xjc
	rM/Qu68UK84LE4f/cVj2h1+vCwfLIHewZIDOVWMD3wfPWPu2E/dJfsBAFMRkU1oTrkKOhxyIn1Xwc
	OBAenENRFEytO1YwLm665Zz+RKYiVqWDSYraRzq0IwsqRy0wHzkajSh3nYVsPLRWBnI5Fwimz50rh
	8ZaLl4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYh8W-0000000CqA3-32ke;
	Sun, 14 Jun 2026 09:28:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYh8V-0000000Cq9w-1ost
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 09:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D19E543B27;
	Sun, 14 Jun 2026 09:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7E91F000E9;
	Sun, 14 Jun 2026 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781429290;
	bh=IJeMLnJVlGg+3yFfYY8ewvq+lahUXEA89ZCMNVqQriI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LuvD5wtlvmMDVWxQCRAKGP5Fk5Ua91zWTtmgGiEjyZl0naJm7QD2bq1IQErR3g4kx
	 5g1lq7n1S4JCN4MRC6H+pQfs6eWEWioGavXdi6/0+bma0C5rW5da6/fu/4xwuJvgKe
	 HzrTO4ttBCMkPgmdrFGCy/9oPvg6teWpN+L63Kw6eKG2HVCgK98SQ+ophIaIHfzCGU
	 iqfBrIBYurBTrCX4cmqNgI4Boz6FhWb39R+bblyb+UeqldQesf5cc1GFb79FuOhPzP
	 /+UhXK5vXox6n9KKV/D05ZUh267keaN2trcOykJqJLq99QW2h1NuPfnmYaqWvYKGCV
	 0pIzPn9odMx9w==
Date: Sun, 14 Jun 2026 10:28:02 +0100
From: Will Deacon <will@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_set() for lockless empty-slot
 installs
Message-ID: <ai50IpfcvBiTZ7Ss@willie-the-truck>
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-2-tj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522172219.1423324-2-tj@kernel.org>
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

On Fri, May 22, 2026 at 07:22:12AM -1000, Tejun Heo wrote:
> Add ptep_try_set(ptep, new_pte): atomically set *ptep to new_pte iff it is
> currently pte_none(). Returns true on success, false if the slot was already
> populated or the arch has no implementation.
> 
> The intended caller is the upcoming bpf_arena kernel-side fault recovery
> path. The install runs from a page fault that can be nested under locks
> held by the faulting kernel caller (e.g. a BPF program holding
> raw_res_spin_lock_irqsave on its arena's spinlock), so trylock-and-retry
> would A-A deadlock. Lock-free cmpxchg is the only viable option, which
> constrains this helper to special kernel page tables where concurrent
> writers cooperate via atomic accessors.
> 
> The generic version in <linux/pgtable.h> returns false. x86 and arm64
> override with try_cmpxchg-based implementations on the underlying pteval.
> Other architectures get the false stub - the callers there already fall
> through to oops.
> 
> v2: Rename to ptep_try_set(). Tighten kerneldoc. (David, Alexei)
> v3: Note that strict-zero cmpxchg is narrower than pte_none(). (Andrea)
> 
> Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reviewed-by: Andrea Righi <arighi@nvidia.com>
> Cc: David Hildenbrand <david@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h | 12 ++++++++++++
>  arch/x86/include/asm/pgtable.h   | 12 ++++++++++++
>  include/linux/pgtable.h          | 25 +++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 9029b81ccbe8..28bada97d443 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1830,6 +1830,18 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>  	return __ptep_get_and_clear(mm, addr, ptep);
>  }
>  
> +/*
> + * Note: strictly-zero compare is narrower than pte_none(), but the gap is
> + * harmless: a fresh kernel PTE has no software bits set.
> + */

This comment really confused me :/

What is a "fresh" kernel PTE and why do you specifically call out "software
bits" if the CAS requires all 64 bits to be 0? Why is that narrower than
pte_none() given that pte_none() for arm64 is:

#define pte_none(pte)           (!pte_val(pte))

Will

