Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15833CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KptHfrcQ4aindQkNpO+syEz+BjMEx0loaikAdffFS7M=; b=JS1Nfnk586qS0D0gKpLfs6+YBO
	2xANFpsouO8suW4Fi1fWYQk8hLvbtjai3RUIszLP06jZvwPG+B9MAj6u4OIK+nD4fYTdrF3f7An/7
	jcWejNCmfrqdgeilRR0ZR452oAJkk9AJJMGy/5Xlv637qZasmxPAMaiO728dwmVkXAiQJSU/AQSQ6
	tPfTwYlk3FvHiVB9M3InOBtp+W1NPj4MgvmsoRfHlDG2kl0LP82JeOfBBZAbcff671/vLJDGeXs1H
	HzFTxkceZaFFVJJWFTGXYY56XigEhJVeJvjbDRE67FLYSg0Har7OojvMFMR9oxMrBmTQyGS/8FZOl
	OePJnCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkfQ-0000000GlDF-0AB1;
	Mon, 05 Oct 2026 15:31:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkfE-0000000GlAg-0Lk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:31:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDDB1152B;
	Mon,  5 Oct 2026 08:31:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B85EB3F66F;
	Mon,  5 Oct 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791214297; bh=UfbkEj7jWC5+3mriZ290i7LpZ34xnOeNx98uhNGcwvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exVUm0cZnHQnY5eDcThWwtVtsV8bnj/H4FIk9vMSC0M9uS6j/8ciV6Puh+y0NX116
	 oI/KBHXz6lA63AsMY4N4h+jtZA/cp2j9D7tDztXG8s4lHbkVXoN5n7cQWvthLajd+L
	 3/qGM3C3zhcyE1sjAcn3EEG/VTNV+Zr8YqR+3xUg=
Date: Mon, 5 Oct 2026 16:31:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH V3 1/4] arm64/mm: Use pmdp_get() for PMD accesses
Message-ID: <asPCv5Icdm7Z9mWF@arm.com>
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
 <20260924062214.1635078-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924062214.1635078-2-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_083141_219779_3573637F 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, Sep 24, 2026 at 11:52:11AM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 763c5a411d64..9ad2d03e86ad 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -84,6 +84,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	arch_flush_lazy_mmu_mode();
>  }
>  
> +#define pmdp_get pmdp_get
> +static inline pmd_t pmdp_get(pmd_t *pmdp)
> +{
> +	return READ_ONCE(*pmdp);
> +}

This is the same as the generic version. Does it need redefining?

> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  
> @@ -811,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  }
>  
>  /* Find an entry in the third-level page table. */
> -#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
> +#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
> +					 pte_index(addr) * sizeof(pte_t))

Why not make this change in the generic version?

-- 
Catalin

