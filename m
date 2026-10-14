Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA473CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH1ufsQ5g3r1H3aslg+X8qJ0wMgxmZRuam6ChKawEQw=; b=OFMF+EJsJRpgQOtd0eJ4shabb7
	TsF5Ojf2aiJ5B67uMvWnB6xyHNUhkzfBmwhG1h1kAplX+y8Mi655OTG6M5HfhNI1TBaYVfTsyokZ4
	yZBrWtlCkmVM6a6IT8gm3eI++eaHqGYRq1foTYhIIOmAnZZAHqKm1HEJJky61SH/knv0TrPIxqh5p
	SyXwGraGrBZAQIZsK/gZCqGZR59S63jkWeeLaNvJqvQbJJPYSLlbvxk9tFkoxnzC4/0nyZEykyVwI
	1FxtG12mmAJplL1491w0J73kKKsBAhQ8+zmEuNhdGcJyMWm56cu21UpEIuDaWfOIt0rS/vypk9Buj
	jpBVj7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwgb-0000000FG7M-1vIX;
	Wed, 14 Oct 2026 10:58:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwgY-0000000FG6q-1sZL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791975493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jH1ufsQ5g3r1H3aslg+X8qJ0wMgxmZRuam6ChKawEQw=;
	b=Ft5vQYAsmmGrRvVXqCt1HYeHZ/Ss5dxr+fW7NY2k/4aJRERtUVy/lcCqrKuHmbsHW1mIvF
	lwm0g58dzj8uO5BdKbbyl88Cy96OXK2D0xq5nPhbHx1TXTSahG42t6QArrLKLHX60mPBvZ
	NUjCa1cCI43Ezz/SggMR+G19hiElMBU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-vw7zp3ACPe6QXM08qHU4Wg-1; Wed, 14 Oct 2026 10:58:12 +0000
X-MC-Unique: vw7zp3ACPe6QXM08qHU4Wg-1
X-Mimecast-MFC-AGG-ID: vw7zp3ACPe6QXM08qHU4Wg_1791975491
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so252221a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 03:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975491; x=1792580291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jH1ufsQ5g3r1H3aslg+X8qJ0wMgxmZRuam6ChKawEQw=;
        b=psG8Bqi1k97gVqYxuVjdRXL8CVDJuuNADDCUxsCjfS0cNiXG9DNLhoJ/uh8p7hJr/6
         yPF937yCx7z1UrictWVdcLU0/fn71+JpLX4CMw6+NUymgVfTwQRfP5L4+uLpGzQCon75
         +L/C3JqG6FddF4jJ91B1pSERuqrS73B6CWP1aRZIu7JAGTJ8KcW+2tiqKUDhA1/d+Pnm
         3JI50QCWuPDKDPc0Tm/wv0V0VdK+AqiiYWI3DDsmJMtdnzcuk788/gZ86hJZYdFIbIKd
         fiPz39yCkMurIDLCJTx7mYjPbbukRvl8HA+pPfnGMi7yhm3A+bRkxYdPtD3MxcZ+aT/g
         6hvA==
X-Forwarded-Encrypted: i=1; AKwUvBwPQ59CAocquIpbnq97iMmzJL91QdYyvt9JOm3pPYSY4EYofo0nWGqga1HhhEC6vBYTQc43oPnSbEpzE1tNOiJE@lists.infradead.org
X-Gm-Message-State: AFq9FYILmVrmcQg9ndYNiKY3P9uYcNYnTFdHg8QSWMYv4J/Hv+sVQs2Q
	xFqDC/ELcYlqEf41GbDAHrUWbVX2gNMPlO9+rXnASIZGfvfIa0OsJum83om3+/eMRPr8Rkzg5W9
	7YYMUtodXJB/KLpuAzG5quLHKca7UFOc4MLcA0ugyyJCJFW7qnNaVwQpVKP77KyrCO/nCCyMOmO
	7h
