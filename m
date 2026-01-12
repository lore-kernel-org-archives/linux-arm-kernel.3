Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF477C9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Tjp9sBZWVaLMM3uGvjoGeY/ghdT9FKIa6UGowvMmL8=; b=pHibgTN5QesBWdXIQEkXfsPwzI
	1oMqdXy0sg4DUEMnDSgJifUdhY5CKQ55qcZsHw63TrHFMbGFTkzRX/ljGr4pbYDOn6YiCQLoeZssm
	y8QVYU+QMoXPFy0Qs9oqqMSx4H4ArtUPswGZE0LairQajZxvD70fwm/ZldTSmGNNRGGCedhLjbvWl
	NIYA7Xw67UXEdb0WBOp5pnA6qmVcchT0jFQUluM90WRA7PbU+iRWSZOQ3v3p9U1GAXv4MZ1I4/C+D
	0qsHZLQ50djqhtZ2yko7VqxCSqvyHN2I64byLlv4lzz71uMS8F7+My5MGXGio5AsXCGL4anRc6Gpz
	oL0Q/R9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRN-00000005HIc-2aBG;
	Mon, 12 Jan 2026 11:50:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRJ-00000005HHm-1K40
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:50:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso27089315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 03:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768218627; x=1768823427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Tjp9sBZWVaLMM3uGvjoGeY/ghdT9FKIa6UGowvMmL8=;
        b=RQdMzF8pbb4NrS0NHre+vScDfPaI7fveXiib7wstnwT23G+ArhS/9FL/unRXB015Rv
         Vdr3B71b9AKfbYZzYN6KAqvoWJ4amQaGl+RKi7z8ZbZsNk1fswUCJuWGWqdgd+tTozBs
         yOroam4J5vS5jugaK5NMtd73DycBHCEv7u+2IW/Qila1mlOeZuhqMQUYq+DTnJIoHUXB
         D4QnG8MxKWb6ipJqgkJ44vWySrGxGOOBamURbJykiBiqqjN5+vjjzcgSzwSJ8bfZlx5O
         FJbjvz0iXsfa+qznae4GgyJq2I5IU2acNXupdnDlTuNdeDUK1XmshwBlDCYSWt8n/BV6
         4SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218627; x=1768823427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Tjp9sBZWVaLMM3uGvjoGeY/ghdT9FKIa6UGowvMmL8=;
        b=njnkAfYgWOUp7JOIi7Mta7R+tSBLisQ+GzjzOmi6vXxQsvpEKUCKicXCP+pRundcN1
         lVr86tCeZgLznIGqU8OpAR7an/gcEXkRfFS6VGWKzFU9jzvBHmZMEvjJK1o3/8tykI9R
         Cszi34VUl9mFDF6drPL6QhQA6pnYFUr1GzpyCO1TCzw+WnJO7SxsYBFG8XDI4s15upKn
         girZsqYFM2WG9c+URw24+x5JKkCZXrcbxpgG1obCWaxE1m229vH7mXy3IW7wKP8bvAoM
         kAKfGAYM+3aB/iEg8qjn3aHFlxQ7TaQ7Fvyuh1vxeCb7EUz293UvwQFXAstJFkwr/sLd
         yPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPw+IvZwheHZcuL0sv2+yg/vIaYYAs2hqRx5ShXM7dp6NZRmfV9kOs6rRoPtGujw9V7W3ZXHGL7dsdaRNymM9K@lists.infradead.org
X-Gm-Message-State: AOJu0YzVEHHL328+A51PD2tQzkPk8a2cDAm2YIOsFXdXODGFFh9TAf0n
	SzEoB2Jid8qa5iEU5wefs5tS19CWXmQXjc7Fuoi/e0dWzUAr++dS7O8EvwWN74jiI0Q=
