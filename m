Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33346C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8xSibPGaP79RuMf+7+dDUpouwIkheHJF/igrm5r11hc=; b=aLLmG5PoKvtaiTHpKQX3ay2BOm
	XMR/O4wq2z+qotHCb4IRxpVmQHXYrKYiPcpCLwFIGa51NTaM9ehlsdXokhs1lLwwfA68uJVFqsGLT
	hzycKibocpd6CRX+Iq+1ALSTRlRDO108Ae+DbddI3n1s+58dO96DwzJRXkKpvEDkG1KiUhnz1lvBr
	ueJ1VSn7ZuLY11+9Sq/Dehl2llbKWk/ZQsqhH3dLdancPKuYxU647HV9Lqr0OO+u9W8UBimqsASp2
	LFYXZ5qd5x9nbdUqqzkp/eyaWqHQuzFRtXx0z/OY7rWdAYy5uaVbKy2BtUHzdkt9DLS1GNyrm14m2
	rFvs4oAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHi-0000000BDcQ-3xK4;
	Thu, 30 Jul 2026 19:19:14 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHf-0000000BDbP-3WjO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:13 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb733fc5024so188766a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439150; x=1786043950; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xSibPGaP79RuMf+7+dDUpouwIkheHJF/igrm5r11hc=;
        b=PHKspUj4s9C0q2u0V5epBBkKVCaIFFjsPiTfb7+TQnGor8Alb9M3bv5UH5m73BJzSn
         1xx36+CSdN4g7x4amPXPeJ9XFoXloSstcQEI3wTl9xaxDSCsAkb/FIsDr87L1RXzaX5O
         KUGtbZiGSNOKAHexTXmKQFe3m3iCAdQoW85RW326x9C7qpWG7BVH7tYPAXRnucz8BSnj
         ATr9tctqBJ5xsvd3o0ufMXGC4bU5NtenJzzi9NsYksCQmDL7mZgfZdeuDfOKJKICMTZ8
         mQ8stNBAnuhDS3Aa32l8pa0v8y6wl9KFA/MAQtA/aFUb0CU57kbDbIMIhV42QANgYnX6
         95ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439150; x=1786043950;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8xSibPGaP79RuMf+7+dDUpouwIkheHJF/igrm5r11hc=;
        b=juo1CQC3I29A3YdR0OAMqatyajs75a6E8RsOkTkHqcYYPehRiIZqOX8c1QvVOX5ypw
         1a/MGj8C7yGoxxEboYDcI4XQcnx987l+/dVVKybvaL+JZA2sJyY9lThpXgazYPKm9YcT
         LSAomM6qGgcB4q1FqNzHEJpdFqUoBP7AWNcY+LasHiT+cWJBrrwDC4HyBSux7qYp5F0R
         4anCwH4giVSpOIMxHW+CtMIPHVSG6oJQBkCKPs3cjulRVPDBZtNBOdZF/CFuE3GFEbOv
         6tjdm9ZVJBmC02d8GqpVpXiJ1hZzqVRwxkRgQczSR49WPvZi94HPjSKTSNBIByqEBn7z
         Xtng==
X-Forwarded-Encrypted: i=1; AHgh+RrKDpkjmUf0sCGIGaWMw9Ikl+yqhAGG5dL1GYjXcOTaakmBeV/v7Ms846D5J48P8XANo1P6W0JWcFLKvPECAipO@lists.infradead.org
X-Gm-Message-State: AOJu0YySYzFuH/HpZ6ZTDjsajava7dnig+LS9Ldv0tOi72rh9NUEAkYn
	ON4yr3OrVgbkB//XzG25UhnLxSLAmeqdhWh4l2E3lMEUpzeT5napfXaBnqgYx1w1CcvPBnghGsg
	hwdDjgw==
