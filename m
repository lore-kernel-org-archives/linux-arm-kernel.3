Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649E8CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PD4aj65cyF55I8nDkrVI/juKP1KP62y9xuKASfEnGfk=; b=TpPPsTnuM2XDcY+v6X/zod+LG7
	+iyOkSFSnjhx+/Ed8bka6jCdzbDgktg9NcvfaGEtQ+tESyiY85rYnQrCiG8Fh8pOCLFrxjXXyKC06
	CwhTWPCr4rI715mdUzPduuLQZ2CGirqdLR86gX+u+3ZgRTjzs+zvq/6C/kLw/f4MT9S8kT8eQvIVv
	mEocJC7bt3n7hF09E3QFxN4U0mMgRA8JUoc1o/x7PwqXg4K1YzTcZg5hnSxyWPhmnZ4yGFNEZhElu
	+S20LDOtKnXeaxPC0R7UoKYpXqg1M9CrOadhCSOXChXQd+qOO8A06ntZq5Yu9E+d1gOXOg223Empj
	/VwRqxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBjq-0000000H1NO-1mpY;
	Tue, 21 Oct 2025 12:45:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBjm-0000000H1Ma-3lcl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:45:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5EE91063;
	Tue, 21 Oct 2025 05:45:05 -0700 (PDT)
Received: from [10.163.39.61] (unknown [10.163.39.61])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E89333F66E;
	Tue, 21 Oct 2025 05:45:11 -0700 (PDT)
Message-ID: <875f379a-c3eb-4b1b-bb42-46183a879d69@arm.com>
Date: Tue, 21 Oct 2025 18:15:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
To: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20251021052022.2898275-1-anshuman.khandual@arm.com>
 <20251021052022.2898275-3-anshuman.khandual@arm.com>
 <1148d823-5a89-4f32-911b-f009a8ea5641@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <1148d823-5a89-4f32-911b-f009a8ea5641@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_054515_066161_4BE346F7 
X-CRM114-Status: GOOD (  17.05  )
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



On 21/10/25 2:30 PM, Ben Horgan wrote:
> Hi Anshuman,
> 
> On 10/21/25 06:20, Anshuman Khandual wrote:
>> Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
>> While here replace hard coded page size based shifts but with derived ones
>> via ilog2() thus adding some required context.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
>>  1 file changed, 18 insertions(+), 8 deletions(-)
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
> 
> The definition of TLBI_TTL_MASK changes here. This might be the correct
> thing to do but it should be mentioned in the commit message and the

Sure, will update the commit message.
> other user, arch/arm64/kvm/nested.c, needs to be updated in tandem.

Right, missed that one. Probably something like the following change
might do it for KVM without much code churn.

--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -540,7 +540,7 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
        unsigned long max_size;
        u8 ttl;

-       ttl = FIELD_GET(TLBI_TTL_MASK, val);
+       ttl = FIELD_GET(TLBI_TTL_MASK, val) | FIELD_GET(TLBI_TG_MASK, val);

        if (!ttl || !kvm_has_feat(kvm, ID_AA64MMFR2_EL1, TTL, IMP)) {
                /* No TTL, check the shadow S2 for a hint */
@@ -963,7 +963,7 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
        case OP_TLBI_VALE1ISNXS:
        case OP_TLBI_VALE1OSNXS:
                scope->type = TLBI_VA;
-               scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
+               scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val) | FIELD_GET(TLBI_TG_MASK, val));
                if (!scope->size)
                        scope->size = SZ_1G;
                scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
@@ -991,7 +991,7 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
        case OP_TLBI_VAALE1ISNXS:
        case OP_TLBI_VAALE1OSNXS:
                scope->type = TLBI_VAA;
-               scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
+               scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val) | FIELD_GET(TLBI_TG_MASK, val));
                if (!scope->size)
                        scope->size = SZ_1G;
                scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);

> 
>> +#define TLBI_BADDR_MASK		GENMASK_ULL(43, 0)
>>  
>>  #define TLBI_TTL_UNKNOWN	INT_MAX
>>  
> 
> Thanks,
> 
> Ben
> 


