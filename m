Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KRJ17DViepnf8E3KQTzXcqlWYspDMFXaJFpjLfW09g=; b=ljNahV/O7178KQmUq7K8pHFPco
	k6KHBZxwnStj/WHoaeuelaztlq5KI6TYQFPg1u8GMb81U613BMd/suW9eEs6fUOgDNm7EfMpKC7AN
	RWg8CHRQx+0mPREbbAnPkE790rio6uGg7NVT5BX+2YLaW9aCCb9tBPxtHNnYQtoVmrPt6QDE27OLb
	rC40MxlLIuMLQH7yPuYIG+qgexD8KTk6YY9rEyhTfBgHpO+PxsRq4KaZEFds+p6hP1882D4VIJX2p
	1l0BOltdbT9VzkRFjFiUw5YZvD6fQqZ1bsjBZY1aEBr6QTwD0eQ80ELuT7ax2P/ZAX1xiqEmnCfzk
	uUNne8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSI8-0000000AWEA-3Jpx;
	Fri, 07 Feb 2025 17:37:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRnW-0000000APo0-2DDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:05:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D024C113E;
	Fri,  7 Feb 2025 09:06:08 -0800 (PST)
Received: from [10.1.26.24] (e122027.cambridge.arm.com [10.1.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA6573F63F;
	Fri,  7 Feb 2025 09:05:41 -0800 (PST)
Message-ID: <7e03ad4a-ca82-4fe6-b789-1990dbbaf256@arm.com>
Date: Fri, 7 Feb 2025 17:05:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/43] arm64: RME: Always use 4k pages for realms
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-30-steven.price@arm.com>
 <82659880-f7a6-48ad-bf54-8371fc3d41d8@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <82659880-f7a6-48ad-bf54-8371fc3d41d8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090546_645449_F6949A21 
X-CRM114-Status: GOOD (  18.94  )
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

On 02/02/2025 06:52, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> Always split up huge pages to avoid problems managing huge pages. There
>> are two issues currently:
>>
>> 1. The uABI for the VMM allows populating memory on 4k boundaries even
>>     if the underlying allocator (e.g. hugetlbfs) is using a larger page
>>     size. Using a memfd for private allocations will push this issue onto
>>     the VMM as it will need to respect the granularity of the allocator.
>>
>> 2. The guest is able to request arbitrary ranges to be remapped as
>>     shared. Again with a memfd approach it will be up to the VMM to deal
>>     with the complexity and either overmap (need the huge mapping and add
>>     an additional 'overlapping' shared mapping) or reject the request as
>>     invalid due to the use of a huge page allocator.
>>
>> For now just break everything down to 4k pages in the RMM controlled
>> stage 2.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/kvm/mmu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index e88714903ce5..9ede143ccef1 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1603,6 +1603,10 @@ static int user_mem_abort(struct kvm_vcpu
>> *vcpu, phys_addr_t fault_ipa,
>>       if (logging_active) {
>>           force_pte = true;
>>           vma_shift = PAGE_SHIFT;
>> +    } else if (kvm_is_realm(kvm)) {
>> +        // Force PTE level mappings for realms
>> +        force_pte = true;
>> +        vma_shift = PAGE_SHIFT;
>>       } else {
>>           vma_shift = get_vma_page_shift(vma, hva);
>>       }
> 
> Since a memory abort is specific to a vCPU instead of a VM, so
> vcpu_is_rec()
> instead of kvm_is_realm() is more accurate for the check. Besides, it looks
> duplicate to the check added by "PATCH[20/43] arm64: RME: Runtime faulting
> of memory", which is as below.
> 
>        /* FIXME: We shouldn't need to disable this for realms */
>        if (vma_pagesize == PAGE_SIZE && !(force_pte || device ||
> kvm_is_realm(kvm))) {
>                                                                 
> ^^^^^^^^^^^^^^^^^
>                                                                  Can be
> dropped now.

Indeed, thanks for that - one less FIXME ;)

Thanks,
Steve

> Thanks,
> Gavin
>                 
> 


