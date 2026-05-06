Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83DDCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 18:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuJNK74FZbqVhPeAZpglZhE5OEb6jkb4N0hZVB1Zah4=; b=BUu4yNIO5hcUqyDwspBU5Co5VO
	mmwL0cIfDlRkw9tbXnj5oLY0i9xWsLeWOu+ZtUXMFtkGc89qOiDl2rM0si2hqLUWNz5h/HxQi19j0
	6upIDhuxXwmvO7OvPeWqwaZYHDfDB8+EU6Y1qmOO4mHuWcq0KaeSO2CUKPBgbAceThgxFVz/UKDLy
	2+5Rd2dBHkCj9WJCsS15NYqHGTuE7or/Uvd67vUU93urUQgyVkSJ3XLQRI9jioc7Gpl2xmy8TM3W1
	NnuqNfhaJejd3a5CeFvhe2ohRQdeeyJ3/ilnw1axJJH8hf6JBnMh1Gwaxk4Py+3DYXN+O1sLmy8mH
	x2MwQp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKglS-00000001k6Z-0WhF;
	Wed, 06 May 2026 18:14:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKglR-00000001k5r-0jOK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 18:14:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba25c9bb9fso11255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778091268; x=1778696068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuJNK74FZbqVhPeAZpglZhE5OEb6jkb4N0hZVB1Zah4=;
        b=js80Yr9mVB8Lm2y9YOLHkprGaFnIkqCFa8Zl7Pw5r++1BuJyrQuW5O4rY3arycTK2s
         jZwHti68apXMcyt+p76/hjhFJ8VXx7r6Pjj/F3DfFTBcz1NwnfFT7j02GVjE53dghK4K
         3t/F9V4NRiKfU7HASMLmIfzg26VMmMFwkrXt1SF3tzfioktgzSI7L5iz/Xi/Muh4huF6
         kykVy0p6+ZlsugLpjOmlWF+bbZvC1qGWf7Ider59nMBNS9DOH28FHji/6QgHTmtZ0iyQ
         sV4LXg2XiCWDTwlGa7o7x6rf6hs+fzcBrvyeefWgoLfJ0SShDO5panG0FUjZ1G+uoULF
         dD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091268; x=1778696068;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuJNK74FZbqVhPeAZpglZhE5OEb6jkb4N0hZVB1Zah4=;
        b=CyDJGu5K+ILZrfxOS90BmWfLkyFbqIhD94A9LgMXd5H/AOq5SXRw6LKozrCpVZ+4zC
         fIZD6dpmHjljwiupXGc0Um9KBpb+GW+J9pkwLIzOv33gBeZiGgJTNS2nS45SurEPXoKP
         o3LRT59R6cMkzOYsc5ICK4oxUBfszns6nSv5bzs1P74J52TwsGu9v0QaQuHniJHHYsDJ
         6gU53ejwVyobEUkUVObkMeCzwoPuxzqOE0nK3LkXrsqjCtcCHxhYgaR2mOvHgMgB8MRD
         bMjs096GW3ZMWS/rIzFgkYgZtEQWjrGU9zyjc0R8pkN5pXFyDMnPwvroTZyvmwUvyGYq
         k8iw==
X-Forwarded-Encrypted: i=1; AFNElJ88bYrN4SvXvb9FsVRzum3T9gBC/l3DlbOnoevmne86oshaChgVvKWHb1DhpdWFLltAlAlQgzqLSMzR53v5NF9d@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6REvyKp4/uzuu1UJnmwBz9A9UkQbQrAUfEedK21WOdOVfHQ/2
	3zNuwaXJgKEyRRn1bZ5GtQ7lVrgdeluVfAwDy5OaimWK9Slho75M/C22
X-Gm-Gg: AeBDieuifYb0gcU8Hc0lpaggHdM0TERs5vZkLHfkADRYzdEcRomEo+ucl2/y0ZJXhN/
	4ZJZThxJVoDro1pfpuWJwherERjGqpHgdR+031gNEcC9SyQwr8IYeCnVPKph5UsEGFOrTNPdFr0
	lldyDiSckNg+AeeYcsRXoBwmsl898+vJjTG7+HCRReceaItJOWd8UmamVUzYBbiGrJ1VtfK5yHM
	vB3TyLYzgsVejke4qH231QWAt6YHe+r2RXo6thj9r6debHc6+hvwBU1CiL16HS9hU3z30x62lVP
	yBmSp8p7q6hVwJH/guG8ulLogzRcX453C2gJn564kiT8u2e9825mEaZHrKcB3auk2wDcOEeoK/i
	8rGWeOD1KAlQjf1mPxBvaxHmfg2KmF8T95pfCqen7kfFPUdQqiYXLHWKMhnE3R8azHFmhSuVRRT
	Sy+bmO2kGVPt7QY0+lFITA63eGKCZjpue0ynWj2rXeNG/xhC6QCb8uOU4iDq2J
