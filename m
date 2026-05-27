Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0024CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YtDJ0J10/PCwfS8CI5xlb7xlcrJcx7qk8qyccyyB9k=; b=aQ9pvJzyIJ5C8ryW/KpUYdH7yx
	xoawaxmsaJz8LbHAg2ehAdSj3OStZNObdpCN6FulhihveNCU9qJoot4k+Zk+x13vzZWypOaJi9eEi
	bDtQfkZah6qZlarpd2/itq9/Rfk5mN3g9tNWT+eRm93ck+Li+EOzgyvMAQoQJ9UBWXcrZATuZJrYU
	BLkUxKHz74X2Se+VkOjyTTHTkVY9/mEfQ/r+n4bs6+foHFA0z+cR72yG02uDBPgK/qTV35gHln46y
	W2JMU5y8Vk3FVC8C/8XCzZyOh42Z6NtlYf8mdcrW7f11lBMhGgqnZCnsxRUAGQ2xTY5PxYOk9s4WW
	T7bpyMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEzk-00000004Gaa-0Fhm;
	Wed, 27 May 2026 14:12:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEzh-00000004Ga8-3I98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:12:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E0D927DC;
	Wed, 27 May 2026 07:12:19 -0700 (PDT)
Received: from [10.1.36.149] (XHFQ2J9959.cambridge.arm.com [10.1.36.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 714813F905;
	Wed, 27 May 2026 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779891144; bh=u3OCxUvtZcz8HMh6U6iOvnXk3mPDlsgfuMXPwG1nTnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MKSa8BSt9BSP9qCifI6PxRc6JlT2Rvcm3UBj7hlH3DOwlOqZ9GbA9MJXvTzduITUK
	 cN/VxqCg7WM5rVROAvZB87oajUO9GN3RvAL+HjURwBq+pFlLCnauo53bTJRALtYeAF
	 CU7fyXOpRpolf4zP8xtVI/2LDMhBuehQgWhWCh8s=
Message-ID: <a15c4d95-e277-4caa-9157-8fac37e56641@arm.com>
Date: Wed, 27 May 2026 15:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 08/14] arm64/mm: Route all pgtable writes via
 pxxval_set()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-9-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260513044547.4128549-9-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_071225_904992_3C02040D 
X-CRM114-Status: GOOD (  20.27  )
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

On 13/05/2026 05:45, Anshuman Khandual wrote:
> Currently pxxval_set() is defined as WRITE_ONCE() but this will change for
> D128 pgtable builds, for which WRITE_ONCE() is not sufficient for single
> copy atomicity.
> 
> In future this infrastructure can be used for D128 to maintain single copy
> atomicity semantics with inline asm blocks.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in RFC V2:
> 
> - Renamed all ptdesc_ instances as pxxval_ instead
> 
>  arch/arm64/include/asm/pgtable.h | 11 ++++++-----
>  arch/arm64/mm/mmu.c              |  4 ++--
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 72da582e8d12..c71bb829e9f1 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -85,6 +85,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  }
>  
>  #define pxxval_get(x)		READ_ONCE(x)
> +#define pxxval_set(x, val)	WRITE_ONCE(x, val)

Same comment as for pxxval_get(): I think it would be clearer if this was an
inline function that took a pointer.

Thanks,
Ryan


>  
>  #define pmdp_get pmdp_get
>  static inline pmd_t pmdp_get(pmd_t *pmdp)
> @@ -385,7 +386,7 @@ static inline pte_t pte_clear_uffd_wp(pte_t pte)
>  
>  static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>  {
> -	WRITE_ONCE(*ptep, pte);
> +	pxxval_set(*ptep, pte);
>  }
>  
>  static inline void __set_pte_complete(pte_t pte)
> @@ -856,7 +857,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  	}
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  
> -	WRITE_ONCE(*pmdp, pmd);
> +	pxxval_set(*pmdp, pmd);
>  
>  	if (pmd_valid(pmd))
>  		queue_pte_barriers();
> @@ -921,7 +922,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
>  		return;
>  	}
>  
> -	WRITE_ONCE(*pudp, pud);
> +	pxxval_set(*pudp, pud);
>  
>  	if (pud_valid(pud))
>  		queue_pte_barriers();
> @@ -1003,7 +1004,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>  		return;
>  	}
>  
> -	WRITE_ONCE(*p4dp, p4d);
> +	pxxval_set(*p4dp, p4d);
>  	queue_pte_barriers();
>  }
>  
> @@ -1131,7 +1132,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
>  		return;
>  	}
>  
> -	WRITE_ONCE(*pgdp, pgd);
> +	pxxval_set(*pgdp, pgd);
>  	queue_pte_barriers();
>  }
>  
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 7fbb2ef86cfa..6eb92d8f46be 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -76,7 +76,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>  	 * writable in the kernel mapping.
>  	 */
>  	if (rodata_is_rw) {
> -		WRITE_ONCE(*pgdp, pgd);
> +		pxxval_set(*pgdp, pgd);
>  		dsb(ishst);
>  		isb();
>  		return;
> @@ -84,7 +84,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>  
>  	spin_lock(&swapper_pgdir_lock);
>  	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
> -	WRITE_ONCE(*fixmap_pgdp, pgd);
> +	pxxval_set(*fixmap_pgdp, pgd);
>  	/*
>  	 * We need dsb(ishst) here to ensure the page-table-walker sees
>  	 * our new entry before set_p?d() returns. The fixmap's


