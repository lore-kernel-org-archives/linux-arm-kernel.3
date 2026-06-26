Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BFAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LeJPhSF7XykTcqCWYKGnt+fCegC9QerUoXnnQkQeerA=; b=dev98vwj9JCfnOk1qAg/hC/Tjm
	X/376odz7DoTvPqb2tDVUWxSxR0ynI6xk3SB7Mv1ls52M6knY075Ez2ip7W3Hf505P1Smt96TeXMQ
	S9P1viAVq9NA+hYO/UzKaKIkiVKjmmbOUeJ+KaxyRkudjt1zP1ZgSz12lj/QHcO6QrUJUBxCI8G0J
	5/DkLBlb+OPA+IdW7LncuNNuz0N5z9/JtWV/0mKxNts//YRt9AV/J8DAXoLnFQWyNJLZibBx8q/DB
	NuQ671LQ25hP8poGDZdIC2dO4nPhBgS5HRueFgWJ5cbzLlpERpQRYXZ7Ld6dKcAUNZIVpjW3394Pc
	ENFixfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdED6-0000000BuFd-3t7A;
	Fri, 26 Jun 2026 21:35:40 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdED4-0000000BuEo-2g2R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:39 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so736467a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509737; x=1783114537; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeJPhSF7XykTcqCWYKGnt+fCegC9QerUoXnnQkQeerA=;
        b=wm8qhS67mnLXMt5Z6gT9Uw4Piey7lOzbQf5ecOJH1jcI0u6YRe0wttVj06J++8Csxh
         N35gef3aqJ2aWxiephabiJsPInal9vc21NqVIufnGk+JHw6gFWsAOgU73EOcKWB81vv0
         5y+nC1CV0RHgZ32QwQieexhdgHuRrUxlw2O13faS7MskBNNe3lSl2mVqUft4Yvaddz3Q
         AIK+gxU3tQD1vSjnuDGkyoTvBxTMnieAS3gDLr2AkxKuO4VfAhM1Ifnjvg/PF4gTzT0A
         lHr7rdJyW3uk5LeGT0pbWjb9qeMvRfdL6N4j4JarnZ4bRkGQMc7yMLYBmB7mUPSY0or9
         HmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509737; x=1783114537;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeJPhSF7XykTcqCWYKGnt+fCegC9QerUoXnnQkQeerA=;
        b=l7mCUc7cIwMTh+nUyCLtsiCZtSj9vXC8ZdCFf4l5xP06HXJi48jXRkBu9dp3MNH3F7
         EJxhcbj5wB+WIvUIg3Y86uZO/aSfd4/s1AFkkWKsniWffahr++y0KCGHhLxlAvprjc7s
         i9Qb7kJeuwMF94u5hYkQeYhNAzc5PJkksgi1cTaJo1SRBSvxlegl1IYD1588UrD8y6Pi
         u5i9v4y3Yuj/7l/DekOiVlm4syW4A/0KbeGwz97Nv3E3ncoKG0b1X+cDAKgsAoUq+P2B
         HE4cjL37/jo5j7UKwAzjUxvzPlHIRZw33iW7W0CffQOqMXaXDb/86CD2Ei2H/bY/S3b3
         VisQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SkFjeONx0ZWOT4MaRRNJ6xMtr59Z9egXvonzxatkMqYUXF8tWT/L5tiOPDc2oG4/jfOHIhjEg8idYVPVl/Nn+@lists.infradead.org
X-Gm-Message-State: AOJu0YyNy+RA03ti6S2ZVHRsbKmFfo3Z2L7gstbp77ggfANOhie6tbfe
	Q75vjWGO+ikElEyzzIRZjeFd7sZ6gt8yp5iQlA6AC8hcUIB4gvOCHar6IgXKR8SHzBvQyk0Wu7t
	+baYS3g==
X-Received: from pgll186.prod.google.com ([2002:a63:25c3:0:b0:c93:a359:cea6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1d:b0:398:c0ba:9ceb
 with SMTP id adf61e73a8af0-3bd4ad233bcmr8360983637.12.1782509736302; Fri, 26
 Jun 2026 14:35:36 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:13 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-1-seanjc@google.com>
Subject: [PATCH v8 00/20] KVM: selftests: Add eventfd+VFIO IRQ test
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
X-CRM114-CacheID: sfid-20260626_143538_716739_23F8B37D 
X-CRM114-Status: GOOD (  17.32  )
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

Gory details in the patches, and in the v5 cover letter.

v8:
 - Explicitly include <time.h>. [Sashiko]
 - Use iova_allocator instea of hardcoding the IOVA. [Sashiko, David]
 - Add a comment explaining why DMA needs to be allocated. [David]
 - Probe /dev/vfio/vfio, not /dev/vfio. [Sashiko, David]

v7:
 - https://lore.kernel.org/all/20260613002031.745413-1-seanjc@google.com
 - Seed kvm_rng during kvm_selftest_init(). [Sashiko]
 - Seed libc's RNG during kvm_selftest_init(), so that the seed (from random())
   that's printed and passed to kvm_rng isn't the same every time.
 - Init irq_cpu to -1 in all paths. [Sashiko]
 - Require the driver to provide .send_msi(). [David]

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

David Matlack (11):
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

Sean Christopherson (3):
  KVM: selftests: Initialize the default/global pRNG during
    kvm_selftest_init()
  KVM: selftests: Seed libc's RNG before using it to generate a seed for
    KVM's pRNG
  KVM: selftests: Verify non-postable IRQ remapping in IRQ test

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
 tools/testing/selftests/kvm/irq_test.c        | 362 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/assert.c      |   8 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  54 ++-
 tools/testing/selftests/kvm/lib/memstress.c   |   8 +-
 tools/testing/selftests/kvm/lib/proc_util.c   |  54 +++
 tools/testing/selftests/kvm/lib/test_util.c   |  27 +-
 tools/testing/selftests/kvm/mmu_stress_test.c |  15 +-
 tools/testing/selftests/kvm/rseq_test.c       |   6 +-
 tools/testing/selftests/kvm/steal_time.c      |  22 +-
 .../testing/selftests/kvm/x86/sev_dbg_test.c  |   2 +-
 21 files changed, 561 insertions(+), 84 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/proc_util.h
 create mode 100644 tools/testing/selftests/kvm/irq_test.c
 create mode 100644 tools/testing/selftests/kvm/lib/proc_util.c


base-commit: a204badd8432f93b7e862e7dac6db0fe3d65f370
-- 
2.55.0.rc0.799.gd6f94ed593-goog


