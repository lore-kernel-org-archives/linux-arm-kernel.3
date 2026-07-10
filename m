Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E54C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlYcb11gSNEf8IZbbIqQZQW0bDO52Jtc9N2brf+3/Yc=; b=4ICQ8zhDc2J+zY
	VdyO7nqEVzKbfW5pbY7e0Raxwb/vyiOeAtm7R1KF3TRwYvzO7PziYeLUWXeWgC8vcLaC0SF0nzvjw
	hR+Mnu9acjw0LAAB3Zg9NJD0T6p1st+2448QBsEQODATq49rrArJmaThri+2vmunAr6K4rUUxOey+
	ykVMEqz4YoiNj5v7n8fGcgsHymqOhv9s7DQ49rolclH8AgBK4PRQPM8n6GrpYpvQFpznyelGcz/1R
	sxKDjJELWR3hFYuweF6tPV4vuylIO7sreWke6pWb5JpNpOGUHRC3puLNxjP2akYYdTmspLXRLXE0R
	PrnDxnsyDAgCOX0dp9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0wU-00000003xQM-04Wy;
	Fri, 10 Jul 2026 02:26:18 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0wR-00000003xPP-39nC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:26:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mlYcb11gSNEf8IZbbIqQZQW0bDO52Jtc9N2brf+3/Yc=;
	b=HCybxrp6Jcg2CXQcOZUcER0uDaTkgAf4EJiLoNELk/YAahqJtgvay9015ss0Setf6mZUfXu1l
	8/PUUVFS8XsEsL3R/dFBhIeMbLNOc9BBqEVjLnd1O/1xrs7YzTDLwnWlBdRsyerbr2Jd9bW+eYr
	7PnwpnzkPY65qnY3kHnMWZE=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gxFpS4tLTz12LGB;
	Fri, 10 Jul 2026 10:17:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E0AA540577;
	Fri, 10 Jul 2026 10:25:58 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 10:25:58 +0800
Message-ID: <77cd779b-9091-49f2-9a20-c0805c03e50e@huawei.com>
Date: Fri, 10 Jul 2026 10:25:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 28/36] arm64: cpufeature: Detect PE support for
 FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-29-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-29-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_192616_100814_AFE248FC 
