Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9885ACD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=737+bTyPUxy3FqtkTBL6O1II27HlHFy3o5QKhyi4tuM=; b=49LQoKVBFZZS3UiW1sR09qyQmt
	bnl0ogD435BmzTKmREBmtjGTBZUz/vbXGcZO3JAh8XEthcofB6zSqTU4gBnGl331PHphlrlner2Kz
	/QvTLEoJNrkiv0ppAyLHm/BFHdR+2FbLV/Na/ov59wgUJ+OpNiWXB95xTllfijVHamCvCpjsiIj2Y
	OG//4Ug+BmNzOPg0OoLAfRtxiPOzl+O3c6fWFCKq5mdyFJURtecgUbM3R+QtcKiKeRgKabi3Qj4mk
	Bxhm5lmn6O6I9VK4S9QwpHUhc79cQnea9SQSt8tD370fO6frbxxPJRl9By5CInhS30pzc6ET7DeWW
	aFwrybbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjHp-0000000Eqng-189J;
	Wed, 03 Jun 2026 10:57:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjHm-0000000EqnA-0kQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:57:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B2032E4;
	Wed,  3 Jun 2026 03:57:14 -0700 (PDT)
Received: from [10.57.26.22] (unknown [10.57.26.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6CEB3F632;
	Wed,  3 Jun 2026 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484239; bh=SAgpyeJ2aeueZn4wrvVe1OZsJjrJkzgdYaZDrIyIPiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tqUpSENxeG0SKPwM2auSsdNR2MnbvVMsbBf17PLfnomuvP4sTFKKqtAj/CEsvGOgJ
	 RfzZMYa11Jh1JViWeQcUAS6TO/OdzQuGZzkwU020GsIj0LDzT+2r8LI/OERjrwrLXK
	 ySyuIUrwj2dYafSreRlXmz2QaMx+cMthgy/asKsY=
Message-ID: <f0eddd9f-dbaa-48e9-888d-2e3514395c91@arm.com>
Date: Wed, 3 Jun 2026 11:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/44] arm64: RMI: Check for RMI support at init
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
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-7-steven.price@arm.com>
 <ee494ecd-8979-40f2-896e-82137abbf440@redhat.com>
 <78425c0d-86c5-457f-b171-a4c8dd3acb7d@arm.com>
 <3a0f6277-2b68-45db-a07f-16a177b0586d@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3a0f6277-2b68-45db-a07f-16a177b0586d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_035722_310959_2C0A9027 
X-CRM114-Status: GOOD (  28.49  )
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

On 25/05/2026 07:58, Gavin Shan wrote:
> Hi Steve,
> 
> On 5/22/26 1:49 AM, Steven Price wrote:
>> On 21/05/2026 01:39, Gavin Shan wrote:
>>> On 5/13/26 11:17 PM, Steven Price wrote:
>>>> Query the RMI version number and check if it is a compatible version.
>>>> The first two feature registers are read and exposed for future code to
>>>> use.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>> v14:
>>>>    * This moves the basic RMI setup into the 'kernel' directory.
>>>> This is
>>>>      because RMI will be used for some features outside of KVM so
>>>> should
>>>>      be available even if KVM isn't compiled in.
>>>> ---
>>>>    arch/arm64/include/asm/rmi_cmds.h |  3 ++
>>>>    arch/arm64/kernel/Makefile        |  2 +-
>>>>    arch/arm64/kernel/cpufeature.c    |  1 +
>>>>    arch/arm64/kernel/rmi.c           | 65 ++++++++++++++++++++++++++
>>>> +++++
>>>>    4 files changed, 70 insertions(+), 1 deletion(-)
>>>>    create mode 100644 arch/arm64/kernel/rmi.c
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>>>> new file mode 100644
>>>> index 000000000000..99c1ccc35c11
>>>> --- /dev/null
>>>> +++ b/arch/arm64/kernel/rmi.c
>>>> @@ -0,0 +1,65 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2023-2025 ARM Ltd.
>>>> + */
>>>> +
>>>> +#include <linux/memblock.h>
>>>> +
>>>> +#include <asm/rmi_cmds.h>
>>>> +
>>>> +unsigned long rmm_feat_reg0;
>>>> +unsigned long rmm_feat_reg1;
>>>> +
>>>> +static int rmi_check_version(void)
>>>> +{
>>>> +    struct arm_smccc_res res;
>>>> +    unsigned short version_major, version_minor;
>>>> +    unsigned long host_version =
>>>> RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>>>> +                             RMI_ABI_MINOR_VERSION);
>>>> +    unsigned long aa64pfr0 =
>>>> read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>>>> +
>>>> +    /* If RME isn't supported, then RMI can't be */
>>>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0,
>>>> ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>>>> +        return -ENXIO;
>>>> +
>>>> +    arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
>>>> +
>>>> +    if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>>>> +        return -ENXIO;
>>>> +
>>>> +    version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>>>> +    version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>>>> +
>>>> +    if (res.a0 != RMI_SUCCESS) {
>>>> +        unsigned short high_version_major, high_version_minor;
>>>> +
>>>> +        high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
>>>> +        high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
>>>> +
>>>> +        pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.
>>>> %d\n",
>>>> +               version_major, version_minor,
>>>> +               high_version_major, high_version_minor,
>>>> +               RMI_ABI_MAJOR_VERSION,
>>>> +               RMI_ABI_MINOR_VERSION);
>>>> +        return -ENXIO;
>>>> +    }
>>>> +
>>>> +    pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int __init arm64_init_rmi(void)
>>>> +{
>>>> +    /* Continue without realm support if we can't agree on a
>>>> version */
>>>> +    if (rmi_check_version())
>>>> +        return 0;
>>>
>>> Is this still a valid point that we have to return zero on errors
>>> returned
>>> from rmi_check_version() or other other function calls like
>>> rmi_features()?
>>> arm64_init_rmi() is triggered by subsys_initcall() where the return
>>> value
>>> needs to indicate success or failure. It's fine to return error code
>>> from
>>> arm64_init_rmi() in the path.
>>
>> Hmm, I guess now this is moved to arm64 code this indeed doesn't need
>> to. Within a module I believe an error return can fail the module
>> loading.
>>
>> I'm not sure it really makes much difference though - if this
>> initialisation fails then it's not really an error - it just means the
>> feature is unavailable.
>>
> 
> I think the return value would be consistent to the value of
> 'arm64_rmi_is_available'.
> 'arm64_rmi_is_available' is true when zero is returned, otherwise,
> 'arm64_rmi_is_available'
> is false.
> 
> With the consistency between the return value and
> 'arm64_rmi_is_available', users are
> able to know the value of 'arm64_rmi_is_available' through kernel
> parameter 'initcall_debug'.
> With the kernel parameter, the initcalls including arm64_init_rmi() are
> traced and its
> return value is outputted in the traced messages, seeing
> do_trace_initcall_start().

Fair enough, and actually refactoring this function to pass error codes
up the call stack I think does improve the look.

Thanks,
Steve

>> Thanks,
>> Steve
>>
>>>> +
>>>> +    if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
>>>> +        return 0;
>>>> +    if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
>>>> +        return 0;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +subsys_initcall(arm64_init_rmi);
>>>
> 
> Thanks,
> Gavin
> 


