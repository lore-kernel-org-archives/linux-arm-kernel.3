Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D94CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bOlndonvEZP0CR94Cc2FsO9Rx3c4GS5z/xPo6WTOAkQ=; b=AMhWhqQTGN3PO/rac5sEd+5C/W
	hwSR88pQZ1IP7EXSwbEEs7RZoZK5oIzCDVQ90GsOiqybyLX0tHACu/IrVMrrjI5kWDdbum0qhND94
	2bxvtLgaOVy8CnCunJbTh55p/Lo1Lu/N7dF3AFEVES8J+sfTGq8gFFLDxHK+YJjHhk0mAc6xx06CZ
	UCBSREL78ScH1BaiGJWo5W9siTni64QPbfSSHNuzEN3pobDhzO//wV3kIPNFKPCwup3U4WRNpMIGV
	dLUNgW8uWqlp8OyklcBeJYJTG2XWCBWobD/Uk0+ZAsYPqdkj7eYGhzo6V75CPNPlBrE5BzB1sdbBQ
	+ofb402g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ5-0000000BCit-0CWq;
	Tue, 01 Sep 2026 08:09:55 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ2-0000000BChf-1Rp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:09:54 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-484357599a4so1963417f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250189; x=1788854989; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOlndonvEZP0CR94Cc2FsO9Rx3c4GS5z/xPo6WTOAkQ=;
        b=COTPIQN4XedLs3yeNRrLRHWO6B9s8w/Xfr+ITAGWR1q9DRpEE0ehRkWZHaIYbVXRpR
         xsfD1o6iL794Bw3vqe4RGOq5XiNDZ9fJMqH/cbh5PcHb2C5jbLZ+CbcuUOvJWdzYXus6
         vw8rUBhrWGjwD90tBT+lFxxQq6oN5mST4TjHiRcyDpLZ2WjZU+EnuZiVu7oBt1g8gvsh
         vmU+j58l1dpF+y73Gf1pbqdUuk0U5yv2qTK54RVQcDu5CEsmJX5E8MfNbEjOvoaoKSaG
         ctOxRvmbvBxDiZmUacxOr9ChX21zgCJGJnXfhSaLWSMmmyFkOrDhQGt2q9xstZv4t4w1
         zrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250189; x=1788854989;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOlndonvEZP0CR94Cc2FsO9Rx3c4GS5z/xPo6WTOAkQ=;
        b=BBOsc0yCpKtOvbegr5/aKXyg8cBFf2Ic9QoZX6I3CGjVp+GrFcFKJrQ3fMzol4SVmn
         6BP2O01KxWRiD3NsMZZKmlvmo9jvGAKZwBewr9AiZSr5VoHN8da6vmYsqF9lBAzUHZke
         +yhlLz+mUtRl7fcCU7jX398V5OaoZOUuTyYcPo/LFoBvnx+aTCL4zeUIOpMcMxicmO2S
         TaSW4kXimDMxqxO/nHbh2qN40OEyv/Vog9L9PrdOviGjdBZrO+oQp1bSNCIDkQnAl04O
         XANMfQtKnGjnUe1VjOHEUPVt2En/vntV9z6axpvPPTCjSaqMuVeqohYoqk9ANZKHag0Q
         UtOA==
X-Forwarded-Encrypted: i=1; AKwUvByYSaDI/IxZfJumD4x8jczcgEeQxqpnFnJYuh7w3CxAS6ZKHt320xUKLwd/eWS6h6D2VC4AiMsmJb4Xe4L6fip0@lists.infradead.org
X-Gm-Message-State: AFuF++maUJ3q9FCV8YxHEBiAAkTNTokPoInuUQe46PBkuQ25mYr39fBi
	pa9AcxtsJQx96HfuXZKdGB4PyqzX+BxVlDacppCgciLFZPAlJl7OR7/8X+VIhx7BvjZzjYb0smA
	4EvsjS5FMtvJqF3JPltXSgw==
