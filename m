Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E077FEE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=; b=Jyf+JfllhIdM2kcbqmy2F/k1DD
	vUHHQTRQcrQxme5e84un7Ef/iT32iTPE065va21V8OQp+pthh4z6f2IPXIq28gLMRoyPkV/XkmC7u
	4H9SbjJQR2+eZPArvLntB8DlWwOatbh4wLGFRlloWv742R4zwEshIUWbDblryvXfsUSePirY7Zkm1
	NH3sIQmmgmwgNJWnYPUQxvF5ipBRnlO+SfO5WyBXLh4CnPqkXRbtWAWoRN89Icl60EETfystjEDhi
	dzqyyeueKn3sYm3SxDq6pWs8HGESHSv7ltrqLBmmG4ZlPAcS4yWpN48u9s9dhgg/ezQvzzz161EzT
	XT9FgtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijC-00000005Mlc-3Xln;
	Tue, 30 Dec 2025 23:02:10 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiiw-00000005Mel-1vNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:09 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7b90740249dso18075772b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135713; x=1767740513; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=;
        b=SpTDVzH5NHaMWwc4acDPlpijEnOy95gZp/YZacjeRGKdqMozNnn4/aJ5Ia06rPScvZ
         0QoZNEK7N4dlYZdV3jwhRCPCwNO2zIS0ktfEmOpGwkL02GhhruYBB33aP9e+LnfjHOt7
         wSsVgxjDhYPucvc1wmFbSgPnLtiqHWTMkD1Na1/ybCrmjgbldayBf2IRBNbdp0nlm2q/
         lu2oSE6pjXHd7cGyavmOWxy7N/Ws1yiP/5k18TpHdbQWs55AkXE4mMoPQ9xEtqWUJMq6
         AizNnDgNa4GWLMKww5ItchvMZGgDhg2RAroR1WFeBaezffgGtCZYaltp1SSMLWpSUwKZ
         nljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135713; x=1767740513;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=;
        b=mNdB20oWgS4Tkt+GRYstr4DYOTurWn7WAnlu9X4KqQkLlMObkxUzW4ZuTSDslRX+t6
         5avvyqIX0hm4PXPKQP//bGf0r1bLF26wEukpYRYxn/lL5VME3T/3YH4aCdfRZYR/zOlM
         /8Tw9Kuar+VfJ0XzOvVtvhFrGFC0hPgm/PujCDK4TZJDJjlC0woDNpwlXmjCvs4Xd801
         QiCG8N/J4Z/M7kQfOE5eTYzBhGH9ifLUrL120guDzSWwB+iHMu2RHodt+KwICt6bi35h
         IEBb1bJdzMOqoiPSIJtdVLWE0aThFbBvj2KwlgxwtvKsNsrf0nwynv1RW5jeJbW/e7Lp
         QtUw==
X-Forwarded-Encrypted: i=1; AJvYcCVEOL2uXxE2JVx6Y2EriSsFPQNvgsyv3/wT0VC9vBcvMwLONZSD1IGqcktiz0bOxBqTjFVYKKml1CZ6MsQj9ufn@lists.infradead.org
X-Gm-Message-State: AOJu0YxPs64OdSJJVqmckdvHl+d9F/DdQ4EzCCg+jM10oetWv/oNCQmy
	EpRZyWqisUkFTq2J/qGpQcDyj2B8Om2CrVshv9Fbu/L5Yjtv7Dt2kkZo2cZap8O/1oCIOHMzeNf
	hUEDptA==
