Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8997CCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26036eNkvcVnBbzf9PpYJagr9e/Lm8CECkkny5xN5IQ=; b=DdpDBUgTeZQAxhJ7PL+/Fces5q
	GM0vJgVd8dqXElvkJxnXSCF2H0oHCQINNTsyCuMCz9RFyzwmZjl0aggiPIA19WOf3C60e/7tB/zsM
	p3fgWgH1R78Yfa+wo2FQNGQZixUnmy7nuhjIlFl/K9aP2XQLUfRM3qPZZnM5xTA+xoor2yU6RUL7a
	liQxfk5kEDQFOD3I1J8r9mExywrWhKQCqK0AqtY1QEWB7QAZt+m05iWh/pc7+LD1vQ+blXd9vVDrk
	iJqJ4QQI5wLAPU/V+H0L1qw4VN4ruubmE62IAP1gR1H8wAWUhCbndrvGnVQslasPXNruIfxb9k/fx
	T2UJ30LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnVl-00000009Fhx-0Now;
	Mon, 03 Nov 2025 05:53:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnVi-00000009FhY-3c1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:53:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D80F28FA;
	Sun,  2 Nov 2025 21:53:38 -0800 (PST)
Received: from [10.164.136.41] (unknown [10.164.136.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BEB33F694;
	Sun,  2 Nov 2025 21:53:40 -0800 (PST)
Message-ID: <4bc562ea-2fba-4484-9548-c606e254bc00@arm.com>
Date: Mon, 3 Nov 2025 11:23:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] arm64: mm: support large block mapping when
 rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, Guenter Roeck <linux@roeck-us.net>,
 Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 david@redhat.com, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, nd@arm.com
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-4-yang@os.amperecomputing.com>
 <f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net>
 <933a2eff-1e06-451e-9994-757d66f4b985@arm.com>
 <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_215346_984059_91398C2A 
X-CRM114-Status: GOOD (  35.05  )
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

>>>>
>>> With lock debugging enabled, we see a large number of "BUG: sleeping
>>> function called from invalid context at kernel/locking/mutex.c:580"
>>> and "BUG: Invalid wait context:" backtraces when running v6.18-rc3.
>>> Please see example below.
>>>
>>> Bisect points to this patch.
>>>
>>> Please let me know if there is anything I can do to help tracking
>>> down the problem.
>> Thanks for the report - ouch!
>>
>> I expect you're running on a system that supports BBML2_NOABORT, based on the
>> stack trace, I expect you have CONFIG_DEBUG_PAGEALLOC enabled? That will cause
>> permission tricks to be played on the linear map at page allocation and free
>> time, which can happen in non-sleepable contexts. And with this patch we are
>> taking pgtable_split_lock (a mutex) in split_kernel_leaf_mapping(), which is
>> called as a result of the permission change request.
>>
>> However, when CONFIG_DEBUG_PAGEALLOC enabled we always force-map the linear map
>> by PTE so split_kernel_leaf_mapping() is actually unneccessary and will return
>> without actually having to split anything. So we could add an early "if
>> (force_pte_mapping()) return 0;" to bypass the function entirely in this case,
>> and I *think* that should solve it.
>>
>> But I'm also concerned about KFENCE. I can't remember it's exact semantics off
>> the top of my head, so I'm concerned we could see similar problems there (where
>> we only force pte mapping for the KFENCE pool).
>>
>> I'll investigate fully tomorrow and hopefully provide a fix.
> Here's a proposed fix, although I can't get access to a system with BBML2 until
> tomorrow at the earliest. Guenter, I wonder if you could check that this
> resolves your issue?
>
> ---8<---
> commit 602ec2db74e5abfb058bd03934475ead8558eb72
> Author: Ryan Roberts <ryan.roberts@arm.com>
> Date:   Sun Nov 2 11:45:18 2025 +0000
>
>      arm64: mm: Don't attempt to split known pte-mapped regions
>      
>      It has been reported that split_kernel_leaf_mapping() is trying to sleep
>      in non-sleepable context. It does this when acquiring the
>      pgtable_split_lock mutex, when either CONFIG_DEBUG_ALLOC or
>      CONFIG_KFENCE are enabled, which change linear map permissions within
>      softirq context during memory allocation and/or freeing.
>      
>      But it turns out that the memory for which these features may attempt to
>      modify the permissions is always mapped by pte, so there is no need to
>      attempt to split the mapping. So let's exit early in these cases and
>      avoid attempting to take the mutex.
>      
>      Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net/
>      Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
>      Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b8d37eb037fc..6e26f070bb49 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -708,6 +708,16 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>   	return ret;
>   }
>   
> +static inline bool force_pte_mapping(void)
> +{
> +	bool bbml2 = system_capabilities_finalized() ?
> +		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
> +
> +	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
> +			   is_realm_world())) ||
> +		debug_pagealloc_enabled();
> +}
> +
>   static DEFINE_MUTEX(pgtable_split_lock);
>   
>   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>   	if (!system_supports_bbml2_noabort())
>   		return 0;
>   
> +	/*
> +	 * If the region is within a pte-mapped area, there is no need to try to
> +	 * split. Additionally, CONFIG_DEBUG_ALLOC and CONFIG_KFENCE may change

Nit: CONFIG_DEBUG_PAGEALLOC.

> +	 * permissions from softirq context so for those cases (which are always
> +	 * pte-mapped), we must not go any further because taking the mutex
> +	 * below may sleep.
> +	 */
> +	if (force_pte_mapping() || is_kfence_address((void *)start))
> +		return 0;
> +
>   	/*
>   	 * Ensure start and end are at least page-aligned since this is the
>   	 * finest granularity we can split to.
> @@ -1009,16 +1029,6 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>   
>   #endif /* CONFIG_KFENCE */
>   
> -static inline bool force_pte_mapping(void)
> -{
> -	bool bbml2 = system_capabilities_finalized() ?
> -		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
> -
> -	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
> -			   is_realm_world())) ||
> -		debug_pagealloc_enabled();
> -}
> -

Otherwise LGTM.

Reviewed-by: Dev Jain <dev.jain@arm.com>

>   static void __init map_mem(pgd_t *pgdp)
>   {
>   	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> ---8<---
>
> Thanks,
> Ryan
>
>> Yang Shi, Do you have any additional thoughts?
>>
>> Thanks,
>> Ryan
>>

