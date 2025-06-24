Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E692C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xF54YMu7OxUF/VLJfQRO2xkWO5SFjDCxuPt6tFHYlVQ=; b=qulQNg1I74d/hqGAZozNkbywxf
	nyA8SG4CNr2qRz2DqQOiSz3Dopcaqgc0g68Kf8GsZFLtH2LixRZLwypB7VjanqqiHK/P4tn2lPv6t
	zbtTYf6woEj3l9yF87OAmyGjj7dbVnJcuNv44VzXnxX5epkYA394wm4oQ977/hrFAXPbllkZOp22E
	E9pP4VhBuxAC3JIGB3k3dqrSgaEJGxTlIlj0tXNzu3OA1aadeXMj0hUwcz5LeMRFKgpHX/xABVKoN
	Rr91pGTst+S9OcD3c1GsaM/csoBNs/dYX5pQZeT89vpuOJXPmEHLA8xpKmnIjt0AImVVPO8qL3Opw
	2cAR1zUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAsc-00000006q5Z-2KsK;
	Tue, 24 Jun 2025 21:08:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5sf-00000006B83-2qAW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:48:19 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bRTpy3ByKz6GDn2;
	Tue, 24 Jun 2025 23:47:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C97041402C3;
	Tue, 24 Jun 2025 23:48:06 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Jun 2025 17:48:05 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, H Peter Anvin
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>
Subject: [PATCH v2 0/8] Cache coherency management subsystem
Date: Tue, 24 Jun 2025 16:47:56 +0100
Message-ID: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_084817_998359_A83D7F72 
X-CRM114-Status: GOOD (  27.60  )
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

Since RFC:
https://lore.kernel.org/all/20250320174118.39173-1-Jonathan.Cameron@huawei.com/

Mostly ripping out the device class as we have no idea what a possible
long term userspace interface element for this might look like.
Instead just use a simple registration list and mutex. We can bring
the class back easily when / if it is needed. (Greg)

Also generalized to remove the arm64 bits in favor of generic support as
this doesn't have anything much to do with the CPU architecture once
an implementation isn't using a CPU instruction for this.

It's about as simple as it can be now. Hence I've dropped the RFC marking
from all by the ACPI patch which is mostly still here just to provide
a second example.

Catalin raised a good question of whether all implementations would be
able to do the appropriate CPU Cache flushes. The Hisilicon HHA
can as it's the coherency home agent for a portion of the host physical
address space and so can issue the necessary cache invalidations to
ensure there are no copies left anywhere in the system. I don't have good
visibility of other implementations. So if you have one, please review
whether this meets your requirements.

Updated cover-letter 

Note that I've only a vague idea of who will care about this
so please do +CC others as needed. The expanded list for v2 includes
everyone Dan +CC on as well as ARM and CXL types who might care.
[PATCH v5] memregion: Add cpu_cache_invalidate_memregion() interface

On x86 there is the much loved WBINVD instruction that causes a write back
and invalidate of all caches in the system. It is expensive but it is
necessary in a few corner cases. These are cases where the contents of
Physical Memory may change without any writes from the host. Whilst there
are a few reasons this might happen, the one I care about here is when
we are adding or removing mappings on CXL. So typically going from
there being actual memory at a host Physical Address to nothing there
(reads as zero, writes dropped) or visa-versa. That involves the
reprogramming of address decoders (HDM Decoders); in the near future
it may also include the device offering dynamic capacity extents. The
thing that makes it very hard to handle with CPU flushes is that the
instructions are normally VA based and not guaranteed to reach beyond
the Point of Coherence or similar. You might be able to (ab)use
various flush operations intended to ensure persistence memory but
in general they don't work either.

On other architectures (such as ARM64) we have no instruction similar to
WBINVD but we may have device interfaces in the system that provide a way
to ensure a PA range undergoes the write back and invalidate action. This
RFC is to find a way to support those cache maintenance device interfaces.
The ones I know about are much more flexible than WBINVD, allowing
invalidation of particular PA ranges, or a much richer set of flush types
(not supported yet as not needed for upstream use cases).

To illustrate how my suggested solution works, I've taken both a HiSilicon
design (slight quirk as registers overlap with existing PMU driver)
and more controversially a firmware interface proposal from ARM
(wrapped up in made up ACPI) that was dropped from the released spec
but for which the alpha spec is still available.

Why drivers/cache?
- Mainly because it exists and smells like a reasonable place.
  As per discussion on v1, I've added myself as a maintainer to
  assist Conor.

Why not just register a singleton function pointer?
- Systems may include multiple cache control devices, responsible
  for different parts of the PA address range (interleaving etc make
  this complex).  They may not all share a common hardware interface.

Generalizing to more arch?
- I've now made this generic an opt in on a per arch basis.

QEMU emulation code at
http://gitlab.com/jic23/qemu cxl-2025-03-20 

Remaining opens:
- I don't particularly like defining 'generic' infrastructure with
  so few implementations. If anyone can point me at docs for another one
  or two, or confirm that they think this is fine that would be great!
- I made up the ACPI spec - it's not documented, non official and
  honestly needs work. I would however like to get feedback on whether
  it is something we want to try and get through the ACPI Working group
  as a much improved code first proposal?  The potential justification
  being to avoid the need for lots trivial drivers where maybe a bit
  of DSDT interpreted code does the job better.

Jonathan Cameron (5):
  cache: coherency core registration and instance handling.
  MAINTAINERS: Add Jonathan Cameron to drivers/cache
  arm64: Select GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
  acpi: PoC of Cache control via ACPI0019 and _DSM
  Hack: Pretend we have PSCI 1.2

Yicong Yang (2):
  memregion: Support fine grained invalidate by
    cpu_cache_invalidate_memregion()
  generic: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION

Yushan Wang (1):
  cache: Support cache maintenance for HiSilicon SoC Hydra Home Agent

 MAINTAINERS                        |   1 +
 arch/arm64/Kconfig                 |   2 +
 arch/x86/mm/pat/set_memory.c       |   2 +-
 drivers/base/Kconfig               |   3 +
 drivers/base/Makefile              |   1 +
 drivers/base/cache.c               |  46 +++++++
 drivers/cache/Kconfig              |  30 +++++
 drivers/cache/Makefile             |   4 +
 drivers/cache/acpi_cache_control.c | 152 ++++++++++++++++++++++++
 drivers/cache/coherency_core.c     | 116 ++++++++++++++++++
 drivers/cache/hisi_soc_hha.c       | 185 +++++++++++++++++++++++++++++
 drivers/cxl/core/region.c          |   6 +-
 drivers/firmware/psci/psci.c       |   2 +
 drivers/nvdimm/region.c            |   3 +-
 drivers/nvdimm/region_devs.c       |   3 +-
 include/asm-generic/cacheflush.h   |  12 ++
 include/linux/cache_coherency.h    |  40 +++++++
 include/linux/memregion.h          |   8 +-
 18 files changed, 610 insertions(+), 6 deletions(-)
 create mode 100644 drivers/base/cache.c
 create mode 100644 drivers/cache/acpi_cache_control.c
 create mode 100644 drivers/cache/coherency_core.c
 create mode 100644 drivers/cache/hisi_soc_hha.c
 create mode 100644 include/linux/cache_coherency.h

-- 
2.48.1


