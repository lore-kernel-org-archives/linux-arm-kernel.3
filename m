Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E9CCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQMzmovdG7+4lL/KhHHhQHCE1YeHiXnOvUJr1FLlhyg=; b=e4VRHpf7ySR1Y8CeiDa/+mL7HP
	Prvqlh6SwSq0ruyWrgFqSd54fokKr+dmMPPr0ZpQroJjmKA3qIGpNOhZ7aL75vvD7eqxEEIJleXsa
	k+BOZd6snXUw2Lk/LaZMEuyNxTg4WAbSI3bXlbKL1YM9hLfSRapawLpRPY6VBV9fPYizLre537hWv
	Y6rpZfoyCGymJtn4MH1ii8UQ85nS+k1Y2BUgtHupG7KsRZP/SuBPcpOD7LEZIaihJ0cLWSM5eVUja
	ziI+eb5YxiQDorov/M1yRy7Op8B3SMxPRomM2Cgc53/28dsieQL3GgGtsNrSjKtSTjYoWdB6GU4Ke
	YkSUBYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWn-000000075YG-1IfI;
	Thu, 21 May 2026 08:13:13 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWi-000000075UV-12uW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:13:09 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d7a5b9678so3813945f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779351186; x=1779955986; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQMzmovdG7+4lL/KhHHhQHCE1YeHiXnOvUJr1FLlhyg=;
        b=cGm828dyQfmnPT46uja5Qc4U2oeql6lRsvD7a6qqRc8AaBRyfa9p4CCgtNlmLpRiRO
         BSE8BzLwEI4PuU098YaSSEcr0oCju+kaGniTf+dQPwCX7uHUdYVx9r+5LY3CtXvxgsbM
         C+3s/aCFQDeTgGiBzDOgHM5jm8Zolrw0xa/2Zt8BIDgIJezsJQ5FuNThf2aFt3Qmlvp3
         Kh5FtNEYpZwIR8tRM6d0RGQoK1KrS5ap1FmGwTnoQZja4cP84u5CoecBYO/goK6Z/uZ2
         EESjSaweJQyeGjsgI+5G3oE+/Q5H9+MnB7zEtEzzpw+ExmOOntLs3X89NgsQzygq/HCt
         g9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351186; x=1779955986;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQMzmovdG7+4lL/KhHHhQHCE1YeHiXnOvUJr1FLlhyg=;
        b=NQ7vS9V8nXpwQt+NroCqS+cr4CcJAaqPZKfPm5hsFNeI+hjH0GDGdAuupQwqjOR3fC
         SlbhLW4AE6y8/1BnQSmpkPEiTDvnBLse+2ytaaZMZbYMZ4zmdT+OaxLDNa1dv9hu43Zk
         m9Rch5SGd4R7cKpi4Bzws8tbHPDL7DVHlsFfKVSsnXSR9821hhOFJNC+XYEHhPz+nedJ
         nENEpKEMI4wUVtoVw2lS6pFk7yvACKcbbmcO8PApIKYo7hUe41mqNgL7FEqJ3hZuMjf7
         I8XFWtz85BPHpBE6UJ//bQG5g4W4HWbwm2RtJmXuiS0Olo6YpwE5dhm7j/yiGbZ1p5MZ
         NhdA==
X-Gm-Message-State: AOJu0Yx52J9Ij3NUf7JmLStd3KkhKCaXKdAMyFpvpU14yjQfWlPlsyyZ
	pjjEAPUcqIonqLl2kojpuZUgGC8JmkOXbnfQRocd67rF7guPcZiGxaD97zboabrIM77ea1t/RYL
	5FFQW4QeDgR53SehZDfqQbQ==
X-Received: from wrqp13.prod.google.com ([2002:a5d:458d:0:b0:451:1d01:f982])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:46d3:b0:43f:ea04:dcc7 with SMTP id ffacd0b85a97d-45ea3ae6975mr2045405f8f.24.1779351185700;
 Thu, 21 May 2026 01:13:05 -0700 (PDT)
Date: Thu, 21 May 2026 09:12:49 +0100
In-Reply-To: <20260521081250.655226-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521081250.655226-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521081250.655226-2-vdonnefort@google.com>
Subject: [PATCH 1/2] KVM: arm64: Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_011308_309937_EB8D3777 
X-CRM114-Status: GOOD (  10.23  )
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
index 25f04629014e..1e17973f24bb 100644
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


