Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25497CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WeoJSJ0MqyLbtcMbjfaohWji+oxZtM4gtXCKIX1KQ+4=; b=IrGrjLkv1EpI3S3FvFDNvyLkP6
	P6rT6CsIUspfPyIC4A9gppjsbS6HhjK1jixSappgOVE0iNCTHBu3ZjbZKBtD9dGqwTyXcrEbYtdT7
	1yPHn+eCNJ7OR/7u7yosEmRd1AWeqY/CO8y39nhV6efEWbrgW2GxJddhyZr4PO3Fy4EEdzophFbSN
	we3SQmB7+HwLLBHcZiScUsgXNMf4E29HhXfErhcUaekyXUlsMLAC9algSg65XgnaUgnT23cyGTW83
	zPSVw+UzDfWl25gJVjUP6H5Zc2g4pS8lM6FKe5+/CY68rt1rk1lMwDu69B3BXuKh0lGarleP8MKMa
	WAHKrFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmO-00000009N6a-42XY;
	Thu, 01 Oct 2026 14:29:00 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmL-00000009N5S-2TQr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:28:59 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a013ea30c0so18119085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864935; x=1791469735; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WeoJSJ0MqyLbtcMbjfaohWji+oxZtM4gtXCKIX1KQ+4=;
        b=E4kN66rna2mI0/430uvdIpJnIgd0gVmN2sIcOKdb4hNcXBAn/Dhq4CaCy9W89XRiJ0
         aTEwG6PfJ68DE8qLy0M4qG11p26dSWlBH7M0YqUFOHyhAI4lpizVKOKyz4yXufxmzjDd
         xD1kekuuCG8d5VrTkRAVxEG25JmqALghYy+3402ABDTPfBlTGIUF09Qs8MVDyE+BQfrM
         /m1AeVTS8ofzffTufoVdmwoMiXn3ohkEkdOPAssoqUsQ/VagVRo0y7SDpp4BQHkVtv3D
         ZsWXnzjl3iDSuFRL3ushoIK2Eb/ks43HCT712EU91u1hUGz2uOdFI23n80m6TlUt+8j6
         lQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864935; x=1791469735;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeoJSJ0MqyLbtcMbjfaohWji+oxZtM4gtXCKIX1KQ+4=;
        b=2HXhnw9LN1N8fwJEU6zkdcguLZsG9V6QI64Zs95EQM/tmP6R2r2lsK6TQbP4HJOsWx
         8IjU3xPS9PwO4IeR21PJAgcZ4rmCVx0RkaTESAAvfa+CG0HdwYkbghGkRbvzTJ5c6rQK
         sAVvJKUykZfzLuqj+x68KhpTkW56tM6NFoQq4azf40VHGmnYBWQEo+T1ynbhQWkM2ciK
         xgjc0KM9KMUxlhlDPJjBuFQMRT1v40sBzGza9hcQnnmvjrqu9c3eI50cHp5ATYjqYIbe
         nLJ6GCoI6p4J+/S9AkbOxFvbFDfHuFB+X2RBxfu82RJ53IL187c77jgLtld5z3jRaVEC
         Q7og==
X-Forwarded-Encrypted: i=1; AKwUvBxLk9kS0GgiLlBqB3zctHfdClXmOHxza8rjZ0/MQ37+X1OjQ0YwcNefEcf1uH/pIFLjiyMMAHEK3oKu+MbPBV/g@lists.infradead.org
X-Gm-Message-State: AFuF++lYTyLHUQaVcgUa6uHiiB0bg/6h/+VZRnZQAEuLsBWB776/zC29
	psjsMM0M6fEQyWKxFWamkENtbhmXzUsAkXicRjGL4h7O2t40QZBxlWbS3o5A9qDIZVJwwk8Y+of
	kFfJaWL4Wjx/o+ASfba+T/A==
X-Received: from wmjk10.prod.google.com ([2002:a7b:c30a:0:b0:4a0:bfe:d59c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d0:b0:49f:fc26:c2d2 with SMTP id 5b1f17b1804b1-4a01b00c5c5mr84075235e9.22.1790864934263;
 Thu, 01 Oct 2026 07:28:54 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:31 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-1-vdonnefort@google.com>
Subject: [PATCH v6 00/18] KVM: arm64: Introduce pKVM hypervisor heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072857_675394_5472BE72 
X-CRM114-Status: GOOD (  18.45  )
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

v6:

  - Rebased on kvm-arm64/hyp-type-checking-7.4
  - make __pkvm_hyp_alloc_selftest pre-deprivilege only (Sashiko)
  - Remove __hyp_private_va_start for __io_map_next to ease merge.
  - Fix sparse NULL pointer warnings in hyp_allocator_map() and hyp_allocator_create_chunk()

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
 arch/arm64/include/asm/kvm_hcall.h         |   19 +-
 arch/arm64/include/asm/kvm_host.h          |   18 +-
 arch/arm64/include/asm/kvm_mmu.h           |    3 +
 arch/arm64/include/asm/kvm_pkvm.h          |  111 ++
 arch/arm64/kvm/arm.c                       |    4 +-
 arch/arm64/kvm/hyp/hyp-constants.c         |    2 -
 arch/arm64/kvm/hyp/include/nvhe/alloc.h    |   28 +
 arch/arm64/kvm/hyp/include/nvhe/mm.h       |    3 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |   19 +-
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |    4 +
 arch/arm64/kvm/hyp/nvhe/Makefile           |    2 +-
 arch/arm64/kvm/hyp/nvhe/alloc.c            | 1211 ++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  129 ++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c      |   10 +-
 arch/arm64/kvm/hyp/nvhe/mm.c               |   95 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |   79 +-
 arch/arm64/kvm/hyp/nvhe/setup.c            |    6 +
 arch/arm64/kvm/hyp/nvhe/trace.c            |   70 +-
 arch/arm64/kvm/hyp_trace.c                 |   15 +-
 arch/arm64/kvm/mmu.c                       |    6 +-
 arch/arm64/kvm/pkvm.c                      |  200 +++-
 arch/arm64/kvm/trace_pkvm.h                |   45 +
 23 files changed, 1931 insertions(+), 152 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: 8bd0e6812a1be71d50620f00445940ded0df897c
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