X-Received: from wrtr18.prod.google.com ([2002:a5d:4e52:0:b0:482:552d:4ec4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e803:0:b0:484:3310:710f with SMTP id ffacd0b85a97d-4844103b6a0mr9747213f8f.27.1788250188977;
 Tue, 01 Sep 2026 01:09:48 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:23 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-1-vdonnefort@google.com>
Subject: [PATCH v5 00/18] KVM: arm64: Introduce pKVM hypervisor heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010952_725092_E10FABD3 
X-CRM114-Status: GOOD (  19.33  )
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

pKVM historically lacked a dynamic memory allocator: all hypervisor-side
VM and VCPU structures had to be sized on the host, allocated as
contiguous pages and donated to the hypervisor.

This design tightly coupled the hypervisor's memory footprint to
host-side constraints, complicated memory reclaim, and severely
restricted VM scalability.

This patch series introduces a dynamically-mapped custom heap allocator
(hyp_allocator) to the pKVM hypervisor. The initial users are the
pkvm_hyp_vm and pkvm_hyp_vcpu structs, and the hypervisor tracing
metadata.

In the near future, this heap allocator is expected to be leveraged to
support SVE in protected VMs and in the distant future, it will also
support dynamic device assignment.

By moving to a hypervisor-managed dynamic allocator, we also allow
deduplicating the donation/reclaim path of EL2-private structures.

The main building blocks for this series are:

1. pkvm_hyp_req:
----------------
When the hypervisor heap allocator goes out of memory (-ENOMEM), it
suspends the hypercall, embeds a PKVM_HYP_REQ_HYP_ALLOC top-up request
into the SMCCC HVC return registers, and exits back to the host.

This building block will also be useful for the future huge-mapping
support in protected guests, allowing EL2 to raise requests such as
block splitting back to the host.

2. hyp_allocator:
----------------
This heap allocator manages a reserved VA space range, dynamically
mapping and unmapping physical pages on-demand to minimise the pKVM
hypervisor footprint. As memory is reclaimed and relinquished to the
host, unmapped holes are introduced within the VA space. To prevent
orphan mapped regions, neighboring unused chunks cannot be merged if
they are separated by an unmapped region.

The allocator chunk metadata is stored directly into the VA space range.
To minimize metadata overhead, chunks only link to each other via a
relative 32-bit offset.

A simple hardening of the metadata is added via a simple 32-bit hash.

3. shrinker:
------------
As the heap allocator isn't reclaimed actively on VM or tracing
teardown, a shrinker is added to allow the host to reclaim unused memory
from the hypervisor when the host is under heavy memory pressure.

Changelog
---------

v5:

  - Remove unreachable !prev checks in hyp_allocator_destroy_chunk() (Fuad)
  - Add kerneldoc to pkvm_call_hyp_req() (Fuad)
  - Avoid duplicate handle___pkvm_hyp_alloc_selftest() definitions when !CONFIG_NVHE_EL2_DEBUG
  - Chunk pkvm_hyp_reclaim() with cond_resched() to avoid blocking in EL2
  - Allow shrinker to scan across all runtime topup IDs
  - Reclaim chunks before draining allocator->mc in hyp_allocator_reclaim() (Fuad)
  - Make is_ttbr1_addr() check in __kern_hyp_va() conditional to pKVM (Fuad)
  - Rename pkvm_memcache to stage2_mc
  - Rebased on 7.3-rc1

v4: https://lore.kernel.org/all/20260731143541.956291-1-vdonnefort@google.com/

  - Add kerneldoc to pkvm_remove_mappings
  - Allow pkvm_private_va_range_pa() to work with block-level mappings (Sashiko)
  - Add rollback and harden pkvm_map_private_va_range input (Sashiko)
  - Add missing mc count into reclaimable memory
  - Differentiate -ENOMEM from hyp_alloc in errno_to_smccc() (Sashiko)
  - Collect Fuad's Tested-by

v3: https://lore.kernel.org/all/20260720171513.1415357-1-vdonnefort@google.com/

  - Remove unsafe WARN_ON(hyp_spin_is_locked(&pkvm_pgd_lock)) check in hyp_allocator_alloc() (Sashiko)
  - Modify MIN_ALLOC_SIZE to 16-bytes to comply with FPSIMD alignment requirements (Sashiko)
  - Allow hyp topup/reclaim HVCs pre-deprivilege
  - Add enum symbols to pkvm_hyp_req_handle event (Fuad)
  - Various clarification in commit descriptions (Fuad)
  - Restore unmap_donated_memory() for PGD on error path (Fuad)
  - Renamed __hyp_allocator_map -> pkvm_map_private_va_range (Fuad)
  - Collected Fuad's Reviewed-by tags
  - Rebased on 7.2-rc4

v2: https://lore.kernel.org/all/20260706175415.2604046-1-vdonnefort@google.com/

  - Rebased series on 7.2-rc2.
  - Use scope-based hyp_spinlock.
  - Fix best_missing/best_data_size priority in hyp_allocator_find_efficient_chunk() (Sashiko)
  - Fix missing free_hyp_memcache() in pkvm_hyp_topup() (Sashiko)
  - Fix unused selftest_init() warning when !CONFIG_NVHE_EL2_DEBUG (Sashiko)
  - Fix missing shrinker_free() in teardown_hyp_mode() (Sashiko)

v1: https://lore.kernel.org/r/20260520152650.4107895-1-vdonnefort@google.com

Vincent Donnefort (18):
  KVM: arm64: Add pkvm_private_va_range_pa
  KVM: arm64: Add pkvm_remove_mappings
  KVM: arm64: Add pkvm_map_private_va_range
  KVM: arm64: Add a heap allocator for the pKVM hyp
  KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
  KVM: arm64: Add pkvm_hyp_req infrastructure
  KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
  KVM: arm64: Add reclaim interface for the pKVM heap alloc
  KVM: arm64: Add selftests for the pKVM heap allocator
  KVM: arm64: Add a shrinker for pKVM
  KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
  KVM: arm64: Move hyp_vm refcount into the structure
  KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
  KVM: arm64: Alloc pkvm_hyp_vcpu using pKVM heap allocator
  KVM: arm64: Rename vCPU pkvm_memcache to stage2_mc
  KVM: arm64: Reject hyp trace descriptors with fewer CPUs than
    hyp_nr_cpus
  KVM: arm64: Reject hyp trace descriptors with fewer than 3 pages
  KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator

 arch/arm64/include/asm/kvm_asm.h           |    4 +
 arch/arm64/include/asm/kvm_host.h          |   16 +-
 arch/arm64/include/asm/kvm_mmu.h           |    3 +
 arch/arm64/include/asm/kvm_pkvm.h          |  117 ++
 arch/arm64/kvm/arm.c                       |    4 +-
 arch/arm64/kvm/hyp/hyp-constants.c         |    2 -
 arch/arm64/kvm/hyp/include/nvhe/alloc.h    |   28 +
 arch/arm64/kvm/hyp/include/nvhe/mm.h       |    3 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |   19 +-
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |    4 +
 arch/arm64/kvm/hyp/nvhe/Makefile           |    2 +-
 arch/arm64/kvm/hyp/nvhe/alloc.c            | 1211 ++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  125 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c      |   10 +-
 arch/arm64/kvm/hyp/nvhe/mm.c               |   79 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |  104 +-
 arch/arm64/kvm/hyp/nvhe/setup.c            |    6 +
 arch/arm64/kvm/hyp/nvhe/trace.c            |   70 +-
 arch/arm64/kvm/hyp_trace.c                 |   15 +-
 arch/arm64/kvm/mmu.c                       |    6 +-
 arch/arm64/kvm/pkvm.c                      |  200 +++-
 arch/arm64/kvm/trace_pkvm.h                |   45 +
 22 files changed, 1915 insertions(+), 158 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.897.gb25b4bd76c-goog


