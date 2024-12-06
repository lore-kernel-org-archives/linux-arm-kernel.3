Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72359E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mc4g+CAWRw0cVw8uxxeRObWkGCexj2GCcVT2pQdNGDk=; b=exdNjsxwsiV1/reZTuRUlx9X5i
	JknDJlAYp1XTPFEt/j5fsK065IVrqC1XZ7kpPSivQcY6lkX4iUiWTPrthfkDykmylbdnccLYYSCln
	XWxkxm0ngqTcMSvIADdqdWf2MIzfIJfUi1KjS4pnxGqddbKbJ29mQV2jlDed5Xrt9QcNLwdhjRDOh
	I8z11g39jjoJgabRU2DKiJMEEdai9cL8bvuqWyhqnYkjYn+pXbuPFEMHUx385cKrFa0MsdzDJslRI
	qaiIBK96F3TLBjxEXGVqDoJXjjmH4mA5OoX6jm5EE8jTvIJmKW/CUyBMlI7CEmZZci4QIX+uxzPch
	2WLC5DdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd4D-00000002Rp1-0vcs;
	Fri, 06 Dec 2024 18:28:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd3B-00000002Rhx-3UFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 18:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C2EB5C572A;
	Fri,  6 Dec 2024 18:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B34C4CED1;
	Fri,  6 Dec 2024 18:27:36 +0000 (UTC)
Date: Fri, 6 Dec 2024 18:27:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.13-rc2
Message-ID: <Z1NCFeR4iBm5Bxqg@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_102737_956192_67C413CA 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Linus,

Please pull the arm64 fixes below. Nothing major, some left-overs from
the recent merging window (MTE, coco) and some newly found issues like
the ptrace() ones. More details in the tag. Thanks.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to d60624f72d15862a96965b945f6ddfee9a1359e7:

  arm64: ptrace: fix partial SETREGSET for NT_ARM_GCS (2024-12-05 18:05:51 +0000)

----------------------------------------------------------------
arm64 fixes for 6.13-rc2:

- MTE/hugetlbfs:

  - Set VM_MTE_ALLOWED in the arch code and remove it from the core code
    for hugetlbfs mappings

  - Fix copy_highpage() warning when the source is a huge page but not
    MTE tagged, taking the wrong small page path

- drivers/virt/coco:

  - Add the pKVM and Arm CCA drivers under the arm64 maintainership

  - Fix the pkvm driver to fall back to ioremap() (and warn) if the
    MMIO_GUARD hypercall fails

  - Keep the Arm CCA driver default 'n' rather than 'm'

- A series of fixes for the arm64 ptrace() implementation, potentially
  leading to the kernel consuming uninitialised stack variables when
  PTRACE_SETREGSET is invoked with a length of 0

- Fix zone_dma_limit calculation when RAM starts below 4GB and ZONE_DMA
  is capped to this limit

- Fix early boot warning with CONFIG_DEBUG_VIRTUAL=y triggered by a call
  to page_to_phys() (from patch_map()) which checks pfn_valid() before
  vmemmap has been set up

- Do not clobber bits 15:8 of the ASID used for TTBR1_EL1 and TLBI ops
  when the kernel assumes 8-bit ASIDs but running under a hypervisor on
  a system that implements 16-bit ASIDs (found running Linux under
  Parallels on Apple M4)

- ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A as it is
  using the same SMMU PMCG as HIP09 and suffers from the same errata

- Add GCS to cpucap_is_possible(), missed in the recent merge

----------------------------------------------------------------
Catalin Marinas (2):
      arm64: Ensure bits ASID[15:8] are masked out when the kernel uses 8-bit ASIDs
      arm64: mte: Fix copy_highpage() warning on hugetlb folios

Mark Rutland (5):
      arm64: patching: avoid early page_to_phys()
      arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
      arm64: ptrace: fix partial SETREGSET for NT_ARM_FPMR
      arm64: ptrace: fix partial SETREGSET for NT_ARM_POE
      arm64: ptrace: fix partial SETREGSET for NT_ARM_GCS

Qinxin Xia (1):
      ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A

Robin Murphy (1):
      arm64: cpufeature: Add GCS to cpucap_is_possible()

Suzuki K Poulose (1):
      coco: virt: arm64: Do not enable cca guest driver by default

Will Deacon (2):
      drivers/virt: pkvm: Don't fail ioremap() call if MMIO_GUARD fails
      MAINTAINERS: Add CCA and pKVM CoCO guest support to the ARM64 entry

Yang Shi (2):
      arm64: mte: set VM_MTE_ALLOWED for hugetlbfs at correct place
      arm64: mm: Fix zone_dma_limit calculation

 Documentation/arch/arm64/silicon-errata.rst   |  5 ++--
 MAINTAINERS                                   |  2 ++
 arch/arm64/include/asm/cpucaps.h              |  2 ++
 arch/arm64/include/asm/cpufeature.h           |  3 +--
 arch/arm64/include/asm/mman.h                 |  3 ++-
 arch/arm64/kernel/patching.c                  | 21 +++++++---------
 arch/arm64/kernel/ptrace.c                    | 36 +++++++++++++++++++++------
 arch/arm64/mm/context.c                       |  4 +--
 arch/arm64/mm/copypage.c                      |  8 +++---
 arch/arm64/mm/init.c                          | 17 ++++++-------
 drivers/acpi/arm64/iort.c                     |  2 ++
 drivers/virt/coco/arm-cca-guest/Kconfig       |  1 -
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  6 +----
 fs/hugetlbfs/inode.c                          |  2 +-
 14 files changed, 67 insertions(+), 45 deletions(-)

-- 
Catalin

