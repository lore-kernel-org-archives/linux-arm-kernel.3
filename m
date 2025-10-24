Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D9CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhw+3uyt8HSw+DQepyxp0VsaFLCqiYPLpFpWsLoqwEA=; b=Rn+aq9/j4JL9eFurvR5sE4l8cR
	+c9OL0d4wkNhjFGhxWOlzO7LSIUuKviXI8v6rM2/Cz+xdgGUq/PUxGEKhLrZnC9xY3tj571aCbeos
	jrm5uc1fEZ5+Zyn/Zj1mVCObCi8srJTVDKYserXZ/YBSn7OEPA1WzHEOT+xc5jOR+G1DCifTA7MLV
	K3iCxZ/dyFBDHP/S/3OKwYIV6K7xv4LWS6m9wQ2Skn07Q9Pvhz0Za94s7Um5WbM8X6sZ33V0B5pla
	ECt5mcB/qix5fyLlGJ9j0qKuT8txxaaYLaqjEoKsaDbIh81qJNdNcwq3PDUwQx17XSJxcOHHxS0Ac
	IgxrQ3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIh6-00000009eRW-2L6C;
	Fri, 24 Oct 2025 14:23:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIh4-00000009eQm-1xmt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:23:03 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctQ5T0ylQz6GDFX;
	Fri, 24 Oct 2025 22:19:41 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 95D0314014C;
	Fri, 24 Oct 2025 22:22:59 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 15:22:58 +0100
Date: Fri, 24 Oct 2025 15:22:56 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Jeremy Linton <jeremy.linton@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>, "D
 Scott Phillips OS" <scott@os.amperecomputing.com>,
	<carl@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, "Xin
 Hao" <xhao@linux.alibaba.com>, <peternewman@google.com>,
	<dfustini@baylibre.com>, <amitsinght@marvell.com>, David Hildenbrand
	<david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 04/29] ACPI / PPTT: Add a helper to fill a cpumask
 from a cache_id
Message-ID: <20251024152256.00003f8e@huawei.com>
In-Reply-To: <50a8cc38-810b-4bea-9a73-2463a6160b9f@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-5-james.morse@arm.com>
	<50a8cc38-810b-4bea-9a73-2463a6160b9f@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_072302_795990_DFE3102A 
X-CRM114-Status: GOOD (  34.66  )
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

On Wed, 22 Oct 2025 07:58:36 -0500
Jeremy Linton <jeremy.linton@arm.com> wrote:

