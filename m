Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE01CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzQQTp+MW8YH762A8Uax0Pym03HXKSH42FNr/GYNXR0=; b=ToyNXdR1l/ks2iIxmEjIinvKY4
	Glya0Vp3qIDljyJPS38hzaGGbe++Vm6F2EetYiu2PBFSZBr/CDeDLMLn8mwn9rTTImZ47eZMaEauF
	fi+rtB4s9YRD5u09wQvl0OP8C6FRbH/Mhu+UkySJfuZr0Vdq7Ou4/IkXB3vCplrGhDtWWslyvFEi1
	E6x5NzB1brw9LTHnDWPoE1mvfR5w/8L2VWPfAPlYBcuLlGIvVC4vn3o1iEmhjdX4nXikqaOcfVlde
	y7dDQ/DkTWHl98+GJUGawoiGNwoXecDOzXgI37UzxbvkLOtObSSznO0EBftrZdbDJ7EsA1NmtiBP9
	cjGTFm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnu-00000002D03-250y;
	Tue, 02 Sep 2025 21:44:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUGs-000000013eJ-0lmt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:54:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A782E26BE;
	Tue,  2 Sep 2025 09:54:01 -0700 (PDT)
Received: from [10.1.36.209] (unknown [10.1.36.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E7D53F694;
	Tue,  2 Sep 2025 09:54:08 -0700 (PDT)
Message-ID: <90ed2574-74f8-47a0-ac46-4b9418c3242d@arm.com>
Date: Tue, 2 Sep 2025 17:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/2] arm64: tlbflush: Don't broadcast if mm was
 only active on local cpu
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
 <20250829153510.2401161-3-ryan.roberts@arm.com> <aLcZ93VeOYa4ilZb@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLcZ93VeOYa4ilZb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_095414_305699_24656826 
X-CRM114-Status: GOOD (  27.61  )
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

On 02/09/2025 17:23, Catalin Marinas wrote:
> On Fri, Aug 29, 2025 at 04:35:08PM +0100, Ryan Roberts wrote:
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index f66b8c4696d0..651440e0aff9 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -182,6 +182,52 @@ static inline unsigned long get_trans_granule(void)
>>  		(__pages >> (5 * (scale) + 1)) - 1;			\
>>  	})
>>  
>> +/*
>> + * Determines whether the user tlbi invalidation can be performed only on the
>> + * local CPU or whether it needs to be broadcast. (Returns true for local).
>> + * Additionally issues appropriate barrier to ensure prior pgtable updates are
>> + * visible to the table walker. Must be paired with flush_tlb_user_post().
>> + */
>> +static inline bool flush_tlb_user_pre(struct mm_struct *mm)
>> +{
>> +	unsigned int self, active;
>> +	bool local;
>> +
>> +	migrate_disable();
>> +
>> +	self = smp_processor_id();
>> +
>> +	/*
>> +	 * The load of mm->context.active_cpu must not be reordered before the
>> +	 * store to the pgtable that necessitated this flush. This ensures that
>> +	 * if the value read is our cpu id, then no other cpu can have seen the
>> +	 * old pgtable value and therefore does not need this old value to be
>> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
>> +	 * needed to make the pgtable updates visible to the walker, to a
>> +	 * dsb(ish) by default. So speculatively load without a barrier and if
>> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
>> +	 */
>> +	active = READ_ONCE(mm->context.active_cpu);
>> +	if (active == self) {
>> +		dsb(ish);
>> +		active = READ_ONCE(mm->context.active_cpu);
>> +	} else {
>> +		dsb(ishst);
>> +	}
> 
> Does the ISH vs ISHST make much difference in practice? I wonder whether
> we could keep this simple.

I don't know. I was being conservative - I'm a bit nervous about upgrading a
barrier unconditionally. I'll run some benchmarks with the simpler version and
compare.

> 
>> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
>> index b2ac06246327..adf4fc26ddb6 100644
>> --- a/arch/arm64/mm/context.c
>> +++ b/arch/arm64/mm/context.c
>> @@ -214,9 +214,10 @@ static u64 new_context(struct mm_struct *mm)
>>  
>>  void check_and_switch_context(struct mm_struct *mm)
>>  {
>> -	unsigned long flags;
>> -	unsigned int cpu;
>> +	unsigned int cpu = smp_processor_id();
>>  	u64 asid, old_active_asid;
>> +	unsigned int active;
>> +	unsigned long flags;
>>  
>>  	if (system_supports_cnp())
>>  		cpu_set_reserved_ttbr0();
>> @@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
>>  		atomic64_set(&mm->context.id, asid);
>>  	}
>>  
>> -	cpu = smp_processor_id();
>>  	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
>>  		local_flush_tlb_all();
>>  
>> @@ -262,6 +262,30 @@ void check_and_switch_context(struct mm_struct *mm)
>>  
>>  	arm64_apply_bp_hardening();
>>  
>> +	/*
>> +	 * Update mm->context.active_cpu in such a manner that we avoid cmpxchg
>> +	 * and dsb unless we definitely need it. If initially ACTIVE_CPU_NONE
>> +	 * then we are the first cpu to run so set it to our id. If initially
>> +	 * any id other than ours, we are the second cpu to run so set it to
>> +	 * ACTIVE_CPU_MULTIPLE. If we update the value then we must issue
>> +	 * dsb(ishst) to ensure stores to mm->context.active_cpu are ordered
>> +	 * against the TTBR0 write in cpu_switch_mm()/uaccess_enable(); the
>> +	 * store must be visible to another cpu before this cpu could have
>> +	 * populated any TLB entries based on the pgtables that will be
>> +	 * installed.
>> +	 */
>> +	active = READ_ONCE(mm->context.active_cpu);
>> +	if (active != cpu && active != ACTIVE_CPU_MULTIPLE) {
>> +		if (active == ACTIVE_CPU_NONE)
>> +			active = cmpxchg_relaxed(&mm->context.active_cpu,
>> +						 ACTIVE_CPU_NONE, cpu);
>> +
>> +		if (active != ACTIVE_CPU_NONE)
>> +			WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_MULTIPLE);
>> +
>> +		dsb(ishst);
>> +	}
> 
> I think this works. I recall James had a litmus test for the model
> checker confirming this.
> 
> In a cut-down version, we'd have:
> 
> P0:				P1:
> 
> set_pte();			WRITE_ONCE(active_cpu);
> dsb();				dsb();
> READ_ONCE(active_cpu);		READ_ONCE(pte);
> 
> The pte read on P1 is implied following the TTBR0 write. As you
> described, if P0 did not see the active_cpu update, P1 would have seen
> the updated pte.
> 
> So far I couldn't fail this, so:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Hmm... Rb at v1.. are you feeling ok? :)


