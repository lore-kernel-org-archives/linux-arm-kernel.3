Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3FBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+RC2G5i+r7lX7kvetU9fTffg9bEuD+WjxuGHJdH+ak=; b=LmwDft8WL57E6b+awhg//Xlw+M
	VYqh2DzHBgfxw2c+JhaaaV6MdUAL1oBL6S6PmFJZg7qa7Ny6BPI1+TUEjffc5Llkixkx2c3Wdu1pb
	e7GCQG+R5T16rlmkhu2iBxwwAJ6V3wyoNPpeWJh4znJJi3dI2WArgd1kIXLTFqTHyKJ8YYz5SbxSu
	zcQHlVvPBQlB0WTzLemlyYb0nMTfgECnotM8vmKpb4FbHKK757CMOCEFoXjrIz+MftQjEWAKk2gtx
	C1x12Vn58JIxTPtdffbzP3obpUEqwX8s85msiflPUQEPpM5YwmGK/XV91uJcKuGRiIAtiRmjI7nTZ
	qJtK0Czg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjCO-0000000GhLt-2Qc5;
	Tue, 29 Jul 2025 12:12:52 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0H-0000000Gfvy-0E3P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:22 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ae401eba66aso360615966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790419; x=1754395219; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+RC2G5i+r7lX7kvetU9fTffg9bEuD+WjxuGHJdH+ak=;
        b=dobjdxs/oaMLeOpfM3Y0FlomWnCRCnnLWh4ZTAD7Xmx2I2v0M3S+inGgcWgirq/16v
         EJe3gNcAGtAlxNvZizLhuJu/n8vGbdB+CHvPG5r8RclOwdqM4jkZweiEKCkMjjMtKLzJ
         zAaDaetyYBeST4GohDDP4G27q1OgaUNoGMxowhfFc+QzNnNLWJ8SufgycntXwTCPQpfH
         H88xx4KWld866F8Pxtr95e9zaLIW8Q2oJUYCvmg1PZ546RxZIB3Rz8inWuXKut81mr0s
         unCyLfytwJVyOUqD7uyuSD2yN9H6W5w5rx59VaDOD27OsZBVz7XWojbXTiAvBfDT2zBh
         umxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790419; x=1754395219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+RC2G5i+r7lX7kvetU9fTffg9bEuD+WjxuGHJdH+ak=;
        b=ejHjPCDRuqpotSEArrI8g7iqWUnMTZamQhP4l6QRYn9Jc+EJfWHYhJ70pUZFxc7nbq
         lNEwlYX9oCUu9ODY26yoOz39i23w3vhMrA2fku6FCDhUwSMFciWDczrgpE1E/i96vDUM
         AN+VdOAkdoaY9NhRalmJLOdlV9cO71Km+8KF7z8Jc54qBeWTP1W7pHg3H5YxXi+g7Iat
         32SlrGX5EhKQYpZ2yUurJh5yDt4Q+fmEYGxEmy1KQDvenbShqBQQpS7tl0Bbp7frcAWE
         5ouoyS5VDPo26Z/xRdRMQxtjlVGYJpV6p/EtMfV+u+daE0QdAB4mbVI6NMNMfSXROcq1
         DRfg==
X-Forwarded-Encrypted: i=1; AJvYcCVanuiV/csCHU4iJxwWut+NfTh1Yy/1StReIj4ZNHGMErEuWMQpzUulv/BkyNinaJdmVnBNxWaCeWovpo0pIgB3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd7k/WyPL+0TkXh8G7JmyDoyfmFUAZui6N3a0pPCrhii2tGt10
	SM8pDc1CdMMzykaIp9FFz0hz/mKdeXA3o7/p6uiTOqP1m1GgO9llSVgZdIurxgVWsBp4Jw81tg3
	6Ug==
X-Google-Smtp-Source: AGHT+IGlPUB2Q7OOgU/4rOub32/DQVY8ckIbgBq169+TSPDC2hzDpvacIFK83TMGJHQLAOsh0rnZtO3BiQ==
X-Received: from ejcvx10.prod.google.com ([2002:a17:907:a78a:b0:ade:3281:2981])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:948d:b0:ae3:6744:3680
 with SMTP id a640c23a62f3a-af61e43b5ddmr1781870866b.42.1753790418601; Tue, 29
 Jul 2025 05:00:18 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:09 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-5-tabba@google.com>
Subject: [PATCH v1 4/8] KVM: arm64: Decouple hyp VM creation state from its handle
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050021_093772_48107E14 
X-CRM114-Status: GOOD (  15.95  )
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
whether the hypervisor-side VM has been initialized.

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
index 55dc7cd83e40..622b45532457 100644
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
2.50.1.487.gc89ff58d15-goog


