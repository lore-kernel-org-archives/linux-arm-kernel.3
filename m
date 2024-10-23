Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2157BCDDE67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsvgktsPgji9/S9HyxPa7YZYvNmYBuuKFzK2F7e7Qd4=; b=aNbYcODXqbVQXGvreYEXiaz971
	kmDTUeUELcNNCk9810s4inkvmm4jsaCtoqbfmsJ2vMKC149UHjShyD8ICMYejv8q7vvuqyvHDwiFY
	yOCoSwCkKWZ4CAUsBeTDcNGzluzDB/4pmFGYUwuxdnMEyHt9jU5XtkLUUiJLdh3K4BoCBKQtC0IVl
	udieD0bes2Y+OpsPjW+IrS8iGE99atLXV+b2+4nQiBM8+ba1FivZz5uZN4rtdtqSeJKeaq1krKNtG
	lUaGAdlHHYjWPEk06XxqKIUX4QKKd6S20PHea6g/Jm4ztCFctn+CbgJz+ZaNcJklkh39enyuVlKUX
	w86chk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Z1m-0000000E3p6-1JVG;
	Wed, 23 Oct 2024 10:55:46 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YdI-0000000Dztj-31Tm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:30:31 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XYQHQ2DwHz1T8x5;
	Wed, 23 Oct 2024 18:28:18 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id EAC7D18010F;
	Wed, 23 Oct 2024 18:30:19 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 23 Oct 2024 18:30:19 +0800
CC: <yangyicong@hisilicon.com>, <maz@kernel.org>, <mark.rutland@arm.com>,
	<broonie@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 3/5] arm64: Add support for FEAT_HAFT
To: Catalin Marinas <catalin.marinas@arm.com>, <will@kernel.org>
References: <20241022092734.59984-1-yangyicong@huawei.com>
 <20241022092734.59984-4-yangyicong@huawei.com> <ZxfvVO75Mob_FWF7@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3ad59e2d-957d-e704-4a4c-ee0af2bd8dd4@huawei.com>
Date: Wed, 23 Oct 2024 18:30:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ZxfvVO75Mob_FWF7@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_033029_907585_A98CDBC6 
X-CRM114-Status: GOOD (  32.43  )
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

On 2024/10/23 2:30, Catalin Marinas wrote:
> On Tue, Oct 22, 2024 at 05:27:32PM +0800, Yicong Yang wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 3e29b44d2d7b..029d7ad89de5 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2176,6 +2176,21 @@ config ARCH_PKEY_BITS
>>  	int
>>  	default 3
>>  
>> +config ARM64_HAFT
>> +	bool "Support for Hardware managed Access Flag for Table Descriptor"
> 
> Super nit: s/Descriptor/Descriptors/
> 

sure.

