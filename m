Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE932CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of0+/OyjoX6CQ6jcUnUQyOfLggopCHteLCuLm5aJ7j0=; b=rwRGWnmkZEbpbzDj8vRoKH7GJt
	puVjmw8PkHq+eNczOyKvobYJ8s+cwBkje8CsXkZn4q7NKAKus4qwxoabjrBpyGeD2IF4399o3eZ+u
	Db8KuEZ0qebq14/YV0ffg25d8DWBqGrlnA75M38Zhr58Rwek/ehQKkneWIhG++Oz44ewrqSz+UZ7u
	Qk48DahKADz0f/yZwVY5VxPbExQW7wO+LOVL6e8KDEIgcjhG6FgcRFzO9i3NWzwmneo3fBmPDPS3K
	MBAT3bbES48g0qkcrYtXTmHhUm2HO34eSgsrw1apJEYdhzQ5RyHfR0+HotA5v4jewij2pRKoAME2G
	zKb1YkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7W-0000000Bo33-1DPL;
	Sat, 13 Jun 2026 00:21:06 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7M-0000000Bno7-3X6K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso36610925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310055; x=1781914855; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Of0+/OyjoX6CQ6jcUnUQyOfLggopCHteLCuLm5aJ7j0=;
        b=fSmPLANN8ideEfLgYsWMnjOloSxoDW8SazS+NUhv95y/6AqmfpL1P0lxTt7PpgJUvp
         Zgus+pmM4KRe0LRjxT4QCtXA2tkNn0fXTeSvnGUrC+O3Z8ZxGPn+n3EHd7BieBIJlziu
         B8MRLyP31AC0qClkBRCaNQatEWZOuRRlHpSxcmp2TYnCbQqCLiB1mMh/iv+DQ0qKetV/
         AJLmCv2QdXFhyvv7eXIKPX0nhdfJHDuwRgzgTZ2bdT8IxvFd0RO2HJSe2I5zgbBkexN+
         BxYw79ol2Na0QWmy/pGYrBjpOcRwgjMRh0XJbZEg8H25PXt1NDjuEmaPjSfMH4ZRoOY2
         uA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310055; x=1781914855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of0+/OyjoX6CQ6jcUnUQyOfLggopCHteLCuLm5aJ7j0=;
        b=NgrbLrPH76fSZHMMsRoAvwHRzAV9zIznwT0KJnvCPmta/3tRnAm8ug4Zb8SZ53cE2d
         hWSv0gxru1UmgDYVwIcieoyxeBkFhZzq9EyjtJtIswmj8KXZ0wNuMBF9vCXcuZSJDDb+
         QeWOtyilw1sEdZFLGu1LUe7bn+O3JUe0F0ijcbAy3QDP7dJ9dL0kzxDg8k7e+EQlt1EO
         09lZyqDH6YVskrh6/B2tr9sABCUbA56UVSQ2sHqIgR27cnZdLOIxcGDmXQdvrbo2Y6al
         YkAD3Wl0ByHCVJozj/zg0G+E8PFdfBYnurGGNr+iTLMIc/vEJGaOCt8DqZV1JCP1Byrw
         SZ3g==
X-Forwarded-Encrypted: i=1; AFNElJ88ASz54L/UVM/BUK4pat+pzQ1tUl/xws0jxSRWVuDV9begwKSPxgxETjgyUlATSvcCxcMGh0mO3WmeBSfKyyiW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+bmslrGF40IBPd4n1AGy2IeQ6itxk984JV5n3oVaKb0yptmOD
	7gp4B8fxroO9lDI++vG/csH/oW/Dctij/Fz+fwrgg2S4zADyEi512xRFX+DcNwLUYkCjOhLDvXc
	swygMkg==
X-Received: from plfp3.prod.google.com ([2002:a17:902:e743:b0:2b2:a715:a848])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b0e:b0:2c3:5683:9acb
 with SMTP id d9443c01a7336-2c412e2203emr57678865ad.32.1781310055345; Fri, 12
 Jun 2026 17:20:55 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:27 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-17-seanjc@google.com>
Subject: [PATCH v7 16/20] KVM: selftests: Add kvm_sched_getaffinity() wrapper
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
X-CRM114-CacheID: sfid-20260612_172056_891413_5A363806 
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
index 2e08d9fcefc7..9bf28b7d9d7a 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -673,13 +673,12 @@ void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
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
2.54.0.1136.gdb2ca164c4-goog


