Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A5ECD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG7O0lHSRscMsCiZTAkBaQVsH7ojMjtgb6J5wme+v7Y=; b=4YWPj1b+U/hwGBOWBti0HWqSxN
	EfVNEGAOANh34oOZzzoq7kKhXsHKYXDSR56OXfN5J4yHcO0nePADGkHiN1+FhSXfP3fb8ycLUn0JJ
	t2t9Rhvk3b0tJfOsnTYncLsh8aMRzmw15hmohEg6ZepO5zB3sSrG7DZvZAP10L81ebb51mGYdLYGt
	YAuzWlJYjplIHUsSk8O9cgbT23+Dxx95CnvwNK4bfcVqtqk81MlPO/xzgsdK76C7wTx0qMeWL8ig0
	g7ZaxcbtbfD+ZB+wlYj4I8j73+7w+C1n4opBzFY4OAjJqqpd5J6aqdXg0IBtBnmaBYshPRMzzUYwb
	9rgg+0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoRD-00000007DOj-1bjE;
	Fri, 01 May 2026 14:01:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoR8-00000007DOA-2qzZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:01:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44a5174670eso453368f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777644105; x=1778248905; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HG7O0lHSRscMsCiZTAkBaQVsH7ojMjtgb6J5wme+v7Y=;
        b=Pu9TPXAUZJVk/60PBW+jEb6bjSSAzO85ReSmjHVBBiSt0dSAtWxk/vET8SpTsNvJ0E
         dyDNKcL7viYjO2pk8UNbfhR3rgZCJVxQKzDBdycvkJgJJdIfp9FXIr+8vI8sII7N044T
         kG1AuvtH9KprwqVUQXKGCER/FCBGwvRx7+mCzBA0jtpcR4VE2E9YeZB4hq7xqdZdqyoR
         c+v/Vlc/GhRcp9vDC20y7bwrkYkAs5oaN0fws6LoUFv1790yQqan2yc8wmIn987YBNsC
         0YiI9A2CbmjprtDdZe7kf2DrBvWf771pBZWGN6xChxmE0Gm/mQ8mjCd6WumaN4nHBAOf
         IGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644105; x=1778248905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG7O0lHSRscMsCiZTAkBaQVsH7ojMjtgb6J5wme+v7Y=;
        b=O3H68gjTgTG+jZqRaOVND8jb8/We5cRykQhC3QcO4FuEwxGen7XIKtRy5ccy8luEIP
         TsjAQNr+ZWA7POzMMrxEBYcpTdrWqCpVoOS88eGrrj5i4piCH8ChbQsOS/PejxyFhYuk
         ub+0Imr4fPVQV3rUZrvhjBgV7VXx/dGMXJ4jnjbo2hh4mZPdWrI0z1Wno2kBvF0i6KjH
         EUoZJEMZbFQ485JPyV86Uon4Rg4m/Thk1LGFjMu1MDwoZlcMXFdoUWmT+wEp2lBFqJwn
         k4fx3mcwPWdR8RL2fLDAGv9EjNdJfbrsaeDREnrR28F1CoacZEIUI0CjjRFwB3b7ZUff
         P6eA==
X-Gm-Message-State: AOJu0YwXBCXOsRU3thlgBBmCMTgTu2HEUpr4epTR3vETiB0d5u9dAOpV
	H5LrxFjZkjn7nb+pJcXzleBUkhXsfjZlC4EJDY6wyVIk8VaiaZgPIDhSO+drWhL5lho=
X-Gm-Gg: AeBDiesmoLrSdmSxD8TMxpaoNNPGodH9zWAc3bbWx8sX/8F7DnLlFYkTDufvVeB/ApS
	1WNL0d5UmVLpFxDbckj6QtGEEDERpF9JZ4ype3b3WUXM3TpoZH5/SbUfW1aivmTBVQ9Wmns8SjR
	BOTht7vypzmvx9uuo6JuhTMlHhVZJYFxEZKu15VJH9D5Dh6eiSytLYmpjYM6j2YYcxHHXEtXJoJ
	3+qebuX7z7eAIZnQog6n9lwNpzleRYe7alirDUz4nac8RrgqHNKZMexIRvpoNwAp0sy0dv0T9kd
	dYDmhtDfywKBEg1q2GIxgT9d9HwagZJf6Eb2YYC17SScAvkdu+y2s4YbsKcQtkCVWH1Y1hblH6y
	lg2n/TpGUAx71CxaBcLyhjvna8Wgo5UDo4XGjbYsR11eeMZrlfL5iOR2OYhtmMUCWg5M+Bqgf8J
	UtVxLsTrtrQi9jlpE+oBFqMEg8+Z6ypRVn9MReIxe905bi1f2vyw==
X-Received: by 2002:a5d:5c89:0:b0:43c:f583:126a with SMTP id ffacd0b85a97d-4493d412141mr12783250f8f.14.1777644104559;
        Fri, 01 May 2026 07:01:44 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50e59sm5185538f8f.10.2026.05.01.07.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 07:01:43 -0700 (PDT)
Message-ID: <0fc8ae87-a941-4dfe-9c14-c851c6a29514@linaro.org>
Date: Fri, 1 May 2026 15:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
 vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
 mochs@nvidia.com, nirmoyd@nvidia.com, skelley@nvidia.com, will@kernel.org,
 mark.rutland@arm.com, yangyccccc@gmail.com
References: <20260429215614.1793131-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260429215614.1793131-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_070146_789628_2DBC6F91 
X-CRM114-Status: GOOD (  41.46  )
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



