Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A7C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0lZwCRysjfLKbCS9jnF9C0Me7Tu6hMCaVC/8JuweqfA=; b=pnF9L64MpgZoZmBKDkBpEQEH05
	YWzYx2QV/v0nR31utIwIh/8nBZ05I0FkLNNHiRaGCE3R1ap5ZtO1HGjQBT6TsBT6nvWD16JgUb/B9
	UnFHIAKyjb4j5tv4GonNKJfBAGh6ZHwsxd/2k7kd1iBSFzPTS6TLZMwlIWG9oK+CvTqU4nvxvVjMG
	x89oKbXuJ17AndGcu1p9o0yvsmSfVHJtG03JQf5CgPVxsa9vOD2OAPDTO6Fv+Q/7/4dVlJwMH6bqO
	OmH2NaIuOvtlnRp7xMQQYRrLXpJaoXMXEAduHCw38tN3ZuFqbcw9QuiNk+FcIe5gNgH+DjNUDErjB
	xRx+FFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmq8-0000000BdV0-1lnO;
	Mon, 05 Jan 2026 15:49:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmq7-0000000BdUc-143y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4180660143;
	Mon,  5 Jan 2026 15:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FD1C116D0;
	Mon,  5 Jan 2026 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628189;
	bh=0BbR1FrpPcRwTPPEXt92twmC12f+pM7/vu6qIyNOSOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=r+evfJ7iSm6OgK1rPXPU5B4poGj5pv67kS91D7sVdBfldx32oFMk5Ie1GVRCVJyW6
	 dvyrk0AVJPUH+RcbMKV1LP6a4yXDaz7knojD1TmHyRAp1mmWTRQUlXamL9D6XOTlKF
	 q/zxqRlBCzDWUTgv2X9CFT5WhWta2y0CK9epdFhFt8UpJ3Pva3cewGkhbL40UA6EDA
	 zkmWWiGAppxdyeeF/ACy5xDwdD2XioCDxbHQe7RF52DWDG4BoKMFtFWhuhAZZp0kyx
	 CbYcT+w/cTtSaeHMXX/1FiNM9Fi91F05n7RNfmc/216GOkxHkYE4FQ8dojqVx/p1a0
	 9V9UroOCd+BNw==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 00/30] KVM: arm64: Add support for protected guest memory with pKVM
Date: Mon,  5 Jan 2026 15:49:08 +0000
Message-ID: <20260105154939.11041-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Hi folks,

Although pKVM has been shipping in Android kernels for a while now,
protected guest (pVM) support has been somewhat languishing upstream.
This has partly been because we've been waiting for guest_memfd() but
also because it hasn't been clear how to expose pVMs to userspace (which
is necessary for testing) without getting everything in place beforehand.
This has led to frustration on both sides of the fence [1] and so this
patch series attempts to get things moving again by exposing pVM
features in an incremental fashion based on top of anonymous memory,
which is what we have been using in Android. The big difference between
this series and the Android implementation is the graceful handling of
host stage-2 faults arising from accesses made using kernel mappings.
The hope is that this will unblock pKVM upstreaming efforts while the
guest_memfd() work continues to evolve.

Specifically, this patch series implements support for protected guest
memory with pKVM, where pages are unmapped from the host as they are
faulted into the guest and can be shared back from the guest using pKVM
hypercalls. Protected guests are created using a new machine type
identifier and can be booted to a shell using the kvmtool patches
available at [2], which finally means that we are able to test the pVM
logic in pKVM. Since this is an incremental step towards full isolation
from the host (for example, the CPU register state and DMA accesses are
not yet isolated), creating a pVM requires a developer Kconfig option to
be enabled in addition to booting with 'kvm-arm.mode=protected' and
results in a kernel taint.

More information about what is and what isn't implemented is described
in the pkvm.rst documentation added by this series. The intention is to
update this file as we introduce additional protection features and
ultimately to remove the taint.

The series is loosely structured as follows:

  Patch       1: A dependent pgtable fix that I sent out previously
  Patches   2-8: Cleanups/fixes to the existing code to prepare for pVMs
  Patches  9-14: Support for memory donation and reclaim
  Patches 15-22: Handling of bad host accesses to protected memory
  Patches 23-25: Support for SHARE and UNSHARE guest hypercalls
  Patches 26-27: UAPI and developer documentation
  Patches 28-30: Selftest additions for new page ownership transitions

