Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8244DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6dKffTbpLbKEDPe+UffKpyUA1sFGASwva52i+iVTLA=; b=k0pmRmOLOhhso9/SCFetfa+ioI
	K5qylsu7/lZb6KTYw9ieJFKeS3xJ69uH+V8vp4hz77talV1V0bxh8Xwn828pNheC7rj7IwsMc9HCv
	KZIr15afmwg1mD+E60m0c3/rLakdSouhTDcDpxDOxFwL2QVdPtw6p9lsa4YxbzrxgwJNuypiYt6Ot
	Z2tJRPoSqMOhqIgM43Nx5VCk/O13Hxo5kCO3rlny/frr+zHtEMHotfjut7kFbdfidz2IgZZXuZ8Lo
	Cx30xGsrR50MWEme06ZSQzfWRLzBVjOKKAGp2JcSG80km4h/r7Ix2lcT0YesZlOKGqsNgChh3wY/X
	rA0YGmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAyk-0000000FVVi-1oq6;
	Tue, 05 May 2026 08:18:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAyh-0000000FVV0-0puT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:18:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso43519975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777969081; x=1778573881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6dKffTbpLbKEDPe+UffKpyUA1sFGASwva52i+iVTLA=;
        b=xs0wKhpfPRZPe5aMxyddmm6xNsxIuhAm40RRDM9k3q9y3TkydOPFM9zn6f1RRwXMZG
         hklgvUmrcyevz0Zsg3tU7rMIS6pfT0y/LoH+o8YSbaLO+7Po2GXixciQOdj/O35JvhPK
         ls3H57pZB5xQZVmr4sDwz7IZMT0sv/cbNIQe1VCP78LlIQIs5Y6KhBAtL0csOEx9tjhH
         y/iaRHblEqJlL5saSlWRgqpkXoSyJr27xJQwNenpFMt7vr6YkFckOTjjyCQpAt3gqcmr
         5V+3Co2vQx33XYW9frmgd07mIekjPN6IS0uBwyxh1pW8vMjV/+GfU5LSBaxqdvja7k2i
         MKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777969081; x=1778573881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6dKffTbpLbKEDPe+UffKpyUA1sFGASwva52i+iVTLA=;
        b=cckllyv3ye28ex4P+6O7s08etSez/E6k4dWtJGdO1VgYdnq8A2FUIdcczDgnsi+ILK
         PvLLezOK1HrpKwBVXqUMX+cjDWU3mNlADWBzdMES6PdurfLdaVbdk2fLFkEAxc2HdPhH
         uwXdnL1GWv+I3DVJbumJGuNh11dRGHjfFQc5y3SNOhRQFeneHRnNLX52cWNUcFMVaKym
         555EmgDTrGUldwhZgwglwgCCZylHqQpBqfkuB6csY00Nhc9TlONfRIKa5bGjpn0r9v+Z
         atsHzpEGwfdem2Z8PzOR4iU4+Lx93xQQr4DUtrTXdrUYycbgoQW/wgSOF8SCspqMXwt/
         ontg==
X-Gm-Message-State: AOJu0YxpS3sDlqNZcwPEZQSAdNcHLZJwys7inzqd0RfSLV151KW2Fq4i
	OBxza5B8joIz92u7sCayCqXYHQ+95lgDtuBNPftFihGFy4bZIcJDUKPzTK8V6szTa2E=
X-Gm-Gg: AeBDievNC0XtONMfIqW7c1NzRKKHtdWBllSZvWxy7tgww7I1UfV+qFPItbY5ldvH0oI
	4RB4fARQlO0MHH1wz4bneSbqEUWCUNUkwQjgpEQYGVc68x/uZe4zJtPVZi5rxfpMnjmT2V7iJa+
	oMEaPrYjzbKTIw9m6JpHirgy+juk4mE+qp02iOAaVcKcbCFK5wX/DiLGu3s/1e3SHP9mot8ZFs2
	TTmgVjEZ+0b5PaNqSuYbpWq5nBlICWhkHvLKoMeneNOx2l9lgJZwab4mQWK0+7AShSAEITTl/HT
	Yhfnc2cxMx+Q03muFP7IbCrvDw/abpInwljL7I1Bp2k6DemJWPlLs0abvTQ2B9pWZcg5uiI1BFj
	7IZ1PaKImv6N1WPixu6QyhB6v0D7gzFgKS5iK6pQgAk9zgKXuuESOMx2WBm9IkooDXF5B9r1RW+
	R081cHUhdmBAm3MVDqlrv7rReVsbTSW4nHs/eODQg=
X-Received: by 2002:a05:600c:a302:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48a98638a65mr150958495e9.8.1777969080461;
        Tue, 05 May 2026 01:18:00 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48b23sm2925732f8f.14.2026.05.05.01.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:18:00 -0700 (PDT)
Message-ID: <19058847-4eaf-4d1d-8786-47f75d739b26@linaro.org>
Date: Tue, 5 May 2026 09:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
 vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
 mochs@nvidia.com, nirmoyd@nvidia.com, skelley@nvidia.com, will@kernel.org,
 mark.rutland@arm.com, yangyccccc@gmail.com
References: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_011803_323273_EAEF20B6 
X-CRM114-Status: GOOD (  38.54  )
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



On 04/05/2026 6:52 pm, Besar Wicaksono wrote:
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
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
> 
> Changes from v3:
>    * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to make sure
>      the MIDR is retrieved from the correct online CPU.
> v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-bwicaksono@nvidia.com/
> 
> ---
>   drivers/perf/arm_pmu.c       |  7 ++++-
>   drivers/perf/arm_pmuv3.c     | 51 +++++++++++++++++++++++++++++++-----
>   include/linux/perf/arm_pmu.h |  2 +-
>   3 files changed, 51 insertions(+), 9 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>

> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..aa1dac0b440f 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
>   	/*
>   	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>   	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
>   	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr |=
> +		topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>   
>   	if (!pmu->set_event_filter)
>   		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..1ee4a09d0dcc 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -8,6 +8,7 @@
>    * This code is based heavily on the ARMv7 perf event code.
>    */
>   
> +#include <asm/cputype.h>
>   #include <asm/irq_regs.h>
>   #include <asm/perf_event.h>
>   #include <asm/virt.h>
> @@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
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
> @@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct perf_event *event)
>   				       &armv8_vulcan_perf_cache_map);
>   }
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
>   struct armv8pmu_probe_info {
>   	struct arm_pmu *pmu;
>   	bool present;
> @@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void *info)
>   	else
>   		cpu_pmu->reg_pmmir = 0;
>   
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	cpu_pmu->avoid_pmccntr |= armv8pmu_is_in_avoid_pmccntr_cpus();
> +
>   	brbe_probe(cpu_pmu);
>   }
>   
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


