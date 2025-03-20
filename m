Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402BBC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oHT5tBIeBf0cxB91Eqye+0ABodbiuy0yPJIz/1GC/YE=; b=KNYU+TUsXSoFOvmreSQFDSyn3b
	GBterwW+AE6IpXPTgZ6xDB2VHxQp1eiDcuYZNEXscNZQsntwNlCtWYUF5SdklNisI+WzBDhsB3487
	E/GPJ2ZGATLPNmzQI4WjwOFL8J3vCLokHrSiC23Ci2/JGCVn3rH5Flgwxs0sw1eMnLPqtwW27oU6v
	CpRP7Uxxbtbue/nZJVc/pdRXI34mtMET5Cko44f7StstkCn7xPAQVB4uKZnvG5ZUs1inCLC6M/iXs
	J118J8AzC5k2ZANQ+qbySS7kC88agN/J8eRlHWXtDEFkgsKYUhLMmuFUgoqUDu3ASBHQbqjPnL5XQ
	d/DwnL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJvL-0000000CqKO-1srT;
	Thu, 20 Mar 2025 17:43:19 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJtc-0000000Cq6v-2syH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:41:34 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZJXpw37tQz6M4k2;
	Fri, 21 Mar 2025 01:38:00 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B399614050A;
	Fri, 21 Mar 2025 01:41:20 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Mar 2025 18:41:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<james.morse@arm.com>, <conor@kernel.org>, Yicong Yang
	<yangyicong@huawei.com>, <linux-acpi@vger.kernel.org>
CC: <linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 0/6] Cache coherency management subsystem
Date: Thu, 20 Mar 2025 17:41:12 +0000
Message-ID: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104133_021214_E60FDDF9 
X-CRM114-Status: GOOD (  25.86  )
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

Note that I've only a vague idea of who will care about this
so please do +CC others as needed.

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

So on other architectures such as ARM64 we have no instruction similar to
WBINVD but we may have device interfaces in the system that provide a way
to ensure a PA range undergoes the write back and invalidate action. This
RFC is to find a way to support those cache maintenance device interfaces.
The ones I know about are much more flexible than WBINVD, allowing
invalidation of particular PA ranges, or a much richer set of flush types
(not supported yet as not needed for upstream use cases).

To illustrate how a solution might work, I've taken both a HiSilicon
design (slight quirk as registers overlap with existing PMU driver)
and more controversially a firmware interface proposal from ARM
(wrapped up in made up ACPI) that was dropped from the released spec
but for which the alpha spec is still available.

Why drivers/cache?
- Mainly because it exists and smells like a reasonable place.
- Conor, you are maintainer for this currently do you mind us putting this
  stuff in there?

Why not just register a singleton function pointer?
- Systems may include multiple cache control devices, responsible
  for different parts of the PA address range (interleaving etc make
  this complex).  They may not all share a common hardware interface.
- A device class is more convenient than managing multiple homogeneous
  device instances within a driver.
- Disadvantage is that we need this small class

Generalizing to more arch?
- I've started with ARM64, but if useful elsewhere the small amount
  of arch code could be moved to a generic location.

QEMU emulation code at
http://gitlab.com/jic23/qemu cxl-2025-03-20 

Why an RFC?
- I'm really just looking for feedback on whether the class approach
  is the way to go at this stage.  I'm not strongly attached to it but
  it feels like the right balance of complexity and flexibility to me.
- I made up the ACPI spec - it's not documented, non official and
  honestly needs work. I would however like to get feedback on whether
  it is something we want to try and get through the ACPI Working group
  as a much improved code first proposal?  The potential justification
  being to avoid the need for lots trivial drivers where maybe a bit
  of DSDT interpreted code does the job better.

Jonathan Cameron (3):
  cache: coherency device class
  acpi: PoC of Cache control via ACPI0019 and _DSM
  Hack: Pretend we have PSCI 1.2

Yicong Yang (3):
  memregion: Support fine grained invalidate by
    cpu_cache_invalidate_memregion()
  arm64: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
  cache: Support cache maintenance for HiSilicon SoC Hydra Home Agent

 arch/arm64/Kconfig                  |   1 +
 arch/arm64/include/asm/cacheflush.h |  14 ++
 arch/arm64/mm/flush.c               |  42 ++++++
 arch/x86/mm/pat/set_memory.c        |   2 +-
 drivers/acpi/Makefile               |   1 +
 drivers/cache/Kconfig               |  26 ++++
 drivers/cache/Makefile              |   4 +
 drivers/cache/acpi_cache_control.c  | 157 ++++++++++++++++++++++
 drivers/cache/coherency_core.c      | 130 +++++++++++++++++++
 drivers/cache/hisi_soc_hha.c        | 193 ++++++++++++++++++++++++++++
 drivers/cxl/core/region.c           |   6 +-
 drivers/firmware/psci/psci.c        |   2 +
 drivers/nvdimm/region.c             |   3 +-
 drivers/nvdimm/region_devs.c        |   3 +-
 include/linux/cache_coherency.h     |  60 +++++++++
 include/linux/memregion.h           |   8 +-
 16 files changed, 646 insertions(+), 6 deletions(-)
 create mode 100644 drivers/cache/acpi_cache_control.c
 create mode 100644 drivers/cache/coherency_core.c
 create mode 100644 drivers/cache/hisi_soc_hha.c
 create mode 100644 include/linux/cache_coherency.h

-- 
2.43.0


