Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25557CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrlnYr2OGNH8FyWe+gS7yC2hjzo4JeU2FJJhE5PNXkY=; b=Tss8zvR/upEQZFUVLs91rtatTB
	mKm8qkzGG6WCaZQgFuRU7vjMaHvjEVYDD632WDi7BXC8CaGBPfaRpvWl4UogL5iwBven60SEJ9k2k
	npE7/jeI6sid70aMS/7Hmw/67qSGXrHkhnOSEjV/byuweMRz9jKsQ/aSh9AKLfdE3VzaKkSISOcV+
	axyeh03RaVHjr6i2KzCECNprbw00/Ss9bco5/ZPN1IS6wxzfHmVwITTUmOdD3Q+NoFgqNAy9tvGnE
	EH5WCptXWZvxaPpmapSLXndf3U2qmg31ac5D3FFnb09iDqki5pBzGNaZLCnx8UMprPJU+X0X96CAB
	rqrKgkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVJK-00000005sRf-1Irk;
	Mon, 10 Nov 2025 17:04:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVJH-00000005sRA-2NkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:04:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF422B;
	Mon, 10 Nov 2025 09:03:58 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8ADF43F66E;
	Mon, 10 Nov 2025 09:04:01 -0800 (PST)
Date: Mon, 10 Nov 2025 18:04:04 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Bowen Yu <yubowen8@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, ptsm@linux.microsoft.com,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
	wanghuiqiang@huawei.com, xuwei5@huawei.com, zhenglifeng1@huawei.com,
	zhangpengjie2@huawei.com
Subject: Re: [PATCH 1/3] arm64: topology: Improve AMU-based frequency
 calculation
Message-ID: <aRIbBBBl8mxd2rtC@arm.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
 <20251104075544.3243606-2-yubowen8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104075544.3243606-2-yubowen8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_090408_106250_ED900DDE 
X-CRM114-Status: GOOD (  21.97  )
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

On Tue, Nov 04, 2025 at 03:55:42PM +0800, Bowen Yu wrote:
> The current approach of reverse-calculating CPU frequency from capacity
> values introduces quantization errors due to intermediate scaling of
> arch_scale_freq_capacity, which results in the calculated frequency having
> only 1/1024 resolution.
> 
> This patch:
> 1. Directly computes frequency using AMU counters in amu_scale_freq_tick():
> freq = (core_cycles_delta * timer_freq) / (const_cycles_delta * 1000)
>  - core_cycles_delta: Measured CPU cycles
>  - timer_freq: Architectural timer frequency
>  - const_cycles_delta: Reference cycles from fixed-frequency timer
> 2. Returns pre-computed avgfreq in arch_freq_get_on_cpu()
> 
> examples:
> Before change
> [root@localhost ~]# cat /sys/devices/system/cpu/cpufreq/policy*/cpuinfo_avg_freq
> 2297851
> 2297851
> 2295312
> 2297851
> 2297851
> 2295312
> 2297851
> 2295312
> 2297851
> 2297851
> 2297851
> 2295312
> 2295312
> 2297851
> 2297851
> 2297851
> 2297851
> 2300390
> 2297851
> 2297851
> 2297851
> 
> After change
> [root@localhost ~]# cat /sys/devices/system/cpu/cpufreq/policy*/cpuinfo_avg_freq
> 2299177
> 2298117
> 2299188
> 2297330
> 2296530
> 2298817
> 2298434
> 2298986
> 2298596
> 2299395
> 2299560
> 2298446
> 2299108
> 2299294
> 2298707
> 2298453
> 2298632
> 2299218
> 2297962
Based on your numbers the shift is on average ~0.055–0.057%.
I'm not entirely convinced it is worth it, especially that this is an average
frequency. What is the use case here if < 0,2% makes a difference ?

---
BR
Beata
> 
> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae..c0dbc27289ea 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -20,6 +20,7 @@
>  #include <linux/percpu.h>
>  #include <linux/sched/isolation.h>
>  #include <linux/xarray.h>
> +#include <linux/units.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
> @@ -144,6 +145,8 @@ int __init parse_acpi_topology(void)
>   */
>  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
>  static cpumask_var_t amu_fie_cpus;
> +static DEFINE_PER_CPU(unsigned long, core_delta);
> +static DEFINE_PER_CPU(unsigned long, const_delta);
>  
>  struct amu_cntr_sample {
>  	u64		arch_const_cycles_prev;
> @@ -246,6 +249,7 @@ static void amu_scale_freq_tick(void)
>  	 * arch_max_freq_scale and the use of SCHED_CAPACITY_SHIFT.
>  	 */
>  	scale = core_cnt - prev_core_cnt;
> +	this_cpu_write(core_delta, scale);
>  	scale *= this_cpu_read(arch_max_freq_scale);
>  	scale = div64_u64(scale >> SCHED_CAPACITY_SHIFT,
>  			  const_cnt - prev_const_cnt);
> @@ -253,6 +257,7 @@ static void amu_scale_freq_tick(void)
>  	scale = min_t(unsigned long, scale, SCHED_CAPACITY_SCALE);
>  	this_cpu_write(arch_freq_scale, (unsigned long)scale);
>  
> +	this_cpu_write(const_delta, const_cnt - prev_const_cnt);
>  	amu_sample->last_scale_update = jiffies;
>  }
>  
> @@ -288,7 +293,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	unsigned int start_cpu = cpu;
>  	unsigned long last_update;
>  	unsigned int freq = 0;
> -	u64 scale;
> +	u64 delta_core_kHz;
>  
>  	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
>  		return -EOPNOTSUPP;
> @@ -340,14 +345,11 @@ int arch_freq_get_on_cpu(int cpu)
>  			break;
>  		}
>  	}
> -	/*
> -	 * Reversed computation to the one used to determine
> -	 * the arch_freq_scale value
> -	 * (see amu_scale_freq_tick for details)
> -	 */
> -	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +
> +	if (check_mul_overflow(per_cpu(core_delta, cpu), arch_timer_get_cntfrq(), &delta_core_kHz))
> +		return -EINVAL;
> +
> +	freq = div_u64(delta_core_kHz, per_cpu(const_delta, cpu) * HZ_PER_KHZ);
>  	return freq;
>  }
>  
> -- 
> 2.33.0
> 

