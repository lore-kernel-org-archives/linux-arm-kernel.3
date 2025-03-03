Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1D2C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GP4etIXgNO6EtAn6KcYkTeVlaUF23mVNyvl6IApX670=; b=mWnNaMpXwnKRqx+5bjb/N9twk9
	M8Sc5pbR8RTUN0MMAMnc42wKew2hGPr20QST/SzSZ5V5xBZdyj7h7DvFUv723K0S4Dx5cNZ97qvAx
	IiaqqoyvmsrV8olvlU8dhhmgBoF0NLZHfR83inOM9bICemLU9OgwTVneJYOB2cZ+z8N/AiGjEG7tU
	R85gRIjJnT34H4SqXpxMSFyehBbVUR6knBK4+IsTAxQmYxiKSSyF7ZyT0WY0bUf/zpDPkyvIvlf7/
	5+UHBX3XIqVj9jrxrea2wyNAB8Pc0tMYAgGN3wA5y4w7OSZ7RRF4tzUqS5OD+D0M76mloEoUMPE9i
	5P8abW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Oj-00000001E7e-0vsx;
	Mon, 03 Mar 2025 15:08:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7MK-00000001Dbd-1wZ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:05:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B0B6113E;
	Mon,  3 Mar 2025 07:05:43 -0800 (PST)
Received: from [10.1.39.33] (e122027.cambridge.arm.com [10.1.39.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD6FE3F5A1;
	Mon,  3 Mar 2025 07:05:25 -0800 (PST)
Message-ID: <762524e0-d54f-4026-8a1d-732a7cfc6a1a@arm.com>
Date: Mon, 3 Mar 2025 15:05:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/45] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Sean Christopherson <seanjc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-2-steven.price@arm.com>
 <8bf9ba6c-a8b2-42aa-9802-8e968bec1cd5@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <8bf9ba6c-a8b2-42aa-9802-8e968bec1cd5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_070532_735848_6D31E8FB 
X-CRM114-Status: GOOD (  16.66  )
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

On 02/03/2025 23:36, Gavin Shan wrote:
> On 2/14/25 2:13 AM, Steven Price wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> Add flags to "struct kvm_gfn_range" to let notifier events target only
>> shared and only private mappings, and write up the existing mmu_notifier
>> events to be shared-only (private memory is never associated with a
>> userspace virtual address, i.e. can't be reached via mmu_notifiers).
>>
>> Add two flags so that KVM can handle the three possibilities (shared,
>> private, and shared+private) without needing something like a tri-state
>> enum.
>>
>> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   include/linux/kvm_host.h | 2 ++
>>   virt/kvm/kvm_main.c      | 7 +++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 3cb9a32a6330..0de1e485452c 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -266,6 +266,8 @@ struct kvm_gfn_range {
>>       gfn_t end;
>>       union kvm_mmu_notifier_arg arg;
>>       enum kvm_gfn_range_filter attr_filter;
>> +    bool only_private;
>> +    bool only_shared;
>>       bool may_block;
>>   };
> 
> The added members (only_private and only_shared) looks duplicated to the
> member of attr_filter, which can be set to KVM_FILTER_SHARED,
> KVM_FILTER_PRIVATE,
> or both of them. More details can be found from the following commit where
> attr_filter was by dca6c88532322 ("KVM: Add member to struct kvm_gfn_range
> to indicate private/shared").
> 
> I'm guessing Sean's suggestion was given before dca6c88532322 showed up.

Thanks for pointing this out - you are absolutely right. I need to
switch the code in the following patches over to use attr_filter
instead. I hadn't realised when rebasing that attr_filter is the
replacement.

Thanks,
Steve

>>   bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index faf10671eed2..4f0136094fac 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -593,6 +593,13 @@ static __always_inline kvm_mn_ret_t
>> __kvm_handle_hva_range(struct kvm *kvm,
>>                * the second or later invocation of the handler).
>>                */
>>               gfn_range.arg = range->arg;
>> +
>> +            /*
>> +             * HVA-based notifications aren't relevant to private
>> +             * mappings as they don't have a userspace mapping.
>> +             */
>> +            gfn_range.only_private = false;
>> +            gfn_range.only_shared = true;
>>               gfn_range.may_block = range->may_block;
>>               /*
>>                * HVA-based notifications aren't relevant to private
> 
> Thanks,
> Gavin
> 