> Hi,
> 
> This is largely looking pretty solid, but..
> 
> 
> On 10/17/25 1:56 PM, James Morse wrote:
> > MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> > 
> > The driver needs to know which CPUs are associated with the cache.
> > The CPUs may not all be online, so cacheinfo does not have the
> > information.
> > 
> > Add a helper to pull this information out of the PPTT.
> > 
> > CC: Rohit Mathew <Rohit.Mathew@arm.com>
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> > ---
> > Changes since v2:
> >   * Removed stray cleanup useage in preference for acpi_get_pptt().
> >   * Removed WARN_ON_ONCE() for symmetry with other helpers.
> >   * Dropped restriction on unified caches.
> > 
> > Changes since v1:
> >   * Added punctuation to the commit message.
> >   * Removed a comment about an alternative implementaion.
> >   * Made the loop continue with a warning if a CPU is missing from the PPTT.
> > 
> > Changes since RFC:
> >   * acpi_count_levels() now returns a value.
> >   * Converted the table-get stuff to use Jonathan's cleanup helper.
> >   * Dropped Sudeep's Review tag due to the cleanup change.
> > ---
> >   drivers/acpi/pptt.c  | 64 ++++++++++++++++++++++++++++++++++++++++++++
> >   include/linux/acpi.h |  6 +++++
> >   2 files changed, 70 insertions(+)
> > 
> > diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> > index 50c8f2a3c927..2f86f58699a6 100644
> > --- a/drivers/acpi/pptt.c
> > +++ b/drivers/acpi/pptt.c
> > @@ -985,3 +985,67 @@ int find_acpi_cache_level_from_id(u32 cache_id)
> >   
> >   	return -ENOENT;
> >   }
> > +
> > +/**
> > + * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
> > + *					   specified cache
> > + * @cache_id: The id field of the cache
> > + * @cpus: Where to build the cpumask
> > + *
> > + * Determine which CPUs are below this cache in the PPTT. This allows the property
> > + * to be found even if the CPUs are offline.
> > + *
> > + * The PPTT table must be rev 3 or later,
> > + *
> > + * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
> > + * Otherwise returns 0 and sets the cpus in the provided cpumask.
> > + */
> > +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
> > +{
> > +	int level, cpu;
> > +	u32 acpi_cpu_id;
> > +	struct acpi_pptt_cache *cache;
> > +	struct acpi_table_header *table;
> > +	struct acpi_pptt_cache_v1 *cache_v1;
> > +	struct acpi_pptt_processor *cpu_node;
> > +
> > +	cpumask_clear(cpus);
> > +
> > +	table = acpi_get_pptt();
> > +	if (!table)
> > +		return -ENOENT;
> > +
> > +	if (table->revision < 3)
> > +		return -ENOENT;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> > +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> > +		if (!cpu_node)
> > +			continue;
> > +
> > +		/* Start at 1 for L1 */
> > +		level = 1;
> > +		cache = acpi_find_any_type_cache_node(table, acpi_cpu_id, level,
> > +						      &cpu_node);
> > +		while (cache) {
> > +			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> > +						cache, sizeof(*cache));  
> 
> Is the core acpi definition in actbl2.h correct? Shouldn't it be 
> something along the lines of:
> 
> struct acpi_pptt_cache_v1 {
>   struct acpi_subtable_header header;
>   u16 reservedd;
>   u32 flags;
>   u32 next_level_of_cache;
>   u32 size;
>   u32 number_of_sets;
>   u8 associativity;
>   u8 attributes;
>   u16 lines_size;
>   u32 cache_id;
> }
> 
> 
> Then that solves the detection of the additional field problem correctly 
> because the length (24 vs 28) of the subtable then tells you which 
> version your dealing with. (and goes back to why much of this is coded 
> to use ACPI_ADD_PTR rather than structure+ logic.)
> 

Do we want to deal with arguing the change in ACPICA? 
I fully agree that it would be much nicer if that didn't use this weird
bits of structures approach :(  

https://github.com/acpica/acpica/blob/master/source/include/actbl2.h#L3497
is where this is coming from.

Maybe can do it in parallel. Rafael, what do you think is best way forwards
with this?

Jonathan

> 
> Thanks,
> 
> 
> 
> 
> 
> 
> > +			if (!cache)
> > +				continue;
> > +
> > +			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> > +						cache, sizeof(*cache));
> > +
> > +			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
> > +			    cache_v1->cache_id == cache_id)
> > +				cpumask_set_cpu(cpu, cpus);
> > +
> > +			level++;
> > +			cache = acpi_find_any_type_cache_node(table, acpi_cpu_id,
> > +							      level, &cpu_node);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index be074bdfd4d1..a9dbacabdf89 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -1543,6 +1543,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu);
> >   int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
> >   void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
> >   int find_acpi_cache_level_from_id(u32 cache_id);
> > +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
> >   #else
> >   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
> >   {
> > @@ -1570,6 +1571,11 @@ static inline int find_acpi_cache_level_from_id(u32 cache_id)
> >   {
> >   	return -ENOENT;
> >   }
> > +static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
> > +						      cpumask_t *cpus)
> > +{
> > +	return -ENOENT;
> > +}
> >   #endif
> >   
> >   void acpi_arch_init(void);  
> 
> 


