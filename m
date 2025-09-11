Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E77CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FXlnU9wFF/VqW2EUsrPC6/M1bWNRZqLouVFWzwPhn4=; b=XAsfXWd9MVvX+/feNaHfCtYgAn
	WFeAwtWxB61/zcnBk3t5kOLquhq13PaTrdg8jlBeUQ4Bvu+gNM3lpeZ9FK76GM3jTj9f9L7dl+X/m
	vwJ6dz71+YxewM2maknPp9+lU947sYMXvYeTcQWhw6bc1XgJd5x//m9NXNDt4pKYCjhc66k8p7tVK
	CU/orOFFSOnCQgvJKwWQgZ1P7B2AyYaemtmFkXG106LNHDQOOtihzTTQ3G5JZX2gOUwpc/Zp7zmLY
	l8xdlNss7B9TVoyhvzbaKV5wSB1xchIpq1bcO0sMPKADFEAt2atMxNtgwTTIZoadCrMOEhMxf8uaX
	7XmACIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi2g-00000003TRY-1XeH;
	Thu, 11 Sep 2025 14:12:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi2e-00000003TQV-3QIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:12:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A251153B;
	Thu, 11 Sep 2025 07:12:42 -0700 (PDT)
Received: from [10.1.32.180] (unknown [10.1.32.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B4473F694;
	Thu, 11 Sep 2025 07:12:49 -0700 (PDT)
Message-ID: <3e3f15a1-77d4-4391-91bb-7a5eb0e93a63@arm.com>
Date: Thu, 11 Sep 2025 15:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] arm64: tlbflush: Move invocation of
 __flush_tlb_range_op() to a macro
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
 <20250829153510.2401161-2-ryan.roberts@arm.com>
 <4ac449f1-d5cc-42d6-bded-2db6984d55f0@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <4ac449f1-d5cc-42d6-bded-2db6984d55f0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_071252_954901_E2BC7D4A 
X-CRM114-Status: GOOD (  20.84  )
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

On 11/09/2025 06:50, Anshuman Khandual wrote:
> 
> 
> On 29/08/25 9:05 PM, Ryan Roberts wrote:
>> __flush_tlb_range_op() is a pre-processor macro that takes the TLBI
>> operation as a string, and builds the instruction from it. This prevents
>> passing the TLBI operation around as a variable. __flush_tlb_range_op()
>> also takes 7 other arguments.
>>
>> Adding extra invocations for different TLB operations means duplicating
>> the whole thing, but those 7 extra arguments are the same each time.
>>
>> Add an enum for the TLBI operations that __flush_tlb_range() uses, and a
>> macro to pass the operation name as a string to __flush_tlb_range_op(),
>> and the rest of the arguments using __VA_ARGS_.
>>
>> The result is easier to add new TLBI operations to, and to modify any of
>> the other arguments as they only appear once.
>>
>> Suggested-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 30 ++++++++++++++++++++++++------
>>  1 file changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 18a5dc0c9a54..f66b8c4696d0 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -11,6 +11,7 @@
>>  #ifndef __ASSEMBLY__
>>  
>>  #include <linux/bitfield.h>
>> +#include <linux/build_bug.h>
>>  #include <linux/mm_types.h>
>>  #include <linux/sched.h>
>>  #include <linux/mmu_notifier.h>
>> @@ -433,12 +434,32 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>>  	return false;
>>  }
>>  
>> +enum tlbi_op {
>> +	TLBI_VALE1IS,
>> +	TLBI_VAE1IS,
>> +};
>> +
>> +#define flush_tlb_range_op(op, ...)					\
>> +do {									\
>> +	switch (op) {							\
>> +	case TLBI_VALE1IS:						\
>> +		__flush_tlb_range_op(vale1is, __VA_ARGS__);		\
>> +		break;							\
>> +	case TLBI_VAE1IS:						\
>> +		__flush_tlb_range_op(vae1is, __VA_ARGS__);		\
>> +		break;							\
>> +	default:							\
>> +		BUILD_BUG_ON_MSG(1, "Unknown TLBI op");			\
>> +	}								\
>> +} while (0)
>> +
>>  static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>>  				     unsigned long start, unsigned long end,
>>  				     unsigned long stride, bool last_level,
>>  				     int tlb_level)
>>  {
>>  	unsigned long asid, pages;
>> +	enum tlbi_op tlbi_op;
>>  
>>  	start = round_down(start, stride);
>>  	end = round_up(end, stride);
>> @@ -452,12 +473,9 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>>  	dsb(ishst);
>>  	asid = ASID(mm);
>>  
>> -	if (last_level)
>> -		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
>> -				     tlb_level, true, lpa2_is_enabled());
>> -	else
>> -		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
>> -				     tlb_level, true, lpa2_is_enabled());
>> +	tlbi_op = last_level ? TLBI_VALE1IS : TLBI_VAE1IS;
>> +	flush_tlb_range_op(tlbi_op, start, pages, stride, asid, tlb_level,
>> +			   true, lpa2_is_enabled());
>>  
>>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>>  }
> 
> Should the remaining __flush_tlb_range_op() in flush_tlb_kernel_range()
> converted into flush_tlb_range_op() adding another similar enum variable
> i.e TLBI_VAALE1IS ? Because this will ensure that there is one variant
> helper i.e flush_tlb_range_op() that gets called.

Yeah maybe. I don't really have a strong opinion.

Will posted an RFC for converting all this to functions a while ago. That's the
better baseline to build this all on I think.

> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index f66b8c4696d0..a23169751deb 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -437,6 +437,7 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>  enum tlbi_op {
>         TLBI_VALE1IS,
>         TLBI_VAE1IS,
> +       TLBI_VAALE1IS,
>  };
> 
>  #define flush_tlb_range_op(op, ...)                                    \
> @@ -448,6 +449,9 @@ do {                                                                        \
>         case TLBI_VAE1IS:                                               \
>                 __flush_tlb_range_op(vae1is, __VA_ARGS__);              \
>                 break;                                                  \
> +       case TLBI_VAALE1IS:                                             \
> +               __flush_tlb_range_op(vaale1is, __VA_ARGS__);            \
> +               break;                                                  \
>         default:                                                        \
>                 BUILD_BUG_ON_MSG(1, "Unknown TLBI op");                 \
>         }                                                               \
> @@ -517,7 +521,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>         }
> 
>         dsb(ishst);
> -       __flush_tlb_range_op(vaale1is, start, pages, stride, 0,
> +       flush_tlb_range_op(TLBI_VAALE1IS, start, pages, stride, 0,
>                              TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
>         dsb(ish);
>         isb();


