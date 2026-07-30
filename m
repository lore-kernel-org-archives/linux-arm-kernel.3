Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A27C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgYOnGbE/Qcoxe+WXdzA3Ub6YZQpGia+1p7vtjJDY/M=; b=2oDGhwXdc/uU5TvOmKHbqgZdWm
	woiyyzs2cF32d7kfOtgz+ThCg5e7aVs8bkPhbJqtJgcmckiQYXjayaVlQb1A+D1SF6q2YwJvhPubu
	W12GwambCTzpx5lucWZ2y+hkUHz5RcYACEQiNZ4SJ44tYCVzuZMP9A5tmfCLFg+VDEDaWpiNKQK45
	AJbo5hdolowANh57rcs8yhWF5Ud1DUdv/8EESiuml4Bg/A4Y4BctA7rnpWFIKEi1iM1tibKcXg8BU
	Xlsa+VGwSrz5Jkt5QGTpCeKpRvrnvOEvm2e2TXVQwtr2vDxb74h2GFwC0QLpRJkwHwNZayW8OqWmO
	J4tC7BxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWI1-0000000BDnP-0Pe6;
	Thu, 30 Jul 2026 19:19:33 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHq-0000000BDgN-09nm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:23 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8485d853b08so361390b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439161; x=1786043961; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YgYOnGbE/Qcoxe+WXdzA3Ub6YZQpGia+1p7vtjJDY/M=;
        b=f+dJucrp+HDD0GDCIL5w4wafDTLR3aEHs8LpsgP1IEnwjZ93mYe/6VMq1BPRR2XRVk
         6vLn+riP9GC4eDhO+oyY1US5xAz/InMOqsskPx5OgxEO4h1MAbgwCx/NiLFYLSYFvvZJ
         vdcAbBQ6+J9nSPWepkZRETyPcCcTNHNheyI9YzYDSJ5Ud9aTNGTRzG+AKvLHSM/ypLaT
         r1s9XoEyYnBDIYNVmq9++Te7SAHm4CVT8l8Nq9tyyLutVNhzHnNfMww+kE+ecFfMK0I6
         DG+Cc6bHqo4ZUKxZv+Rz56s5UlG3kR+/vzFyxjxgIcXaAwuwpxHtEBMT2ve0v+kMZ4WR
         U0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439161; x=1786043961;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgYOnGbE/Qcoxe+WXdzA3Ub6YZQpGia+1p7vtjJDY/M=;
        b=EN7iaG9BU7YFX/oTK3AEsdKy8woGWU4Ghwwt5RKsH5u6FMXcW/Tt1NW8Idf78dMQej
         K3A15I4+b4E5wDjGcyXJtBITfviWjM8ZhOIjx5ejcSrk6V22xRrSyFvw+v7BVVIeCkOG
         oe+O2PkG4hZIbi1cJkTLRyA6aWL1n0Wl7UyHM6vJxx3cYxhpvBqXX91dJH125mWO5PFe
         8F8pdMKfjwAj8iyOX8M3YeN0El7jjmCmhaSMP78dZ8Bq4ePj37tUBLgWicGLgzo380oz
         zPTqMt8oji0mtshZ2p/010RuJLyBtfgPq85p9ec1cPUASQC6Q7+4jPNSKPXUmLDmxK2/
         WvZA==
X-Forwarded-Encrypted: i=1; AHgh+RpR2M0p/mygJUsu4vBTrE/e9EtiRAmUuKZCcolrQ+cDUYuHYJtDsbhP2/e5KSccqi6UADNreGN4HrmAnX8ysktt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8jHKOznf4qMES/Z64pMUd6z7PcVR2i7hEDtnqtyc7kcRHq4hX
	DxRauyjuF3kvYX05qEaBsfCjj8HJeGPbgKLEI0kaa/InJYMaWnH/drUPEv4hclGVbGlSBWNpfiH
	/fDOb4Q==
X-Received: from pfoi22.prod.google.com ([2002:aa7:87d6:0:b0:847:823c:d265])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12da:b0:848:2d1d:836f
 with SMTP id d2e1a72fcca58-84ebc22e880mr3456538b3a.28.1785439160801; Thu, 30
 Jul 2026 12:19:20 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:07 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-9-seanjc@google.com>
