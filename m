Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120C5CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7HALERGN5G1JxCktbFRVEITsXgQmzqpouuUe3GDuCw=; b=azL1bYsZVuvAbS+FIXsnuMRk25
	5WWAVBKHZGPFKpnlqjG9UcSuPEiZXU7wINnOExs4Uhg/9YX6MUvClzcn4WISYAhRHxTls0RDu5pRz
	F3XJNbwtKuec5mkDP/6qOWRF+JDcAALCoRvF6SBgPU9Dz52dt4N0DR6goXxpiRPTNRcqzfP2GIlGT
	yRErvhRUhxL9CwESwJKB4FKTSgY6JgGs4AVutvuThJsIC3WlpZ4/bHcK/numyEF9l7Um2cqAwrTGg
	6uRcVUNKuQvlAB65utIDH15Cc1bNTfbJNgVDJnzkX0hzhxUWF091w7TbgX8f+JmJCR2zrqdYUp2Xj
	4EI0o7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYzQ-0000000HGac-2wU0;
	Thu, 14 Aug 2025 14:31:36 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWoA-0000000Goy4-46xo;
	Thu, 14 Aug 2025 12:11:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E68F2059F;
	Thu, 14 Aug 2025 12:11:45 +0000 (UTC)
Message-ID: <5aa057d0-dc76-4723-80d1-82065320a428@ghiti.fr>
Date: Thu, 14 Aug 2025 14:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 06/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, Rohan McLure <rmclure@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
 <20250813062614.51759-7-ajd@linux.ibm.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250813062614.51759-7-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduleefrdeffedrheejrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelfedrfeefrdehjedrudelledphhgvlhhopegludelvddrudeikedrvddvrddutddungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrjhgusehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_051151_169776_2E7A5298 
X-CRM114-Status: GOOD (  19.14  )
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
> This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> [ajd@linux.ibm.com: rebase on arm64 changes]
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v15: rebase
> ---
>   arch/arm64/include/asm/pgtable.h |  2 +-
>   arch/x86/include/asm/pgtable.h   |  2 +-
>   include/linux/page_table_check.h | 11 +++++++----
>   include/linux/pgtable.h          |  2 +-
>   mm/page_table_check.c            |  5 +++--
>   5 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 06ea6a4f300b..81f06e5e32b2 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1374,7 +1374,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
>   		break;
>   #ifndef __PAGETABLE_PMD_FOLDED
>   	case PUD_SIZE:
> -		page_table_check_pud_clear(mm, pte_pud(pte));
> +		page_table_check_pud_clear(mm, address, pte_pud(pte));
>   		break;
>   #endif
>   	default:
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 8ee301b16b50..8b45e0c41923 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1329,7 +1329,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
>   {
>   	pud_t pud = native_pudp_get_and_clear(pudp);
>   
> -	page_table_check_pud_clear(mm, pud);
> +	page_table_check_pud_clear(mm, addr, pud);
>   
>   	return pud;
>   }
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 66e109238416..808cc3a48c28 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -16,7 +16,8 @@ extern struct page_ext_operations page_table_check_ops;
>   void __page_table_check_zero(struct page *page, unsigned int order);
>   void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
>   void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
> -void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
> +void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
> +				  pud_t pud);
>   void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pte, unsigned int nr);
>   void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
> @@ -59,12 +60,13 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
>   	__page_table_check_pmd_clear(mm, pmd);
>   }
>   
> -static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
> +static inline void page_table_check_pud_clear(struct mm_struct *mm,
> +					      unsigned long addr, pud_t pud)
>   {
>   	if (static_branch_likely(&page_table_check_disabled))
>   		return;
>   
> -	__page_table_check_pud_clear(mm, pud);
> +	__page_table_check_pud_clear(mm, addr, pud);
>   }
>   
>   static inline void page_table_check_ptes_set(struct mm_struct *mm,
> @@ -123,7 +125,8 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
>   {
>   }
>   
> -static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
> +static inline void page_table_check_pud_clear(struct mm_struct *mm,
> +					      unsigned long addr, pud_t pud)
>   {
>   }
>   
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8aab3fa19c85..28fcff844b63 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -661,7 +661,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
>   	pud_t pud = *pudp;
>   
>   	pud_clear(pudp);
> -	page_table_check_pud_clear(mm, pud);
> +	page_table_check_pud_clear(mm, address, pud);
>   
>   	return pud;
>   }
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 0957767a2940..bd1242087a35 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -167,7 +167,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
>   }
>   EXPORT_SYMBOL(__page_table_check_pmd_clear);
>   
> -void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
> +void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
> +				  pud_t pud)
>   {
>   	if (&init_mm == mm)
>   		return;
> @@ -246,7 +247,7 @@ void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
>   		return;
>   
>   	for (i = 0; i < nr; i++)
> -		__page_table_check_pud_clear(mm, *(pudp + i));
> +		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
>   	if (pud_user_accessible_page(pud))
>   		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
>   }


So this made me realize we (riscv) did not implement 
pudp_huge_get_and_clear(), which was a mistake since we support THP PUD. 
I have implemented this function in this patch 
https://lore.kernel.org/all/20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com/T/#u

That's a fix so I'll merge it in 6.17 (at least I'll try) so your 
patchset will break the build on riscv, I'll keep you posted when it 
gets merged!

Thanks,

Alex


