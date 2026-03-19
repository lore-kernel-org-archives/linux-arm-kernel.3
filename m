Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A7108E1F4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cP2v8J77qhH7+P6f3MKSn1tr8varIjm4aeTGVT+Ue4g=; b=h0gl/9Gy9b1TShdzA/FzoX/Qk4
	IvqezeKn6Hf4hQXipttwwVOOu/UD0/37O8AC7Svw+1onlR7QMCDcwjg/fIyEnUv6e7TKiNbUmsMmf
	fuEkEL5KdJp1BH9m6ELOUMDrpO2F/3T+un/NNRKfqootObDgoxPjvW8LexgBcaX97JdyNhlE+RDVm
	RDKrLB/2pEMslKo3eGWJSRFyRV3VkCBf9rh+4/8elFQUkBmlY7pQxmWzgZLsnBvGh3fdbC4Cd6HNC
	RskPWQbhDe8ZDB34VDiav6VTottLjn1i0sqakUIcPf37M7XAajgM56B2AYbA07uMv8kKQsBQfwbd4
	7KEbqkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bdu-0000000AXde-42s8;
	Thu, 19 Mar 2026 11:34:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bdu-0000000AXdN-0yWG;
	Thu, 19 Mar 2026 11:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52D9E600AD;
	Thu, 19 Mar 2026 11:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5F2C2BCB0;
	Thu, 19 Mar 2026 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773920061;
	bh=vGPmcqAhZCk0gdlr+wYCcpNO1tqWQw2RngJu1gW9hIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXR9V298CpUtMI8uiUfzgXIhpTXpgltg84qzhP5tYL999s9u38RdIf5/+znO/AKE1
	 nqdW9Kq54pTvI4cGRFD2fUy4wjnBRVN+hAoSlkhQipxY5QwpDm0qw/h962PSLEsbLR
	 v6RwuOsIJQst5wZaS5ybKMq5k9XUSGo1qyD2DHzUbCEZzYDzvgPHeP/Dx+E4/aQnpy
	 yVeQFdy4I9jGYcI7u2KCScFjvcb5MeSUYYiTwA5vTmdH/rrgzTC2wcNRsJt4VgQH5M
	 eNJt8KcZbP8/OhTnGatWrUV8VPU4EftxdWW/1OF1NI646J0TpK4aNS9v3S1zz09OW3
	 LuZU7ah4P9Amg==
Date: Thu, 19 Mar 2026 11:34:14 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, Liam.Howlett@oracle.com, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] mm: change to return bool for
 pudp_test_and_clear_young()
Message-ID: <522588b0-1172-4cc6-9011-f077e94011df@lucifer.local>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
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

On Thu, Mar 19, 2026 at 11:24:04AM +0800, Baolin Wang wrote:
> The pudp_test_and_clear_young() is used to clear the young flag,
> returning whether the young flag was set for this PUD entry. Change
> the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Some nits but otherwise loogs good so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  5 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 0f34011665a6..083c4b9ed5b3 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1172,13 +1172,13 @@ static inline bool __pmdp_test_and_clear_young(struct mm_struct *mm,
>  	return ((old & _PAGE_ACCESSED) != 0);
>  }
>
> -static inline int __pudp_test_and_clear_young(struct mm_struct *mm,
> -					      unsigned long addr, pud_t *pudp)
> +static inline bool __pudp_test_and_clear_young(struct mm_struct *mm,
> +					       unsigned long addr, pud_t *pudp)

Formatting yada yada you know the drill, 2 tabs etc. :))

>  {
>  	unsigned long old;
>
>  	if ((pud_raw(*pudp) & cpu_to_be64(_PAGE_ACCESSED | H_PAGE_HASHPTE)) == 0)
> -		return 0;
> +		return false;
>  	old = pud_hugepage_update(mm, addr, pudp, _PAGE_ACCESSED, 0);
>  	return ((old & _PAGE_ACCESSED) != 0);
>  }
> @@ -1303,8 +1303,8 @@ extern int pudp_set_access_flags(struct vm_area_struct *vma,
>  extern bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  				      unsigned long address, pmd_t *pmdp);
>  #define __HAVE_ARCH_PUDP_TEST_AND_CLEAR_YOUNG
> -extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
> -				     unsigned long address, pud_t *pudp);
> +extern bool pudp_test_and_clear_young(struct vm_area_struct *vma,
> +				      unsigned long address, pud_t *pudp);

Drop the extern please!

>
>
>  #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index aed39bba891e..838cb4a8e2cf 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -104,8 +104,8 @@ bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  	return __pmdp_test_and_clear_young(vma->vm_mm, address, pmdp);
>  }
>
> -int pudp_test_and_clear_young(struct vm_area_struct *vma,
> -			      unsigned long address, pud_t *pudp)
> +bool pudp_test_and_clear_young(struct vm_area_struct *vma,
> +			       unsigned long address, pud_t *pudp)
>  {
>  	return __pudp_test_and_clear_young(vma->vm_mm, address, pudp);
>  }
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index bac559d29036..88fa63186ca5 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -1109,8 +1109,8 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
>  	return ptep_set_access_flags(vma, address, (pte_t *)pudp, pud_pte(entry), dirty);
>  }
>
> -static inline int pudp_test_and_clear_young(struct vm_area_struct *vma,
> -					    unsigned long address, pud_t *pudp)
> +static inline bool pudp_test_and_clear_young(struct vm_area_struct *vma,
> +					     unsigned long address, pud_t *pudp)
>  {
>  	return ptep_test_and_clear_young(vma, address, (pte_t *)pudp);
>  }
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index f9439449c9bd..6ca1fdd25191 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1297,8 +1297,8 @@ extern int pudp_set_access_flags(struct vm_area_struct *vma,
>  #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
>  extern bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  				      unsigned long addr, pmd_t *pmdp);
> -extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
> -				     unsigned long addr, pud_t *pudp);
> +extern bool pudp_test_and_clear_young(struct vm_area_struct *vma,
> +				      unsigned long addr, pud_t *pudp);

Drop the extern please!

>
>  #define __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
>  extern bool pmdp_clear_flush_young(struct vm_area_struct *vma,
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index 8c336edf0e65..2677dcf0bbce 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -470,10 +470,10 @@ bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  #endif
>
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -int pudp_test_and_clear_young(struct vm_area_struct *vma,
> -			      unsigned long addr, pud_t *pudp)
> +bool pudp_test_and_clear_young(struct vm_area_struct *vma,
> +			       unsigned long addr, pud_t *pudp)
>  {
> -	int ret = 0;
> +	bool ret = false;
>
>  	if (pud_young(*pudp))
>  		ret = test_and_clear_bit(_PAGE_BIT_ACCESSED,
> --
> 2.47.3
>

