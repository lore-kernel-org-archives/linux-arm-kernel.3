Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E9ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIzwwgvG142Yx+70a4E+98vuNgPu9bfuo5e/Q7zM3o4=; b=sl9kTVqrinugNo6MUGktMcW48k
	IHEbJDonIf/0b4eWB6kYWcQLWhjcFzoorzpnllkMJIDoVVchVyr0bqGHSR7NZvfeMsedO9ZmYeHUm
	axxZVQp2l0ezl3GtNmWLwuD6+Y2/UUK/fxmV43RiYnpNHP3ZhIyTGzKp7gppwcFo//j8rBn8HtQGt
	/90yZczhlF1ZuwadIOauNhwTelfeqtF3rQveLfnXp+Ii6XqFpDJuNeXZLwzfDfnIZawCt0Y8IG4nY
	/6zOlA29b7WEweXABAs+vXWyMIP6hDBN2LdbQkHah1dNcEuXonXy4ZUz1iZ21ghTvERvwvsftHpGi
	waGjTiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweqz-00000002THu-4Aec;
	Thu, 11 Sep 2025 10:48:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweqw-00000002TGu-3rdt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:48:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cMvLq3F3rz6L5WM;
	Thu, 11 Sep 2025 18:44:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C88241402F5;
	Thu, 11 Sep 2025 18:48:32 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 11 Sep
 2025 12:48:31 +0200
Date: Thu, 11 Sep 2025 11:48:30 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 01/29] ACPI / PPTT: Add a helper to fill a cpumask
 from a processor container
Message-ID: <20250911114830.00002930@huawei.com>
In-Reply-To: <20250911114337.0000487e@huawei.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-2-james.morse@arm.com>
	<20250911114337.0000487e@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_034835_256339_B242F23B 
X-CRM114-Status: GOOD (  46.12  )
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

On Thu, 11 Sep 2025 11:43:37 +0100
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Wed, 10 Sep 2025 20:42:41 +0000
> James Morse <james.morse@arm.com> wrote:
> 
> > The ACPI MPAM table uses the UID of a processor container specified in
> > the PPTT to indicate the subset of CPUs and cache topology that can
> > access each MPAM System Component (MSC).
> > 
> > This information is not directly useful to the kernel. The equivalent
> > cpumask is needed instead.
> > 
> > Add a helper to find the processor container by its id, then walk
> > the possible CPUs to fill a cpumask with the CPUs that have this
> > processor container as a parent.
> > 
> > CC: Dave Martin <dave.martin@arm.com>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > Signed-off-by: James Morse <james.morse@arm.com>  
> 
> Hi James,
> 
> Sorry I missed v1.  Busy few weeks.
> 
> I think one resource leak plus a few suggested changes that
> I'm not that bothered about.
Ignore the resource leak. I didn't read acpi_get_pptt() properly.  No bug there.

