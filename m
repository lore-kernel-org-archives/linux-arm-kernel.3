Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F78C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2DcwzlrubCNuT24RD/nTN5cT+um7dgpX6VefWZNk0A=; b=1NJCVj/ETWwiv0jr0vm1mmwywK
	2328O8LrgJWApVbG2oigwlDPWQwkptCKxT32c1/7lkZk1pSAo283IuLWZ1mCFjyuAn6EZ20IavoXc
	hb4ppI5yadzamSq2UTGa/cVnq6l8AqgGQfi+GKeR++w9p7YqEvaxXfmhRHKjivutpWkUpzEU4GsmL
	FiYxdiOxjsiwPY0Ma/+tI4Y/+LlMrDNK2tKOijdHBfRXYwBh0XFyGvB70xPfe3dvcHIPqbVBidjzC
	2nE+yroO402sxCc9PyYyrHwPa6amG9ZzgsAvdqCQMNNeWIKuqSPuzhwThAvzIviZxjZZ8J/U/cdDV
	a2ocURLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHy-0000000BDkv-2KOB;
	Thu, 30 Jul 2026 19:19:30 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHl-0000000BDdO-0j2d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:18 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1538907b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439155; x=1786043955; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o2DcwzlrubCNuT24RD/nTN5cT+um7dgpX6VefWZNk0A=;
        b=TaE3MTng54lVGpaDsZdePVuxMdl724ShL3Hy6wcgLRyJ8b5XwU+spjccjT+CDWgx67
         /NeFQHGvokp/ADMXr+kHyF38DRaVmVBY0BkGqCkfvjY4Fekr9157/7jOfuhn6frm6a3I
         w6S3oJYe+aUvoCVJONodUF6HWN0Dj0JWOpXTlfH+HOMJHIDAuiSX+nbqYz/HT6W2UaQx
         295ifFPaNqPncQTYCmYMvLuPC5LuB1GCcpIOm7GB/2vk5QSsxPuzySNhc6oucWxH8msq
         ZZ0+PQ9CvNUJnWy2ZzJucnxCClcswvsLbqU0zOsYKTDlMajv+BAnk9S56BSw1ADISeCW
         KuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439155; x=1786043955;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2DcwzlrubCNuT24RD/nTN5cT+um7dgpX6VefWZNk0A=;
        b=VfbqXnpYS6Dlzrl5pLI50M7wu9gLbxf/yUruACHH8nD+e0CaX+pRxGERS4jKtbd4C4
         Fz7vLxNGRmYzv0dIy6A6VQDxbx+VhX/pWBEYE3xYTX+DssIRB3CfAfx9rvN+Qx1j/psn
         s3QK2mqV+jMfNkvTEndKlDY3tP/viuqdMktrFzj9TOvAe+ZML3uuerjjhBQ5jGQcbbts
         s2LGDaFEX8vskQKku9udQRbAxKS3kYIK1047HnXAlVMsIsONXnZWgBa0qP4b986CikSr
         J74NIeDCiZC7rn/GNmazRziFhWaLiwf8x5eenc73pSXqoXOXPE9tQoXEPQ6mng9m4J16
         aqNA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0KGs1fpiZ4RMIID+w8ywPfHaIgSpVhy/bIANArqkFS9sMSLkHd9teQz6th8c/1QlWeCUWOsP62H9rvumIaH7/@lists.infradead.org
X-Gm-Message-State: AOJu0YwdcoMaYOVNHSmJr/yeT3MqT5yNS8VEj2DskWZziq5Rt/9+Gb5Q
	tugL/jygqFc4IdQCtydpWvfa2X8IsejvKA44eqFFZgVZvL9j+hU89TSaNQBMmOIzrYA1UeLsx+N
	Qxi5/0A==
X-Received: from pfx52.prod.google.com ([2002:a05:6a00:a474:b0:84a:6b32:7768])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3c8b:b0:848:3576:3204
 with SMTP id d2e1a72fcca58-84eca87f787mr1125578b3a.34.1785439155333; Thu, 30
 Jul 2026 12:19:15 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:03 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-5-seanjc@google.com>
Subject: [PATCH 4/9] KVM: selftests: Drop unreachable, dead code from hardware
 disable test
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
X-CRM114-CacheID: sfid-20260730_121917_226827_F76FD638 
X-CRM114-Status: GOOD (  14.40  )
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
 .../selftests/kvm/hardware_disable_test.c     | 42 +++++++------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 1bcbd13e9994..e08aef94382f 100644
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
@@ -38,22 +39,19 @@ static void *run_vcpu(void *arg)
 
 	vcpu_run(vcpu);
 
-	TEST_ASSERT(false, "%s: exited with reason %d: %s",
-		    __func__, run->exit_reason,
-		    exit_reason_str(run->exit_reason));
-	pthread_exit(NULL);
+	TEST_FAIL("vCPU%d exited with reason %d: %s",
+		  vcpu->id, run->exit_reason, exit_reason_str(run->exit_reason));
 }
 
 static void *sleeping_thread(void *arg)
 {
 	int fd;
 
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
@@ -73,21 +71,11 @@ static inline void check_set_affinity(pthread_t thread, cpu_set_t *cpu_set)
 	TEST_ASSERT(r == 0, "%s: failed set affinity", __func__);
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
 	struct kvm_vm *vm;
-	pthread_t threads[VCPU_NUM];
-	pthread_t throw_away;
-	void *b;
+	pthread_t thread;
 	u32 i, j;
 
 	vm = vm_create(VCPU_NUM);
@@ -96,21 +84,19 @@ static void run_test(u32 run)
 	for (i = 0; i < VCPU_NUM; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
-		check_create_thread(&threads[i], NULL, run_vcpu, vcpu);
-		check_set_affinity(threads[i], &child_cpu_set);
+		check_create_thread(&thread, NULL, run_vcpu, vcpu);
+		check_set_affinity(thread, &child_cpu_set);
 
 		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
-			check_create_thread(&throw_away, NULL, sleeping_thread,
-					    (void *)NULL);
-			check_set_affinity(throw_away, &child_cpu_set);
+			check_create_thread(&thread, NULL, sleeping_thread, (void *)NULL);
+			check_set_affinity(thread, &child_cpu_set);
 		}
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
 	sem_post(sem);
-	for (i = 0; i < VCPU_NUM; ++i)
-		check_join(threads[i], &b);
-	/* Should not be reached */
-	TEST_ASSERT(false, "%s: [%d] child escaped the ninja", __func__, run);
+
+	/* Wait for the parent to SIGKILL this child. */
+	while (1);
 }
 
 void wait_for_child_setup(pid_t pid)
-- 
2.55.0.508.g3f0d502094-goog


