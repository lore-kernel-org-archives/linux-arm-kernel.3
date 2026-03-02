Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D12EB3622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8oyMY3jr+S0vHkdl9eKLeMz1EaXl70n+JkBqSpDq5c=; b=wC+GEbcWIHcnDjwZdc1M5H8DBR
	Io8/dbDDKWYeYJjOjLN2MZZyAvX3hPcA19HqYiFXpGDlQKfxgyTcv5ImK6a6R4cvoTT8e79ccTMSc
	IvluMmxn3amft2V0xJKEYcrGJmv+r7L1n3pQf/badXP+pLQC0yAMkma6/jwSYTkXHJZ4fhpvf5haS
	29m5yJHMjeHIoVVI7wvE/gM3aUWIgqFD89pVRNKii/Kd3vKF1wHLCzrI+MDnICrW961y40GAusgVt
	+qpOX9uyJDwE/ZYS+iS0TQW9rHb+ZDCL1ixOilnksEAGcjxzNIUUMAEFsUzABC2FOaiI7Ifyp6tzd
	ZGk2fg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7FP-0000000Dc6d-27Yo;
	Mon, 02 Mar 2026 17:39:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7FN-0000000Dc5r-1FVn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:39:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E0114BF;
	Mon,  2 Mar 2026 09:39:48 -0800 (PST)
Received: from [10.57.81.89] (unknown [10.57.81.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62C5D3F73B;
	Mon,  2 Mar 2026 09:39:53 -0800 (PST)
Message-ID: <dca206e8-b430-4c02-aa4b-29216e3f31c6@arm.com>
Date: Mon, 2 Mar 2026 17:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] arm64: mm: Provide level hint for
 flush_tlb_page()
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
 <20260302135602.3716920-14-ryan.roberts@arm.com>
 <aaWh5XykBfGFIObI@J2N7QTR9R3>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aaWh5XykBfGFIObI@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_093957_441662_7524147E 
X-CRM114-Status: GOOD (  35.26  )
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

On 02/03/2026 14:42, Mark Rutland wrote:
> Hi Ryan,
> 
> On Mon, Mar 02, 2026 at 01:56:00PM +0000, Ryan Roberts wrote:
>> Previously tlb invalidations issued by __flush_tlb_page() did not
>> contain a level hint. But the function is clearly only ever targeting
>> level 3 tlb entries and its documentation agrees:
>>
>>   | this operation only invalidates a single, last-level page-table
>>   | entry and therefore does not affect any walk-caches
> 
> FWIW, I'd have read "last-level" as synonymous with "leaf" (i.e. a Page
> or Block entry, which is the last level of walk) rather than level 3
> specifically. The architecture uses the term to match the former (e.g.
> in the description of TLBI VALE1IS).

Hmm yeah, now that I'm re-reading, I agree that quoted documentation doesn't say
anything about it being level 3 specific.

But actually that was arm64-specific documentation for flush_tlb_page(), which
is a core-mm function. The generic docs at Documentation/core-api/cachetlb.rst
make it clear that it's intended only for PTE invalidations, I think:

  | 4) ``void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)``
  |
  |        This time we need to remove the PAGE_SIZE sized translation
  |        from the TLB. ...

> 
> If we're tightening up __flush_tlb_page(), I think it'd be worth either
> updating the comment to explicitly note that this only applies to level
> 3 entries, OR update the comment+name to say it applies to leaf entries,
> and have it take a level parameter.

I'll fix the arm64-specific docs to align with the generic docs and replace
"last-level" with "level 3" if that works for you.

> 
>> However, it turns out that the function was actually being used to
>> invalidate a level 2 mapping via flush_tlb_fix_spurious_fault_pmd(). 
>> The bug was benign because the level hint was not set so the HW would
>> still invalidate the PMD mapping, and also because the TLBF_NONOTIFY
>> flag was set, the bounds of the mapping were never used for anything
>> else.
> 
> I suspect (as above) that the current usage was intentional, legitimate
> usage, just poorly documented.

Before this series flush_tlb_fix_spurious_fault_pmd() was implemented using
local_flush_tlb_page_nonotify() which never even gives an option to set the TTL
hint, so I agree.

But I don't think flush_tlb_fix_spurious_fault_pmd() should be calling any tlb
flush api that has "page" in the name since that implies PTE, not PMD.

I think what I have done is an improvement; but I'm happy to soften/correct this
description in the next version.

> 
>> Now that we have the new and improved range-invalidation API, it is
>> trival to fix flush_tlb_fix_spurious_fault_pmd() to explicitly flush the
>> whole range (locally, without notification and last level only). So
>> let's do that, and then update __flush_tlb_page() to hint level 3.
> 
> Do we never use __flush_tlb_page() to manipulate a level 1 block
> mapping? I'd have expected we did the same lazy invalidation for
> permission relazation there, but if that's not the case, then this seems
> fine in principle.

No, there is no flush_tlb_fix_spurious_fault_pud().
(flush_tlb_fix_spurious_fault_pmd() was only added last cycle).

> 
>> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h  | 5 +++--
>>  arch/arm64/include/asm/tlbflush.h | 2 +-
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 7039931df4622..b1a96a8f2b17e 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -103,8 +103,9 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>  #define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
>>  	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
>>  
>> -#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
>> -	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
>> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)			\
>> +	__flush_tlb_range(vma, address, address + PMD_SIZE, PMD_SIZE, 2,	\
>> +			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
> 
> Is there a reason to keep __flush_tlb_page(), rather than defining
> flush_tlb_fix_spurious_fault() in terms of __flush_tlb_range() with all
> the level 3 constants?

__flush_tlb_page() is called by __ptep_clear_flush_young() and
__ptep_set_access_flags() (as well as by flush_tlb_page()). I could replace them
all, but __flush_tlb_page() is a bit less verbose... I have no strong preference.

Thanks,
Ryan

> 
> Mark.
> 
>>  
>>  /*
>>   * ZERO_PAGE is a global shared page that is always zero: used
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 5096ec7ab8650..958fe97b744e5 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -591,7 +591,7 @@ static inline void __flush_tlb_page(struct vm_area_struct *vma,
>>  	unsigned long start = round_down(uaddr, PAGE_SIZE);
>>  	unsigned long end = start + PAGE_SIZE;
>>  
>> -	__do_flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN,
>> +	__do_flush_tlb_range(vma, start, end, PAGE_SIZE, 3,
>>  			     TLBF_NOWALKCACHE | flags);
>>  }
>>  
>> -- 
>> 2.43.0
>>


