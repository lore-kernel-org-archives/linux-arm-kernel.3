Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEB2C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej1XcnuLH5yYzQBAwBT+NjRAfZ8wjNCP8hhOnMl6lPQ=; b=rKrifFE/R5H6lP2nyhXo+JPCFJ
	qOrFCpivqYacGAXh5lSWS/CURAJRNGclzXmtytfg4D7wETRwyA3AeRE5EWkAPpieG6FC27XovS5N/
	wCXtdE+HAZfj3u/57yx2bYk8pT3NBl57zoHkt3lobVGsGEltBTNzBobKo8PQvumfvDaKGbBM4cpg3
	Zwa0JpPp0CKxi7VW0T21wxVMZAs8WOJrfdcZ+ruNnr+WD6wXneV/cvXEVo2Ee+K39lJtZ8j1chJ+/
	dZ3GrgmX2MW4pCbGlSXSBcW9hpjkdqHiYKohfSmzVVY0Z0tF50LMA05SHtIdBGkL5SljzCREpNM4S
	qiyVHVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWI1-0000000BDoJ-2G2o;
	Thu, 30 Jul 2026 19:19:33 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHr-0000000BDhL-1MLV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:24 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so261254a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439162; x=1786043962; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ej1XcnuLH5yYzQBAwBT+NjRAfZ8wjNCP8hhOnMl6lPQ=;
        b=Oq2rtXHXJ6mypwbPoKzEfrAdKDaSHBVSsFzpg36E10qeA65FZzFxTHEHsiVbXSUd1K
         szXGBD3zT9tzRPPxPJDR27myJKTgs5zgmJlrKzvQOsGXV6fbn6mWjXqOgYnJIJQw9dxW
         mZUJbjANyXPVn6JHSRuzoSjPHioQ3K7KM2qYteSc8OevwvhZFzxVgVOilNiNNStsE+ds
         rvA4/r+uzdLYiGbP8bupYZYg+gppZPWt2toVk1zbXTwoJcHY5sKLdwThvlImTvqOjYfZ
         9M8QAOdtCpO5tUrgC0Nwxdq+SZeOjNi5IIdOuowaGvTOi9I8aNBxfZeGJ8FZHwTgbjgH
         7F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439162; x=1786043962;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ej1XcnuLH5yYzQBAwBT+NjRAfZ8wjNCP8hhOnMl6lPQ=;
        b=ZhFTNM69YDbdnZmo3XT3V9KKg/hm7HL328jl3NNNM4jrTsszFCW/7p+Li19/1BvDkK
         +1+d9rCIYWf0OsYhl9T+kEuaTMLCFsnUIh9jr8V+WMW06+NwmwR9cWCxDkcblgPGMZY/
         nIKHiuUSyE5K1iz4aph33P5YZD7OhJbeVyQFrBfAAk8KIrQ841rVbeAF40B3lEkvCO61
         Kl3IYyi/kNuRXw77vfUot7dYPMb31/5QyxgjL161YA5JKoW0AyOJA2hD7telLAGHlDYo
         1jIDRba0gnlI4trfgOKj2XBMHznDFWa3wg9l524eHzuc6WpllfLTrrwy02eT55cSQNEn
         x7dg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5H/e6+mAGet/YoAdmyIT5Bv7vpfGEtQ7CPu9pKd+mxotfut6/xRs1ZvaMrbeYC9HV6uSYgJigSV7ZvVGMaSUy@lists.infradead.org
X-Gm-Message-State: AOJu0YxDbdR8cByPnINYDgewANWyuYG709rU0MTofV70Z1vNrOMPg2Re
	7zCyo2hdD++s+eCU1lJccuG93U7D2yQIf8fDZSDUWYaN/L8b8iU9zsT/bgVRsgYE7r8gNBqWiup
	P5ZYS3w==
X-Received: from pjpo7.prod.google.com ([2002:a17:90a:9f87:b0:38e:c35c:d872])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b82:b0:38e:2a4:cffc
 with SMTP id 98e67ed59e1d1-38f9c020226mr3137625a91.25.1785439161887; Thu, 30
 Jul 2026 12:19:21 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:08 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-10-seanjc@google.com>
Subject: [PATCH 9/9] KVM: selftests: Clean up global constants in hardware
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
X-CRM114-CacheID: sfid-20260730_121923_373555_4A2F80D7 
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

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c      | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index bcca42182656..4abad7158989 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -17,10 +17,10 @@
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
 
 sem_t *sem;
 static cpu_set_t child_cpu_set;
@@ -61,16 +61,16 @@ static void run_test(u32 run)
 	pthread_t thread;
 	u32 i, j;
 
-	vm = vm_create(VCPU_NUM);
+	vm = vm_create(NR_VCPUS);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
-	for (i = 0; i < VCPU_NUM; ++i) {
+	for (i = 0; i < NR_VCPUS; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
 		kvm_pthread_create(&thread, NULL, run_vcpu, vcpu);
 		kvm_pthread_setaffinity(thread, &child_cpu_set);
 
-		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
+		for (j = 0; j < NR_SLEEPERS_PER_VCPU; ++j) {
 			kvm_pthread_create(&thread, NULL, sleeping_thread, (void *)NULL);
 			kvm_pthread_setaffinity(thread, &child_cpu_set);
 		}
@@ -124,7 +124,7 @@ static void setup_child_cpu_set(void)
 	cpu = pin_task_to_random_cpu(pthread_self(), &child_cpu_set);
 	CPU_CLR(cpu, &child_cpu_set);
 
-	while (CPU_COUNT(&child_cpu_set) > VCPU_NUM)
+	while (CPU_COUNT(&child_cpu_set) > NR_VCPUS)
 		CPU_CLR(kvm_pick_random_cpu(&child_cpu_set), &child_cpu_set);
 }
 
@@ -139,7 +139,7 @@ int main(int argc, char **argv)
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
 
-	for (i = 0; i < FORK_NUM; ++i) {
+	for (i = 0; i < NR_ITERATIONS; ++i) {
 		pid = fork();
 		TEST_ASSERT(pid >= 0, "%s: unable to fork", __func__);
 		if (pid == 0)
-- 
2.55.0.508.g3f0d502094-goog


