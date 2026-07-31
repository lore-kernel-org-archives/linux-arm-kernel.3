Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481BAC55176
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu2nzxTULIrNid+T0wW8lXLrPPrctqAZSUyi9Ewmd1M=; b=aM7hDrguohXqt95Xs6vhJR8eBb
	NCIrg6ch6K2TCQU6k+1S+//r5vFnKO2KVd9/uVGfPuVBDIme4oDoqYRPB1AOeVtInW1QkA7eDJbKc
	hnsQ5MuF1UdIMZbPBei2AzPOaX0AZFJDviomg7Lv5v87lyVsyWI+bYQFUvkALbQMf+wVzDZ+c3Yfy
	FMw0RH+8GWc33F6ICJBci0ZIOVkLORhG1JIyAcRmrfcAhPHsWqNJeorXZrv2JcX5p9pDo6MH9I5qs
	a+Luv3Xwmt7CWqMVX7tFB01khgqAitu4az6nBkw7I6SStVfNoF5nLwttpeyQ4GON2HE8/FZ1XGV+D
	noaKUqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptMC-0000000DVVU-3lnP;
	Fri, 31 Jul 2026 19:57:24 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLK-0000000DUv6-1xGs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:31 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84a67b16217so2653083b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527789; x=1786132589; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hu2nzxTULIrNid+T0wW8lXLrPPrctqAZSUyi9Ewmd1M=;
        b=FnXng20coR1+jsrXusPjo4Z7VOu8JOa27sfEY9FoZ0K5yLGsGxk4M34c+cqsDQCieV
         7XSK33ifrGLYKXVLons30q96dmFtGOX57UhN8tU+iShySGa1roveyrzouWA+sv3nj50L
         d81k1wZwl6HB4hzamtvZGU4EeFsUhi83NHMZ58pFB+5I4VLvGVhlBitC4smW8qKCSRPo
         a00oTKoiQV3yFD9wDOvrseVKeYLOu2yosS4WFWaosjRbGmKaU4+ChmTVckztZ19in9B3
         ezkPbG27dw5kACMB52LrtMIEBn18lmqzdMNM7ofk5x89a/SZx79NdAiIElvuI3XWb6W8
         eNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527789; x=1786132589;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hu2nzxTULIrNid+T0wW8lXLrPPrctqAZSUyi9Ewmd1M=;
        b=NuM4bXD8d6U/5/AYMoCqnYLcy26Rr5IYYnvGxV+LOPe6j6wp9DnShy+CG72wnjnjHc
         YbdZ6EDYwclYy0iF+X05OYnLOz4tOvG40ozA8bycEJTXJNr2Nxr6XBi33dar5Kr3YBtH
         SdgbYeIntImFaFQisgvhl+7aLbIKvJYCOYhhMPA2ikY66/4rNL/QPnf1Xi7drUgHLcUG
         pB056rbUJOvcY40K4kGeGgamrsQ65qDerNhV3mNK+Z3K6xlNXvebNwHLRzh24/3MjFMn
         6jWcNzErzukXa2ys4IoSuKT1T+EAAY/2j7AVRKR07ks/VUTF5NurEmzfSquK0m2yZzyG
         MxrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJzMxCryRDUkoCyFyQlLCXaEHnY+5UMo8V94hlUWUE+XoUx6lxSBcQaQoTHg5a5FYI4kfYwFX+piKz/9vVCZdF@lists.infradead.org
X-Gm-Message-State: AOJu0YzQXNFVBEC4mf+g6BC0oPgVwKikj1aZyaXeDmUV/jbD1UFmhA2O
	JeZwTduALHWoZ5xvmMkRDAFZW0OyLFxgScDB5WKtmbSU33gW/ib7TbVamhLfebrzvh5s6eJbFJ7
	CO4bb9w==
X-Received: from pgii34.prod.google.com ([2002:a63:2222:0:b0:cbb:8eba:c0a3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3399:b0:848:7a8a:48c4
 with SMTP id d2e1a72fcca58-84ee4953ae9mr806765b3a.40.1785527788955; Fri, 31
 Jul 2026 12:56:28 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:11 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-12-seanjc@google.com>
Subject: [PATCH v3 11/12] KVM: selftests: Add KVM syscall wrappers for pthread_{g,s}etaffinity_np()
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
X-CRM114-CacheID: sfid-20260731_125630_553379_25C63380 
X-CRM114-Status: GOOD (  10.04  )
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


