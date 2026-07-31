Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F2FC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2wB8IP388Lc2MBAteJRNDo31xEFc0D1s8JJGVqmoX8=; b=HNooo2Cr/zdDYUr9QEXEbI2tzD
	9PXcnyx+c+Wv8JzrLMsTSqCv+EDGZXyGBvzOh4caB5dkJIS2bLCFCA45cSy3dCQFaoDRtYrXZHfel
	Y+pzs6pCbuSJ1CSCw1/V+zs0zcbZYFvc4i7f3iE040MTcZBs3voH75LVDeCYgQcDdZvbl3TJ5VhcW
	J5jz1AcZt4hEDFlqj1mF7R4DBM/vztDKtGaF+vsyeBR3YeQ9KJjnkp3iQDr3les6tbBKUzREZnvCA
	I9829HUN4hiEyl57dsDPFg+sseCLMGRnvN7c93Y105yT5X7n7Lj3DLgAXNo2AhdCkXviqAIDvwVot
	PIOK9uFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqh6-0000000DDjQ-4B4s;
	Fri, 31 Jul 2026 17:06:49 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgq-0000000DDc5-3f0N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:34 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8487eb67173so2401443b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517591; x=1786122391; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F2wB8IP388Lc2MBAteJRNDo31xEFc0D1s8JJGVqmoX8=;
        b=KCVLG/TPHdgVtdQ4VgaMTvDkR5MBQJsuI4/7M+70VzZZxZGLvnYkIJCfKbmjf2LMWX
         qhqN+6uvKVPXzbcejwzBRS1PIGOWMZ1Yc1XWuOqbbx7QupYWse778b34zUUfe8dzIU2N
         PqpZl06s4w0PFLJHrtGGjCCRSRKqC1xeIFH/Xd7GaYzy7ESBc3x/aQVWFsvTFs7oQc2P
         NGYpSR5FM8EJLviYO0YkRyXmVKy9A4q66TMIuKzopywx0ZThD3iEe+LA9OcihcKicIah
         kOIPisMRa1/8xMEW9mCaR1viiXkStjPtI02aZ4dzSBJV9eSv3wGxljgk5v8LJSFbhDF4
         byNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517591; x=1786122391;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2wB8IP388Lc2MBAteJRNDo31xEFc0D1s8JJGVqmoX8=;
        b=EQiQ9fIlOuP3ff1Rk1ba/m98YkylGP7zcMHazRm6FIkc8n6cyxRytEHEsBi9xwV8In
         6SCnOJuDBALfsvj4PLtWNDhNbs5edQM5QbPFN8K0ncHn6N1WVZIGqcmfOdaHY+pPi1ip
         Ka5ID/LJ94H0n4li3LOeL+a1nvMqQCXUzE6fGvxEDongXgfk7cZmShPTseOdiaTSFCyz
         XXBI9OgtIMiG5fEV12YSY2vmiB28C2qCPpOHI3Vyiy32Joe6XufmIxMdfdI382sCkrxB
         /IWn70/RjGhteY3bTWMqtIHJdMbPD0xopFFuB3pEwSTRe12RS5Up/MMJvNMrlFXwElH8
         Cfxw==
X-Forwarded-Encrypted: i=1; AHgh+RrJcHeAm5hHy/gfDo3J0UzpyOzSPx9Z//ejII57xy9OzazK9I7srBktncXbUzkp5Ikoivtfnjs/TwcaQPYAfFF8@lists.infradead.org
X-Gm-Message-State: AOJu0YziGoOl5J/BVjiBwk5Q3s9Y5r32DodjQBJrO4GVk5bGqYRD1Aa9
	Zq+IKW6but11Pd7pQr+ifdPZyRjChmPTISyl+nxGhJZDsWl/zmjerCBDVXYUJo0ENM6Od9VczNB
	q54y2HA==
X-Received: from pfbdc10.prod.google.com ([2002:a05:6a00:35ca:b0:84c:2b7d:213b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:885:b0:847:8c4e:1d5e
 with SMTP id d2e1a72fcca58-84ee48f8431mr387593b3a.56.1785517591199; Fri, 31
 Jul 2026 10:06:31 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:14 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-8-seanjc@google.com>
Subject: [PATCH v2 07/12] KVM: selftests: Drop unreachable, dead code from
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
X-CRM114-CacheID: sfid-20260731_100632_918238_4B851368 
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
index bd23c1300370..b8115b2dcae3 100644
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
 
 	pthread_attr_init(&attr);
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


