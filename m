Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12D1CD98C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+ncGA6Fvns8f5sP+kNiRwZfNV+IfAKagrqzhgLKDtg=; b=iwdmqKQJuFjsZfuCjwGLIEg8mH
	IV447ktQtNUlcVDwGbdTPgQGRypqSlelZSMgECfY0lJUrKIhkbBYrzF6k26Qj2eHFybhY4Lkxkpue
	jx/0NLiHaXhs2a+CaKqHceDOMrUiKjkk3pT7D4o8B1gJ9CPd7zgSHsmIv6MBvqMNju54fPPsWjzGT
	QBmyGbNjVirAwQ5Wudh8A093gGeOOCO7sEPt2jkQd27Da467MR1OaCZyAyTd4C0RwOt+gL0DATgtU
	MuNais8+KOgsPYVYGc7G1GG+COoPegsLeRv9nJZ6HH1Yg+PrIZd450krJgZSxQRNRJvCkyNoET4dl
	EBicAfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cq-00000006ZjX-0Juy;
	Wed, 10 Jun 2026 00:54:08 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cl-00000006ZdL-2sWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:54:04 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso6740648b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052842; x=1781657642; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=i+ncGA6Fvns8f5sP+kNiRwZfNV+IfAKagrqzhgLKDtg=;
        b=Fo3dS4e4X0WU3Ue6tNZXCuHdbmnqs1boRVvjVDJCwvacwV+Xrv4dkdgeNA/JXUCZx9
         ezAUyFR519bgf5JDN7qq1MbmH8jKl1v3GnmMxZfO+BCXvWQAudJNjto3MyUb4jB8GOnj
         8LD+HBvPl+ji+gtMIjmv/p7gZnvzONnjZfJazLEFeMpqb1PJoQf0aL3CbYRhh5MdSzDf
         SpjDtfCKfmGWFjj8uKbM+mMsRgGfzq05S9OfB4b8L79X7+QBD5kmWtt6wDNfiytHiVT2
         zJmf0JP3w5OeC7Ltv8rFZRZWXwOrDzJG+GQFmflkexa7MkJR5LOpZbOHCy5bu3vum6Ch
         VJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052842; x=1781657642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+ncGA6Fvns8f5sP+kNiRwZfNV+IfAKagrqzhgLKDtg=;
        b=MKfi5EvECNBgykzflIwmjPmgxx0EJZ7tfaZxhTFi5YOSaCPqabw+h/tEZjA8aKZsBF
         uj365AMRpoo8KGfAG/lMtxlqQS7u86vjagPtqHFDLfmjp5hJOd1nvViAklXdoVpjiGMw
         oezqWFx6OPOhRI6sqLwt8mfjqu6C0u2uMW6zMwk5/6kmb64OBc5ZyiMQAvJ7MWGjX6uE
         jPCZf6vKr6aML0+C2RoiEAKRrc2weFKeQHNYKYK4TOcdB8J2UaRYwWKcH7/742R8emTP
         TSvJZEAyVSv1BRDh5wcDbjCYFPa418ytJ25CfJvi6CpvubgkGacbz6MSlfcCGfKeMgf+
         WQ2g==
X-Forwarded-Encrypted: i=1; AFNElJ/MhcucUHCONwc4zRGzJ6k6Q2RTWfbLfSkWI0GEWG+MCvywP/gCnYAkZi3ENG5GmAkzBq6RcbfCQfbHPD4n/mDH@lists.infradead.org
X-Gm-Message-State: AOJu0YyM9X6F6q4b5h7RyRz+54bBzk8ZEtPyS7sE4A3Z7R2yrVe8l0Dz
	vMl1DGf3sXw5rdxf4WENoNbI0aHXJqIkwPanF7vnR2znOH22zmNlDjD//nFjU5W599lNPrhZ45k
	z5AclaQ==
X-Received: from pfad10.prod.google.com ([2002:a05:6a00:28a:b0:842:84fc:f4f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b90b:b0:82a:6461:6d15
 with SMTP id d2e1a72fcca58-842b0f49acamr22128319b3a.46.1781052842229; Tue, 09
 Jun 2026 17:54:02 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:35 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-16-seanjc@google.com>
Subject: [PATCH v6 15/18] KVM: selftests: Add a utility to pin a task to a
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
X-CRM114-CacheID: sfid-20260609_175403_733397_1609F811 
X-CRM114-Status: GOOD (  12.16  )
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
index 92013883f35b..72f41b15594c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -662,6 +662,27 @@ void kvm_print_vcpu_pinning_help(void)
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
2.54.0.1099.g489fc7bff1-goog


