Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2004CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4MiDQt21TWA8KCz0B9NzC2Gfsz63s/U3vTgfyRaGPQ=; b=lKtpC7mIELJBSMALYb5YHO61wF
	Zg7vDiaqkBpEHGB7OzmXjWLh6A01yA0JpEAq7nA0JXw9jEz1D7EAZdOO4dWHc3htSRKch/D4YwqAa
	Gbp6TBaZv8PsqTLXXR8IKOogvBn+dZ/939wpXToD2U2gbbY5TEo44o7nMGAC+VXBrZC10hMgDh50F
	qsA2XGGGZPDWxhpcytYJqXL194zxDtYcLIZ1jnneG5YWlTvNZGRyyJ5+IUawB+npRFzLu1pdGrEa6
	oiVI0h0u+4KLMNxFr0lTkezvkjU2xbj4e8MfQnOrLmKwOzaJUiNQGXrV+UOmaOrseCkBWxorX0Kp5
	8tCL1QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCAJ-0000000CxWK-14qu;
	Mon, 27 Oct 2025 01:36:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCAG-0000000CxVy-3sZS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:36:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC97F175D;
	Sun, 26 Oct 2025 18:36:43 -0700 (PDT)
Received: from [10.163.70.164] (unknown [10.163.70.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A48F3F673;
	Sun, 26 Oct 2025 18:36:48 -0700 (PDT)
Message-ID: <6e7d0bf3-ddf1-44a0-a0cb-7dc994101878@arm.com>
Date: Mon, 27 Oct 2025 07:06:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, ben.horgan@arm.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
References: <20251024040207.137480-1-anshuman.khandual@arm.com>
 <20251024040207.137480-3-anshuman.khandual@arm.com>
 <20251024120014.000020af@huawei.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251024120014.000020af@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_183653_087335_795C5C85 
X-CRM114-Status: GOOD (  16.52  )
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



On 24/10/25 4:30 PM, Jonathan Cameron wrote:
> On Fri, 24 Oct 2025 05:02:07 +0100
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
>> While here replace hard coded page size based shifts but with derived ones
>> via ilog2() thus adding some required context.
>>
>> TLBI_TTL_MASK has been split into separate TLBI_TTL_MASK and TLBI_TG_MASK
>> as appropriate because currently it simultaneously contains both page size
>> and translation table level information. KVM on arm64 has been updated to
>> accommodate these changes to TLBI_TTL_MASK.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oliver.upton@linux.dev>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kvmarm@lists.linux.dev
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
>>  arch/arm64/kvm/nested.c           |  8 +++++---
>>  2 files changed, 23 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 131096094f5b..cf75fc2a06c3 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -57,9 +57,10 @@
>>  /* This macro creates a properly formatted VA operand for the TLBI */
>>  #define __TLBI_VADDR(addr, asid)				\
>>  	({							\
>> -		unsigned long __ta = (addr) >> 12;		\
>> -		__ta &= GENMASK_ULL(43, 0);			\
>> -		__ta |= (unsigned long)(asid) << 48;		\
>> +		unsigned long __ta = (addr) >> ilog2(SZ_4K);	\
>> +		__ta &= TLBI_BADDR_MASK;			\
>> +		__ta &= ~TLBI_ASID_MASK;			\
>> +		__ta |= FIELD_PREP(TLBI_ASID_MASK, asid);	\
> I think you can replace the two lines above with
> 		FIELD_MODIFY(TLBI_ASID_MASK, &__ta, asid);
> 
> It's a small reduction in code but I don't mind much either way.

Right. FIELD_MODIFY() might be appropriate in this scenario but
there will be some additional code churn needed. I don't have a
strong opinion either way.

--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -55,13 +55,12 @@
 } while (0)

 /* This macro creates a properly formatted VA operand for the TLBI */
-#define __TLBI_VADDR(addr, asid)                               \
-       ({                                                      \
-               unsigned long __ta = (addr) >> ilog2(SZ_4K);    \
-               __ta &= TLBI_BADDR_MASK;                        \
-               __ta &= ~TLBI_ASID_MASK;                        \
-               __ta |= FIELD_PREP(TLBI_ASID_MASK, asid);       \
-               __ta;                                           \
+#define __TLBI_VADDR(addr, asid)                                       \
+       ({                                                              \
+               unsigned long __ta = (addr) >> ilog2(SZ_4K);            \
+               __ta &= TLBI_BADDR_MASK;                                \
+               __ta |= FIELD_MODIFY(TLBI_ASID_MASK, &__ta, asid);      \
+               __ta;                                                   \
        })
 > 
>>  		__ta;						\
>>  	})
>>  
>> @@ -100,8 +101,17 @@ static inline unsigned long get_trans_granule(void)
>>   *
>>   * For Stage-2 invalidation, use the level values provided to that effect
>>   * in asm/stage2_pgtable.h.
>> + *
>> + * +----------+------+-------+--------------------------------------+
>> + * |   ASID   |  TG  |  TTL  |                 BADDR                |
>> + * +-----------------+-------+--------------------------------------+
>> + * |63      48|47  46|45   44|43                                   0|
>> + * +----------+------+-------+--------------------------------------+
>>   */
>> -#define TLBI_TTL_MASK		GENMASK_ULL(47, 44)
>> +#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
>> +#define TLBI_TG_MASK		GENMASK_ULL(47, 46)
>> +#define TLBI_TTL_MASK		GENMASK_ULL(45, 44)
>> +#define TLBI_BADDR_MASK		GENMASK_ULL(43, 0)
>>  
>>  #define TLBI_TTL_UNKNOWN	INT_MAX
>>  
>> @@ -110,10 +120,10 @@ static inline unsigned long get_trans_granule(void)
>>  									\
>>  	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
>>  	    level >= 0 && level <= 3) {					\
>> -		u64 ttl = level;					\
>> -		ttl |= get_trans_granule() << 2;			\
>> +		arg &= ~TLBI_TG_MASK;					\
>> +		arg |= FIELD_PREP(TLBI_TG_MASK, get_trans_granule());	\
>>  		arg &= ~TLBI_TTL_MASK;					\
>> -		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
>> +		arg |= FIELD_PREP(TLBI_TTL_MASK, level);		\
> 
> Similar potential to use FIELD_MODIFY for these.
> 
> Jonathan
> 


