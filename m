Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0310CD6DDEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRtzmlccasa7Hu/4D4OE6W+/y6D5y+JpS1Xr5TH/Puo=; b=lB2vRyMVP1tCLhWnMsTmush+ZA
	wkKkPKwtIlAdMXtE6FqPow8ccQF+k2bzN//xtiZ3IpJB9gmwSpAmlxGUblyvm9AzzcRmB8LuvQTdP
	iqmx5Q5/3WFiHf1VY3mrPcpCBDMS98jT2hJbU832rEvbAp2I4C+vsw/OTl3p/hlVXwZY1jGEBqHns
	+e0yvDP4Dl0mq1sJQ4m/XhXQe6uRKCUSU9q5UcLLJzYI+bAObHQ7brd9l8fk59PJKPf8XyflKWU/z
	g1B9N9vCE7iUdOtONlbzSqgfwG6Q64puwizHn/KEuQqEITxuG1ml1kNNBKbURKSbJjkoMoIbFD+qc
	ZO4Vy8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsrb-00000002EQN-19IY;
	Fri, 15 Nov 2024 09:43:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsqf-00000002EHr-32EM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:42:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 034591476;
	Fri, 15 Nov 2024 01:43:09 -0800 (PST)
Received: from [10.34.125.21] (unknown [10.34.125.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 069423F66E;
	Fri, 15 Nov 2024 01:42:33 -0800 (PST)
Message-ID: <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
Date: Fri, 15 Nov 2024 10:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com, x86@kernel.org,
 bp@alien8.de, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 mpe@ellerman.id.au, peterz@infradead.org, tglx@linutronix.de,
 sudeep.holla@arm.com, catalin.marinas@arm.com, will@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, dave.hansen@linux.intel.com
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20241114141127.23232-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_014241_850789_C8BA0C29 
X-CRM114-Status: GOOD (  26.93  )
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

Hello Yicong,


On 11/14/24 15:11, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently if architectures want to support HOTPLUG_SMT they need to
> provide a topology_is_primary_thread() telling the framework which
> thread in the SMT cannot offline. However arm64 doesn't have a
> restriction on which thread in the SMT cannot offline, a simplest
> choice is that just make 1st thread as the "primary" thread. So
> just make this as the default implementation in the framework and
> let architectures like x86 that have special primary thread to
> override this function (which they've already done).
> 
> There's no need to provide a stub function if !CONFIG_SMP or
> !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
> the 1st CPU in the SMT so it's always the primary thread.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/powerpc/include/asm/topology.h |  1 +
>   arch/x86/include/asm/topology.h     |  2 +-
>   include/linux/topology.h            | 20 ++++++++++++++++++++
>   3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 16bacfe8c7a2..da15b5efe807 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>   {
>   	return cpu == cpu_first_thread_sibling(cpu);
>   }
> +#define topology_is_primary_thread topology_is_primary_thread
>   
>   static inline bool topology_smt_thread_allowed(unsigned int cpu)
>   {
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index 92f3664dd933..d84d9b6d8678 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -219,11 +219,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>   {
>   	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>   }
> +#define topology_is_primary_thread topology_is_primary_thread
>   
>   #else /* CONFIG_SMP */
>   static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>   static inline int topology_max_smt_threads(void) { return 1; }
> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>   static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>   #endif /* !CONFIG_SMP */
>   
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..b8e860276518 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>   }
>   #endif
>   
> +#ifndef topology_is_primary_thread
> +
> +#define topology_is_primary_thread topology_is_primary_thread
> +
> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
> +	 * Architectures do have a special primary thread (e.g. x86) need
> +	 * to override this function. Otherwise just make the first thread
> +	 * in the SMT as the primary thread.
> +	 *
> +	 * The sibling cpumask of an offline CPU contains always the CPU
> +	 * itself.

As Thomas suggested, would it be possible to check it for other
architectures ?
For instance for loongarch at arch/loongarch/kernel/smp.c,
clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
to be empty and cpu_bootable() return false if the CPU never booted before.

Personal note:
cpu_bootable() is called from an already online CPU:
cpu_bootable (kernel/cpu.c:678)
cpu_up (kernel/cpu.c:1722 kernel/cpu.c:1702)
bringup_nonboot_cpus (kernel/cpu.c:1793 kernel/cpu.c:1901)
smp_init (./include/linux/bitmap.h:445 ./include/linux/nodemask.h:241 ./include/linux/nodemask.h:438 kernel/smp.c:1011)
kernel_init_freeable (init/main.c:1573)
kernel_init (init/main.c:1473)
ret_from_fork (arch/arm64/kernel/entry.S:861)

store_cpu_topology() for arm64 is called from the booting CPU:
store_cpu_topology (drivers/base/arch_topology.c:921)
secondary_start_kernel (arch/arm64/kernel/smp.c:251)
__secondary_switched (arch/arm64/kernel/head.S:418)

> +	 */
> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
> +}
> +
> +#endif
> +
>   static inline const struct cpumask *cpu_cpu_mask(int cpu)
>   {
>   	return cpumask_of_node(cpu_to_node(cpu));

