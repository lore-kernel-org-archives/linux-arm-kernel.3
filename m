Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB1DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIlwYQni2qIIwnM0SIVj/CB1fG/A16BlOaqLFYL53f8=; b=wWvtimLv8YIGgEzsqGEsk7lY27
	nPVmcXaglGWo42+Jbnniz5vk3toS4UbcmEYM0aCjk7GTMzQvHtoi4kC322YryJftv4jWkrQD++DUk
	YovR+F0lmyt2EAX4ugc9Zwt9yIRrhr2f2NpezkUNwmF/MEcHxrzY1PvVQoQ+D3tRu8PC3MCGmNiJB
	BCZ1QAmbjSejnKDsr84yFJ5PwQhlbZ02UcdCwuOQulzemD5Sgob+Lo4z5GKs5TfqwNH8Wq/TRbyy2
	12MQU8wLJjujCO5h6zZIk4QR3atukrcJ0muDNlc5AKv3mwb/7le2GvLbI8vIV4bxmAtnz4VZIIngc
	SltfMV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXn7-0000000GxkN-3gtD;
	Thu, 14 Aug 2025 13:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUbe-0000000GUL6-3Vlm;
	Thu, 14 Aug 2025 09:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wIlwYQni2qIIwnM0SIVj/CB1fG/A16BlOaqLFYL53f8=; b=hHKMUdbin7KqLSwR5OkdiL34gL
	6av9Mi7EdIgITRWTQagitE8CybsNjBVfqW0PgzSCWGpMBfA4dwmMlTxHMYglEzVSaWSFF3QNWr52f
	whsYb0h43D/7saNhvy4+3hEHsOpVgGOZYpeegY4itq5o3IIFlfI1l4+Ijs+HaiQcIZqu61N8WRpUb
	/JULvnOKQsSGDPZ2c8n5ME9M8GOCIN4QnBaJtdL+BS1hbsjc3UPXyvv2BVVa5tGSWEwlxhkbUXgvH
	EJpaTqjvHEFkRoeZItJ8ddJju7kiAIbPc5QoxuPHsIpr/RZsHCbkN049wGGPZYG9HsWv5uQeuBMO+
	g65vB+vg==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUbb-0000000GLC3-0WLM;
	Thu, 14 Aug 2025 09:50:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8036443391;
	Thu, 14 Aug 2025 09:50:37 +0000 (UTC)
Message-ID: <1a7d8550-127a-4f72-8b20-5d5898d0a5ef@ghiti.fr>
Date: Thu, 14 Aug 2025 11:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 05/13] mm/page_table_check: Provide addr parameter to
 page_table_check_ptes_set()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-6-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-6-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghjugeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_105043_418327_154EC973 
X-CRM114-Status: GOOD (  15.47  )
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
> To provide support for powerpc platforms, provide an addr parameter to
> the __page_table_check_ptes_set() and page_table_check_ptes_set() routines.
> This parameter is needed on some powerpc platforms which do not encode whether
> a mapping is for user or kernel in the pte. On such platforms, this can be
> inferred from the addr parameter.
>
> [ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v15: rebase, amend commit message
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/riscv/include/asm/pgtable.h |  2 +-
>   include/linux/page_table_check.h | 12 +++++++-----
>   include/linux/pgtable.h          |  2 +-
>   mm/page_table_check.c            |  4 ++--
>   5 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 9fe3af8b4cad..06ea6a4f300b 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -706,7 +706,7 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
>   
>   	switch (pgsize) {
>   	case PAGE_SIZE:
> -		page_table_check_ptes_set(mm, ptep, pte, nr);
> +		page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>   		break;
>   	case PMD_SIZE:
>   		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 6e8c3d19f96a..2484c0788012 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -560,7 +560,7 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
>   static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pteval, unsigned int nr)
>   {
> -	page_table_check_ptes_set(mm, ptep, pteval, nr);
> +	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
>   
>   	for (;;) {
>   		__set_pte_at(mm, ptep, pteval);
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index cf7c28d8d468..66e109238416 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -17,8 +17,8 @@ void __page_table_check_zero(struct page *page, unsigned int order);
>   void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
>   void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
>   void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
> -void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> -		unsigned int nr);
> +void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
> +		pte_t *ptep, pte_t pte, unsigned int nr);
>   void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
>   		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
>   void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
> @@ -68,12 +68,13 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
>   }
>   
>   static inline void page_table_check_ptes_set(struct mm_struct *mm,
> -		pte_t *ptep, pte_t pte, unsigned int nr)
> +					     unsigned long addr, pte_t *ptep,
> +					     pte_t pte, unsigned int nr)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_ptes_set(mm, ptep, pte, nr);
> +	__page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>   }
>   
>   static inline void page_table_check_pmds_set(struct mm_struct *mm,
> @@ -127,7 +128,8 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
>   }
>   
>   static inline void page_table_check_ptes_set(struct mm_struct *mm,
> -		pte_t *ptep, pte_t pte, unsigned int nr)
> +					     unsigned long addr, pte_t *ptep,
> +					     pte_t pte, unsigned int nr)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c035637eeb7..8aab3fa19c85 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -289,7 +289,7 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>   static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pte, unsigned int nr)
>   {
> -	page_table_check_ptes_set(mm, ptep, pte, nr);
> +	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>   
>   	for (;;) {
>   		set_pte(ptep, pte);
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 09258f2ad93f..0957767a2940 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -193,8 +193,8 @@ static inline void page_table_check_pte_flags(pte_t pte)
>   		WARN_ON_ONCE(swap_cached_writable(pte_to_swp_entry(pte)));
>   }
>   
> -void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> -		unsigned int nr)
> +void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
> +				 pte_t *ptep, pte_t pte, unsigned int nr)
>   {
>   	unsigned int i;
>   

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


