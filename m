Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DTKAVZPD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jc7pqsm4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yi8rwFMd9BghO9lmTtGQ2dC4Wi31UNr7sStszJWXA+U=; b=DTKAVZPDO7wxyB
	X/N05rFx0wIBxbfZMLIZ8Puy/ZO/doMlASGnZYzP/CT6qiN4gcORFcj5UHHXA0YuSl2t/WA6TdLfs
	Ihbp0qBIyj3Ziqq6H7ORqoYEs98qm5Vq0Rao5ubWzdP1Fo3vZudxyWZ2/4pKD7Q8dUiURZ2Pwwcv4
	Tczl66On7qVOxQVFtnkLZojuQSQudFPwk1Yq+2TusM06o2uxUJskPTTOxS2kEEvrUji4rnPywGf4K
	uRXm/EWOtaPQ5C9g+JUfePeSIGgtPm2qiWemeOM88CNBk1ZETsOZb06jLzAyMru/CvDzxFLneTooK
	T3qKM0W3WJj81ZxGsQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjed-0000000BMwc-38id;
	Fri, 30 Oct 2026 10:16:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjea-0000000BMuz-17TO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:16:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9550B1E8D;
	Fri, 30 Oct 2026 03:16:00 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61D03F673;
	Fri, 30 Oct 2026 03:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793355363; bh=FhDY5fSWPJ3mhD73WP57LfIGqwZxwSuLppmUfiz+pOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jc7pqsm4vTE7kxMElmrskn/EFX99V9Yb2EuLMypfOO2ZWfNtb0tubd3Tiu9Tny8KX
	 zoDjgWDKpT2jRIBwBifLnk0S7QSprVBpDEwWlcXJXAOf1P40PgvLkc070ObMrnKT1x
	 6iXOQ/2hUm2zteDsuYeY/4EVppLxMq2gzEySNSj8=
Message-ID: <b2856d6e-dce6-4933-a43a-3ce7b5f9d2c2@arm.com>
Date: Fri, 30 Oct 2026 10:15:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>,
 linux-arm-kernel@lists.infradead.org
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
 <r56ewhlz5fihgwd34zbiaxgmxdw4eq4t36jlsmwepu4nbhon6i@kjsqwoivmfhr>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <r56ewhlz5fihgwd34zbiaxgmxdw4eq4t36jlsmwepu4nbhon6i@kjsqwoivmfhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_031608_504977_43F979EF 
X-CRM114-Status: GOOD (  22.17  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 06:30, Anshuman Khandual wrote:
> On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
>> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
>>
>> Switching to init_mm should prevent further accesses through the
>> previous address space's translations.
>>
>> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
>> to the init_mm") avoided installing init_mm.pgd as a user page table.
>> At the time, the ASID was held in TTBR0, so installing the reserved
>> TTBR0 also switched to ASID 0.
>>
>> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
>> installing the reserved TTBR0 no longer changes the active ASID.
>> Consequently, switching to init_mm leaves the CPU using the previous
>> address space's ASID. An empty page table does not prevent TLB hits
>> for that ASID.
>>
>> This can retain access beyond the lifetime of the backing pages.
>> During fullmm teardown, user data pages can be freed before their
>> cached translations are invalidated. If those pages are subsequently
>> reused for kernel data, an erroneous uaccess that hits a surviving
>> translation can read or corrupt that data instead of faulting.
>>
>> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
>> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
>>
>> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
>> index 803b68758152..7e56099c5fbb 100644
>> --- a/arch/arm64/include/asm/mmu_context.h
>> +++ b/arch/arm64/include/asm/mmu_context.h
>> @@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
>>  
>>  static inline void __switch_mm(struct mm_struct *next)
>>  {
>> -	/*
>> -	 * init_mm.pgd does not contain any user mappings and it is always
>> -	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
>> -	 */
>> -	if (next == &init_mm) {
>> -		cpu_set_reserved_ttbr0();
>> -		return;
>> -	}
>> -
>>  	check_and_switch_context(next);
>>  }
>>  
>> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
>> index 0f4a28b87469..a96ebe904dd7 100644
>> --- a/arch/arm64/mm/context.c
>> +++ b/arch/arm64/mm/context.c
>> @@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
>>  	unsigned int cpu;
>>  	u64 asid, old_active_asid;
>>  
>> +	/*
>> +	 * init_mm.pgd contains kernel mappings, so use the reserved page
>> +	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids
> Just curious - does TTBR1 switch to ASID 0 ? AFAICS TTBR1_EL1 gets
> the ASID which is derived from the mm_struct via ASID(mm) earlier.
>

AFAICS, mm in this case is init_mm, and ASID for init_mm is 0.

Cheers
Vladimir
 
> void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
> {
> 	unsigned long ttbr1 = read_sysreg(ttbr1_el1);
> 	unsigned long asid = ASID(mm);
> 	unsigned long ttbr0 = phys_to_ttbr(pgd_phys);
> 
> 	/* Skip CNP for the reserved ASID */
> 	if (system_supports_cnp() && asid)
> 		ttbr0 |= TTBRx_EL1_CnP;
> 
> 	/* SW PAN needs a copy of the ASID in TTBR0 for entry */
> 	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN))
> 		ttbr0 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
> 
> 	/* Set ASID in TTBR1 since TCR.A1 is set */
> 	ttbr1 &= ~TTBRx_EL1_ASID_MASK;
> 	ttbr1 |= FIELD_PREP(TTBRx_EL1_ASID_MASK, asid);
> 
> 	cpu_set_reserved_ttbr0_nosync();
> 	write_sysreg(ttbr1, ttbr1_el1);
> 	write_sysreg(ttbr0, ttbr0_el1);
> 	isb();
> 	post_ttbr_update_workaround();
> }
> 
>> +	 * unchanged to preserve the ASID rollover bookkeeping.
>> +	 */
>> +	if (mm == &init_mm) {
>> +		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
>> +		return;
>> +	}
>> +
>>  	if (system_supports_cnp())
>>  		cpu_set_reserved_ttbr0();
>>  
>> -- 
>> 2.39.5 (Apple Git-154)
>>


