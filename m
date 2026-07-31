Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B155C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=; b=ixVWad7tOQdM+Q/K1OszXKkjG9
	i9qfVe6MbYWOM5SLlsIplbCuObHG1ktsOp9xhUaBO6rVzkkI05XC84r4BjMkZN9KD5sJx8lSvRT2Y
	Be7SL8wxnQQQjrpad38mkGjaWgnkNG0qXmpBNoq+aj+tjmCur+JWk6I1ZNBkTXqdgnZtD7n1T/Xk2
	sqkjGrurrBJM1KjRoR/Q4/epFRbyTLevFJrY9WJMqrQxh6X2T+P5486DNWOhvJ2fU0foALi0DPg3L
	kAqoOsyksSKNV1wBl+Lo9m8K3eEf16zbut5ph9VpgPjxLQpEKzmv54/dzbGNqpTLf+yUKNn8dQN8h
	MjqvuCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqh6-0000000DDid-18Kf;
	Fri, 31 Jul 2026 17:06:48 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgo-0000000DDZu-0Zxq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:31 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2ce8a76df2dso18976895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517589; x=1786122389; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=;
        b=MJwIqbd+K1dfOdB3O70yfOfd85zBZsO73QkP498gD8K79XXczShd8dGqSTCyubYtNY
         YBXpKtaK0wLTY13ibOQ8kJqAA8GcMOq1rEjfQdU9hAvL7FwN1wdv51MjqT04iixkmYp3
         /LN9evDXqx0delSKuEPP2Y9/Z5frBB89d1FIkU9+EbJxvwzA+ZYzzdSFjxoxZygmJCbT
         0FkD5KGEL3FulwgoN6T13HQFfKNa/3zvdX0LWlN9iKkPSa3brTlEWSswVEm46oOqLei1
         T6OeGPHkxMoz9FvpjZhc+ZfNqsAKlPgcH5q4j3ye/gkd/SXwzXuea3Bd3+bAejiCquOr
         /bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517589; x=1786122389;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=;
        b=Pkb06Oz8DGuANNKwVsKpqtwqe+NR1Dc7cIzrHv+9ahp/QnxbaiH/s5YbwVKE9qXxfQ
         lMn3HVJW1ReuwiXkxuow8E2nowglM9BxO89KC7wkTfczFygTxRJoWGh9ckc5839/D6PZ
         CnJLmnQk341mcp8eIfbZOA7GgBnEr/LbrvecD1m07WKUHqeSGN7uuKsV5WObFwi78x/U
         BMUPQjWPvYJw498o73kKA4T8112l5i/qDL9DZFdkdzPpFDnkjxOQWJPHgveReGcRnJyJ
         nGkQ/C2ThhgkfpZJZGVWTCE3Ft1Kn2YXY0ZwnCTe20KoPazBEdxW3tsa9BJNBpp46iQY
         GVnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPDfg2ekaMHvpHjDT69T/ZiPXlvCZrH/FlFQvSekmflU9OucRjeQE34povo3S4p7cCzPvkiqJq7rJIBGkL/KlI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+s1naMr4H8ijE8qvPPxpZksfrP6kEA3EbchjLrN3jCJO8HGJ+
	YhpmcwDnTwhlPeZDOs9qTXa36PVLsIPQvAXPavFRBTwZ2XGUWE2r8WczdYuzY1GA6JASJe7DWQQ
	GB5fBow==
X-Received: from pjbee14.prod.google.com ([2002:a17:90a:fc4e:b0:384:7daf:f48a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5605:b0:37f:9ce3:ca95
 with SMTP id 98e67ed59e1d1-38fbc560e9amr564372a91.30.1785517588641; Fri, 31
 Jul 2026 10:06:28 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:12 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-6-seanjc@google.com>
Subject: [PATCH v2 05/12] KVM: selftests: Extract picking of random CPU from
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
X-CRM114-CacheID: sfid-20260731_100630_177638_BE810F47 
X-CRM114-Status: GOOD (  11.98  )
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


