Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF462C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=; b=DD67kTV0//C1HCyaAe2Ly7aCwT
	cPYGJY3Wv5x6EfSfLffZL1ikD94E6pOuufABMzJd5j3Q16f/Vx2ML+znJfKZ0WQiEMXNP7/6saHRF
	EPacCWJKROM2eUxQRiRi0ta8kwFWYythh76Ae3vs6Q1Vu4K1xH+IZiINASgjqtoXGgDg32lq42Af/
	RWUghi1Pue7mPJaJx4it691XvrODOoaRMFrrsB8TuiP6XZGgBAGWBU+rkwrXSo4js2oT2JzjaRg90
	zdPUbZZNmfxXrXZ7imA8FNUpblQm+EtkSRIkQIMX/OESQmg4wbGorSLHzTA1SuC0J8PGre2aHVIR/
	ibJr0+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLI-0000000DUtY-25pU;
	Fri, 31 Jul 2026 19:56:28 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLD-0000000DUqM-0ISv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:24 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84857446424so2574631b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527781; x=1786132581; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=;
        b=Y50kj/ioSE3bR7cXG4wAMHOMnr5wDcshCbO9VHFRvciyhhcRxUtul27uOz/flvhz2p
         neoaMjW6wi2Yy2M4eu122NTVo9uJ72fQHtyahzg7SPyZUVAap7/9jbunyxxO+JaMdbbh
         RW6UEhadFDmi1PH84XGTeq/iO8ymCCx8qk5Ylc9A3XmaIg/MT9U4vxCPfQUuBFBXjs70
         aEeB+/DHIQ2esSgDCoFuuWG7Hd4WhFhgSfVdYiKNfXAn/MU4uQJBPdhzlmmeMxh6cN+x
         /z6Gz0XEIpwzUeK5Dx06EnbgdBvG48CwXvWQOkMZWuPWEf1SMXan90ui/AOjXiK2qpYi
         9J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527781; x=1786132581;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=;
        b=U58/asy5aHUSxOmP+CF8osNEzuUHjAJ0wygw2UKqVmuC142q0WClZOc02xlFKrDJs2
         13hBe/eb+jCqe9X9rA8DczgzId0I72iFRZpIwCqJ/d9iMG9CbyAIoE6VVmJuoLAE/01K
         ELJp7N7olG82KvKjPRc07foNjXZ4cxlAiQ09kHspwmPO9JOQDw2L0jcjlXJYhtmsa2MW
         LipkS3f2ttkhFx8qfFuMjBRTnDzSvh3jngHX80ZNJNyeN6pxDlg08LKlIJPF5TgvgP+Q
         78vsPSKQ02F9vz33DyH4b7Y5S8t7Mh0VwNawMPyVfvh7VN3hcWSVjqO9RSPEeFeRj5ii
         NOCg==
X-Forwarded-Encrypted: i=1; AHgh+RoQ/E9WNqzFnZKCVMjd1hYIa2PV/QuZzNBjwdhqNf0kzb5gpKn5cPb8ap308DuPb+xB8K6vF0Mgio4a+LeddUJO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq5Np6z1k7Pt6XLhXI5pAvpqMLoV7g6PI6VbyteERkQdnUvuqB
	vDAf7DI3if+axH5ggNPlYTStWACOMe/bAU8PfhijvBryjCFf8Tp8dt2LuG5v8PZexK4ZisddLiv
	LBEK5SA==
X-Received: from pgiz17.prod.google.com ([2002:a63:c051:0:b0:c9f:dabd:440f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c95:b0:848:63fb:fd91
 with SMTP id d2e1a72fcca58-84ee490ac2fmr778630b3a.41.1785527781042; Fri, 31
 Jul 2026 12:56:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:04 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-5-seanjc@google.com>
Subject: [PATCH v3 04/12] KVM: selftests: Return the target CPU from pin_task_to_random_cpu()
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
X-CRM114-CacheID: sfid-20260731_125623_110096_CA099A3C 
X-CRM114-Status: GOOD (  11.19  )
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

When pinning a task to a random CPU, return which CPU the task was pinned
to so that the caller can do things like avoid running other tasks on the
target CPU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index b39e713c30a4..61d72e1e7601 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1094,7 +1094,7 @@ static inline void pin_task_to_cpu(pthread_t task, int cpu)
 	TEST_ASSERT(!r, "Failed to set thread affinity to pCPU '%u'", cpu);
 }
 
-void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus);
+int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus);
 
 static inline int pin_task_to_any_cpu(pthread_t task)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 3794575d2ca0..af2bad0553f9 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -668,7 +668,7 @@ void kvm_print_vcpu_pinning_help(void)
 	       "     (default: no pinning)\n", name, name);
 }
 
-void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
+int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
 {
 	int target_idx;
 	int nr_cpus;
@@ -682,11 +682,12 @@ void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
 	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
 		if (CPU_ISSET(cpu, possible_cpus) && target_idx-- == 0) {
 			pin_task_to_cpu(task, cpu);
-			return;
+			return cpu;
 		}
 	}
 
 	TEST_FAIL("Failed to find random CPU in possible_cpus");
+	return -1;
 }
 
 void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
-- 
2.55.0.508.g3f0d502094-goog


