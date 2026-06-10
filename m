Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A19CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2T4JFnvy3isjzB+jWXF2KXb/Imn3RDItMHvYDoBMt3U=; b=oM9AmakiU9zhRcWr2keATgHgeV
	mV2zpjjDjNBJQjpbyVoo4Wy/LrAPezlkUHHOYhClSwUQxqDlScAwH6vvcjhnpFS/+6gdluwGRTTFT
	GnVAfVrkGn3a2KVrn5PPiautThI5rrMKtjSxbqZZqQfOJBOUhFfyrY16Ff3Wh5is5XkERwiO8DdMX
	Ux55BArXjdPHwVovqUjUknRxSbov8THzYCcVPDO4st8IM/A2MVR6uafyk0kid893Gm2niRHiQee7/
	+ydG+4pcE+/EwU2D7DNX5hiPR/eq20PxLoDt+9f1Qd77AGnCmkOaTcP2yZkw1TtrFSAn8uV/fpr04
	iCC6EHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7CV-00000006ZPe-0jw5;
	Wed, 10 Jun 2026 00:53:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7CR-00000006ZOY-4BtN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:45 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c0c1e112dfso84642115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052821; x=1781657621; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T4JFnvy3isjzB+jWXF2KXb/Imn3RDItMHvYDoBMt3U=;
        b=eR7eBSy51JNedIxR10w8oGuvJjOoQUMxXlb0pvoxezE3d30me1kNG5ml3XK5LzHZ8Q
         ZBXE5ff7s//iiEQ1uSrA19oLMlmuw9r3yeFEtcUmk6BEoNMitLvFOQeOWsFTUinMf18e
         xjkmmJ73JYzAL71jcPn5Br4rdM7P5F/oJ12uvZr+HJ6JxBOoDQbRNqSZhB+FP1qYsQOk
         EOM71I5rWZL0BcQLhxKkwH4CBxtM3BKENAyy8j/5GsV49r5UoQ8bt7h9pbH05esHflhW
         UjxNeJUXU1Gu59aotpzw4J6ELz2CtW8AHOFxSmdl0kyT7TmEAAywunv73Lw+zDIYKRyv
         5XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052821; x=1781657621;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2T4JFnvy3isjzB+jWXF2KXb/Imn3RDItMHvYDoBMt3U=;
        b=diA9JeyzTI7uHOfL/wsDghqq/Ih/eF0zN+DsNgf4CN5bzI5QFHvZzx7dg621BlCxqP
         ilJ7F7rTsov3w4j6g+M015vU371vTBBypb/+TqFKEJACPA9k4fZfXZnq5k7xxhr76SaP
         oXjjTLK6+BMANQjsUd3tVz5T0FbTPwcj08OKIuD3Xc1Lx6cs9JXivzPUJbTTx+CQcOtJ
         9Yqk2msKcgejaxVsMY6Lk6rWn8mcOjCjCIcCfwt+urXQdFFwXfB8+1ApOXeRWVKNr33V
         JHvKhVjfNVcPRTyctTQJX/ECdpOgBIXuRF2OacPa/UYPcPbYkaqQHdENmL35CpqAkBWK
         v8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ8OwCjl/ZriGuOzg9gAJUI1Wzv0EcHZrlzgbbjh4xmRJ/bmu9zKelTXnRB1VU4fuPyot8g4dPuGTx5SX3kXY+BV@lists.infradead.org
X-Gm-Message-State: AOJu0YyV+5J0jHFATkkQCu7RAq3u8AsuF1Zs67fo9fn3R/YAXT4HXnO8
	Vs24S/sOUZVt2ztwG58f0G8cM/wIq6T+udoeIL40Igy3eFdpkceBhFB0cR1QJnlZmvMSYXhXQbK
	fKVfVaA==
