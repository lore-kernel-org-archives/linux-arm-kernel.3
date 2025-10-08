Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680D3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Qjfa07xpfRJoAOuSmQvWkQhBubuU+eaKhSs6ZaJ8nA=; b=wYxQ4SguznpjYV00vvgOS+4enp
	DhIjzrPAlpvzX48QltFc8HqbXpLhJgOAZXZGeEoqZhGfeNWANAuZ4Xoa0iKQ2Rq68NF/xn40Xm1Fj
	qoFVW3dB9X2GlN3F+OIasH5l3rV4nsdUhOAmUrd/EvnJF/MiVxoTFyCANy1xFUFroFgwDQF2Lfaog
	jtMRxosLQzOAdT5ht4jmtuLqNOgc4mMj4Nc75F42EGvClH7saL9Uoeb6vvhTUuCToFUTmXp4uWWtH
	sTYmiX10x46zsRMX2qPQji99/sdByFImd4j3exROiCEZb7cesUxsb4RDDd5Zsn1nt48ecpOeoJ3j4
	QKMB5g5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XIn-00000004KgP-16CJ;
	Wed, 08 Oct 2025 16:46:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XIg-00000004KeK-28rX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 16:46:07 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4chf1r1fCvz6839B;
	Thu,  9 Oct 2025 00:42:40 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CCB61400D9;
	Thu,  9 Oct 2025 00:45:59 +0800 (CST)
Received: from localhost (10.122.19.247) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 8 Oct
 2025 17:45:54 +0100
Date: Wed, 8 Oct 2025 17:45:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <dan.j.williams@intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, "Yicong Yang" <yangyicong@huawei.com>,
	<linuxarm@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v3 3/8] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20251008174551.00000e95@huawei.com>
In-Reply-To: <68bf43b1dd06f_75e3100ed@dwillia2-mobl4.notmuch>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
	<20250820102950.175065-4-Jonathan.Cameron@huawei.com>
	<68bf43b1dd06f_75e3100ed@dwillia2-mobl4.notmuch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_094602_860574_D3EFA4B0 
X-CRM114-Status: GOOD (  50.73  )
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

On Mon, 8 Sep 2025 13:59:29 -0700
dan.j.williams@intel.com wrote:

> Jonathan Cameron wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION provides the mechanism for
> > invalidating certain memory regions in a cache-incoherent manner. Currently
> > this is used by NVDIMM and CXL memory drivers in cases where it is
> > necessary to flush all data from caches by physical address range.
> > 
> > In some architectures these operations are supported by system components
> > that may become available only later in boot as they are either present
> > on a discoverable bus, or via a firmware description of an MMIO interface
> > (e.g. ACPI DSDT). Provide a framework to handle this case.
> > 
> > Architectures can opt in for this support via
> > CONFIG_GENERIC_CPU_CACHE_MAINTENANCE
> > 
> > Add a registration framework. Each driver provides an ops structure and
> > the first op is Write Back and Invalidate by PA Range. The driver may
> > over invalidate.
> > 
> > An optional completion check operation is also provided. If present
> > that should be called to ensure that the action has finished.
> > 
> > When multiple agents are present in the system each should register with
> > this framework and the core code will issue the invalidate to all of them
> > before checking for completion on each. This is done to avoid need for
> > filtering in the core code which can become complex when interleave,
> > potentially across different cache coherency hardware is going on, so it
> > is easier to tell everyone and let those who don't care do nothing.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> > v3: Squash all the layering from v2 so that the infrastucture is
> >     always present.
> >     Suggestions on naming welcome. Note that the hardware I have
> >     available supports a much richer set of maintenance operations
> >     than Write Back and Invalidate, so I'd like a name that
> >     covers all resonable maintenance operations.
> >     Use an allocation wrapper macro, based on the fwctl one to
> >     ensure that the first element of the allocated driver structure
> >     is a struct cache_coherency_device.
> >     Thanks to all who provided feedback.
> > ---
> >  include/linux/cache_coherency.h |  57 ++++++++++++++
> >  lib/Kconfig                     |   3 +
> >  lib/Makefile                    |   2 +
> >  lib/cache_maint.c               | 128 ++++++++++++++++++++++++++++++++
> >  4 files changed, 190 insertions(+)
> > 
> > diff --git a/include/linux/cache_coherency.h b/include/linux/cache_coherency.h
> > new file mode 100644
> > index 000000000000..cb195b17b6e6
> > --- /dev/null
> > +++ b/include/linux/cache_coherency.h
> > @@ -0,0 +1,57 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Cache coherency maintenace operation device drivers
> > + *
> > + * Copyright Huawei 2025
> > + */
> > +#ifndef _LINUX_CACHE_COHERENCY_H_
> > +#define _LINUX_CACHE_COHERENCY_H_
> > +
> > +#include <linux/list.h>
> > +#include <linux/types.h>
> > +
> > +struct cc_inval_params {
> > +	phys_addr_t addr;
> > +	size_t size;
> > +};
> > +
> > +struct cache_coherency_device;
> > +
> > +struct coherency_ops {
> > +	int (*wbinv)(struct cache_coherency_device *ccd, struct cc_inval_params *invp);
> > +	int (*done)(struct cache_coherency_device *ccd);
> > +};
> > +
> > +struct cache_coherency_device {
> > +	struct list_head node;
> > +	const struct coherency_ops *ops;
> > +};  
> 
> Why is this called a device when there is no 'struct device'?
> 
> This is just 'cache_coherency_ops'.

