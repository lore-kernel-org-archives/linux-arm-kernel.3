Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835B2C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+iYNuLp5VhcQdIy1TVPO+FLdBIO/tWINeA+UpAktb2A=; b=XrVmcjkywbXzn5/XNRhioiyFvQ
	IxsEZDodCo7liokSyQoLSkK/GE1YPwgiT6LQJJcu4JncfnYcZfikEuK8JMUW5VPJRuldkNEtzrbxB
	Vjar6zlxms2bwtriM7t8kwZAnO6TgLiPfN8I7evmfh2f+3Uh0gtm278iGqjQcXFL05NOWfSwcTt2x
	v9WLYMnmNYS9skyKalMrHqz9P/Q1fshWD0yFiR0kU8CVdMEoGwcNMvnJk78UMZ3hOuAwxbplgW58U
	lDV/dYxicaQ+PS7sVSP9LADIg9i59YFPBwChDIMOQ/roEDt5skWSSBl/IjjPH8dnag/9ZbFHRScSy
	uCzmScJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMmb-0000000HRhR-1RaE;
	Thu, 16 Jul 2026 14:09:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMma-0000000HRh2-2w9A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:09:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4A0460A58;
	Thu, 16 Jul 2026 14:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DBB1F000E9;
	Thu, 16 Jul 2026 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784210987;
	bh=+iYNuLp5VhcQdIy1TVPO+FLdBIO/tWINeA+UpAktb2A=;
	h=From:To:Cc:Subject:Date;
	b=PZG8QCc0uwLOLItOHe7+zEKqOKQYFyR95so64L9tjATCmBKwMQ9344QclINBDLTIb
	 xnfxguyUcONdeMh4hZvVzrX4TeRbPNZq/sXhv3mNqz5vDE7TeyxMe8nLRoTRlaOL+8
	 thgDUFpWGbhWGdNm9JecuxlRg6SlDvXwHAkBwhEHx/Rl9QcfXjfx5WjE+iRXp43si1
	 ESUgmGIol3hu3OGyuzU1ucJZppdS0pH28Usk0XGyt9SzWQe6Y7/JAFZSwe+kbfizoy
	 ewHx6NgiJfGFdH25RBINYCqlygFitW0WQnC6xvKvMFKWx9N1I534SrUr34aFBsBqRH
	 545CugVEK9U2A==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC PATCH 0/5] KVM: arm64: Use TTBR1_EL2 for hVHE runtime mappings
Date: Thu, 16 Jul 2026 19:39:31 +0530
Message-ID: <20260716140936.4003182-1-aneesh.kumar@kernel.org>
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

hVHE currently disables TTBR1_EL2 and places both the identity mapping
and the hyp runtime mappings in TTBR0_EL2. As a result, it continues to
use the legacy nVHE virtual-address layout even though hVHE uses the
EL2&0 translation regime and can retain canonical kernel-image addresses.

This series moves the hVHE runtime mappings to TTBR1_EL2 and reserves
TTBR0_EL2 for the identity mapping used during MMU and page-table
transitions. Conventional VHE is unaffected, and nVHE continues to use
the existing TTBR0-only layout, including when protected mode is enabled.

The existing code does not consistently distinguish kernel-image symbols
from linear-map addresses because both currently use the same EL2
address transformation. The first four patches make this distinction
explicit by:

  - adding helpers for kernel-image symbol addresses;
  - splitting the hyp mapping APIs by address type;
  - providing separate symbol and linear VA-to-PA conversions; and
  - clarifying the private hyp VA allocation terminology.

The final patch implements the TTBR1 layout. Hyp symbols retain their
linked kernel-image VAs, while pools, per-CPU regions, SVE state and shared
memory continue to use linear-map addresses. A separate TTBR0 page table
contains the idmap, and both roots are installed during initial EL2 setup
and pKVM finalization.

The resulting layouts are:

  nVHE:
    TTBR0_EL2: idmap and runtime mappings
    TTBR1_EL2: unused

  hVHE:
    TTBR0_EL2: idmap
    TTBR1_EL2: runtime mappings

Cc: Marc Zyngier <maz@kernel.org> 
Cc: Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>

Aneesh Kumar K.V (Arm) (5):
  KVM: arm64: Make hyp symbol address conversion explicit
  KVM: arm64: Split hyp mapping APIs by address type
  KVM: arm64: Split hyp VA-to-PA conversion by address type
  KVM: arm64: Rename the hyp private VA allocation base
  KVM: arm64: Use TTBR1_EL2 for hVHE runtime mappings

 arch/arm64/include/asm/kvm_asm.h         |  13 +--
 arch/arm64/include/asm/kvm_host.h        |   2 +
 arch/arm64/include/asm/kvm_hyp.h         |   4 +-
 arch/arm64/include/asm/kvm_mmu.h         |  89 ++++++++++++++--
 arch/arm64/include/asm/kvm_pgtable.h     |  27 +++++
 arch/arm64/include/asm/kvm_pkvm.h        |   3 +
 arch/arm64/kernel/asm-offsets.c          |   5 +-
 arch/arm64/kvm/arm.c                     |  92 +++++++++-------
 arch/arm64/kvm/hyp/include/nvhe/memory.h |  13 +--
 arch/arm64/kvm/hyp/include/nvhe/mm.h     |   9 +-
 arch/arm64/kvm/hyp/nvhe/early_alloc.c    |   1 +
 arch/arm64/kvm/hyp/nvhe/events.c         |   2 +-
 arch/arm64/kvm/hyp/nvhe/host.S           |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S       |  29 ++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    |  30 +++---
 arch/arm64/kvm/hyp/nvhe/mm.c             | 110 +++++++++++++------
 arch/arm64/kvm/hyp/nvhe/psci-relay.c     |  12 +--
 arch/arm64/kvm/hyp/nvhe/setup.c          |  55 +++++++---
 arch/arm64/kvm/hyp/pgtable.c             |  62 ++++++++++-
 arch/arm64/kvm/hyp_trace.c               |   2 +-
 arch/arm64/kvm/mmu.c                     | 128 ++++++++++++++++-------
 arch/arm64/kvm/pkvm.c                    |   3 +
 arch/arm64/kvm/va_layout.c               |  32 +++++-
 23 files changed, 546 insertions(+), 181 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.43.0


