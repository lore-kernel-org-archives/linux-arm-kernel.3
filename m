Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B56C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMPI0KfDFQZoDbV9gU7g+JMTY6H4n5QM5OKNzo1w9wU=; b=VqGQwRGMmYuYyBXfh0PmdOpIXs
	epQ9CqBcQmX+ze+3zCv0Y5NrGU694PcuPe1Xk5vr6FNlNRMgIQ6INCZbJcD11uW6LXXSeC3+5joH7
	UNrNCLezCvB6daiBRjOh32OfXZfbUuTSEYH2Gmm4IZcAXefetKVgy4sf2+xP3rHT2J3L3KK4cb+eO
	5Z73IfEVqWik+nrqjysvwn9yVUPt9UziuJdBstunNapC+caIUUsD3GJh18lDq7YYTrtJ1B98vwyvP
	sgJ8R8XxkeJ+CPbBD20In8ICCExPGJKhy8ezFzlCeKTfIruuxzooDSgLIYeL3ER3Fi4znqjm4gxnC
	4TfRuAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPkz-00000007Joe-31XT;
	Mon, 11 Aug 2025 10:27:57 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPdA-00000007Im2-20x2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:53 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-61823fae559so1184957a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907590; x=1755512390; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fMPI0KfDFQZoDbV9gU7g+JMTY6H4n5QM5OKNzo1w9wU=;
        b=zCI4jf+RXCoJPJhno3LVRsbF3J/WbhjtIULtcDslN1um1aweE9o6rOcmssmBBDdc0P
         V22CNNaNpCE+CnahxcHLbvh6c4w1TuArE9lKTWs17aDi0k/xcgi0XpuUUfFlDUF4SuMG
         4adnG3akc1F6XJNBe1mO12WTMABddE5KjS6jrdX7wRsE2lvx0TdgGnwB8HIfEFLWGqAn
         MiWoV69OwHhryVzMytUBWsKEpI6tugf+jKW8OsxOBvC/itGUWgcINK0s5f32pXSmc2Ta
         4P2uD5LhZFx4Vx6fLqegWwjVRptGgPkeYLYSqR4DlMlJjrLZrVgkxXsynZ5L3LmRZfY5
         Hf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907590; x=1755512390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMPI0KfDFQZoDbV9gU7g+JMTY6H4n5QM5OKNzo1w9wU=;
        b=IKh/0REtG/8hxJzUrSZtlmiQlGQFzP3ZcgtXk4Clm0y4iHfeCyONsGLZpcFB/U7Vn1
         +FC2DulhFhw3xdQorGSz2yEP8lv0fHYiMyP9Xp6dtf4UJJ/ZYnZvWZfwh/qAsUn4w+Wh
         TKaVoAn8j4kxbWjEUkuUCP7wADE1m0N4HhuFYRimzPmcjgo2Ftw4UXtggy3bWKn+iMW2
         wlR6pZynNwwAJqh0B2eIrlO7gZHFTMb5QroJwkNtXYWdzweygqdmMnetiIH8mm5+FPwI
         FKUHgNcoYsQPL5b/R8jAaos8pnUShO5PddfV0xrqh9y+AroqnUkcalLAQsCB00jsJXBP
         KjCg==
X-Forwarded-Encrypted: i=1; AJvYcCXTiZwcXl9XvOp279BwoWo7MWavWKuwOz2oKaJbtE9XGv9qlKTY9Uiwjz9UgKS/yxMSQxSU/HBj/CHJIh05FE/3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ed2ve9EVsWC2IwmwJayawqQUDOM3YPnGrmD44d8DLGyqtPpX
	pztIPzoFCc3kT6d2HFnWPJpdYMbv8jvx/1BefAFebSkpjpB9CSxXo43BnQVnKb10t11bNVcByyS
	3jw==
X-Google-Smtp-Source: AGHT+IFUZ0WiEg4bHvCBVE7aArkXQiDPFm0FyTeTbJOVOXcKuE5+ecYtvtbIYFOCpXOeW6roXWnhHXRB5w==
X-Received: from edbfj7.prod.google.com ([2002:a05:6402:2b87:b0:615:5526:ba13])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:d08:b0:618:2011:caae
 with SMTP id 4fb4d7f45d1cf-6182011ce2fmr4190364a12.4.1754907590160; Mon, 11
 Aug 2025 03:19:50 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:41 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-3-tabba@google.com>
