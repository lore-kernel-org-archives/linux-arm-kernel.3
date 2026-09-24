Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF25EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xePOy1AI/uAmoNLk2pom3JdMozQVH6qVeKB1dqEvS8=; b=ObvPyPh5ElMnBpX9xLUy2/bry/
	+HJx2N2VGIepF2MJ5odssZR94Jh/Gf2/68D33Hm5Rj7Cvg+QU7OHpAvwpXNtypiy5KmpUxs8aSE3B
	z95W6VTOPQjgchqu8dXrNOT795MzNXn+hiy/xI96TsuBcHSEzMvqyL1a6vnn13RhH53Rq8tnP7BqV
	tVlj2n4kDS4VgN16RLUOSA8PwRtDvsRrZitHsmYtnDNp8jhPMb1tHHgESUkmkqdhjAuKC+seGW8Ei
	dV9YJ3NRRlzzJsrzVoh/zfutvM+VP3zJNQZEGPivs2m0PtyCC4eL3onLSZ0lP/yWBi7gu/ZsJLQUm
	9sksI80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iSJ-0000000Axlq-2Csu;
	Thu, 24 Sep 2026 12:21:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iSH-0000000AxlU-2CVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:21:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8687A152B;
	Thu, 24 Sep 2026 05:21:32 -0700 (PDT)
Received: from [10.57.83.110] (unknown [10.57.83.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA9B3F86C;
	Thu, 24 Sep 2026 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790252496; bh=rTdcO7n0+nshxu9CDu/EDryDUt+kuTOvFiqhnTEqJCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RCb6mJClIL5UcTql5vFcsex7DxOdojrWEOrsuD+03U/8LnEkoU4WGd4NklebN4L/q
	 i8SAcsH8Z8iDp7GOdFsb2I3V0awYWc2PApLoDAD0UXrSVigZDqp90z2XYQLFkm59o6
	 Z+aW0c6kZeCZ6al02l/F0iQ5og5z9BpTFQcoNTnk=
Message-ID: <7a600128-bf10-4966-8c08-129eeec3fb91@arm.com>
Date: Thu, 24 Sep 2026 13:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: use hw_pte_val for HW PTE atomics
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
 <20260922-pte0_arm-v2-2-a3f1ddff0a8a@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260922-pte0_arm-v2-2-a3f1ddff0a8a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_052137_677950_EFD9A13E 
X-CRM114-Status: GOOD (  17.87  )
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

On 22/09/2026 18:31, Muhammad Usama Anjum wrote:
> The low-level atomic PTE update paths take the address of
> pte_val(*ptep). That assumes HW PTE storage can be passed directly to
> the SW PTE value accessor and no longer type-checks when hw_pte_t is
> distinct.
> 
> Use hw_pte_val() for the lvalues passed to compare-exchange and exchange
> operations. The atomic operations and their ordering are unchanged.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> Chagnes in v2:
> - Remove comment change
> - Move hw_pte_val() to generic series
> ---
>  arch/arm64/include/asm/pgtable.h | 10 +++++-----
>  arch/arm64/mm/fault.c            |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 652ce413be389..4768ec59de555 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1303,7 +1303,7 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
>  	do {
>  		old_pte = pte;
>  		pte = pte_mkold(pte);
> -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> +		pte_val(pte) = cmpxchg_relaxed(&hw_pte_val(*ptep),
>  					       pte_val(old_pte), pte_val(pte));
>  	} while (pte_val(pte) != pte_val(old_pte));
>  
> @@ -1346,7 +1346,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
>  					       hw_pte_t *ptep,
>  					       unsigned long pgsize)
>  {
> -	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
> +	pte_t pte = __pte(xchg_relaxed(&hw_pte_val(*ptep), 0));
>  
>  	switch (pgsize) {
>  	case PAGE_SIZE:
> @@ -1422,7 +1422,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
>  	do {
>  		old_pte = pte;
>  		pte = pte_wrprotect(pte);
> -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> +		pte_val(pte) = cmpxchg_relaxed(&hw_pte_val(*ptep),
>  					       pte_val(old_pte), pte_val(pte));
>  	} while (pte_val(pte) != pte_val(old_pte));
>  }
> @@ -1460,7 +1460,7 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
>  		if (flags & CYDP_CLEAR_DIRTY)
>  			pte = pte_mkclean(pte);
>  
> -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> +		pte_val(pte) = cmpxchg_relaxed(&hw_pte_val(*ptep),
>  					       pte_val(old_pte), pte_val(pte));
>  	} while (pte_val(pte) != pte_val(old_pte));
>  }
> @@ -1830,7 +1830,7 @@ static inline bool ptep_try_set(hw_pte_t *ptep, pte_t new_pte)
>  {
>  	pteval_t old = 0;
>  
> -	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
> +	if (!try_cmpxchg(&hw_pte_val(*ptep), &old, pte_val(new_pte)))
>  		return false;
>  
>  	/*
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index b77f4be88e3ea..3322f4e7174dc 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -235,7 +235,7 @@ int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
>  		pteval ^= PTE_RDONLY;
>  		pteval |= pte_val(entry);
>  		pteval ^= PTE_RDONLY;
> -		pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
> +		pteval = cmpxchg_relaxed(&hw_pte_val(*ptep), old_pteval, pteval);
>  	} while (pteval != old_pteval);
>  
>  	/*
> 


