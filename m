Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF40C55176
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUF7ZMtALHs5ft2o/4IkbgfVOeTdBoOGjjUFtC1Jiy0=; b=0yI29p8KdRfguV0rwa4oEpe8ql
	i1L7WmSB6ToYcoL1dpyyFD19Eywx3clEUZPbsuiULYu4eJlvRc7FDg4WstqrCCPECZX5A3mFQOI0j
	0zpomCrHQlsT2UkKNamKce2KaRo48Ms+zadM26lPVpybST3wCdlW+r4G82Wt65QuBFbevdjat9cTj
	zuV/WVfW7SnWwrQalHau5Zu+gcGqmelgeFOglyRpTZJ6+9qe7s5tG0uN5+yY0/kqdXseRfMlqqxuU
	53HZ/UGHDQyqE9TUyFKJwA/DR4TQq//FEUz1o8xqPLj2bMnVVrtHf96gzjKduLHJond098l6J1cDa
	UoAJFwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLJ-0000000DUvM-38Wj;
	Fri, 31 Jul 2026 19:56:29 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLF-0000000DUrt-2Evc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:26 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1254987b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527784; x=1786132584; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NUF7ZMtALHs5ft2o/4IkbgfVOeTdBoOGjjUFtC1Jiy0=;
        b=duisEL2BMY7HzgNZRj7TAirL6LTUv7dyNwpgWX8I9BBhSvi71HJO5fycavPpyPK8iA
         z2duBfXmVruqbiuaRbIEzDPiN2K3+7r4If7iHGoNOia5hmz40jw+N8xvxXUF0Ss1zioN
         FsXE3gh/8wsU6vz1dri420zU2Z9hP9qPDjLbpY8bPbAmyb4cpsnuUcFicJfL8flgRD3L
         DrJC78SPyjuduOhVHE6CIlVv0a1EIARcYFshKBYJ0drjaJsZmxpHZW+UL5R9PMC/Th6h
         mkjzACeftqzjvKRSZlGCKST/84Ct6zUzAs4pk91tWXIXRmYxoCcn6HLkyxbkP2PcfzbH
         3PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527784; x=1786132584;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUF7ZMtALHs5ft2o/4IkbgfVOeTdBoOGjjUFtC1Jiy0=;
        b=CDiTE8LJOCJKYcFdHG6WFWwstxLxZrDzXO2Zv6cAoJFoZzwopBy4l7Un/1/L5KLKRf
         bNecp5BFvXODHLXM5GSFshTtQE0BbilZh7Cv1d8+vb/WLiTEYWk6bJkhSWkhM33SsPrT
         ocDnbLN22lDW4dLZ5BB0hkBLKHUrmfvDoxkH7uM/H42/DsltLYT8LpEQ3q1L4B+YRabp
         ZYUhQxHeqF4lcyvhFRYZ1zpt0lt1E1aJNVGe50j3+FntpphRKB7m/dSc98HvcwrBTtOi
         SLiJ8iHUZPFK8Z86aAl+WsOWQLo735lhlsY/QE8SC1yrUd8SVIpwOwTZzhP4iOkVJqCc
         yJUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnidV2rWdfCbyY4MuP/pEyzx91q08ZX9uXJXBU2hF10drVqWGs07RCEYKzJJKYPfam8OJr3fSpZMjikxO49G6I@lists.infradead.org
X-Gm-Message-State: AOJu0YyizWTW8VX7Mc8DVddhfQbAOsb94e2E3nCQrNyAZNQHKao8NldI
	DL1dwQQ4H9RLDgUEVt/Wjdsbj6GdXIYzjljqczVuoPUwErzQiN/hcBHEXYCX/zzxEQ2AHU9g2Jz
	enga/Fg==
