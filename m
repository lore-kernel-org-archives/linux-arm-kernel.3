Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F34C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tcAvkg/zKE4Wpx2bpF+dHLf7/L283ci232zJUD1488=; b=BDk9IV1lVxW91C9jVvKrme6s4/
	wLhX3UqywToH9xp2yAlpqsD4bi+G2SvP/xVx1qlHtzKh6gYvnijeVIceZn15BNqFC+fkutAe6+J9G
	zkjEf2l3n+ZAOgn7QunEEJW+RK+Hc9zBr3nEzzNNEuBV2qHLn8QUcJw7SVISljj6rwySD9kAqJk4E
	31ArzNnzUZu3qp1FYgeYsdhZjrcbkkj6et4aRbekLR2Muzx76CZqcQoqY/9QV+1kHndku8zqZL1f6
	UHtySbRpdwUEbT25sf2Uu5X345b5BHYlRkPqIugF+eQ7wuFfaFgxHRyR/rhgZubDy7mj1bNhvp1EI
	hFOszhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLI-0000000DUsw-15J1;
	Fri, 31 Jul 2026 19:56:28 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLA-0000000DUpZ-2RBM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:21 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1134127a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527779; x=1786132579; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6tcAvkg/zKE4Wpx2bpF+dHLf7/L283ci232zJUD1488=;
        b=AGIt6Onq+HGSX2dwIyqSa6YyaPw0bzQNK1BQeCGIkA0AxYZ11jKb9PFtLkoZi6gunk
         vX2tNSmEqCw/BuYqwmHKHp9LvJQFFSXesbb/eAFWVlsHCtJufX9mPrGXQs+s2ZDqDsIm
         UwJWUGS32BYca/IVNB3PQDJ6rm0CmfbsVTOfzCURv0x93uJyGvpQ14cQ2lwNyWZDSB89
         BsUJqRYqsUmZo/3F9NC4hxy0RAj0cMPhWPLJwSCPlDbDkJ1I5DoCTBFxMa/MDUQn557t
         cIbtXuV3EQO3X4Ixb6lJMNsZYU/AVGzx6S4TKCPPN5ypUYRKhvZAn1j/9qLXHWcRVam1
         fkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527779; x=1786132579;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tcAvkg/zKE4Wpx2bpF+dHLf7/L283ci232zJUD1488=;
        b=iJ3/nqRMciB8lj9FV+MgLxpNkpANPc9xLq3HLzBywVI2VkpVw3ge8z4/5N/Wem5UAB
         OTLOtdNzP+029IO1X30QDYW3qEQk/IbXAuivLgjO/O8dYwF1jYGWRo/3UGUmX5ACPrE4
         5ef27vyBwVyr87w7TJzg3f0kgsIryKLh5yEI0OkO1XXz0UX+EsGDIsRVx1P5UB2m9cDW
         GNF1DwtuR652iRCHiZWSgoC+ufRUV/poDd4hfZoiZdOYvZR6wPVjOEFbt0y4d5gB8SBs
         RBg2RkT31E0iIqHkvtrL0MUodvhTCnklEMNLTDDJ8Q3akhNpMAkzVdlU83XmOe/LzuiL
         nUYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rri8x8PxswR1zzMCz5I8vZmdKuViihJdq4RtqvQq8u/PyjuEpu/WyKYY6kxQjCZdLiHLNyK1L9bgUGTG4SnebER@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0gfngg7r9mJc49+PIc9qU5fSpK/s8S1h6aB1ieJDNL1uWE140
	nXK9PBFeaqsM3gm3JkTGpEG49ibqDhb6bLzRhPW+UY/VkR5F2Tl+A9NcUZF+aS1OjfsldBULg9R
	JBr6I2A==
X-Received: from pgj184.prod.google.com ([2002:a63:9c1:0:b0:c99:aff5:7078])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7290:b0:3bf:651d:fee0
 with SMTP id adf61e73a8af0-3c92ae1d81fmr774604637.19.1785527778610; Fri, 31
 Jul 2026 12:56:18 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:02 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-3-seanjc@google.com>
Subject: [PATCH v3 02/12] KVM: selftests: Set threads CPU affinity before
 doing work in hardware disable test
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
X-CRM114-CacheID: sfid-20260731_125620_615975_F2B4094C 
X-CRM114-Status: GOOD (  14.28  )
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

Affine worker threads to their target pCPU set *before* doing any work in
the hardware disable test.  When running a preemptible kernel on a NUMA
system with a large number of CPUs (100+ of CPUs), waiting to set the
affinity of the grandchildren until after the grandchild is fully spun up
results in total test runtimes of over a minute, presumably due to
cross-node NUMA penalties and scheduler lock contention.

E.g. from the perspective of the caller, when waiting to affine the tasks,
pthread_create() takes ~100x longer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/hardware_disable_test.c     | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index 3147f5c97e94..f088b4af3ccc 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -21,6 +21,7 @@
 #define FORK_NUM (1ULL << 9)
 #define DELAY_US_MAX 2000
 
+static cpu_set_t threads_cpu_set;
 sem_t *sem;
 
 static void guest_code(void)
@@ -35,6 +36,8 @@ static void *run_vcpu(void *arg)
 	struct kvm_vcpu *vcpu = arg;
 	struct kvm_run *run = vcpu->run;
 
+	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
+
 	vcpu_run(vcpu);
 
 	TEST_ASSERT(false, "%s: exited with reason %d: %s",
@@ -47,6 +50,8 @@ static void *sleeping_thread(void *arg)
 {
 	int fd;
 
+	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
+
 	while (true) {
 		fd = open("/dev/null", O_RDWR);
 		close(fd);
@@ -64,14 +69,6 @@ static inline void check_create_thread(pthread_t *thread, pthread_attr_t *attr,
 	TEST_ASSERT(r == 0, "%s: failed to create thread", __func__);
 }
 
-static inline void check_set_affinity(pthread_t thread, cpu_set_t *cpu_set)
-{
-	int r;
-
-	r = pthread_setaffinity_np(thread, sizeof(cpu_set_t), cpu_set);
-	TEST_ASSERT(r == 0, "%s: failed set affinity", __func__);
-}
-
 static inline void check_join(pthread_t thread, void **retval)
 {
 	int r;
@@ -84,16 +81,11 @@ static void run_test(u32 run)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
-	cpu_set_t cpu_set;
 	pthread_t threads[VCPU_NUM];
 	pthread_t throw_away;
 	void *b;
 	u32 i, j;
 
-	CPU_ZERO(&cpu_set);
-	for (i = 0; i < VCPU_NUM; i++)
-		CPU_SET(i, &cpu_set);
-
 	vm = vm_create(VCPU_NUM);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
@@ -101,12 +93,10 @@ static void run_test(u32 run)
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
 		check_create_thread(&threads[i], NULL, run_vcpu, vcpu);
-		check_set_affinity(threads[i], &cpu_set);
 
 		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
 			check_create_thread(&throw_away, NULL, sleeping_thread,
 					    (void *)NULL);
-			check_set_affinity(throw_away, &cpu_set);
 		}
 	}
 	pr_debug("%s: [%d] all threads launched\n", __func__, run);
@@ -153,6 +143,9 @@ int main(int argc, char **argv)
 	int s, r;
 	pid_t pid;
 
+	for (i = 0; i < VCPU_NUM; i++)
+		CPU_SET(i, &threads_cpu_set);
+
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
 
-- 
2.55.0.508.g3f0d502094-goog


