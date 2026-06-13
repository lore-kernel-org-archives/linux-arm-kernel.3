Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91955CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWIXchGp3EK3iYBKn9Q0PTpgyTSAfcuEHB9Bn8r8u9A=; b=RWiIfKMXzw9YpQrjnoMrHfvTKQ
	h+dAYdyYHQbEv3/uoqdwZTAwBVoWEWG2Edci6LlMMwC9a8RLjHIFjNqi8OZ7teHSgok+vmuHF6w/v
	vgwPeSZcrMrUQ7vDbnYCqc9hF6sEoaeSSDQ9WriI8HWK/R9yK3+f//JmPzZ6FWWiHPDVu+paiyCW3
	vu+MN4EV3b5prOqFLwqpCsfXMCeWD1Vf5b8Y5fsmrbwyfhmNsUeah/q5F5yI7BxMonLaT5rscsQlP
	xE/Bmg+p2HY8elX74hxESmC6yjRcCsX4OMkiUOqdT6MLpI3sy6LUEgFP8umm61BC5lnXmEr/6dw/4
	Xh/D/B3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7W-0000000Bo2H-00Kl;
	Sat, 13 Jun 2026 00:21:06 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7L-0000000Bnms-3uvI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:57 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c2b64850easo28552695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310054; x=1781914854; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sWIXchGp3EK3iYBKn9Q0PTpgyTSAfcuEHB9Bn8r8u9A=;
        b=fCbRAqCiFtZfAZb25+sYtc0VIirXn/D0xajdCUauPvAXBy8Vsi3MlO4B78+fnwYJor
         qWZHp/14H7+VoKIo0ulc6dbmnYEhCF5t1T1hTL4tSx4esoZwi60qJAHoIlQcQS3sz4Px
         4rsaGvpZXF5NvRc8IVdeQZmZp0y4684OEOPpUwBJMP6tPlTWAcsanQU46S0ZEGDQD9Hk
         ATYLkPrnaXtvKMoWZ8iz97a82Whwp244SW+XBVYVarwaif9Wa0Z7gYc6RcoTMxWYCTbI
         7qWdRwrS3KiImU4BOTzK/01eRCnjsrXnoNMQ0Qqj2dB/++iwt2wXC1Xhd9JeSlvnUMcX
         GIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310054; x=1781914854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWIXchGp3EK3iYBKn9Q0PTpgyTSAfcuEHB9Bn8r8u9A=;
        b=WBP0tWej1MRyAp7qOUXZAfEH+MmLu+1VLQEL4gz9Qd0pwbbZSbCkC59sEQ+JLSMGhp
         rMy+UkNMRCfBgaQH7/CAtE2fTQCZpcyS3Fy3Zmnw682z/nBYSpZdk6D9D7qa14k0oy+h
         TFbvqf/eb8UE9S3HjD1q8c26XqkJq/eKsqTHmLsAJyLx3b3NbgX47+bkE2dQV+QH6ho3
         YnR1vYC3PHAKbsGs/wuXM+lqkz/hiiJRCSli/SAjZMZJ2UE9gAewy/vZBJc5nG89zzC4
         Pp5sqWzgwRnO+9BO3O0wxMVl+PuYTjUWTl+QYi5lacOqjt4cSpsKn1Rs1kpmTUsSV8ft
         IqPg==
X-Forwarded-Encrypted: i=1; AFNElJ/OULjRYSniaAhaIK16WVvvXACHfpbfrUx8cbrVzWpm6SSwOdLml1HfR2LglmQKKYyo5VXu6TN3NtfKAxh4meec@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/owUSdbugkDwJWtP1kvZVm/0jRDtHAkHfE2aNvlxPzbVcE3ji
	M5ydaD56/gH6+Fz0vxBM1oT1PWM0lxhFR3+DcpDRe31Ly6ZvhNmH+IjEnwUrtn1ivsi0ENAPT7J
	V7VNr4A==
X-Received: from plrf19.prod.google.com ([2002:a17:902:ab93:b0:2bd:5ced:c1c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:f8e:b0:2c0:d8ee:7d66
 with SMTP id d9443c01a7336-2c6642a221amr19502385ad.36.1781310054137; Fri, 12
 Jun 2026 17:20:54 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:26 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-16-seanjc@google.com>
Subject: [PATCH v7 15/20] KVM: selftests: Add kvm_gettid() wrapper and convert users
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
X-CRM114-CacheID: sfid-20260612_172055_981909_4D327955 
X-CRM114-Status: GOOD (  13.46  )
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
2.54.0.1136.gdb2ca164c4-goog