X-Google-Smtp-Source: AGHT+IFl5YLLzZS88Mfh7NFRVwFsdWY7dXmSPWiNHP66M1DsoJkgDWwQHxi6m97nCMs9lyQggVclX+5VgK0=
X-Received: from pjbge24.prod.google.com ([2002:a17:90b:e18:b0:34c:cb46:dad7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e083:b0:361:3bec:fe28
 with SMTP id adf61e73a8af0-376a9de5b35mr35584887637.37.1767135712714; Tue, 30
 Dec 2025 15:01:52 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:29 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-1-seanjc@google.com>
Subject: [PATCH v4 00/21] KVM: selftests: Add Nested NPT support
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150154_498216_32D028C3 
X-CRM114-Status: GOOD (  15.29  )
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

Yosry's series to add support for nested NPT, and extends vmx_dirty_log_test
and kvm_dirty_log_test (with -n, using memstress) to cover nested SVM.

Note, I'm mildly concerned the last patch to extend nested_dirty_log_test to
validate KVM's handling of READ faults could be flaky, e.g. maybe if someone
is running the test under heavy memory pressure and the to-be-access page is
swapped between the write-from-host and read-from-guest?  But unless someone
knows/shows it'll be flaky, I'm inclined to apply it and hope for the best.

v4:
 - Document the likely reason for setting A/D bits.
 - Put "mmu" structure in common "struct kvm".
 - Make it clear PTE accessors are predicates.
 - Assert that the stage-2 MMU is initialized at most once.
 - Make READABLE a standalone bit (don't overload USER).
 - Don't alias PRESENT => READABLE for EPT.
 - Fix the A/D bit definitions for EPT.
 - Drop the function comment for __tdp_map().
 - Add a patch to extend the nested_dirty_log_test to verify that KVM creates
   writable SPTEs when the gPTEs are writable and dirty.

v3:
 - https://lore.kernel.org/all/20251127013440.3324671-1-yosry.ahmed@linux.dev
 - Dropped the patches that landed in kvm-x86.
 - Reshuffled some patches and cleanups.
 - Introduced kvm_mmu data structures to hold the root, page table
   levels, and page table masks (Sean).
 - Extended memstress as well to cover nested SVM.

v2: https://lore.kernel.org/kvm/20251021074736.1324328-1-yosry.ahmed@linux.dev

Sean Christopherson (7):
  KVM: selftests: Add "struct kvm_mmu" to track a given MMU instance
  KVM: selftests: Plumb "struct kvm_mmu" into x86's MMU APIs
  KVM: selftests: Add a "struct kvm_mmu_arch arch" member to kvm_mmu
  KVM: selftests: Add a stage-2 MMU instance to kvm_vm
  KVM: selftests: Move TDP mapping functions outside of vmx.c
  KVM: selftests: Rename vm_get_page_table_entry() to vm_get_pte()
  KVM: selftests: Test READ=>WRITE dirty logging behavior for shadow MMU

Yosry Ahmed (14):
  KVM: selftests: Make __vm_get_page_table_entry() static
  KVM: selftests: Stop passing a memslot to nested_map_memslot()
  KVM: selftests: Rename nested TDP mapping functions
  KVM: selftests: Kill eptPageTablePointer
  KVM: selftests: Stop setting A/D bits when creating EPT PTEs
  KVM: selftests: Move PTE bitmasks to kvm_mmu
  KVM: selftests: Use a TDP MMU to share EPT page tables between vCPUs
  KVM: selftests: Stop passing VMX metadata to TDP mapping functions
  KVM: selftests: Reuse virt mapping functions for nested EPTs
  KVM: selftests: Allow kvm_cpu_has_ept() to be called on AMD CPUs
  KVM: selftests: Add support for nested NPTs
  KVM: selftests: Set the user bit on nested NPT PTEs
  KVM: selftests: Extend vmx_dirty_log_test to cover SVM
  KVM: selftests: Extend memstress to run on nested SVM

 tools/testing/selftests/kvm/Makefile.kvm      |   2 +-
 .../kvm/include/arm64/kvm_util_arch.h         |   2 +
 .../testing/selftests/kvm/include/kvm_util.h  |  18 +-
 .../kvm/include/loongarch/kvm_util_arch.h     |   1 +
 .../kvm/include/riscv/kvm_util_arch.h         |   1 +
 .../kvm/include/s390/kvm_util_arch.h          |   1 +
 .../selftests/kvm/include/x86/kvm_util_arch.h |  22 ++
 .../selftests/kvm/include/x86/processor.h     |  58 +++-
 .../selftests/kvm/include/x86/svm_util.h      |   9 +
 tools/testing/selftests/kvm/include/x86/vmx.h |  16 +-
 .../selftests/kvm/lib/arm64/processor.c       |  38 +--
 tools/testing/selftests/kvm/lib/kvm_util.c    |  28 +-
 .../selftests/kvm/lib/loongarch/processor.c   |  28 +-
 .../selftests/kvm/lib/riscv/processor.c       |  31 ++-
 .../selftests/kvm/lib/s390/processor.c        |  16 +-
 .../testing/selftests/kvm/lib/x86/memstress.c |  66 +++--
 .../testing/selftests/kvm/lib/x86/processor.c | 237 ++++++++++++----
 tools/testing/selftests/kvm/lib/x86/svm.c     |  24 ++
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 251 ++++-------------
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |   2 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c | 259 ++++++++++++++++++
 .../x86/smaller_maxphyaddr_emulation_test.c   |   4 +-
 .../selftests/kvm/x86/vmx_dirty_log_test.c    | 179 ------------
 .../kvm/x86/vmx_nested_la57_state_test.c      |   2 +-
 24 files changed, 726 insertions(+), 569 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
 delete mode 100644 tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.52.0.351.gbe84eed79e-goog


