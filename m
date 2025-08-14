Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2S1B3uDCP0V6cOw8J5BBf2RKM299o8V1mNT79lVcT6E=; b=13G8Gmcko3WNnC9nr6W5tvuv10
	9RIjp6Vq0kvFhTxFyxEw8R5rKdFhw1KNxoXRhJxyZyV2QLzBa3ROAuOrTnqLMp2HimXXWTml4qLOC
	9LkHU2vwCcfnWv3lHauPnebsXEdBZCcAaWyNwX+IsvWvEhDZrA6AZaqvJ/COlArldI+FZ69yqRdFV
	v/mVRZMbrb/2dlw1CFFeT7HvDGsolITwQkg3/vGVLSI9oXRhATQuoIb7gJxhkHdJdxRx3/x3cv9hj
	oHaHng2M0TLJKG+QoBUkKx2w2gPHvLeX7w7UHbjbMt2Bk8JyutisHN6fk+9fl+IWRNe6W/neOVgj0
	91RrpfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXn3-0000000Gxd6-3plU;
	Thu, 14 Aug 2025 13:14:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUb5-0000000GUIO-3kiy;
	Thu, 14 Aug 2025 09:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2S1B3uDCP0V6cOw8J5BBf2RKM299o8V1mNT79lVcT6E=; b=RhbkH+dBVmpeTsSL2VE5KbinKL
	3HHJKNcYjF0piXDQYbrYleH43Kkj27EVtn0Brpbpxsdl3tvzmtZwXVWGz9AR0ur+/8B3G+3yry4ZA
	8aKj0L9/wrrC0fbSEIL0oF2MJ5JuI6ohclM30L0bcqIwOGzm9c7Mr4onbzozB2i3CAePSw3cXau1/
	iDBh5eDpJy1zJs+omLBmaETuWlc+0mxdpgZx9rEHZmcdNCvi8I4I1nh34yxNstKxkzFTduf7dDRVu
	Ft62VxghzHoKL6oDVPjrbxFO7yBJndOHpVvxudK6ZlepWKNLmjsPkDoADgYx9Jfw2tajhDdCutr9C
	J2cLF34w==;
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUb2-0000000GL5u-1s3Y;
	Thu, 14 Aug 2025 09:50:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8022243214;
	Thu, 14 Aug 2025 09:50:03 +0000 (UTC)
Message-ID: <77670b86-1212-4547-a119-a876e4948b33@ghiti.fr>
Date: Thu, 14 Aug 2025 11:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 04/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd[s]_set()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-5-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-5-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_105008_627188_E5B6FB33 
X-CRM114-Status: GOOD (  18.05  )
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


On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit a3b837130b58 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pmd_set").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Apply this to __page_table_check_pmds_set(), page_table_check_pmd_set(), and
> the page_table_check_pmd_set() wrapper macro.
>
> [ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v13: remove inaccurate comment on riscv in the commit message
> v14: rebase
> v15: rebase, amend commit message
> ---
>   arch/arm64/include/asm/pgtable.h |  5 +++--
>   arch/riscv/include/asm/pgtable.h |  4 ++--
>   arch/x86/include/asm/pgtable.h   |  4 ++--
>   include/linux/page_table_check.h | 12 ++++++------
>   mm/page_table_check.c            |  4 ++--
>   5 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 8070b653c409..9fe3af8b4cad 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -709,7 +709,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
>   		page_table_check_ptes_set(mm, ptep, pte, nr);
>   		break;
>   	case PMD_SIZE:
> -		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
> +		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
> +					  pte_pmd(pte), nr);
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> @@ -1514,7 +1515,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   		unsigned long address, pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
>   }
>   #endif
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 3ed0f5e4879d..6e8c3d19f96a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -805,7 +805,7 @@ static inline pud_t pud_mkspecial(pud_t pud)
>   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   				pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(mm, pmdp, pmd);
> +	page_table_check_pmd_set(mm, addr, pmdp, pmd);
>   	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
>   }
>   
> @@ -876,7 +876,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   				unsigned long address, pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
>   }
>   
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 0603793acb3a..8ee301b16b50 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1213,7 +1213,7 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
>   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   			      pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(mm, pmdp, pmd);
> +	page_table_check_pmd_set(mm, addr, pmdp, pmd);
>   	set_pmd(pmdp, pmd);
>   }
>   
> @@ -1356,7 +1356,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   		unsigned long address, pmd_t *pmdp, pmd_t pmd)
>   {
> -	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>   	if (IS_ENABLED(CONFIG_SMP)) {
>   		return xchg(pmdp, pmd);
>   	} else {
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 0bf18b884a12..cf7c28d8d468 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -19,8 +19,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
>   void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>   		unsigned int nr);
> -void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
> -		unsigned int nr);
> +void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
>   void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
>   		pud_t *pudp, pud_t pud, unsigned int nr);
>   void __page_table_check_pte_clear_range(struct mm_struct *mm,
> @@ -77,12 +77,12 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_pmds_set(struct mm_struct *mm,
> -		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
> +		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
> +	__page_table_check_pmds_set(mm, addr, pmdp, pmd, nr);
>   }
>   
>   static inline void page_table_check_puds_set(struct mm_struct *mm,
> @@ -132,7 +132,7 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_pmds_set(struct mm_struct *mm,
> -		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
> +		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>   {
>   }
>   
> @@ -149,7 +149,7 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>   
>   #endif /* CONFIG_PAGE_TABLE_CHECK */
>   
> -#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
> +#define page_table_check_pmd_set(mm, addr, pmdp, pmd)	page_table_check_pmds_set(mm, addr, pmdp, pmd, 1)
>   #define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
>   
>   #endif /* __LINUX_PAGE_TABLE_CHECK_H */
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 3c39e4375886..09258f2ad93f 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -218,8 +218,8 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
>   		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
>   }
>   
> -void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
> -		unsigned int nr)
> +void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>   {
>   	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
>   	unsigned int i;



Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


