Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA5C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVoemQnQmJJ0JZcsgNr0OJzMZbKjQ12R/fuSO3309Tk=; b=LM2Sv/q3EdzDB/muwl0hSqu41R
	9oSN56oJP0d35z5fUmEyLZRqDlzaMEZ5oMPHQliteoL0rMdCW2qrBgZOm/FGwbmW7tBT0Oc6v7oWQ
	CbgxhU0lGstml+c5FN+wCUb8rqzu5r8ykXJVuVy8CYXPqcNZSy/KoJjgSIpqzbU0h83PXV/Ip2B+y
	goOibqYoOfv7t+PkmHbrzlnsFOM0tyycpL7rXpY1kSAzHAN2pHskPxJ6Xy+mrFqc9F6SxG2+JyXbN
	R3T6ZBD0XBpfQ31/RCzeCGor0HOxc24MNWK2gZAsTq8a88thM17bhB8oUipQqfE/+Kl5xHAEvtX3+
	AeVKSg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraS-00000007UlE-0ApS;
	Mon, 20 Jul 2026 17:15:28 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraK-00000007Uh2-3xNk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:26 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-473bc66c837so8705069f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567718; x=1785172518; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVoemQnQmJJ0JZcsgNr0OJzMZbKjQ12R/fuSO3309Tk=;
        b=PjxRtD1FhfsEdC2CLf4KkbEUsbaiCseTZLx7BmSR2HnS0vL4IEhWJJhu4nmji/olpR
         oM8T+b6Ur9XoUiMcoE5MI5cbWEYNUU0qgAsEGEKY4UMgcsaoO729JmBwo2K7mKS2GvSH
         5TpazrpEPni3t4hGcTRBGYG3T7sdhkpXUFg4dLVfPPqexGW0AqF36osLOhMEL+TTlc/u
         3Xo3q+pQdcpPFs7GafWyMdFa9wRsttdeZT3dDnnjogpN/xAeOhqNud8dfKnbsgm+vXDc
         CUAXKeI7dl2lL7hMwoK2gyMCM3AMt0DfYLmV9G+Hl2nxE1tzNjG69x/rn9hS6WOftmSd
         EwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567718; x=1785172518;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVoemQnQmJJ0JZcsgNr0OJzMZbKjQ12R/fuSO3309Tk=;
        b=HMTYSF5NfcKoQ9r6vTAm8lOKALO1Ct9lVSl3RJkDZpXhj8UU5GNX92R4dgAICBmihF
         SIdD6eYrUsTq0/MRkLouqKWzW8pYfXHgBBWhY8DCoTzTxGRwIfMLoi6ebLFF4VRow/8p
         R1P2G/uZ7Lm3pldIGSCsY1ugudz+AfNbN2AwU2UPSti8qPo/9M6zNSUr26PIBaHTBIe9
         MWZO86t91ePn1VvM+ID8gcB09UVJqrCJMvc16K0Gy89UCTijfysw2cgARgvRt5taRH6q
         gLtFJPNTY0WCIv8yp46qp903vRpQrT7Hq/AloUQBHsC5WqpyLsCiCyx941jxRXx6s57D
         XDFA==
X-Forwarded-Encrypted: i=1; AHgh+RqbAPn8YmWAZtXOk41RXrxePaj56vF7WKRkJ8nBalTgMCzQXhN3Ebh5HN3PGBM+0YEQB0jQCWM6/MyfUChDwMy+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt0iSnTyeNj6HEVuiZTe7q5Uljckvn1bKt18BGEveTaA5+N1pv
	WWkeWK4jIzXGa8RtBuKvKdXdRJHJuBIbhK1MJSzT1NGcA4lPA6AKhYbUjwIU1ggztXI9niNmXN+
	e+aEZpkgxzqi+NgWwNSTAbg==
X-Received: from wruj14.prod.google.com ([2002:a5d:618e:0:b0:462:70f1:9ee8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e195:0:b0:475:a4ae:e630 with SMTP id ffacd0b85a97d-47f623364bfmr18006292f8f.37.1784567717745;
 Mon, 20 Jul 2026 10:15:17 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:14:56 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-1-vdonnefort@google.com>
Subject: [PATCH v3 00/17] KVM: arm64: Introduce pKVM hypervisor heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101521_008095_00590816 
X-CRM114-Status: GOOD (  15.94  )
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

v2 -> v3:
  - Remove unsafe WARN_ON(hyp_spin_is_locked(&pkvm_pgd_lock)) check in hyp_allocator_alloc() (Sashiko)
  - Modify MIN_ALLOC_SIZE to 16-bytes to comply with FPSIMD alignment requirements (Sashiko)
  - Allow hyp topup/reclaim HVCs pre-deprivilege
  - Add enum symbols to pkvm_hyp_req_handle event (Fuad)
  - Various clarification in commit descriptions (Fuad)
  - Restore unmap_donated_memory() for PGD on error path (Fuad)
  - Renamed __hyp_allocator_map -> pkvm_map_private_va_range (Fuad)
  - Collected Fuad's Reviewed-by tags
  - Rebased on 7.2-rc4

v1 -> v2:
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
 arch/arm64/kvm/hyp/nvhe/alloc.c            | 1223 ++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  124 +-
 arch/arm64/kvm/hyp/nvhe/mm.c               |   51 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |  100 +-
 arch/arm64/kvm/hyp/nvhe/setup.c            |    6 +
 arch/arm64/kvm/hyp/nvhe/trace.c            |   70 +-
 arch/arm64/kvm/hyp_trace.c                 |   15 +-
 arch/arm64/kvm/mmu.c                       |    4 +-
 arch/arm64/kvm/pkvm.c                      |  159 ++-
 arch/arm64/kvm/trace_pkvm.h                |   45 +
 21 files changed, 1831 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.55.0.229.g6434b31f56-goog


