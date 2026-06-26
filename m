Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZu3Cjc6CZtki/JQXUzTgacdlapy8vtMh25cja8rCSM=; b=nGwFTr8heBbKi3oqIocGhp5iIQ
	tWyWklXdUQeBjaZfQp9gJ6rWf+BF88l5NnpsEVc57JnU+veuMT1LZ1N0DedBBbKodOTpnsOGDOrbd
	kMSWPm7rzgG8jcXT9BwfMoBMsQnwEGERkC82wFMSdvGqS2F1S4pexrwYxGR4UEQJ9x3S/JmOTEe3T
	PLVKm1dv/HUi8QzKfogRkYfi5JlMkRECOnE9zZeJEsGwS3go+YBlLRnUEHQHoeG1nOerRKTYmA86w
	JiH2eysTdvyxFKBJ7YxY9+W6t0OBtoPrPktAjq4nbVW2uLR5weVPxHv/UHHCsPZgXNKh4r0DjjBA9
	aI6VD3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDZ-0000000Bucx-27Y4;
	Fri, 26 Jun 2026 21:36:09 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDP-0000000BuPL-1rK3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:36:01 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-84540d59430so1003682b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509757; x=1783114557; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rZu3Cjc6CZtki/JQXUzTgacdlapy8vtMh25cja8rCSM=;
        b=U882KKehByrf2V1xIVXnqOf/1Eu/mtYC1URUVkQgIk4/+y7y3nyUzN56JXObyR4bKx
         pPJ3xt9mIamFxrH3RM0bVPiu5OVVR34z5MJKERIFyDPFTOTSK2Li7dAwqxx8UB8pAiXT
         0Q1M0yWzTYJTxbWoaPrwZL+vuGrzoiu3EPW6afcwqt4Ou/qs69d2iwfvX37v4yOBjIpn
         qof4fdTVevpMrgK+c/BOscffYUGCQ/XU0f/vqix0/cBpX/dCEIz1pgftgyJub78g5mGQ
         TTWS1NqcCwab8C1qygRuYpy7mJV1HZ/nxFriJseguIdiXxUF9Og5HK92iDn2oW11/fv0
         bC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509757; x=1783114557;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZu3Cjc6CZtki/JQXUzTgacdlapy8vtMh25cja8rCSM=;
        b=k1TlVnamI9AsEyqQA4yeHmpZkaQa2IyEEHMJ0MO8yyIxq0Py8HWsNZdwng0BYiz5qT
         hIzdXdQNr2gcgHs8hOrTBjexrLrwwE8amfqR7bBnoUDm4zGBg4KswWEjfg55+aAa2coR
         qTSLIqhl03hI8xQOajAgNTqxloqxAN1xx8d+677epoVmP4hrrtW1MiJ/yw8LFQeRqS1O
         o1jsttOFt3na875jGIfb7L0FiA+ffUefNOP9/uEBOvHZQ7PCSH2ayHuh7V9sg1bUCi/7
         ce/Pjky48SPhx1MXVj5CgQ2cIcOcWL9JwIxwDTFBXBOQxcJ3oDbgqxWUkA24ZEfQDiIt
         RrMg==
X-Forwarded-Encrypted: i=1; AHgh+RoH6bRU+gp0Ymr0hNR2Ji7ZifEoZ+GwzwjU0gKa65ma8VuQWlBol0A1vr52W4SqCdMjiYNJAoxuz1eYlZVmAGMN@lists.infradead.org
X-Gm-Message-State: AOJu0YwYK35oPGZO83bW0AHNQkW5CewagueMH3v+368Q4XZRTz4fhb2w
	GaeC7xNY3iUcfw3xyS8D/X0+YhtvO9JINDPj5R8TsT/AOXgh9324cBaDJfZhGAetCNScE2h5/K7
	kQMjeTg==
X-Received: from pfbgi11.prod.google.com ([2002:a05:6a00:63cb:b0:845:ba3d:923a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2987:b0:845:d274:bf90
 with SMTP id d2e1a72fcca58-845d274e56dmr1605456b3a.57.1782509756871; Fri, 26
 Jun 2026 14:35:56 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:30 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-18-seanjc@google.com>
Subject: [PATCH v8 17/20] KVM: selftests: Add a utility to pin a task to a
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
X-CRM114-CacheID: sfid-20260626_143559_494102_1E6F9826 
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
index 6a0ee033fdef..3794575d2ca0 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -668,6 +668,27 @@ void kvm_print_vcpu_pinning_help(void)
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
2.55.0.rc0.799.gd6f94ed593-goog


