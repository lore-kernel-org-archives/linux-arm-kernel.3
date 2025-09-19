Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC08CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efWrKekSZo/eJXnCm5TKFFppLrnjYt7ck+Ulb4ogefo=; b=jWiOrxnlzhiwcNysZFMWSqkMAR
	kGKl1vmaAAzNrFtPs+m4c3yT/Q3vAFfRAYs9nFzz/r4CV1lbFuRl81NEM4wpHzD4x1vtuV4a325jP
	EHWpsCtsGEVJBhfq2q9/UT4MH+QeV9Y9EPZ2mhZbVyf2+jmoKQPKpOF70QawGbuQzp2A3pllnf3T+
	wTEa2oulQxaPJibNaOvgLmao2/TupJVyLqa0q9W4bp1Gb+MilqCjukiiGkvUbHiLt9zg5/MWz/iax
	NbXMjNMOVBXMOmHvrGyqb6m05z5CjpeEuaQuSIRfrV6IRaBq5Doba7KzAIku6MKZsWw8CVQBiFEYC
	waWajIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbjO-000000034GA-3drM;
	Fri, 19 Sep 2025 14:04:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbjL-000000034Fh-3dK9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:04:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43FC1169C;
	Fri, 19 Sep 2025 07:04:47 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0FC3F673;
	Fri, 19 Sep 2025 07:04:53 -0700 (PDT)
Date: Fri, 19 Sep 2025 15:04:50 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, beata.michalska@arm.com,
	ptsm@linux.microsoft.com, sumitg@nvidia.com,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arch_topology: move parse_acpi_topology() to
 common code
Message-ID: <20250919-colossal-splendid-bettong-e5a0bd@sudeepholla>
References: <20250919085918.5442-1-cuiyunhui@bytedance.com>
 <20250919085918.5442-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919085918.5442-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_070455_980388_236ADEB0 
X-CRM114-Status: GOOD (  28.20  )
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

On Fri, Sep 19, 2025 at 04:59:18PM +0800, Yunhui Cui wrote:
> Currently, RISC-V lacks arch-specific registers for CPU topology
> properties and must get them from ACPI. Thus, parse_acpi_topology()
> is moved from arm64/ to drivers/ for RISC-V reuse.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/arm64/kernel/topology.c  | 87 +---------------------------------
>  drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++-
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 90 insertions(+), 87 deletions(-)
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
> index 1037169abb459..09f77fd549490 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -823,12 +823,99 @@ void remove_cpu_topology(unsigned int cpu)
>  	clear_cpu_topology(cpu);
>  }
>  
> +__weak bool __init acpi_cpu_is_threaded(int cpu)
> +{
> +	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
> +

Just thinking if it makes sense keep acpi_cpu_is_threaded generic without
the need for weak definition.

Additional note: not sure why you haven't moved this under CONFIG_ARM64/RISCV as
done with other code.

bool __init acpi_cpu_is_threaded(int cpu)
{
        int is_threaded = acpi_pptt_cpu_is_thread(cpu);

        /*
         * if the PPTT doesn't have thread information, check for architecture
	 * specific fallback if available
	 */
        if (is_threaded < 0)
                is_threaded = arch_cpu_is_threaded();

        return !!is_threaded;
}

Then you can just have the define in

#define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMASK)

in arch/arm64/include/asm/topology.h

and

+#ifndef arch_cpu_is_threaded
+#define arch_cpu_is_threaded           (0)
+#endif

in include/linux/arch_topology.h

Thoughts ?

-- 
Regards,
Sudeep

