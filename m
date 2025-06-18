Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D4EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o+4MhBpXw5c8zk/u/yk4K4au/XOsEIuLkOFNvyDX6c8=; b=zNeHXPDbltYt0vRjC50LF6maet
	xRoUFmqmDNMnaeDbGuFNdIFDcEKetzZFA2ykLzHvFJJPXBR43bLoeujtW39zPCBNS3wEufTLqY72u
	TNblQvvRfJ87ZSNaHN+MSSMi0dk2aMyYyJEcs/yib8O/m0PfQ7FrK+9ASmRRGET21giMICSGQ7ZXH
	NH3DWsIBM5q6IdY9h9jedRH7pwCFxtd4gMes6LtNwUVKLMfvYwgqvXOZ9iIp5wD6o6us8Jv1wvJsL
	Ql/oDLuKXuRIztTy2k1LJknLegIzjD0/hvbZ1A1+CS3jEL9xWx9hntdVwG0LJvKq4godQ3MotSuAJ
	KTpZ7T0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkNo-000000090SZ-38H3;
	Wed, 18 Jun 2025 04:26:44 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLc-00000008znQ-3cWc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:30 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31315427249so5950647a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220667; x=1750825467; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o+4MhBpXw5c8zk/u/yk4K4au/XOsEIuLkOFNvyDX6c8=;
        b=CHb53GalwDG+DL2IPb9+hHCAOYwfrBmMiVHvo5+i6KhPz8EbWRCUGE6a8qvvvVfCfQ
         gVqYRRVWEi9mFvtd71thldPN0iy/JdNGJVAdNh4S9786FZWIixu865HPC25brWKVpxLX
         K+QICU8Mm1zLwMrl5A4zn3XoeFQnECPWru5Svul4VisreIDVFSNGRPM2TZm4qeOmgMqX
         wFGegxwkkf1NoSn4ORXeP3PrR0qdob9DvpgevQpODmdrup8TBXlxl13b7DEHwlACREfY
         PJAgZo8LhxMGkOtcOe3K7TDDjEdKLyse7oIYDyIguH6+gZPT2UtpGpSUIrvGgQqMHWr5
         sKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220667; x=1750825467;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+4MhBpXw5c8zk/u/yk4K4au/XOsEIuLkOFNvyDX6c8=;
        b=KpD4wDcmtE2tToutekhRFA2F/VAak53YeS63BEVy1TxVvmhTFqAB83upS4Av5PovNu
         qzPtpe9/IyYTzpQ1KBMj98n+h45BeCMiMEJDdEa9YoQETj3eC3EWQ5rYkEAFKhsKhVKX
         QPvMvZwSirkuUog58UoL7knr2rdYwk12WPQUHHft1FzCiEtWkEpuKRNFjC2FlprkE0p5
         /5UMoxh+TvWjXTRYsg6PGRuPPRRhoO2Ruzcclz+zS5ujrdOyIyruJPMIF3CwRkK/0d2H
         xyixUcYMPO6MPOz3ShuQNYd55WZapszcoG0GM2oLBW11qQUngmr3x/WL8s43DyNcuUEW
         Bxyw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ufevjzSiV9NgpG4MvOYyU5HrCZlzxA6ndCVeP8f/cixvUEkHf1u9K33LLCXxFFVNM9S8t9oOP0kb2DzE17Zk@lists.infradead.org
X-Gm-Message-State: AOJu0YxSHbiEbGxWPb4lO1+G3LABDWZplooJ7uW8PJbvwemk+j/ktoSB
	PT0QENQuE0RFEMyhXLCaE22kSk9DdRfEEoU+/8xG28Z6lj7T/zfd8zxFC8e/CBPLpPG+Rpqkyxo
	edrVqICxtMQ3DdT8cNbci8w==
X-Google-Smtp-Source: AGHT+IHFJYTSQ+MOybbax7YIQAP8zvSWneLdYPGOi/sm7TwaiipF7EkJnEgPUroMKspYYgWLmDMNWsXPyfYM7Kzw
X-Received: from pjbta6.prod.google.com ([2002:a17:90b:4ec6:b0:312:4b0b:a94])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c8d:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-313f1d580e2mr27031305a91.17.1750220667431;
 Tue, 17 Jun 2025 21:24:27 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-1-jthoughton@google.com>
Subject: [PATCH v3 00/15] KVM: Introduce KVM Userfault
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212428_901749_18C72B53 
X-CRM114-Status: GOOD (  19.89  )
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

Hi Sean, Paolo, Oliver, + others,

Here is a v3 of KVM Userfault. Thanks for all the feedback on the v2,
Sean. I realize it has been 6 months since the v2; I hope that isn't an
issue.

I am working on the QEMU side of the changes as I get time. Let me know
if it's important for me to send those patches out for this series to be
merged.

Be aware that this series will have non-trivial conflicts with Fuad's
user mapping support for guest_memfd series[1]. For example, for the
arm64 change he is making, the newly introduced gmem_abort() would need
to be enlightened to handle KVM Userfault exits.

Changelog:
v2[2]->v3:
- Pull in Sean's changes to genericize struct kvm_page_fault and use it
  for arm64. Many of these patches now have Sean's SoB.
