Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A18CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M15/H5SXZ3Wzm+97G4xOFVhr5vUJMWE6LcDVgXk/KoI=; b=X1Ybri3Znn+j+kxFvlhebtPsMU
	4BEW+TiPQORk4SC7Iu3jzQJbMMUMoA3Y1VIOLXJzSUTOztCHxfxTPdPaTg1MmJBB/AYTCitKnfOxs
	yZjf8+6fyMbnX7cOgbXHtdmCX7RBSOSuYxxGxvVaBnnM1u02GfNePZDZz2orNpab2p6NPzwJv7shb
	dW6KTulmnfmfNTEt1x0G3f2meR0HIIMVM1nQxm0ygopJSQlq/Jk0rESgZSNi92Hm3oic7cWQhKwBc
	NpP9Gk6ggh3YTr5kQQgt282BZFBxdi+uWNsoS574uYfZbBM5V44+F1oEAbRraX/FLMHJlQRkpetUs
	ixRNen8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4g5-0000000BGR0-1iDQ;
	Fri, 12 Jun 2026 16:24:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4g3-0000000BGQB-0y97
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 16:24:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490a76757e5so9184305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281453; x=1781886253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M15/H5SXZ3Wzm+97G4xOFVhr5vUJMWE6LcDVgXk/KoI=;
        b=BUGFfmII26UYM+P47N5DXnTJsEfRfhyB2i4H23SGWmh0o3LpTU5r0jVSCfQdv3icyx
         RxIKGSrHmRL59nsg1JBb3NjKtTKcJYHE4EIG8hXOJiv6h8hOoJYU4c3Bi/NohoTCxyAl
         d+tJcWo1a3MpFqBydy0a/u76l8hKVpayKVxPf2qG5BeGx0n2SupAgK8MHRlzJhp6bn1q
         1TAk7NB4Vl39W9tNUs3ACkFw/OnScz+coJXn0/eH088Fh9jT2ayCRl2syLuIEPOEoGSD
         ees5JTTaySbMoyegf7aW0rBmcHBkIO/8UV9KH8YCVDnmaesilpDxtPIaow5J+DqZdw2k
         G6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281453; x=1781886253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M15/H5SXZ3Wzm+97G4xOFVhr5vUJMWE6LcDVgXk/KoI=;
        b=pcAVEpZNjr1aExU9Rw1ZQhK4yO0zMN3wY9SMoDr60s6rGIk9I0J55AUecl1yNiSGhL
         fmrRLAsEjrfloVm1MAm9/QvOenqj65r3EGjWDwkf2NAuLin0ASQNZKMVg2mJMXuO7V2Q
         Q9y0aeGPnC7rBllACIsCXV1lGCHH8gxADbcmtSGWKh0bgJ9yBhmYxmPaHNJHNKmBgxQc
         0bo32ovKtKdByg2wRRx5rd1y99BMrdo7I79trRqLuoO8dCZlWikTSKqZVUQFyAZVbZpr
         3TYyRoxWKwohR1k5Ffh3Oj3GkPIZeYW8+uOv+1VqHv/R6qTczTm8ia/bduUAfy9KXyVm
         cleA==
X-Forwarded-Encrypted: i=1; AFNElJ+ikW6qTAe1VkjZboMTATAtPG5BtXgx3PvPvxaOfQHwWZHz3kPC+of3/qXYm7TNn5YGGi8m45s/jaJiHkzQMvOn@lists.infradead.org
X-Gm-Message-State: AOJu0YyVMP46SL444ZQCGt1IwyZoRL91vrhD6v216x34WQIXf1OJDItP
	hBDU6UHDJbgaRyMmXrVDif97tDsaBzuJQ+uBffcbPJ++ob2fqQ40CQ64
X-Gm-Gg: Acq92OGw4R0YxL7qQ9z0FFN/8x5cafhN8mxz86Z31fgpItS8cPi885GbUz/v17ef/oz
	zMCn4eI+YlhCvGPgaLZGCmtgZNWSIilkSy0FviPEI9HpYCbp1ZXIL8S55nsHYN2ISgIpP85z42f
	qlg1tfM8DGQo2KPG9rBb1x0WWq97K1ZCzoigrmIl2YdAvO0YIYucRNRq5JZ9jOPNJm29S8OdCtU
	CJiohopg9l/kg9DbtEdSZQElNdnlwtCaawDZ5fs/cOn6pobfjn4oe7pYNlV3WcLlZiQl3Lxc1LR
	aEWdY5t4tJ5pVofGTBvy0mEfaT1Mob9q1IzaQj3xi+Aw5e1P1ggIQh9R32YxVW9qhSeMroup89W
	PUEjTI+iAoGXSXl2Aue1fPOZp530M4uRUPC3mxl9f0MGB5Q97Nc4nPkycVpFJeSDPN4B/aGidwF
	etuIWKBnCUChztyjMWuhiTpnRuEt505/j21YvqfAGUhtiwqPSiqNYn+f6v61dnSA==
X-Received: by 2002:a05:600c:348b:b0:490:e5c1:b89e with SMTP id 5b1f17b1804b1-49220061e38mr2167415e9.10.1781281452911;
        Fri, 12 Jun 2026 09:24:12 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c51dsm57620935e9.1.2026.06.12.09.24.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 12 Jun 2026 09:24:12 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net,
	vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com,
	Jack Thomson <jackabt@amazon.com>
