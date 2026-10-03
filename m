Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD689CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RRdaCYPA33wIU/LOcuilSET0w7vnNX3u3/McsxZyHw=; b=yRqml52fuSSDhjEt+SsMhn0K+V
	hVjU0bzPAs4aNsPmnLu+rtB0NLPkypEFwa+J1Q34/EarVuoC8kngYISj/sGTBlti1oxIIq0/y1IPN
	QOHQZvI7Z7Rj7xoA5oekKN5rQrAvyxnGBh1EI/LV8EcDxfLTsHTRVjZpmoLAkTzQHGJTiAFWAfuvO
	Y4LsVx+iAe5etu2vz3m5RnSDOdFK57xhJ4NChc/MZmMRrbcQfpLy0iClIM5/Ve4f82UuFsENK9B82
	DWa0QIAoN9wN08uFxGANRAiwDc8Y5/aAUpM4BQtLCeUdVGV/nizsgroMtXrDmDZLbmGEXxSB1N+BG
	LUQqzlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1go-0000000DhKM-2BEb;
	Sat, 03 Oct 2026 15:30:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1gl-0000000DhJq-3A9h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 15:30:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B511143D;
	Sat,  3 Oct 2026 08:30:08 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78A283F86F;
	Sat,  3 Oct 2026 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791041411; bh=DqNzmiLqSRpWo/O9PN56Vgk4zOzq2vzIekil+azxtfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VsluF5b6kSrZ+AUV4dej8J3hVAA0bso9VTPuE066QFBnPImM3oadyvBD4Og9UtP29
	 50yVKbbIbWEUm/fpCMSMFhuU/77J7B7JoUuvUqrzDggYJQOP30hz3/M2LO4o+uEVYK
	 m0MI8bfOukYnTKVm+bkg7o+Z0KqJJtqTlD7KGh4M=
Message-ID: <9873fb9d-6f32-46f6-bcac-6a52e293d011@arm.com>
Date: Sat, 3 Oct 2026 16:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 10/23] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-11-suzuki.poulose@arm.com>
 <86ik3j2m5v.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86ik3j2m5v.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_083016_086534_EDFB2DF7 
X-CRM114-Status: GOOD (  14.15  )
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

On 03/10/2026 10:01, Marc Zyngier wrote:
> On Thu, 01 Oct 2026 22:06:50 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> Add VM type specific S2 MMU operation backends which can be initialized per
>> VM flavor, to keep the handling cleaner.
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v19:
>>   - Add a blank line in kvm_arch_flush_remote_tlbs()


>>   struct kvm_s2_mmu {
>>   	struct kvm_vmid vmid;
>>   
>> @@ -332,6 +345,8 @@ struct kvm_arch {
>>   	 */
>>   	u64 fgu[__NR_FGT_GROUP_IDS__];
>>   
>> +	const struct kvm_vm_s2_ops *vm_s2_ops;
>> +
> 
> If you're touching this patch, can you please move this pointer next
> to the vcpu_ops pointer?

Sure, I will do that.

>> +
>> +static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
>> +	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
>> +	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
>> +	/*
>> +	 * Not supported for Protected VMs under pKVM
>> +	 * .vm_age_gfn
>> +	 * .vm_test_age_gfn
>> +	 * .vm_stage2_unmap_range
>> +	 */
> 
> I really think we should have *something* here that returns
> "unsupported", and avoid NULL-checks in the dispatchers.

Ack

> 
>> +};
>> +
>> +static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
>> +	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
>> +	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
>> +	.vm_age_gfn			= kvm_vm_age_gfn,
>> +	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
>> +	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> 
> and since we have this: can we get rid of the KVM_PGT_FN() hack?

Ack, I will give it a go.


>> +#define KVM_VM_S2_OPS(flavor, ops)		\
>> +		[flavor] = ops
>> +static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
>> +	KVM_VM_S2_OPS(VM_VHE, &kvm_default_vm_s2_ops),
>> +	KVM_VM_S2_OPS(VM_NVHE, &kvm_default_vm_s2_ops),
>> +	KVM_VM_S2_OPS(VM_PKVM, &pkvm_vm_s2_ops),
>> +	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, &protected_pkvm_vm_s2_ops),
> 
> nit: move the '&' into the macro.

Ack.

Suzuki


