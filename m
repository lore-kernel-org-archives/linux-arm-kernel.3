Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30BDF459EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9WNDvMICXK5r3z4kz0db1dXq1bqPV0SKRjFk3xryt8=; b=dqhhXhyEiNi0Tm/N1Cg5JimY0s
	0pnN4sYPjpUUJgLdVzI7Fo3UccJuK+h3HnzPs7RHkyYnvX/R+1A1z/lJIiT4eztL0odXSQXgdR6cJ
	tyDbeVRr0z7ZCmSoAYo3dP0OjgBTz7FtQBmAro241zzilk5kSOusJEjGx9qJprZVZpx+1/+GhsmKw
	lGYm6qPIsCUfc+lmtMtPYWLpNdE55cBJPbalphvAEfbQvaO107KgmW1k/CbNs4zKtsexJOuY7oYzr
	J7zyQniNemT2qL2rIDwxyXMH+MICp7pa1KXodjuiKqLOqd2SdycRmqqPh8sJ3MBpmeUK8EfUHj2xT
	B5DKf91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDWz-0000000CQSV-0jpw;
	Fri, 10 Apr 2026 15:12:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDWw-0000000CQRT-3770
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:12:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 362FD3543;
	Fri, 10 Apr 2026 08:12:15 -0700 (PDT)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF6133FAA1;
	Fri, 10 Apr 2026 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775833940; bh=Z3/vCYjcdpqPdGORHJhUiFd/20/A6QH4krFtsE3EYz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gTVVmSPSK8xsHhPN98jfG1N/gYPdZDSUhNH07m9nQWei/I+xKMJF8lQiV1AgubR7n
	 LvonLCsQ/nSrDlsw2B86r0pNNMLlBy36J63eESa7GLSbcDTaak4OTsi+pRa2YJ1XmC
	 G/Gy8PgjLP3Cd6yIj9pXwCgeEs0nvz6/piCJi0Tc=
Message-ID: <6f7c7d29-19ef-4d6e-8627-834b77202490@arm.com>
Date: Fri, 10 Apr 2026 16:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 32/48] arm64: Don't expose stolen time for realm
 guests
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
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-33-steven.price@arm.com>
 <4a2ab5b0-dec6-4ee2-8790-f27c2501f653@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <4a2ab5b0-dec6-4ee2-8790-f27c2501f653@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_081222_911398_0BF6098A 
X-CRM114-Status: GOOD (  20.23  )
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

On 30/03/2026 11:52, Suzuki K Poulose wrote:
> On 18/03/2026 15:53, Steven Price wrote:
>> It doesn't make much sense as a realm guest wouldn't want to trust the
>> host. It will also need some extra work to ensure that KVM will only
>> attempt to write into a shared memory region. So for now just disable
>> it.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v7:
>>   * Update the documentation to add a note about stolen time being
>>     unavailable in a realm.
>> ---
>>   Documentation/virt/kvm/api.rst | 3 +++
>>   arch/arm64/kvm/arm.c           | 5 ++++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/
>> api.rst
>> index bc180c853faf..70911fe6d435 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -9240,6 +9240,9 @@ is supported, than the other should as well and
>> vice versa.  For arm64
>>   see Documentation/virt/kvm/devices/vcpu.rst "KVM_ARM_VCPU_PVTIME_CTRL".
>>   For x86 see Documentation/virt/kvm/x86/msr.rst "MSR_KVM_STEAL_TIME".
>>   +Note that steal time accounting is not available when a guest is
>> running
>> +within a Arm CCA realm (machine type KVM_VM_TYPE_ARM_REALM).
>> +
>>   8.25 KVM_CAP_S390_DIAG318
>>   -------------------------
>>   diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 61182eb0cf70..7d92ddb06460 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -469,7 +469,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>           r = system_supports_mte();
>>           break;
>>       case KVM_CAP_STEAL_TIME:
>> -        r = kvm_arm_pvtime_supported();
>> +        if (kvm_is_realm(kvm))
>> +            r = 0;
>> +        else
>> +            r = kvm_arm_pvtime_supported();
> 
> Could this be handled in kvm_realm_ext_allowed() ?

Indeed it is already handled there. I'm not sure how I missed that, but
this patch is completely unnecessary now. Stolen time was an extension
that I knew about (having added it in the first place) and needed
disabling because it's implemented with the assumption that the host can
write into the guest.

In theory with some extra work it could be supported in a realm guest,
but it requires some extra plumbing to ensure the structures end up in
shared memory. My intention is that this can be revisited once the basic
CCA support is in.

Thanks,
Steve

> Suzuki
> 
> 
>>           break;
>>       case KVM_CAP_ARM_EL1_32BIT:
>>           r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
> 


