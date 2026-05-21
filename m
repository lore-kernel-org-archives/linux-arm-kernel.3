Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49376CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1ZaR4aeOW4G4LqthsB0Y48avAr3yH4xQi2y5KNIRGM=; b=uW1ogdWXTydTpU62uWTfrPLfZc
	wMBvN5Oj68bkGFNpqGPtu6qqHS8SLGIoxh9fScxuRWYJIUAwtHRLPkU8x03BhXHe9y54aBq98BUn0
	ejeld44EfDx0SYDINzFQRQbybfRBZgsn32P5Pv0XoBkFyVrnKfVw16aJESGaMbVzZ68z393i/7TVa
	BZYwqSIw9gH3CnErGrsOBfeJms1War0rVGcAHG9r/HEKizb7qANOD9LSpH5tk/Eyh+S3nGsQMs/KZ
	NqBmjheKhJJn3ozQQIbSySZfORpugGkrCPE2eF3BHOd197o3Xj5VbVo//+gN6lqHdHzArAQ/8fEuD
	mGgIuysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Xe-00000007Rs5-1AhQ;
	Thu, 21 May 2026 10:22:14 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0XZ-00000007Rof-2tq9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:22:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48919890a95so31154675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779358927; x=1779963727; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1ZaR4aeOW4G4LqthsB0Y48avAr3yH4xQi2y5KNIRGM=;
        b=LhnQrRIz3HWv2mLqnFdC+w28iiBtKNbxPwR6p6pFw6RZT5no9DAR9lJe3mpt/r+6h3
         ZirymQWx559szjrBqB9yXRAD7BbFQkwEjKvNuy3X5b54y5huY/aeWjreuo4+THAmx0QF
         aw77+pkOwU6pD7aLr6AU1UXWBW5OGtXjQVIE1qt+b4y8FIGuzlLogolPHE2w4yAgcc96
         GX21UvFGJ74Q4Xxke4n1V9VtM6JaEZqt9NcrFoxXaez8HVT9FRdxddxSmu8xbgvqLd5Y
         Jn/FHyMphaZG+R7/KBVGnvyGrFTHXqomn3mrE41c0NNWkAOHU3IozdCBcIqW9JUK3vXf
         udGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358927; x=1779963727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1ZaR4aeOW4G4LqthsB0Y48avAr3yH4xQi2y5KNIRGM=;
        b=FzfOjrJwnrD4KEuK1Nqdf7usOxMXVqOlizPZkpWoePlHhViAz9PanRFVTAYybDBJC/
         WfgD1JCSqAA8pF8hUXwV69ebiwfDy5dskbIVd+dxO+f9QgepYDL4poBzYrh6tfrWRvJP
         HzDASiuvmbOjUNKuHRgHyghh1WE9GqJQAKt5cEDq5kioeHxatG/vzPcEkMxUKhIbUeQC
         HkXlNEQMptz94fK1995fK3y9NATRZ5l7HMN5uq8Zz5dUR2aQc8Z200//o2LVVG4R3nth
         lTwfoz4GNGutQtoyvaz02Nljgj2lpMJQTAfG/Mqyhh3dy6P9WOV2ayzmUFqxJVCPMaHF
         MoBA==
X-Gm-Message-State: AOJu0YwdqM5NpdXIy/+XopPh2W5lUWhwKQ8y6Vs7OgUP1J7/hni1CEjl
	jPiB2fzlAuZ0kNxvu2y7kHsKQ1nDIK2GgkbW/sJpnVz6ehDFRvHLhiO8lxcbeB8qtm8RRtQPMmp
	K0e4awKFGHh/xVynPnVhcZQ==
X-Received: from wmjx6.prod.google.com ([2002:a05:600c:21c6:b0:488:9c2a:aeba])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2e55:b0:48f:d0f1:ed28 with SMTP id 5b1f17b1804b1-4903604d391mr20275735e9.1.1779358927075;
 Thu, 21 May 2026 03:22:07 -0700 (PDT)
Date: Thu, 21 May 2026 11:21:48 +0100
In-Reply-To: <20260521102149.804874-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521102149.804874-3-vdonnefort@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_032209_750066_98AE4D9C 
X-CRM114-Status: GOOD (  10.44  )
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

In the unlikely case where insert_vm_table_entry fails, __pkvm_init_vm
release the memory donated by the host for the PGD, but as the stage-2
is still set-up the hypervisor keeps a refcount on those pages,
effectively leaking the references.

Fix the rollback with the newly added kvm_guest_destroy_stage2().

Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 3cbfae0e3dda..4f2b871199cb 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -56,6 +56,7 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot p
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
 int kvm_host_prepare_stage2(void *pgt_pool_base);
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd);
+void kvm_guest_destroy_stage2(struct pkvm_hyp_vm *vm);
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt);
 
 int hyp_pin_shared_mem(void *from, void *to);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 89eb20d4fee4..42b0b648f32f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -306,16 +306,21 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 	return 0;
 }
 
+void kvm_guest_destroy_stage2(struct pkvm_hyp_vm *vm)
+{
+	guest_lock_component(vm);
+	kvm_pgtable_stage2_destroy(&vm->pgt);
+	vm->kvm.arch.mmu.pgd_phys = 0ULL;
+	guest_unlock_component(vm);
+}
+
 void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
 {
 	struct hyp_page *page;
 	void *addr;
 
 	/* Dump all pgtable pages in the hyp_pool */
-	guest_lock_component(vm);
-	kvm_pgtable_stage2_destroy(&vm->pgt);
-	vm->kvm.arch.mmu.pgd_phys = 0ULL;
-	guest_unlock_component(vm);
+	kvm_guest_destroy_stage2(vm);
 
 	/* Drain the hyp_pool into the memcache */
 	addr = hyp_alloc_pages(&vm->pool, 0);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index eb1c10120f9f..3b2c4fbc34d8 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -853,10 +853,12 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	/* Must be called last since this publishes the VM. */
 	ret = insert_vm_table_entry(handle, hyp_vm);
 	if (ret)
-		goto err_remove_mappings;
+		goto err_destroy_stage2;
 
 	return 0;
 
+err_destroy_stage2:
+	kvm_guest_destroy_stage2(hyp_vm);
 err_remove_mappings:
 	unmap_donated_memory(hyp_vm, vm_size);
 	unmap_donated_memory(pgd, pgd_size);
-- 
2.54.0.746.g67dd491aae-goog


