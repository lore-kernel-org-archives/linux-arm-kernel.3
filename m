Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBC8C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1xJQZhw5yV62Y2vPCQPybVQ771QZon9BJ9XOycOZeU8=; b=0H1R0nC69Si7vatcGluwIBkf5N
	RL3bGJwj+nzIRF13c5c9ZgDmoNmLyxxsalvYad3LXP/j5hE6AyIxCS02BVQPfnnIHAZp55/Z2G1Bt
	4Xi7w3A8sls3kwugljJUE7HlntIynGKC0F/8UrnNnhotrQ17+uaV7JDX+tJfwQ1ceoZPL7+2hok+j
	Va61ZRJL4f5KRm+ZDHCa34NiQuVCGMSXiWkQFWYSeyHg4nojkfoDPHuFZjUyXwC+ZqvNoGIpMwkbZ
	eWwLySJ5ySrcFkrfj+zVOwH4Q5N+lGz6Zv6NcykvEnzMEI2gcRTHSsEYRvQgjOe3fh8p4v9R5E+TZ
	WYyorRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtIZ-00000000Epg-29Na;
	Tue, 29 Jul 2025 22:59:55 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEJ-00000000DjP-0GMt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:32 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7641e7c233cso3730670b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829729; x=1754434529; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xJQZhw5yV62Y2vPCQPybVQ771QZon9BJ9XOycOZeU8=;
        b=XYVv8l6FSfvRsuQehOBQcbXt6GU4gXdJsSURRb/4gSBvdMO6LgeajZ/qoTtJRKGANd
         xDhl6O0RU9Sisfe5MCYEAcNwEAyTSibIH9v527/NqOdbrKdpa0Uau6w2LNILbyqqJmrr
         uRmkA++411DY8fk486zdKf7rnkGVUDQSGpIKylmMhW4n4Qzc+4A1pM6rsfcgL8apkC4h
         7OSivckUQ1PSqdPKLoKr+WBfTpdijdvNjr/3pCi14VdRpr/eAzz5D8FA88bYXyhNXwtf
         D2bGztB1MXO396usvDp7Ine1BB4R2lEcs+GhMBqWD76CLR5OeGl+BK0ZwFst/pqKuub2
         6nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829729; x=1754434529;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xJQZhw5yV62Y2vPCQPybVQ771QZon9BJ9XOycOZeU8=;
        b=K5tOzbpi+u/ZMxy+1w+Qvi//NPEm5Z1fwALUb2vcZ+487QT5TZbZJu4VdgXyiTtpT6
         ihyZb7itS7pH7jcrY22XF63uUF07hf86PTy66ZWCinka+4J3FkAfR0tBpbNM7k66J4CP
         Qr2KZAaQCTVljA0/WTKW9lYnM5UOBBfAo7G8RaW7ldbqv+w4IBHAUY//fbwEYTkeaOZH
         mI8qCFtKS4IWMXE8R+kGehd/BQrOGZOWuCTPn6qZ5HiOHJRhCb9awpbjO06pF1edwMno
         KV4qI/D0GXlpQxNUT+Xi1PlJIhjnUtAseGxW31gt+fuRg8Nt3don//67CA7D9DFIgbf/
         FL7A==
X-Forwarded-Encrypted: i=1; AJvYcCWAd3OQhQBwjNl2oHMegrsnJUGfse3aXfuDPJXIgki2aiatx/J6YDaSgwQ0Oc12+9GAswBESUqAdNo9t7XCEgGb@lists.infradead.org
X-Gm-Message-State: AOJu0YwUPdXUa6bKQvgZLYp8HInyZL+3/DKkG7SGpLRrawprDrd0uwyf
	bOVf/VBmTgvS6qKgQ3/f//0t2KQN02ubhvgB9u5yjBkp+oZXPnIw7dINFbnqhQLRVeOWEKPCER2
	gXBdXUw==
