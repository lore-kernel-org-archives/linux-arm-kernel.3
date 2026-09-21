Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCD1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dqV7bN1cw37AzpcE5ePyx0SvsBAmC5PCXR9Eu6DZ54=; b=z5x19prHKDo3xaHfThiu1Lsc7w
	Xna9CsbA7CDrWRPDrcHBItjE5yqMxVcBlWuoAY681kvKCN8gQPzvMJO+CTshxzljj8fm4sEMlsdEv
	0D0Cs9gz4t4/NZM5SPMd98O4UOGcHgNF+ywsUfTpI4R/IXHr4ILLG2xop1doRfW2ovDYriGgpktbk
	gcqqdMp8IqnF7OVp63rLXTV2j5m3UbpZK8WguTSZ3P/iWQDwamhwrJEPq3w2JKdLB4PzMcDOVpN2O
	m19BFkr+LMWewy5RDyEVkKMHiyoaAQ+/6hIPHrWhe86l5HBn2zyHGnqZBBV6eKB+UPJfTy/rlwU1z
	lR7Q18WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eT3-00000002IxN-3T7D;
	Mon, 21 Sep 2026 13:54:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eT0-00000002IwN-3xcu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:54:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE5CC19F6;
	Mon, 21 Sep 2026 06:53:53 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3420E3F528;
	Mon, 21 Sep 2026 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789998837; bh=Jj4hi3nOQIvL1egLazUO3TYMWQiNpu65uVwI8Zi/jPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6MO9tSqlTXynMt/1OVN/w2TYTxJMjFoQUcv5n88bEh4PaWID8+mF7JJPVkr4ScdQ
	 Jf3eEQi+eZxZSohL7qb0CBqhOdQWGJhQA1bShIwmIpB++KZh6O4B4sUQ6xbY5sr4KA
	 v+a1FbZwyKlCpBu1LLtv6pyJQMbcBt73YJsI8DrY=
Message-ID: <71641020-6b30-4c68-b574-7d4784690941@arm.com>
Date: Mon, 21 Sep 2026 14:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/38] arm64: cpufeature: Detect PE support for FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-24-vladimir.murzin@arm.com>
 <66da4eb2-b3ef-4786-a447-7c4508f97ab1@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <66da4eb2-b3ef-4786-a447-7c4508f97ab1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_065359_062744_1A29C487 
X-CRM114-Status: GOOD (  28.21  )
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

