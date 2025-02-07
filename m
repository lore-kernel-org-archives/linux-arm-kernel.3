Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2036BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxcMc+Jnd6liI/vVt2TNxV/WalgtHG3QV00utKpzyUs=; b=ip7hKugw7WhK8u/Jsur4YKz/tc
	fBKJ5T9p6XE5MldpD2CSU/Z6r0+4SvFV1YstXGbTc4r1S38Q70K/43IOQjk2y4IugKKsfOyfv27cf
	Z6DOUwEJgzx//DleR0uJLkwgAX8eohr+s1xXaD2XSDnNGRckNvV1c9DixBgXfPHQ1NlpfyNlDJqwo
	jlDlF+gsv6RmCYFA1/iCqBktl4KP5pmacH/5mFDto3Ajvvq3ePFx9uF7BV7IXCHTKYSwUKa+YAg6j
	Q21UKbMp9IssaL2E6yv71LoNHR6rRC5QMQ0/jEsuzosKP/gVWvd8sp3maH9yEXxfzsQagrEK7lwUh
	BszLI22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSGn-0000000AVrc-0Mgg;
	Fri, 07 Feb 2025 17:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRnD-0000000APh5-1rhQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:05:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4515113E;
	Fri,  7 Feb 2025 09:05:49 -0800 (PST)
Received: from [10.1.26.24] (e122027.cambridge.arm.com [10.1.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DFEE3F63F;
	Fri,  7 Feb 2025 09:05:21 -0800 (PST)
Message-ID: <2987f990-6535-4df0-896f-7cb0eec79aca@arm.com>
Date: Fri, 7 Feb 2025 17:05:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/43] arm64: rme: Allow checking SVE on VM instance
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-29-steven.price@arm.com>
 <4cd1b360-6902-4800-93a2-905cfd8ca7f8@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <4cd1b360-6902-4800-93a2-905cfd8ca7f8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090527_573622_214CD54B 
X-CRM114-Status: GOOD (  20.66  )
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

On 02/02/2025 06:00, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Given we have different types of VMs supported, check the
>> support for SVE for the given instance of the VM to accurately
>> report the status.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_rme.h | 2 ++
>>   arch/arm64/kvm/arm.c             | 5 ++++-
>>   arch/arm64/kvm/rme.c             | 5 +++++
>>   3 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>> asm/kvm_rme.h
>> index 90a4537ad38d..0d89ab1645c1 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>>   u32 kvm_realm_ipa_limit(void);
>>   u32 kvm_realm_vgic_nr_lr(void);
>>   +bool kvm_rme_supports_sve(void);
>> +
>>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>>   int kvm_init_realm_vm(struct kvm *kvm);
>>   void kvm_destroy_realm(struct kvm *kvm);
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 134acb4ee26f..6f7f96ab781d 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -456,7 +456,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>           r = get_kvm_ipa_limit();
>>           break;
>>       case KVM_CAP_ARM_SVE:
>> -        r = system_supports_sve();
>> +        if (kvm_is_realm(kvm))
>> +            r = kvm_rme_supports_sve();
>> +        else
>> +            r = system_supports_sve();
>>           break;
> 
> kvm_vm_ioctl_check_extension() can be called by
> ioctl(KVM_CHECK_EXTENSION) on the
> file descriptor of '/dev/kvm'. kvm is NULL and kvm_is_realm() returns
> false in
> this case.
> 
> kvm_dev_ioctl
>   kvm_vm_ioctl_check_extension_generic  // kvm is NULL
>     kvm_vm_ioctl_check_extension

See my reply in patch 25

>>       case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>>       case KVM_CAP_ARM_PTRAUTH_GENERIC:
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index 5831d379760a..27a479feb907 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -20,6 +20,11 @@ static bool rme_supports(unsigned long feature)
>>       return !!u64_get_bits(rmm_feat_reg0, feature);
>>   }
>>   +bool kvm_rme_supports_sve(void)
>> +{
>> +    return rme_supports(RMI_FEATURE_REGISTER_0_SVE_EN);
>> +}
>> +
> 
> If rme_supports() becomes a public helper, it can be directly used. In
> turn,
> kvm_rme_supports_sve() can be dropped. RMI_FEATURE_REGISTER_0_SVE_EN is
> obvious
> to indicate the corresponding feature.

I agree this seem reasonable. Sadly the use of u64_get_bits() is
assuming that the 'feature' parameter is constant at runtime. I could
rework it to not require a constant, but considering this is the only
function which is exposing rme_supports() without any further checks I
feel it's better to leave the code as it is.

Obviously if we get more feature bits like this in the future then it
would be worth revisiting.

Thanks,
Steve

>>   static int rmi_check_version(void)
>>   {
>>       struct arm_smccc_res res;
> 
> Thanks,
> Gavin
> 


