Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01398C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0a74CRDfle7fzEwfUGNPCxbgsBDZp3A3culNU1YvnU=; b=htFjTj2Y1KdOIC8ZajTAHQtgN7
	V1G40j+sddB9eJLIYePqO2+ToSZLT2eogYlNefRYgQ1MRQgahYlpSRbbj5WORJTb+iy6V8I0HBz1q
	wia3mvPI98rPFhi9DYMS7j8UgL3ieAp0qvqdFpjYHZZbB3Wpn+HU+iObt2fOlE30+Xc0y13q2nhZJ
	s2u/trSJeup7vj+gwFsnGkB6yAGGvyFHa1Nupcybz69uaFlLQuvbvkA+oZ7aBIdn3cKpsiuahMOvR
	0Jh8duHiWpaHzCOZQeLcJuff1/Cf54TC6CmqQ4adhy5TG7+dj4j8z3j7cOZkfIvDHcJ0Ex+cMSNMO
	VOkDRicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCbh-0000000EhYt-15JK;
	Fri, 11 Jul 2025 12:12:01 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCJo-0000000Efdd-3bxJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 11:53:34 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdqlT12Ykz6L53x;
	Fri, 11 Jul 2025 19:50:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F3E01400D3;
	Fri, 11 Jul 2025 19:53:31 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 13:53:30 +0200
Date: Fri, 11 Jul 2025 12:53:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "H. Peter Anvin" <hpa@zytor.com>
CC: <dan.j.williams@intel.com>, Catalin Marinas <catalin.marinas@arm.com>,
	<james.morse@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, "Yicong Yang" <yangyicong@huawei.com>,
	<linuxarm@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/8] generic: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20250711125328.00002334@huawei.com>
In-Reply-To: <C8F33767-6C7F-4CDA-8B78-6857AA771AD3@zytor.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
	<20250624154805.66985-3-Jonathan.Cameron@huawei.com>
	<686f565121ea5_1d3d100ee@dwillia2-xfh.jf.intel.com.notmuch>
	<C8F33767-6C7F-4CDA-8B78-6857AA771AD3@zytor.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_045333_209873_2E907554 
X-CRM114-Status: GOOD (  36.19  )
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

