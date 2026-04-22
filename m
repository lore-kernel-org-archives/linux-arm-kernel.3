Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2191F9B60C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rgqXLVy6xqukPgPXJSs1dZ6Rd18H2YCjcgP2MCGRmo=; b=fTMWo8DYyQoQcG+D87OdkNWFmy
	X6JVxmA+5ShIa/kiByWQItdYoJeOGYPYUBAO2FVj1tJ9AJkjkXTo5p4NHaEL5/SJXDBaM3gqiHoSP
	cvR+YrVPYfrtbqK/2lI7yyeCUFMKo3ttts7c6U4kxVA0uyKy7gNoHpRcpMBz0HyMM17xdgnaUVC0W
	sZ31sPqcDwnG+XO1sU2x2WUaWJZa67GfD5AFTetN0haU1VZbBxZc6VPQ+JObnZpaUDGWeCFdxg10Z
	6DY95T2F81gkK+eBwa1H8kTcUyCwIokOoB4ccJ7cb/l1MrFXRWTucCt2BYBtq249IqOjwxFkUQ5Ol
	viKF5KvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUsw-00000009x8j-2V3G;
	Wed, 22 Apr 2026 10:32:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUss-00000009x7s-3vgL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:32:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48896199cbaso53284145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776853960; x=1777458760; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rgqXLVy6xqukPgPXJSs1dZ6Rd18H2YCjcgP2MCGRmo=;
        b=aCAlKL9kf6ZAms4yahYppnGBANiABwLjTW/a3CNKUkh0KAyfCH5/Dg65cyE9UkoS4H
         8Ccc+sZeIZydhGoUTvd1iWULIErmOairaMVHgZa+5HhGkO+B/kcT4m3G5PR4XN8HQCqb
         iesNfbBUSvh30j7fJx8B6JIH1c3iZrgNXd9o3k0vAiCBlhAxYgGMJCKzcZTeJCFeRNVm
         oP59Aujq5UQ9Yy7t6+TejQvVeAN1/1gx+BSUaCqFr3svKGuO6gknjXuDEkqtJ1fRQKBf
         ajKqsIWudwXCwkdDO+Lbz6WDYg0uNXxutVmT3d9Tt0MrMIQmCCWvvnQNI816jizPXvdX
         jGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853960; x=1777458760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rgqXLVy6xqukPgPXJSs1dZ6Rd18H2YCjcgP2MCGRmo=;
        b=BSVwgvCaV1D9ycONe22RqA5JdJMsOOQ9uENJ9yf4HfLO6Yj4FIPzolR2Uz0/fVCave
         Z2u0yatyav2UC9XtnHeunb0hlHolhEoK1j5Y/UEZ0r2o3NAiDYZGlYyZmWPOwaxs57P7
         dqtcctlbABALO4envg9Y++SvSqwcCuJ0qk7JOJ+lMR65cwcA+DVM9Wv53u+MnCyxK6Tj
         flWRxMYWYZ6dALTXSL0V5QAFr0lnB+3cLckjeXgqkUfRx3OHW04u4EsDzA5AySbmkCXv
         MpdA4XtFm1DbKNu0MvbhY62PFTLlasNy1IygZ20UPcNcHYHHuZqZdDhYoqa1nF/1m1FO
         BC4g==
X-Gm-Message-State: AOJu0YxkYsG472H8M53un3L0+Yj1t+gUfM7o8GEx6IuLPXhB7P71MXhB
	aWmgRDqkgudeAYDo8iTpWY6UHu4ArSvuWuERpbZsdyG4YBG8UFzq4pVxREG0LOO1hMSQbgduVsl
	sehYV0pk=
X-Gm-Gg: AeBDieuqojvjnE2i3IuEXl/HoFLSDCnLObWgX0j114Ssepc6Dy5m31IzrytalNZkKWW
	oO5a4eFHxJOZOYZ8nPOUIQ5cuq8pEUiIfUoLEJnUt7U8Bz8RTvm4yrDM/pgo20ujroCAX78uRUW
	VONOeGLravcjneHAs2hW+FBFndcglv2PVqXRv+lTJ8JuGlWnizIPJAPGzp8S3xGpDxzIRn2f62q
	wEVhdEkGBI81hiB0z0VtqLl1YZ3tZZg67hCnuE5fkM22WEw+uggz5TeJQ7gFrDc4bKPL32p+nKX
	2Rbfo17oaV0gfjBmWJbSMP5j7dh1frpNjc7aibYzaKHhZfVnaUF5nOauXkHMOI6GiTP/xVN98Ay
	CPIjg7QkZqbTcEhYVhsOAxjwjEY5ITzFVtgkmrFkKSJigAbQ20AM4KL8OEhJsUagY8Xjv9q1mJC
	4LoMLN8XzdFzev47u6cUGjd31BvUuPIdXRrBiXS35DKWU=
X-Received: by 2002:a05:600c:4895:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-488ffad67f4mr155484265e9.19.1776853960414;
        Wed, 22 Apr 2026 03:32:40 -0700 (PDT)
Received: from [192.168.178.64] ([84.246.200.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm463372455e9.2.2026.04.22.03.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:32:39 -0700 (PDT)
Message-ID: <b1458bc3-0449-4f0f-b346-d25547dd4c97@linaro.org>
Date: Wed, 22 Apr 2026 11:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
 vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com,
 mochs@nvidia.com, nirmoyd@nvidia.com, skelley@nvidia.com
References: <20260421203856.3539186-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260421203856.3539186-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_033243_000740_D4F7CACD 
X-CRM114-Status: GOOD (  31.70  )
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



On 21/04/2026 21:38, Besar Wicaksono wrote:
> The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
> in WFI/WFE, which does not align with counting CPU_CYCLES
> on a programmable counter. Add a MIDR range entry and
> refuse PMCCNTR_EL0 for cycle events on affected parts so
> perf does not mix the two behaviors.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> 
> Changes from v1:
>    * add CONFIG_ARM64 check to fix build error found by kernel test robot
>    * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
> 
> ---
>   drivers/perf/arm_pmuv3.c | 44 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..7c39d0804b9f 100644
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
> @@ -978,6 +979,41 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
>   	return -EAGAIN;
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
>   static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   				     struct perf_event *event)
>   {
> @@ -1011,6 +1047,14 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   	if (cpu_pmu->has_smt)
>   		return false;
>   
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	if (armv8pmu_is_in_avoid_pmccntr_cpus())
> +		return false;
> +

Hi Besar,

This is called from armpmu_event_init() before the event is scheduled on 
the CPU so I don't think reading the MIDR at this point is safe.

When the PMU is probed you probably need to do an SMP call to get the 
MIDR of CPUs in that PMU's mask and then cache the "avoid pmccntr" 
result like has_smt. Or even rename has_smt to avoid_pmccntr and combine 
the two results there.

I don't know what will happen if none of those CPUs are online when the 
PMU is probed though...

James



>   	return true;
>   }
>   


