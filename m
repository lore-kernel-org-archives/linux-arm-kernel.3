Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2157EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQCguWOYdie54lMmy9bCkDzX1Bs/vM+LYeo0KsbjY98=; b=bOERGenl8VovpyqabbSOqAbRBG
	GN0FR2ax40Z837/f4WSxmCh4EFZhhjpyGapUznQq8cLrJb+5ob8LjYmW/o0iFtbslT8fWEH77Ardj
	F/Vvz/BOSIUoGYwycX/Kmq65IU4065uV9GZqU3BQGftGPhLR+QYm7iuyc9Kx4wwLX5gvVny4CqW6+
	WG58+3/du28U++I9WLidTp0KGTuFkz0x3elzqYUj/8E4yLVa7RB4ywcWbL7PcdAaKhmaP0M7wuFW5
	SHtQag4+luLzTh+CpkdJj3VXXp/CWTvMrXdgNVUMxwT2wmQ3vT7HHHVSJBNsR1ZUoOuARCRWeLUbn
	JRkOOtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98fp-00000006f9i-3jD0;
	Tue, 22 Sep 2026 22:09:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98fn-00000006f9K-3Zjt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:09:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DE341576;
	Tue, 22 Sep 2026 15:09:06 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE433F632;
	Tue, 22 Sep 2026 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790114949; bh=LoWG5Bdx9GW8hSCm8uq7ODcJS1ns/SRbwzKLn1YrZL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SsIhXisAf8rJQwkEuQla6eDAwF3JKj+IVfN91G++RC+GjBElLTeFHlVNOORX4+IaQ
	 gUH+UO+jZWXv8J7/TlXnwZyYxok30jsLVHKBcZSTbVsCSivOffQA9N+Vvwi7Hb87CO
	 jc+8i+IHz0NnpUxPLTjPes5CyWvFi8tJu3HyfvKE=
Message-ID: <6cbfcb9c-209e-42a1-8ed3-de6d418de8e2@arm.com>
Date: Tue, 22 Sep 2026 23:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 06/20] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
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
 <20260920212845.707-7-suzuki.poulose@arm.com>
 <20260922125722.00006b2e@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922125722.00006b2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_150911_958181_36973AA8 
X-CRM114-Status: GOOD (  14.17  )
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

On 22/09/2026 20:57, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 22:28:31 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> To keep the VCPU load/put handling cleaner with the different kinds of VM
>> types, we are about to introduce VM specific callbacks to do just the right
>> thing. In preparation for that, make some refactoring to add the change
>> easier.
>>
>> No functional changes intended. Based on a work by Marc Zyngier.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Trivial stuff inline + maybe one blob that should be in previous patch?
> 

...

>> +
>> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
>> +{
>> +	if (kvm_vcpu_should_clear_twe(vcpu))
>> +		vcpu->arch.hcr_el2 &= ~HCR_TWE;
>> +	else
>> +		vcpu->arch.hcr_el2 |= HCR_TWE;
>> +
>> +	if (kvm_vcpu_should_clear_twi(vcpu))
>> +		vcpu->arch.hcr_el2 &= ~HCR_TWI;
>> +	else
>> +		vcpu->arch.hcr_el2 |= HCR_TWI;
> 
> You could use FIELD_MODIFY() for these but maybe not worth it.
> 

...

>> @@ -772,7 +782,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>>   		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>>   
>>   		/* __pkvm_vcpu_put implies a sync of the state */
>> -		if (!kvm_vm_is_protected(vcpu->kvm))
>> +		if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>>   			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> 
> Why in this patch?

I have moved it to the patch where we introduce the VM flavors, thanks!

Suzuki

> 
>>   	}
>>   
> 


