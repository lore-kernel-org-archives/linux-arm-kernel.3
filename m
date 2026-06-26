Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B097AC43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGnCIDvL4VuiQREjmSstYz3dctCxQA8TSy/TAbZS7yY=; b=u4PRsUri9Trx6Y+z7iNIKUH95Q
	3x4kk8bhJ1l2HjLfogqk1OuJsRIDOPC7vx40ctGm2QQ0PW8tQwGgm4MX1e3qelNW82qQIitS0GcLH
	JRZ/JNeDLttHd4UuUnYiYJeDIoBnFOsjv9hmdN879LMtaGtglOJkWG12SoLFu3oWIcIIV5SoQs7MD
	zy5wZsWmRerFssoVuiRrWsQNwKMxHIPRuVv4YBKSj77po7zoGNw1AmX65IL3BLO97eEmr/GGhrl12
	IjIut91Z5mjggC0rqfm0SbpuWAKZ5N0s+uflCb4zr3w2Q2Fuka/kYjaxN+5/R/Mr5/SemqzmebZjz
	dtrvjqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDZ-0000000Buc1-0qte;
	Fri, 26 Jun 2026 21:36:09 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDO-0000000BuOa-3J8s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:36:01 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-37d125687b6so1418993a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509755; x=1783114555; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MGnCIDvL4VuiQREjmSstYz3dctCxQA8TSy/TAbZS7yY=;
        b=UiS4Q0gZyVPzTsac7hdMyozL1bc0sgQ5/3ZMvfVv/M8FUhCGe9lG136qYheoaoyjkJ
         i0QGsv82Ey2RnQ8UMb2X9Lfr9vjsAAs+aG7KroJ6QvwKBLnBdj6q3vblYZBnp7Xte+eH
         l/WbxelIrH1pRzAoLO1wJ9YTjbO86d2fBkGzW7RC/jELSiux4o7xEiw+mc3nSYRW6Ecl
         NDSF+kWU/KO/cH8b+DKNtn7oDr0e6IQ2vtI+dIweaWQu7b8r7fG7a7G5amVBVKV8sHBM
         oVH4woruRB3lLiUEPEpFHfXLkY65G2o770XC+ExHkI2B2XnI4vvPURJ12cn7n8aCbq9f
         2Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509755; x=1783114555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGnCIDvL4VuiQREjmSstYz3dctCxQA8TSy/TAbZS7yY=;
        b=CyWWEoUOlcjEgr5vhn4CW2g+BuG8e+1YwGb/mvJpwKc7d/dN85ks/qulCq4pOK/LXD
         XCUuODrNMt3I4MHJEY1+8oqGPaJJqgmIRfv56kQE3Xe5Ls91/SBdTjswg0GBFqd1ILU5
         d4slw/VRSu3GB5BooaUpuX7IL9CvmzbQdc5YitsWtMdmsqVw/oMhYA31DFP32SzDDFaH
         z5oG8SYLAO2VcPXsn9Rf8pUkdR1RxUPD12BzvnrBSYA/N6u1vU5xcY+JGSGYYscstMLe
         xTjl/9wYPjdMm5adNowyrPkz+5Nc4KCOFrZjcbWhyg04WUt3pA07fyQmYMXmIsXh/Xul
         L39Q==
X-Forwarded-Encrypted: i=1; AHgh+RrWNVo7JkY/dz1yc+ctKVnsd0MGBH4Bfm3YZXOHXajsnfBl8TGnhXiL7eQwyo8x84THLeoBbVJA2YLqCM1kSiBi@lists.infradead.org
X-Gm-Message-State: AOJu0YyD7yEAPNjQDkRHr1DNSOfSiimJ5+6tBjsfz7LUDaXiQa8kTt57
	qGTpwQ1FmXc/lmpP54WMUUh7j2rLijRlxl/4KYZmjA/lVUZBK3cFH075GQFtvcyP+3MfVyuKGCP
	qWpjcEA==
