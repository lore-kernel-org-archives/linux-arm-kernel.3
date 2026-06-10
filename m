Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9857CD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZpcWMnVr5/m3HbsHebdKOhGRYEoJTay0WQIxFsC+10=; b=deBuyo89CFJbJ/pHQr4KlU0igR
	Olkr0HpdLUJx9Kdh0vmb0/Rk0Yy7jwgNl3Ad0f+zQF2K76zmaixNMcOaL2JcvYjaDifwBhU1+nJR5
	Hfijxn745/SXym2w9nJ6ZMFfUn+kYfXK6W/p2e4RZ5yUE/YrpLjBt89KK+7IoEqt2oR57a/2ynELr
	tbVQHycIheMdqIAQFNHvMzH4TJXZx5/nSRYjmO5VfWRPqxVu/b78uTL0j53sP4UvROSVpp19/azRt
	q0ojE13cWoIglh2/yPJXkK6AvPT3ULIteRRubh4KAFwV68KEin8w78wON0c4++xLwZML28qNcak/u
	cn5n1bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cp-00000006ZjO-3j1Q;
	Wed, 10 Jun 2026 00:54:07 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ci-00000006ZYf-34Fe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:54:01 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-8423f3e4728so4039920b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052839; x=1781657639; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZpcWMnVr5/m3HbsHebdKOhGRYEoJTay0WQIxFsC+10=;
        b=fpXHLiRhA/Bj0HgRXN4pElqTClWjyl9Qea3haEHtyo7zW4Ymv1DkaP3LMx9VkXIGva
         feuby3q4WvCnrhpG850yfBWZkDInV2ygstXjHp8PadZNccb8BM7fhtbLnjavMO+jzh7w
         nLDOKPrFZUHMtEX6+dMGelTsooqQzr+64tLC85dDywAwiCN1fQo6NmIIdLIQTq+HjoX4
         3o0TcMMAd8OusgmkOw4Q6zwH9DIE9tSxoNbDxKCex7fPubzOjbpzpd6RelSlfHW1kxmG
         c5prh9jOI7WOAPGJsHELqMsu1N7Y9s5j1x+Vek/vztPROuhxune1es6z+Y7OIQZKVy14
         9zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052839; x=1781657639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZpcWMnVr5/m3HbsHebdKOhGRYEoJTay0WQIxFsC+10=;
        b=odnuDx7rNO3jK7ctlZYDjGTOG803a2Yosuu7v0yg99dui7b8ejfeI9kVUcEcwfI7XI
         ukscKwOH6RA1uvzQaCFsXbwIZzyBo2Af4prtlVzp0IbYgfRWipa4yHesn56DgUzISsgK
         kb1ilI5t9RhmdFTi0RQbw8DCtG6U7DIL9oDLlKpMG5afEnoOMan7fdZ6bAIXFmtojNQ+
         u2ILtarXh2r/ld3jz0fYNyEvmF9gtvixMkAzg6yV+LbOURt21YwDbbzEQOsGRzaePMuM
         /CJLadOE4CO0K7/SsanL43rS2CY6gLvA/5BdnUKZ2ZZo8ynpKeAGltVdt5Zg+JqMYLMU
         EL7A==
X-Forwarded-Encrypted: i=1; AFNElJ88g57m2UOAAgqXmGjmxA6gX6ER+o3nlYR+iu4Z3igzyfF2BKvRFleyQH1la5gKXF8nRigtY81VF2NGJPyiGFnJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4u4jeP6vO6Q0BvQoDrxmMXBAUEvmAAsBB9wNZ+swz6QEbXPyr
	D7SGUdRcSUsS0dwyomcvHCT0Y/EO+Kzy+pDVOthvq5Ca5pRiMpTKFjtSI+S4fvHFDt8k+OdQVXr
	P238QzA==
X-Received: from pfuj3.prod.google.com ([2002:a05:6a00:1303:b0:842:35ec:5b49])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2ea9:b0:842:7a78:8f14
 with SMTP id d2e1a72fcca58-842b0f1f235mr20890818b3a.6.1781052839177; Tue, 09
 Jun 2026 17:53:59 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:34 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-15-seanjc@google.com>
Subject: [PATCH v6 14/18] KVM: selftests: Add kvm_sched_getaffinity() wrapper
 and convert users
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
X-CRM114-CacheID: sfid-20260609_175400_779872_98A8E44C 
X-CRM114-Status: GOOD (  12.86  )
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

