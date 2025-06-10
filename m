Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE5C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8/nAMMkT1vU1loQqRhH4tBCD1KS79CJwFBdEkPVHUM=; b=uX8KjcPgaBL2TopSw7qINfZGLa
	9GNuvGlsJi3lsTltfRVampw9Ll2btrFBePfxQOegbFzMiNVoClxBaGjj5mQRGecdEb27wShT/Zkz0
	Vg6N4+Ry7mJOodE4R2Ot1C1xzcBZywUig5F1bvn6J6EhCZ2TO2luivFvJslhMWOVt0iLGGxzR0qXr
	9m6QGyCVGHmz6BQ9rcdcIV5SJuG6/mdobIAEOmEu+wUBWvO8CQVT/WZNhkNSk4ArPxjNmYtYAGk+8
	LafKlC66AI7V0pabkQR8De0uSis+KGE+aH7/yCJuwCm7MaR50IPOzg2PTPWRLwuXj9cqIv+9VkKC0
	1XJnzPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1lD-00000007SLx-3tOo;
	Tue, 10 Jun 2025 16:23:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzDv-000000070lo-2Qsu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:41:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE38914BF;
	Tue, 10 Jun 2025 06:40:44 -0700 (PDT)
Received: from [10.1.33.221] (XHFQ2J9959.cambridge.arm.com [10.1.33.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CFB73F59E;
	Tue, 10 Jun 2025 06:41:02 -0700 (PDT)
Message-ID: <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
Date: Tue, 10 Jun 2025 14:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aEgeQCCzRt-B8_nW@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064107_721833_61D9A186 
X-CRM114-Status: GOOD (  39.34  )
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

On 10/06/2025 13:00, Catalin Marinas wrote:
> On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
>> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
>> provided a quick fix to ensure that lazy_mmu_mode continues to work when
>> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
>> nest.
>>
>> The solution in that patch is the make the implementation tolerant to
> 
> s/is the make/is to make/
> 
>> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
>> exit becomes a nop. But this sacrifices the optimization opportunity for
>> the remainder of the outer user.
> [...]
>> I wonder if you might be willing to take this for v6.16? I think its a neater
>> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
>> lazy_mmu_mode to be nested") - which is already in Linus's master.
>>
>> To be clear, the current solution is safe, I just think this is much neater.
> 
> Maybe better, though I wouldn't say much neater. One concern I have is
> about whether we'll get other such nesting in the future and we need to
> fix them in generic code. Here we control __kernel_map_pages() but we
> may not for other cases.
> 
> Is it the fault of the arch code that uses apply_to_page_range() via
> __kernel_map_pages()? It feels like it shouldn't care about the lazy
> mode as that's some detail of the apply_to_page_range() implementation.
> Maybe this API should just allow nesting.

I don't think it is possible to properly support nesting:

enter_lazy_mmu
    for_each_pte {
        read/modify-write pte

        alloc_page
            enter_lazy_mmu
                make page valid
            exit_lazy_mmu

        write_to_page
    }
exit_lazy_mmu

This example only works because lazy_mmu doesn't support nesting. The "make page
valid" operation is completed by the time of the inner exit_lazy_mmu so that the
page can be accessed in write_to_page. If nesting was supported, the inner
exit_lazy_mmu would become a nop and write_to_page would explode.

So the conclusion I eventually came to (after being nudged by Mike Rapoport at
[1]) is that this _is_ arm64's fault for creating a loop via
apply_to_page_range(). So I'm trying to fix this by breaking the loop.

[1] https://lore.kernel.org/all/aDqz7H-oBo35FRXe@kernel.org/

> 
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 88db8a0c0b37..9f387337ccc3 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -83,21 +83,11 @@ static inline void queue_pte_barriers(void)
>>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>>  static inline void arch_enter_lazy_mmu_mode(void)
>>  {
>> -	/*
>> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
>> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
>> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
>> -	 * permissions on the linear map with apply_to_page_range(), which
>> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
>> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
>> -	 * flush and clear the flag such that the remainder of the work in the
>> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
>> -	 * keeps tracking simple.
>> -	 */
>> -
>>  	if (in_interrupt())
>>  		return;
>>
>> +	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
> 
> This warning is good to have back.
> 
>> +
>>  	set_thread_flag(TIF_LAZY_MMU);
>>  }
>>
>> @@ -119,6 +109,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>  	clear_thread_flag(TIF_LAZY_MMU);
>>  }
>>
>> +static inline bool arch_in_lazy_mmu_mode(void)
>> +{
>> +	if (in_interrupt())
>> +		return false;
>> +
>> +	return test_thread_flag(TIF_LAZY_MMU);
>> +}
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 04d4a8f676db..4da7a847d5f3 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -293,18 +293,29 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>>  }
>>
>>  #ifdef CONFIG_DEBUG_PAGEALLOC
>> -/*
>> - * This is - apart from the return value - doing the same
>> - * thing as the new set_direct_map_valid_noflush() function.
>> - *
>> - * Unify? Explain the conceptual differences?
>> - */
>>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>>  {
>> +	bool lazy_mmu;
>> +
>>  	if (!can_set_direct_map())
>>  		return;
>>
>> +	/*
>> +	 * This is called during page alloc or free, and maybe called while in
>> +	 * lazy mmu mode. Since set_memory_valid() may also enter lazy mmu mode,
>> +	 * this would cause nesting which is not supported; the inner call to
>> +	 * exit the mode would exit, meaning that the outer lazy mmu mode is no
>> +	 * longer benefiting from the optimization. So temporarily leave lazy
>> +	 * mmu mode for the duration of the call.
>> +	 */
>> +	lazy_mmu = arch_in_lazy_mmu_mode();
>> +	if (lazy_mmu)
>> +		arch_leave_lazy_mmu_mode();
>> +
>>  	set_memory_valid((unsigned long)page_address(page), numpages, enable);
>> +
>> +	if (lazy_mmu)
>> +		arch_enter_lazy_mmu_mode();
>>  }
>>  #endif /* CONFIG_DEBUG_PAGEALLOC */
> 
> So basically you are flattening the enter/leave_lazy_mmu_mode() regions.
> Ideally this could have been done by the nesting
> arch_enter_lazy_mmu_mode() automatically but that means this function
> returning the current mode and arch_leave_lazy_mmu_mode() taking an
> argument - more like the irq saving/restoring (even better renaming it
> to arch_restore_lazy_mmu_mode()). I guess this won't go well with the mm
> folk who don't seem willing to changes in this area.

We could alternatively use some per-cpu storage for a nest count, but that gets
ugly quite quickly I suspect. But regardless, I'm not convinced the semantics of
a properly nested lazy_mmu are safe.

Thanks,
Ryan

> 
> FWIW, this patch is correct.
> 


