Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079E5C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jYV3TYqsZyydz0IjaYFSoLu2pCs+jwctwQKh0JY6aA=; b=e57UPvmucy1dlYz3qH1TRsj94a
	UBRc7QI3nNrelmCkhj3v8WU6QzMH5P2v28cPGh4sk9rq043wNsX2tpfIk80Rgdl+AUSt/JLchYwI1
	Y4knOEIsxsG4N48jQD2ORLN94dqyVABvmiXqXmhXmaNo7adRoQqnJJEEtWZxz74vl2b023Mwqq7sD
	kH/XRghQ8b5tWArC+RqABuQaPa+q3z/CNs17szG7QsARP3rJTHUoK8tSZw14z+pkQ2oBlGdSJaQ/t
	gw44hTmqIDQ8keWisY73oy6HHYePUiJ3Ns6F6GgNEXXNgIPoEPXjtefn89AvvkE4MNdmzs8CQeXRm
	iKz2pZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaNW-0000000AKVa-1CRE;
	Thu, 26 Jun 2025 00:22:10 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaEE-0000000AJhq-3sq7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:12:35 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-235f77f86f6so3337785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750896753; x=1751501553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7jYV3TYqsZyydz0IjaYFSoLu2pCs+jwctwQKh0JY6aA=;
        b=TiMDwqNDlV41ogT+Y2WONe3x2NDug/EKh2L1uUqObVV/yu8z1utpqoUrRXQRD3szld
         zqxEdJcmxr5rVUpKJzhvURFD2vtSxGaaqqFRwIYc0kSJQqCNtcbAXre69kgZltTkhiqR
         YhKIYE2maQKzjqCDsqthnsRNvoZwHV8EwY/rCo7jHwdh3+LAcnpQP/4clUDNLZVm55iP
         BOp7KAtx67FbyLYwTc1F/RJY/PegtpQBN4UjWSrwNo61kz3UFIs2WhkZP3P52RF12bHI
         YKSIO/eiYL6NiayVqpm4ZvsG6CoiAFshey9ju2repm1bSZoYOXsjfyY4RlA1wqHQM3SD
         zFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896753; x=1751501553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jYV3TYqsZyydz0IjaYFSoLu2pCs+jwctwQKh0JY6aA=;
        b=CQz6SThfhEAZ305czkzRvyGuaEB9mt6/aLCHyAJMw+1uHV+bcxBVhl4wl7OzOWJAo3
         Jb3FX73wrPw2lotkipv/qGpTBkpPDpmcS90qQVpAInQ4Ie1OCSa9s5z5wHkbmpLqdr7c
         5zDg71NcRPg3l/3mLdUmBsUYSRHC4FD7VEAY33KyeBozHnucUnrrwOeQXLl/EAe1a5/s
         zMEzBjv7aCJpfPoRge+CzEsStlyoezBq8ax0m7NlEE2NuxFblBcfau75n77ZNd3FdHkB
         Q1GYTNIFIwsyABitKZHY62fpzKUzgdm5X4nhxKccUlL+T3oaoO3f925pYSRHmbRNW0b3
         7pnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf6rE4S3VdQEIY75qDjletfLgJKntK5wzwmELUJ1/pj1+51FBpVfHcBO+SH7YK65vq/WmQd3/BzXj8EkV4/1Fj@lists.infradead.org
X-Gm-Message-State: AOJu0YzTXwxvWCuLCq4WW+BV755qABfGKM5skd+bAYhRixZGXESOik5h
	VeFM/+2zYE+dw9EJigTT4Bul/LvRtka+oKRE7eQW745Pwgr1xQeG3xBTaBFYSrat//hKg3pZ1LZ
	hRHRqVw==
X-Google-Smtp-Source: AGHT+IEokWeu3xZE8pF2I2mOTnRiQq8sbkVZWMeUSzDfllmerKjnZZu1jBEaneetis5nr35QOidy+TLEhOA=
X-Received: from pjbta6.prod.google.com ([2002:a17:90b:4ec6:b0:312:e5dd:9248])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f10:b0:223:f9a4:3f99
 with SMTP id d9443c01a7336-23824044733mr89766355ad.29.1750896753599; Wed, 25
 Jun 2025 17:12:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:12:23 -0700
