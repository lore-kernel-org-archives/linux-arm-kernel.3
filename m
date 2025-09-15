Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CF8CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdO9LJegh4PYcoCe443jROaD9U++pX0UhwlioZcKDco=; b=BulstldamsPbxtFLG0LM0W2i+p
	ttjpHkmyU4a5sauU+L9Opeu2HcgKdJZvVDmDSRaOa8C3h8ycAkCVxIF8Rm3ABsc1rjjIP/Y22gEnj
	gn43VOmL7RtdA76bCLexfgeXdrF25DxRvNcxo7V9BwxgmQOBhwYNz7aeOixIXl5YOvpqKzh0xF8k9
	2tl2w56s/VV+3HLKti3a88CkBvnAthKdoIbj1QvQF+kNSqunvCcrTELd+ZaTtwiVSf6qKEQpcyr4T
	0edpYM8dWGZ+9DKHhZYVnnP8x8b1zI/v/d06bm621/BrYWkopSA9zVD36IFX7vxu4bRBipoDCW9da
	NV6FKi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ry-00000003np0-2VdG;
	Mon, 15 Sep 2025 10:55:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6rw-00000003noD-2qhP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:55:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC62D1424;
	Mon, 15 Sep 2025 03:55:27 -0700 (PDT)
Received: from [10.57.5.5] (unknown [10.57.5.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB5823F694;
	Mon, 15 Sep 2025 03:55:30 -0700 (PDT)
Message-ID: <28a237e2-5902-4445-a05a-4d1877863ece@arm.com>
Date: Mon, 15 Sep 2025 11:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/43] arm64: RME: Check for RME support at KVM init
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
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-6-steven.price@arm.com>
 <0481109b-769f-464b-aa72-ad6e07bdfa78@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <0481109b-769f-464b-aa72-ad6e07bdfa78@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_035536_803119_06B1C8DD 
X-CRM114-Status: GOOD (  28.61  )
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

On 03/09/2025 12:15, Gavin Shan wrote:
> On 8/21/25 12:55 AM, Steven Price wrote:
>> Query the RMI version number and check if it is a compatible version. A
>> static key is also provided to signal that a supported RMM is available.
>>
>> Functions are provided to query if a VM or VCPU is a realm (or rec)
>> which currently will always return false.
>>
>> Later patches make use of struct realm and the states as the ioctls
>> interfaces are added to support realm and REC creation and destruction.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v8:
>>   * No need to guard kvm_init_rme() behind 'in_hyp_mode'.
>> Changes since v6:
>>   * Improved message for an unsupported RMI ABI version.
>> Changes since v5:
>>   * Reword "unsupported" message from "host supports" to "we want" to
>>     clarify that 'we' are the 'host'.
>> Changes since v2:
>>   * Drop return value from kvm_init_rme(), it was always 0.
>>   * Rely on the RMM return value to identify whether the RSI ABI is
>>     compatible.
>> ---
>>   arch/arm64/include/asm/kvm_emulate.h | 18 +++++++++
>>   arch/arm64/include/asm/kvm_host.h    |  4 ++
>>   arch/arm64/include/asm/kvm_rme.h     | 56 ++++++++++++++++++++++++++++
>>   arch/arm64/include/asm/virt.h        |  1 +
>>   arch/arm64/kvm/Makefile              |  2 +-
>>   arch/arm64/kvm/arm.c                 |  5 +++
>>   arch/arm64/kvm/rme.c                 | 56 ++++++++++++++++++++++++++++
>>   7 files changed, 141 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/include/asm/kvm_rme.h
>>   create mode 100644 arch/arm64/kvm/rme.c
>>
> 
> [...]
> 
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 888f7c7abf54..76177c56f1ef 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -40,6 +40,7 @@
>>   #include <asm/kvm_nested.h>
>>   #include <asm/kvm_pkvm.h>
>>   #include <asm/kvm_ptrauth.h>
>> +#include <asm/kvm_rme.h>
>>   #include <asm/sections.h>
>>   
> 
> Nit: The header file <asm/kvm_rme.h> has been included to <asm/
> kvm_host.h> and
> <linux/kvm_host.h>, which has been included to arm.c. So this explicit
> inclusion
> can be dropped.

While it's true that it could be dropped because of the indirect
include, generally it's better to explicitly include a header file when
you are using the definitions from it. That way the code can be
refactored (e.g. if asm/kvm_host.h is changed to no longer needs the
header it can then safely drop the header include).

We have a similar situation with asm/kvm_asm.h being included both here
and in asm/kvm_host.h (and probably many others, this was just the first
I spotted).

>>   #include <kvm/arm_hypercalls.h>
>> @@ -59,6 +60,8 @@ enum kvm_wfx_trap_policy {
>>   static enum kvm_wfx_trap_policy kvm_wfi_trap_policy __read_mostly =
>> KVM_WFX_NOTRAP_SINGLE_TASK;
>>   static enum kvm_wfx_trap_policy kvm_wfe_trap_policy __read_mostly =
>> KVM_WFX_NOTRAP_SINGLE_TASK;
>>   +DEFINE_STATIC_KEY_FALSE(kvm_rme_is_available);
>> +
>>   DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
>>     DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
>> @@ -2836,6 +2839,8 @@ static __init int kvm_arm_init(void)
>>         in_hyp_mode = is_kernel_in_hyp_mode();
>>   +    kvm_init_rme();
>> +
>>       if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
>>           cpus_have_final_cap(ARM64_WORKAROUND_1508412))
>>           kvm_info("Guests without required CPU erratum workarounds
>> can deadlock system!\n" \
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> new file mode 100644
>> index 000000000000..67cf2d94cb2d
>> --- /dev/null
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -0,0 +1,56 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 ARM Ltd.
>> + */
>> +
>> +#include <linux/kvm_host.h>
>> +
>> +#include <asm/rmi_cmds.h>
>> +#include <asm/virt.h>
>> +
>> +static int rmi_check_version(void)
>> +{
>> +    struct arm_smccc_res res;
>> +    unsigned short version_major, version_minor;
>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>> +                             RMI_ABI_MINOR_VERSION);
>> +
>> +    arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
>> +
>> +    if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>> +        return -ENXIO;
>> +
>> +    version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>> +    version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>> +
>> +    if (res.a0 != RMI_SUCCESS) {
>> +        unsigned short high_version_major, high_version_minor;
>> +
>> +        high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
>> +        high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
>> +
>> +        kvm_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.
>> %d\n",
>> +            version_major, version_minor,
>> +            high_version_major, high_version_minor,
>> +            RMI_ABI_MAJOR_VERSION,
>> +            RMI_ABI_MINOR_VERSION);
>> +        return -ENXIO;
>> +    }
>> +
>> +    kvm_info("RMI ABI version %d.%d\n", version_major, version_minor);
>> +
>> +    return 0;
>> +}
>> +
>> +void kvm_init_rme(void)
>> +{
>> +    if (PAGE_SIZE != SZ_4K)
>> +        /* Only 4k page size on the host is supported */
>> +        return;
> 
> Nit: The comment can be moved before the check, something like below.
> Otherwise,
> {} is needed here.
> 
>     /* Only 4kB page size is supported */
>     if (PAGE_SIZE != SZ_4K)
>         return;
> 
>> +
>> +    if (rmi_check_version())
>> +        /* Continue without realm support */
>> +        return;
> 
> Nit: same as above.

Fair enough, I'm never sure what's best here - the comments are for the
error path "Continue without realm support [if we can't agree on a
version]", but it's a single statement so braces aren't needed. Still
the first instance can easily be hoisted above without losing its
meaning, and the second can be extended to clarify.

Thanks,
Steve

>> +
>> +    /* Future patch will enable static branch kvm_rme_is_available */
>> +}
> 
> Thanks,
> Gavin
> 


