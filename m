Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF4CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AFXCAHPRQumX4StFM3HBjOpTzzyNsm4CK0xTxitAPM=; b=wt+A11tGBBZIGUk0diZ617Kt1D
	N4XFxVcFZn+D7d31fWKs/ZhFbiG9JQzVBICPQNRFNEwTJcDVaVGjKXK3wx/J9WL3aI+7V53nPW0fE
	j9FrASdEyApdVsiJA6zkwdWjP1lLr7QhZmkpMhf24gTJz5xUhTx9dxSnO6jelMln3+TiHG7kMEm1o
	Novt/pFXQqKW3dmWTbMU6E/7bXHtHVq2/pMXm2BqSShkLCRTv4i+3PaiIq4k6Ef/TLYO4VRTZyBam
	I6eckfiEZnWcQ86DIos9pUhZykmrvwZfTczDTX+yQ1DwmsasQIbS/ftpzd8vJ2bJ6LtRm8ZyNXUAf
	M3AIGqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXnJ-0000000Gy3W-0ZuF;
	Thu, 14 Aug 2025 13:15:01 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUkx-0000000GVkB-0MD2;
	Thu, 14 Aug 2025 10:00:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C73B432BC;
	Thu, 14 Aug 2025 10:00:16 +0000 (UTC)
Message-ID: <10fd7e8b-90ae-40e7-836a-23aedcafc822@ghiti.fr>
Date: Thu, 14 Aug 2025 12:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 08/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pte_clear()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-9-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-9-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_030023_263940_F7B4AB3F 
X-CRM114-Status: GOOD (  19.79  )
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
> This reverts commit aa232204c468 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pte_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> [ajd@linux.ibm.com: rebase, fix additional occurrence and loop handling]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v13: fix an additional occurrence
> v15: rebase, fix loop handling
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/riscv/include/asm/pgtable.h |  2 +-
>   arch/x86/include/asm/pgtable.h   |  4 ++--
>   include/linux/page_table_check.h | 11 +++++++----
>   include/linux/pgtable.h          |  4 ++--
>   mm/page_table_check.c            |  7 ++++---
>   6 files changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index dfcdf051b114..2203ebac81d9 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1367,7 +1367,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
>   
>   	switch (pgsize) {
>   	case PAGE_SIZE:
> -		page_table_check_pte_clear(mm, pte);
> +		page_table_check_pte_clear(mm, address, pte);
>   		break;
>   	case PMD_SIZE:
>   		page_table_check_pmd_clear(mm, address, pte_pmd(pte));
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d11fc6333606..d60e1604852d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -591,7 +591,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>   {
>   	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
>   
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, address, pte);
>   
>   	return pte;
>   }
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index b68bea15f32d..63350b76c0c6 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1251,7 +1251,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>   				       pte_t *ptep)
>   {
>   	pte_t pte = native_ptep_get_and_clear(ptep);
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, addr, pte);
>   	return pte;
>   }
>   
> @@ -1267,7 +1267,7 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
>   		 * care about updates and native needs no locking
>   		 */
>   		pte = native_local_ptep_get_and_clear(ptep);
> -		page_table_check_pte_clear(mm, pte);
> +		page_table_check_pte_clear(mm, addr, pte);
>   	} else {
>   		pte = ptep_get_and_clear(mm, addr, ptep);
>   	}
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 3973b69ae294..12268a32e8be 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -14,7 +14,8 @@ extern struct static_key_true page_table_check_disabled;
>   extern struct page_ext_operations page_table_check_ops;
>   
>   void __page_table_check_zero(struct page *page, unsigned int order);
> -void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
> +void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
> +				  pte_t pte);
>   void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
>   				  pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
> @@ -45,12 +46,13 @@ static inline void page_table_check_free(struct page *page, unsigned int order)
>   	__page_table_check_zero(page, order);
>   }
>   
> -static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
> +static inline void page_table_check_pte_clear(struct mm_struct *mm,
> +					      unsigned long addr, pte_t pte)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pte_clear(mm, pte);
> +	__page_table_check_pte_clear(mm, addr, pte);
>   }
>   
>   static inline void page_table_check_pmd_clear(struct mm_struct *mm,
> @@ -119,7 +121,8 @@ static inline void page_table_check_free(struct page *page, unsigned int order)
>   {
>   }
>   
> -static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
> +static inline void page_table_check_pte_clear(struct mm_struct *mm,
> +					      unsigned long addr, pte_t pte)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index d97f40f1365d..c85e0e1c1f97 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -494,7 +494,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>   {
>   	pte_t pte = ptep_get(ptep);
>   	pte_clear(mm, address, ptep);
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, address, pte);
>   	return pte;
>   }
>   #endif
> @@ -553,7 +553,7 @@ static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
>   	 * No need for ptep_get_and_clear(): page table check doesn't care about
>   	 * any bits that could have been set by HW concurrently.
>   	 */
> -	page_table_check_pte_clear(mm, pte);
> +	page_table_check_pte_clear(mm, addr, pte);
>   }
>   
>   #ifdef CONFIG_GUP_GET_PXX_LOW_HIGH
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index e8c26b616aed..1c33439b9c0b 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -145,7 +145,8 @@ void __page_table_check_zero(struct page *page, unsigned int order)
>   	rcu_read_unlock();
>   }
>   
> -void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
> +void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
> +				  pte_t pte)
>   {
>   	if (&init_mm == mm)
>   		return;
> @@ -206,7 +207,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
>   	page_table_check_pte_flags(pte);
>   
>   	for (i = 0; i < nr; i++)
> -		__page_table_check_pte_clear(mm, ptep_get(ptep + i));
> +		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep + i));
>   	if (pte_user_accessible_page(pte))
>   		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
>   }
> @@ -268,7 +269,7 @@ void __page_table_check_pte_clear_range(struct mm_struct *mm,
>   		if (WARN_ON(!ptep))
>   			return;
>   		for (i = 0; i < PTRS_PER_PTE; i++) {
> -			__page_table_check_pte_clear(mm, ptep_get(ptep));
> +			__page_table_check_pte_clear(mm, addr, ptep_get(ptep));
>   			addr += PAGE_SIZE;
>   			ptep++;
>   		}


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


