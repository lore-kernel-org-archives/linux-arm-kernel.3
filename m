Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D58DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tyPYU1f1yklcgFnqxEkox2QMD90Yx5NyCT5BxOVddLo=; b=y7pt5B5V72UdA2b3uK3HLT1kax
	8+YeTlHpMm08llbfE+41cXVPRRZ+gr935Jc2GOmpfBmWNVau4XBEvZdPQgtj+qxoQC62bVskOmgwb
	OFF5NWP/PjgMeb8dLRJPoHBPmAUvkfjS3TUDAhCGtdEHoYERAo0+8e5p1KK/nxtL4M8UszPGKgLlq
	xG7Wt/JOIRrleXcvfTuRJjZXrCeXz5RlaJGB8a3mUjZkBbn+Woj5UxPlchAFqhElbWpoIGt3V33fm
	iaXzmZ39wtWmeOSrCLYQiGkE3rLueZIv6LYvo3YuQHkxPBI4/4czdd1AJ5zKVb+t1GauHG9qv2yeD
	8JHbAtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGD-00000001gMM-0Uii;
	Fri, 04 Sep 2026 10:35:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGA-00000001gME-403G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C3C960219;
	Fri,  4 Sep 2026 10:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56471F00A3D;
	Fri,  4 Sep 2026 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518102;
	bh=tyPYU1f1yklcgFnqxEkox2QMD90Yx5NyCT5BxOVddLo=;
	h=From:To:Cc:Subject:Date;
	b=nvvEVimKQovlw/06o8Odf76g8c0JNyjUfG4n7w7PaFjLWkNhGidX2u5aPBzTUcMYz
	 R/qSFbRTY1SGFNlueur5Bp2XcbNRc85DbCODRU2U/z/dggMgISZ6rzScgh1wlGlxJC
	 EbmgDEqK4GXtCH6NAVFVdFU4rA0BWsgecf93Ly6B9yYXVPsXxlRAoqoiKedrONN+s4
	 +4qwUEk5HnDcpy3v1jkH9hMrhMbISi+nANzgwLn8xhR95uYthQx3SODQ0dm8TBO5g+
	 w5yJtg64+01BGOoBm0pt31v7xiAVCRDnWuP25zqvz8Pk0VjJ3ZEmLkwlMRzqTYcuEK
	 ZSgMltNl1yLOw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for shared buffers
Date: Fri,  4 Sep 2026 16:04:43 +0530
Message-ID: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

This series tightens the alignment requirements for buffers that are shared
between confidential-computing guests and the host.

When a guest runs with private memory, buffers shared with the hypervisor
are not only accessed by the guest. They are also accessed by the host
kernel, and the host may manage the corresponding shared/private state at a
granularity larger than the guest page size.

This matters for CCA systems where the Realm stage-2 mappings managed by
the RMM can still operate at 4K granularity, while the non-secure host may
manage the IPA state change at a larger page size, for example 64K. In that
case, allowing a guest to convert and share only a 4K subrange of a
host-managed granule is unsafe.

Architectures such as Arm can detect incorrect accesses to Realm physical
address space PFNs through GPC faults. However, relying on that as the only
line of defence is fragile and can still lead to kernel crashes. The risk
is especially visible for shared buffers that are later mmapped into
userspace, such as guest_memfd or dma-buf backed allocations. Once
userspace can access the mapping, the kernel cannot guarantee that
applications will only touch the intended 4K region rather than the whole
host page mapped into their address space. Those userspace addresses may
also be passed back into the kernel and accessed through the linear map,
resulting in a GPC fault.

To avoid this, shared buffers must satisfy two constraints:

  - the address must be aligned to the CoCo shared-granule size
  - the size must be a multiple of that granule size

The series adds generic helpers for this:

  - mem_cc_shared_granule_size()
  - mem_cc_align_to_shared_granule()

The generic implementation defaults to PAGE_SIZE. arm64 CCA overrides this
by querying the host IPA state change granule size through RHI and exposing that
value through the arm64 memory-encryption operations.

The patche series update the main shared-buffer allocation paths that can
be used by private-memory guests:

  - arm64 set_memory_encrypted()/set_memory_decrypted() now reject unaligned
    addresses or sizes.
  - GIC ITS shared allocations are rounded to the shared granule size.
  - dma-direct and atomic DMA pool allocations use aligned allocation and
    conversion sizes.
  - SWIOTLB pools, including dynamic pools, are allocated and converted at the
    shared granule size.
  - restricted-dma-pool regions are checked and rejected if firmware did not
    provide a base and size aligned to the shared granule size.
  - dma-buf system heap cc-shared allocations require aligned sizes and use at
    least the required allocation order.

