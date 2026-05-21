Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0F8CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DkSM4AdV+H8uwN5nTs766MuYJZjikfQqQCWWJARhxk=; b=OuKVYsCfldAkR+fQHnQGIV5p63
	4zGkRSQ/6boN2q7hh6emtm5TqLZNWxTU/Umm2mifdP3UZneHIoHEuWrKMrCScXB9+LYz69fp4vr/t
	TXqGjW5QPdsoAE2fmUTutTUzGieVKjAGuTinLKlGjfkWebD1MSnVl2Q+cwOPrEHtS6sWtcWeULWx+
	gVHu9PZYEQQt2JJj4iu4EfnBFRCgqkkEuJYXZ1JhxaAqIByfseVlXJuNP3kjAcROZUjvHQroyxjB4
	XjyHOeRcx4/HqsFLHkzoAIMLa7RZCqB5Rs73iopmULPMgQyYBOpz9dILqH+tGwGyd/v/KaT1G7SV2
	0WAsVgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5ey-00000008OsN-1OpD;
	Thu, 21 May 2026 15:50:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5ev-00000008Orf-3Bl7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:50:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8129F1C25;
	Thu, 21 May 2026 08:49:58 -0700 (PDT)
Received: from [10.1.32.22] (e122027.cambridge.arm.com [10.1.32.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8AF03F632;
	Thu, 21 May 2026 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779378603; bh=mMghuHi21M3rXnjm/M0jpANdblyW2ZAdsbpFbgKLRXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vTa59URD+6XdILapZywItbSczRW9VRRCTd016APcjuY/07ZdrQgHihhQStO6DB2Rw
	 /aK6pONHDoWdWA9mM7r4FFOPwSpTjPPRniW7rVoko3lFJGYMMQDk6Jml1wvMGql3Py
	 KMsfk8ppzYIRmjyaauqu3vl0H8+W/ZWG+njYFoCs=
Message-ID: <78425c0d-86c5-457f-b171-a4c8dd3acb7d@arm.com>
Date: Thu, 21 May 2026 16:49:56 +0100
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
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ee494ecd-8979-40f2-896e-82137abbf440@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_085005_875562_3E879BA9 
X-CRM114-Status: GOOD (  26.22  )
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

On 21/05/2026 01:39, Gavin Shan wrote:
> Hi Steven,
> 
> On 5/13/26 11:17 PM, Steven Price wrote:
>> Query the RMI version number and check if it is a compatible version.
>> The first two feature registers are read and exposed for future code to
>> use.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> v14:
>>   * This moves the basic RMI setup into the 'kernel' directory. This is
>>     because RMI will be used for some features outside of KVM so should
>>     be available even if KVM isn't compiled in.
>> ---
>>   arch/arm64/include/asm/rmi_cmds.h |  3 ++
>>   arch/arm64/kernel/Makefile        |  2 +-
>>   arch/arm64/kernel/cpufeature.c    |  1 +
>>   arch/arm64/kernel/rmi.c           | 65 +++++++++++++++++++++++++++++++
>>   4 files changed, 70 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/kernel/rmi.c
>>
> 
> [...]
> 
>> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>> new file mode 100644
>> index 000000000000..99c1ccc35c11
>> --- /dev/null
>> +++ b/arch/arm64/kernel/rmi.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-2025 ARM Ltd.
>> + */
>> +
>> +#include <linux/memblock.h>
>> +
>> +#include <asm/rmi_cmds.h>
>> +
>> +unsigned long rmm_feat_reg0;
>> +unsigned long rmm_feat_reg1;
>> +
>> +static int rmi_check_version(void)
>> +{
>> +    struct arm_smccc_res res;
>> +    unsigned short version_major, version_minor;
>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>> +                             RMI_ABI_MINOR_VERSION);
>> +    unsigned long aa64pfr0 =
>> read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>> +
>> +    /* If RME isn't supported, then RMI can't be */
>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0,
>> ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>> +        return -ENXIO;
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
>> +        pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
>> +               version_major, version_minor,
>> +               high_version_major, high_version_minor,
>> +               RMI_ABI_MAJOR_VERSION,
>> +               RMI_ABI_MINOR_VERSION);
>> +        return -ENXIO;
>> +    }
>> +
>> +    pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init arm64_init_rmi(void)
>> +{
>> +    /* Continue without realm support if we can't agree on a version */
>> +    if (rmi_check_version())
>> +        return 0;
> 
> Is this still a valid point that we have to return zero on errors returned
> from rmi_check_version() or other other function calls like rmi_features()?
> arm64_init_rmi() is triggered by subsys_initcall() where the return value
> needs to indicate success or failure. It's fine to return error code from
> arm64_init_rmi() in the path.

Hmm, I guess now this is moved to arm64 code this indeed doesn't need
to. Within a module I believe an error return can fail the module loading.

I'm not sure it really makes much difference though - if this
initialisation fails then it's not really an error - it just means the
feature is unavailable.

Thanks,
Steve

>> +
>> +    if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
>> +        return 0;
>> +    if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
>> +        return 0;
>> +
>> +    return 0;
>> +}
>> +subsys_initcall(arm64_init_rmi);
> 
> Thanks,
> Gavin
> 