X-Gm-Gg: AYBFou0ZfWZAEceEO6i4mLlCgCV/0rfK7FR9NBlr4n1EqH9OosCjQciUb7xHclFtgfP
	lyLZ9gjdXreAGyU89Z/laEdcLBwFhPqFFBO6BBiR3aZ3fPp7PK8xuHKg82pmcSKdR6DQeoQPzTd
	rizbRlRkM4+dZHVVRIN5oPqiXyHQQlPoXF1xFR3HqO+/oVa4wPh7n3v/NyLUAdChWiLJfjwrQK6
	6HOuV9fOy5BxPj/HoU99XMi9gOJeXrNA/8KQFrL4Kdie8QvtZMU2uTMfuh+GK24p/Ia8iWg61kP
	2lfaH55lZs8wKRlG5DKwKmeS64weOCKR4gm3D3SeYK1dI2hzPMGMXu/zGz55CB6Ddo09q8i+4z2
	QF83VQ5s5/ACbK1/5RmudXmAYBMV7yoelhqUb3/L29g==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr8647761a91.61.1791975490685;
        Wed, 14 Oct 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr8647724a91.61.1791975490063;
        Wed, 14 Oct 2026 03:58:10 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f05083fsm4391258a91.1.2026.10.14.03.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:58:09 -0700 (PDT)
Message-ID: <0ceda99f-0352-474b-a30a-c5e79b817c2d@redhat.com>
Date: Wed, 14 Oct 2026 20:58:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
 <3fbd4739-a4eb-4428-95ae-ead22e7cf9f2@redhat.com>
 <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zBj0KqruUzkRlfJ-mGHys_S1l6R99LYERZz0Gez71IU_1791975491
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_035814_616896_5A0FA343 
X-CRM114-Status: GOOD (  26.42  )
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

