Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io057bIA1RUjGfxGquNULf6S18LI4Q4i5+vh/VQlANg=; b=id3W0r3bbZOmYN+zyccTN3VxoM
	Y4Iz8xdChvM46vJbcSJ4coU9DiaEZapE99vNggNrg86Shre4VpFAITBzvY8n04pdVOpZjTYfftcF0
	yYNwJJVz4KPlJrWWTIuRNNvP2MUbySRzuKOgLHIX79Mm9eHahRjYVqFw0dsU6UXl+rq53XfK+8Xlt
	YMziSL+RCXArAQPxXX579p4V5854Wh8j1keJPPLqdxLzKnZQI7jjf/d+UJX6s00c50QyuCu9z1OCl
	l0KlLWzOaulRvohCrVBvyeA1hxSv+Q2AwhzP0Z5ysrfkzX6EO6q3fY51VOf4/VBWiUZ7PAxwTnUqb
	d5JJ1tIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlV4-0000000AQ4d-0Thn;
	Mon, 23 Dec 2024 16:41:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlTo-0000000APsV-2YAr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 16:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=io057bIA1RUjGfxGquNULf6S18LI4Q4i5+vh/VQlANg=; b=nSB12XINu8Z3eOfDMF8rCbvrKH
	EpDUHemO62/Bgya8gqDBXTA3IIpk0wtVQPGuzhnw/cXNLKMdnmeTTIh6C4Q7YDgo2xt8kG0RUdj8/
	qxttFoS5EsdZxC1miuAsDexQx1h7MI6zJly9F3hoJ2txWgybxoXVF+WazWW6qK4sweejVdCLg9gr5
	rI8/CzkWJNAe/eZyrLmbZrIedU8sugnh48q6YH11Jt5lItmGDpoj5zs6+Dx5uvYbeQxPI6RG4kPnv
	aK11p7YGGhnp4Szeb0goo/Qw/pQ1t3vnimPy0uEC9Y3iumLMHlsGcor1ojVTqUQRIDd/fsRdMF+0D
	9UdGx4mQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlTj-00000006QGX-3MgD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:40:25 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3Z33SpPz6K5pZ;
	Tue, 24 Dec 2024 00:36:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F2DD3140B2F;
	Tue, 24 Dec 2024 00:40:17 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:40:16 +0100
Date: Mon, 23 Dec 2024 16:40:14 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v10 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <20241223164014.000032cc@huawei.com>
In-Reply-To: <20241220075313.51502-4-yangyicong@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-4-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_164024_102673_D679A530 
X-CRM114-Status: GOOD (  34.59  )
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

On Fri, 20 Dec 2024 15:53:12 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> For ACPI we'll build the topology from PPTT and we cannot directly
> get the SMT number of each core. Instead using a temporary xarray
> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
> and SMT information of the first core in its heterogeneous CPU cluster
> when building the topology. Then we can know the largest SMT number
> in the system. If a homogeneous system's using ACPI 6.2 or later,
> all the CPUs should be under the root node of PPTT. There'll be
> only one entry in the xarray and all the CPUs in the system will
> be assumed identical.
> 
> The core's SMT control provides two interface to the users [1]:
> 1) enable/disable SMT by writing on/off
> 2) enable/disable SMT by writing thread number 1/max_thread_number
> 
> If a system have more than one SMT thread number the 2) may
> not handle it well, since there're multiple thread numbers in the
> system and 2) only accept 1/max_thread_number. So issue a warning
> to notify the users if such system detected.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

A few trivial things inline.  Either way it's fine as really just my style
preferences

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..85cb18d72a29 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -15,8 +15,10 @@
>  #include <linux/arch_topology.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/init.h>
>  #include <linux/percpu.h>
> +#include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
> @@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>  	return !!is_threaded;
>  }
>  
> +struct cpu_smt_info {
> +	int thread_num;
> +	int core_id;
> +};
> +
>  /*
>   * Propagate the topology information of the processor_topology_node tree to the
>   * cpu_topology array.
>   */
>  int __init parse_acpi_topology(void)
>  {
> +	int max_smt_thread_num = 0;
> +	struct cpu_smt_info *entry;
> +	struct xarray hetero_cpu;
> +	unsigned long hetero_id;
>  	int cpu, topology_id;
>  
>  	if (acpi_disabled)
>  		return 0;
>  
> +	xa_init(&hetero_cpu);
> +
>  	for_each_possible_cpu(cpu) {
>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>  		if (topology_id < 0)
> @@ -57,6 +70,32 @@ int __init parse_acpi_topology(void)
>  			cpu_topology[cpu].thread_id = topology_id;
>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>  			cpu_topology[cpu].core_id   = topology_id;
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
> +			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);

Given xa_load returns a void *,

			entry = xa_load(&hetero_cpu, hetero_id);

should be fine (I haven't checked local style, so feel free to ignore if
local style is to cast anyway).  Maybe drag the definition of entry into
a more local scope as well.


> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				WARN_ON(!entry);
> +
> +				entry->core_id = topology_id;
> +				entry->thread_num = 1;
> +				xa_store(&hetero_cpu, hetero_id,
> +					 entry, GFP_KERNEL);
> +			} else if (entry->core_id == topology_id) {
> +				entry->thread_num++;
> +			}
>  		} else {
>  			cpu_topology[cpu].thread_id  = -1;
>  			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +106,33 @@ int __init parse_acpi_topology(void)
>  		cpu_topology[cpu].package_id = topology_id;
>  	}
>  
> +	/*
> +	 * This should be a short loop depending on the number of heterogeneous
> +	 * CPU clusters. Typically on a homogeneous system there's only one
> +	 * entry in the XArray.
> +	 */
> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
> +		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
> +			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
> +		if (entry->thread_num > max_smt_thread_num)
> +			max_smt_thread_num = entry->thread_num;

As with DT, maybe min is more informative?

		max_smt_thread_num = min(max_smt_thread_num, entry->thread_num);

I don't care strongly about it though.
> +
> +		xa_erase(&hetero_cpu, hetero_id);
> +		kfree(entry);
> +	}
> +
> +	/*
> +	 * Notify the CPU framework of the SMT support. Initialize the
> +	 * max_smt_thread_num to 1 if no SMT support detected. A thread
> +	 * number of 1 can be handled by the framework so we don't need
> +	 * to check max_smt_thread_num to see we support SMT or not.
> +	 */
> +	if (!max_smt_thread_num)
> +		max_smt_thread_num = 1;
> +
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	xa_destroy(&hetero_cpu);
>  	return 0;
>  }
>  #endif