X-Received: from pggi13.prod.google.com ([2002:a63:cd0d:0:b0:c85:db34:d7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:117:b0:3c0:9c1a:8939
 with SMTP id adf61e73a8af0-3c90d6ce7e8mr1439109637.65.1785439149929; Thu, 30
 Jul 2026 12:19:09 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:18:59 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-1-seanjc@google.com>
Subject: [PATCH 0/9] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_121911_883873_CE97F312 
X-CRM114-Status: GOOD (  15.09  )
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

Buried in the middle of this is a fix for the hardware_disable_test where
it can end up with a runtime of multiple minutes on preemptible kernels due
to blindly pinning 68 spinning tasks to pCPUs 0-4, which is "mildly"
problematic if the parent is also affined to those CPUs (or the scheduler
keeps trying to run the parent on those CPUs for whatever reason).

After wasting almost half a day bisecting the kernel to the auto-enablement
of PREEMPT_LAZY, I got fed up with the test and went scorched earth on it,
to try and clean up its many warts.

The vast, vast majority of the changes are adding kvm_xxx() syscall wrappers
so that tests don't need to manually assert that a syscall succeeds (the
hardware disable test had some ugly equivalents).

Note, this somewhat unfortunately applies on top of the bad-in-hindsight
"irq_test" branch in kvm-x86, as I didn't want to re-invent the "pick a
random CPU from a cpuset" functionality.  Luckily, AFAICT none of the nearly
tree-wide changes conflict with anything else that's in-flight in other
KVM arch trees, so I'm planning on smashing the "I'm Feeling Lucky" button
on this and throwing it on top of the irq_test (though I'll rename the branch
so it's not completely ridiculous).

Tested on x86 and arm64, compile tested on other architectures.

Sean Christopherson (9):
  KVM: selftests: Return the target CPU from pin_task_to_random_cpu()
  KVM: selftests: Extract picking of random CPU from cpu_set_t to
    separate API
  KVM: selftests: Affine child tasks to other pCPUs in hardware disable
    test
  KVM: selftests: Drop unreachable, dead code from hardware disable test
  KVM: selftests: Add KVM syscall wrapper for pthread_create()
  KVM: selftests: Add KVM syscall wrappers for pthread_{cancel,join}()
  KVM: selftests: Add helper APIs to cancel+join pthreads
  KVM: selftests: Add KVM syscall wrappers for
    pthread_{g,s}etaffinity_np()
  KVM: selftests: Clean up global constants in hardware disable test

 tools/testing/selftests/kvm/arch_timer.c      |  18 ++--
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  14 +--
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |   8 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |   4 +-
 .../selftests/kvm/hardware_disable_test.c     | 101 ++++++++----------
 .../selftests/kvm/include/kvm_syscalls.h      |  47 ++++++++
 .../testing/selftests/kvm/include/kvm_util.h  |  11 +-
 tools/testing/selftests/kvm/irq_test.c        |   4 +-
 tools/testing/selftests/kvm/irqfd_test.c      |   4 +-
 .../selftests/kvm/kvm_page_table_test.c       |   6 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  10 +-
 tools/testing/selftests/kvm/lib/memstress.c   |   4 +-
 .../selftests/kvm/lib/userfaultfd_util.c      |   7 +-
 .../testing/selftests/kvm/memslot_perf_test.c |   4 +-
 tools/testing/selftests/kvm/mmu_stress_test.c |   4 +-
 .../selftests/kvm/pre_fault_memory_test.c     |   4 +-
 tools/testing/selftests/kvm/rseq_test.c       |   6 +-
 tools/testing/selftests/kvm/s390/memop.c      |   4 +-
 .../selftests/kvm/set_memory_region_test.c    |   6 +-
 tools/testing/selftests/kvm/steal_time.c      |   6 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c  |  32 ++----
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |  30 +-----
 .../kvm/x86/private_mem_conversions_test.c    |   4 +-
 .../kvm/x86/private_mem_kvm_exits_test.c      |   7 +-
 .../selftests/kvm/x86/recalc_apic_map_test.c  |   5 +-
 .../selftests/kvm/x86/sev_migrate_tests.c     |   4 +-
 .../selftests/kvm/x86/sync_regs_test.c        |   5 +-
 .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |  31 +-----
 .../selftests/kvm/x86/xen_shinfo_test.c       |  10 +-
 30 files changed, 179 insertions(+), 225 deletions(-)


base-commit: 3c7d7f908d574277a845423ec32250a8d8df44c8
-- 
2.55.0.508.g3f0d502094-goog