X-Received: by 2002:a05:6a21:a44:b0:39b:8b8b:39de with SMTP id adf61e73a8af0-3aa6099f8fbmr2146121637.5.1778091267709;
        Wed, 06 May 2026 11:14:27 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.164.28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242b7f35esm3574705a12.18.2026.05.06.11.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:14:26 -0700 (PDT)
Message-ID: <ebc36f4f-db33-44dc-893b-8693ed85305f@gmail.com>
Date: Thu, 7 May 2026 02:14:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: will@kernel.org, mark.rutland@arm.com, james.clark@linaro.org,
 yangyccccc@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
 rwiley@nvidia.com, sdonthineni@nvidia.com, mochs@nvidia.com,
 nirmoyd@nvidia.com, skelley@nvidia.com
Subject: Re: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
References: <20260504175204.3122979-1-bwicaksono@nvidia.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111429_228700_62E294D0 
X-CRM114-Status: GOOD (  37.60  )
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

On 2026/5/5 01:52, Besar Wicaksono wrote:
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
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Reviewed-by: Yicong Yang <yangyccccc@gmail.com>

> ---
>
> Changes from v1:
>   * add CONFIG_ARM64 check to fix build error found by kernel test robot
>   * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
>
> Changes from v2:
>   * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
>     common arm_pmu registration path.
>   * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering both
>     the existing SMT restriction and the Olympus MIDR restriction.
>   * Use the cached per-CPU MIDR from cpu_data instead of calling
>     is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
>   * Add the required asm/cpu.h include for cpu_data.
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
>
> Changes from v3:
>   * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to make sure
>     the MIDR is retrieved from the correct online CPU.
> v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-bwicaksono@nvidia.com/
>
> ---
>  drivers/perf/arm_pmu.c       |  7 ++++-
>  drivers/perf/arm_pmuv3.c     | 51 +++++++++++++++++++++++++++++++-----
>  include/linux/perf/arm_pmu.h |  2 +-
>  3 files changed, 51 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..aa1dac0b440f 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
>  	/*
>  	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>  	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
>  	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr |=
> +		topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>  
>  	if (!pmu->set_event_filter)
>  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..1ee4a09d0dcc 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -8,6 +8,7 @@
>   * This code is based heavily on the ARMv7 perf event code.
>   */
>  
> +#include <asm/cputype.h>
>  #include <asm/irq_regs.h>
>  #include <asm/perf_event.h>
>  #include <asm/virt.h>
> @@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>  	if (has_branch_stack(event))
>  		return false;
>  
> -	/*
> -	 * The PMCCNTR_EL0 increments from the processor clock rather than
> -	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> -	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> -	 * multi-threaded implementation. So don't use it on SMT cores.
> -	 */
> -	if (cpu_pmu->has_smt)
> +	if (cpu_pmu->avoid_pmccntr)
>  		return false;
>  
>  	return true;
> @@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct perf_event *event)
>  				       &armv8_vulcan_perf_cache_map);
>  }
>  
> +#ifdef CONFIG_ARM64
> +/*
> + * List of CPUs that should avoid using PMCCNTR_EL0.
> + */
> +static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
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
> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> +{
> +	return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
> +}
> +#else
> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  struct armv8pmu_probe_info {
>  	struct arm_pmu *pmu;
>  	bool present;
> @@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void *info)
>  	else
>  		cpu_pmu->reg_pmmir = 0;
>  
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	cpu_pmu->avoid_pmccntr |= armv8pmu_is_in_avoid_pmccntr_cpus();
> +
>  	brbe_probe(cpu_pmu);
>  }
>  
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 52b37f7bdbf9..02d2c7f45b52 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -119,7 +119,7 @@ struct arm_pmu {
>  
>  	/* PMUv3 only */
>  	int		pmuver;
> -	bool		has_smt;
> +	bool		avoid_pmccntr;
>  	u64		reg_pmmir;
>  	u64		reg_brbidr;
>  #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40


