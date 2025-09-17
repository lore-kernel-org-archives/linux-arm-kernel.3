Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE736CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOOn4WENZxp8nTHaDFBH5jDEWySuUUj5fymBHxHtSYU=; b=NHYZ8ro9iXGbbXMCT71WwyzYEO
	by4kmbfOJAfdNd7FQFyVDs8xBsDrCqT7Khq66/tlu7+RaZ0dQFX+HXGzUjE2d9yxd3xWHfb/go6Go
	TDwltmG1WBplKH+uHdn50cE2Qg1Xht2aYVUKviVa/4Oxz7BmXFeQaJT7KtxQm++ya5/imdHgFKZ3i
	ihN7CIvr4Gj+hgBwl+RLy+8Cl7P1Q0f2xcbva2g+I4/374SKgMStMliCmMpAf/J2Xm1/E2pIxtEpt
	is2B6ZlGfl8FrgEdJhz7SyXbaZA5J7DpL9ps/nRR9DeyBKdaWRffNoV6p2P8Pt/p3rvFn2rK0TO/X
	AirRWELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyltC-0000000AMk2-0R96;
	Wed, 17 Sep 2025 06:43:38 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylt8-0000000AMj8-21oi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 06:43:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cRTj40Rg4ztTWG;
	Wed, 17 Sep 2025 14:42:32 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0EAF5180B57;
	Wed, 17 Sep 2025 14:43:26 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Sep 2025 14:43:25 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Sep 2025 14:43:25 +0800
Subject: Re: [PATCH] arch_topology: move parse_acpi_topology() to common code
To: Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250917023007.97637-1-cuiyunhui@bytedance.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>, <dakr@kernel.org>,
	<beata.michalska@arm.com>, <sumitg@nvidia.com>, <ptsm@linux.microsoft.com>,
	<yangyicong@hisilicon.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8863bbfb-326e-1914-4f97-0cc59558a602@huawei.com>
Date: Wed, 17 Sep 2025 14:43:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250917023007.97637-1-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_234334_845454_CB6714E0 
X-CRM114-Status: GOOD (  31.39  )
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

