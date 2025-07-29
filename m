Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAEEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc32r+Sr4v5L+Ca8aCOg8fbvHCgq9dLI3RBtx8Gb/FQ=; b=Oqp32rjO6mWS+zODw1qRRM8dmU
	T6h3BOaUvH9soY/v2i8qjrXqEprDKZDWOo2UlXnstm82EGP34GNE+co1vi5t/mGlqIbvHmcxWQq+5
	Cb2rGwyrgikGlKcboybAAUEUO9/9rgy54/JzmZywdpOWn7Ujmuw8j+oTO5QpKw2E5s3jY7yzUW8z/
	sx4Rzp/ChZWqFAbShEnfZyXBhWPdg92F5RPq7eeMSjUuqe88SN/U4tFcPSvIu3sLSfdqOydovJs5j
	me+Ej0nyGByafLvb2elUr7w7orLVzSP40CznJE9Nzn0Y/N3Z7KFXbBWItfquPfOHz2gLbLUytJZ5n
	6tIjuH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjM5-0000000GiAT-361H;
	Tue, 29 Jul 2025 12:22:53 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0L-0000000Gfxd-0bcX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:26 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b780da0ab6so1524005f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790423; x=1754395223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc32r+Sr4v5L+Ca8aCOg8fbvHCgq9dLI3RBtx8Gb/FQ=;
        b=nuwHngvTGFDDh8eWABE/EoN/xX14tkp9x6zJFm/5xLiFTb/YotJID9ixC9vMnRcigl
         kdR1mORP4aueI7u094/kcLORpcLkzYamc4T+09PLLbvd4G1q5p7INTXa2irfvrNeFY6P
         iD3y4zSdnLMSIPJFXDDSWChRxIEniak0rdWWw3MhaaWRlwPHVSGi7IOx+IT/CEEHnBqN
         vjVsIGMQ0mQwR1Ahdv/kuCFezy/nh4DeFuMGIjJsFVtNM+LC+NQbpfh5q898hHSKlnR/
         c3UfecacYiXkU1+LJ25ICQhSztO3mEBhfKF/Z6CTyD+FxB8dRKfCuTE3FqX4k71qt9rb
         tiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790423; x=1754395223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc32r+Sr4v5L+Ca8aCOg8fbvHCgq9dLI3RBtx8Gb/FQ=;
        b=dOrTQyKuCd+oyDdRWF+CMSwzOIb+fjfw1xuwwlNE6n7XP6ynQIGCK/kxkUNE09AqjB
         Cj7XcnpYZhFWkfv3x8mNurrajonvs35xPNbLWdAmbBaiV6YB1LjEaIuvJzGffZA2IHMM
         cWMulKiODtbOef3UolhHnokz9psZZ41RhElePViBmd9TlA+OcvMqTDhmAvU5Yd4iJXMU
         DBZTf1pWP0sYpS1APPZp4EfpS/+lklDUL7Z+2qyRH7qNhf/WX0cVqyzzLkL9ZuF+JV5n
         2zSfiMo3gc1Lf3QSDOs7mqphJBgNcMrRuPn3e/2fb8dqpoZJIjHedfw811S/DsbE20jN
         eoxA==
X-Forwarded-Encrypted: i=1; AJvYcCWkNWWYlZQ8/TiVDxhKSFmTdJfemvmMOBwjietvRJsf5npjdrB0YnszuLdTl2VquvNUoof8mT+zwfIwsII9kHGI@lists.infradead.org
X-Gm-Message-State: AOJu0YyEjR0EFMJuI1Co1Vj/NH/jSxTAhN/kTWnmrPi+bfWmH2GdJDMW
	8oVVvV0XhTq466PIaBNKZpGkopDS04sgpxSCkPL+LM7OFmPzuAO/ekSTb/QyeEiwkH2UhjerdaJ
	10w==