>> +	depends on ARM64_HW_AFDBM
>> +	default y
>> +	help
>> +	  The ARMv8.9/ARMv9.5 introduces the feature Hardware managed Access
>> +	  Flag for Table descriptors. When enabled an architectural executed
>> +	  memory access will update the Access Flag in each Table descriptor
>> +	  which is accessed during the translation table walk and for which
>> +	  the Access Flag is 0. The Access Flag of the Table descriptor use
>> +	  the same bit of PTE_AF.
>> +
>> +	  The feature will only be enabled if all the CPUs in the system
>> +	  support this feature. If unsure, say Y.
>> +
>>  endmenu # "ARMv8.9 architectural features"
>>  
>>  config ARM64_SVE
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index 3d261cc123c1..fba2347c0aa6 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -879,6 +879,30 @@ static inline bool cpu_has_hw_af(void)
>>  						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
>>  }
>>  
>> +/*
>> + * Contrary to the page/block access flag, the table access flag
>> + * cannot be emulated in software (no access fault will occur).
>> + * So users should use this feature only if it's supported system
>> + * wide.
>> + */
>> +static inline bool system_support_haft(void)
>> +{
>> +	unsigned int hafdbs;
>> +	u64 mmfr1;
>> +
>> +	if (!IS_ENABLED(CONFIG_ARM64_HAFT))
>> +		return false;
>> +
>> +	/*
>> +	 * Check the sanitised registers to see this feature is supported
>> +	 * on all the CPUs.
>> +	 */
>> +	mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
>> +	hafdbs = cpuid_feature_extract_unsigned_field(mmfr1,
>> +						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
>> +	return hafdbs >= ID_AA64MMFR1_EL1_HAFDBS_HAFT;
>> +}
> 
> Can we not have just an entry in the arm64_features array with the type
> ARM64_CPUCAP_SYSTEM_FEATURE and avoid the explicit checks here?
> 

reply below...

>> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
>> index 8ff5f2a2579e..bc1051d65125 100644
>> --- a/arch/arm64/include/asm/pgalloc.h
>> +++ b/arch/arm64/include/asm/pgalloc.h
>> @@ -30,7 +30,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>>  {
>>  	pudval_t pudval = PUD_TYPE_TABLE;
>>  
>> -	pudval |= (mm == &init_mm) ? PUD_TABLE_UXN : PUD_TABLE_PXN;
>> +	pudval |= (mm == &init_mm) ? PUD_TABLE_AF | PUD_TABLE_UXN : PUD_TABLE_PXN;
>>  	__pud_populate(pudp, __pa(pmdp), pudval);
>>  }
> 
> Why not set the table AF for the task entries? I haven't checked the
> core code but normally when we map a pte it's mapped as young. While for
> table AF we wouldn't get a fault, I would have thought the core code
> follows the same logic.
> 

I may need to check. If I understand it correctly, for most case (e.g. a read fault) we should
make pte young if the hardware AF update is not supported. Otherwsie hardware will help to update.

>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 718728a85430..6eeaaa80f6fe 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2046,6 +2046,18 @@ static bool has_hw_dbm(const struct arm64_cpu_capabilities *cap,
>>  
>>  #endif
>>  
>> +#if CONFIG_ARM64_HAFT
>> +
>> +static struct cpumask haft_cpus;
>> +
>> +static void cpu_enable_haft(struct arm64_cpu_capabilities const *cap)
>> +{
>> +	if (has_cpuid_feature(cap, SCOPE_LOCAL_CPU))
>> +		cpumask_set_cpu(smp_processor_id(), &haft_cpus);
>> +}
>> +
>> +#endif /* CONFIG_ARM64_HAFT */
>> +
>>  #ifdef CONFIG_ARM64_AMU_EXTN
>>  
>>  /*
>> @@ -2590,6 +2602,17 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>>  		.cpus = &dbm_cpus,
>>  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, DBM)
>>  	},
>> +#endif
>> +#ifdef CONFIG_ARM64_HAFT
>> +	{
>> +		.desc = "Hardware managed Access Flag for Table Descriptor",
>> +		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> 
> I'd actually use ARM64_CPUCAP_SYSTEM_FEATURE here. We use something
> similar for HW DBM but there we get a fault and set the pte dirty. You
> combined it with a system_support_haft() that checks the sanitised regs
> but I'd rather have a static branch check via cpus_have_cap(). Even with
> your approach we can have a race with a late CPU hot-plugged that
> doesn't have the feature in the middle of some core code walking the
> page tables.
> 
> With a system feature type, late CPUs not having the feature won't be
> brought online (if feature enabled) but in general I don't have much
> sympathy for SoC vendors combining CPUs with incompatible features ;).
> 

ok. If we make it a system feature, we can using cpus_have_cap() then and
drop the system_support_haft() which is checking with the sanitised registers.
It's fine for me.

Will ask to not refuse online a CPU due to mismatch of this feature in [1],
hope we have an agreement :)

[1] https://lore.kernel.org/linux-arm-kernel/20240820161822.GC28750@willie-the-truck/

>> +		.capability = ARM64_HAFT,
>> +		.matches = has_cpuid_feature,
>> +		.cpu_enable = cpu_enable_haft,
>> +		.cpus = &haft_cpus,
>> +		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
>> +	},
> [...]
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index ccbae4525891..4a58b9b36eb6 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -495,9 +495,15 @@ alternative_else_nop_endif
>>  	 * via capabilities.
>>  	 */
>>  	mrs	x9, ID_AA64MMFR1_EL1
>> -	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
>> +	ubfx	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_SHIFT, #4
>>  	cbz	x9, 1f
>>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
>> +
>> +#ifdef CONFIG_ARM64_HAFT
>> +	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
>> +	b.lt	1f
>> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
>> +#endif /* CONFIG_ARM64_HAFT */
> 
> I think we can skip the ID check here and always set the HAFT bit. We do
> something similar with MTE (not for TCR_HA though, don't remember why).
> 

Thanks for the reference to MTE. Will see and have a test. But a check here
may seem more reasonable as we usually detect a feature first then enable it?

Thanks.