- Pull in Sean's small rename and squashing of the main patches.
- Add kvm_arch_userfault_enabled() in place of calling
  kvm_arch_flush_shadow_memslot() directly from generic code.
- Pull in Xin Li's documentation section number fix for
  KVM_CAP_ARM_WRITABLE_IMP_ID_REGS[3].
v1[4]->v2:
- For arm64, no longer zap stage 2 when disabling KVM_MEM_USERFAULT
  (thanks Oliver).
- Fix the userfault_bitmap validation and casts (thanks kernel test
  robot).
- Fix _Atomic cast for the userfault bitmap in the selftest (thanks
  kernel test robot).
- Pick up Reviewed-by on doc changes (thanks Bagas).

Below is the cover letter from v1, mostly unchanged:

Please see the RFC[5] for the problem description. In summary,
guest_memfd VMs have no mechanism for doing post-copy live migration.
KVM Userfault provides such a mechanism.

There is a second problem that KVM Userfault solves: userfaultfd-based
post-copy doesn't scale very well. KVM Userfault when used with
userfaultfd can scale much better in the common case that most post-copy
demand fetches are a result of vCPU access violations. This is a
continuation of the solution Anish was working on[6]. This aspect of
KVM Userfault is important for userfaultfd-based live migration when
scaling up to hundreds of vCPUs with ~30us network latency for a
PAGE_SIZE demand-fetch.

The implementation in this series is version than the RFC[5]. It adds...
 1. a new memslot flag is added: KVM_MEM_USERFAULT,
 2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
 3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
 4. a new KVM capability KVM_CAP_USERFAULT.

KVM Userfault does not attempt to catch KVM's own accesses to guest
memory. That is left up to userfaultfd.

When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mappings
are zapped, and new faults will check `userfault_bitmap` to see if the
fault should exit to userspace.

When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
permitted.

When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
consistent with dirty log disabling. So on x86, huge mappings will be
reconstructed, but on arm64, they won't be.

KVM Userfault is not compatible with async page faults. Nikita has
proposed a new implementation of async page faults that is more
userspace-driven that *is* compatible with KVM Userfault[7].

See v1 for more performance details[4]. They are unchanged in this
version.

This series is based on the latest kvm-x86/next.

[1]: https://lore.kernel.org/kvm/20250611133330.1514028-1-tabba@google.com/
[2]: https://lore.kernel.org/kvm/20250109204929.1106563-1-jthoughton@google.com/
[3]: https://lore.kernel.org/kvm/20250414165146.2279450-1-xin@zytor.com/
[4]: https://lore.kernel.org/kvm/20241204191349.1730936-1-jthoughton@google.com/
[5]: https://lore.kernel.org/kvm/20240710234222.2333120-1-jthoughton@google.com/
[6]: https://lore.kernel.org/all/20240215235405.368539-1-amoorthy@google.com/
[7]: https://lore.kernel.org/kvm/20241118123948.4796-1-kalyazin@amazon.com/#t

James Houghton (11):
  KVM: Add common infrastructure for KVM Userfaults
  KVM: x86: Add support for KVM userfault exits
  KVM: arm64: Add support for KVM userfault exits
  KVM: Enable and advertise support for KVM userfault exits
  KVM: selftests: Fix vm_mem_region_set_flags docstring
  KVM: selftests: Fix prefault_mem logic
  KVM: selftests: Add va_start/end into uffd_desc
  KVM: selftests: Add KVM Userfault mode to demand_paging_test
  KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
  KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
  KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
    details

Sean Christopherson (3):
  KVM: x86/mmu: Move "struct kvm_page_fault" definition to
    asm/kvm_host.h
  KVM: arm64: Add "struct kvm_page_fault" to gather common fault
    variables
  KVM: arm64: x86: Require "struct kvm_page_fault" for memory fault
    exits

Xin Li (Intel) (1):
  KVM: Documentation: Fix section number for
    KVM_CAP_ARM_WRITABLE_IMP_ID_REGS

 Documentation/virt/kvm/api.rst                |  35 ++++-
 arch/arm64/include/asm/kvm_host.h             |   9 ++
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  48 +++---
 arch/x86/include/asm/kvm_host.h               |  68 +++++++-
 arch/x86/kvm/Kconfig                          |   1 +
 arch/x86/kvm/mmu/mmu.c                        |  13 +-
 arch/x86/kvm/mmu/mmu_internal.h               |  77 +---------
 arch/x86/kvm/x86.c                            |  27 ++--
 include/linux/kvm_host.h                      |  49 +++++-
 include/uapi/linux/kvm.h                      |   6 +-
 .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
 .../testing/selftests/kvm/include/kvm_util.h  |   5 +
 .../selftests/kvm/include/userfaultfd_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
 .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
 .../selftests/kvm/set_memory_region_test.c    |  33 ++++
 virt/kvm/Kconfig                              |   3 +
 virt/kvm/kvm_main.c                           |  57 ++++++-
 19 files changed, 489 insertions(+), 134 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.50.0.rc2.692.g299adb8693-goog


