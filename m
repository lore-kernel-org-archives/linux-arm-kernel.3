Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVt0WM+SVB0eo4Zj9fN2K5go0bSH8gfMtLkiFlOavMc=; b=WJB6CKpzIMVISnfytAjRGi8EWd
	w0KVCHEpmNGugZw8e1PiKCsB2FsoSLss8Iggf+rPzm/tAXiiCEOduYlPEdI3KuHJat9MtYHYSohsO
	/ohVHyfBGonH/+b0efYwTUQ3aHkoGx3TBEpac/SQsSZoi/JmXCp5OjTEH7COcFU9hZNtUFpuq/4IG
	qOImZmN9Ums+ezfzZnUUB5h00Wa2FiGULAvUM0MBEE79QIa/a6qlSn4jYDQPpDfvYrCRrPvL0tRZe
	sh+ud4ddntJPqn/+8yO/ipMITl7KoutJiFDE4Qg23mD/fcFxUp1thxUWS+03RBHSof0QcEHtjQq3/
	2G11DSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDZ-0000000BubN-06Zx;
	Fri, 26 Jun 2026 21:36:09 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDP-0000000BuP0-0kEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:36:00 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-845d3bef1e2so287118b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509756; x=1783114556; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VVt0WM+SVB0eo4Zj9fN2K5go0bSH8gfMtLkiFlOavMc=;
        b=BfSsuw+ZaxbIsZbsFnInhy59r4fXJXhbHCHKEWblZAQw5JJ+Y5viaoli7HvRRzikl+
         nqZmWCPG58UX530xO9wscC/uufiPLg+2UXhC3Ngzpz9dFWy9CFxMAmMVzjaTRJDdJq8S
         vZz9s6jef7EBb/EkT25XDmkPtYRWAoIon2AG1L29g8NbAP0QfGEZh0l2Fj+cZflTh1lj
         1DR7NXIp/zMZvrbT59NX54t3Tk5lGkEe0Y+7YCzNAHWAjGLs/PtEfZdIbgjBfGzzYGsp
         3+G03UDi6G5YOmY3kIk8QH9w6pqu/pOTjkdfqiDDxGuyAy27W7YE6VMWBcVEL56lYTXz
         PqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509756; x=1783114556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVt0WM+SVB0eo4Zj9fN2K5go0bSH8gfMtLkiFlOavMc=;
        b=Gq7G49vx9azFBxwrnbxOB9UXoO0T3HdEMzK6iGrujnfe+dNcf4sqRqk/viv427Gfbm
         OluE63afanch+/Y7A/0b1FXS7kVWwawkLeFkRsD/MTRQm1v2hRfMryiqkQACnngQjFzn
         r8NgGirXobdLr5FSgQ0dzhCBojISyLGYTzSKVIyU/ZswooVHq/XlztCSj9u3rUgeWVAO
         o8NQXOh1ti1UCJxxHyJLczv8WoYD0jeybp1gALQ8VpVf7z/vMgNOZt6sGji7SZhPIwTN
         XWknFwJ2Ba+79mD4gv4MuXjZYRjiLsJyk2ENLntH5FqpKkHJrsi8mQzawCzPpRiPHRrQ
         WwIw==
X-Forwarded-Encrypted: i=1; AFNElJ9HQTSMFT1qlR0TdxckNk0I2Lzskw7GamxQ8ZJt1VLCLIycqWZWb9pfU2ApqnvyGTF0pBkl0QfKagLtDXw/Od82@lists.infradead.org
X-Gm-Message-State: AOJu0YwOr4ccE29O7nVH7Zvrro/KM0tCvCdjQGWJVvveRmF06a5GqPip
	HZUusTVdR3laoN4DPuIRQG76K434Vqmam+4HROneXIuwVj7RT+asNZ0a+rgpvPDXerTAJCijWK5
	dcBRwCA==
X-Received: from pfad6.prod.google.com ([2002:a05:6a00:286:b0:845:ce77:29bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a8e:b0:842:4a39:6047
 with SMTP id d2e1a72fcca58-845b3ab68c8mr8857392b3a.29.1782509755806; Fri, 26
 Jun 2026 14:35:55 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:29 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-17-seanjc@google.com>
Subject: [PATCH v8 16/20] KVM: selftests: Add kvm_sched_getaffinity() wrapper
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
X-CRM114-CacheID: sfid-20260626_143559_227317_0AF65536 
X-CRM114-Status: GOOD (  12.28  )
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
index 277166ab1aa9..6a0ee033fdef 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -674,13 +674,12 @@ void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
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
2.55.0.rc0.799.gd6f94ed593-goog