Hyper-V users of set_memory_encrypted() and set_memory_decrypted() are not
changed by this series. Those paths are not currently used by the arm64 CCA
code path, and therefore are not part of the arm64 CCA IPA state change alignment
problem addressed here.

The series is based on:
  - https://lore.kernel.org/all/20260904095000.1184861-1-aneesh.kumar@kernel.org

Changes from v5:
https://lore.kernel.org/all/20260706060432.1375570-1-aneesh.kumar@kernel.org
* Rebased to latest kernel
* Drop patch arm64: realm: Move Realm memory encryption ops to RSI code

Changes from v4:
https://lore.kernel.org/all/20260427063108.909019-1-aneesh.kumar@kernel.org
* Rename the helpers to use CoCo terminology
  (mem_cc_shared_granule_size() / mem_cc_align_to_shared_granule() instead of
  mem_decrypt_granule_size() / mem_decrypt_align()).
* Use __DMA_ATTR_ALLOC_CC_SHARED to pass CoCo shared allocation requirements
  down to CMA-based allocation helpers.
* Add validation for restricted DMA pools to reject pools that are not aligned
  to the shared granule size.
* Add dma-buf system heap handling for cc-shared buffers.
* Split the previous combined DMA/SWIOTLB/ITS change into smaller subsystem
  patches covering ITS, DMA direct, SWIOTLB, restricted DMA pools, dma-buf
  system heap, and arm64 Realm support.
* Rework arm64 Realm support by moving Realm memory encryption ops into RSI
  code and exposing the CCA shared granule size through arm64_mem_crypt_ops.

Changes from v3:
https://lore.kernel.org/all/20260309102625.2315725-1-aneesh.kumar@kernel.org
* Fix build error reported by kernel test robot <lkp@intel.com>

Changes from v2:
https://lore.kernel.org/all/20251221160920.297689-1-aneesh.kumar@kernel.org
* Rebase to latest kernel
* Consider swiotlb always decrypted and don't align when allocating from swiotlb.

Changes from v1:
* Rename the helper to mem_encrypt_align
* Improve the commit message
* Handle DMA allocations from contiguous memory
* Handle DMA allocations from the pool
* swiotlb is still considered unencrypted. Support for an encrypted swiotlb pool
  is left as TODO and is independent of this series.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>

Aneesh Kumar K.V (Arm) (9):
  mm/mem_encrypt: Add helpers for shared-buffer alignment
  irqchip/gic-v3-its: Align shared ITS allocations to the CoCo shared
    granule size
  dma-mapping: Pass allocation attrs to contiguous allocation helpers
  dma-direct: Align CoCo shared DMA allocations to the shared granule
    size
  swiotlb: Align shared IO TLB pools to the shared granule size
  swiotlb: Reject misaligned restricted DMA pools for CoCo guests
  dma-buf: system_heap: Enforce shared-granule alignment for cc-shared
    buffers
  arm64: realm: Add RHI helper to query IPA state change alignment
  arm64: realm: Expose the CCA shared granule size through mem_encrypt
    ops

 arch/arm64/include/asm/mem_encrypt.h |  4 ++
 arch/arm64/mm/mem_encrypt.c          | 32 ++++++++++++++--
 drivers/dma-buf/heaps/system_heap.c  | 50 +++++++++++++++++++-----
 drivers/firmware/arm_rmm/rsi.c       | 57 ++++++++++++++++++++++++++++
 drivers/iommu/dma-iommu.c            |  2 +-
 drivers/irqchip/irq-gic-v3-its.c     |  6 ++-
 include/linux/arm-rsi-cmds.h         | 10 +++++
 include/linux/arm-smccc-rhi.h        | 25 ++++++++++++
 include/linux/arm-smccc-rsi.h        |  7 ++++
 include/linux/dma-map-ops.h          |  5 ++-
 include/linux/mem_encrypt.h          | 14 +++++++
 kernel/dma/contiguous.c              | 13 ++++++-
 kernel/dma/direct.c                  | 27 +++++++++----
 kernel/dma/ops_helpers.c             |  3 +-
 kernel/dma/pool.c                    |  4 +-
 kernel/dma/swiotlb.c                 | 36 ++++++++++++++----
 16 files changed, 260 insertions(+), 35 deletions(-)
 create mode 100644 include/linux/arm-smccc-rhi.h

-- 
2.43.0