X-CRM114-Status: GOOD (  31.67  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Use of FEAT_NMI requires that all the PEs in the system and the GIC
> have NMI support. This patch implements the PE part of that detection.
> 
> In order to avoid problematic interactions between real and pseudo NMIs
> we disable the architected feature if the user has enabled pseudo NMIs
> on the command line. If this is done on a system where support for the
> architected feature is detected then a warning is printed during boot in
> order to help users spot what is likely to be a misconfiguration.
> 
> As KVM does not care about the host kernel supporting FEAT_NMI or not
> to allow guests to use it, split the CPU cap in two : ARM64_HAS_NMI is
> the hardware support, ARM64_NMI is the kernel making use of it.
> 
> Co-developed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/cpucaps.h    |  2 +
>  arch/arm64/include/asm/cpufeature.h | 10 +++++
>  arch/arm64/kernel/cpufeature.c      | 68 ++++++++++++++++++++++++++++-
>  arch/arm64/tools/cpucaps            |  2 +
>  4 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 25c61cda901c..176a63f1cc1b 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -75,6 +75,8 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
>  	case ARM64_HAS_LSUI:
>  		return IS_ENABLED(CONFIG_ARM64_LSUI);
> +	case ARM64_NMI:
> +		return IS_ENABLED(CONFIG_ARM64_NMI);
>  	}
>  
>  	return true;
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 95cd8d4acd26..84b817b29155 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -816,6 +816,16 @@ static __always_inline bool system_uses_irq_prio_masking(void)
>  	return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
>  }
>  
> +static __always_inline bool system_supports_nmi(void)
> +{
> +	return alternative_has_cap_unlikely(ARM64_HAS_NMI);
> +}
> +
> +static __always_inline bool system_uses_nmi(void)
> +{
> +	return alternative_has_cap_unlikely(ARM64_NMI);
> +}
> +
>  static inline bool system_supports_mte(void)
>  {
>  	return alternative_has_cap_unlikely(ARM64_MTE);
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..bb22292ebabc 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -83,13 +83,14 @@
>  #include <asm/cpu_ops.h>
>  #include <asm/fpsimd.h>
>  #include <asm/hwcap.h>
> +#include <asm/hypervisor.h>
>  #include <asm/insn.h>
> +#include <asm/interrupts/common_flags.h>
>  #include <asm/kvm_host.h>
>  #include <asm/mmu.h>
>  #include <asm/mmu_context.h>
>  #include <asm/mpam.h>
>  #include <asm/mte.h>
> -#include <asm/hypervisor.h>
>  #include <asm/processor.h>
>  #include <asm/smp.h>
>  #include <asm/sysreg.h>
> @@ -315,6 +316,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
>  		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_frac_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_NMI_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
>  		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
> @@ -2320,6 +2322,51 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
>  }
>  #endif
>  
> +#ifdef CONFIG_ARM64_NMI
> +static bool can_use_nmi(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +	/*
> +	 * ARM64_HAS_NMI has a lower index, and is a boot CPU
> +	 * feature, so will be detected earlier.
> +	 */
> +	BUILD_BUG_ON(ARM64_NMI <= ARM64_HAS_NMI);
> +	if (!cpus_have_cap(ARM64_HAS_NMI))
> +		return false;
> +
> +	/*
> +	 * Having both real and pseudo NMIs enabled simultaneously is
> +	 * likely to cause confusion.  Since pseudo NMIs must be
> +	 * enabled with an explicit command line option, if the user
> +	 * has set that option on a system with real NMIs for some
> +	 * reason assume they know what they're doing.
> +	 *
> +	 * ARM64_HAS_GIC_PRIO_MASKING has a lower index, and is a boot CPU
> +	 * feature, so will be detected earlier.
> +	 */
> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
> +			(ARM64_NMI <= ARM64_HAS_GIC_PRIO_MASKING));
> +	if (cpus_have_cap(ARM64_HAS_GIC_PRIO_MASKING)) {
> +		pr_info("Pseudo NMI enabled, not using architected NMI\n");
> +		return false;

A small suggestion is to change it to pr_info_once. Otherwise, a large
number of print information will be displayed.

Otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>



# dmesg | grep NMI
[    0.000000] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.000000] GICv3: Pseudo-NMIs enabled using relaxed ICC_PMR_EL1
synchronisation
[    0.434430] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.461345] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.475924] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.491364] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.507948] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.523741] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.543870] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.561246] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.579303] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.597354] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.611880] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.630754] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.649572] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.666047] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.681356] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.707386] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.727123] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.744232] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.769575] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.788145] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.811170] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.831739] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.855084] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.876659] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.897121] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.923611] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.943820] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.967216] CPU features: Pseudo NMI enabled, not using architected NMI
[    0.997958] CPU features: Pseudo NMI enabled, not using architected NMI
[    1.027661] CPU features: Pseudo NMI enabled, not using architected NMI
[    1.057660] CPU features: Pseudo NMI enabled, not using architected NMI
[    8.532896] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
(0,8000003f) counters available, using NMIs
[    8.536298] watchdog: NMI not fully supported


> +	}
> +
> +	return true;
> +}
> +
> +static void nmi_enable(const struct arm64_cpu_capabilities *__unused)
> +{
> +	/*
> +	 * Enable use of NMIs controlled by ALLINT, SPINTMASK should
> +	 * be clear by default but make it explicit that we are using
> +	 * this mode.  Ensure that ALLINT is clear first in order to
> +	 * avoid leaving things masked.
> +	 */
> +	_allint_clear();
> +	sysreg_clear_set(sctlr_el1, SCTLR_EL1_SPINTMASK, SCTLR_EL1_NMI);
> +	isb();
> +}
> +#endif
> +
>  static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
>  				 int scope)
>  {
> @@ -3198,6 +3245,25 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64ISAR3_EL1, LSUI, IMP)
>  	},
> +#endif
> +	{
> +		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
> +		.capability = ARM64_HAS_NMI,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, NMI, IMP)
> +	},
> +#ifdef CONFIG_ARM64_NMI
> +	/*
> +	 * Depends on ARM64_HAS_NMI
> +	 * Checks for conflict with pseudo-NMIs, giving them priority.
> +	 */
> +	{
> +		.desc = "Non-maskable Interrupts",
> +		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
> +		.capability = ARM64_NMI,
> +		.matches = can_use_nmi,
> +		.cpu_enable = nmi_enable,
> +	},
>  #endif
>  	{},
>  };
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 9b85a84f6fd4..2117b3ef0b82 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -51,6 +51,7 @@ HAS_LS64_V
>  HAS_LSUI
>  HAS_MOPS
>  HAS_NESTED_VIRT
> +HAS_NMI
>  HAS_BBML2_NOABORT
>  HAS_PAN
>  HAS_PMUV3
> @@ -80,6 +81,7 @@ MTE
>  MTE_ASYMM
>  MTE_FAR
>  MTE_STORE_ONLY
> +NMI
>  SME
>  SME_FA64
>  SME2


