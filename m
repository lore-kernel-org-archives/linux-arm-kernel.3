Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41174C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l03Q5ptSYhWuGPtHN3uRfvI7ji1htrQDlyLsSY8uXvw=; b=FYXnTPqD4dk6dHvfIadOX3OE9q
	zalucHjQ4lc6esPgcks20oUjcYwKGxTTQUmG0irljPHBW6ZhYyfBvVaz0FbkBpA7CXhAJBlcFD9dt
	MKPhFJZjQJv3hM7ABBTjlV38z+8wVE9Cww30Z4GXZnxZxbG/2tnnh0plvFewlIaF9xkOMXIIpAbda
	vYadkk9/OdmJgUF6kN5qzvXW0Va/0Czrq4rF7+jcZWe1y/RCbQYe8+sPppIVhWrEtrClIoYwZu2an
	ndOJA3aDIyEVcmAN5LIRp8mCtKSlmwalQdISNEEyGmj/ohr0WWyTbqpOqZ+sHUDUyy5WyZgdpAkUy
	baeT5DvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKWb-000000086LJ-3cQm;
	Tue, 18 Aug 2026 14:10:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKWZ-000000086KQ-0oui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:10:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93860152B;
	Tue, 18 Aug 2026 07:10:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DB1A3F85F;
	Tue, 18 Aug 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062241; bh=ViG9p523Gtj965obqgoqvstIweJ3Dnp0nqQZuKx6Weo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5EewfnfFIPzdq/m5PX24TI4FOzPov6Iap7L97itk/zFF2JCkMgIjuBE6my9umw9P
	 tFtho4uCZpiIO+IPA9jO61MjT2OuD6svwQBMCmxLRn+dHYIAz6+6ydfZvkZsFQTtnN
	 DMrNb1prYHYEqMTQiMrKfD8+D5z9qlbLSjIWJKDU=
Date: Tue, 18 Aug 2026 15:10:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 08/18] arm64: Implement try_update_vmemmap_pte using the
 AF trick
Message-ID: <aoRn3Fn1dhTdsk6d@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-9-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-9-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071043_322839_D565597C 
X-CRM114-Status: GOOD (  25.47  )
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

On Wed, Jul 08, 2026 at 03:11:18AM +0000, James Houghton wrote:
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 5f21d3a738ee..7b11aa41d0a0 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1302,8 +1302,7 @@ static inline void __pte_clear(struct mm_struct *mm,
>  	__set_pte(ptep, __pte(0));
>  }
>  
> -static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
> -		unsigned long address, pte_t *ptep)
> +static inline pte_t __ptep_clear_young(pte_t *ptep)
>  {
>  	pte_t old_pte, pte;
>  
> @@ -1315,7 +1314,13 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
>  					       pte_val(old_pte), pte_val(pte));
>  	} while (pte_val(pte) != pte_val(old_pte));
>  
> -	return pte_young(pte);
> +	return pte;
> +}

At some point, we should use LSE atomics directly here if supported
rather than a CAS loop (well, this is LSE as well if supported but it
doesn't guarantee forward progress of the loop). I reckon we can replace
it with some test_and_clear_bit_relaxed() call.

> +static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
> +		unsigned long address, pte_t *ptep)
> +{
> +	return pte_young(__ptep_clear_young(ptep));
>  }
>  
>  static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
> @@ -1793,6 +1798,48 @@ static inline void pte_clear(struct mm_struct *mm,
>  	__pte_clear(mm, addr, ptep);
>  }
>  
> +#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
> +static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
> +					 const pte_t pte)
> +{
> +	const int max_attempts = 16;
> +	int attempts = 0;
> +	pte_t old_pte;
> +
> +	if (!system_supports_hvo())
> +		return -EOPNOTSUPP;
> +
> +	/* This routine is only to be used for valid-to-valid transitions. */
> +	if (WARN_ON_ONCE(!pte_valid(pte)))
> +		return -EINVAL;
> +
> +	old_pte = __ptep_get(ptep);
> +
> +	do {
> +		if (WARN_ON_ONCE(!pte_valid(old_pte)))
> +			return -EINVAL;
> +
> +		/* We should never get a contiguous PTE here. */
> +		if (WARN_ON_ONCE(pte_valid_cont(old_pte)))
> +			return -EINVAL;
> +
> +		if (pte_young(old_pte)) {
> +			/* __ptep_clear_young() returns the overwritten PTE */
> +			old_pte = pte_mkold(__ptep_clear_young(ptep));
> +
> +			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +		}

I think this is going to do a lot of TLBIs given that the default kernel
prot has PTE_AF. It somewhat defeats the VMEMMAP_REMAP_NO_TLB_FLUSH
flag but I haven't figured exactly how this optimisation works.

If it becomes a problem, we could do a first pass to clear AF as an
optimisation or later via vmemmap_split_pmd(), only map with AF=0. We
still have some page copying that touches the vmemmap, bringing AF back.
Of course, you'd still need the above flush, just wondering whether we
can reduce/coalesce it.

> +	/*
> +	 * Translations without AF cannot be cached, so we can replace
> +	 * them without BBM.
> +	 */
> +	} while (!try_cmpxchg_relaxed(&pte_val(*ptep), &pte_val(old_pte),
> +				      pte_val(pte)) &&
> +		 ++attempts < max_attempts);
> +
> +	return attempts == max_attempts ? -EAGAIN : 0;
> +}

Here, indeed, we do need this bounded, otherwise some pathological cases
may set the AF continuously.

-- 
Catalin