On 2025/9/17 10:30, Yunhui Cui wrote:
> Currently, RISC-V lacks arch-specific registers for CPU topology
> properties and must get them from ACPI. Thus, parse_acpi_topology()
> is moved from arm64/ to drivers/ for RISC-V reuse.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/arm64/kernel/topology.c  | 87 +----------------------------------
>  drivers/base/arch_topology.c  | 85 +++++++++++++++++++++++++++++++++-
>  include/linux/arch_topology.h |  6 +++
>  3 files changed, 91 insertions(+), 87 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae4..55650db53b526 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -26,7 +26,7 @@
>  #include <asm/topology.h>
>  
>  #ifdef CONFIG_ACPI
> -static bool __init acpi_cpu_is_threaded(int cpu)
> +bool __init acpi_cpu_is_threaded(int cpu)
>  {
>  	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
>  
> @@ -39,91 +39,6 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>  
>  	return !!is_threaded;
>  }
> -
> -struct cpu_smt_info {
> -	unsigned int thread_num;
> -	int core_id;
> -};
> -
> -/*
> - * Propagate the topology information of the processor_topology_node tree to the
> - * cpu_topology array.
> - */
> -int __init parse_acpi_topology(void)
> -{
> -	unsigned int max_smt_thread_num = 1;
> -	struct cpu_smt_info *entry;
> -	struct xarray hetero_cpu;
> -	unsigned long hetero_id;
> -	int cpu, topology_id;
> -
> -	if (acpi_disabled)
> -		return 0;
> -
> -	xa_init(&hetero_cpu);
> -
> -	for_each_possible_cpu(cpu) {
> -		topology_id = find_acpi_cpu_topology(cpu, 0);
> -		if (topology_id < 0)
> -			return topology_id;
> -
> -		if (acpi_cpu_is_threaded(cpu)) {
> -			cpu_topology[cpu].thread_id = topology_id;
> -			topology_id = find_acpi_cpu_topology(cpu, 1);
> -			cpu_topology[cpu].core_id   = topology_id;
> -
> -			/*
> -			 * In the PPTT, CPUs below a node with the 'identical
> -			 * implementation' flag have the same number of threads.
> -			 * Count the number of threads for only one CPU (i.e.
> -			 * one core_id) among those with the same hetero_id.
> -			 * See the comment of find_acpi_cpu_topology_hetero_id()
> -			 * for more details.
> -			 *
> -			 * One entry is created for each node having:
> -			 * - the 'identical implementation' flag
> -			 * - its parent not having the flag
> -			 */
> -			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
> -			entry = xa_load(&hetero_cpu, hetero_id);
> -			if (!entry) {
> -				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> -				WARN_ON_ONCE(!entry);
> -
> -				if (entry) {
> -					entry->core_id = topology_id;
> -					entry->thread_num = 1;
> -					xa_store(&hetero_cpu, hetero_id,
> -						 entry, GFP_KERNEL);
> -				}
> -			} else if (entry->core_id == topology_id) {
> -				entry->thread_num++;
> -			}
> -		} else {
> -			cpu_topology[cpu].thread_id  = -1;
> -			cpu_topology[cpu].core_id    = topology_id;
> -		}
> -		topology_id = find_acpi_cpu_topology_cluster(cpu);
> -		cpu_topology[cpu].cluster_id = topology_id;
> -		topology_id = find_acpi_cpu_topology_package(cpu);
> -		cpu_topology[cpu].package_id = topology_id;
> -	}
> -
> -	/*
> -	 * This is a short loop since the number of XArray elements is the
> -	 * number of heterogeneous CPU clusters. On a homogeneous system
> -	 * there's only one entry in the XArray.
> -	 */
> -	xa_for_each(&hetero_cpu, hetero_id, entry) {
> -		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
> -		xa_erase(&hetero_cpu, hetero_id);
> -		kfree(entry);
> -	}
> -
> -	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> -	xa_destroy(&hetero_cpu);
> -	return 0;
> -}
>  #endif
>  
>  #ifdef CONFIG_ARM64_AMU_EXTN
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 1037169abb459..65ec1f3d2bd28 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -823,12 +823,95 @@ void remove_cpu_topology(unsigned int cpu)
>  	clear_cpu_topology(cpu);
>  }
>  
> +__weak bool __init acpi_cpu_is_threaded(int cpu)
> +{
> +	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
> +
> +	return !!is_threaded;
> +

acpi_pptt_cpu_is_thread() could return an error which shouldn't be
regarded as a threaded cpu.

> +}
> +
> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +/*
> + * Propagate the topology information of the processor_topology_node tree to the
> + * cpu_topology array.
> + */
>  __weak int __init parse_acpi_topology(void)
>  {
> +	unsigned int max_smt_thread_num = 1;
> +	struct cpu_smt_info *entry;
> +	struct xarray hetero_cpu;
> +	unsigned long hetero_id;
> +	int cpu, topology_id;
> +
> +	if (acpi_disabled)
> +		return 0;
> +
> +	xa_init(&hetero_cpu);
> +
> +	for_each_possible_cpu(cpu) {
> +		topology_id = find_acpi_cpu_topology(cpu, 0);
> +		if (topology_id < 0)
> +			return topology_id;
> +
> +		if (acpi_cpu_is_threaded(cpu)) {
> +			cpu_topology[cpu].thread_id = topology_id;
> +			topology_id = find_acpi_cpu_topology(cpu, 1);
> +			cpu_topology[cpu].core_id   = topology_id;
> +
> +			/*
> +			 * In the PPTT, CPUs below a node with the 'identical
> +			 * implementation' flag have the same number of threads.
> +			 * Count the number of threads for only one CPU (i.e.
> +			 * one core_id) among those with the same hetero_id.
> +			 * See the comment of find_acpi_cpu_topology_hetero_id()
> +			 * for more details.
> +			 *
> +			 * One entry is created for each node having:
> +			 * - the 'identical implementation' flag
> +			 * - its parent not having the flag
> +			 */
> +			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
> +			entry = xa_load(&hetero_cpu, hetero_id);
> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				WARN_ON_ONCE(!entry);
> +
> +				if (entry) {
> +					entry->core_id = topology_id;
> +					entry->thread_num = 1;
> +					xa_store(&hetero_cpu, hetero_id,
> +						 entry, GFP_KERNEL);
> +				}
> +			} else if (entry->core_id == topology_id) {
> +				entry->thread_num++;
> +			}
> +		} else {
> +			cpu_topology[cpu].thread_id  = -1;
> +			cpu_topology[cpu].core_id    = topology_id;
> +		}
> +		topology_id = find_acpi_cpu_topology_cluster(cpu);
> +		cpu_topology[cpu].cluster_id = topology_id;
> +		topology_id = find_acpi_cpu_topology_package(cpu);
> +		cpu_topology[cpu].package_id = topology_id;
> +	}
> +
> +	/*
> +	 * This is a short loop since the number of XArray elements is the
> +	 * number of heterogeneous CPU clusters. On a homogeneous system
> +	 * there's only one entry in the XArray.
> +	 */
> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
> +		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
> +		xa_erase(&hetero_cpu, hetero_id);
> +		kfree(entry);
> +	}
> +
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	xa_destroy(&hetero_cpu);
>  	return 0;
>  }
>  
> -#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>  void __init init_cpu_topology(void)
>  {
>  	int cpu, ret;
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index d72d6e5aa2002..50d33b5a78ccd 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -70,6 +70,11 @@ struct cpu_topology {
>  	cpumask_t llc_sibling;
>  };
>  
> +struct cpu_smt_info {
> +	unsigned int thread_num;
> +	int core_id;
> +};
> +

this is only used in parse_acpi_topology() and seems no reason to make it into
the header.

otherwise looks good to me. most acpi topology building code is not arm64
specific and make sense to make it common.

thanks.


