Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741AEC88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmGcXYXMxRK9a1t1eNYgxQ7bZlQnQllLXnqMIe03898=; b=xwVKj6xVNsn4x1exMfSsie5mNg
	oXwGck/DxOjXJ6cwmR5rxw1ABd0ne31EzXfYS+ef0t+wGOAMLje6dl0WGqQ48qqRr40dOznweYDKp
	Qq+KNn95KqIz7+O2vLsxF0nuxrW6Iaj6Sb1d5+ep6Ea+dEerHx/g9bvWcQMSV9dCqu+azFM69ZjQS
	ZgmnTwBi++Q+XUgKbx9ZVN9dg5IGrcpYWXpjfy0atSYPat91de9ENJBdWMwjmQaCYWP95u9BD1P0v
	ZQJER5t94IpYQkxQ+7LEEtYYzyJHvX16xRr+ccyIFvMf8aPuSJDj0cj2N9a9MV5xoT55Ejp7AtoLO
	tWkCACVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nP7-00000001pvR-1xmz;
	Sun, 13 Sep 2026 16:50:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5nP4-00000001pv0-25Xh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 16:50:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CDA21655;
	Sun, 13 Sep 2026 09:50:01 -0700 (PDT)
Received: from [10.57.10.40] (unknown [10.57.10.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 406AF3F59E;
	Sun, 13 Sep 2026 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789318205; bh=sCmGU+cEKoUvSnKU5qUyd3OvA2kbyOCOPO2fskJtYF0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJftGVirhU+yJ47n/RComPK6wJlmRkGfR9wXhGMSNU/MDSeTclom5Fn+ENHtHzORY
	 yPHtiTFdUfbeQmhOVmhDPizfn48scvNyr9cOJVRxKOHCFqM2UUjIQTtyfznkayXRBV
	 Eib+OIm6v4qg3so7amAwnZo6vJV5lirbkxxHtcek=
Message-ID: <90100d75-85a6-4ccb-8939-33446857536d@arm.com>
Date: Sun, 13 Sep 2026 17:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/20] KVM: arm64: Add vcpu load/put call backs for
 flavors
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-6-suzuki.poulose@arm.com>
 <867bkp78gs.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <867bkp78gs.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_095006_820426_54845D45 
X-CRM114-Status: GOOD (  21.82  )
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

On 13/09/2026 11:26, Marc Zyngier wrote:
> On Tue, 08 Sep 2026 17:22:08 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
>> easier to follow the code.
>>
>> Based on a patch by Marc Zyngier
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_host.h |   6 ++
>>   arch/arm64/kvm/arm.c              | 156 ++++++++++++++++++++++--------
>>   2 files changed, 123 insertions(+), 39 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index d0dccc9ad6aa8..b2e99c5cb1cd3 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -150,6 +150,11 @@ struct kvm_vmid {
>>   	atomic64_t id;

...

>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 51fc651267157..9af3bbb2f8c24 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -74,6 +74,8 @@ struct kvm_ioctl_cap_map {
>>   	long ext;
>>   };

...

>> +
>> +static void nvhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>> +{
>> +	vcpu_prepare_mmu(vcpu);
>> +	/*
>> +	 * The timer must be loaded before the vgic to correctly set up physical
>> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
>> +	 */
> 
> This comment makes no sense here -- it is strictly for VHE, which is
> the only mode to implement NV. Same thing for the pKVM vcpu_load().

Ack, removed everywhere except for VHE.

> 
>> +	kvm_timer_vcpu_load(vcpu);
>> +	kvm_vgic_load(vcpu);
>> +	kvm_vcpu_load_debug(vcpu);
>> +	kvm_vcpu_load_fgt(vcpu);
>> +	kvm_arch_vcpu_load_fp(vcpu);
>> +	kvm_vcpu_pmu_restore_guest(vcpu);
>> +
>> +	vcpu_load_pvtime(vcpu);
>> +	vcpu_set_wfx_traps(vcpu);
>> +	vcpu_set_pauth_traps(vcpu);
>> +}
>> +
>> +static void pkvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>> +{
>> +	/*
>> +	 * The timer must be loaded before the vgic to correctly set up physical
>> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
>> +	 */
>> +	kvm_timer_vcpu_load(vcpu);
>> +	kvm_vgic_load(vcpu);
>> +	kvm_vcpu_load_debug(vcpu);
>> +	kvm_vcpu_load_fgt(vcpu);
>> +	kvm_arch_vcpu_load_fp(vcpu);
>> +	kvm_vcpu_pmu_restore_guest(vcpu);
>> +
>> +	vcpu_load_pvtime(vcpu);
>> +	vcpu_set_wfx_traps(vcpu);
>> +
>> +	kvm_call_hyp_nvhe(__pkvm_vcpu_load,
>> +			  vcpu->kvm->arch.pkvm.handle,
>> +			  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
>> +	kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
>> +		     &vcpu->arch.vgic_cpu.vgic_v3);
> 
> This can also be turned into a kvm_call_hyp_nvhe().

Ack

> 
>> +}
>> +

...

>> +
>> +static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
>> +{
>> +	kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> 
> Same thing here about kvm_call_hyp_nvhe().

Ack

> 
>> +	kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>> +
>> +	/* __pkvm_vcpu_put implies a sync of the state */
>> +	if (!kvm_vm_is_protected(vcpu->kvm))
>> +		vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>> +
>> +	nvhe_vcpu_put(vcpu);
> 
> I'm not overly fond of this. Yes, that was in my original patch. But
> for example, we end-up calling kvm_arm_vmid_clear_active() for pKVM.
> This is harmless, but conceptually wrong.
> 
> I'd rather you expand the whole thing.

Done

> 
>> +}
>> +
>> +void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>> +{
>> +	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
>>   	vcpu_clear_on_unsupported_cpu(vcpu);
>>   	vcpu->cpu = -1;
>>   }
>> @@ -2136,6 +2192,28 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>>   	}
>>   }

>> +
>> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
>> +	[VM_VHE] = &vhe_vcpu_ops,
>> +	[VM_NVHE] = &nvhe_vcpu_ops,
>> +	[VM_PKVM] = &pkvm_vcpu_ops,
>> +	[VM_PROTECTED_PKVM] = &pkvm_vcpu_ops,
> 
> nit: my OCD-self wants to align all the '=' signs vertically...

I have switched to a macro initialiser, consistent with vm_s2_mmu_ops. 
So it looks much cleaner

Cheers
Suzuki


