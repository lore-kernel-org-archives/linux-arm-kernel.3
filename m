Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330EAC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu2nzxTULIrNid+T0wW8lXLrPPrctqAZSUyi9Ewmd1M=; b=vWqrGH5lBnRK4bc5P2sBScH/5s
	Vc2Vt9nbziCODKviiKJnWVio/ykdwAj0mcjisRIBkwE2DnM3f43gI7c3MbrqtpH6YQ/e+z5L77Q3a
	pyTq7aKc2a5NIl8vOXGt6hRIQh7t8kRbIwubEgHVyTgYTPtqhUGgrLItXb/w/PROEqkodO/xkbPbl
	YK1ht0ugSkXKfQQiGu11KFA57smoUYvGQHg1CcC5Ruozn9DM6QnjH14omrghPVKOl56ghsqZlqr6d
	48yo4O/R8mHDBm9ZTD4ii7RToArRzprkQDhNOLyBzZ6J84D/RbRbfKd/ADWw+HMnmRCfOXHtPbt90
	SFE1UROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqh9-0000000DDmq-0qiH;
	Fri, 31 Jul 2026 17:06:51 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgw-0000000DDe2-0jiL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:39 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8485d853b08so2212981b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517597; x=1786122397; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hu2nzxTULIrNid+T0wW8lXLrPPrctqAZSUyi9Ewmd1M=;
        b=BaEOpmZ/H1JZkUIaewlgDo2rdEZYuAe6SjcHsHIevJThL56ZHAAn4j7DiqdyFOTBk7
         MJwjQphr137lAuUTG+lQ8SlO5ZoKu7pHdUeb/nxHs5sL1FGR/omE+XHFxhqFmodW+6xP
         prmiFVd1UnpI2BjgZ7vTQx60DbC84qHxYYs9FDX3Ar7mCdhUM5HHTnFhNXXlCV852vs6
         xAT3NWEymPLKo9Ls72uHGthX8drlQzVbZBUr3YxdOpPq0PCGJeGhAzj4w115fS7o6wwt
         CSFAEr8UjkyKv+MMbyoaj7OHzOFXZNcBhAYtVcwE+CXq24jxiqvJW7X/IzREOXDdcixn
         of3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517597; x=1786122397;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hu2nzxTULIrNid+T0wW8lXLrPPrctqAZSUyi9Ewmd1M=;
        b=CY++5PyZUT4b5xuuy2HP22AVJK7Ncmn7whhasNzU4OKgvn3YWwBRrEsd2F5PByCJ07
         qmX1WhxJnS5l6whMMUllgrobi8+Lh+tIFP4qV9lvzX9FExoRgpOQCebqfhciQyeS/qnP
         63NpY0y705/N9tAFnnSQrppBh4okjCyhNAHp3VwRQqpOB4gZBq6oPKovg7llm31Jeyj9
         1juncGF/HM7GJ1wHUXhdV/2qJ+YJz7Cr2l8NRjhpOMvJjq7SJi7JVxOQP6xjeXwkDDhi
         YWN4DYYaBLk6Vbl7fkSl4ewaZPizL8GJiiBjnr33Vb5SwiuhID/e/07T/fEh3Yke8fND
         07iQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHA8ApLKqUzKb5tBMOc1cfg5jcoJlZxorCI6TrsqSFo27l4/N4kgyuDoCJ6IBz22zJRHwq6eeC+l32dAlaGBWz@lists.infradead.org
X-Gm-Message-State: AOJu0YzN3x7QcoQqXkDw8wIdQRHm0FYdQYubTy0WNKr2UPJD9oB09b6Q
	TvV7OR0ApOQIlahWSOOLXUFFFJkejHBzs+Jaix/155Nnj/r3Nc4k21i/Vi7dRvfugwx/c1djKln
	+wGluuA==
X-Received: from pgsb25.prod.google.com ([2002:a65:67d9:0:b0:c99:aff5:707d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:484:b0:3c3:8c88:7b2a
 with SMTP id adf61e73a8af0-3c92a84bcf4mr591268637.58.1785517596388; Fri, 31
 Jul 2026 10:06:36 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:18 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-12-seanjc@google.com>
Subject: [PATCH v2 11/12] KVM: selftests: Add KVM syscall wrappers for pthread_{g,s}etaffinity_np()
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
X-CRM114-CacheID: sfid-20260731_100638_213647_686531AF 
X-CRM114-Status: GOOD (  10.13  )
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

Add and use KVM wrappers for pthread_{g,s}etaffinity_np() so that selftests
don't need to manually assert that the syscalls succeeded, and so that they
don't need to manually pass in sizeof(cpu_set_t) for the size.

Note, the steal time test didn't assert success, but the TEST_ASSERT() one
line later makes it quite clear the test relies on pthread_getaffinity_np()
succeeding.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_syscalls.h | 16 ++++++++++++++++
 tools/testing/selftests/kvm/steal_time.c         |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_syscalls.h b/tools/testing/selftests/kvm/include/kvm_syscalls.h
index c0657e54aee5..dc7461894aef 100644
--- a/tools/testing/selftests/kvm/include/kvm_syscalls.h
+++ b/tools/testing/selftests/kvm/include/kvm_syscalls.h
@@ -98,6 +98,22 @@ __KVM_SYSCALL_DEFINE(madvise, 3, void *, addr, size_t, length, int, advice);
 __KVM_SYSCALL_DEFINE(sched_getaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_set_t *, mask);
 __KVM_SYSCALL_DEFINE(sched_setaffinity, 3, pid_t, pid, size_t, cpusetsize, cpu_set_t *, mask);
 
+__KVM_SYSCALL_DEFINE(pthread_getaffinity_np, 3, pthread_t, thread,
+		     size_t, cpusetsize, cpu_set_t *, cpuset);
+__KVM_SYSCALL_DEFINE(pthread_setaffinity_np, 3, pthread_t, thread,
+		     size_t, cpusetsize, const cpu_set_t *, cpuset);
+
+static inline void kvm_pthread_getaffinity(pthread_t thread, cpu_set_t *cpuset)
+{
+	kvm_pthread_getaffinity_np(thread, sizeof(cpu_set_t), cpuset);
+}
+
+static inline void kvm_pthread_setaffinity(pthread_t thread,
+					   const cpu_set_t *cpuset)
+{
+	kvm_pthread_setaffinity_np(thread, sizeof(cpu_set_t), cpuset);
+}
+
 typedef void *(*pthread_fn_t)(void *);
 __KVM_SYSCALL_DEFINE(pthread_create, 4, pthread_t *, thread,
 		     const pthread_attr_t *, attr, pthread_fn_t, fn, void *, arg);
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 6cb1eb4c40c9..bc3c62b72c58 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -549,7 +549,7 @@ int main(int ac, char **av)
 		/* Steal time from the VCPU. The steal time thread has the same CPU affinity as the VCPUs. */
 		run_delay = get_run_delay();
 		kvm_pthread_create(&thread, NULL, do_steal_time, NULL);
-		pthread_getaffinity_np(thread, sizeof(cpuset), &cpuset);
+		kvm_pthread_getaffinity(thread, &cpuset);
 		TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(cpu, &cpuset),
 			    "Worker failed to inherit parent's CPU affinity");
 
-- 
2.55.0.508.g3f0d502094-goog