Subject: [PATCH v5 0/5] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Date: Fri, 12 Jun 2026 17:23:48 +0100
Message-ID: <20260612162354.73378-1-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092415_297231_28723565 
X-CRM114-Status: GOOD (  16.72  )
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

From: Jack Thomson <jackabt@amazon.com>

Hi,

This series adds arm64 support for KVM_PRE_FAULT_MEMORY, which was added
for x86 in [1]. The ioctl allows userspace to populate stage-2 mappings
before running a vCPU, reducing the number of stage-2 faults taken in
the run path. This is useful for post-copy migration, where stage-2
fault latency shows up directly in memory-intensive workloads.

On arm64, the GPA supplied to the ioctl is treated as an IPA in the
userspace-owned VM's memslot address space. If the vCPU most recently
ran a nested guest, KVM still targets the VM's canonical stage-2. It
does not interpret the GPA as an L2 IPA, and does not try to populate
the nested/shadow stage-2 selected by the vCPU's last run state.

The patches are:

 - Allow callers of kvm_pgtable_get_leaf() to pass walk flags, so the
   prefault path can walk stage-2 under the MMU read lock.

 - Add arm64 support for KVM_PRE_FAULT_MEMORY.

 - Enable pre_fault_memory_test on arm64.

 - Add a backing-source option to pre_fault_memory_test.

 - Add a nested (NV) selftest that prefaults on a vCPU whose last-run
   context is backed by a shadow stage-2 MMU with an empty nested
   stage-2 root.

The prefault flag and page_size output in the stage-2 fault descriptor
remain in this series so the arm64 implementation can advance by the
mapping granule installed by the fault path and report poison without
queueing a SIGBUS.

Tested with pre_fault_memory_test under an arm64 QEMU setup with
anonymous, shmem, anonymous_thp, anonymous_hugetlb and shared_hugetlb
backings, including 64K, 2M and 32M hugetlb pools, and with the new
nv_pre_fault_memory_test on an NV-capable setup.

=== Changes since v4 [2] ===

 - Reworked nested virt semantics: arm64 now treats the ioctl GPA as the
   VM/memslot IPA and always targets the canonical stage-2. It no longer
   translates an L2 IPA through L1's stage-2.

 - Documented the arm64 nested behavior in the KVM API text.

 - Switch to the canonical stage-2 with the vCPU put/load helpers when
   the vCPU last ran with a nested/shadow MMU, keeping VMID, VNCR and
   shadow-MMU refcount state consistent.

 - Split the kvm_pgtable_get_leaf() walk-flag plumbing into a prep patch
   and walk existing mappings with KVM_PGTABLE_WALK_SHARED under the MMU
   read lock.

 - Tightened prefault fault handling: preserve fault info, set IL in the
   synthetic ESR, handle existing mappings, return -EAGAIN for invalid
   memslot races, and report -EHWPOISON without queueing SIGBUS.

 - Avoid directly walking stage-2 page tables when pKVM is enabled.
   Protected VMs remain unsupported via -EOPNOTSUPP.

 - Preserve the selected selftest memory backing when recreating the
   racing memslot.

 - Add the nested (NV) prefault selftest, including an empty nested
   stage-2 root to catch accidental L2-IPA interpretation.

=== Changes since v3 [3] ===

 - Return -EOPNOTSUPP for protected VMs.

 - Reworked nested-vCPU handling to translate an L2 IPA through L1's
   stage-2. This has been superseded by the canonical VM-IPA semantics
   described above.

 - Make page_size unsigned and keep local declarations ordered at the
   top of kvm_arch_vcpu_pre_fault_memory().

=== Changes since v2 [4] ===

 - Update the synthetic fault info. Thanks Suzuki.

 - Remove the selftest change for unaligned mmap allocations. Thanks
   Sean.

[1]: https://lore.kernel.org/kvm/20240710174031.312055-1-pbonzini@redhat.com/
[2]: https://lore.kernel.org/linux-arm-kernel/20260113152643.18858-1-jackabt.amazon@gmail.com/
[3]: https://lore.kernel.org/linux-arm-kernel/20251119154910.97716-1-jackabt.amazon@gmail.com/
[4]: https://lore.kernel.org/linux-arm-kernel/20251013151502.6679-1-jackabt.amazon@gmail.com/

Jack Thomson (5):
  KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
  KVM: arm64: Add pre_fault_memory implementation
  KVM: selftests: Enable pre_fault_memory_test for arm64
  KVM: selftests: Add option for different backing in pre-fault tests
  KVM: selftests: Add nested pre-fault test for arm64

 Documentation/virt/kvm/api.rst                |  18 +-
 arch/arm64/include/asm/kvm_pgtable.h          |   5 +-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  10 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   5 +-
 arch/arm64/kvm/mmu.c                          | 164 +++++++++++++-
 arch/arm64/kvm/nested.c                       |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   2 +
 .../kvm/arm64/nv_pre_fault_memory_test.c      | 200 ++++++++++++++++++
 .../selftests/kvm/pre_fault_memory_test.c     | 150 ++++++++++---
 11 files changed, 513 insertions(+), 45 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c


base-commit: 98f826f3c500fda08d51fca434b7aefa6a2f7076
-- 
2.43.0

