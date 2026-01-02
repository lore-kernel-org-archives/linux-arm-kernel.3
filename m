Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB1DFA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rs0ewTamSeyHzE+MdyrTQgcrGCNL+bMRAk3KuzzXgSg=; b=hW/QjattzxDZoSBkCv9mkeuIbN
	LojCzXYf7btQTzr8PCDeInNtheGBppMDDcIy5F5Hb1HVrSMlVOEkpGEjmxt62j9GRf9X14vOrbzB+
	cIGa8HPfvtBfEmhC/kgceHab7oPmkMRb4yBvBJzQGxFDt6Mk4pmQ1UbN6NArAzKGBGsofqG6D/DQF
	4GC4LmUogQwL3jhO1R7VdZb19jYKT7kAsn0XJVQvH2OT9gXdbDTNACcCXx557OIhkUb8HpJ3qCMVt
	mJYG/3LcD3+f7LI8fhuCiMaTBTiZayQMCnJMtvxE1YG2+hBgiUqif1ZcF3bFPxIjdlmkqZgkH6e4m
	FRJJtBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbh0U-00000008Qgw-4AYw;
	Fri, 02 Jan 2026 15:24:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbh0S-00000008QgN-0RbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:24:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C849F497;
	Fri,  2 Jan 2026 07:23:51 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F06873F5A1;
	Fri,  2 Jan 2026 07:23:56 -0800 (PST)
Message-ID: <68852420-47fc-4dcc-b724-4cf13720b88c@arm.com>
Date: Fri, 2 Jan 2026 15:23:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/13] arm64: mm: Simplify
 __flush_tlb_range_limit_excess()
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Linu Cherian <Linu.Cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-9-ryan.roberts@arm.com>
 <3de2b568-66f8-432f-a501-b19ca6c3a805@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <3de2b568-66f8-432f-a501-b19ca6c3a805@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_072400_239414_4FC2A249 
X-CRM114-Status: GOOD (  22.88  )
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

On 17/12/2025 08:12, Dev Jain wrote:
> 
> On 16/12/25 8:15 pm, Ryan Roberts wrote:
>> From: Will Deacon <will@kernel.org>
>>
>> __flush_tlb_range_limit_excess() is unnecessarily complicated:
>>
>>   - It takes a 'start', 'end' and 'pages' argument, whereas it only
>>     needs 'pages' (which the caller has computed from the other two
>>     arguments!).
>>
>>   - It erroneously compares 'pages' with MAX_TLBI_RANGE_PAGES when
>>     the system doesn't support range-based invalidation but the range to
>>     be invalidated would result in fewer than MAX_DVM_OPS invalidations.
>>
>> Simplify the function so that it no longer takes the 'start' and 'end'
>> arguments and only considers the MAX_TLBI_RANGE_PAGES threshold on
>> systems that implement range-based invalidation.
>>
>> Signed-off-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 20 ++++++--------------
>>  1 file changed, 6 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 0e1902f66e01..3b72a71feac0 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -527,21 +527,13 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
>>  #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>>  	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled())
>>  
>> -static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>> -		unsigned long end, unsigned long pages, unsigned long stride)
>> +static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
>> +						  unsigned long stride)
>>  {
>> -	/*
>> -	 * When the system does not support TLB range based flush
>> -	 * operation, (MAX_DVM_OPS - 1) pages can be handled. But
>> -	 * with TLB range based operation, MAX_TLBI_RANGE_PAGES
>> -	 * pages can be handled.
>> -	 */
>> -	if ((!system_supports_tlb_range() &&
>> -	     (end - start) >= (MAX_DVM_OPS * stride)) ||
>> -	    pages > MAX_TLBI_RANGE_PAGES)
>> +	if (system_supports_tlb_range() && pages > MAX_TLBI_RANGE_PAGES)
>>  		return true;
>>  
>> -	return false;
>> +	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
> 
> The function will return true if tlb range is supported, but
> ((MAX_DVM_OPS * stride) >> PAGE_SHIFT) < pages <= MAX_TLBI_RANGE_PAGES.
> So I think you need to do
> https://lore.kernel.org/all/1b15b4f0-5490-4dac-8344-e716dd189751@arm.com/

I agree with your overall proposal, but I think a few of the details are not
quite correct.

I think the max number of DVM ops that could be issued by a single
__flush_tlb_range() call on a system with tlb-range is 20, not 4 as you suggest;

- 4 for each of the scales
- 1 for the final single page
- 15 to align to a 64K boundary on systems with LPA2 (with 4K page size)

But that doesn't really change your argument.

So proposing to change it to this in next version:

static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
						  unsigned long stride)
{
	/*
	 * Assume that the worst case number of DVM ops required to flush a
	 * given range on a system that supports tlb-range is 20 (4 scales, 1
	 * final page, 15 for alignment on LPA2 systems), which is much smaller
	 * than MAX_DVM_OPS.
	 */
	if (system_supports_tlb_range())
		return pages > MAX_TLBI_RANGE_PAGES;

	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
}

Thanks,
Ryan

> 
>>  }
>>  
>>  static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>> @@ -555,7 +547,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>>  	end = round_up(end, stride);
>>  	pages = (end - start) >> PAGE_SHIFT;
>>  
>> -	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
>> +	if (__flush_tlb_range_limit_excess(pages, stride)) {
>>  		flush_tlb_mm(mm);
>>  		return;
>>  	}
>> @@ -619,7 +611,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>>  	end = round_up(end, stride);
>>  	pages = (end - start) >> PAGE_SHIFT;
>>  
>> -	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
>> +	if (__flush_tlb_range_limit_excess(pages, stride)) {
>>  		flush_tlb_all();
>>  		return;
>>  	}