Subject: [PATCH 8/9] KVM: selftests: Add KVM syscall wrappers for pthread_{g,s}etaffinity_np()
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
X-CRM114-CacheID: sfid-20260730_121922_090663_EC024C43 
X-CRM114-Status: GOOD (  11.56  )
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

Add and use KVM wrappers for pthread_{g,s}etaffinity_np() so that selftests
don't need to manually assert that the syscalls succeeded, and so that they
don't need to manually pass in sizeof(cpu_set_t) for the size.

Note, the steal time test didn't assert success, but the TEST_ASSERT() one
line later makes it quite clear the test relies on pthread_getaffinity_np()
succeeding.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c        | 12 ++----------
 .../testing/selftests/kvm/include/kvm_syscalls.h | 16 ++++++++++++++++
 tools/testing/selftests/kvm/steal_time.c         |  2 +-
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 38ebacaa0fce..bcca42182656 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -54,14 +54,6 @@ static void *sleeping_thread(void *arg)
 	TEST_FAIL("%s: exited", __func__);
 }
 
-static inline void check_set_affinity(pthread_t thread, cpu_set_t *cpu_set)
-{
-	int r;
-
-	r = pthread_setaffinity_np(thread, sizeof(cpu_set_t), cpu_set);
-	TEST_ASSERT(r == 0, "%s: failed set affinity", __func__);
-}
-
 static void run_test(u32 run)
 {
 	struct kvm_vcpu *vcpu;
@@ -76,11 +68,11 @@ static void run_test(u32 run)
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
 		kvm_pthread_create(&thread, NULL, run_vcpu, vcpu);
-		check_set_affinity(thread, &child_cpu_set);
+		kvm_pthread_setaffinity(thread, &child_cpu_set);
 
 		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
 			kvm_pthread_create(&thread, NULL, sleeping_thread, (void *)NULL);
-			check_set_affinity(thread, &child_cpu_set);
+			kvm_pthread_setaffinity(thread, &child_cpu_set);
 		}
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index 002b5a4e59eb..3d82351bef92 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -97,6 +97,22 @@ __KVM_SYSCALL_DEFINE(ftruncate, 2, unsigned int, fd, off_t, length);
 __KVM_SYSCALL_DEFINE(madvise, 3, void *, addr, size_t, length, int, advice);
 __KVM_SYSCALL_DEFINE(sched_getaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_set_t *, mask);
 
+__KVM_SYSCALL_DEFINE(pthread_getaffinity_np, 3, pthread_t, thread,
+		     size_t, cpusetsize, cpu_set_t *, cpuset);
+__KVM_SYSCALL_DEFINE(pthread_setaffinity_np, 3, pthread_t, thread,
+		     size_t, cpusetsize, const cpu_set_t *, cpuset);
+
+static inline void kvm_pthread_getaffinity(pthread_t thread, cpu_set_t *cpuset)
+{
+	kvm_pthread_getaffinity_np(thread, sizeof(cpu_set_t), cpuset);
+}
+
+static inline void kvm_pthread_setaffinity(pthread_t thread,
+					   const cpu_set_t *cpuset)
+{
+	kvm_pthread_setaffinity_np(thread, sizeof(cpu_set_t), cpuset);
+}
+
 typedef void *(*pthread_fn_t)(void *);
 __KVM_SYSCALL_DEFINE(pthread_create, 4, pthread_t *, thread,
 		     const pthread_attr_t *, attr, pthread_fn_t, fn, void *, arg);
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 6cb1eb4c40c9..bc3c62b72c58 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -549,7 +549,7 @@ int main(int ac, char **av)
 		/* Steal time from the VCPU. The steal time thread has the same CPU affinity as the VCPUs. */
 		run_delay = get_run_delay();
 		kvm_pthread_create(&thread, NULL, do_steal_time, NULL);
-		pthread_getaffinity_np(thread, sizeof(cpuset), &cpuset);
+		kvm_pthread_getaffinity(thread, &cpuset);
 		TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(cpu, &cpuset),
 			    "Worker failed to inherit parent's CPU affinity");
 
-- 
2.55.0.508.g3f0d502094-goog


