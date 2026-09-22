Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE1FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Eu9EglNm4iashxzanjdU+17SK0PBj7pwkykuDmCaiA=; b=qv56Ev6C0fwNz0nSxJ/yqHRzrX
	lFA3CbmQluC89W3yrgUWrsF0qfOULnU4cxqPwI9/zHnBcCikCb7vHNknOwkH054O5xRJtskRRnbt5
	XoR+laMGnQpiUw1nwtOwRhBrR1Z/Le4ckLUmRQ9c38qvLyddYvVSAyYwF9uc+1r0xaORkzwdEnEO4
	V0MvY/V8Ub30g24jbnobXyWqZ4rYMQ8iCzr6aoHKOlPVl6ADtkPY/snc2rqtgSDVW5qkOIk6xW04t
	X8Y3zcmkVHBmXktciHwBkKtcS6GwcIy5yVo7PkGF9UQQHnMzuYS736vDOFEFEKSgA2g1K9dwIQo/t
	wZS0h1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98bc-00000006erw-0sZ3;
	Tue, 22 Sep 2026 22:04:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98bY-00000006erZ-2DvL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:04:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D76001576;
	Tue, 22 Sep 2026 15:04:43 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A9ED3F632;
	Tue, 22 Sep 2026 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790114687; bh=Pme4KNcFZXJCIoYwtV2Ju4v44jpGiA6KmoFoYffHKlo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUzMrFNN2YDLQ/vBLkf5ziJp0MauZmc6HYaYVirUs9GjhN/W5+KiMaqyM/TSCVOSZ
	 pNVGncyNZjg1NMBjqp+vvC8eTuIBydnjAOYGnLuEN87pTaXuSNq9gIUFCO49EjZzxL
	 eUOm6uN1kKE8gf+vWa19FeEJ1R64dIb4XZcoflDY=
Message-ID: <fa2f4766-0795-464a-80ca-2f3fd1c5140b@arm.com>
Date: Tue, 22 Sep 2026 23:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 01/20] KVM: arm64: protected VM: Handle user writes to
 CNTVCT_EL0/CNTPCT_EL0
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-2-suzuki.poulose@arm.com>
 <20260922122542.00006868@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922122542.00006868@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_150448_673539_F3A06C8E 
X-CRM114-Status: GOOD (  23.79  )
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

On 22/09/2026 20:25, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 22:28:26 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
> Hi Suzuki,
> 
>> Protected VMs doesn't allow setting offsets for virtual and phyiscal
> 
> physical
> 
>> counters, as the offset is always fixed to 0. The VM ioclt is filtered
> 
> ioctl
> 
>> out based on the cap. However we don't prevent the userspace from trying
>> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
>> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
>>
>> Fix this by always "fixing" the timer offsets to 0 and marking that the
>> timer offset is set in the kvm->arch.flags at KVM init time for protected
>> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
>> any real effect. This was chosen over preventing the writes to these
>> registers and returning -EPERM.
> 
> Why?  I don't mind the decision but telling us what was chosen is something
> we can see in the code - patch description should give us the stuff we
> can't see.
> 
> One comment on the comment below.
>>
>> Reported by Sashiko
>>
>> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
>> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v18:
>>   - Retain NULL vm_offset for protected VMs to avoid host tampering with the
>>     offset.
>>   - Moved the flag setting into kvm_timer_init_vm(), where it should have been
>>     in the first place
>> ---
>>   arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
>> index 6ac3321f4c575..226cd5a495c8b 100644
>> --- a/arch/arm64/kvm/arch_timer.c
>> +++ b/arch/arm64/kvm/arch_timer.c
>> @@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>>   		timer_context_init(vcpu, i);
>>   
>>   	/* Synchronize offsets across timers of a VM if not already provided */
>> -	if (!vcpu_is_protected(vcpu) &&
>> -	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>> +	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>>   		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>>   		timer_set_offset(vcpu_ptimer(vcpu), 0);
>>   	}
>> @@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
>>   	 */
>>   	for (int i = 0; i < NR_KVM_TIMERS; i++)
>>   		kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm, default_ppi[i]);
>> +
>> +	/*
>> +	 * Protected VMs don't allow any offset being set from userspace,
>> +	 * either set via writes to the counters or using the dedicated
> This sentence confused me.  Second clause isn't obviously the ways that
> are being blocked. Maybe shorten to:
> 
> 	Protected VMs don't allow the offset to be set from userspace,
> 	whether via writes to the counters or the dedicated ioctl.

LLM suggests:


    * Protected VMs don't allow userspace to set counter offsets,
    * either via counter register writes or the dedicated ioctl.

Have updated the comment.

Cheers
Suzuki

> 
>> +	 * ioctl. Pretend the offset has already been set and rely on the
>> +	 * default offset being 0.
>> +	 */
>> +	if (kvm_vm_is_protected(kvm))
>> +		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
>>   }
>>   
>>   void kvm_timer_cpu_up(void)
> 