X-Gm-Gg: AY/fxX6sGlenvAXkRJRCJs2cQ75LoJ+ePRHbsO+fM34eL47cDzdDoZmtYC9zo8sDBDQ
	4tQ+t5eyBARdEw6js0vfsUnvuYSIBdwlxp9TziEEJzYSJxGyZhTrFu+fbYh82IhI5P6Y0RA4rp5
	TH794My41iTppIlAZ/2/0+riZGvjwzlXr86yNy14KMMnk+izS91Q14EOKKD9R//e/PbrmJkpmFn
	p8pkAfrfWnlbWvi+FwNajmQ63/YDSdClKzKtT7PpmrxGg88gRcYzrB+5TIdSVrSbRCmWqKsHSnw
	CIdXbC0NuLvYnsW5gp5mSg7rbLLzCHd+mV9rtnntSDsX9Y2BcG5FEztT82/tSU40NBUCFWtmy3a
	bTkOt/I53HsSG00bTPhU2G1xzdM+sx+B4R6FvaGcAzpgZ7maS4AcsDQ2dT1JxA3+YFDOitHi7hw
	Kqv/QqZsGd+ILti+gN
X-Google-Smtp-Source: AGHT+IHbv++2MAUG1bKkt3pDYtncFi4hY4WF4z5fFFWy5tSWwu/8MzcvTbmE8Xs34ajg+Ai+SfTuUA==
X-Received: by 2002:a05:600c:4685:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d848787d4mr204271175e9.16.1768218626648;
        Mon, 12 Jan 2026 03:50:26 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41f5e0sm344061315e9.8.2026.01.12.03.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:50:26 -0800 (PST)
Message-ID: <3cf80979-e826-4200-8dad-6ac4738f6463@linaro.org>
Date: Mon, 12 Jan 2026 11:50:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 14/35] KVM: arm64: Add SPE VCPU device attribute to
 set the max buffer size
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-15-alexandru.elisei@arm.com>
 <c6e1f67c-6c71-4785-a1b9-3be2acee2a3a@linaro.org> <aWTaw_T6jak7Etj1@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWTaw_T6jak7Etj1@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035029_524034_F7E98333 
X-CRM114-Status: GOOD (  61.05  )
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



On 12/01/2026 11:28 am, Alexandru Elisei wrote:
> Hi James,
> 
> On Fri, Jan 09, 2026 at 04:29:43PM +0000, James Clark wrote:
>>
>>
>> On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
>>> During profiling, the buffer programmed by the guest must be kept mapped at
>>> stage 2 by KVM, making this memory pinned from the host's perspective.
>>>
>>> To make sure that a guest doesn't consume too much memory, add a new SPE
>>> VCPU device attribute, KVM_ARM_VCPU_MAX_BUFFER_SIZE, which is used by
>>> userspace to limit the amount of memory a VCPU can pin when programming
>>> the profiling buffer. This value will be advertised to the guest in the
>>> PMBIDR_EL1.MaxBuffSize field.
>>>
>>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>> ---
>>>    Documentation/virt/kvm/devices/vcpu.rst |  49 ++++++++++
>>>    arch/arm64/include/asm/kvm_spe.h        |   6 ++
>>>    arch/arm64/include/uapi/asm/kvm.h       |   5 +-
>>>    arch/arm64/kvm/arm.c                    |   2 +
>>>    arch/arm64/kvm/spe.c                    | 116 ++++++++++++++++++++++++
>>>    5 files changed, 176 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
>>> index e305377fadad..bb1bbd2ff6e2 100644
>>> --- a/Documentation/virt/kvm/devices/vcpu.rst
>>> +++ b/Documentation/virt/kvm/devices/vcpu.rst
>>> @@ -347,3 +347,52 @@ attempting to set a different one will result in an error.
>>>    Similar to KVM_ARM_VCPU_PMU_V3_CTRL(KVM_ARM_VCPU_PMU_SET_PMU), userspace is
>>>    responsible for making sure that the VCPU is run only on physical CPUs which
>>>    have the specified SPU.
>>> +
>>> +5.3 ATTRIBUTE: KVM_ARM_VCPU_MAX_BUFFER_SIZE
>>> +------------------------------------------
>>> +
>>> +:Parameters: in kvm_device_attr.addr the address to an u64 representing the
>>> +             maximum buffer size, in bytes.
>>> +
>>> +:Returns:
>>> +
>>> +	 =======  =========================================================
>>> +	 -EBUSY   Virtual machine has already run
>>> +	 -EDOM    Buffer size cannot be represented by hardware
>>> +	 -EFAULT  Error accessing the max buffer size identifier
>>> +	 -EINVAL  A different maximum buffer size already set or the size is
>>> +                  not aligned to the host's page size
>>> +	 -ENXIO   SPE not supported or not properly configured
>>> +	 -ENODEV  KVM_ARM_VCPU_HAS_SPE VCPU feature or SPU instance not set
>>
>> Hi Alex,
>>
>> I can't reproduce this anymore, but I got this a few times. Or at least I
>> think it was this, I've pasted the output from kvmtool below and it doesn't
>> say exactly what the issue was.
> 
> I'll try to reproduce it.
> 
> Do you remember what were the HEAD commits for the host and kvmtool?
> 