On 9/16/26 10:22, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Use of FEAT_NMI requires that all the PEs in the system and the GIC
>> have NMI support. This patch implements the PE part of that detection.
>>
>> In order to avoid problematic interactions between real and pseudo NMIs
>> we disable the architected feature if the user has enabled pseudo NMIs
>> on the command line. If this is done on a system where support for the
>> architected feature is detected then a warning is printed during boot in
>> order to help users spot what is likely to be a misconfiguration.
>>
>> As KVM does not care about the host kernel supporting FEAT_NMI or not
>> to allow guests to use it, split the CPU cap in two : ARM64_HAS_NMI is
>> the hardware support, ARM64_NMI is the kernel making use of it.
>>
>> Co-developed-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/cpucaps.h    |  2 +
>>  arch/arm64/include/asm/cpufeature.h | 10 +++++
>>  arch/arm64/kernel/cpufeature.c      | 68 ++++++++++++++++++++++++++++-
>>  arch/arm64/tools/cpucaps            |  2 +
>>  4 files changed, 81 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
>> index 76350b38f0d7..1a4ef4e94997 100644
>> --- a/arch/arm64/include/asm/cpucaps.h
>> +++ b/arch/arm64/include/asm/cpucaps.h
>> @@ -75,6 +75,8 @@ cpucap_is_possible(const unsigned int cap)
>>  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
>>  	case ARM64_HAS_LSUI:
>>  		return IS_ENABLED(CONFIG_ARM64_LSUI);
>> +	case ARM64_NMI:
>> +		return IS_ENABLED(CONFIG_ARM64_NMI);
>>  	}
>>  
>>  	return true;
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index 09aa80df602a..c8b1bacdd161 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -809,6 +809,16 @@ static __always_inline bool system_uses_irq_prio_masking(void)
>>  	return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
>>  }
>>  
>> +static __always_inline bool system_supports_nmi(void)
>> +{
>> +	return alternative_has_cap_unlikely(ARM64_HAS_NMI);
>> +}
>> +
>> +static __always_inline bool system_uses_nmi(void)
>> +{
>> +	return alternative_has_cap_unlikely(ARM64_NMI);
>> +}
>> +
>>  static inline bool system_supports_mte(void)
>>  {
>>  	return alternative_has_cap_unlikely(ARM64_MTE);
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 32102c3912fa..f9fe7a875f85 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -83,13 +83,14 @@
>>  #include <asm/cpu_ops.h>
>>  #include <asm/fpsimd.h>
>>  #include <asm/hwcap.h>
>> +#include <asm/hypervisor.h>
>>  #include <asm/insn.h>
>> +#include <asm/interrupts/common_flags.h>
>>  #include <asm/kvm_host.h>
>>  #include <asm/mmu.h>
>>  #include <asm/mmu_context.h>
>>  #include <asm/mpam.h>
>>  #include <asm/mte.h>
>> -#include <asm/hypervisor.h>
>>  #include <asm/processor.h>
>>  #include <asm/smp.h>
>>  #include <asm/sysreg.h>
>> @@ -315,6 +316,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
>>  	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
>>  		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
>>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_frac_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_NMI_SHIFT, 4, 0),
>>  	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
>>  		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
>>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
>> @@ -2341,6 +2343,51 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
>>  }
>>  #endif
>>  
>> +#ifdef CONFIG_ARM64_NMI
>> +static bool can_use_nmi(const struct arm64_cpu_capabilities *entry, int scope)
>> +{
>> +	/*
>> +	 * ARM64_HAS_NMI has a lower index, and is a boot CPU
>> +	 * feature, so will be detected earlier.
>> +	 */
>> +	BUILD_BUG_ON(ARM64_NMI <= ARM64_HAS_NMI);
>> +	if (!cpus_have_cap(ARM64_HAS_NMI))
>> +		return false;
>> +
>> +	/*
>> +	 * Having both real and pseudo NMIs enabled simultaneously is
>> +	 * likely to cause confusion.  Since pseudo NMIs must be
>> +	 * enabled with an explicit command line option, if the user
>> +	 * has set that option on a system with real NMIs for some
>> +	 * reason assume they know what they're doing.
>> +	 *
>> +	 * ARM64_HAS_GIC_PRIO_MASKING has a lower index, and is a boot CPU
>> +	 * feature, so will be detected earlier.
>> +	 */
>> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
>> +			(ARM64_NMI <= ARM64_HAS_GIC_PRIO_MASKING));
>> +	if (cpus_have_cap(ARM64_HAS_GIC_PRIO_MASKING)) {
>> +		pr_info_once("Pseudo NMI enabled, not using architected NMI\n");
>> +		return false;
> Hi, Vladimir,
> 
> The user's actual requirement may be to use FEAT_NMI by default when it
> is available, and fall back to pseudo-NMI otherwise, since pseudo-NMI
> has inherent noise and is only a second choice when there is no hardware
> support. Can we design it this way?
> 

Hi Jinjie,

Hmm, currently users have to explicitly opt in to pseudo-NMI (enable
the config option and pass irqchip.gicv3_pseudo_nmi=1 on the command
line), and those users would continue to use pseudo-NMI even if
FEAT_NMI is available.

What you are asking is to prefer FEAT_NMI over pseudo-NMI when it is
available, effectively turning the explicit opt-in to pseudo-NMI into
a hint rather than a strict request, correct?

Cheers
Vladimir

> Best regards,
> Jinjie
> 
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static void nmi_enable(const struct arm64_cpu_capabilities *__unused)
>> +{
>> +	/*
>> +	 * Enable use of NMIs controlled by ALLINT, SPINTMASK should
>> +	 * be clear by default but make it explicit that we are using
>> +	 * this mode.  Ensure that ALLINT is clear first in order to
>> +	 * avoid leaving things masked.
>> +	 */
>> +	_allint_clear();
>> +	sysreg_clear_set(sctlr_el1, SCTLR_EL1_SPINTMASK, SCTLR_EL1_NMI);
>> +	isb();
>> +}
>> +#endif
>> +
>>  static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
>>  				 int scope)
>>  {
>> @@ -3233,6 +3280,25 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>>  		.matches = has_cpuid_feature,
>>  		ARM64_CPUID_FIELDS(ID_AA64ISAR3_EL1, LSUI, IMP)
>>  	},
>> +#endif
>> +	{
>> +		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
>> +		.capability = ARM64_HAS_NMI,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, NMI, IMP)
>> +	},
>> +#ifdef CONFIG_ARM64_NMI
>> +	/*
>> +	 * Depends on ARM64_HAS_NMI
>> +	 * Checks for conflict with pseudo-NMIs, giving them priority.
>> +	 */
>> +	{
>> +		.desc = "Non-maskable Interrupts",
>> +		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
>> +		.capability = ARM64_NMI,
>> +		.matches = can_use_nmi,
>> +		.cpu_enable = nmi_enable,
>> +	},
>>  #endif
>>  	{},
>>  };
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 2775ba3359cf..531583822ec2 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -52,6 +52,7 @@ HAS_LS64_V
>>  HAS_LSUI
>>  HAS_MOPS
>>  HAS_NESTED_VIRT
>> +HAS_NMI
>>  HAS_NV2P1
>>  HAS_NV3
>>  HAS_PAN
>> @@ -82,6 +83,7 @@ MTE
>>  MTE_ASYMM
>>  MTE_FAR
>>  MTE_STORE_ONLY
>> +NMI
>>  SME
>>  SME_FA64
>>  SME2
> 