X-Google-Smtp-Source: AGHT+IGaxcWmFDKGwZrWj7pqH7ospcLQPlncerJUmyl/cLjhK8EfQXRjnzM85IkOCzxza2AGNlEEwnrrJ2U=
X-Received: from pfbmb27.prod.google.com ([2002:a05:6a00:761b:b0:746:18ec:d11a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c9:b0:747:accb:773c
 with SMTP id d2e1a72fcca58-76ab2f4beabmr1613976b3a.13.1753829729537; Tue, 29
 Jul 2025 15:55:29 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-1-seanjc@google.com>
Subject: [PATCH v17 00/24] KVM: Enable mmap() for guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155531_107615_F54782E8 
X-CRM114-Status: GOOD (  18.66  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Paolo,

The arm64 patches have been Reviewed-by Marc, and AFAICT the x86 side of
things is a go.  Barring a screwup on my end, this just needs your approval.

Assuming everything looks good, it'd be helpful to get this into kvm/next
shortly after rc1.  The x86 Kconfig changes in particular create semantic
conflicts with in-flight series.


Add support for host userspace mapping of guest_memfd-backed memory for VM
types that do NOT use support KVM_MEMORY_ATTRIBUTE_PRIVATE (which isn't
precisely the same thing as CoCo VMs, since x86's SEV-MEM and SEV-ES have
no way to detect private vs. shared).

mmap() support paves the way for several evolving KVM use cases:

 * Allows VMMs like Firecracker to run guests entirely backed by
   guest_memfd [1]. This provides a unified memory management model for
   both confidential and non-confidential guests, simplifying VMM design.

 * Enhanced Security via direct map removal: When combined with Patrick's
   series for direct map removal [2], this provides additional hardening
   against Spectre-like transient execution attacks by eliminating the
   need for host kernel direct maps of guest memory.

 * Lays the groundwork for *restricted* mmap() support for guest_memfd-backed
   memory on CoCo platforms [3] that permit in-place
   sharing of guest memory with the host.

Based on kvm/queue.

[1] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[2] https://lore.kernel.org/all/20250221160728.1584559-1-roypat@amazon.co.uk
[3] https://lore.kernel.org/all/20250328153133.3504118-1-tabba@google.com

v17:
 - Collect reviews. [Xiaoyao, David H.]
 - Write a better changelog for the CONFIG_KVM_GENERIC_PRIVATE_MEM =>
   CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE rename. [Xiaoyao]
 - Correctly gmem_max_mapping_level()'s '0' return in the right patch. [Xiaoyao]
 - Replace call to kvm_gmem_get_pfn() with a WARN_ONCE() in the hugepage
   recovery path. [Ackerley]
 - Add back "KVM: x86/mmu: Handle guest page faults for guest_memfd with
   shared memory". [Ackerley]
 - Rework the selftest flags testcase to query MMAP support for a given VM
   type instead of hardcoding expectations in the test. [Sean]
 - Add a testcase to verify KVM can map guest_memfd memory into the guest
   even if the userspace address in the memslot isn't (properly) mmap'd. [Sean]

v16:
 - https://lore.kernel.org/all/20250723104714.1674617-1-tabba@google.com
 - Rework and simplify Kconfig selection and dependencies.
 - Always enable guest_memfd for KVM x86 (64-bit) and arm64, which
   simplifies the enablement checks.
 - Based on kvm-x86/next: commit 33f843444e28 ("Merge branch 'vmx'").

v15:
 - https://lore.kernel.org/all/20250717162731.446579-1-tabba@google.com
 - Removed KVM_SW_PROTECTED_VM dependency on KVM_GENERIC_GMEM_POPULATE
 - Fixed some commit messages

v14:
 - https://lore.kernel.org/all/20250715093350.2584932-1-tabba@google.com
 - Fixed handling of guest faults in case of invalidation in arm64
 - Handle VNCR_EL2-triggered faults backed by guest_memfd (arm64 nested
   virt)
 - Applied suggestions from latest feedback
 - Rebase on Linux 6.16-rc6

Ackerley Tng (2):
  KVM: x86/mmu: Rename .private_max_mapping_level() to
    .gmem_max_mapping_level()
  KVM: x86/mmu: Handle guest page faults for guest_memfd with shared
    memory

Fuad Tabba (15):
  KVM: Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GUEST_MEMFD
  KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
    CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
  KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
  KVM: Fix comments that refer to slots_lock
  KVM: Fix comment that refers to kvm uapi header path
  KVM: x86: Enable KVM_GUEST_MEMFD for all 64-bit builds
  KVM: guest_memfd: Add plumbing to host to map guest_memfd pages
  KVM: guest_memfd: Track guest_memfd mmap support in memslot
  KVM: arm64: Refactor user_mem_abort()
  KVM: arm64: Handle guest_memfd-backed guest page faults
  KVM: arm64: nv: Handle VNCR_EL2-triggered faults backed by guest_memfd
  KVM: arm64: Enable support for guest_memfd backed memory
  KVM: Allow and advertise support for host mmap() on guest_memfd files
  KVM: selftests: Do not use hardcoded page sizes in guest_memfd test
  KVM: selftests: guest_memfd mmap() test when mmap is supported

Sean Christopherson (7):
  KVM: x86: Have all vendor neutral sub-configs depend on KVM_X86, not
    just KVM
  KVM: x86: Select KVM_GENERIC_PRIVATE_MEM directly from
    KVM_SW_PROTECTED_VM
  KVM: x86: Select TDX's KVM_GENERIC_xxx dependencies iff
    CONFIG_KVM_INTEL_TDX=y
  KVM: x86/mmu: Hoist guest_memfd max level/order helpers "up" in mmu.c
  KVM: x86/mmu: Enforce guest_memfd's max order when recovering
    hugepages
  KVM: x86/mmu: Extend guest_memfd's max mapping level to shared
    mappings
  KVM: selftests: Add guest_memfd testcase to fault-in on !mmap()'d
    memory

 Documentation/virt/kvm/api.rst                |   9 +
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          | 203 +++++++++++----
 arch/arm64/kvm/nested.c                       |  41 ++-
 arch/x86/include/asm/kvm-x86-ops.h            |   2 +-
 arch/x86/include/asm/kvm_host.h               |   6 +-
 arch/x86/kvm/Kconfig                          |  26 +-
 arch/x86/kvm/mmu/mmu.c                        | 142 ++++++-----
 arch/x86/kvm/mmu/mmu_internal.h               |   2 +-
 arch/x86/kvm/mmu/tdp_mmu.c                    |   2 +-
 arch/x86/kvm/svm/sev.c                        |   6 +-
 arch/x86/kvm/svm/svm.c                        |   2 +-
 arch/x86/kvm/svm/svm.h                        |   4 +-
 arch/x86/kvm/vmx/main.c                       |   7 +-
 arch/x86/kvm/vmx/tdx.c                        |   5 +-
 arch/x86/kvm/vmx/x86_ops.h                    |   2 +-
 arch/x86/kvm/x86.c                            |  11 +
 include/linux/kvm_host.h                      |  38 +--
 include/uapi/linux/kvm.h                      |   2 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 236 ++++++++++++++++--
 virt/kvm/Kconfig                              |  15 +-
 virt/kvm/Makefile.kvm                         |   2 +-
 virt/kvm/guest_memfd.c                        |  81 +++++-
 virt/kvm/kvm_main.c                           |  12 +-
 virt/kvm/kvm_mm.h                             |   4 +-
 26 files changed, 648 insertions(+), 214 deletions(-)


base-commit: beafd7ecf2255e8b62a42dc04f54843033db3d24
-- 
2.50.1.552.g942d659e1b-goog


