Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717B0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuirtAh/ooKESl5pE7Y9JWmedNomhKt4Z9655mFfFNA=; b=GlSbweSHAjGvXugNQ0SgyLOndX
	XmKlO3B1RnbY3T7UjJth35+YMFlGuHhAQO1iDSq1yXexNNYhKkDpKKYVktSziFIkbdMlwy22sFsZC
	CzVoFW3IauT2prMD9g6j0vHOIvV+t68h0WawV4DGb26h6lQvedborxPgvZu0JmCzhij2u3o4QJ3VU
	GdTLgXY4fec1sRrEEBv218XL/YixzGh859KjmshYLrC0UkNewzmNw/+DSqFqIJN0aSI+NWq91FDre
	uaP9+ENpRuBOvprMkEZoaQQrsG3YxeR+e1rI/7p9lqgfOqJQWc5BA8j82GLKAd3Tj7ii0t6IUg/Pd
	3oK6gLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj7W-0000000Ggn5-49vT;
	Tue, 29 Jul 2025 12:07:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0E-0000000GfvF-34Ic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4588cfda8b6so6963605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790417; x=1754395217; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuirtAh/ooKESl5pE7Y9JWmedNomhKt4Z9655mFfFNA=;
        b=Js7FylZCQi7vhwD9i9RvxI+yzbWxxr9k7i8cKO/0ZGJboevHJw+xnfeM20T/Q55slF
         fvy+StzME+wxK6c2af8Jrg7ZYfv4uoyEnGcgwxPLpdTg9i2vMgz+e2OnuZIt4B/vCwi6
         uxxclne8QsT4ltNNLmATwdZmVr010SsqC8Qa7EPhqPsWMx3vl1zJuJiaCiK13FRp0itK
         F6gwsViSS3jvgSxewtZkIbPSWfwmRwAGTsQkShLHRPkzc4v9KkV1QBox4KNEElN6w9QG
         IN/m7DkJK/nr/tpKrJjSM54uj6FqZ8ma8+Ia3zRdHHcMdyS4mhKI1jjNXAp4DxicOt7c
         WJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790417; x=1754395217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuirtAh/ooKESl5pE7Y9JWmedNomhKt4Z9655mFfFNA=;
        b=BainpNatpZWUjIKtQpQYICMNW27ms7X1UNbn2qhJ38pdOjN7dT4F06DG3yVhEQOs1C
         b7kzyixNZEVUQzW3GXDuDYMIjLG+JvGETnoA20P5pGDG+tdRkPzArK1B7c/I7Dn4Vkp+
         4XteFnUBh6LtNiMYQbpAfnOQn5PPlZMKZa1BYFXLPT+WYkQgpHYcjz1WN/JSSFLj+KfP
         6NqFfjLN6X+/9NKnBgyUffxDeP/izbA7YCXP0KSlg4ZSpfse4+0EVuOjlr2wvzVSeGs0
         elx5XxfeBBwKMGqxjdnCx3x58CBIN8n5WbPJk4jFlaJ+mwCLsELf4X6NHLb6GPltCB8z
         CvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIVgv544weeOhN2P/Gyb3d+0HkdXZY4sOZJ+Edc5C/HDjUE34yb2bnDtv6BUNFzKadESoeJNq6PGRxvRHjhOqe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7W0x8vFS1B2Itjswyj/kjNUXIBq3QM/cShfEepngR3CeLf7eO
	p/9xshrOFdWZvUZllUuXlkDKsgu3tssPk41IWb1E3ZHNWAqhTPHhRu9/1cFpJ/T4CAaRfwg0Imr
	fqA==
X-Google-Smtp-Source: AGHT+IF/ZdMy5z5w0R1oV7hxo9bt+6PmsbOiXbjNanlJOFkc2x8Z0wmo1t6KVMgsDlAwJiOArix8E6QTaQ==
X-Received: from wmrn32.prod.google.com ([2002:a05:600c:5020:b0:456:19bc:aa56])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c059:10b0:456:13d8:d141
 with SMTP id 5b1f17b1804b1-4587654aca2mr79334875e9.27.1753790416636; Tue, 29
 Jul 2025 05:00:16 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:07 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-3-tabba@google.com>
Subject: [PATCH v1 2/8] KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050018_769440_6ED6467B 
X-CRM114-Status: GOOD (  17.25  )
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
functions within host kernel code (EL1). This improves readability and
makes the naming consistent with other host-side kernel code.

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
2.50.1.487.gc89ff58d15-goog


