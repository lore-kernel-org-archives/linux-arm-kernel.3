Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588D3CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+I565ELukpP/rjfHIhv+TORYO3S6R2jcA7ns197jWA=; b=G8WwEIbQaQayu/Oscwn9gnTMDu
	TRQOftNk05wjgeVMfSZyGB/nXvKURSySPEo94w5lh/4lMIecPvy0F9YxVlTxU5TZV9ZjoOKFUunXW
	Hai6/P4yzN+aPb/3/dsYg3bRk0UfAkB0Bebk/svYnrF9nw0DEENTZV1iO8WHMmUvFLwIZd73G1Xw7
	SU1mjRXZR/uz2P90Uq7+9vu+e2ZLUbZ8nYsSlO7GyCl5t6XQv1M0i/Bjk64q+eGwDEVfIXntuwXs7
	fCiML7lIWXhGJb0JooHA6t4N00ORL0qhyjhhC5fTDZ6g4oCGPDyOn7cet+X5btXTncBW0iC4MV4wK
	O7uH0IUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7G-0000000Bnf1-0gbW;
	Sat, 13 Jun 2026 00:20:50 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC76-0000000BnWz-1KDy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:41 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf3636d6c0so15053765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310039; x=1781914839; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=O+I565ELukpP/rjfHIhv+TORYO3S6R2jcA7ns197jWA=;
        b=TcAEXN7K1EUBsc9mxvanTOTYpnl5pzwZRKOCXrJSgKhLqYx1lFO7UbiZ0FWvuh17Hy
         UHJYIx54QZWziYQP1jwPZiJ6HSMeUz4ib865vW2o7vFqqDzO1UTlqOr61pZoU4XpaFa4
         nETi9uzTeTJ04dJzUfud/+py806675yXCYaU1mUj8aX+rol8jty7t+yXYZeOJ+cBP08V
         PJ15zn+RTWtAjVEc34Zsx9JIY6Q7xjNQ66mUNf15AnABdIYhg9jgiWjaM0mdjn5XEzBC
         nlKsjD3SioEDPypLSOC2US1KFg9rcWjpBW0YzFyDzT7vF3mPLCncl6NxGjiWFDdmBeO1
         olOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310039; x=1781914839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+I565ELukpP/rjfHIhv+TORYO3S6R2jcA7ns197jWA=;
        b=ad96egGQQYsuMB/a+wexM99JYjAUDzTnQV3d4yR3g3R0/Mm2gKXH2Zqchbg5pZPcUF
         ig0eSEFXuXPSOXrF61YKQEmRrILKMo0WJsHLZK84rgFmB9S+nUh+xpyFlSTBh8iCPCEi
         5kJwhgQ47E2BqhKpOOzTHYCg5bk43KefDOxWRI2lbKWQc7pUv8JRbReulwU4Pp4s05KU
         BtuzHZ2SRiWDgZzYYyPHP1FKatgAIjzcdqEhyhs52/EdBLTBlE4olMrjcuJWeoAr7tSR
         Kqlc9nVEajviJdg+cs715lGM4UMHZ+p/ppx5aHlUytoj+54MMOvcjXmF9MGgv0kT7OiE
         9IyA==
X-Forwarded-Encrypted: i=1; AFNElJ+PJc4ysdVg4s/E9Ow84CDszfunA+nOfeF/a6NWbiWMS3xoNESs6u3K6QXb+6ujWAIdbj+7AHrmM5xOHgXRvH//@lists.infradead.org
X-Gm-Message-State: AOJu0YyqwJ5134jauzPCFAsJDJ++gFvdSfhMg42/uth8WiBNeATiSxJg
	yWngpqSVXjiU98kjX+PgpQ3HTa11OzRXi2GnZDqeAArwJYGVgfU07gcygoS9IOu4j2l6Uc5JfaT
	Ay2IqtA==
X-Received: from plbjb12.prod.google.com ([2002:a17:903:258c:b0:2b2:425f:b4f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1248:b0:2c1:69cb:4423
 with SMTP id d9443c01a7336-2c4111b8e7cmr56455115ad.14.1781310038540; Fri, 12
 Jun 2026 17:20:38 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:15 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-5-seanjc@google.com>
Subject: [PATCH v7 04/20] KVM: selftests: Initialize the default/global pRNG
 during kvm_selftest_init()
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
X-CRM114-CacheID: sfid-20260612_172040_368370_33D99278 
X-CRM114-Status: GOOD (  10.82  )
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

Initialize the default kvm_rng during selftest initialization so that the
pRNG can be used by tests before creating a VM.  As pointed out by Sashiko,
failure to actually initialize the generate makes it decidedly not random.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 875030c22d07..1016865d3f7a 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -24,6 +24,13 @@ u32 kvm_random_seed;
 struct kvm_random_state kvm_rng;
 static u32 last_kvm_seed;
 
+static void kvm_seed_rng(u32 seed)
+{
+	kvm_random_seed = last_kvm_seed = seed;
+	pr_info("Random seed: 0x%x\n", kvm_random_seed);
+	kvm_rng = new_kvm_random_state(kvm_random_seed);
+}
+
 static size_t vcpu_mmap_sz(void);
 
 int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
@@ -515,11 +522,9 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	slot0 = memslot2region(vm, 0);
 	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
 
-	if (kvm_random_seed != last_kvm_seed) {
-		pr_info("Random seed: 0x%x\n", kvm_random_seed);
-		last_kvm_seed = kvm_random_seed;
-	}
-	kvm_rng = new_kvm_random_state(kvm_random_seed);
+	if (kvm_random_seed != last_kvm_seed)
+		kvm_seed_rng(kvm_random_seed);
+
 	sync_global_to_guest(vm, kvm_rng);
 
 	kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
@@ -2279,8 +2284,7 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	sigaction(SIGILL, &sig_sa, NULL);
 	sigaction(SIGFPE, &sig_sa, NULL);
 
-	kvm_random_seed = last_kvm_seed = random();
-	pr_info("Random seed: 0x%x\n", kvm_random_seed);
+	kvm_seed_rng(random());
 
 	kvm_selftest_arch_init();
 }
-- 
2.54.0.1136.gdb2ca164c4-goog


