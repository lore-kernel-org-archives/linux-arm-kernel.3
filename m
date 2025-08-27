Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRapLocKqPQxV7fCh+yvdCcP71Plz13kPXNzSMAQPfM=; b=0rDQQufF2sTG+6nlrgLYoiQDyP
	XKklIsz1sYIzJgbW21+1iotRsK9aAgIesmmvl4xh7gnp5vSpQVKTAnbwZqoFGsIRwitQv/ZeOIlZz
	N2BVM27B8JQkO0ge1jf4or/uCUolU1aWN9m5eICirxMX3d2mdDZGtZYj1IrIWgRgJ56PitRUAOPXf
	2HLdLPp38Rs9G2M+0MvbnlDyv8cts0NhBK44Z8ofQpQsWakiiI9WyJKW92sR62UEc1OyacOW8WgUx
	G05gaSPYBClskM50vsEUatEDaOXnsBTegOom2La/afPsgQSiMZFrxlxd9NAHuOJMmJQYN7rDjxn4S
	tbH8vCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1U-0000000FCO7-1PhW;
	Wed, 27 Aug 2025 11:09:00 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDG3-0000000F2am-0QKA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:20:00 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3c79f0a6050so1855912f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289997; x=1756894797; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRapLocKqPQxV7fCh+yvdCcP71Plz13kPXNzSMAQPfM=;
        b=J3EFcLXCYH+1rasg3CQoteY96dK2QMM6dS5GG8HkQ8h6c1UcO7N+GMqCbCZwaNDqTG
         buhXUe3vB1egrlg+wioqBOxTBcuGl6jslRklDw5+YrOxN2zgUp1Ebf4p/5Nrx00dTO0z
         10RMSFxDGWqtrguMW1Tfh7MOLJK37OQV1MfZvnbOQHle1Gl/15nXcYmyY2a1ULnO0P+y
         E93Qx7/DRX6Pf3d0QgM/BiwE0vVGaq2WnwrnE3NZ2iupwu5kcA68R7ZPJOgy6Kwgx+Sz
         yKClJaZyZaIOvSNSZrejwDz+fz3vMYa23BLAx+elWjr2mxCPAGG/GmU8RoXBwq5wBvVK
         gHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289997; x=1756894797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRapLocKqPQxV7fCh+yvdCcP71Plz13kPXNzSMAQPfM=;
        b=p1m8Fn32YwpEzpmEUUd0809BQNqVXN/DnfEh09hcmyVjigIYKx0oswmKFYG5fbxTYN
         TsLNhyeb2U0PahIYrdRYesOgSaO+9emp1g+XzJLNs8rgNJ0LzwA/1IYKpj8asH6x9IdN
         cWZCh6uS0X2qVe1tQiIRfgduhqbUo9wC3jNOaf4gCPToK5pqKhMQSmwv1BkX4cSU7pyE
         Mmwdue1mhrm3Y9drFw6a23gv9477X89WIQQ1lQBx4zH2qZBN+67Qjxtn6OexCJhUY5sW
         luiWxxJTeeEqATy8ooyye6AlBn5FEsEyFiuHv4sZ5PMcYCILPmo9puQ1N4Al10za3m8B
         FJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGpGV0bfi2cVyaJoLZDn8gp3GVf+DdjHMO35UkJTbNhislG86DJmF9/E3z8ID1jk9iyyYMUXc0SaT1iQQA6ZsT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp9OBROvb3KcaFvoDJdbFSXxrC1RbP9FAKKGaA/LXQ8NusDaXD
	jjVeP3pqsv3TefR9VLw67CsO2kP/BjY05ZZpFy/9nXI5NEAbtsosAwaP6NO7yoQ6HBcamDH1Uyg
	j5Q==
X-Google-Smtp-Source: AGHT+IGMXNFuHEVLWqZbBsEXy6JKMid9YIc8LN5dBwVuR5WYPnrbYCExmUvnij73N/ExhE6hMue6DAHNNQ==
X-Received: from wrbcp41.prod.google.com ([2002:a05:6000:4029:b0:3b7:8249:b333])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f8d:0:b0:3c8:d236:26aa
 with SMTP id ffacd0b85a97d-3c8d2362b89mr9928954f8f.58.1756289996961; Wed, 27
 Aug 2025 03:19:56 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:45 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-6-tabba@google.com>
Subject: [PATCH v3 5/9] KVM: arm64: Decouple hyp VM creation state from its handle
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031959_142867_53431E12 
X-CRM114-Status: GOOD (  16.20  )
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

Currently, the presence of a pKVM handle (pkvm.handle != 0) is used to
determine if the corresponding hypervisor (EL2) VM has been created and
initialized. This couples the handle's lifecycle with the VM's creation
state.

This coupling will become problematic with upcoming changes that will
allocate the pKVM handle earlier in the VM's life, before the VM is
instantiated at the hypervisor.

To prepare for this and make the state tracking explicit, decouple the
two concepts. Introduce a new boolean flag, 'pkvm.is_created', to track
whether the hypervisor-side VM has been created and initialized.

A new helper, pkvm_hyp_vm_is_created(), is added to check this flag. All
call sites that previously checked for the handle's existence are
converted to use the new, explicit check. The 'is_created' flag is set
to true upon successful creation in the hypervisor (EL2) and cleared
upon destruction.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/asm/kvm_pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c    |  1 +
 arch/arm64/kvm/pkvm.c             | 11 +++++++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a4289c2f13f5..bc57749e3fb9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -253,6 +253,7 @@ struct kvm_protected_vm {
 	struct kvm_hyp_memcache teardown_mc;
 	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool is_protected;
+	bool is_created;
 };
 
 struct kvm_mpidr_data {
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index ea58282f59bb..08be89c95466 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -18,6 +18,7 @@
 
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
+bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index abe173406c88..969f6b293234 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -407,6 +407,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
 	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
+	hyp_vm->kvm.arch.pkvm.is_created = true;
 	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 7aaeb66e3f39..45d699bba96a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -87,12 +87,13 @@ void __init kvm_hyp_reserve(void)
 
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	if (kvm->arch.pkvm.handle) {
+	if (pkvm_hyp_vm_is_created(kvm)) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
 					  kvm->arch.pkvm.handle));
 	}
 
 	kvm->arch.pkvm.handle = 0;
+	kvm->arch.pkvm.is_created = false;
 	free_hyp_memcache(&kvm->arch.pkvm.teardown_mc);
 	free_hyp_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 }
@@ -165,6 +166,7 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_vm;
 
 	kvm->arch.pkvm.handle = ret;
+	kvm->arch.pkvm.is_created = true;
 	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
@@ -176,12 +178,17 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 	return ret;
 }
 
+bool pkvm_hyp_vm_is_created(struct kvm *kvm)
+{
+	return READ_ONCE(kvm->arch.pkvm.is_created);
+}
+
 int pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	int ret = 0;
 
 	mutex_lock(&kvm->arch.config_lock);
-	if (!kvm->arch.pkvm.handle)
+	if (!pkvm_hyp_vm_is_created(kvm))
 		ret = __pkvm_create_hyp_vm(kvm);
 	mutex_unlock(&kvm->arch.config_lock);
 
-- 
2.51.0.261.g7ce5a0a67e-goog


