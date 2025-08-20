Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28FFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i0An9jEV3o4+BtXvYYFe+C7Ti7DwjJ5UStbGH3Nk+GY=; b=iKvp76IeOLNJui750O4byjzgJi
	QUFLNCNHPm0Kl2WMg4ja04agXlHMR8t9ED1QOA2U0vQ5f7A962z/bDnuMLJe1suEPakLIIptMgDa3
	wcuyA6uG77PuOeorXedpznvlfjiKJ0jLM0jIeuPtCjuH/BxdGfqlPyX8vF3UbuFhZQNBz54b7CUp1
	cQg9RO04gJ1tYEgDB9fiFnHZ2gDxvMR+SfXKovdrtuy373nXdcLtleHQgnnl3z3tPWuiBcxtOb3pN
	gWyd5w1AEXNVhx1QW2wf6boZJGX6DVLoZBlDU1rTBlPiuMdWVd+Mh7LBfuFK37LnInhRWgmRxZymx
	0HZU4fgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoghP-0000000DK9V-2fBC;
	Wed, 20 Aug 2025 11:09:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog4w-0000000D9SJ-3R4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:30:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c6N0n0mSFz6L5l4;
	Wed, 20 Aug 2025 18:26:49 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 05FE5140119;
	Wed, 20 Aug 2025 18:29:52 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Aug 2025 12:29:51 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>
Subject: [PATCH v3 0/8] Cache coherency management subsystem
Date: Wed, 20 Aug 2025 11:29:42 +0100
Message-ID: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_033003_144667_88974C4D 
X-CRM114-Status: GOOD (  28.25  )
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

Support system level interfaces for cache maintenance as found on some
ARM64 systems. This is needed for correct functionality during various
forms of memory hotplug (e.g. CXL). Typical hardware has MMIO interface
found via ACPI DSDT.

Includes parameter changes to cpu_cache_invalidate_memregion() but no
functional changes for architectures that already support this call.

v3:
  - Squash the layers by moving all the management code into
    lib/cache_maint.c that architectures can opt into via
    GENERIC_CPU_CACHE_MAINTENANCE (Dan).  I added entries to Conor's
    drivers/cache MAINTAINERS entry to include this lib/ code but if
    preferred I can add a separate entry for it.
  - Add a new patch 1 that drops the old IODESC_RES_ parameter as it never
    did anything other than document intent.  With the addition of a
    flushing range, we would have to check the range and resource type
    matched. Simpler to just drop the parameter. (Dan)
  - Minor fixes and renames as per reviews.
  - Even if all else looks good, I fully expect some discussion of the
    naming as I'm not particularly happy with it.
  - Open question on whether is acceptable for the answer to whether
    cpu_cache_invalidate_memregion() is supported to change as drivers
    register (potentially after initial boot).  Could design a firmware
    table solution to this, but will take a while - not sure if it is
    necessary.
  - Switch to a fwctl style allocation function that makes the container
    nature of the allocation explicit.

On current ARM64 systems (and likely other architectures) the
implementation of cache flushing need for actions such as CXL memory
hotplug e.g. cpu_cache_invalidate_memregion(), is performed by system
components outside of the CPU, controlled via either firmware or MMIO
interfaces.

These control units run the necessary coherency protocol operations to
cause the write backs and cache flushes to occur asynchronously. The allow
filtering by PA range to reduce disruption to the system. Systems
supporting this interface must be designed to ensure that, when complete,
all cache lines in the range are in invalid state or clean state
(prefetches may have raced with the invalidation). This must include
memory-side caches and other non architectural caches beyond the Point
of Coherence (ARM terminology) such that writes will reach memory even
after OS programmable address decoders are modified (for CXL this is
any HDM decoders that aren't locked). Software will guarantee that no
writes to these memory ranges race with this operation. Whilst this is
subtly different from write backs must reach the physical memory that
difference probably doesn't matter to those reading this series.

The possible distributed nature of the relevant coherency management
units (e.g. due to interleaving) requires the appropriate commands to be
issued to multiple (potentially heterogeneous) units. To enable this a
registration framework is provided to which drivers may register a set
of callbacks. Upon a request for a cache maintenance operation the
framework iterates over all registered callback sets, calling first a
command to write back and invalidate, and then optionally a command to wait
for completion. Filtering on relevance is left to the individual drivers.

Two drivers are included. This HiSilicon Hydra Home Agent driver which
controls hardware found on some of our relevant server SoCs and,
mostly to show that the approach is general, a driver based on a firmware
interface that was in a public PSCI specification alpha version
(now dropped - don't merge that!)

QEMU emulation code at
http://gitlab.com/jic23/qemu cxl-2025-03-20 

Remaining opens:
- Naming.  All suggestions welcome!
- I don't particularly like defining 'generic' infrastructure with so few
  implementations. If anyone can point me at docs for another one or two,
  or confirm that they think this is fine that would be great!
- I made up the ACPI spec - it's not documented, non official and honestly
  needs work. I would however like to get feedback on whether it is
  something we want to try and get through the ACPI Working group as a much
  improved code first proposal?  The potential justification being to avoid
  the need for lots trivial drivers where maybe a bit of DSDT interpreted
  code does the job better. (Currently I'm not hearing much demand for this
  so will probably drop in a future version).

Thanks to all who engaged in the discussion so far.

Jonathan

Jonathan Cameron (5):
  memregion: Drop unused IORES_DESC_* parameter from
    cpu_cache_invalidate_memregion()
  MAINTAINERS: Add Jonathan Cameron to drivers/cache
  arm64: Select GENERIC_CPU_CACHE_MAINTENANCE and
    ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
  acpi: PoC of Cache control via ACPI0019 and _DSM
  Hack: Pretend we have PSCI 1.2

Yicong Yang (2):
  memregion: Support fine grained invalidate by
    cpu_cache_invalidate_memregion()
  lib: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION

Yushan Wang (1):
  cache: Support cache maintenance for HiSilicon SoC Hydra Home Agent

 MAINTAINERS                        |   3 +
 arch/arm64/Kconfig                 |   2 +
 arch/x86/mm/pat/set_memory.c       |   2 +-
 drivers/cache/Kconfig              |  22 ++++
 drivers/cache/Makefile             |   3 +
 drivers/cache/acpi_cache_control.c | 153 +++++++++++++++++++++++
 drivers/cache/hisi_soc_hha.c       | 187 +++++++++++++++++++++++++++++
 drivers/cxl/core/region.c          |   5 +-
 drivers/firmware/psci/psci.c       |   2 +
 drivers/nvdimm/region.c            |   2 +-
 drivers/nvdimm/region_devs.c       |   2 +-
 include/linux/cache_coherency.h    |  57 +++++++++
 include/linux/memregion.h          |  10 +-
 lib/Kconfig                        |   3 +
 lib/Makefile                       |   2 +
 lib/cache_maint.c                  | 128 ++++++++++++++++++++
 16 files changed, 575 insertions(+), 8 deletions(-)
 create mode 100644 drivers/cache/acpi_cache_control.c
 create mode 100644 drivers/cache/hisi_soc_hha.c
 create mode 100644 include/linux/cache_coherency.h
 create mode 100644 lib/cache_maint.c

-- 
2.48.1


