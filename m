Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4BC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67BEcOVTAEE0TOmQPQF4Hx8qLpCcB/5I8uUeqsPN1no=; b=B5JSiSLazrvIPnYfmP1bkquEdG
	YtapG20VK2MgrwYIQ7Dt6lLe6OWvH577U/5EDR51xvlKonTQhMZ6+ijvabfS5A+6k08KQG41nWqjP
	WvIA4Vq+n7wLKTtY8MHDfP8PTh+GHNqwCe6o3rkoLYxIx8E4KWXQbkRkA3AZi7cdzsT/VIiCD3/A/
	V4DHOr2O0XSKb5CUKlfueGr0ZZGJAjd8QCkytxQCsFidVF26XkYJz6AlgLHMN3hYD6Qd13pND8Uib
	/UQit4fya+x2za5SR2H1RoXSmwnH0cFByTpEpmqdIjb6bmntapN+4IiK6+hngUAaBmOGjo1i6dchA
	hAzcf5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1e8-00000006MTW-41r9;
	Thu, 06 Feb 2025 13:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1bw-00000006Lvi-1P9a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:08:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82F8FEC;
	Thu,  6 Feb 2025 05:08:25 -0800 (PST)
Received: from [10.57.80.166] (unknown [10.57.80.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB8383F5A1;
	Thu,  6 Feb 2025 05:07:59 -0800 (PST)
Message-ID: <fde425d3-699e-4e72-8823-2f50629468d0@arm.com>
Date: Thu, 6 Feb 2025 13:07:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/16] mm/page_table_check: Batch-check pmds/puds just
 like ptes
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-6-ryan.roberts@arm.com>
 <d86b6d7f-0ab3-4737-85cd-70cddcffc1e8@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <d86b6d7f-0ab3-4737-85cd-70cddcffc1e8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050804_409117_8D9AEBF1 
X-CRM114-Status: GOOD (  19.42  )
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

On 06/02/2025 10:55, Anshuman Khandual wrote:
> On 2/5/25 20:39, Ryan Roberts wrote:
>> Convert page_table_check_p[mu]d_set(...) to
>> page_table_check_p[mu]ds_set(..., nr) to allow checking a contiguous set
>> of pmds/puds in single batch. We retain page_table_check_p[mu]d_set(...)
>> as macros that call new batch functions with nr=1 for compatibility.
>>
>> arm64 is about to reorganise its pte/pmd/pud helpers to reuse more code
>> and to allow the implementation for huge_pte to more efficiently set
>> ptes/pmds/puds in batches. We need these batch-helpers to make the
>> refactoring possible.
> 
> A very small nit.
> 
> Although this justification here is reasonable enough but not sure if
> platform specific requirements, need to be spelled out in such detail
> for a generic MM change.

Personally I find the "why" to be the most useful part of a commit log. I'd
prefer to leave it in unless any mm people complain.


> 
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
> 
> Regardless, LGTM.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks!

> 
>>  include/linux/page_table_check.h | 30 +++++++++++++++++-----------
>>  mm/page_table_check.c            | 34 +++++++++++++++++++-------------
>>  2 files changed, 38 insertions(+), 26 deletions(-)
>>
>> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
>> index 6722941c7cb8..289620d4aad3 100644
>> --- a/include/linux/page_table_check.h
>> +++ b/include/linux/page_table_check.h
>> @@ -19,8 +19,10 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
>>  void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
>>  void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>>  		unsigned int nr);
>> -void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
>> -void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
>> +void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
>> +		unsigned int nr);
>> +void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
>> +		unsigned int nr);
>>  void __page_table_check_pte_clear_range(struct mm_struct *mm,
>>  					unsigned long addr,
>>  					pmd_t pmd);
>> @@ -74,22 +76,22 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>>  	__page_table_check_ptes_set(mm, ptep, pte, nr);
>>  }
>>  
>> -static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
>> -					    pmd_t pmd)
>> +static inline void page_table_check_pmds_set(struct mm_struct *mm,
>> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>>  {
>>  	if (static_branch_likely(&page_table_check_disabled))
>>  		return;
>>  
>> -	__page_table_check_pmd_set(mm, pmdp, pmd);
>> +	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
>>  }
>>  
>> -static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
>> -					    pud_t pud)
>> +static inline void page_table_check_puds_set(struct mm_struct *mm,
>> +		pud_t *pudp, pud_t pud, unsigned int nr)
>>  {
>>  	if (static_branch_likely(&page_table_check_disabled))
>>  		return;
>>  
>> -	__page_table_check_pud_set(mm, pudp, pud);
>> +	__page_table_check_puds_set(mm, pudp, pud, nr);
>>  }
>>  
>>  static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>> @@ -129,13 +131,13 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>>  {
>>  }
>>  
>> -static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
>> -					    pmd_t pmd)
>> +static inline void page_table_check_pmds_set(struct mm_struct *mm,
>> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>>  {
>>  }
>>  
>> -static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
>> -					    pud_t pud)
>> +static inline void page_table_check_puds_set(struct mm_struct *mm,
>> +		pud_t *pudp, pud_t pud, unsigned int nr)
>>  {
>>  }
>>  
>> @@ -146,4 +148,8 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>>  }
>>  
>>  #endif /* CONFIG_PAGE_TABLE_CHECK */
>> +
>> +#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
>> +#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
>> +
>>  #endif /* __LINUX_PAGE_TABLE_CHECK_H */
>> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
>> index 509c6ef8de40..dae4a7d776b3 100644
>> --- a/mm/page_table_check.c
>> +++ b/mm/page_table_check.c
>> @@ -234,33 +234,39 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
>>  		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
>>  }
>>  
>> -void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
>> +void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
>> +		unsigned int nr)
>>  {
>> +	unsigned int i;
>> +	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
>> +
>>  	if (&init_mm == mm)
>>  		return;
>>  
>>  	page_table_check_pmd_flags(pmd);
>>  
>> -	__page_table_check_pmd_clear(mm, *pmdp);
>> -	if (pmd_user_accessible_page(pmd)) {
>> -		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
>> -				     pmd_write(pmd));
>> -	}
>> +	for (i = 0; i < nr; i++)
>> +		__page_table_check_pmd_clear(mm, *(pmdp + i));
>> +	if (pmd_user_accessible_page(pmd))
>> +		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
>>  }
>> -EXPORT_SYMBOL(__page_table_check_pmd_set);
>> +EXPORT_SYMBOL(__page_table_check_pmds_set);
>>  
>> -void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
>> +void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
>> +		unsigned int nr)
>>  {
>> +	unsigned int i;
>> +	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
>> +
>>  	if (&init_mm == mm)
>>  		return;
>>  
>> -	__page_table_check_pud_clear(mm, *pudp);
>> -	if (pud_user_accessible_page(pud)) {
>> -		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
>> -				     pud_write(pud));
>> -	}
>> +	for (i = 0; i < nr; i++)
>> +		__page_table_check_pud_clear(mm, *(pudp + i));
>> +	if (pud_user_accessible_page(pud))
>> +		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
>>  }
>> -EXPORT_SYMBOL(__page_table_check_pud_set);
>> +EXPORT_SYMBOL(__page_table_check_puds_set);
>>  
>>  void __page_table_check_pte_clear_range(struct mm_struct *mm,
>>  					unsigned long addr,


