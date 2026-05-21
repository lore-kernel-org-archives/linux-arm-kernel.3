Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DD3CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cUmhlK4FYcog/fUBeDAbFbwd3xA/tYCb3LFp8+JmDw=; b=UKMhNUPrLgmAz7FbWsXqbqJI5g
	7dMy1iX0+6vVMddF08pU0z4OCl8p/TdVgdZkBGk/BbM/OtCfDBuWD0cTtxwuc9bhue7t+frXZWt9L
	NyXpP1qJyJd0cAL2dpZIg28LSORBwVmUsgA5aoBPn6FNltaGqoOHxmwINBLM+5vPWX4HnXxyQ4f3o
	F9YRyzacJYrt2LuyWYfKJmTVl690nFp7aaikTuI9DsrfQTs/BI1yB7WiBwvrmwNWw+aGoWswL3Evp
	cW8VoheHHqo+guLj3W9d+ZCtJSnEdekTr8t3FPwe+Q3nKeD+r7Xwst3cXEQjclA+YPxUYVy34HwC4
	R78TCH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Vr-000000085jS-31nD;
	Thu, 21 May 2026 14:36:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Vl-000000085f4-1fyI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:36:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fd3dbd16aso50944745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374191; x=1779978991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5cUmhlK4FYcog/fUBeDAbFbwd3xA/tYCb3LFp8+JmDw=;
        b=Ann/8crWv1RKuNRpd50dEB0cUgXSM5hSQ8MuUBqDuqa2c7H+hB2dAH9Q83899IU+jX
         SM0iLbYGdlBPh4JObWoPj8N/H8Atz1ATtCFEzbd/WzT3pm5OQsfqP7JB4lJciZ/LW2Cb
         RQHJSCBV2t5dBDjZmZBwTznpNL2Gl1+ZHORWjHYtU/AUdWTVau/BS9boWU6tmwQAXgf9
         2XQh1pvK7NSq/WSEsrNrstjsY0xFJnagH4tK0y0y539UCuPXAm0MMAJvChz7WdtxpXPK
         ovTD035qnniEbhESbPmoVkSNEVKH1yo07+xypM0eZyYcA2EDQO2BFUZC0QBTxsSuVMM2
         9FXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374191; x=1779978991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cUmhlK4FYcog/fUBeDAbFbwd3xA/tYCb3LFp8+JmDw=;
        b=Q4NY3V4plgkYSVHw2T2aOe9VEnZfb1tHcIJXK9ITcx2zef4guVKyIqO+OByGDb4rUw
         KCiDmB+JlJQ2CRzvEILtPmT6BIQoMO/cMv85A6GgoE1H35W1u6/2WwMZ8uAZb95K34FA
         KZ4/oeJo2WBZqagtPNUGPChlQQ2LIPkMQ8RGKLflRCrRGIOkZwDcVQDns2vwhstxz9hb
         ii56qb/ReutzBZK8cQyVlR/AuC5C7d0AyfbhspLSosZ3FmjEV72ChutWxyoFlo6T+lyr
         D9zOuUPSsW03IHrupmFPhG5fxIfV90Aq8bkYG15AASJh3j47Cr8uNL9IUXoVOOmeQYif
         hOwg==
X-Gm-Message-State: AOJu0YyDRDGzhaKyeCW7mLKT2pItLt0bcJwWbiBkPpXebsAQ32WlMNMX
	pq/ATHIA0/GQJBtfOZSEPD4va3/gB6cGauIns7DJNl3ACfP74My9SyzpxLwFbhhKMN9fqyi9VbZ
	wTFZJj449/SwZF1xsbVAtXg==
X-Received: from wmsl5.prod.google.com ([2002:a05:600c:1d05:b0:486:fca5:7a8d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:620f:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-4903604cc8dmr41280105e9.4.1779374191238;
 Thu, 21 May 2026 07:36:31 -0700 (PDT)
Date: Thu, 21 May 2026 15:36:25 +0100
In-Reply-To: <20260521143626.1005660-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521143626.1005660-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521143626.1005660-3-vdonnefort@google.com>
Subject: [RESEND v3 2/3] KVM: arm64: Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073633_458201_1FC215FD 
X-CRM114-Status: GOOD (  10.12  )
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
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
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
index fa447d400b71..986e0ac1f2d8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -305,16 +305,21 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
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