That's fair. The device went away as Greg KH quite reasonably didn't like the
idea of a struct device with no userspace ABI at all.

I'll change the various register / unregister to use terminology

cache_coherency_ops_instance_register() etc to make it clear it
isn't just a register one global set of ops.

> 
> Are you sure that this structure does not need something like "priority" or
> "level" indicator to know where the ops should be sorted in a list? Or is
> it the responsibility of the arch to make sure that the registration order
> of the ops structures follows the hierarchy order of the caches?

For all known implementations where we actually need this (so hosts with CXL
or similar) the implementation is in a device somewhere on the coherency fabric
that is capable of causing appropriate invalidation messages to be issued
to all caches to the point where it knows that it there are no copies in
the wrong state anywhere. In a simple model an offload agent has grabbed
exclusive ownership of the line and written the content to memory.

The multiple 'device' support is about different cachelines being the
responsibility of different cache flushing 'devices' (interleave, multiple
sockets etc), not a single line being flushed from different places.

The PSCI spec alpha (that never went further) did allow for a case where a
complex timing dance was needed but IIRC even that didn't assume an ordering
constraint across the various devices.  It envisioned a stop world situation
where all fetches were disabled until the line was definitely flushed by everyone.
Thankfully we don't know of any implementation that needs that.

We might need to extend things in future, but for now no ordering needed.

> > diff --git a/lib/cache_maint.c b/lib/cache_maint.c
> > new file mode 100644
> > index 000000000000..05d9c5e99941
> > --- /dev/null
> > +++ b/lib/cache_maint.c
> > @@ -0,0 +1,128 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Generic support for Memory System Cache Maintenance operations.
> > + *
> > + * Coherency maintenance drivers register with this simple framework that will
> > + * iterate over each registered instance to first kick off invalidation and
> > + * then to wait until it is complete.
> > + *
> > + * If no implementations are registered yet cpu_cache_has_invalidate_memregion()
> > + * will return false. If this runs concurrently with unregistration then a
> > + * race exists but this is no worse than the case where the device responsible
> > + * for a given memory region has not yet registered.
> > + */
> > +#include <linux/cache_coherency.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/container_of.h>
> > +#include <linux/export.h>
> > +#include <linux/list.h>
> > +#include <linux/memregion.h>
> > +#include <linux/module.h>
> > +#include <linux/rwsem.h>
> > +#include <linux/slab.h>
> > +
> > +static LIST_HEAD(cache_device_list);
> > +static DECLARE_RWSEM(cache_device_list_lock);
> > +
> > +void cache_coherency_device_free(struct cache_coherency_device *ccd)
> > +{
> > +	kfree(ccd);
> > +}
> > +EXPORT_SYMBOL_GPL(cache_coherency_device_free);  
> 
> Why do you need a new GPL export wrapper for kfree?
As per your other comment this will become a kref_put() I think.
> 


