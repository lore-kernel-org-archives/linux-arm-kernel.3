Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 03:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qnvGNpZ9BEHN4bVOGjmT8rfHBcCHDXvGmyVb4u6U+w=; b=FxGi18hGUujUMhVuzKNAX4elSW
	hNzvx45rbt1ubFpxfg/ZBwXtDSfincPs+8xT5acB0CNL11BJzGj1BUPoWNBFKOwHIgljA8IVNTFQM
	lHl1dQNYr4EGZgsDRtKe1SblkiHotW2nN65QSrR/wOYAftSac3ctYaTOToZm7qLkMGwGWTmRO0Z7a
	Dntn4uEgP/EZzwYiaZYSvgjTxSgH8WwFSJXCQyq0vv4lyaUi6lGTjNWGN3WiKHoT4qYqMZ1j4EZCw
	qQaJUTGEHBc02MNwnAUyAXxn8kYQW9S+gxUh5jr2QbnWIqfPqnuX+L4edSPN8c+J2tJZkmUlbJ9y2
	YT2uJ2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUJ9-0000000CxEg-3uUG;
	Wed, 05 Nov 2025 03:35:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUJ7-0000000CxEJ-2D9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 03:35:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDFFA1655;
	Tue,  4 Nov 2025 19:35:27 -0800 (PST)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 762263F66E;
	Tue,  4 Nov 2025 19:35:33 -0800 (PST)
Message-ID: <b5ff76a5-b068-4c6b-aa21-d932da42e1e9@arm.com>
Date: Wed, 5 Nov 2025 09:05:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64/mm: Ensure correct 48 bit PA gets into
 TTBRx_EL1
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
 <20251103052618.586763-5-anshuman.khandual@arm.com>
 <aQoZDbuBJ_2YcsyP@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aQoZDbuBJ_2YcsyP@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_193537_633660_22270A52 
X-CRM114-Status: GOOD (  16.89  )
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



On 04/11/25 8:47 PM, Mark Rutland wrote:
> On Mon, Nov 03, 2025 at 05:26:16AM +0000, Anshuman Khandual wrote:
>> Even though 48 bit PA representation in TTBRx_EL1 does not involve shifting
>> partial bits like 52 bit variant does, they sill need to be masked properly
>> for correctness. Hence mask 48 bit PA with TTBRx_EL1_BADDR_MASK.
> 
> There is no need for the address "to be masked properly for
> correctness".
> 
> We added masking for 52-bit PAs due to the need to shuffle the bits
> around. There is no need for that when using 48-bit PAs, since the
> address must be below 2^48, and the address must be suitably aligned.
> 
> If any bits are set outside of this mask, that is a bug in the caller.
> 
> Mark.

Agreed - probably should not be masking out an wrong address from the caller
in order to proceed further with TTBRx_EL1 and then cause a problem down the
line.
> 
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/assembler.h | 1 +
>>  arch/arm64/include/asm/pgtable.h   | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
>> index 23be85d93348..d5eb09fc5f8a 100644
>> --- a/arch/arm64/include/asm/assembler.h
>> +++ b/arch/arm64/include/asm/assembler.h
>> @@ -609,6 +609,7 @@ alternative_endif
>>  	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
>>  #else
>>  	mov	\ttbr, \phys
>> +	and	\ttbr, \ttbr, #TTBRx_EL1_BADDR_MASK
>>  #endif
>>  	.endm
>>  
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 0944e296dd4a..c3110040c137 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1604,7 +1604,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>>  #ifdef CONFIG_ARM64_PA_BITS_52
>>  #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
>>  #else
>> -#define phys_to_ttbr(addr)	(addr)
>> +#define phys_to_ttbr(addr)	(addr & TTBRx_EL1_BADDR_MASK)
>>  #endif
>>  
>>  /*
>> -- 
>> 2.30.2
>>


