Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040C7C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1JBjopkc75BtNRKBSR+DchDeaVK0MN8H8Q6AmKvrIE=; b=Tt7VHGXGylnSr6WbRmsiZq3P07
	7iqy46lX4JjUqGcBp1MkUql2oJkkDUSr4r/zUcD5RzF3lrTcUQ26DiPEHjr1gn2YMeIefq/vg1+QN
	38iA+NZhu9FOeACzinCeW0GuiwGjQuJmwUjz8cAAb61Wcfq4oJOZ3A4IOq547wc1T3QjFasSbhytP
	uuf4I539pDHIzLdXhGJzH7wB0ZqwmqTur5jjf8vdTiGgmliAmpqk+fQg3wVGmiBfxdFaJB0kSDlII
	D62JPZqI20M09f7+axLC05iCPV2vfOvVLrhl0OkxvLjL8nlK0yW7luqO9C2WqNkwpydzVzIdMLLUF
	+9MQlxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqhA-0000000DDol-3RNe;
	Fri, 31 Jul 2026 17:06:53 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgx-0000000DDed-0AtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:40 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2274462a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517598; x=1786122398; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1JBjopkc75BtNRKBSR+DchDeaVK0MN8H8Q6AmKvrIE=;
        b=aKd/ygPm6m7tjiTsnbsn0s0HK41Zl02PtrSQ3jToCY0AdGykKNKrRUsysftywJpv7U
         peAeV3qjOnOABkYk35A+ZCc/OgqELgkcNUi18KmsuBKsq2NiEElMTmfOQN3EBiDJA7gM
         jL2t8Cq52cGwhldYIyZENKZtnO5tYPqKyDcy7AsK4yKSOUpeaUBpsuF73EUGII9i0Ao+
         IcmmMpbRpyRO1lQthFv+FEW7X6PDXlKeonTiBBZf75kdcWYbazN3c0tkWkB+4Z7yBEuB
         nAym7PDSwkR9KwQXYBGhEnjZUg9CmKzkLKdt6eCwvKzkXlvf76M6FQIZQXTDJJ6gzHQT
         UCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517598; x=1786122398;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1JBjopkc75BtNRKBSR+DchDeaVK0MN8H8Q6AmKvrIE=;
        b=leaBCeyfQjQEfju+aUpGXCwqBMbqiWXCaV3Lb7Tw1lo2VbNCKlIvRqItLn40+SHlPn
         feip2nngdJQD0NF1oFGLc5cReKI9xxvuAp8qucev+Aleqxly5GLfEumKFe0+c/iLPAP9
         wYnSXSPJIt9wB+mhcusNpX/wF13pHy4j62xQPq5z7HvnRw257Vc+0FMPnDw4QMejPEVg
         k/Jlot0Dw/6b88Ayp/QG+NeG8Qwyt+ja3Tv3a2sQotPqmMIBZBFv5tFAAGDSGu19BreP
         J9ePiF0ATaNbxCCYducIGz3eZC6kREB4mQsrqH9TyC1RtltHGabDCdBncIXgULPp+9PM
         uItg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+lWzDp0AA/7hoTEXb2zUycqVquqL8/v+ce5ZNW0rLKfo8eu6INMMbtG7bKZ6aeuX6suwVpw6WXWCHy4iPw0uY@lists.infradead.org
X-Gm-Message-State: AOJu0YzP1HUMxJNKn3cbO9qQp2iQR9InN0umDGoVs/+jI2SVQkoDqdmC
	o75xt8zZlLG8VMO1jdtE5riG9Vo9hKo0qSvNbO+I2m2UyCYcgItoPJRxE3rlDfvKcZvixHLYmcw
	GoR2eag==
X-Received: from pjbii5.prod.google.com ([2002:a17:90b:4885:b0:38d:ed16:8b30])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c3:b0:36a:5d1f:7b6
 with SMTP id 98e67ed59e1d1-38fbc40e148mr607598a91.2.1785517597505; Fri, 31
 Jul 2026 10:06:37 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:19 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-13-seanjc@google.com>
Subject: [PATCH v2 12/12] KVM: selftests: Clean up global constants in
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
X-CRM114-CacheID: sfid-20260731_100639_084360_BF2A89CB 
X-CRM114-Status: GOOD (  12.11  )
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

Rename the global constants in the hardware disable test to better
capture what they control, and open code the literal number of sleeping
tasks and iterations instead of using power-of-2 math to express values
that are 100% arbitrary.

Opportunistically tag the global semaphore with "static".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 694d064e63f1..cf9306bbe970 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -17,13 +17,13 @@
 #include "kvm_util.h"
 #include "ucall_common.h"
 
-#define VCPU_NUM 4
-#define SLEEPING_THREAD_NUM (1 << 4)
-#define FORK_NUM (1ULL << 9)
-#define DELAY_US_MAX 2000
+#define NR_VCPUS		4
+#define NR_SLEEPERS_PER_VCPU	16
+#define NR_ITERATIONS		512
+#define DELAY_US_MAX		2000
 
 static cpu_set_t threads_cpu_set;
-sem_t *sem;
+static sem_t *sem;
 
 static void guest_code(void)
 {
@@ -75,15 +75,15 @@ static void run_test(u32 run)
 	pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), &threads_cpu_set);
 #endif
 
-	vm = vm_create(VCPU_NUM);
+	vm = vm_create(NR_VCPUS);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
-	for (i = 0; i < VCPU_NUM; ++i) {
+	for (i = 0; i < NR_VCPUS; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
 		kvm_pthread_create(&thread, &attr, run_vcpu, vcpu);
 
-		for (j = 0; j < SLEEPING_THREAD_NUM; ++j)
+		for (j = 0; j < NR_SLEEPERS_PER_VCPU; ++j)
 			kvm_pthread_create(&thread, &attr, sleeping_thread, (void *)NULL);
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
@@ -133,13 +133,13 @@ int main(int argc, char **argv)
 
 	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
 
-	for (i = 0; i < VCPU_NUM && CPU_COUNT(&allowed_cpu_set); i++)
+	for (i = 0; i < NR_VCPUS && CPU_COUNT(&allowed_cpu_set); i++)
 		CPU_SET(kvm_pick_random_cpu(&allowed_cpu_set), &threads_cpu_set);
 
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
 
-	for (i = 0; i < FORK_NUM; ++i) {
+	for (i = 0; i < NR_ITERATIONS; ++i) {
 		pid = fork();
 		TEST_ASSERT(pid >= 0, "%s: unable to fork", __func__);
 		if (pid == 0)
-- 
2.55.0.508.g3f0d502094-goog


