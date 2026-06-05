Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1C1CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f05mguxYYqLAMLSKqFzWx2BVXXtkZTDKtXby8dtsY2k=; b=LpY5EQv1RvUQKPwre3CpMb1KEA
	0h3ZQUlh5WNhB7K+tBAaDwkg9xr1jrMsxORDYzbEbSnD/T6F3rR1d8PQSKHSPFM1Dmsi+JW8vHhGx
	a6X5kM9wFNbBMugt3sXPSj33IErhqoby7k9fDjvAnvHL9Zi3bPjvMMLtMOA/4YWKUlyX9f7SjLe4j
	x9buj7Po3f5dwQW5Kx5/HWLZ3Ajc0uq6eIW6CuHyXsQoPPfGo9QgQxiNuwOorbPp7CmCH1LKARWht
	LD1dHWZd3aqxZmHyBn0fbOWhDCDwKRoNfMQO/GpdJU7kXgF4pjxj1Gi2K2JH96m1chQ7u+E4LKxbM
	9QIPjfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVW49-00000000mDG-2KhL;
	Fri, 05 Jun 2026 15:02:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVW47-00000000mCS-2VC8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:02:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18F6B2E9D;
	Fri,  5 Jun 2026 08:02:25 -0700 (PDT)
Received: from [10.1.31.21] (e122027.cambridge.arm.com [10.1.31.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 797C43F7D8;
	Fri,  5 Jun 2026 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780671749; bh=7tt4d8MaJgpOSLKymncdsizpcHBAdx7d144Wan8ieGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G6NmiYoYNX8kpQgsWGEAAEKqMnc2Q3GqMf446Ca73c0kIwcSLs6I/ps9ycxqLp4VB
	 bhT7XUxfOJufCkHkLzDHMMS0OLzCkcrsTPDrhEMhUH8N3PrZ9tiOVEWSaeS2AG0rbH
	 AXF0TKQuPtK5APza+Ph3AGCg2Dbn90hOUmY6cMfE=
Message-ID: <d9d57c7d-45c7-4747-b7ce-ec3bab537136@arm.com>
Date: Fri, 5 Jun 2026 16:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 20/44] arm64: RMI: Support for the VGIC in realms
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-21-steven.price@arm.com>
 <5ea74b6a-a51a-415e-b53f-5ece9829dee8@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <5ea74b6a-a51a-415e-b53f-5ece9829dee8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_080231_731039_D8970104 
X-CRM114-Status: GOOD (  20.80  )
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

On 28/05/2026 05:07, Gavin Shan wrote:
> Hi Steve,
> 
> On 5/13/26 11:17 PM, Steven Price wrote:
>> The RMM provides emulation of a VGIC to the realm guest. With RMM v2.0
>> the registers are passed in the system registers so this works similar
>> to a normal guest, but kvm_arch_vcpu_put() need reordering to early out,
>> and realm guests don't support GICv2 even if the host does.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v12:
>>   * GIC registers are now passed in the system registers rather than via
>>     rec_entry/rec_exit which removes most of the changes.
>> Changes from v11:
>>   * Minor changes to align with the previous patches. Note that the VGIC
>>     handling will change with RMM v2.0.
>> Changes from v10:
>>   * Make sure we sync the VGIC v4 state, and only populate valid lrs from
>>     the list.
>> Changes from v9:
>>   * Copy gicv3_vmcr from the RMM at the same time as gicv3_hcr rather
>>     than having to handle that as a special case.
>> Changes from v8:
>>   * Propagate gicv3_hcr to from the RMM.
>> Changes from v5:
>>   * Handle RMM providing fewer GIC LRs than the hardware supports.
>> ---
>>   arch/arm64/kvm/arm.c            | 11 ++++++++---
>>   arch/arm64/kvm/vgic/vgic-init.c |  2 +-
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 93d34762db91..21d9dfdb1ea0 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -786,19 +786,24 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>>           kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>>       }
>>   +    kvm_timer_vcpu_put(vcpu);
>> +    kvm_vgic_put(vcpu);
>> +
>> +    vcpu->cpu = -1;
>> +
>> +    if (vcpu_is_rec(vcpu))
>> +        return;
>> +
> 
> For a REC, kvm_vcpu_{load, put}_debug() becomes unbalanced in
> kvm_arch_vcpu_{load, put}().
> kvm_vcpu_load_debug() is called in kvm_arch_vcpu_load(), but
> kvm_vcpu_put_debug() won't
> be called in kvm_arch_vcpu_put() after this whole series is applied.

Good catch. Yes that's not quite right.

Thanks,
Steve

>>       kvm_vcpu_put_debug(vcpu);
>>       kvm_arch_vcpu_put_fp(vcpu);
>>       if (has_vhe())
>>           kvm_vcpu_put_vhe(vcpu);
>> -    kvm_timer_vcpu_put(vcpu);
>> -    kvm_vgic_put(vcpu);
>>       kvm_vcpu_pmu_restore_host(vcpu);
>>       if (vcpu_has_nv(vcpu))
>>           kvm_vcpu_put_hw_mmu(vcpu);
>>       kvm_arm_vmid_clear_active();
>>         vcpu_clear_on_unsupported_cpu(vcpu);
>> -    vcpu->cpu = -1;
>>   }
>>     static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
>> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/
>> vgic-init.c
>> index 933983bb2005..a9db963dfd23 100644
>> --- a/arch/arm64/kvm/vgic/vgic-init.c
>> +++ b/arch/arm64/kvm/vgic/vgic-init.c
>> @@ -81,7 +81,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>>        * the proper checks already.
>>        */
>>       if (type == KVM_DEV_TYPE_ARM_VGIC_V2 &&
>> -        !kvm_vgic_global_state.can_emulate_gicv2)
>> +        (!kvm_vgic_global_state.can_emulate_gicv2 || kvm_is_realm(kvm)))
>>           return -ENODEV;
>>         /*
> 
> Thanks,
> Gavin
> 