Patches are based on v6.19-rc4 and are also available at [3].

All feedback welcome.

Cheers,

Will

[1] https://lore.kernel.org/all/aS9rmMgNna7I5g4F@kernel.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/?h=pkvm
[3] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=kvm/protected-memory

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Quentin Perret <qperret@google.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>
Cc: Mostafa Saleh <smostafa@google.com>

--->8

Fuad Tabba (1):
  KVM: arm64: Expose self-hosted debug regs as RAZ/WI for protected
    guests

Quentin Perret (2):
  KVM: arm64: Refactor enter_exception64()
  KVM: arm64: Inject SIGSEGV on illegal accesses

Will Deacon (27):
  KVM: arm64: Invert KVM_PGTABLE_WALK_HANDLE_FAULT to fix pKVM walkers
  KVM: arm64: Remove redundant 'pgt' pointer checks from MMU notifiers
  KVM: arm64: Rename __pkvm_pgtable_stage2_unmap()
  KVM: arm64: Don't advertise unsupported features for protected guests
  KVM: arm64: Remove pointless is_protected_kvm_enabled() checks from
    hyp
  KVM: arm64: Ignore MMU notifier callbacks for protected VMs
  KVM: arm64: Prevent unsupported memslot operations on protected VMs
  KVM: arm64: Split teardown hypercall into two phases
  KVM: arm64: Introduce __pkvm_host_donate_guest()
  KVM: arm64: Hook up donation hypercall to pkvm_pgtable_stage2_map()
  KVM: arm64: Handle aborts from protected VMs
  KVM: arm64: Introduce __pkvm_reclaim_dying_guest_page()
  KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()
  KVM: arm64: Generalise kvm_pgtable_stage2_set_owner()
  KVM: arm64: Introduce host_stage2_set_owner_metadata_locked()
  KVM: arm64: Annotate guest donations with handle and gfn in host
    stage-2
  KVM: arm64: Introduce hypercall to force reclaim of a protected page
  KVM: arm64: Reclaim faulting page from pKVM in spurious fault handler
  KVM: arm64: Return -EFAULT from VCPU_RUN on access to a poisoned pte
  KVM: arm64: Add hvc handler at EL2 for hypercalls from protected VMs
  KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs
  KVM: arm64: Implement the MEM_UNSHARE hypercall for protected VMs
  KVM: arm64: Allow userspace to create protected VMs when pKVM is
    enabled
  KVM: arm64: Add some initial documentation for pKVM
  KVM: arm64: Extend pKVM page ownership selftests to cover guest
    donation
  KVM: arm64: Register 'selftest_vm' in the VM table
  KVM: arm64: Extend pKVM page ownership selftests to cover forced
    reclaim

 .../admin-guide/kernel-parameters.txt         |   4 +-
 Documentation/virt/kvm/arm/index.rst          |   1 +
 Documentation/virt/kvm/arm/pkvm.rst           | 101 ++++
 arch/arm64/include/asm/kvm_asm.h              |   7 +-
 arch/arm64/include/asm/kvm_emulate.h          |   5 +
 arch/arm64/include/asm/kvm_host.h             |   7 +
 arch/arm64/include/asm/kvm_pgtable.h          |  27 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   4 +-
 arch/arm64/include/asm/virt.h                 |   6 +
 arch/arm64/kvm/Kconfig                        |  10 +
 arch/arm64/kvm/arm.c                          |   8 +-
 arch/arm64/kvm/hyp/exception.c                | 100 ++--
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   9 +
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |   6 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   7 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  95 ++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 500 ++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 223 +++++++-
 arch/arm64/kvm/hyp/nvhe/switch.c              |   1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |   8 +
 arch/arm64/kvm/hyp/pgtable.c                  |  22 +-
 arch/arm64/kvm/mmu.c                          | 122 ++++-
 arch/arm64/kvm/pkvm.c                         | 149 +++++-
 arch/arm64/mm/fault.c                         |  31 +-
 include/uapi/linux/kvm.h                      |   5 +
 25 files changed, 1249 insertions(+), 209 deletions(-)
 create mode 100644 Documentation/virt/kvm/arm/pkvm.rst

-- 
2.52.0.351.gbe84eed79e-goog


