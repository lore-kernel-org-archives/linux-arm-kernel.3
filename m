Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D5CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfmcfI6Xid9q/j7VmfFvaPdDYOIEGzTiVOy1NFNbmBc=; b=aogaKiFXgSBK5OYbWIRL5gkPM4
	RTv/HF8OCOELRFIY46IGcJHy0jUsszopMOxLh7t4xZazBMmC5CnfXoIIsv7Xft4XHAaYWBwPbU/VN
	YcIR8JuJxtxJdIKI0QBCXnwMQdgmSN2T5YEiiny+YZuF9jBkFUr8x5u+AEDUgnTDzGMK2d5PpR1FD
	RvC1gqMU4So/D6E3zNOkAPIDYMeRrLUZE5iPewBr4lZuE6UM8db4ueg04cbv1SFdIgiXyrLRCVmWz
	W6vYDdcYOMB6Wfo8F4LcffGGXf8xqwQhzi9391aOBUSy1DQG5MGHMNRVU2yu/77fd4sN/KhD7h92f
	pYf3pVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxY3-000000003Te-3rtG;
	Tue, 06 Oct 2026 05:17:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxY1-000000003T6-3FG6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:17:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DB501595;
	Mon,  5 Oct 2026 22:16:59 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FDC93F763;
	Mon,  5 Oct 2026 22:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791263822; bh=kHIm+ZDWQlpWJpE9d5aQjGHHIl9MwtWL1KWoAeMrPFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pHx0Id4RKKixcaqOGUtz/rMKGkyxbzSAbBrO66ZqlaFbKPPloHaO3JHCtR5afBzb0
	 NlpNxt/3vunMOVgdAGko+QCAtqhQ1ORCT+DjwS0czGB4udJdRHbD1eoYsr5mJzNbbp
	 wmCb02JNAgIr3EnhWzn4YGctrLa+XgHkM+6kb9XA=
Message-ID: <f8cbd31f-3512-47c2-a046-1fd398df13e3@arm.com>
Date: Tue, 6 Oct 2026 07:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 09/23] KVM: arm64: Prevent unsupported vcpu features
 for VM types
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-10-suzuki.poulose@arm.com>
 <32c662e1-0de9-44a7-81e5-2b1e6c824114@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <32c662e1-0de9-44a7-81e5-2b1e6c824114@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_221705_912679_335C3286 
X-CRM114-Status: GOOD (  18.40  )
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

On 06/10/2026 03:25, Gavin Shan wrote:
> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>> Prevent unsupported VCPU features for the protected VCPUs. Realms and 
>> pVMs
>> not support 32bit EL1 or NV yet. pKVM doesn't rely on the host vcpu
>> features and it clears the unsupported features while hyp_vcpu is
>> initialised. Block the features early in the vcpu init if we detect
>> incompatible features.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
> 
> One nitpick below. In either way:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks !

> 
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index f31d31fa27ad9..9c2ef7ca6a961 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -1668,11 +1668,12 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, 
>> struct kvm_irq_level *irq_level,
>>       return -EINVAL;
>>   }
>> -static unsigned long system_supported_vcpu_features(void)
>> +static unsigned long system_supported_vcpu_features(struct kvm_vcpu 
>> *vcpu)
>>   {
>>       unsigned long features = KVM_VCPU_VALID_FEATURES;
>> -    if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
>> +    if (vcpu_is_protected(vcpu) ||
>> +        !cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
>>           clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
>>       if (!kvm_supports_guest_pmuv3()) {
>> @@ -1688,7 +1689,8 @@ static unsigned long 
>> system_supported_vcpu_features(void)
>>           clear_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features);
>>       }
>> -    if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
>> +    if (vcpu_is_protected(vcpu) ||
>> +        !cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
>>           clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
>>       return features;
>> @@ -1708,7 +1710,7 @@ static int kvm_vcpu_init_check_features(struct 
>> kvm_vcpu *vcpu,
>>               return -ENOENT;
>>       }
>> -    if (features & ~system_supported_vcpu_features())
>> +    if (features & ~system_supported_vcpu_features(vcpu))
>>           return -EINVAL;
>>
> 
> The following check at the beginning of kvm_vcpu_init_check_features() 
> is redundant to
> the check here. We can drop that in this patch or a preparatory patch.
> 
> static int kvm_vcpu_init_check_features(...)
> {
>         /*
>          * This check can be dropped since the same check has been done
>      * by the followup "if (features & 
> ~system_supported_vcpu_features(vcpu))"
>          */
>         if (features & ~KVM_VCPU_VALID_FEATURES)
>                  return -ENOENT;

We could, but the errno is different with -ENOENT vs -EINVAL, with a
relevant meaning. So I would leave that alone.

Cheers
Suzuki

