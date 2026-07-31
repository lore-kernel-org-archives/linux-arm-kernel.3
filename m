Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8FBC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gd1m/0mWimKO7o4EYRsTYXZShyBAIYbMepMSGbfxdyY=; b=zb9IjaHXHrDYRjLjmY/gbScEYY
	YLPRfoXbFueOhCVghiCWC3710s4M3YEFvElgJHglmrTMUtV+UCmUgIfOsrCP0E+ne4+nrrELkaca3
	sG9eOfUWMSNz5GJgBFQh6rVgo6m5GK/oI1ld6GVx7N4MKBIMA0kptaFkyr56pgZQB1FNKcOkrnqUA
	Qdk9fobodEfYByv1qsUOQ4dlb/A39WQ/ZKnR6W8YOS60AzxBoQ9G6EqJP3Lks0M35Lac+WLJO8Hab
	MjU2GeaUVzZxOcK3rwIGI3NiXh8FM9GV8YxX8O5ToA/7+MaPNdipJ3ZlQTjXkVv7JJScam7hIPr2b
	dM0UGY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLA-0000000DUpj-0KKd;
	Fri, 31 Jul 2026 19:56:20 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptL8-0000000DUp3-0QGF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:19 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84857446424so2574454b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527776; x=1786132576; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gd1m/0mWimKO7o4EYRsTYXZShyBAIYbMepMSGbfxdyY=;
        b=jyGVl2tjZlHaUJX1pAK93wWXcF5M9u16HHy+lqUCmB8LzpYxfM7j3y+fCGCpDZVZi9
         P3sfx90aEvNRG15NoVJ6dikxA1WFFYq316oX01ndrRr4IofWvUiJm+c6cObtgBfQcF+O
         k/6o8o0VO4qzbTD0c2jCtri694l8QG1yb2fyCX4bvNq8Rubkcw/aFaamgn/SZO6R1qKF
         bC7Mlczjeds1oBzwgghJQYq3ahBIVioHCjS31tYY+2qwM0XFRNoG8tq93UuEbTMORPFf
         awXaTjnR+Eo6ZScgkdUsDVSGkh1kM4kjDbc30e8e2bLVYne33dA2WhlH3a8PFPq1S948
         x3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527776; x=1786132576;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gd1m/0mWimKO7o4EYRsTYXZShyBAIYbMepMSGbfxdyY=;
        b=WydsoHX+74Wl5l3bNFTn5EpkTrs5GRcQZZnD/GZE7dAOEph9yr7RamraYDNwIblHp2
         l8LYMYyS8LK96UHihPYbBlJVyrxg26n1WCBVwGDi2vGTQl+t4bRRrH+RdQOCh/VVJV8K
         28D7FyagqeUtpsV1NcwZI2YTUUtnIHDxXJNs3aLsECKahxJCvOfow5R+k6R/hSHlNYco
         cEGozns3OlSXZirX60pHNK6tSA87Q/rkAH/BNpImfm33wdXkHqnvhAU6f9K8JFr16fbT
         fA6Nx5akLFPMdJliNscEd/qEEEbXXQh6MYYCzd5Sioa5lhM+oZGRX/5Zuv5vQGT+hQx+
         Y6vQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFFqLO8A8QaVBQMycCzsiz4G2/N4h05sQjFDhgD2prIJ/VU5S3eHzLVppi5pyekXQSPe56GRphyW2vXBYfhizW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2SrGqqteld1i4J/f/1E66v+F3Q56OH/lrhvTUCn4vMUUuNDg2
	rOPOXSRfuj4pIQe/MLvVgOfioLJD1m2Jqp0cHKFG5Y4Lwm18ITJIloB7J6SHlfoT40lqM89WVBx
	zkjNYfw==
X-Received: from pfble14.prod.google.com ([2002:a05:6a00:4fce:b0:84e:530a:923a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fca:b0:84c:4bf4:10c3
 with SMTP id d2e1a72fcca58-84ee490ac3bmr716956b3a.38.1785527775964; Fri, 31
 Jul 2026 12:56:15 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:00 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-1-seanjc@google.com>
Subject: [PATCH v3 00/12] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
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
X-CRM114-CacheID: sfid-20260731_125618_145163_1CBFAE8B 
X-CRM114-Status: GOOD (  11.29  )
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

Third time's a charm.  Sorry for the spam.

Buried in the middle of this is a fix for the hardware_disable_test where
it can end up with a runtime of multiple minutes when running a preemptible
kernels on a large NUMA system.  Turns out my analysis/guess in v1 was wrong;
the problem isn't direct CPU contention, it's that letting the workers do any
amount of "real" work on any CPUs leads to pthread_create() slowdowns from
the perspective of the caller.

The vast, vast majority of the changes are adding kvm_xxx() syscall wrappers
so that tests don't need to manually assert that a syscall succeeds (the
hardware disable test had some ugly equivalents).

v3:
 - Key off _GNU_SOURCE, not __USE_GNU. [Sashiko]
 - Clear consumed CPUs from the allowed set. [Sashiko]
 - Assert that settings affinity attributes succeeds. [Sasiko]

v2:
 - https://lore.kernel.org/all/20260731170619.2620845-1-seanjc%40google.com
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
 .../selftests/kvm/hardware_disable_test.c     | 109 ++++++++----------
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
 tools/testing/selftests/kvm/x86/hyperv_ipi.c  |  32 +----
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |  30 +----
 .../kvm/x86/private_mem_conversions_test.c    |   4 +-
 .../kvm/x86/private_mem_kvm_exits_test.c      |   7 +-
 .../selftests/kvm/x86/recalc_apic_map_test.c  |   5 +-
 .../selftests/kvm/x86/sev_migrate_tests.c     |   4 +-
 .../selftests/kvm/x86/sync_regs_test.c        |   5 +-
 .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |  31 +----
 .../selftests/kvm/x86/xen_shinfo_test.c       |  10 +-
 30 files changed, 187 insertions(+), 232 deletions(-)


base-commit: 3c7d7f908d574277a845423ec32250a8d8df44c8
-- 
2.55.0.508.g3f0d502094-goog


