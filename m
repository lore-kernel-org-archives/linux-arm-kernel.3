Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1317C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3wzVxsYuv/uB9LTASvyoQxyBL6r63OqrhOgyH7FHZM=; b=3+GRSU0eeXHhzGGIAcjLia5a5U
	Hzez0KOT91XJ2c63DFbopLAYMGbqt4ofxqEGyNLlxqC7AEHFl4iterBgB+E7rfImCCyA8NqieuRYn
	r3mDzj6lkPbldJIUICqSQmea2WBUMakuvdK+osl3c5sHj2oW8iB6u1mNyHgr07BZHBoquRULGwO93
	+bm+G1xeXjiCxxG+NJSaWg5QlohmeC6d6a821i0JprGCK/cTr1gxNuRoQ6uFVDLLkEEk4b9/58gGT
	yo+RRmepdde+vs6DxeqUR7rf91bJrJJoXyfk0C8yErmMktujNQhhxqnvReOUwhLPEbEjfEwc2DA7P
	gDlqyPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgiK-0000000FTkC-0HiA;
	Wed, 21 May 2025 10:30:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgZc-0000000FRSI-2rj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:21:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 962AF1515;
	Wed, 21 May 2025 03:21:05 -0700 (PDT)
Received: from [10.57.23.70] (unknown [10.57.23.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 460CB3F6A8;
	Wed, 21 May 2025 03:21:15 -0700 (PDT)
Message-ID: <0906c39b-2e67-4f5f-86fb-aa8d5abde0ed@arm.com>
Date: Wed, 21 May 2025 11:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 21/43] KVM: arm64: Handle realm VCPU load
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-22-steven.price@arm.com>
 <9a09a3fe-c91c-457f-b6da-9fccbf98e649@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <9a09a3fe-c91c-457f-b6da-9fccbf98e649@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_032120_765452_FD4320F3 
X-CRM114-Status: GOOD (  16.51  )
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

On 19/05/2025 18:48, Suzuki K Poulose wrote:
> On 16/04/2025 14:41, Steven Price wrote:
>> When loading a realm VCPU much of the work is handled by the RMM so only
>> some of the actions are required. Rearrange kvm_arch_vcpu_load()
>> slightly so we can bail out early for a realm guest.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   arch/arm64/kvm/arm.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index cf707130ef66..08d5e0d76749 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -644,10 +644,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu,
>> int cpu)
> 
> I think we use the pkvm hook to skip to the nommu goto, to avoid
> the VMID allocation and context flush.
> 
> 
>>       kvm_timer_vcpu_load(vcpu);
>>       kvm_vgic_load(vcpu);
>>       kvm_vcpu_load_debug(vcpu);
>> -    if (has_vhe())
>> -        kvm_vcpu_load_vhe(vcpu);
>> -    kvm_arch_vcpu_load_fp(vcpu);
>> -    kvm_vcpu_pmu_restore_guest(vcpu);
>>       if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>           kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> 
> We could also move thise pvtime to the bottom too ?
> 
>>   @@ -671,6 +667,15 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu,
>> int cpu)
>>                    &vcpu->arch.vgic_cpu.vgic_v3);
>>       }
>>   +    /* No additional state needs to be loaded on Realmed VMs */
>> +    if (vcpu_is_rec(vcpu))
>> +        return;
>> +
>> +    if (has_vhe())
>> +        kvm_vcpu_load_vhe(vcpu);
>> +    kvm_arch_vcpu_load_fp(vcpu);
>> +    kvm_vcpu_pmu_restore_guest(vcpu);
>> +
> 
> With the above addressed:
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks, the suggestions above seem sensible, I'll make those changes.

Thanks,
Steve

> 
> 
>>       if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
>>           vcpu_set_on_unsupported_cpu(vcpu);
>>   }
> 


