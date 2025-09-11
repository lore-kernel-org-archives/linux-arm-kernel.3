Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120D4CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 05:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZtobQKW26xfQvcCjWyOueNlfo2Nu0fyaisOJ/OH6Wk=; b=Os+MG3tFNHlVsSqYXiVHUJw8ym
	B77V+Au0dIXPMLFBDvJs1gbPm1IHmv3ooW2x/V/rN55Uo4ReZxpQnHxzqH5IDgq3xILwn1jm+J8b7
	kAQ7X8bXQFMZbYTzX7c1ljT6Wtge8YECwEyKS5BmstkpuFEF7C2zxGACKPvEiH6MSNqBnjCBpdVqI
	ryK2ZJa6PXM7N2o4ANfkFdX3sUK73+JnS9m1ZkoWQp6OTUSX9aHdNevSWBIcdgKuzodNNAEuZV47K
	X6L3YXfv0JdhCL5PUorQQJ3H5j81At8OOxxPMrKHOnZlSPyaHITVD2qEqj44QWToVhG8uZi9W/+nW
	/zwv06vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwaCG-000000015Sw-1kKl;
	Thu, 11 Sep 2025 05:50:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwaCD-000000015S2-2pEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 05:50:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0CE2153B;
	Wed, 10 Sep 2025 22:50:04 -0700 (PDT)
Received: from [10.164.18.53] (unknown [10.164.18.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F6FC3F694;
	Wed, 10 Sep 2025 22:50:10 -0700 (PDT)
Message-ID: <4ac449f1-d5cc-42d6-bded-2db6984d55f0@arm.com>
Date: Thu, 11 Sep 2025 11:20:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] arm64: tlbflush: Move invocation of
 __flush_tlb_range_op() to a macro
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
 <20250829153510.2401161-2-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250829153510.2401161-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_225013_797495_12BD737E 
X-CRM114-Status: GOOD (  21.97  )
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



On 29/08/25 9:05 PM, Ryan Roberts wrote:
> __flush_tlb_range_op() is a pre-processor macro that takes the TLBI
> operation as a string, and builds the instruction from it. This prevents
> passing the TLBI operation around as a variable. __flush_tlb_range_op()
> also takes 7 other arguments.
> 
> Adding extra invocations for different TLB operations means duplicating
> the whole thing, but those 7 extra arguments are the same each time.
> 
> Add an enum for the TLBI operations that __flush_tlb_range() uses, and a
> macro to pass the operation name as a string to __flush_tlb_range_op(),
> and the rest of the arguments using __VA_ARGS_.
> 
> The result is easier to add new TLBI operations to, and to modify any of
> the other arguments as they only appear once.
> 
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 18a5dc0c9a54..f66b8c4696d0 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -11,6 +11,7 @@
>  #ifndef __ASSEMBLY__
>  
>  #include <linux/bitfield.h>
> +#include <linux/build_bug.h>
>  #include <linux/mm_types.h>
>  #include <linux/sched.h>
>  #include <linux/mmu_notifier.h>
> @@ -433,12 +434,32 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>  	return false;
>  }
>  
> +enum tlbi_op {
> +	TLBI_VALE1IS,
> +	TLBI_VAE1IS,
> +};
> +
> +#define flush_tlb_range_op(op, ...)					\
> +do {									\
> +	switch (op) {							\
> +	case TLBI_VALE1IS:						\
> +		__flush_tlb_range_op(vale1is, __VA_ARGS__);		\
> +		break;							\
> +	case TLBI_VAE1IS:						\
> +		__flush_tlb_range_op(vae1is, __VA_ARGS__);		\
> +		break;							\
> +	default:							\
> +		BUILD_BUG_ON_MSG(1, "Unknown TLBI op");			\
> +	}								\
> +} while (0)
> +
>  static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>  				     unsigned long start, unsigned long end,
>  				     unsigned long stride, bool last_level,
>  				     int tlb_level)
>  {
>  	unsigned long asid, pages;
> +	enum tlbi_op tlbi_op;
>  
>  	start = round_down(start, stride);
>  	end = round_up(end, stride);
> @@ -452,12 +473,9 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>  	dsb(ishst);
>  	asid = ASID(mm);
>  
> -	if (last_level)
> -		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
> -				     tlb_level, true, lpa2_is_enabled());
> -	else
> -		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
> -				     tlb_level, true, lpa2_is_enabled());
> +	tlbi_op = last_level ? TLBI_VALE1IS : TLBI_VAE1IS;
> +	flush_tlb_range_op(tlbi_op, start, pages, stride, asid, tlb_level,
> +			   true, lpa2_is_enabled());
>  
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>  }

Should the remaining __flush_tlb_range_op() in flush_tlb_kernel_range()
converted into flush_tlb_range_op() adding another similar enum variable
i.e TLBI_VAALE1IS ? Because this will ensure that there is one variant
helper i.e flush_tlb_range_op() that gets called.

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index f66b8c4696d0..a23169751deb 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -437,6 +437,7 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 enum tlbi_op {
        TLBI_VALE1IS,
        TLBI_VAE1IS,
+       TLBI_VAALE1IS,
 };

 #define flush_tlb_range_op(op, ...)                                    \
@@ -448,6 +449,9 @@ do {                                                                        \
        case TLBI_VAE1IS:                                               \
                __flush_tlb_range_op(vae1is, __VA_ARGS__);              \
                break;                                                  \
+       case TLBI_VAALE1IS:                                             \
+               __flush_tlb_range_op(vaale1is, __VA_ARGS__);            \
+               break;                                                  \
        default:                                                        \
                BUILD_BUG_ON_MSG(1, "Unknown TLBI op");                 \
        }                                                               \
@@ -517,7 +521,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
        }

        dsb(ishst);
-       __flush_tlb_range_op(vaale1is, start, pages, stride, 0,
+       flush_tlb_range_op(TLBI_VAALE1IS, start, pages, stride, 0,
                             TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
        dsb(ish);
        isb();