I was testing on N1SDP with the SPE driver changes as well so it has a 
load of junk, although I don't think any could have caused this 
intermittent issue. I wouldn't put too much effort into it though 
because it could have been a stale build or something:

  https://gitlab.com/Linaro/kwg/james-c-linux/-/tree/james-testing-kvm-spe-v6

kvmtool is just 8890373d5e62 from your kvm-spe-v6 branch


>>
>> If I tried again with a different buffer size it worked, then going back to
>> 256M didn't work, then it went away. I might have done something wrong so if
>> you didn't see this either then we can probably ignore it for now.
>>
>>   -> sudo lkvm run --kernel /boot/vmlinux-6.18.0-rc2+ -p "earlycon
>>      kpti=off" -c 4 -m 2000 --pmu --spe --spe-max-buffer-size=256M
>>
>>    Info: # lkvm run -k /boot/vmlinux-6.18.0-rc2+ -m 2000 -c 4 --name
>>    guest-616
>>    KVM_SET_DEVICE_ATTR: No such device or address
>>
>>
>>> +	 -ERANGE  Buffer size larger than maximum supported by the SPU
>>> +                  instance.
>>> +	 =======  ==========================================================
>>> +
>>> +Required.
>>> +
>>> +Limit the size of the profiling buffer for the VCPU to the specified value. The
>>> +value will be used by all VCPUs. Can be set for more than one VCPUs, as long as
>>> +the value stays the same.
>>> +
>>> +Requires that a SPU has been already assigned to the VM. The maximum buffer size
>>
>> Very minor nit, but would "Initialised with SPE" be better? Because it's
>> done through KVM_ARM_VCPU_INIT rather than "ASSIGN_SPU". I think it might
>> make it easier to understand how you are supposed to use it.
>>
>> SPU is never expanded either and I think users probably wouldn't be familiar
>> with what that is. A lot of times we could just say "has SPE" and it would
>> be clearer. I don't think separating the concepts of SPE and SPU gives us
>> anything in this high level of a doc other than potentially confusing users.
> 
> Sure.
> 
>>
>>> +must be less than or equal to the maximum buffer size of the assigned SPU instance,
>>
>> I don't understand this part. Do you mean "of the assigned physical SPU
>> instance"? The ARM states "no limit" is the only valid value here:
> 
> Yes, physical instance.
> 
>>
>>    Reads as 0x0000
>>    The only permitted value is 0x0000, indicating there is no limit to
>>    the maximum buffer size.
>>
>> It would be good to expand on where the limit you are talking about comes
>> from.
> 
> The hardware value might change in the future. Or the host might be running
> under nested virtualization, which makes having a different value likely.  Like
> you said above, I don't think it's necessary to get into this much detail here -
> the idea I was trying to convey is that userspace cannot set the maximum buffer
> size to a value larger than what the physical SPU instance supports.
> 

