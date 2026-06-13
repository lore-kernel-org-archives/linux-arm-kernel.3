Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F3CD98DF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INXzSK5pqsexbm4tR/dA1tSz1dz6sV9VupQoZ4YYg/M=; b=XAB1eanQYecudr4QLBwgL2QSkQ
	3FQf34XCptgvGDx3oEK/rQ/eOIQDyCjiLkPrpRpQXrip3KtMmdmNIZitArdXr15eopJnTv3MDv1UM
	YuVfPGz5hYFPTeVV1HrrzoTmxGum/7SHrJeNGGYTpz/tmtf0yXzjaWQj0N2dR3sar6CuPFhXj6trM
	98UbWovzqfuYNTHl9qGgNDYqXNfVOXHq0NBK1y8gD1yqzRuw/xblXsSF8wPWB9xe8ckT3QFRDr3NK
	88B149lkYh1ucTRIjDhlupcSXqrHAcyz8wBjksTrnzU5n9vOJ+w0LY+4rMDBJ7HKDpvtkuaOQ+AIn
	e69M1YSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7W-0000000Bo3a-26tz;
	Sat, 13 Jun 2026 00:21:06 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7O-0000000Bnqc-2JIr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:59 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so843303a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310057; x=1781914857; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=INXzSK5pqsexbm4tR/dA1tSz1dz6sV9VupQoZ4YYg/M=;
        b=bjttU0Re8kPTvGtxuGLQmAYbmxfvzptnXs1aXHoClnBuzkk7uSNrwXnYrj348rTXqm
         35C6+NFseHVAcR1OBL3rXnx9lu3uVSffBEY74JRBJkx9XOOa21iplz1SPc3+y/SsGif8
         Bkwi85EN68CuvG2M4SnMALTh8gJ2BebTOeIqzoeeKRQS4xBkkJlbfgiOj7i8t0SPFENT
         Qpyi3OykW6N9yWoKDuBsa8PiX2QUL6I4rbzwBRDIQJYp2mu24Q3g1heGI55vZAB7pbnl
         HrCv9RrjJV5rm8LJ4WqycbBJr48ZDubM1rzoZW+v/SvBjhUV+EMTq3LYRSLHXFbuITC2
         cn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310057; x=1781914857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INXzSK5pqsexbm4tR/dA1tSz1dz6sV9VupQoZ4YYg/M=;
        b=nvHSVqYQY+3+2/PTi745mlqdZUAzbpjIb/zjOrldgL8kVBXe3O39045Tn5ksuYbxnv
         kkr9pp4PaqD14rJL2h56oo9Gi1HeOk7JjryC/oomG1cimp5ne32Ig0qZgMxI5cZzxUKr
         8QRvwwdvVHPUSG042O8VYeJA5YPHsqB0Jo9Jj44Ak++He5/9yIQbv2KyPHBVVUWOMto3
         PWoubVLW6YaI4SrVvty7/SVNWF3eHJf8baGVk47Mr7yTcdglZhmyRUU0HBjngA1czZ9U
         OYBHyuuVdqfvl5MspbxS6jVjtjHfcEmJnI1MH1x22FsSkSK3nUCZbdkhybGpsd/LlSS8
         u6TA==
X-Forwarded-Encrypted: i=1; AFNElJ80u1ZGjNqGcDfyMeteCGc8PKHL9edRKTmtx2Z5Re8f8J7P5cTLPO/6bJGHGy4qavARkGjmdhOTR1gCcDUStbzR@lists.infradead.org
X-Gm-Message-State: AOJu0YxVRRAIQ/kD1kKMZqnkSrbwkjnrb0nkIW1+1DpiIJq3oBiCpTeN
	FrIiyN/iNEqMlzTdinqZQhZ3MizF1P37j4GN2/s0foD2DDCq1u839HWQdUn/1JNvW7Grw7z3IXH
	Jied33A==
X-Received: from pgbcr12.prod.google.com ([2002:a05:6a02:410c:b0:c79:3224:837d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6da4:b0:3b1:80c7:5f8c
 with SMTP id adf61e73a8af0-3b783f3c781mr6308620637.28.1781310056984; Fri, 12
 Jun 2026 17:20:56 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:28 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-18-seanjc@google.com>
Subject: [PATCH v7 17/20] KVM: selftests: Add a utility to pin a task to a
 random CPU, given a CPU set
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
X-CRM114-CacheID: sfid-20260612_172058_595398_3363B11C 
X-CRM114-Status: GOOD (  11.68  )
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

Add a helper function, pin_task_to_random_cpu(), to pin a task to a random
CPU from a given cpu_set_t.

This helper will be used eventfd IRQ test to migrate vCPUs to random pCPUs,
to stress host-side interrupt routing and delivery.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c1f588154398..b39e713c30a4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1094,6 +1094,8 @@ static inline void pin_task_to_cpu(pthread_t task, int cpu)
 	TEST_ASSERT(!r, "Failed to set thread affinity to pCPU '%u'", cpu);
 }
 
+void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus);
+
 static inline int pin_task_to_any_cpu(pthread_t task)
 {
 	int cpu = sched_getcpu();
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9bf28b7d9d7a..2eee1e46f9e9 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -667,6 +667,27 @@ void kvm_print_vcpu_pinning_help(void)
 	       "     (default: no pinning)\n", name, name);
 }
 
+void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
+{
+	int target_idx;
+	int nr_cpus;
+	int cpu;
+
+	nr_cpus = CPU_COUNT(possible_cpus);
+	TEST_ASSERT(nr_cpus > 0, "No CPUs available in possible_cpus");
+
+	target_idx = kvm_random_u64(&kvm_rng) % nr_cpus;
+
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
+		if (CPU_ISSET(cpu, possible_cpus) && target_idx-- == 0) {
+			pin_task_to_cpu(task, cpu);
+			return;
+		}
+	}
+
+	TEST_FAIL("Failed to find random CPU in possible_cpus");
+}
+
 void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
 			    int nr_vcpus)
 {
-- 
2.54.0.1136.gdb2ca164c4-goog


