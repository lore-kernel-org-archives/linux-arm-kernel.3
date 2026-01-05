Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246EEC79FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWJfgPgP4lZabvguMacrUK+0W8obxcq2h+Drrd4KapA=; b=XxOLGHMovDn0X4j052hzX1mHdI
	rl+RVQATDpKrARslGSHj+JR4g6T399ZsoZ34n5V5906TZusJnoGmpkoydEMJfIt9RvnEov6wUR0B/
	aIfTrHuKFio4rf6tqLZcbyAYBnopGI3BfjP/O9ViVyQdz9Uyni4vhRPO9HI61l/RVYiaGBRFeRwsq
	XGF5YvY17AsH0DFitrZA2L7y0fcnxlyvoVmnF8+ugHAzF/FeCnUFG9NuND4YIWqLimM4iUMGx2eYl
	SGC3jGPOSZ3XftHLHZpIgTgac1C8CE8i6DnpLeXnT7mg40By6MgjdPk2YdesS54Q9ATArQSwKPqoT
	tWWMeiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco5g-0000000Bmox-2LUU;
	Mon, 05 Jan 2026 17:10:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco5d-0000000Bmni-3NyH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CDF7339;
	Mon,  5 Jan 2026 09:09:47 -0800 (PST)
Received: from [10.1.38.150] (XHFQ2J9959.cambridge.arm.com [10.1.38.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6AC93F5A1;
	Mon,  5 Jan 2026 09:09:52 -0800 (PST)
Message-ID: <0fdb0dfc-d558-41f8-9c8d-d179892f35a9@arm.com>
Date: Mon, 5 Jan 2026 17:09:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/13] arm64: mm: Re-implement the __tlbi_level macro
 as a C function
Content-Language: en-GB
To: Linu Cherian <linu.cherian@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-2-ryan.roberts@arm.com>
 <aVtMdh7nTtc7NhqG@a079125.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aVtMdh7nTtc7NhqG@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_090957_977257_06FA67F4 
X-CRM114-Status: GOOD (  14.94  )
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

On 05/01/2026 05:30, Linu Cherian wrote:
> Ryan,
> 
> On Tue, Dec 16, 2025 at 02:45:46PM +0000, Ryan Roberts wrote:
>> As part of efforts to reduce our reliance on complex preprocessor macros
>> for TLB invalidation routines, convert the __tlbi_level macro to a C
>> function for by-level TLB invalidation.
>>
>> Each specific tlbi level op is implemented as a C function and the
>> appropriate function pointer is passed to __tlbi_level(). Since
>> everything is declared inline and is statically resolvable, the compiler
>> will convert the indirect function call to a direct inline execution.
>>
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 69 +++++++++++++++++++++++++------
>>  1 file changed, 56 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index a2d65d7d6aae..13a59cf28943 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -105,19 +105,62 @@ static inline unsigned long get_trans_granule(void)
>>  
>>  #define TLBI_TTL_UNKNOWN	INT_MAX
>>  
>> -#define __tlbi_level(op, addr, level) do {				\
>> -	u64 arg = addr;							\
>> -									\
>> -	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
>> -	    level >= 0 && level <= 3) {					\
>> -		u64 ttl = level & 3;					\
>> -		ttl |= get_trans_granule() << 2;			\
>> -		arg &= ~TLBI_TTL_MASK;					\
>> -		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
>> -	}								\
>> -									\
>> -	__tlbi(op, arg);						\
>> -} while(0)
>> +typedef void (*tlbi_op)(u64 arg);
>> +
>> +static __always_inline void vae1is(u64 arg)
>> +{
>> +	__tlbi(vae1is, arg);
>> +}
>> +
>> +static __always_inline void vae2is(u64 arg)
>> +{
>> +	__tlbi(vae2is, arg);
>> +}
>> +
>> +static __always_inline void vale1(u64 arg)
>> +{
>> +	__tlbi(vale1, arg);
>> +	__tlbi_user(vale1, arg);
> 
> Should the __tlbi_user addition be added as part of patch 3 ?

Yes, it should; good spot!

> 
>> +}
>> +
>> +static __always_inline void vale1is(u64 arg)
>> +{
>> +	__tlbi(vale1is, arg);
>> +}
>> +
>> +static __always_inline void vale2is(u64 arg)
>> +{
>> +	__tlbi(vale2is, arg);
>> +}
>> +
>> +static __always_inline void vaale1is(u64 arg)
>> +{
>> +	__tlbi(vaale1is, arg);
>> +}
>> +
>> +static __always_inline void ipas2e1(u64 arg)
>> +{
>> +	__tlbi(ipas2e1, arg);
>> +}
>> +
>> +static __always_inline void ipas2e1is(u64 arg)
>> +{
>> +	__tlbi(ipas2e1is, arg);
>> +}
>> +
>> +static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>> +{
>> +	u64 arg = addr;
>> +
>> +	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
>> +		u64 ttl = level | (get_trans_granule() << 2);
>> +
>> +		arg &= ~TLBI_TTL_MASK;
>> +		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);
>> +	}
>> +
>> +	op(arg);
>> +}
>>  
>>  #define __tlbi_user_level(op, arg, level) do {				\
>>  	if (arm64_kernel_unmapped_at_el0())				\
>> -- 
>> 2.43.0
>>