Ok makes sense, thanks.

>>
>>> +unless there is no limit on the maximum buffer size for the SPU. In this case
>>> +the VCPU maximum buffer size can have any value, including 0, as long as it can
>>> +be encoded by hardware. For details on how the hardware encodes this value,
>>> +please consult Arm DDI0601 for the field PMBIDR_EL1.MaxBuffSize.
>>> +
>>> +The value 0 is special and it means that there is no upper limit on the size of
>>> +the buffer that the guest can use. Can only be set if the SPU instance used by
>>> +the VM has a similarly unlimited buffer size.
>>
>> This is a comment about changes in kvmtool, but it's semi related so I'll
>> leave it here. But you say only half of the buffer is used at a time:
>>
>>    In a guest, perf, when the user is root, uses the default value of 4MB
>>    for the total size of the profiling memory.  This is split in two by
>>    the SPE driver, and at any given time only one half (2MB) is
>>    programmed for the SPE buffer.
>>
>>    However, KVM also has to pin the stage 1 translation tables that
>>    translate the buffer, so if the default were 2MB, KVM would definitely
>>    exceed this value. Make the default 4MB to avoid potential errors when
>>    the limit is exceeded.
>>
>> But isn't that just for snapshot mode? In normal mode the half way point is
>> set to perf_output_handle->wakeup which comes from the watermark set by
>> userspace? If you set it to the end then in theory the whole buffer could be
>> used?
> 
> Sure, I'll change the comment to say that 4MiB was chosen because that was the
> default in perf, and not go into more details.
> 
> Thanks,
> Alex
> 

I don't know if kvmtool is going to get used in production, or if anyone 
is going to copy this default value though? If that might happen then 
maybe a bigger value is better in case there is some tool or script that 
has a different watermark setting and it doesn't work.

I think we can assume that if someone is enabling SPE then they're not 
memory constrained and we don't need to worry about saving a few MB.