Subject: [PATCH v2 2/8] KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031952_534603_E1E0148A 
X-CRM114-Status: GOOD (  17.33  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In hypervisor (EL2) code, it is important to distinguish between the
host's 'struct kvm' and a protected VM's 'struct kvm'. Using 'host_kvm'
as variable name in that context makes this distinction clear.

However, in the host kernel code (EL1), there is no such ambiguity. The
code is only ever concerned with the host's own 'struct kvm' instance.
The 'host_' prefix is therefore redundant and adds unnecessary
verbosity.

Simplify the code by renaming the 'host_kvm' parameter to 'kvm' in all
functions within host-side kernel code (EL1). This improves readability
and makes the naming consistent with other host-side kernel code.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 46 +++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index fcd70bfe44fb..7aaeb66e3f39 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -85,16 +85,16 @@ void __init kvm_hyp_reserve(void)
 		 hyp_mem_base);
 }
 
-static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
+static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	if (host_kvm->arch.pkvm.handle) {
+	if (kvm->arch.pkvm.handle) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
-					  host_kvm->arch.pkvm.handle));
+					  kvm->arch.pkvm.handle));
 	}
 
-	host_kvm->arch.pkvm.handle = 0;
-	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
-	free_hyp_memcache(&host_kvm->arch.pkvm.stage2_teardown_mc);
+	kvm->arch.pkvm.handle = 0;
+	free_hyp_memcache(&kvm->arch.pkvm.teardown_mc);
+	free_hyp_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 }
 
 static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
@@ -129,16 +129,16 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
  *
  * Return 0 on success, negative error code on failure.
  */
-static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
+static int __pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	size_t pgd_sz, hyp_vm_sz;
 	void *pgd, *hyp_vm;
 	int ret;
 
-	if (host_kvm->created_vcpus < 1)
+	if (kvm->created_vcpus < 1)
 		return -EINVAL;
 
-	pgd_sz = kvm_pgtable_stage2_pgd_size(host_kvm->arch.mmu.vtcr);
+	pgd_sz = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
 
 	/*
 	 * The PGD pages will be reclaimed using a hyp_memcache which implies
@@ -152,7 +152,7 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	/* Allocate memory to donate to hyp for vm and vcpu pointers. */
 	hyp_vm_sz = PAGE_ALIGN(size_add(PKVM_HYP_VM_SIZE,
 					size_mul(sizeof(void *),
-						 host_kvm->created_vcpus)));
+						 kvm->created_vcpus)));
 	hyp_vm = alloc_pages_exact(hyp_vm_sz, GFP_KERNEL_ACCOUNT);
 	if (!hyp_vm) {
 		ret = -ENOMEM;
@@ -160,12 +160,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	}
 
 	/* Donate the VM memory to hyp and let hyp initialize it. */
-	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, host_kvm, hyp_vm, pgd);
+	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
 	if (ret < 0)
 		goto free_vm;
 
-	host_kvm->arch.pkvm.handle = ret;
-	host_kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	kvm->arch.pkvm.handle = ret;
+	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
@@ -176,14 +176,14 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	return ret;
 }
 
-int pkvm_create_hyp_vm(struct kvm *host_kvm)
+int pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	int ret = 0;
 
-	mutex_lock(&host_kvm->arch.config_lock);
-	if (!host_kvm->arch.pkvm.handle)
-		ret = __pkvm_create_hyp_vm(host_kvm);
-	mutex_unlock(&host_kvm->arch.config_lock);
+	mutex_lock(&kvm->arch.config_lock);
+	if (!kvm->arch.pkvm.handle)
+		ret = __pkvm_create_hyp_vm(kvm);
+	mutex_unlock(&kvm->arch.config_lock);
 
 	return ret;
 }
@@ -200,14 +200,14 @@ int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-void pkvm_destroy_hyp_vm(struct kvm *host_kvm)
+void pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	mutex_lock(&host_kvm->arch.config_lock);
-	__pkvm_destroy_hyp_vm(host_kvm);
-	mutex_unlock(&host_kvm->arch.config_lock);
+	mutex_lock(&kvm->arch.config_lock);
+	__pkvm_destroy_hyp_vm(kvm);
+	mutex_unlock(&kvm->arch.config_lock);
 }
 
-int pkvm_init_host_vm(struct kvm *host_kvm)
+int pkvm_init_host_vm(struct kvm *kvm)
 {
 	return 0;
 }
-- 
2.50.1.703.g449372360f-goog


