Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE01C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BLjbeqOOztjLEC04HHfFwpw9Eul+9hcjdpsMo9ZuQc=; b=HwkvHG2IrZ1HRs7HBviNY52l0/
	y+DcJQtysPsjfLVImEiIB+MKTG+FI+HCWjBJodL/12Y2JggAp/smZpCdV/wybwgLKanzHRJUs2kN9
	oYSmExTGPkrIrq2VZjzaJRGZxPqAMf+M5/RKXVGYPc1DhO2F1fHf18tdsZTJzaiN+wlTLxYHkkDUS
	CTNUE8PCe2iheEZkcAOHWErNUFUsXt5zgiQKxGh6ut9PO5tsK3fXMd4JjGbmE/TBjjp2DzAnY8CUS
	khWY/MM/g5Mc+sWuEc4l8/E0nI18t5IE7gUDL1TsP2HWdtdmttMeGRpIpapINVQPZO2ArRw1JkW9v
	nViNbHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2tE-00000000IzH-0mFo;
	Mon, 03 Mar 2025 10:19:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2re-00000000IgX-0IBt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:17:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA02113E;
	Mon,  3 Mar 2025 02:17:47 -0800 (PST)
Received: from [10.1.26.155] (XHFQ2J9959.cambridge.arm.com [10.1.26.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 110033F66E;
	Mon,  3 Mar 2025 02:17:29 -0800 (PST)
Message-ID: <43732270-8fd0-4a18-abec-096e383a6a4d@arm.com>
Date: Mon, 3 Mar 2025 10:17:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org,
 joro@8bytes.org, jean-philippe@linaro.org, mark.rutland@arm.com,
 joey.gouly@arm.com, oliver.upton@linux.dev, james.morse@arm.com,
 broonie@kernel.org, maz@kernel.org, david@redhat.com,
 akpm@linux-foundation.org, jgg@ziepe.ca, nicolinc@nvidia.com,
 mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <b46dc626-edc9-4d20-99d2-6cd08a01346c@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <b46dc626-edc9-4d20-99d2-6cd08a01346c@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_021734_196972_360C787F 
X-CRM114-Status: GOOD (  24.43  )
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

On 01/03/2025 01:32, Yang Shi wrote:
> 
> 
> 
> On 2/28/25 10:24 AM, Mikołaj Lenczewski wrote:
>> For supporting BBM Level 2 for userspace mappings, we want to ensure
>> that the smmu also supports its own version of BBM Level 2. Luckily, the
>> smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
>> 0487K.a D8.16.2), so already guarantees that no aborts are raised when
>> BBM level 2 is claimed.
>>
>> Add the feature and testing for it under arm_smmu_sva_supported().
>>
>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>> ---
>>   arch/arm64/kernel/cpufeature.c                  | 7 +++----
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 3 +++
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 4 ++++
>>   4 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 63f6d356dc77..1022c63f81b2 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2223,8 +2223,6 @@ static bool has_bbml2_noabort(const struct
>> arm64_cpu_capabilities *caps, int sco
>>               if (!cpu_has_bbml2_noabort(__cpu_read_midr(cpu)))
>>                   return false;
>>           }
>> -
>> -        return true;
>>       } else if (scope & SCOPE_LOCAL_CPU) {
>>           /* We are a hot-plugged CPU, so only need to check our MIDR.
>>            * If we have the correct MIDR, but the kernel booted on an
>> @@ -2232,10 +2230,11 @@ static bool has_bbml2_noabort(const struct
>> arm64_cpu_capabilities *caps, int sco
>>            * we have an incorrect MIDR, but the kernel booted on a
>>            * sufficient CPU, we will not bring up this CPU.
>>            */
>> -        return cpu_has_bbml2_noabort(read_cpuid_id());
>> +        if (!cpu_has_bbml2_noabort(read_cpuid_id()))
>> +            return false;
>>       }
>>   -    return false;
>> +    return has_cpuid_feature(caps, scope);
> 
> Do we really need this? IIRC, it means the MIDR has to be in the allow list
> *AND* MMFR2 register has to be set too. AmpereOne doesn't have MMFR2 register set.

Miko, I think this should have been squashed into patch #1? It doesn't belong in
this patch.

Yang, we discussed this internally and decided that we thought it was best to
still require BBML2 being advertised in the feature register. That way if trying
to use KVM to emulate a CPU that is in the allow list but doesn't really support
BBML2, we won't try to use it.

But we still end up with the same problem if running on a physical CPU that
supports BBML2 with conflict aborts, but emulating a CPU in the allow list. So
given AmpereOne doesn't advertise BBML2 but does support it, I'd be happy to
remove this check.

Thanks,
Ryan


> 
> Thanks,
> Yang
> 
>>   }
>>     #ifdef CONFIG_ARM64_PAN
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/
>> arm/arm-smmu-v3/arm-smmu-v3-sva.c
>> index 9ba596430e7c..6ba182572788 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
>> @@ -222,6 +222,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>>           feat_mask |= ARM_SMMU_FEAT_VAX;
>>       }
>>   +    if (system_supports_bbml2_noabort())
>> +        feat_mask |= ARM_SMMU_FEAT_BBML2;
>> +
>>       if ((smmu->features & feat_mask) != feat_mask)
>>           return false;
>>   diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/
>> arm/arm-smmu-v3/arm-smmu-v3.c
>> index 358072b4e293..dcee0bdec924 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -4406,6 +4406,9 @@ static int arm_smmu_device_hw_probe(struct
>> arm_smmu_device *smmu)
>>       if (FIELD_GET(IDR3_RIL, reg))
>>           smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
>>   +    if (FIELD_GET(IDR3_BBML, reg) == IDR3_BBML2)
>> +        smmu->features |= ARM_SMMU_FEAT_BBML2;
>> +
>>       /* IDR5 */
>>       reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
>>   diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/
>> arm/arm-smmu-v3/arm-smmu-v3.h
>> index bd9d7c85576a..85eaf3ab88c2 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> @@ -60,6 +60,9 @@ struct arm_smmu_device;
>>   #define ARM_SMMU_IDR3            0xc
>>   #define IDR3_FWB            (1 << 8)
>>   #define IDR3_RIL            (1 << 10)
>> +#define IDR3_BBML            GENMASK(12, 11)
>> +#define IDR3_BBML1            (1 << 11)
>> +#define IDR3_BBML2            (2 << 11)
>>     #define ARM_SMMU_IDR5            0x14
>>   #define IDR5_STALL_MAX            GENMASK(31, 16)
>> @@ -754,6 +757,7 @@ struct arm_smmu_device {
>>   #define ARM_SMMU_FEAT_HA        (1 << 21)
>>   #define ARM_SMMU_FEAT_HD        (1 << 22)
>>   #define ARM_SMMU_FEAT_S2FWB        (1 << 23)
>> +#define ARM_SMMU_FEAT_BBML2        (1 << 24)
>>       u32                features;
>>     #define ARM_SMMU_OPT_SKIP_PREFETCH    (1 << 0)
> 


