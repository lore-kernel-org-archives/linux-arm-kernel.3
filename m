Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B870CC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxzZOYuvnhjv2qgPRME7Sydkr3EgYtmqlEQDhEKHbXc=; b=tn1XpsmZJ06fzp93VlMyH+s5D/
	xg7SueRJlLa7r1/lAhmxAKQMpF1uc1r14x5h384kUztNlNe8Ps8bxIvoiiGrLnxZL3RuQ61P/h/P8
	d9giqUARc/FGlNOZ5hHFfbDHDzWrKF7fbKCCS8JLP5JsypGnjaSUTHd5b+5gtzBN1iL6XbWi2bffU
	g1ch/1U9UBAWAuDE/farixqWpzYyFZNeczxtea5523GxxebbpFpOCZKtb7bW48u6xXwqrApX1D4Fr
	CqHFCttriSUQCgjaa6/Ti1xmaLRTTrWp+rH1hCHT824DHfEya8eFntByOU1RT7w9eVe/NuOt68EDb
	a/aoyDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHN-0000000CUsl-40Dc;
	Tue, 13 Oct 2026 09:58:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHI-0000000CUli-05ZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5801169C;
	Tue, 13 Oct 2026 02:58:30 -0700 (PDT)
Received: from [10.0.128.125] (Suzukis-MBP.cambridge.arm.com [10.0.128.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 587BB3F7B4;
	Tue, 13 Oct 2026 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791885514; bh=YXnRSTWAU7IyxFtbn+qxY3qd2/8gPBY2gi/t/qkHSRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gyrI4p+h+rg7F7KzN+FY9x9PiD8fijVdOLYuXXJRTseA4OxfHLYYokao4JrlWWDYc
	 b7TYUZxc1LcIIzSY473gSneYG1BQKVdJSIpkJWp2/mAll6ueBdVaaSiIzgjq0dfLc6
	 n/vn/bnmlNaqC9t2P2EbLNHqMRTHnuTppuDBHw80=
Message-ID: <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
Date: Tue, 13 Oct 2026 10:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
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
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
 <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025836_160156_456C1F93 
X-CRM114-Status: GOOD (  22.31  )
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

On 13/10/2026 04:53, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 10/2/26 4:14 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> Query the RMI version number and check if it is a compatible version.
>> All RMM feature registers are read and exposed for future code to
>> use. Also restrict the support to SMC conduit.
>>
>> We only support this for Little Endian kernels, the Big Endian kernel
>> support is anyway marked BROKEN and is being removed.
>>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oupton@kernel.org>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
> 
> [...]
> 
>> ---
>>   MAINTAINERS                       |   2 +
>>   arch/arm64/Kconfig                |   1 +
>>   arch/arm64/kernel/cpufeature.c    |   1 +
>>   arch/arm64/kvm/sys_regs.c         |   2 +
>>   drivers/firmware/Kconfig          |   1 +
>>   drivers/firmware/Makefile         |   1 +
>>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>>   drivers/firmware/arm_rmm/Makefile |   1 +
>>   drivers/firmware/arm_rmm/rmi.c    | 112 ++++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>>   10 files changed, 194 insertions(+)
>>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>>   create mode 100644 include/linux/arm-rmi-cmds.h
>>
> 
> [...]
> 
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>> arm_rmm/rmi.c
>> new file mode 100644
>> index 0000000000000..06f5392c982d2
>> --- /dev/null
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -0,0 +1,112 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-2026 ARM Ltd.
>> + */
>> +
>> +#include <linux/arm-rmi-cmds.h>
>> +#include <linux/cpufeature.h>
>> +#include <linux/memblock.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/memory.h>
>> +#include <asm/pgtable-hwdef.h>
>> +
>> +/* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
>> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
>> +
>> +static int rmi_check_version(void)
>> +{
>> +    unsigned short version_major, version_minor;
>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>> +                             RMI_ABI_MINOR_VERSION);
>> +    unsigned long aa64pfr0 = 
>> read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>> +    struct arm_smccc_1_2_regs res = {
>> +        SMC_RMI_VERSION, host_version,
>> +    };
>> +
>> +    /* If RME isn't supported, then RMI can't be */
>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0, 
>> ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>> +        return -ENXIO;
>> +
>> +    if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
>> +        return -ENXIO;
> 
> I think we need to ensure SMCCC version is v1.2 or a newer one here? 
> arm_smccc_1_2_smc()
> is immediately called by rmi_smccc_invoke() after this check.
> 
>      if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
>              arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)

We could. But I am wondering if that adds any value ? If the RMM
exists and responds to the RMI_ABI_VERSION, it must be so on a
platform with v1.2 or greater ? The extra check doesn't hurt.

Suzuki

>          return -ENXIO;
> 
> Thanks,
> Gavin
> 
>> +
>> +    rmi_smccc_invoke(&res);
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
> 
> [...]
> 
> 
> 