So consider the comments below, but I'm fine with this as is.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> Jonathan
> 
> 
> > ---
> > Changes since v1:
> >  * Replaced commit message with wording from Dave.
> >  * Fixed a stray plural.
> >  * Moved further down in the file to make use of get_pptt() helper.
> >  * Added a break to exit the loop early.
> > 
> > Changes since RFC:
> >  * Removed leaf_flag local variable from acpi_pptt_get_cpus_from_container()
> > 
> > Changes since RFC:
> >  * Dropped has_leaf_flag dodging of acpi_pptt_leaf_node()
> >  * Added missing : in kernel-doc
> >  * Made helper return void as this never actually returns an error.
> > ---
> >  drivers/acpi/pptt.c  | 83 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/acpi.h |  3 ++
> >  2 files changed, 86 insertions(+)
> > 
> > diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> > index 54676e3d82dd..1728545d90b2 100644
> > --- a/drivers/acpi/pptt.c
> > +++ b/drivers/acpi/pptt.c
> > @@ -817,3 +817,86 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
> >  	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
> >  					  ACPI_PPTT_ACPI_IDENTICAL);
> >  }  
> 
> > +/**
> > + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
> > + *                                       processor container
> > + * @acpi_cpu_id:	The UID of the processor container.
> > + * @cpus:		The resulting CPU mask.
> > + *
> > + * Find the specified Processor Container, and fill @cpus with all the cpus
> > + * below it.
> > + *
> > + * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
> > + * Container, they may exist purely to describe a Private resource. CPUs
> > + * have to be leaves, so a Processor Container is a non-leaf that has the
> > + * 'ACPI Processor ID valid' flag set.
> > + *
> > + * Return: 0 for a complete walk, or an error if the mask is incomplete.
> > + */
> > +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
> > +{
> > +	struct acpi_pptt_processor *cpu_node;
> > +	struct acpi_table_header *table_hdr;
> > +	struct acpi_subtable_header *entry;
> > +	unsigned long table_end;
> > +	u32 proc_sz;
> > +
> > +	cpumask_clear(cpus);
> > +
> > +	table_hdr = acpi_get_pptt();  
> 
> This calls acpi_get_table() so you need to put it again or every call
> to this leaks a reference count.  I messed around with DEFINE_FREE() for this
> but it doesn't fit that well as the underlying call doesn't return the table.
> This one does though so you could do a pptt specific one.  
> 
> Or just acpi_put_table(table_hdr); at exit path from this function.
> 
> 
> > +	if (!table_hdr)
> > +		return;
> > +
> > +	table_end = (unsigned long)table_hdr + table_hdr->length;
> > +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
> > +			     sizeof(struct acpi_table_pptt));  
> Hmm. Not related to this patch but I have no idea why acpi_get_pptt()
> doesn't return a struct acpi_table_pptt as if it did this would be a simple
> + 1 and not require those who only sometimes deal with ACPI code to go
> check what that macro actually does!
> 
> 
> > +	proc_sz = sizeof(struct acpi_pptt_processor);  
> Maybe sizeof (*cpu_node) is more helpful to reader.
> Also shorter so you could do
> 	while ((unsigned long)entry + sizeof(*cpu_node) <= table_end)
> 
> > +	while ((unsigned long)entry + proc_sz <= table_end) {
> > +		cpu_node = (struct acpi_pptt_processor *)entry;  
> 
> For me, assigning this before checking the type is inelegant.
> but the nesting does get deep without it so I guess this is ok maybe, though
> I wonder if better reorganized to combine a different bunch of conditions.
> I think this is functionally identival.
> 
> 		if (entry->type == ACPI_PTT_TYPE_PROCESSOR) {
> 			struct acpi_pptt_processor *cpu_node = 
> 				(struct acpi_pptt_processor *)entry;
> 			if ((cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) &&
> 			    (!acpi_pptt_leaf_node(table_hdr, cpu_node) &&
> 			    (cpu_node->acpi_processor_id == acpi_cpu_id)) {
> 				acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> 				break;
> 		
> 			}
> 		}
> 		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
> 				     entry->length);
> 
> More generally I wonder if it is worth adding a for_each_acpi_pptt_entry() macro.
> There is some precedence in drivers acpi such as for_each_nhlt_endpoint()
> 
> That's probably material for another day though unless you think it brings
> enough benefits to do it here.
> 
> 
> > +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
> > +		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
> > +			if (!acpi_pptt_leaf_node(table_hdr, cpu_node)) {
> > +				if (cpu_node->acpi_processor_id == acpi_cpu_id) {
> > +					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> > +					break;
> > +				}
> > +			}
> > +		}
> > +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
> > +				     entry->length);
> > +	}
> > +}
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 1c5bb1e887cd..f97a9ff678cc 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
> >  int find_acpi_cpu_topology_cluster(unsigned int cpu);
> >  int find_acpi_cpu_topology_package(unsigned int cpu);
> >  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
> > +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
> >  #else
> >  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
> >  {
> > @@ -1562,6 +1563,8 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
> >  {
> >  	return -EINVAL;
> >  }
> > +static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
> > +						     cpumask_t *cpus) { }
> >  #endif
> >  
> >  void acpi_arch_init(void);  
> 