On Wed, 09 Jul 2025 23:01:50 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On July 9, 2025 10:57:37 PM PDT, dan.j.williams@intel.com wrote:
> >Jonathan Cameron wrote:  
> >> From: Yicong Yang <yangyicong@hisilicon.com>
> >> 
> >> ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION provides the mechanism for
> >> invalidate certain memory regions in a cache-incoherent manner.
> >> Currently is used by NVIDMM adn CXL memory. This is mainly done
> >> by the system component and is implementation define per spec.
> >> Provides a method for the platforms register their own invalidate
> >> method and implement ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION.  
> >
> >Please run spell-check on changelogs.
> >  
> >> 
> >> Architectures can opt in for this support via
> >> CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION.
> >> 
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> ---
> >>  drivers/base/Kconfig             |  3 +++
> >>  drivers/base/Makefile            |  1 +
> >>  drivers/base/cache.c             | 46 ++++++++++++++++++++++++++++++++  
> >
> >I do not understand what any of this has to do with drivers/base/.
> >
> >See existing cache management memcpy infrastructure in lib/Kconfig.
> >  
> >>  include/asm-generic/cacheflush.h | 12 +++++++++
> >>  4 files changed, 62 insertions(+)
> >> 
> >> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> >> index 064eb52ff7e2..cc6df87a0a96 100644
> >> --- a/drivers/base/Kconfig
> >> +++ b/drivers/base/Kconfig
> >> @@ -181,6 +181,9 @@ config SYS_HYPERVISOR
> >>  	bool
> >>  	default n
> >>  
> >> +config GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
> >> +	bool
> >> +
> >>  config GENERIC_CPU_DEVICES
> >>  	bool
> >>  	default n
> >> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> >> index 8074a10183dc..0fbfa4300b98 100644
> >> --- a/drivers/base/Makefile
> >> +++ b/drivers/base/Makefile
> >> @@ -26,6 +26,7 @@ obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
> >>  obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
> >>  obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
> >>  obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
> >> +obj-$(CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION) += cache.o
> >>  obj-$(CONFIG_ACPI) += physical_location.o
> >>  
> >>  obj-y			+= test/
> >> diff --git a/drivers/base/cache.c b/drivers/base/cache.c
> >> new file mode 100644
> >> index 000000000000..8d351657bbef
> >> --- /dev/null
> >> +++ b/drivers/base/cache.c
> >> @@ -0,0 +1,46 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Generic support for CPU Cache Invalidate Memregion
> >> + */
> >> +
> >> +#include <linux/spinlock.h>
> >> +#include <linux/export.h>
> >> +#include <asm/cacheflush.h>
> >> +
> >> +
> >> +static const struct system_cache_flush_method *scfm_data;
> >> +DEFINE_SPINLOCK(scfm_lock);
> >> +
> >> +void generic_set_sys_cache_flush_method(const struct system_cache_flush_method *method)
> >> +{
> >> +	guard(spinlock_irqsave)(&scfm_lock);
> >> +	if (scfm_data || !method || !method->invalidate_memregion)
> >> +		return;
> >> +
> >> +	scfm_data = method;  
> >
> >The lock looks unnecessary here, this is just atomic_cmpxchg().
> >  
> >> +}
> >> +EXPORT_SYMBOL_GPL(generic_set_sys_cache_flush_method);
> >> +
> >> +void generic_clr_sys_cache_flush_method(const struct system_cache_flush_method *method)
> >> +{
> >> +	guard(spinlock_irqsave)(&scfm_lock);
> >> +	if (scfm_data && scfm_data == method)
> >> +		scfm_data = NULL;  
> >
> >Same here, but really what is missing is a description of the locking
> >requirements of cpu_cache_invalidate_memregion().
> >
> >  
> >> +}
> >> +
> >> +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
> >> +{
> >> +	guard(spinlock_irqsave)(&scfm_lock);
> >> +	if (!scfm_data)
> >> +		return -EOPNOTSUPP;
> >> +
> >> +	return scfm_data->invalidate_memregion(res_desc, start, len);  
> >
> >Is it really the case that you need to disable interrupts during cache
> >operations? For potentially flushing 10s to 100s of gigabytes, is it
> >really the case that all archs can support holding interrupts off for
> >that event?
> >
> >A read lock (rcu or rwsem) seems sufficient to maintain registration
> >until the invalidate operation completes.
> >
> >If an arch does need to disable interrupts while it manages caches that
> >does not feel like something that should be enforced for everyone at
> >this top-level entry point.
> >  
> >> +}
> >> +EXPORT_SYMBOL_NS_GPL(cpu_cache_invalidate_memregion, "DEVMEM");
> >> +
> >> +bool cpu_cache_has_invalidate_memregion(void)
> >> +{
> >> +	guard(spinlock_irqsave)(&scfm_lock);
> >> +	return !!scfm_data;  
> >
> >Lock seems pointless here.
> >
> >More concerning is this diverges from the original intent of this
> >function which was to disable physical address space manipulation from
> >virtual environments.
> >
> >Now, different archs may have reason to diverge here but the fact that
> >the API requirements are non-obvious points at a minimum to missing
> >documentation if not missing cross-arch consensus.
> >  
> >> +}
> >> +EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
> >> diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
> >> index 7ee8a179d103..87e64295561e 100644
> >> --- a/include/asm-generic/cacheflush.h
> >> +++ b/include/asm-generic/cacheflush.h
> >> @@ -124,4 +124,16 @@ static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
> >>  	} while (0)
> >>  #endif
> >>  
> >> +#ifdef CONFIG_GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
> >> +
> >> +struct system_cache_flush_method {
> >> +	int (*invalidate_memregion)(int res_desc,
> >> +				    phys_addr_t start, size_t len);
> >> +};  
> >
> >The whole point of ARCH_HAS facilities is to resolve symbols like this
> >at compile time. Why does this need a indirect function call at all?  
> 
> Yes, blocking interrupts is much like the problem with WBINVD.
> 
> More or less, once user space is running, this isn't acceptable.
It's a bug that I missed in dragging this from a very different implementation.

Will fix for v3.

J
> 