On 10/14/26 7:19 PM, Suzuki K Poulose wrote:
> On 14/10/2026 08:26, Gavin Shan wrote:
>> On 10/13/26 7:58 PM, Suzuki K Poulose wrote:
>>> On 13/10/2026 04:53, Gavin Shan wrote:
>>>> Hi Suzuki,
>>>>
>>>> On 10/2/26 4:14 PM, Suzuki K Poulose wrote:
>>>>> From: Steven Price <steven.price@arm.com>
>>>>>
>>>>> Query the RMI version number and check if it is a compatible version.
>>>>> All RMM feature registers are read and exposed for future code to
>>>>> use. Also restrict the support to SMC conduit.
>>>>>
>>>>> We only support this for Little Endian kernels, the Big Endian kernel
>>>>> support is anyway marked BROKEN and is being removed.
>>>>>
>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>> Cc: Oliver Upton <oupton@kernel.org>
>>>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Tested-by: Gavin Shan <gshan@redhat.com>
>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> ---
>>>>>   MAINTAINERS                       |   2 +
>>>>>   arch/arm64/Kconfig                |   1 +
>>>>>   arch/arm64/kernel/cpufeature.c    |   1 +
>>>>>   arch/arm64/kvm/sys_regs.c         |   2 +
>>>>>   drivers/firmware/Kconfig          |   1 +
>>>>>   drivers/firmware/Makefile         |   1 +
>>>>>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>>>>>   drivers/firmware/arm_rmm/Makefile |   1 +
>>>>>   drivers/firmware/arm_rmm/rmi.c    | 112 ++++++++++++++++++++++++++ ++++
>>>>>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>>>>>   10 files changed, 194 insertions(+)
>>>>>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>>>>>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>>>>>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>>>>>   create mode 100644 include/linux/arm-rmi-cmds.h
>>>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>>>> new file mode 100644
>>>>> index 0000000000000..06f5392c982d2
>>>>> --- /dev/null
>>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>>>> @@ -0,0 +1,112 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Copyright (C) 2023-2026 ARM Ltd.
>>>>> + */
>>>>> +
>>>>> +#include <linux/arm-rmi-cmds.h>
>>>>> +#include <linux/cpufeature.h>
>>>>> +#include <linux/memblock.h>
>>>>> +#include <linux/slab.h>
>>>>> +
>>>>> +#include <asm/memory.h>
>>>>> +#include <asm/pgtable-hwdef.h>
>>>>> +
>>>>> +/* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
>>>>> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
>>>>> +
>>>>> +static int rmi_check_version(void)
>>>>> +{
>>>>> +    unsigned short version_major, version_minor;
>>>>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>>>>> +                             RMI_ABI_MINOR_VERSION);
>>>>> +    unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>>>>> +    struct arm_smccc_1_2_regs res = {
>>>>> +        SMC_RMI_VERSION, host_version,
>>>>> +    };
>>>>> +
>>>>> +    /* If RME isn't supported, then RMI can't be */
>>>>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>>>>> +        return -ENXIO;
>>>>> +
>>>>> +    if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
>>>>> +        return -ENXIO;
>>>>
>>>> I think we need to ensure SMCCC version is v1.2 or a newer one here? arm_smccc_1_2_smc()
>>>> is immediately called by rmi_smccc_invoke() after this check.
>>>>
>>>>      if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
>>>>              arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
>>>
>>> We could. But I am wondering if that adds any value ? If the RMM
>>> exists and responds to the RMI_ABI_VERSION, it must be so on a
>>> platform with v1.2 or greater ? The extra check doesn't hurt.
>>>
>>
>> It's required as documented in section "B1.1 overview" of RMM-spec-v2.0- bet3.
>> In the same section, there are more requirements regarding the SMCCC version
>> when SVE/SME are supported. I don't see a practical problem if the check is
>> missed since the combination of TF-A and TF-RMM are the only RMM-spec- v2.0-bet3
>> implementation (as I knew) where the SMCCC version has been set to v1.5 in the
>> 'master' branch.
> 
> Reading the RMM spec again, DFNMZ lists how one can detect if the RMM
> ABI is present. That specifies that the user checks for SMCCC
> version >= 1.1, which we do by using arm_smccc_1_1_get_conduit().
> 
> Then checking the R{M,S}I_VERSION call is sufficient. So, I think
> we are good here. Do you agree ?
> 

arm_smccc_1_1_get_conduit() ensures SMCCC version >= v1.1, but we need
SMCCC version >= v1.2. We will have problem if the firmware only supports
SMCCC v1.1 and R{M,S}I_VERSION is coincidentally supported. In this
rare (even impossible) case, it's not sufficient to check R{M,S}I_VERSION
as I understand.

As far as TF-A+TF-RMM is concerned, I agree there is no issue. However,
the extra check doesn't hurt and make the code following the spec a bit
more strictly? :-)

Thanks,
Gavin

> Suzuki
> 
>>
>> Thanks,
>> Gavin
>>
>>> Suzuki
>>>
>>>>          return -ENXIO;
>>>>
>>>> Thanks,
>>>> Gavin
>>>>
>>>>> +
>>>>> +    rmi_smccc_invoke(&res);
>>>>> +    if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>>>>> +        return -ENXIO;
>>>>> +
>>>>> +    version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>>>>> +    version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>>>>> +
>>>>> +    if (res.a0 != RMI_SUCCESS) {
>>>>> +        unsigned short high_version_major, high_version_minor;
>>>>> +
>>>>> +        high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
>>>>> +        high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
>>>>> +
>>>>> +        pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d. %d\n",
>>>>> +               version_major, version_minor,
>>>>> +               high_version_major, high_version_minor,
>>>>> +               RMI_ABI_MAJOR_VERSION,
>>>>> +               RMI_ABI_MINOR_VERSION);
>>>>> +        return -ENXIO;
>>>>> +    }
>>>>> +
>>>>> +    pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>
>>>> [...]
>>>>
>>>>
>>>>
>>>
>>
> 