On 29/04/2026 10:56 pm, Besar Wicaksono wrote:
> PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while the
> PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
> counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
> give results that differ from the programmable counter path.
> 
> Extend the existing PMCCNTR avoidance decision from the SMT case to
> also cover Olympus. Store the result in the common arm_pmu state at
> registration time, so arm_pmuv3 can keep using a single flag when
> deciding whether CPU_CYCLES may use PMCCNTR_EL0.
> 
> Use the cached MIDR from cpu_data to identify Olympus parts and avoid
> reading MIDR_EL1 in the event path.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> 
> Changes from v1:
>    * add CONFIG_ARM64 check to fix build error found by kernel test robot
>    * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
> 
> Changes from v2:
>    * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
>      common arm_pmu registration path.
>    * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering both
>      the existing SMT restriction and the Olympus MIDR restriction.
>    * Use the cached per-CPU MIDR from cpu_data instead of calling
>      is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
>    * Add the required asm/cpu.h include for cpu_data.
>    * Drop the use_pmccntr override patch from this revision.
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
> 
> ---
>   drivers/perf/arm_pmu.c       | 78 +++++++++++++++++++++++++++++++++---
>   drivers/perf/arm_pmuv3.c     |  8 +---
>   include/linux/perf/arm_pmu.h |  2 +-
>   3 files changed, 75 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..7df185ee7b74 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -24,6 +24,8 @@
>   #include <linux/irq.h>
>   #include <linux/irqdesc.h>
>   
> +#include <asm/cpu.h>
> +#include <asm/cputype.h>
>   #include <asm/irq_regs.h>
>   
>   static int armpmu_count_irq_users(const struct cpumask *affinity,
> @@ -920,6 +922,76 @@ void armpmu_free(struct arm_pmu *pmu)
>   	kfree(pmu);
>   }
>   
> +#ifdef CONFIG_ARM64
> +/*
> + * List of CPUs that should avoid using PMCCNTR_EL0.
> + */
> +static struct midr_range armpmu_avoid_pmccntr_cpus[] = {
> +	/*
> +	 * The PMCCNTR_EL0 in Olympus CPU may still increment while in WFI/WFE state.
> +	 * This is an implementation specific behavior and not an erratum.
> +	 *
> +	 * From ARM DDI0487 D14.4:
> +	 *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR count
> +	 *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
> +	 *
> +	 * From ARM DDI0487 D24.5.2:
> +	 *   All counters are subject to any changes in clock frequency, including
> +	 *   clock stopping caused by the WFI and WFE instructions.
> +	 *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
> +	 *   PMCCNTR_EL0 continues to increment when clocks are stopped by WFI and
> +	 *   WFE instructions.
> +	 */
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> +	{}
> +};
> +
> +static bool armpmu_is_in_avoid_pmccntr_cpus(int cpu)
> +{
> +	struct midr_range const *r = armpmu_avoid_pmccntr_cpus;
> +	u32 midr = (u32)per_cpu(cpu_data, cpu).reg_midr;

Hi Besar,

This is still fragile to the thing I mentioned on V2 about some of the 
CPUs not being online, then cpu_data isn't initialized for those CPUs.

Sashiko suggests to use cpumask_any_and(&pmu->supported_cpus, 
cpu_online_mask), and currently the Arm PMUs do require at least one CPU 
online so it's probably fine. Although it could be fragile if we added 
deferred probing in the future.

The other alternative is to put this in __armv8pmu_probe_pmu(), although 
then you end up with both arm_pmuv3 and arm_pmu initializing 
cpu_pmu->has_smt, but I'm sure there is a way to make it fit somehow.

James

> +
> +	while (r->model) {
> +		if (midr_is_cpu_model_range(midr, r->model, r->rv_min, r->rv_max))
> +			return true;
> +		r++;
> +	}
> +
> +	return false;
> +}
> +#else
> +static bool armpmu_is_in_avoid_pmccntr_cpus(int cpu)
> +{
> +	return false;
> +}
> +#endif
> +
> +static bool armpmu_avoid_pmccntr(struct arm_pmu *pmu)
> +{
> +	int cpu = cpumask_first(&pmu->supported_cpus);
> +
> +	/*
> +	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
> +	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
> +	 */
> +	if (topology_core_has_smt(cpu))
> +		return true;
> +
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	if (armpmu_is_in_avoid_pmccntr_cpus(cpu))
> +		return true;
> +
> +	return false;
> +}
> +
>   int armpmu_register(struct arm_pmu *pmu)
>   {
>   	int ret;
> @@ -928,11 +1000,7 @@ int armpmu_register(struct arm_pmu *pmu)
>   	if (ret)
>   		return ret;
>   
> -	/*
> -	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
> -	 * detect the SMT implementation.
> -	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr = armpmu_avoid_pmccntr(pmu);
>   
>   	if (!pmu->set_event_filter)
>   		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..60f159a51992 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1002,13 +1002,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   	if (has_branch_stack(event))
>   		return false;
>   
> -	/*
> -	 * The PMCCNTR_EL0 increments from the processor clock rather than
> -	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> -	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> -	 * multi-threaded implementation. So don't use it on SMT cores.
> -	 */
> -	if (cpu_pmu->has_smt)
> +	if (cpu_pmu->avoid_pmccntr)
>   		return false;
>   
>   	return true;
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 52b37f7bdbf9..02d2c7f45b52 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -119,7 +119,7 @@ struct arm_pmu {
>   
>   	/* PMUv3 only */
>   	int		pmuver;
> -	bool		has_smt;
> +	bool		avoid_pmccntr;
>   	u64		reg_pmmir;
>   	u64		reg_brbidr;
>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40