X-Google-Smtp-Source: AGHT+IHshwCE8IqYx0ORc/k7xUPcgW5nHiUDPd0fso9nQoGkAFVilNJEmB5BScri8HCBRNzCI/VA4IFRcw==
X-Received: from wmbej12.prod.google.com ([2002:a05:600c:3e8c:b0:453:5f7b:74b9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2883:b0:3b6:1630:9204
 with SMTP id ffacd0b85a97d-3b77673274cmr10850444f8f.19.1753790422877; Tue, 29
 Jul 2025 05:00:22 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:13 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-9-tabba@google.com>
Subject: [PATCH v1 8/8] KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050025_183219_95C7D5DE 
X-CRM114-Status: GOOD (  21.26  )
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

When a pKVM guest is active, TLB invalidations triggered by host MMU
notifiers require a valid hypervisor handle. Currently, this handle is
only allocated when the first vCPU is run.

However, the guest's memory is associated with the host MMU much
earlier, during kvm_arch_init_vm(). This creates a window where an MMU
invalidation could occur after the kvm_pgtable pointer checked by the
notifiers is set but before the pKVM handle has been created.

Fix this by reserving the pKVM handle when the host VM is first set up.
Move the call to the __pkvm_reserve_vm hypercall from the first-vCPU-run
path into pkvm_init_host_vm(), which is called during initial VM setup.
This ensures the handle is available before any subsystem can trigger an
MMU notification for the VM.

The VM destruction path is updated to call __pkvm_unreserve_vm for cases
where a VM was reserved but never fully created at the hypervisor,
ensuring the handle is properly released.

This fix leverages the two-stage reservation/initialization hypercall
interface introduced in preceding patches.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/arm.c  | 12 ++++++++----
 arch/arm64/kvm/pkvm.c | 33 +++++++++++++++++++++++----------
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 23dd3f3fc3eb..acf8ad68c6bb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -170,10 +170,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		return ret;
 
-	ret = pkvm_init_host_vm(kvm);
-	if (ret)
-		goto err_unshare_kvm;
-
 	if (!zalloc_cpumask_var(&kvm->arch.supported_cpus, GFP_KERNEL_ACCOUNT)) {
 		ret = -ENOMEM;
 		goto err_unshare_kvm;
@@ -184,6 +180,14 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		goto err_free_cpumask;
 
+	/*
+	 * If any failures occur after this is successful, make sure to call
+	 * __pkvm_unreserve_vm to unreserve the VM in the hypervisor.
+	 */
+	ret = pkvm_init_host_vm(kvm);
+	if (ret)
+		goto err_free_cpumask;
+
 	kvm_vgic_early_init(kvm);
 
 	kvm_timer_init_vm(kvm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 082bc15f436c..24f0f8a8c943 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -90,6 +90,12 @@ static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 	if (pkvm_hyp_vm_is_created(kvm)) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
 					  kvm->arch.pkvm.handle));
+	} else if (kvm->arch.pkvm.handle) {
+		/*
+		 * The VM could have been reserved but hyp initialization has
+		 * failed. Make sure to unreserve it.
+		 */
+		kvm_call_hyp_nvhe(__pkvm_unreserve_vm, kvm->arch.pkvm.handle);
 	}
 
 	kvm->arch.pkvm.handle = 0;
@@ -160,25 +166,16 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_pgd;
 	}
 
-	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
-	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
-	if (ret < 0)
-		goto free_vm;
-
-	kvm->arch.pkvm.handle = ret;
-
 	/* Donate the VM memory to hyp and let hyp initialize it. */
 	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
 	if (ret)
-		goto unreserve_vm;
+		goto free_vm;
 
 	kvm->arch.pkvm.is_created = true;
 	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
-unreserve_vm:
-	kvm_call_hyp_nvhe(__pkvm_unreserve_vm, kvm->arch.pkvm.handle);
 free_vm:
 	free_pages_exact(hyp_vm, hyp_vm_sz);
 free_pgd:
@@ -224,6 +221,22 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm)
 
 int pkvm_init_host_vm(struct kvm *kvm)
 {
+	int ret;
+
+	if (pkvm_hyp_vm_is_created(kvm))
+		return -EINVAL;
+
+	/* VM is already reserved, no need to proceed. */
+	if (kvm->arch.pkvm.handle)
+		return 0;
+
+	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
+	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
+	if (ret < 0)
+		return ret;
+
+	kvm->arch.pkvm.handle = ret;
+
 	return 0;
 }
 
-- 
2.50.1.487.gc89ff58d15-goog


