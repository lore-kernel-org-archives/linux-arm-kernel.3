Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A372DC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sK5d2FXANLt47SMUgxpLbGKpKt0pgzFr6mPV9F5aVAQ=; b=ge2q5NnpX2I9k8Gh2xm4DrRVoa
	Q4Ap7ir2jdXT4jwDFP5wYoFHaY+uXkKgcaRDzSTe2X2v+B5vhx7qZ5z28wag22snm/sxZefBpkLMo
	vhlKoKhTgBNgykvN92Qp5kdDXBLZSqnYYu9m02+9YwLNYFAHQHFVsZUUjEBOHjUF2iYHBfXQ0mB6m
	wPHpNFiYkTN5cZk7E90TjSKF1etagWbmELWvE8d4ONzv1JPdO5d7gxC+StufnZcHIG61Hr3QJFge5
	EkNkFSQuoaO1+MonWl/1av9nktlycPrGDRCOC5dzenjPvo3SzFM+b4n+7pPMTugOrLjy0s70MpwYh
	x91JwKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLA-0000000CjSM-1RcV;
	Fri, 31 Jul 2026 14:36:00 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoL7-0000000CjQo-2dak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:35:58 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c16740eb587so96824766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508555; x=1786113355; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sK5d2FXANLt47SMUgxpLbGKpKt0pgzFr6mPV9F5aVAQ=;
        b=a8e6TqUQzsE8bI0oU8vjIzmLcsrg4Qxf5+VQkD0ss3FAqbJk7hToW/gQXw7YR7Wb1B
         c2rF1JMxttpn3OFZ7AmidfsIhQTdXA/ZEkVa9IsCiAKYwfOHRJmi7sd4P2Eyb1nv4zvx
         lMFtl9bWHm5kGnZxJ6Cx3nsDm0Y55L4+JOEVI8iooXywbqGK6xPnBe43X5J/7AiP1ZIL
         4KoEKMcczYoqEawl60OVDoLA1tHwjayNJYF4fJuM3brCb0kUz15rzQCIxMfaufDdACFG
         3a6JmNUPCmHa358NcWfeXLDVGDuByjdwXK5asaL+q2S4OG40KfkTZ9y04w9KjWyG6Jjm
         9wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508555; x=1786113355;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK5d2FXANLt47SMUgxpLbGKpKt0pgzFr6mPV9F5aVAQ=;
        b=aTNwz5PmMC5Jy4pU2O33oS8VoT4RVS16ZinyjtlBdsns6kPTnoxpiK6d6t0GDSWTvv
         yiexgyjyPubh9lJqW56F5OcFzpztZiS7pzjHCPl0/xHx8lvaIEkphtN6C/mXrcEDTNTL
         XDMiGO5/IogZP0laK47z+7lAg1b5qfpjCjrz9a0yGKclBUr0sFD8+amQ3b9j7jDTvkFy
         8sOR/uoavTQaQNgrVHgOXlb+qklBwLxuGP+sFeKwHMutRDGvX+zUs/nnkFJauOtKJdPM
         oNtkG7BNOvzhtuGCyoMvnLrXT1mnzR9J7Mv4RxghV88y0rFCOTIYVGYlJnnEmpAVscLw
         80Kw==
X-Forwarded-Encrypted: i=1; AHgh+RqWCCE5zE5pBolwuGe9d0nxLU6uA0pV6pdstXNqjKLMxL7GpkqPFmgs7+qGALZoTJHSIrznBuBX6lRfJn0DA1w6@lists.infradead.org
X-Gm-Message-State: AOJu0YyFSH+j89FtZpDyDxmcVJ7LFWxbLrvHAursZ7gEL6F8sIQIZRGn
	F1SDC/Gv+5gQf1j9H6qw/uB0H/4jLYRegRD6XKtFr32gfQ5Caz9d1UJ0a8EEWMwFPDGBscUMAlR
	PUVvuKzB9mLpYxySEYdoDZg==
X-Received: from wmte19.prod.google.com ([2002:a05:600c:8b33:b0:495:59dd:24f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:9f92:b0:c15:e07a:eb4b with SMTP id a640c23a62f3a-c1fd200f131mr138962066b.3.1785508554441;
 Fri, 31 Jul 2026 07:35:54 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:24 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-1-vdonnefort@google.com>
Subject: [PATCH v4 00/17] KVM: arm64: Introduce pKVM hypervisor heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073557_695822_B303BD10 
X-CRM114-Status: GOOD (  16.74  )
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

v4:

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

Vincent Donnefort (17):
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
  KVM: arm64: Reject hyp trace descriptors with fewer CPUs than
    hyp_nr_cpus
  KVM: arm64: Reject hyp trace descriptors with fewer than 3 pages
  KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator

 arch/arm64/include/asm/kvm_asm.h           |    4 +
 arch/arm64/include/asm/kvm_host.h          |   14 +-
 arch/arm64/include/asm/kvm_mmu.h           |    3 +
 arch/arm64/include/asm/kvm_pkvm.h          |  102 ++
 arch/arm64/kvm/arm.c                       |    2 +
 arch/arm64/kvm/hyp/hyp-constants.c         |    2 -
 arch/arm64/kvm/hyp/include/nvhe/alloc.h    |   24 +
 arch/arm64/kvm/hyp/include/nvhe/mm.h       |    3 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |   19 +-
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |    4 +
 arch/arm64/kvm/hyp/nvhe/Makefile           |    2 +-
 arch/arm64/kvm/hyp/nvhe/alloc.c            | 1225 ++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  129 ++-
 arch/arm64/kvm/hyp/nvhe/mm.c               |   79 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |  100 +-
 arch/arm64/kvm/hyp/nvhe/setup.c            |    6 +
 arch/arm64/kvm/hyp/nvhe/trace.c            |   70 +-
 arch/arm64/kvm/hyp_trace.c                 |   15 +-
 arch/arm64/kvm/mmu.c                       |    4 +-
 arch/arm64/kvm/pkvm.c                      |  159 ++-
 arch/arm64/kvm/trace_pkvm.h                |   45 +
 21 files changed, 1866 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.55.0.508.g3f0d502094-goog