X-Received: from plao3.prod.google.com ([2002:a17:903:3003:b0:2be:3026:1d0f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:240f:b0:2bc:db35:96c7
 with SMTP id d9443c01a7336-2c1e822121cmr244254735ad.28.1781052821294; Tue, 09
 Jun 2026 17:53:41 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:20 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-1-seanjc@google.com>
Subject: [PATCH v6 00/18] KVM: selftests: Add eventfd+VFIO IRQ test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_175344_045101_529ADF21 
X-CRM114-Status: GOOD (  18.71  )
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

David and Josh's series to add a selftest for verifying interrupt delivery
via eventfd (via KVM_IRQFD), and also from a real device, wired up via VFIO.

I originally wanted to get this into 7.2, but that's not going to happen.  But
I hope to get this applied early in the 7.3 cycle so that additional features
and whatnot can be developed on top without too much pain (hopefully).

Gory details in the patches, and in the v5 cover letter.

v6:
 - Massage most changelogs.
 - Fix SoB ordering issues.
 - Clean up KVM_SET_GSI_ROUTING helper.
 - Remove misleading "IRQ injection" and "emulated eventfd" terminology.
 - Add GUEST_RECEIVED_INTERRUPT() to simplifiy the core loop.
 - Use cpu_relax() in tight loops while waiting for interrupts.
 - Print as much information as possible in the actual assert, instead of
   printing to stdout separately.
 - Make a best guess as to the right VFIO vs. IOMMUFD mode instead of
   assuming IOMMUFD, and give the user the option to overide said guess.
 - Simplify open_proc_irq_smp_affinity_list() +
   write_proc_irq_smp_affinity_list() into proc_irq_set_smp_affinity().
 - Drop print_proc_irq_file() and kvm_print_vcpu_affinity() (for now) to avoid
   potential issues on systems with high CPU counts.
 - Drop the blocking/HLT testing as it was at best broken.
 - Use -e for "empty", not -c for "clear", when completely tearing down GSI
   routing, because routing can be "cleared" without completely emptying the
   routing information.
 - Use the main task's CPU affinity as the available_cpus set.
 - Allow overcommiting vCPUs:pCPUs.
 - Set the target vCPU's affinity instead of batching when vCPU0 is targeted.
 - Add support for 256+ vCPUs with x2APIC.
 - Restrict xAPIC mode to 255 vCPUs.
 - Restrict the test to KVM selftest's max supported vCPUs.

v5:
 - https://lore.kernel.org/all/20260604020143.748245-1-jrhilke@google.com
 - Rename get_proc_vfio_irq_number() to vfio_msix_to_host_irq()
 - Rename open_proc_irq_affinity() and write_proc_irq_affinity() to include "_smp_affinity_list"
 - Print /proc/irq/<irq>/smp_affinity and effective_affinity on timeout failures
 - Convert IRQ type from 'int' to 'unsigned int' across helpers and the test
 - Fix compiler warnings for uninitialized variables in irq_test.c
 - Remove rate-limiting on affinity changes

v4: https://lore.kernel.org/kvm/20260530002134.558837-1-jrhilke@google.com

David Matlack (12):
  KVM: selftests: Build and link selftests/vfio/lib into KVM selftests
  KVM: selftests: Add macros to read/write+sync to/from guest memory
  KVM: selftests: Add an irqfd send+receive (and later IRQ bypass) test
  KVM: selftests: Add helper to get host IRQ from device MSI-X for IRQ
    bypass test
  KVM: selftests: Add VFIO device support to eventfd IRQ test
  KVM: selftests: Verify interrupts are received when IRQ affinity
    changes in IRQ test
  KVM: selftests: Add option to set empty routing between IRQs in
    eventfd IRQ test
  KVM: selftests: Make number of IRQs configurable in IRQ test
  KVM: selftests: Verify non-postable IRQ remapping in IRQ test
  KVM: selftests: Verify vCPU migration during IRQ delivery in IRQ test
  KVM: selftests: Make number of vCPUs configurable in IRQ test
  KVM: selftests: Add xAPIC support in eventfd IRQ test

Josh Hilke (6):
  KVM: selftests: Rename guest_rng to kvm_rng
  KVM: selftests: Add helper to generate random u64 in range [min,max]
  KVM: selftests: Add a helper to set proc IRQ affinity for IRQ test
  KVM: selftests: Add kvm_gettid() wrapper and convert users
  KVM: selftests: Add kvm_sched_getaffinity() wrapper and convert users
  KVM: selftests: Add a utility to pin a task to a random CPU, given a
    CPU set

 tools/testing/selftests/kvm/Makefile.kvm      |   7 +-
 tools/testing/selftests/kvm/arch_timer.c      |   2 +-
 .../kvm/arm64/arch_timer_edge_cases.c         |   2 +-
 .../selftests/kvm/demand_paging_test.c        |   2 +-
 .../selftests/kvm/dirty_log_perf_test.c       |   4 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  11 +-
 .../selftests/kvm/include/kvm_syscalls.h      |   7 +
 .../testing/selftests/kvm/include/kvm_util.h  |  12 +
 .../testing/selftests/kvm/include/proc_util.h |  11 +
 .../testing/selftests/kvm/include/test_util.h |  25 +-
 .../selftests/kvm/include/x86/kvm_util_arch.h |   4 +-
 tools/testing/selftests/kvm/irq_test.c        | 349 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/assert.c      |   8 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  46 ++-
 tools/testing/selftests/kvm/lib/memstress.c   |   8 +-
 tools/testing/selftests/kvm/lib/proc_util.c   |  54 +++
 tools/testing/selftests/kvm/lib/test_util.c   |  27 +-
 tools/testing/selftests/kvm/mmu_stress_test.c |  15 +-
 tools/testing/selftests/kvm/rseq_test.c       |   6 +-
 tools/testing/selftests/kvm/steal_time.c      |  22 +-
 .../testing/selftests/kvm/x86/sev_dbg_test.c  |   2 +-
 21 files changed, 541 insertions(+), 83 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/proc_util.h
 create mode 100644 tools/testing/selftests/kvm/irq_test.c
 create mode 100644 tools/testing/selftests/kvm/lib/proc_util.c


base-commit: de3a35be92d2391ece4bf3143ef2887192625fd0
-- 
2.54.0.1099.g489fc7bff1-goog


