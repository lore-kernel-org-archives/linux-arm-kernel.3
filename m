Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2564CA0EEA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frhBgKzGaeGY6bSaVivBjRAP80vw7xY6RF99St5utxI=; b=OCVgkMuMVE/8DtIcXNKhFXLlvW
	8BUC2fxCsnB7OKVAWKoshRP49S57snTDMVoOSehnpcbFh6tfX7zAzHqECsJWoesdAlBWe0wqWkck2
	dYqLrB+apQDkUm91K0Af1NLqC3NCLvn7053+aEryVkL1KbOiWKvuN3bx+MhissoU85uxnXqtAgYKG
	+S2kMz+G0w8D0IRw8RjdSXt4VopyJ5Lggk0G7D8qHMFebV4ursT9FClmMwvgTlQcmWpkdreLY1j7u
	XEISyWOp8Wt/ITiisfhvqIiWXW1x5sfjDbRM+NGnG0+of2ws2xx93WqEk0t0nXwgXfIwSm7CXVe26
	wmKFv+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXn1-0000000GxYo-2Iz4;
	Thu, 14 Aug 2025 13:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUaT-0000000GUFJ-2AdW;
	Thu, 14 Aug 2025 09:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=frhBgKzGaeGY6bSaVivBjRAP80vw7xY6RF99St5utxI=; b=VbAPlzf7ns23tFBB/alHBE6FtP
	xE256gml6y6Y16qPyyBpVDYLavz2P8W72enxf8NKKPBwZtOc5nshWOtWtbynNIFjI2gsrl/AzX4eA
	pkqu7GVC2Fj/AlsmUqQlfgVKSSE3948q6wlsAZbth/k+O0+SZrboTwNMiatn3Mkz5/+VfJkINC1b7
	ukzrcW8mAm1yf+YcfYW80k4JKWg7XUfCz8S4BpDkW4B0HJyKma5J9MNEah0SUOA2opGh5Jfi4drsY
	zmHs7vk91zgQG4Gha5WEmi3Ll06avDG0c50BNEAsTiMpVqwZUs5zfbJiNHWZL26rRLlmoBn7boP/r
	JfKLNcvQ==;
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUaQ-0000000GL1k-0Tz7;
	Thu, 14 Aug 2025 09:49:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AD454495A;
	Thu, 14 Aug 2025 09:49:20 +0000 (UTC)
Message-ID: <debb39ce-5d6d-447e-9b03-62c3c951292e@ghiti.fr>
Date: Thu, 14 Aug 2025 11:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 03/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud[s]_set()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-4-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-4-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_104930_366457_10FFEDBD 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Andrew,

On 8/13/25 08:26, Andrew Donnellan wrote:
> From: Rohan McLure <rmclure@linux.ibm.com>
>
> This reverts commit 6d144436d954 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_set").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Apply this to __page_table_check_puds_set(), page_table_check_puds_set() and
> the page_table_check_pud_set() wrapper macro.
>
> [ajd@linux.ibm.com: rebase on riscv + arm64 changes, update commit message]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v13: remove inaccurate comment on riscv in the commit message
> v14: fix an x86 usage I missed (found by akpm)
> v15: rebase, amend commit message
> ---
>   arch/arm64/include/asm/pgtable.h |  3 ++-
>   arch/riscv/include/asm/pgtable.h |  4 ++--
>   arch/x86/include/asm/pgtable.h   |  4 ++--
>   include/linux/page_table_check.h | 12 ++++++------
>   mm/page_table_check.c            |  4 ++--
>   5 files changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 66b5309fcad8..8070b653c409 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -713,7 +713,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> -		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
> +		page_table_check_puds_set(mm, addr, (pud_t *)ptep,
> +					  pte_pud(pte), nr);
>   		break;
>   #endif
>   	default:
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f90..3ed0f5e4879d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -812,7 +812,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>   				pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(mm, pudp, pud);
> +	page_table_check_pud_set(mm, addr, pudp, pud);
>   	return __set_pte_at(mm, (pte_t *)pudp, pud_pte(pud));
>   }
>   
> @@ -958,7 +958,7 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
>   static inline pud_t pudp_establish(struct vm_area_struct *vma,
>   				   unsigned long address, pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> +	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
>   	return __pud(atomic_long_xchg((atomic_long_t *)pudp, pud_val(pud)));
>   }
>   
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e33df3da6980..0603793acb3a 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1220,7 +1220,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>   static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>   			      pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(mm, pudp, pud);
> +	page_table_check_pud_set(mm, addr, pudp, pud);
>   	native_set_pud(pudp, pud);
>   }
>   
> @@ -1371,7 +1371,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>   static inline pud_t pudp_establish(struct vm_area_struct *vma,
>   		unsigned long address, pud_t *pudp, pud_t pud)
>   {
> -	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> +	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
>   	if (IS_ENABLED(CONFIG_SMP)) {
>   		return xchg(pudp, pud);
>   	} else {
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 289620d4aad3..0bf18b884a12 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -21,8 +21,8 @@ void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>   		unsigned int nr);
>   void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
>   		unsigned int nr);
> -void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> -		unsigned int nr);
> +void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
> +		pud_t *pudp, pud_t pud, unsigned int nr);
>   void __page_table_check_pte_clear_range(struct mm_struct *mm,
>   					unsigned long addr,
>   					pmd_t pmd);
> @@ -86,12 +86,12 @@ static inline void page_table_check_pmds_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_puds_set(struct mm_struct *mm,
> -		pud_t *pudp, pud_t pud, unsigned int nr)
> +		unsigned long addr, pud_t *pudp, pud_t pud, unsigned int nr)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_puds_set(mm, pudp, pud, nr);
> +	__page_table_check_puds_set(mm, addr, pudp, pud, nr);
>   }
>   
>   static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
> @@ -137,7 +137,7 @@ static inline void page_table_check_pmds_set(struct mm_struct *mm,
>   }
>   
>   static inline void page_table_check_puds_set(struct mm_struct *mm,
> -		pud_t *pudp, pud_t pud, unsigned int nr)
> +		unsigned long addr, pud_t *pudp, pud_t pud, unsigned int nr)
>   {
>   }
>   
> @@ -150,6 +150,6 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>   #endif /* CONFIG_PAGE_TABLE_CHECK */
>   
>   #define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
> -#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
> +#define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
>   
>   #endif /* __LINUX_PAGE_TABLE_CHECK_H */
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 4eeca782b888..3c39e4375886 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -236,8 +236,8 @@ void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
>   }
>   EXPORT_SYMBOL(__page_table_check_pmds_set);
>   
> -void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> -		unsigned int nr)
> +void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
> +		pud_t *pudp, pud_t pud,	unsigned int nr)
>   {
>   	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
>   	unsigned int i;


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