X-Received: from plau11.prod.google.com ([2002:a17:903:304b:b0:2c6:e595:44e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f4c:b0:2c9:9a19:10c
 with SMTP id d9443c01a7336-2c99a19037fmr10641045ad.40.1782509754664; Fri, 26
 Jun 2026 14:35:54 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:28 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-16-seanjc@google.com>
Subject: [PATCH v8 15/20] KVM: selftests: Add kvm_gettid() wrapper and convert users
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
X-CRM114-CacheID: sfid-20260626_143558_841611_950FBEA2 
X-CRM114-Status: GOOD (  13.45  )
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

Add a KVM wrapper for the gettid() syscall so that tests don't have to
open code the syscall() themselves.  Unfortunately, not all flavors of
libc that KVM selftests support provide gettid().  Convert all existing
users of the syscall to the new wrapper.

Note, per the gettid() manpage[1], "This call is always successful", i.e.
prefixing kvm_ to the syscall name is aligned with the goal of providing
syscall wrappers that guarantee success.

No functional changes intended.

Link: https://man7.org/linux/man-pages/man2/gettid.2.html [1]
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c   | 2 +-
 tools/testing/selftests/kvm/include/kvm_syscalls.h | 5 +++++
 tools/testing/selftests/kvm/lib/assert.c           | 8 ++------
 tools/testing/selftests/kvm/lib/test_util.c        | 3 ++-
 tools/testing/selftests/kvm/rseq_test.c            | 2 +-
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 302c4923d093..f8b3d0b68830 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -57,7 +57,7 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 static int handle_uffd_page_request(int uffd_mode, int uffd,
 		struct uffd_msg *msg)
 {
-	pid_t tid = syscall(__NR_gettid);
+	pid_t tid = kvm_gettid();
 	u64 addr = msg->arg.pagefault.address;
 	struct timespec start;
 	struct timespec ts_diff;
diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index 6cb3bed29b81..dc4fb97aef8d 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -83,6 +83,11 @@ static inline int kvm_dup(int fd)
 	return new_fd;
 }
 
+static inline pid_t kvm_gettid(void)
+{
+	return syscall(__NR_gettid);
+}
+
 __KVM_SYSCALL_DEFINE(munmap, 2, void *, mem, size_t, size);
 __KVM_SYSCALL_DEFINE(close, 1, int, fd);
 __KVM_SYSCALL_DEFINE(fallocate, 4, int, fd, int, mode, loff_t, offset, loff_t, len);
diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/testing/selftests/kvm/lib/assert.c
index 8be0d09ecf0f..1d72dcdfce3b 100644
--- a/tools/testing/selftests/kvm/lib/assert.c
+++ b/tools/testing/selftests/kvm/lib/assert.c
@@ -10,6 +10,7 @@
 #include <sys/syscall.h>
 
 #include "kselftest.h"
+#include "kvm_syscalls.h"
 
 #ifdef __GLIBC__
 #include <execinfo.h>
@@ -64,11 +65,6 @@ static void test_dump_stack(void)
 static void test_dump_stack(void) {}
 #endif
 
-static pid_t _gettid(void)
-{
-	return syscall(SYS_gettid);
-}
-
 void __attribute__((noinline))
 test_assert(bool exp, const char *exp_str,
 	const char *file, unsigned int line, const char *fmt, ...)
@@ -81,7 +77,7 @@ test_assert(bool exp, const char *exp_str,
 		fprintf(stderr, "==== Test Assertion Failure ====\n"
 			"  %s:%u: %s\n"
 			"  pid=%d tid=%d errno=%d - %s\n",
-			file, line, exp_str, getpid(), _gettid(),
+			file, line, exp_str, getpid(), kvm_gettid(),
 			errno, strerror(errno));
 		test_dump_stack();
 		if (fmt) {
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index e208a57f190c..6b00ab11f3c0 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -17,6 +17,7 @@
 #include "linux/kernel.h"
 
 #include "test_util.h"
+#include "kvm_syscalls.h"
 
 sigjmp_buf expect_sigbus_jmpbuf;
 
@@ -395,7 +396,7 @@ long get_run_delay(void)
 	long val[2];
 	FILE *fp;
 
-	sprintf(path, "/proc/%ld/schedstat", syscall(SYS_gettid));
+	sprintf(path, "/proc/%ld/schedstat", (long)kvm_gettid());
 	fp = fopen(path, "r");
 	/* Return MIN_RUN_DELAY_NS upon failure just to be safe */
 	if (fscanf(fp, "%ld %ld ", &val[0], &val[1]) < 2)
diff --git a/tools/testing/selftests/kvm/rseq_test.c b/tools/testing/selftests/kvm/rseq_test.c
index f80ad6b47d16..6510fbfd64f1 100644
--- a/tools/testing/selftests/kvm/rseq_test.c
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -244,7 +244,7 @@ int main(int argc, char *argv[])
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
 
 	pthread_create(&migration_thread, NULL, migration_worker,
-		       (void *)(unsigned long)syscall(SYS_gettid));
+		       (void *)(unsigned long)kvm_gettid());
 
 	if (latency >= 0) {
 		/*
-- 
2.55.0.rc0.799.gd6f94ed593-goog


