Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2F4C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=; b=4BHKgnG09tB+Lfsq6y+lVA0CNU
	ypLBx/hN6tDPtzQJrtDdUoJGvRUepbZ48dsRsiYKU0/VbK9RaW2pQ+RcFXHhzxxjaLlNx7KKkxfIB
	YW8MO9DOWPxmz1IcCt37ffmtmOXyNASYXfBkJKz1twLk++LiDiQD4qhyHnIn29cr0XQRBoZdYcCp+
	JxUWXpmFT7dQ4gjGtOpfGX7E4x/dGM+fTAycAz6QzV0tQAbcy163NkMWKt/cj3LoFX9hGZ4wovBVl
	n+DdjwVnnNj0wTEsdyCRIYz/HOJmYZRN6Klpog8tRLQEIaErDQEkR3OMdOSGFwrjh+EsuCA25Gr+c
	aC5BEgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLI-0000000DUu0-2lgA;
	Fri, 31 Jul 2026 19:56:28 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLD-0000000DUqw-3p52
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:25 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso1568608b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527782; x=1786132582; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=;
        b=grv73oBlukZxwSLmE+gwPRetZIBCYTcCfGNmUasP6Ke//Ibcm252Pq+uCVMfC+7nS6
         C0YX4gtVQAP3v6HvBM38FZcOyO86bgyp5S0rzRznE2ktIz82psD9OCXm0bCIVuri3EQL
         e5Xy8oO5FIRwGy74XzF9FVmr+IBP9+WXlQVMYCK9piS3xlw9ne068bkefyzohm6W6tCl
         0h2OQR77Fd8bH3nzycvndZwKxItOJMW5FPVrj/amrqymoXnnR3XAcN+Erp3Qm+UJII6b
         P+2cPQKYF59G/JZ5Exa4Zp8tLTWkaJmaIj7jUdsp9RVwfOf3c3U+ir2wvOZDz6aHLOIU
         9LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527782; x=1786132582;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=;
        b=jrqRBcr8JjtNJD1/p4Mb37ztGXLWba/hSa/ng4iP96cet+LcmEAa/N91eGGrWG1g2r
         QjoOV41wmEocP8kbGaIG5eKchPCwRyK6TnXXv/mMexjV1/B1Tm0p2I64719PnBtLxxwM
         L7lK4AIaIMvLZX+wtrWTE6LU65AKXJLfcwhFWmqVD+7wXD6ohCDPay7MoPlzUF6eqSRk
         HVVUkZIfauU5AJHWzG4DdKAXHdYtHxOPztA3RlN7Eemb69ugOy9pAOnQuCnmn8a2LNAY
         pVuE5J+xsA375PIEmwHZ+OjO1f2PbbIMuZe2m51f+bLJiAVEI1OKlXR6CIqt0oXI4vDa
         i5Bw==
X-Forwarded-Encrypted: i=1; AHgh+RqI/OSp5YK/YeE8LDzmqtCq3yvqXboDgpDu0U06UXB7SGC9LlxQ9kFmRJMubD6Hkk190JmktroRf4ZYazmbADBf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx511IRdG9HEmNQsCJrtfxUSm/MdUNaGsoD1g8thNMMr+EBxTQ6
	MdnleQ7u9M1qbf6j+rytJQ+71KDSjeLqJDPlYHXwc6mMUXAR6ZNhneEWoUE9Sst8w/DtfMLhLyC
	d81cC0g==
X-Received: from pfh33.prod.google.com ([2002:a05:6a00:12e1:b0:848:46c7:cfe2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:f04:b0:84e:d46f:4921
 with SMTP id d2e1a72fcca58-84ee4915b80mr752468b3a.66.1785527782134; Fri, 31
 Jul 2026 12:56:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:05 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-6-seanjc@google.com>
Subject: [PATCH v3 05/12] KVM: selftests: Extract picking of random CPU from
 cpu_set_t to separate API
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
X-CRM114-CacheID: sfid-20260731_125623_949229_8601658A 
X-CRM114-Status: GOOD (  11.87  )
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

Extract kvm_pick_random_cpu() out of pin_task_to_random_cpu() so that tests
can choose a random CPU without having to immediately pin a task to that
CPU.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 11 ++++++++++-
 tools/testing/selftests/kvm/lib/kvm_util.c     |  7 ++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 61d72e1e7601..5a7a455b5387 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1084,6 +1084,8 @@ struct kvm_vcpu *vm_recreate_with_one_vcpu(struct kvm_vm *vm);
 
 void kvm_set_files_rlimit(u32 nr_vcpus);
 
+int kvm_pick_random_cpu(cpu_set_t *possible_cpus);
+
 int __pin_task_to_cpu(pthread_t task, int cpu);
 
 static inline void pin_task_to_cpu(pthread_t task, int cpu)
@@ -1094,7 +1096,14 @@ static inline void pin_task_to_cpu(pthread_t task, int cpu)
 	TEST_ASSERT(!r, "Failed to set thread affinity to pCPU '%u'", cpu);
 }
 
-int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus);
+static inline int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
+{
+	int cpu;
+
+	cpu = kvm_pick_random_cpu(possible_cpus);
+	pin_task_to_cpu(task, cpu);
+	return cpu;
+}
 
 static inline int pin_task_to_any_cpu(pthread_t task)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index af2bad0553f9..9ddc047d5c27 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -668,7 +668,7 @@ void kvm_print_vcpu_pinning_help(void)
 	       "     (default: no pinning)\n", name, name);
 }
 
-int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
+int kvm_pick_random_cpu(cpu_set_t *possible_cpus)
 {
 	int target_idx;
 	int nr_cpus;
@@ -680,12 +680,9 @@ int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
 	target_idx = kvm_random_u64(&kvm_rng) % nr_cpus;
 
 	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
-		if (CPU_ISSET(cpu, possible_cpus) && target_idx-- == 0) {
-			pin_task_to_cpu(task, cpu);
+		if (CPU_ISSET(cpu, possible_cpus) && target_idx-- == 0)
 			return cpu;
-		}
 	}
-
 	TEST_FAIL("Failed to find random CPU in possible_cpus");
 	return -1;
 }
-- 
2.55.0.508.g3f0d502094-goog


