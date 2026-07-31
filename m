Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCC2C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=; b=g5pv+20WfY2augX45Y6HdN9cyZ
	u7sX0AHcCK8CuGtjz65fQ2DvYj8pEiiwExIoQkRuasm+NtUvuUmVHzS2vO09h8T7/nFFwZGLeIznr
	s75K9jRyxMUIP+P23/69cdnmAZU/v4c67kx8kdC5AsI1Xbo3WRkyJEHGehqvnvLn/4ZtaP6LvKkt6
	ReDIy3RXLBhxPb3Avrk2RtZR7fLaXXliSsP8vix3YMGi4qxMK2+H3zOoUz2+16ONrEdY/+c7GEuNt
	D7IaAuVecJ6997HgIeAOxqpx5QsBEGNxGL65iskA8cYFWyc+xqmIr0R9sWrIJsA506WmOR6MGSE3G
	lffvm5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqh6-0000000DDiN-0fC3;
	Fri, 31 Jul 2026 17:06:48 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgn-0000000DDZ8-15HF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:30 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so953515a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517588; x=1786122388; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=;
        b=vrVkeuYyPMV/u6EvXA+y/00OlZCKzX/lddchOn9QCF717PG/Uf08oWkOi+WAFlHHn5
         sZOcnqgQrbO1DyumuThbXRn+zN0V5AF1uktvLcKMOjvV98GKltj1Jv+jhjrrgujZhjKE
         ehk42ZOAAAmpm8q3n1w/zUG7+w3ESB39PFRdnK5rNXQdCjS6JadFPgVdbz0ZxUiDlHsf
         wMR4Sp5FvCTMu/79Auf6E2tTOyxHCoJJe+/DA54CNPPmEw3gG/Lkk/mOVqZ7yCEDxEtJ
         CPAajnL66BRsSVQ0FPXPIy2IcgdYbJP0pmUegXGtEig4K7J5HxiEM5piPMRucBGEpQXk
         GeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517588; x=1786122388;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=;
        b=iQCJ04dSjKeQJ+4FVdCgXxCjmcTjV824Jd3J+MGdrLl1anFlviVAY78scjhHfKBIEj
         dpgQ5o/sqyDhji453s3KIrpD5eUObe1apzSnn8h/jluILgZ2fir6E0oTYe34NOSSHtb9
         uCGYx947hTUNFlTT9Rr0r9DPgC9KCki52AyEP3Qf1WuNSHYO5febV3ioLAtgxxQKf0Xf
         VGfR5iUToHQCWQxwTUAsUVJJwswGlv/uCjIe1IsfgFTqY/7aFrlZyRonObwgMgfC00fz
         zFt6DkOlyOSpJLShuZD00h3fnBHowGdygjdzb15juEkyxvo4OSkfz7K2fiEjj/TlR+a6
         gH/A==
X-Forwarded-Encrypted: i=1; AHgh+RphuYvgNyuyNSk3/ri3U1JMYuKm5qTr4o4deoB7gAg3lu4pPeWdRIMqXYU6bSTVHxoOmOMo6hT9VkZmxj4rLxn9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9gQ212i2Qz3FVQINnAMrK8ltX+lluMGuWXflPHMlt97pqsFKF
	YFYlWm2ivWM9IQd0fSJ4wKL5mxUbYsWam0kAjl7p275IMN72eAoxgktrtoepmzMBQPfzoZcrHce
	4rE3nXw==
X-Received: from pghd20.prod.google.com ([2002:a63:fd14:0:b0:c96:8e22:a215])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:116:b0:3c3:a1a4:862c
 with SMTP id adf61e73a8af0-3c92a94e9ffmr515706637.68.1785517587444; Fri, 31
 Jul 2026 10:06:27 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:11 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-5-seanjc@google.com>
Subject: [PATCH v2 04/12] KVM: selftests: Return the target CPU from pin_task_to_random_cpu()
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
X-CRM114-CacheID: sfid-20260731_100629_333513_C25D05E2 
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