X-Received: from pfva4.prod.google.com ([2002:a05:6a00:c84:b0:845:4ca2:60a5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1d8c:b0:845:df5c:2567
 with SMTP id d2e1a72fcca58-84ee492fc27mr727552b3a.25.1785527784352; Fri, 31
 Jul 2026 12:56:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:07 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-8-seanjc@google.com>
Subject: [PATCH v3 07/12] KVM: selftests: Drop unreachable, dead code from
 hardware disable test
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
X-CRM114-CacheID: sfid-20260731_125625_579005_68A79A1E 
X-CRM114-Status: GOOD (  14.54  )
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

Drop all of the code that is unreachable in the hardware disable test, as
it adds a lot of noise that makes the test seem far more complicated than
it actually is.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c     | 41 +++++++------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index fcc06c602fca..de8e63da7b58 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -15,6 +15,7 @@
 #include <test_util.h>
 
 #include "kvm_util.h"
+#include "ucall_common.h"
 
 #define VCPU_NUM 4
 #define SLEEPING_THREAD_NUM (1 << 4)
@@ -28,7 +29,7 @@ static void guest_code(void)
 {
 	for (;;)
 		;  /* Some busy work */
-	printf("Should not be reached.\n");
+	GUEST_ASSERT(0);
 }
 
 static void *run_vcpu(void *arg)
@@ -42,10 +43,8 @@ static void *run_vcpu(void *arg)
 
 	vcpu_run(vcpu);
 
-	TEST_ASSERT(false, "%s: exited with reason %d: %s",
-		    __func__, run->exit_reason,
-		    exit_reason_str(run->exit_reason));
-	pthread_exit(NULL);
+	TEST_FAIL("vCPU%d exited with reason %d: %s",
+		  vcpu->id, run->exit_reason, exit_reason_str(run->exit_reason));
 }
 
 static void *sleeping_thread(void *arg)
@@ -56,12 +55,11 @@ static void *sleeping_thread(void *arg)
 	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
 #endif
 
-	while (true) {
+	while (1) {
 		fd = open("/dev/null", O_RDWR);
 		close(fd);
 	}
-	TEST_ASSERT(false, "%s: exited", __func__);
-	pthread_exit(NULL);
+	TEST_FAIL("%s: exited", __func__);
 }
 
 static inline void check_create_thread(pthread_t *thread, pthread_attr_t *attr,
@@ -73,22 +71,12 @@ static inline void check_create_thread(pthread_t *thread, pthread_attr_t *attr,
 	TEST_ASSERT(r == 0, "%s: failed to create thread", __func__);
 }
 
-static inline void check_join(pthread_t thread, void **retval)
-{
-	int r;
-
-	r = pthread_join(thread, retval);
-	TEST_ASSERT(r == 0, "%s: failed to join thread", __func__);
-}
-
 static void run_test(u32 run)
 {
 	struct kvm_vcpu *vcpu;
 	pthread_attr_t attr;
 	struct kvm_vm *vm;
-	pthread_t threads[VCPU_NUM];
-	pthread_t throw_away;
-	void *b;
+	pthread_t thread;
 	u32 i, j;
 
 	TEST_ASSERT_EQ(pthread_attr_init(&attr), 0);
@@ -102,19 +90,18 @@ static void run_test(u32 run)
 	for (i = 0; i < VCPU_NUM; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
-		check_create_thread(&threads[i], &attr, run_vcpu, vcpu);
+		check_create_thread(&thread, &attr, run_vcpu, vcpu);
 
-		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
-			check_create_thread(&throw_away, &attr, sleeping_thread,
+		for (j = 0; j < SLEEPING_THREAD_NUM; ++j)
+			check_create_thread(&thread, &attr, sleeping_thread,
 					    (void *)NULL);
-		}
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
 	sem_post(sem);
-	for (i = 0; i < VCPU_NUM; ++i)
-		check_join(threads[i], &b);
-	/* Should not be reached */
-	TEST_ASSERT(false, "%s: [%d] child escaped the ninja", __func__, run);
+
+	/* Wait for the parent to SIGKILL this child. */
+	while (1)
+		pause();
 }
 
 void wait_for_child_setup(pid_t pid)
-- 
2.55.0.508.g3f0d502094-goog


