Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC3FC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svE2nEz2pNAWNk2SquIJRiE6s0jQ+oYHF6ukp5jSzXw=; b=Lt7Sm83PZxDBYJVml8ZeW06vF7
	fA3z7LCMtUdABk+7G8A2mHL4c6umm75NnI2Ipc6nAE6gYCFFdWTKgUTpHKDhN/RsLLRdkPTeJVU+g
	owI25GsJXWGhcai5oDKotYomnNEO/+yyMSxX6bNncBU1dFLnPgVgLz/U1UzF5nVbRGTlrDdHYmDRp
	cR17OeFyMAAplyFFYOGwTY1SeHi5rMWEZk/CQJrOv6XHl6oraRyWPnrAaPgZMaaX7gwVDM+RQ7itK
	P1/g2JQUa4bNKSfNIrD798FFtaDI6kDwVICkPaRYrwRIR2AacR2N2s+hvgc1RNswb9X0ekgG+sPY1
	ztouJ+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kzn-00000008iML-3Z0O;
	Wed, 16 Sep 2026 08:27:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kzl-00000008iM6-22Wg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 08:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=svE2nEz2pNAWNk2SquIJRiE6s0jQ+oYHF6ukp5jSzXw=; b=PpFAbKadQ9CyiMGI8+I1ZoGUIH
	wo5/wEZ4Nvs0AtfkZR0fnjktDZ64so7PJjRPVfy2UM8f0VXn4alVtX3YrdRx06DqNCSh+8BX399P3
	XFT8ltlCykWdaLMln3pIrJwc0h3aWvlkt9TY9y2kSKCpmD2/8zY87FGNUjHZ9T02aD+LukFwZayy4
	XU2mTM8FekuwQNg6tvSbdcFBhtKPD7Jeoo2HZ6kadwCRht+214+Jp1stW7w0/sk4QTJXgwBolvXMK
	ekYkT1D0+xtuI1zENCaiCtA288flaDvq7ds0f/QqEZJRSw1gH1oRbmtvFK1DB5MbKWLforOBEl0pg
	hCzK54MA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kzi-00000007d0e-0aIh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:27:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8033152B;
	Wed, 16 Sep 2026 01:27:48 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A97B3F882;
	Wed, 16 Sep 2026 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789547272; bh=SC9sfcMnJ/PEFobWZVnmMbUTIFBvDkYTVdafgFGlQM4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cZLOlYqdunxqc5S8b7CsUOJR8q77ehv8styLLAf+uYgcAzeNJ/oXYr8R0jA/Ycd0U
	 KN2fN/br8WnzGMNA7hcXsuDr0ExCzIwtWprwMg3biLx/h0ryGDAIcjyuTEq/eM/wDt
	 IEbppHN1ZOW6OEyEnesegpbr7fdkusEc4UKbYE3M=
Message-ID: <5c4a9d72-2f46-4121-8e9f-ae85f28eff1f@arm.com>
Date: Wed, 16 Sep 2026 09:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 01/23] KVM: arm64: protected VM: Handle set_one_reg
 CNTVCT_EL0/CNTPCT_EL0
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
 Marc Zyngier <maz@krenel.org>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-2-suzuki.poulose@arm.com>
 <86o6dy5uob.wl-maz@kernel.org> <7c26c860-0543-459e-974b-72c59af261f9@arm.com>
 <a4e7e6c3-d325-4f35-a17c-e02791cca326@arm.com> <86ik45626u.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86ik45626u.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_092754_631743_77D5B45F 
X-CRM114-Status: GOOD (  17.61  )
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

On 16/09/2026 09:16, Marc Zyngier wrote:
> On Tue, 15 Sep 2026 22:20:36 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> This is how it looks like now, reworked.
>>
>>
>> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
>> index 6ac3321f4c575..1c8fac222a643 100644
>> --- a/arch/arm64/kvm/arch_timer.c
>> +++ b/arch/arm64/kvm/arch_timer.c
>> @@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>>                  timer_context_init(vcpu, i);
>>
>>          /* Synchronize offsets across timers of a VM if not already
>> provided */
>> -       if (!vcpu_is_protected(vcpu) &&
>> -           !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET,
>> &vcpu->kvm->arch.flags)) {
>> +       if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET,
>> &vcpu->kvm->arch.flags)) {
>>                  timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>>                  timer_set_offset(vcpu_ptimer(vcpu), 0);
>>          }
>> @@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
>>           */
>>          for (int i = 0; i < NR_KVM_TIMERS; i++)
>>                  kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm,
>> default_ppi[i]);
>> +
>> +       /*
>> +        * For the protected VMs, fix the counter offset to 0 by marking the
>> +        * KVM_ARCH_FLAG_VM_COUNTER_OFFSET. This would also prevent
>> userspace
>> +        * writes to CNTVCT_ELO & CNTPCT_EL0.
>> +        * The user can't set the offset via vm ioctl
>> KVM_ARM_SET_COUNTER_OFFSET.
>> +        */
> 
> This is a bit wordy. Something like:
> 
> 	Protected VMs don't allow any offset being set from userspace,
> 	either set via writes to the counters or using the dedicated
> 	ioctl. Pretend the offset has already been set and rely on the
> 	default offset being 0.
> 
>> +       if (kvm_vm_is_protected(kvm))
>> +               set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
>>   }
>>
>>   void kvm_timer_cpu_up(void)
> 
> Otherwise LGTM.

Thanks,

Cheers
Suzuki

> 
> 	M.
> 