>>
>>> +
>>> +When a guest enables SPE on the VCPU, KVM will pin the host memory backing the
>>> +buffer to avoid the statistical profiling unit experiencing stage 2 faults when
>>> +it writes to memory. This includes the host pages backing the guest's stage 1
>>> +translation tables that are used to translate the buffer. As a result, it is
>>> +expected that the size of the memory that will be pinned for each VCPU will be
>>> +slightly larger that the maximum buffer set with this ioctl.
>>> +
>>> +This memory that is pinned will count towards the process RLIMIT_MEMLOCK. To
>>> +avoid the limit being exceeded, userspace must increase the RLIMIT_MEMLOCK limit
>>> +prior to running the VCPU, otherwise KVM_RUN will return to userspace with an
>>> +error.
>>> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
>>> index a4e9f03e3751..e48f7a7f67bb 100644
>>> --- a/arch/arm64/include/asm/kvm_spe.h
>>> +++ b/arch/arm64/include/asm/kvm_spe.h
>>> @@ -12,6 +12,7 @@
>>>    struct kvm_spe {
>>>    	struct arm_spe_pmu *arm_spu;
>>> +	u64 max_buffer_size;	/* Maximum per VCPU buffer size */
>>>    };
>>>    struct kvm_vcpu_spe {
>>> @@ -28,6 +29,8 @@ static __always_inline bool kvm_supports_spe(void)
>>>    #define vcpu_has_spe(vcpu)					\
>>>    	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
>>> +void kvm_spe_init_vm(struct kvm *kvm);
>>> +
>>>    int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>>    int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>>    int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>>> @@ -41,6 +44,9 @@ struct kvm_vcpu_spe {
>>>    #define kvm_supports_spe()	false
>>>    #define vcpu_has_spe(vcpu)	false
>>> +static inline void kvm_spe_init_vm(struct kvm *kvm)
>>> +{
>>> +}
>>>    static inline int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>>    {
>>>    	return -ENXIO;
>>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
>>> index 760c3e074d3d..9db652392781 100644
>>> --- a/arch/arm64/include/uapi/asm/kvm.h
>>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>>> @@ -445,8 +445,9 @@ enum {
>>>    #define KVM_ARM_VCPU_PVTIME_CTRL	2
>>>    #define   KVM_ARM_VCPU_PVTIME_IPA	0
>>>    #define KVM_ARM_VCPU_SPE_CTRL		3
>>> -#define   KVM_ARM_VCPU_SPE_IRQ		0
>>> -#define   KVM_ARM_VCPU_SPE_SPU		1
>>> +#define   KVM_ARM_VCPU_SPE_IRQ			0
>>> +#define   KVM_ARM_VCPU_SPE_SPU			1
>>> +#define   KVM_ARM_VCPU_SPE_MAX_BUFFER_SIZE	2
>>>    /* KVM_IRQ_LINE irq field index values */
>>>    #define KVM_ARM_IRQ_VCPU2_SHIFT		28
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index d7f802035970..9afdf66be8b2 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -194,6 +194,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>>>    	kvm_timer_init_vm(kvm);
>>> +	kvm_spe_init_vm(kvm);
>>> +
>>>    	/* The maximum number of VCPUs is limited by the host's GIC model */
>>>    	kvm->max_vcpus = kvm_arm_default_max_vcpus();
>>> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
>>> index c581838029ae..3478da2a1f7c 100644
>>> --- a/arch/arm64/kvm/spe.c
>>> +++ b/arch/arm64/kvm/spe.c
>>> @@ -3,6 +3,7 @@
>>>     * Copyright (C) 2021 - ARM Ltd
>>>     */
>>> +#include <linux/bitops.h>
>>>    #include <linux/cpumask.h>
>>>    #include <linux/kvm_host.h>
>>>    #include <linux/perf/arm_spe_pmu.h>
>>> @@ -41,6 +42,99 @@ void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
>>>    		static_branch_enable(&kvm_spe_available);
>>>    }
>>> +/*
>>> + * The maximum buffer size can be zero (no restrictions on the buffer size), so
>>> + * this value cannot be used as the uninitialized value. The maximum buffer size
>>> + * must be page aligned, so arbitrarily choose the value '1' for an
>>> + * uninitialized maximum buffer size.
>>> + */
>>> +#define KVM_SPE_MAX_BUFFER_SIZE_UNSET		1
>>> +
>>> +void kvm_spe_init_vm(struct kvm *kvm)
>>> +{
>>> +	kvm->arch.kvm_spe.max_buffer_size = KVM_SPE_MAX_BUFFER_SIZE_UNSET;
>>> +}
>>> +
>>> +static u64 max_buffer_size_to_pmbidr_el1(u64 size)
>>> +{
>>> +	u64 msb_idx, num_bits;
>>> +	u64 maxbuffsize;
>>> +	u64 m, e;
>>> +
>>> +	/*
>>> +	 * size = m:zeros(12); m is 9 bits.
>>> +	 */
>>> +	if (size <= GENMASK_ULL(20, 12)) {
>>> +		m = size >> 12;
>>> +		e = 0;
>>> +		goto out;
>>> +	}
>>> +
>>> +	/*
>>> +	 * size = 1:m:zeros(e+11)
>>> +	 */
>>> +
>>> +	num_bits = fls64(size);
>>> +	msb_idx = num_bits - 1;
>>> +
>>> +	/* MSB is not encoded. */
>>> +	m = size & ~BIT(msb_idx);
>>> +	/* m is 9 bits. */
>>> +	m >>= msb_idx - 9;
>>> +	/* MSB is not encoded, m is 9 bits wide and 11 bits are zero. */
>>> +	e = num_bits - 1 - 9 - 11;
>>> +
>>> +out:
>>> +	maxbuffsize = FIELD_PREP(GENMASK_ULL(8, 0), m) | \
>>> +		      FIELD_PREP(GENMASK_ULL(13, 9), e);
>>> +	return FIELD_PREP(PMBIDR_EL1_MaxBuffSize, maxbuffsize);
>>> +}
>>> +
>>> +static u64 pmbidr_el1_to_max_buffer_size(u64 pmbidr_el1)
>>> +{
>>> +	u64 maxbuffsize;
>>> +	u64 e, m;
>>> +
>>> +	maxbuffsize = FIELD_GET(PMBIDR_EL1_MaxBuffSize, pmbidr_el1);
>>> +	e = FIELD_GET(GENMASK_ULL(13, 9), maxbuffsize);
>>> +	m = FIELD_GET(GENMASK_ULL(8, 0), maxbuffsize);
>>> +
>>> +	if (!e)
>>> +		return m << 12;
>>> +	return (1ULL << (9 + e + 11)) | (m << (e + 11));
>>> +}
>>> +
>>> +static int kvm_spe_set_max_buffer_size(struct kvm_vcpu *vcpu, u64 size)
>>> +{
>>> +	struct kvm *kvm = vcpu->kvm;
>>> +	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
>>> +	u64 decoded_size, spu_size;
>>> +
>>> +	if (kvm_vm_has_ran_once(kvm))
>>> +		return -EBUSY;
>>> +
>>> +	if (!PAGE_ALIGNED(size))
>>> +		return -EINVAL;
>>> +
>>> +	if (!kvm_spe->arm_spu)
>>> +		return -ENODEV;
>>> +
>>> +	if (kvm_spe->max_buffer_size != KVM_SPE_MAX_BUFFER_SIZE_UNSET)
>>> +		return size == kvm_spe->max_buffer_size ? 0 : -EINVAL;
>>> +
>>> +	decoded_size = pmbidr_el1_to_max_buffer_size(max_buffer_size_to_pmbidr_el1(size));
>>> +	if (decoded_size != size)
>>> +		return -EDOM;
>>> +
>>> +	spu_size = pmbidr_el1_to_max_buffer_size(kvm_spe->arm_spu->pmbidr_el1);
>>> +	if (spu_size != 0 && (size == 0 || size > spu_size))
>>> +		return -ERANGE;
>>> +
>>> +	kvm_spe->max_buffer_size = size;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static int kvm_spe_set_spu(struct kvm_vcpu *vcpu, int spu_id)
>>>    {
>>>    	struct kvm *kvm = vcpu->kvm;
>>> @@ -136,6 +230,15 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>>    		return kvm_spe_set_spu(vcpu, spu_id);
>>>    	}
>>> +	case KVM_ARM_VCPU_SPE_MAX_BUFFER_SIZE: {
>>> +		u64 __user *uaddr = (u64 __user *)(long)attr->addr;
>>> +		u64 size;
>>> +
>>> +		if (get_user(size, uaddr))
>>> +			return -EFAULT;
>>> +
>>> +		return kvm_spe_set_max_buffer_size(vcpu, size);
>>> +	}
>>>    	}
>>>    	return -ENXIO;
>>> @@ -181,6 +284,18 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>>    		return 0;
>>>    	}
>>> +	case KVM_ARM_VCPU_SPE_MAX_BUFFER_SIZE: {
>>> +		u64 __user *uaddr = (u64 __user *)(long)attr->addr;
>>> +		u64 size = kvm_spe->max_buffer_size;
>>> +
>>> +		if (size == KVM_SPE_MAX_BUFFER_SIZE_UNSET)
>>> +			return -EINVAL;
>>> +
>>> +		if (put_user(size, uaddr))
>>> +			return -EFAULT;
>>> +
>>> +		return 0;
>>> +	}
>>>    	}
>>>    	return -ENXIO;
>>> @@ -194,6 +309,7 @@ int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>>    	switch(attr->attr) {
>>>    	case KVM_ARM_VCPU_SPE_IRQ:
>>>    	case KVM_ARM_VCPU_SPE_SPU:
>>> +	case KVM_ARM_VCPU_SPE_MAX_BUFFER_SIZE:
>>>    		return 0;
>>>    	}
>>


