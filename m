Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R1Fq6vKEPrXMgPLx08XSndJMwPqltkg40bPnPrjHOfI=; b=QVmWIVm+9z5X8qO2rBbIAivCcQ
	u2+8JsygJBAZD0YWHJSssfsy5V/iSkruLArZq0dSA/jycna6vbiNiGYDRirVbUcmJUIQajKCxsGXD
	pt5lw3w8X7qPdnfrBzXkzdFn9WoFlDTiaSbtWj/6GMeGT3ik5mJU9F4ZepnWqbFHLKb1S4kWuCUtx
	jGmGLs0U2dEo3HBDvzy7Oa7guBBokoTg8Sdg4N0S8DgfLZypT6ijerwYjF4pBB8Wp1zwtpmTZla3r
	S7jfCF3Cuzhx64CmllG1+2pRSGBGYb+K2f96cBirJoZAX3Z7URmy11Y5p85RqJJQb0Cd0iS0S+4rK
	NNoICHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWW-0000000DFZm-1Rao;
	Mon, 06 Jul 2026 17:54:28 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWS-0000000DFXr-3TbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:26 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4784d0fb9cfso1706460f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360461; x=1783965261; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R1Fq6vKEPrXMgPLx08XSndJMwPqltkg40bPnPrjHOfI=;
        b=DN91PRNt/wR2wtlxoNu9M1Vabn5LEb5Sk7KHkAXQRQIjt6SsYTmgk37OPqutrc/9/r
         JFy7JCIf4su9uQrTmXk12SPDu6CNSEb4QC14ubgUIiX90dMNh0YJZPmDvy/am3qDIMDO
         A8/GuMOZyfNTlXvwT0s2+CaLLqGrwIE10kAt/UBCw/YSMuu2DzBO46reGKdch6EbvS75
         hRjQKbx/B6fFREORMdpwRFko0M76eoAF/8/SNXWcXVzpOcuDvGmU4oRQvI2x6t4y5e81
         4kNXGsdsMUlhEOVfIk8NZ1epESP9FPMoHhpu/N4BEvypFBLKcaphPkW7dvjQPsnF5CTn
         qVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360462; x=1783965262;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1Fq6vKEPrXMgPLx08XSndJMwPqltkg40bPnPrjHOfI=;
        b=d5EV6fa3BYO2yHBS2nY1NZDnv39TU7hSWObf5ien4x4E6YZCwMMTBm5O4Y9rfu+rQX
         9WqI1Z46evWGYYAZn1hgeYa8HoD9lles8VBhL3kqIsR/qokAXj4whZXnVwjgDNED8Nsi
         VtakHLTOf7DxP10R4w6qYIOA9LMUCAyYyDru6FpySn0dtSwtjfwquqChzVpZ1Df73MC2
         ZQKJFcktC3eoo5Azq9nnS20a6SRXCNJlo507mSfNsXE7xX39UDkxCPXhTa+EdG9uw7fH
         3BP73SKt0PbQYwwANRdPe2JYSBoJj5SOheeReQ+YWwpDtmtOZQgBo+5+S4OfKdqAc72S
         4fYg==
X-Gm-Message-State: AOJu0Yy20HqIvCFoV31uhTCj39LuKFoC9SYC5F3sLum04vOx+xc5Md7v
	hYDh0EyhR9Yuus67CIUX9bB6CCNd8oVo1Jj0gUyPAkcic/L1yCniraM6owIG4XgBOkQMZybJw6J
	hEv5ixT9ylIcs8w9ERk1SRg==
X-Received: from wrpx16.prod.google.com ([2002:adf:f650:0:b0:478:511d:6f9e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29d7:b0:46f:a0f1:c346 with SMTP id ffacd0b85a97d-47de66fdd24mr1141479f8f.29.1783360461311;
 Mon, 06 Jul 2026 10:54:21 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:53:57 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-1-vdonnefort@google.com>
Subject: [PATCH v2 00/18] KVM: arm64: Introduce pKVM hypervisor heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105424_896007_EC61A45A 
X-CRM114-Status: GOOD (  15.47  )
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

v1 -> v2:
  - Rebased series on 7.2-rc2.
  - Use scope-based hyp_spinlock.
  - Fix best_missing/best_data_size priority in hyp_allocator_find_efficient_chunk() (Sashiko)
  - Fix missing free_hyp_memcache() in pkvm_hyp_topup() (Sashiko)
  - Fix unused selftest_init() warning when !CONFIG_NVHE_EL2_DEBUG (Sashiko)
  - Fix missing shrinker_free() in teardown_hyp_mode() (Sashiko)

v1: https://lore.kernel.org/r/20260520152650.4107895-1-vdonnefort@google.com

Vincent Donnefort (18):
  KVM: arm64: Add __pkvm_private_range_pa
  KVM: arm64: Add pkvm_remove_mappings
  KVM: arm64: Add __hyp_allocator_map for the pKVM hyp
  KVM: arm64: Add a heap allocator for the pKVM hyp
  KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
  KVM: arm64: Add topup interface for the pKVM heap allocator
  KVM: arm64: Add pkvm_hyp_req infrastructure
  KVM: arm64: Handle PKVM_HYP_REQ_HYP_ALLOC request
  KVM: arm64: Add reclaim interface for the pKVM heap alloc
  KVM: arm64: Add selftests for the pKVM heap allocator
  KVM: arm64: Add a shrinker for pKVM
  KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
  KVM: arm64: Move hyp_vm refcount into the structure
  KVM: arm64: Use noclear for PGD in __pkvm_init_vm error path
  KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
  KVM: arm64: Alloc pkvm_hyp_vcpu using pKVM heap allocator
  KVM: arm64: Reject hyp trace descriptors with fewer CPUs than
    hyp_nr_cpus
  KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator

 arch/arm64/include/asm/kvm_asm.h           |    4 +
 arch/arm64/include/asm/kvm_host.h          |   14 +-
 arch/arm64/include/asm/kvm_mmu.h           |    3 +
 arch/arm64/include/asm/kvm_pkvm.h          |  104 ++
 arch/arm64/kvm/arm.c                       |   26 +-
 arch/arm64/kvm/hyp/hyp-constants.c         |    2 -
 arch/arm64/kvm/hyp/include/nvhe/alloc.h    |   24 +
 arch/arm64/kvm/hyp/include/nvhe/mm.h       |    3 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |   19 +-
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |    5 +
 arch/arm64/kvm/hyp/nvhe/Makefile           |    2 +-
 arch/arm64/kvm/hyp/nvhe/alloc.c            | 1217 ++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  124 +-
 arch/arm64/kvm/hyp/nvhe/mm.c               |   33 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |  111 +-
 arch/arm64/kvm/hyp/nvhe/setup.c            |    5 +
 arch/arm64/kvm/hyp/nvhe/trace.c            |   66 +-
 arch/arm64/kvm/hyp_trace.c                 |   16 +-
 arch/arm64/kvm/mmu.c                       |    4 +-
 arch/arm64/kvm/pkvm.c                      |  136 ++-
 arch/arm64/kvm/trace_pkvm.h                |   37 +
 21 files changed, 1801 insertions(+), 154 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


