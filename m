Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35ACC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuBm1h3wroC42vqlXGAbcWne6RUxZXNPSJiuZlBFSj4=; b=qZBhk3q1NcnKAeqt67ExLrTQBT
	DqX9DjImb0wuF7zrCAGblr29ZLh+R8fMWuBaWGGlzEIGNosBN3R/uEX/wVx8lW61Z8qoTip69f23E
	kCPXYpbiW36yeSzO+p0jlIKjBumHeyHMcSvWwe4fv/olZtRtA+nHmh8cApW2EFPUtyVtKHsxVVJb+
	m/di5yarn8B0LNkFuiha76GsnwWuYX24xgmEDnCkx1QAleXlf+RD2tFwpGzKoNGmHWiC02PUBTXku
	hEqYeBO5p1SDwTkX4JWNQldfOMeVheDb57Bw2D7qgEpXXBd8C+Z+K4g4Nim7ck9Dex22dL8bj52bX
	3MHBOjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPq8-00000007KWE-2tGo;
	Mon, 11 Aug 2025 10:33:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPdC-00000007Imu-35u2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-459e0f54c88so24752135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907592; x=1755512392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yuBm1h3wroC42vqlXGAbcWne6RUxZXNPSJiuZlBFSj4=;
        b=pCzP3EL2Ch71++R9YjppKG1YKkBjeAXKAdp71aXe+oSylbyw9Iu7yefkv9xp6uPH+K
         cdtjmRVf/5xqNC1OdeUEC6oaNboDCnXR4PHnMkjgf8ORJQ/MhyCJ0FyTQR/LX1CAs0l+
         jO+8qxB0APh6CeZzmbFLQNcP8PkUhOKX4yHnV27RUJaQ3f3fD7Wrwv7IOm2XDLGVNSQi
         eiWuYvDLarKPMchI7k5T0W+mL4bcPabMW5f0Oq9UW7M0nnA/iDBWXC/Y0HIWjFQRQona
         tlAinofI7gPyyhB0vHNcKjEOpabo9JdVd6zeCtEM3yszFSWK3aDpbpi7yidwG2fFVVNk
         70/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907592; x=1755512392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuBm1h3wroC42vqlXGAbcWne6RUxZXNPSJiuZlBFSj4=;
        b=NdkZLGrI3Su/XOncRGfBHY4bCwLJyuBLCWwGrlBqOjhU5QAIuhr5OLmAEbNww1OpHD
         8nJiIIEdzPdC55+p3E55KasXqpV6I2Jaw4OaFzIJEtra3cq06DYPckk95s2UzK3W3Typ
         eCyKd/NFeaTD7AitkAW2XA/F0UJHlQ8c2m3ckI5T8+YoKnqjDMu1ZBUU8wZBG52MgfyV
         2p4JlHSQ5gp/6Oh7jB36eBwvJeiylGQzeNGiF1ztjXJeS5OrbApEf9EmB0IGS1gVTz48
         tkJkQ5U5xvOlqAcYm04uC3xs/52BYMcdisu1ZeDJGd4EHPWr9hv12353E+pcvIWspw+A
         npyA==
X-Forwarded-Encrypted: i=1; AJvYcCU+/ekIifOn6bVlfi1+0CsmZntkCGTpGCRi4yb4AoCNt7j5uAwkWXi/G8jkpHzhSrbsS1X1AKkVPIML844kU08D@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmBx5iyisTeg3eIF9lhDgV4R74kiyx653Dq4MzOPC/f3NiWmb
	ovcmezrk2FbD0BA4Y/Uq01YAAxB1DqW5kycF2IQyfpvYcmqvTjThg1weKQZmIDMPrjVWC5nHYTi
	kQg==
X-Google-Smtp-Source: AGHT+IGgAXr8Vu5j/m5Mih/8asRCVtQBczhT59Yr+HqAtCz+LbSVevgoZdNhQ4lc2Sd+FmQscO1xwRyYHA==
X-Received: from wmbbi20.prod.google.com ([2002:a05:600c:3d94:b0:459:ddb6:d66c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4c84:b0:459:dd4e:4435
 with SMTP id 5b1f17b1804b1-459ede7d688mr98802995e9.5.1754907592323; Mon, 11
 Aug 2025 03:19:52 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:43 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-5-tabba@google.com>
Subject: [PATCH v2 4/8] KVM: arm64: Decouple hyp VM creation state from its handle
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031954_851177_489A15B6 
X-CRM114-Status: GOOD (  16.10  )
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
2.50.1.703.g449372360f-goog


