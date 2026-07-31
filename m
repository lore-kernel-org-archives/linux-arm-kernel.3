Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D833EC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q8RSdN/Kl64q03cYx/swNDtgv70+5W1HreJ2G2qg/Nc=; b=oAAYV9GkG41CmqDE5hh7gUmN+M
	fzN0YEV994vTTvjTDAAHC0TZFoOptQllSVsEO39BJ2zLAuW8+mai9Qte4xo3yermw0zkZmKneZyI+
	mDVnzPlu09N+RiRrUC+n9ZAwL0f7bT3gyVD/3G4VGqXPzZCT2jDL8nlU2ebMRAZGml5Ym7jJtAQlx
	6s48PfMvGhMAXRZeHeZ5YX58/CTRbpZPEel8byrj4wf3vnuDoz+V1Oh2MPE46FQEJ6YfU80q4P02j
	q4bTD3VePaR4IWLeY1Kt39DrtfwwAGdbd/0oD99QOn9tFbGwf3gndHgdTIj+6XXFO5w4sfvR6Xvd/
	gGk/ggYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgm-0000000DDZG-2fxW;
	Fri, 31 Jul 2026 17:06:28 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgk-0000000DDXY-29d5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:27 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8488ac68185so3115488b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517583; x=1786122383; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8RSdN/Kl64q03cYx/swNDtgv70+5W1HreJ2G2qg/Nc=;
        b=eFWsoLnpF6G8tHtkMkT8Gy7N5N/BxGf1iqgu3zKOYIZf4nNBwrYexCay6LDf5N5nFu
         qx0Ay5Q82Uqb7UwplhORoOuNjKU3n8myzleABJzR75djx1YpWWGviKoBmDUqjuxuM/3+
         d8Xw3M2F4M4qCoV+0lrHWRa0L3Lwmdx3FXaZGo/A8AW9lDe/1wUKfGFTTjtAVCl22xCz
         dOLK3E9iUF1oddD/2RDu9xsRauo+yWnENgBGzrNdAqI7KtEfPYWIMiFB2ddsXRlZNtmK
         qyelSyL3ON3P4KXPt1R9eOIf93Lnngov10mH5y8DcFzWiuqBFkx9ILDrwTThIhUTfEaw
         i7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517583; x=1786122383;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q8RSdN/Kl64q03cYx/swNDtgv70+5W1HreJ2G2qg/Nc=;
        b=nxvTU1g4R1kG6J0fNPdTgJC3tcfMaoVVK5mmbsfpQnon8eOMMEiQDC9wHvXwnM7FRY
         sT46iqrHnRXaTt/f3lkaNS+3zsljIdpw+fTnmwL//Z27z7nM59jF2l/JQPY656cCxi7V
         2kxzVGBCJsmyqFUhbXT7wWTFUagX3P2P2wJydr3/HMyf7PgWc0NpQC6QSt7JgcDrcPO5
         G7I5mFZI2UHCN0L5y61Fc8DThjBMyYOy4LdvpS5dlEDgqzNQE0Jwx73bjrWISzGP/4vh
         XdXc8kjnKYgOWpg9Q3ZZWsKIYQc/LiUTb8aRU373U2rP7ouju03k8PcYOTvKaXE9IZ3n
         qZ7w==
X-Forwarded-Encrypted: i=1; AHgh+RrnK/9NKvjLbE2vpIWTM9T0NKoQyJaDDtVuErt2/lr79tPrumaXI4tNSlsic8HWKXGudMNA4Ud4r8m/jHVsfpnu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1JNkQug+tRo0u1mQTXwv3J5tLbCWWPLuaZ8dC+FLkVaceGc2E
	8cszlUypXw9EqR45jQ+2+wimh7LrtHltj5Qpy1/JsmnXXYCLbbM6fDJF3qr1rvrT2DTECmaWN9p
	vfXJXtg==
X-Received: from pfnw22.prod.google.com ([2002:aa7:8596:0:b0:848:2cfd:8fa1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:856:b0:845:c8f9:6ce0
 with SMTP id d2e1a72fcca58-84ee485a40bmr400854b3a.21.1785517582786; Fri, 31
 Jul 2026 10:06:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:07 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-1-seanjc@google.com>
Subject: [PATCH v2 00/12] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
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
X-CRM114-CacheID: sfid-20260731_100626_559633_E58FA2B8 
X-CRM114-Status: GOOD (  12.05  )
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
it can end up with a runtime of multiple minutes when running a preemptible
kernels on a large NUMA system.  Turns out my analysis/guess in v1 was wrong;
the problem isn't direct CPU contention, it's that letting the workers do any
amount of "real" work on any CPUs leads to pthread_create() slowdowns from
the perspective of the caller.

The vast, vast majority of the changes are adding kvm_xxx() syscall wrappers
so that tests don't need to manually assert that a syscall succeeds (the
hardware disable test had some ugly equivalents).

As with v1, I'm planning on taking this through kvm-x86.

v2:
 - pause() the child after creating workers so as not to busy loop, and to
   maintain equivalent functionality. [Sashiko]
 - Don't bother pinning the parent of immediate child, and instead focus on
   affining workers to their CPUs asap.

v1: https://lore.kernel.org/all/20260730191908.2084803-1-seanjc@google.com

Sean Christopherson (12):
  KVM: selftests: Add a KVM syscall wrapper for sched_setaffinity()
  KVM: selftests: Set threads CPU affinity before doing work in hardware
    disable test
  KVM: selftests: Pre-set threads affinity in hardware disable test when
    possible
  KVM: selftests: Return the target CPU from pin_task_to_random_cpu()
  KVM: selftests: Extract picking of random CPU from cpu_set_t to
    separate API
  KVM: selftests: Affine threads to random CPUs in hardware disable test
  KVM: selftests: Drop unreachable, dead code from hardware disable test
  KVM: selftests: Add KVM syscall wrapper for pthread_create()
  KVM: selftests: Add KVM syscall wrappers for pthread_{cancel,join}()
  KVM: selftests: Add helper APIs to cancel+join pthreads
  KVM: selftests: Add KVM syscall wrappers for
    pthread_{g,s}etaffinity_np()
  KVM: selftests: Clean up global constants in hardware disable test

 tools/testing/selftests/kvm/arch_timer.c      |  18 +--
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  14 +--
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |   8 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |   4 +-
 .../selftests/kvm/hardware_disable_test.c     | 103 ++++++++----------
 .../selftests/kvm/include/kvm_syscalls.h      |  48 ++++++++
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
 tools/testing/selftests/kvm/rseq_test.c       |  12 +-
 tools/testing/selftests/kvm/s390/memop.c      |   4 +-
 .../selftests/kvm/set_memory_region_test.c    |   6 +-
 tools/testing/selftests/kvm/steal_time.c      |   6 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c  |  32 +-----
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |  30 +----
 .../kvm/x86/private_mem_conversions_test.c    |   4 +-
 .../kvm/x86/private_mem_kvm_exits_test.c      |   7 +-
 .../selftests/kvm/x86/recalc_apic_map_test.c  |   5 +-
 .../selftests/kvm/x86/sev_migrate_tests.c     |   4 +-
 .../selftests/kvm/x86/sync_regs_test.c        |   5 +-
 .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |  31 +-----
 .../selftests/kvm/x86/xen_shinfo_test.c       |  10 +-
 30 files changed, 183 insertions(+), 230 deletions(-)


base-commit: 3c7d7f908d574277a845423ec32250a8d8df44c8
-- 
2.55.0.508.g3f0d502094-goog


