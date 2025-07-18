Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQc+0bEsGtvEOCTVztSI6Skt5zowlBu/xsSYFTz5FLI=; b=xtDSCu8Q8jaGjD2BqsQIpv49At
	MGF3HFSe8Pfjh47Ug5xsEPx9/FD0TguC9sJ7Vo6shVeCY1BQQ6mAsw8YTuXSHOATu8bZLbHArGSB8
	nKw9fOYkqSZfsNvhgTfuzNTTPoaLeibDG8LegKMO5MpDf5vB9jcekdUIK0XW8sd2oq4deuSuMI7Le
	0ieHZtrAomOnMDBMOGtbB3r4FtmYLVGDx5lCWQboFjJf4Ngf5q9iU9yRyjdFsm3OGjy7BGi7kTgGc
	GTP/8nvbl0LEcfU0fyCuuZqkUhvELNadc+6jfEsD5kZSnv9RC3MBuLUTExtZ+4mzyKGKRi+th8Dd9
	7oeTC3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucim3-0000000CN6I-25Lo;
	Fri, 18 Jul 2025 10:57:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciRg-0000000CJpN-0PAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:36:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04AAE176C;
	Fri, 18 Jul 2025 03:35:56 -0700 (PDT)
Received: from [10.57.87.202] (unknown [10.57.87.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BE213F694;
	Fri, 18 Jul 2025 03:36:00 -0700 (PDT)
Message-ID: <5f171093-93fc-4f86-98ef-048b15890e7c@arm.com>
Date: Fri, 18 Jul 2025 11:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: arm64: Map hyp text as RO and dump instr on
 panic
Content-Language: en-GB
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
 maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com,
 keirf@google.com
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-3-smostafa@google.com>
 <38b08607-b9d9-425b-81c4-b227dda427b3@arm.com> <aHogf50CvjeSklRo@google.com>
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <aHogf50CvjeSklRo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_033604_228437_98653FA6 
X-CRM114-Status: GOOD (  24.37  )
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

Hi Mostafa,

On 18/07/2025 11:22, Mostafa Saleh wrote:
> Hi Ben,
> 
> On Fri, Jul 18, 2025 at 11:16:18AM +0100, Ben Horgan wrote:
>> Hi Mostafa,
>>
>> On 18/07/2025 00:47, Mostafa Saleh wrote:
>>> Map the hyp text section as RO, there are no secrets there
>>> and that allows the kernel extract info for debugging.
>>>
>>> As in case of panic we can now dump the faulting instructions
>>> similar to the kernel.
>>>
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>>    arch/arm64/kvm/handle_exit.c    |  4 +---
>>>    arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
>>>    2 files changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
>>> index de12b4d4bccd..d59f33c40767 100644
>>> --- a/arch/arm64/kvm/handle_exit.c
>>> +++ b/arch/arm64/kvm/handle_exit.c
>>> @@ -566,9 +566,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
>>>    	kvm_nvhe_dump_backtrace(hyp_offset);
>>>    	/* Dump the faulting instruction */
>>> -	if (!is_protected_kvm_enabled() ||
>>> -	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
>>> -		dump_instr(panic_addr + kaslr_offset());
>>> +	dump_instr(panic_addr + kaslr_offset());
>> This makes the dumping in nvhe no longer conditional on
>> CONFIG_NVHE_EL2_DEBUG. A change from what you introduced in the patch.
>> Perhaps it makes sense to reorder the patches; do the preparatory work for
>> instruction dumping before the enabling.>
> 
> Yes, I thought about squashing both patches, but I was worried this patch
> might be more controversial, so I split the code into 2 patches, where the
> first one can be merged separately if needed. But no strong opinion.

My concern was you were changing the non-pkvm case too in this patch but 
I see now that you weren't. Sorry, my mistake. I'm ok with this patch 
split.>
> Thanks,
> Mostafa
> 
>>>    	/*
>>>    	 * Hyp has panicked and we're going to handle that by panicking the
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
>>> index a48d3f5a5afb..90bd014e952f 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
>>> @@ -192,6 +192,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
>>>    	enum pkvm_page_state state;
>>>    	struct hyp_page *page;
>>>    	phys_addr_t phys;
>>> +	enum kvm_pgtable_prot prot;
>>>    	if (!kvm_pte_valid(ctx->old))
>>>    		return 0;
>>> @@ -210,11 +211,18 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
>>>    	 * configured in the hypervisor stage-1, and make sure to propagate them
>>>    	 * to the hyp_vmemmap state.
>>>    	 */
>>> -	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
>>> +	prot = kvm_pgtable_hyp_pte_prot(ctx->old);
>>> +	state = pkvm_getstate(prot);
>>>    	switch (state) {
>>>    	case PKVM_PAGE_OWNED:
>>>    		set_hyp_state(page, PKVM_PAGE_OWNED);
>>> -		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
>>> +		/* hyp text is RO in the host stage-2 to be inspected on panic. */
>>> +		if (prot == PAGE_HYP_EXEC) {
>>> +			set_host_state(page, PKVM_NOPAGE);
>>> +			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
>>> +		} else {
>>> +			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
>>> +		}
>>>    	case PKVM_PAGE_SHARED_OWNED:
>>>    		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
>>>    		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
>> -- 
>> Thanks,
>>
>> Ben
>>
Thanks,

Ben