From: Josh Hilke <jrhilke@google.com>

Add and use a KVM wrapper for the sched_getaffinity() syscall so that
selftests don't need to manually assert that the syscall succeeded.

Note, some tests didn't actually assert success, but they all obviously
rely on the syscall to succeed.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arch_timer.c                  | 2 +-
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 tools/testing/selftests/kvm/include/kvm_syscalls.h        | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c                | 5 ++---
 tools/testing/selftests/kvm/mmu_stress_test.c             | 6 +-----
 tools/testing/selftests/kvm/rseq_test.c                   | 4 +---
 6 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/arch_timer.c b/tools/testing/selftests/kvm/arch_timer.c
index 90c475a61b22..f8b02597897b 100644
--- a/tools/testing/selftests/kvm/arch_timer.c
+++ b/tools/testing/selftests/kvm/arch_timer.c
@@ -85,7 +85,7 @@ static u32 test_get_pcpu(void)
 	cpu_set_t online_cpuset;
 
 	nproc_conf = get_nprocs_conf();
-	sched_getaffinity(0, sizeof(cpu_set_t), &online_cpuset);
+	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &online_cpuset);
 
 	/* Randomly find an available pCPU to place a vCPU on */
 	do {
diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index f7625eb711d6..d9c9377a6325 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -1039,7 +1039,7 @@ int main(int argc, char *argv[])
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
-	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+	kvm_sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
 	set_counter_defaults();
 
 	if (test_args.test_virtual) {
diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index dc4fb97aef8d..5dae6143ddb0 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -12,6 +12,7 @@
 #include <sys/mman.h>
 #include <sys/syscall.h>
 
+#include <sched.h>
 #include <test_util.h>
 
 #define MAP_ARGS0(m,...)
@@ -93,6 +94,7 @@ __KVM_SYSCALL_DEFINE(close, 1, int, fd);
 __KVM_SYSCALL_DEFINE(fallocate, 4, int, fd, int, mode, loff_t, offset, loff_t, len);
 __KVM_SYSCALL_DEFINE(ftruncate, 2, unsigned int, fd, off_t, length);
 __KVM_SYSCALL_DEFINE(madvise, 3, void *, addr, size_t, length, int, advice);
+__KVM_SYSCALL_DEFINE(sched_getaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_set_t *, mask);
 
 #define kvm_free_fd(fd)		\
 do {				\
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 875030c22d07..92013883f35b 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -668,13 +668,12 @@ void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
 	cpu_set_t allowed_mask;
 	char *cpu, *cpu_list;
 	char delim[2] = ",";
-	int i, r;
+	int i;
 
 	cpu_list = strdup(pcpus_string);
 	TEST_ASSERT(cpu_list, "strdup() allocation failed.");
 
-	r = sched_getaffinity(0, sizeof(allowed_mask), &allowed_mask);
-	TEST_ASSERT(!r, "sched_getaffinity() failed");
+	kvm_sched_getaffinity(0, sizeof(allowed_mask), &allowed_mask);
 
 	cpu = strtok(cpu_list, delim);
 
diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 473ef4c0ea9f..3d5f33a63b2b 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -255,11 +255,7 @@ static void rendezvous_with_vcpus(struct timespec *time, const char *name)
 static void calc_default_nr_vcpus(void)
 {
 	cpu_set_t possible_mask;
-	int r;
-
-	r = sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
-	TEST_ASSERT(!r, "sched_getaffinity failed, errno = %d (%s)",
-		    errno, strerror(errno));
+	kvm_sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
 
 	nr_vcpus = CPU_COUNT(&possible_mask);
 	TEST_ASSERT(nr_vcpus > 0, "Uh, no CPUs?");
diff --git a/tools/testing/selftests/kvm/rseq_test.c b/tools/testing/selftests/kvm/rseq_test.c
index 6510fbfd64f1..557e393c223b 100644
--- a/tools/testing/selftests/kvm/rseq_test.c
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -226,9 +226,7 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	r = sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
-	TEST_ASSERT(!r, "sched_getaffinity failed, errno = %d (%s)", errno,
-		    strerror(errno));
+	kvm_sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
 
 	calc_min_max_cpu();
 
-- 
2.54.0.1099.g489fc7bff1-goog