In-Reply-To: <20250626001225.744268-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250626001225.744268-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626001225.744268-4-seanjc@google.com>
Subject: [PATCH v5 3/5] KVM: selftests: Expand set of APIs for pinning tasks
 to a single CPU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_171234_965058_01077087 
X-CRM114-Status: GOOD (  14.00  )
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

Expand kvm_pin_this_task_to_pcpu() into a set of APIs to allow pinning a
task (or self) to a CPU (any or specific).  This will allow deduplicating
code throughout a variety of selftests.

Opportunistically use "self" instead of "this_task" as it is both more
concise and less ambiguous.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 31 ++++++++++++++++++-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 15 +++++----
 tools/testing/selftests/kvm/lib/memstress.c   |  2 +-
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 91908d4a6edf..23a506d7eca3 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -21,6 +21,8 @@
 #include <sys/eventfd.h>
 #include <sys/ioctl.h>
 
+#include <pthread.h>
+
 #include "kvm_util_arch.h"
 #include "kvm_util_types.h"
 #include "sparsebit.h"
@@ -1054,7 +1056,34 @@ struct kvm_vcpu *vm_recreate_with_one_vcpu(struct kvm_vm *vm);
 
 void kvm_set_files_rlimit(uint32_t nr_vcpus);
 
-void kvm_pin_this_task_to_pcpu(uint32_t pcpu);
+int __pin_task_to_cpu(pthread_t task, int cpu);
+
+static inline void pin_task_to_cpu(pthread_t task, int cpu)
+{
+	int r;
+
+	r = __pin_task_to_cpu(task, cpu);
+	TEST_ASSERT(!r, "Failed to set thread affinity to pCPU '%u'", cpu);
+}
+
+static inline int pin_task_to_any_cpu(pthread_t task)
+{
+	int cpu = sched_getcpu();
+
+	pin_task_to_cpu(task, cpu);
+	return cpu;
+}
+
+static inline void pin_self_to_cpu(int cpu)
+{
+	pin_task_to_cpu(pthread_self(), cpu);
+}
+
+static inline int pin_self_to_any_cpu(void)
+{
+	return pin_task_to_any_cpu(pthread_self());
+}
+
 void kvm_print_vcpu_pinning_help(void);
 void kvm_parse_vcpu_pinning(const char *pcpus_string, uint32_t vcpu_to_pcpu[],
 			    int nr_vcpus);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 90f90f1c194f..c3f5142b0a54 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -620,15 +620,14 @@ struct kvm_vcpu *vm_recreate_with_one_vcpu(struct kvm_vm *vm)
 	return vm_vcpu_recreate(vm, 0);
 }
 
-void kvm_pin_this_task_to_pcpu(uint32_t pcpu)
+int __pin_task_to_cpu(pthread_t task, int cpu)
 {
-	cpu_set_t mask;
-	int r;
+	cpu_set_t cpuset;
 
-	CPU_ZERO(&mask);
-	CPU_SET(pcpu, &mask);
-	r = sched_setaffinity(0, sizeof(mask), &mask);
-	TEST_ASSERT(!r, "sched_setaffinity() failed for pCPU '%u'.", pcpu);
+	CPU_ZERO(&cpuset);
+	CPU_SET(cpu, &cpuset);
+
+	return pthread_setaffinity_np(task, sizeof(cpuset), &cpuset);
 }
 
 static uint32_t parse_pcpu(const char *cpu_str, const cpu_set_t *allowed_mask)
@@ -682,7 +681,7 @@ void kvm_parse_vcpu_pinning(const char *pcpus_string, uint32_t vcpu_to_pcpu[],
 
 	/* 2. Check if the main worker needs to be pinned. */
 	if (cpu) {
-		kvm_pin_this_task_to_pcpu(parse_pcpu(cpu, &allowed_mask));
+		pin_self_to_cpu(parse_pcpu(cpu, &allowed_mask));
 		cpu = strtok(NULL, delim);
 	}
 
diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index 313277486a1d..557c0a0a5658 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -265,7 +265,7 @@ static void *vcpu_thread_main(void *data)
 	int vcpu_idx = vcpu->vcpu_idx;
 
 	if (memstress_args.pin_vcpus)
-		kvm_pin_this_task_to_pcpu(memstress_args.vcpu_to_pcpu[vcpu_idx]);
+		pin_self_to_cpu(memstress_args.vcpu_to_pcpu[vcpu_idx]);
 
 	WRITE_ONCE(vcpu->running, true);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


