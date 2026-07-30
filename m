Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1006C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=; b=soVpHw45Z9LVjjnPBfVDK4qF0q
	oHVxUgwp4wR4JaDW5Xs4VDJfvKJh7vIbSuY5FCMnH28PfSFg/EE6WDONRX7uFg7P+OlxqGwJ9Cap7
	Th3SwAbhfuoEZ3xHaDYSIIPUUBIPXOFPNiANGtyZ4+3V4fLUREW2ehD60+uQp0ujQrYlru/QI6i+d
	/r8l3vbF7xBVJJxIryBuuVU2v+/oMcLTWVnjLTYzBOxBSgMvB7JOhrbkhOIV/clgbiqsJneocwCGn
	RsqICUY5kv3Iv/d7ThOKbK24CzRVEuwzhJsxg1u8sBYBc9eVFy1KyxnZBcy3mDF1X1QWK2PH2CBAe
	139hW3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHy-0000000BDkD-1Fr1;
	Thu, 30 Jul 2026 19:19:30 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHj-0000000BDcK-0af9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:16 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2cfa55c9430so1189295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439153; x=1786043953; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=;
        b=C+L7uKrBnUuvPal8CSh4tap06TQvN2agsNqPrD824ycB84wg2wUlXPrEWG4FA0WqP5
         R5gKSyyHFN9NQfoi65kNTVANn8nDYd65b8Dg34TekdetTvgblhobkr+SREWIzPwbyN7q
         DqtFsHcsACCwCggn2LYo7u+t1XfJJMskfN9pefAcS08GRQTvj3W8KETpvjhxhXBnBvVG
         WCBGsNcksdMVnE49AIlur0B7xJmMYG7vhxlMDHzTMkGCrJtm4ygnaTccpMAaW7S393SO
         L9Q08U5+gDejJUJIei8v/WyzpruO9DRJEeBw11JCSTkSgNIIw6OaReyVSvXZyW44pukA
         AHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439153; x=1786043953;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs3K8CpV0aK6wpGyTBasGbTbkVQEzOsTzupfjJkDnT8=;
        b=fx9AuNvpNr7UxFiBD2K9KySpbHTMJSSKTLyVGQvl7wuWL6XnyMr0hijd4sFFQ3aB7z
         fXO7V4384iWYHFNb3ihHm6ullRLf5uqpDSxFOiUn50UlCEjLClAsMD5sRvrd1JKbuNTJ
         H+xbnna7084gez3kkFGVRpjsS3o0rZGToUWYwALk7G7DG+8n6mR0Mq4xT7nQABeq333q
         g20F4/qUqsDiR8iFe6lDv9E3Mqv1zZbU0wI06kECTxGNQkZULY+aTFEwmUjf1NLMYS3W
         BrqTeij3bTySGfuQOBBjugQqO79SOkchxwP5vZ+pW+/Jywt4jUIS5T4x5yVMlpNDp503
         LH5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkCkAnWzh6xwR4QVICYvYxXWfGhK7zFX+OVwcFuZIp2yETlhlE6x5S5Ukn9ilZME6wktuYItfLzHSCp3sqi5Wq@lists.infradead.org
X-Gm-Message-State: AOJu0YwX5Xr3ds5TIQUGcb0XQfUUmcIWlv9b1G0ceHQkionWEF5VmJMd
	y5dyEGWo/ZnO5j/Hfp9byrU6Yg/MUmVcjWTdlV2UIvYt/5cCSDlq9G87bQ8XoJaAmFKckFq8/Mp
	fGpOWxg==
X-Received: from pgbq26.prod.google.com ([2002:a63:5c1a:0:b0:c9a:8872:2a15])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a09:b0:3c3:6cfb:4ed7
 with SMTP id adf61e73a8af0-3c90072ec64mr3396981637.30.1785439152961; Thu, 30
 Jul 2026 12:19:12 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:01 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-3-seanjc@google.com>
Subject: [PATCH 2/9] KVM: selftests: Extract picking of random CPU from
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
X-CRM114-CacheID: sfid-20260730_121915_192244_DCF9BABE 
X-CRM114-Status: GOOD (  11.81  )
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


