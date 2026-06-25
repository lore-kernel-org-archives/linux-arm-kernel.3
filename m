Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772A3CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo5Pwp+PZ/XVHYySnp1UUgS73FYu9rNA36Z4MotzOOg=; b=OYopbICWQ1EeV8emZiEGOD+WNt
	XNOihxOOK5T+FZffnaZBTrrPyw4hzJlvaB0Pkr0kBgVQLfGvyeQidU6EdmbJ0uwCFqP/oenIDY4KF
	uzcsW03XsH7f+uye4FIzuYc++IARISjGH7c6w9moymljyhLLnXF8d+jnz4N6i/LefaDT4RWTw0hp/
	vBHOSw/3TAVZXvbAbqap0F1aBlr93vB7pUdFqTeBvbE/SqNT690vDb7KPqaYqKli4SlF47nxeUflm
	2E6Ui60vkalpnRbTlOh7mFkNRHe0+QbD2mIGErXdCbPj3ss07+99ThNlJ4xl5vgcW4t0D39keZv6d
	74JLSX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmnR-00000009SsA-0RcM;
	Thu, 25 Jun 2026 16:19:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmnO-00000009Srm-1S8l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:19:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B2F23165;
	Thu, 25 Jun 2026 09:19:11 -0700 (PDT)
Received: from [10.57.25.211] (unknown [10.57.25.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E4F3F836;
	Thu, 25 Jun 2026 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782404356; bh=pPOtgiQ6nS0ClOv75U7F6NplWOi+LZM45knFOXi9OCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R8ky6eK6otniQz0tX4X2/mZe2xO749mYgapqpG/Kc2tR/D52NLVkJ8nvedfF1ilEa
	 r41ZER+aidvk8k3VGWcWbqqmOgGTTlmTkJ0kiy8eQ4jiaOZj/6H+/HCPCqBr1CUwgR
	 NjT4emEydoEvvFMq+0fmgSaxYNIhbdswRVJLBDjM=
Message-ID: <9b96068c-97d8-4093-a707-faf39e193857@arm.com>
Date: Thu, 25 Jun 2026 17:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/44] arm64: RMI: Allow populating initial contents
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Gavin Shan <gshan@redhat.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-27-steven.price@arm.com>
 <ea4be6c5-9506-4253-80c5-c76c9ac3b77d@redhat.com>
 <0c71b4b8-ad0b-4a24-9f4a-180b2aaacdb6@arm.com>
 <ad45c64c-18ab-4d42-9813-0ac1704bb127@arm.com>
 <9631be66-c757-488d-bb66-a62698aa26b8@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <9631be66-c757-488d-bb66-a62698aa26b8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_091918_483580_5D94AB8E 
X-CRM114-Status: GOOD (  15.88  )
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

On 08/06/2026 14:53, Steven Price wrote:
> On 08/06/2026 10:41, Suzuki K Poulose wrote:
>> On 08/06/2026 10:36, Steven Price wrote:
>>> On 28/05/2026 06:30, Gavin Shan wrote:
>>>> Hi Steve,
>>>>
>>>> On 5/13/26 11:17 PM, Steven Price wrote:
>>>>> The VMM needs to populate the realm with some data before starting
>>>>> (e.g.
>>>>> a kernel and initrd). This is measured by the RMM and used as part of
>>>>> the attestation later on.
>>>>>
>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>
>> ...
>>
>>>>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>>>> index a89873a5eb77..209087bcf399 100644
>>>>> --- a/arch/arm64/kvm/rmi.c
>>>>> +++ b/arch/arm64/kvm/rmi.c
>>>>> @@ -486,6 +486,75 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>>>>> unsigned long start,
>>>>>             realm_unmap_private_range(kvm, start, end, may_block);
>>>>>     }
>>>>>     +static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
>>>>> +                   kvm_pfn_t dst_pfn, kvm_pfn_t src_pfn,
>>>>> +                   unsigned long flags)
>>>>> +{
>>>>> +    struct realm *realm = &kvm->arch.realm;
>>>>> +    phys_addr_t rd = virt_to_phys(realm->rd);
>>>>> +    phys_addr_t dst_phys, src_phys;
>>>>> +    int ret;
>>>>> +
>>>>> +    dst_phys = __pfn_to_phys(dst_pfn);
>>>>> +    src_phys = __pfn_to_phys(src_pfn);
>>>>> +
>>>>> +    if (rmi_delegate_page(dst_phys))
>>>>> +        return -ENXIO;
>>>>> +
>>>>> +    ret = rmi_rtt_data_map_init(rd, dst_phys, ipa, src_phys, flags);
>>>>> +    if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>>>> +        /* Create missing RTTs and retry */
>>>>> +        int level = RMI_RETURN_INDEX(ret);
>>>>> +
>>>>> +        KVM_BUG_ON(level == KVM_PGTABLE_LAST_LEVEL, kvm);
>>>>
>>>>           KVM_BUG_ON(level >= KVM_PGTABLE_LAST_LEVEL, kvm);
>>>
>>> Ack.
>>>
>>
>> Thinking more about this, I guess a buggy VMM can trigger this
>> by populating twice ? (level == KVM_PGTABLE_LAST_LEVEL). So, we should
>> return the error back, than warning here and suppressing the error ?
> 
> Populating twice causes rmi_delegate_page() to be run twice on the same
> page and the second one will then fail. So I don't think this is
> possible (please correct me if I've missed something!)

Good point, but I think this may not fail to allow the hugepages in the
future. The DELEGATE_RANGE would skip the granules in DELEGATED/DATA 
state. I am getting this clarified in the spec.


Suzuki

> 
> Thanks,
> Steve


