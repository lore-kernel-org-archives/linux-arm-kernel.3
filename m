Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E12CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbNyTfmEUsMI7X9xHV6bnMQSPZF042c57U4JdGGTHOY=; b=SOfJtt0BKHkq5U42cR5UE7vBNm
	LhV6DufzW2G0KDhUQalqBW4RWbXd0f9pxu2LHhU+PxAisi15+JwAF51bU0L1EA8MuLPqiy227cf1e
	lvyfmOUeN4OGjdz/8GnvXEVYtbpwsC06evJ+zIStS1ehbZwf+2M1VujC6/7LZQ1DkyvHIvdVspAKn
	Nmef8go7iWndWI1VMlRBXHOUJxSeHahnXxqwtn3OFmgApx5IGXrn9RXWcSpf8pYgyEJKWunpeaEL5
	+ut+h89BcZe7oKbnE7fXIt3oV1UtQ6VaKRu7CX9Y5wQGeSrNbmIeBU6uTpjOYKZMvXwyeXyWaTMWz
	5NKEVjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmp-00000009Nbu-0tuV;
	Thu, 01 Oct 2026 14:29:27 +0000
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmi-00000009NPD-0Cvp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:22 +0000
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso63004065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864956; x=1791469756; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbNyTfmEUsMI7X9xHV6bnMQSPZF042c57U4JdGGTHOY=;
        b=O0P5IGYPaC94nr2ow8WqljvsO91z4V4FNPdQauRZmJ8mDU4gOwbln0mjJvMwusiwZf
         0Tn18UNoBane0goawYom85DWkzO3hX2BRrjPVGgakSh/32rFijszHHpvbPa2HsjYr1mI
         y89JcOWoSaHaBzdTI5+cYQ0EUEy1yBdkaq7cGYV/ox/TphmXTO2lbfFiloCWM6e662B9
         mWM5bpdoO2dUEigvNttJaVh74/oaFOqWbHFf2LBL2tb1hZPFNbbHVC9n79KdWUsgMEHn
         A6AkxHAmXeO90WOvpm/51MxRxHO0Bp4u9arW1BSwaKM1+4YD+tKLRidmKgIYwfIYeJS+
         dTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864956; x=1791469756;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbNyTfmEUsMI7X9xHV6bnMQSPZF042c57U4JdGGTHOY=;
        b=1NrhixjP7eUjZ8CUOPSQuzYmUILcd2fcH3Rv8LJ7/tnhOrS6ZuDxzaHHrVtklN10Z+
         X8AgWWwO7MAxFA3f9jiDaufgLpf6Am6cqOXUJISTa2drQsEMoSQDgJUkgjsq4hfKqn4V
         fPWcqKXwamIGHYFlUXAPGp56muGVsvwRWlDptP35/X4+h5ukgo7kle6hhHmjbC9ztJzD
         Zb4FUYwPKdr585m6IKVbXezdXKOn8n3SSze0cokNdI0k5fKdGWAcFVkde9nkPRYWy3v2
         etVbffK07qOyXmqVis/s0N/RksUVg8FjWPGaMgGd3VKRApiqCZ/z4vofkH+MURup9QAK
         uicw==
X-Forwarded-Encrypted: i=1; AKwUvBwDtYG72NVaJHtI+24vEqp7BzDHFshXxtLdW5LJ/IZdrPxTz2eAQLu5fjD6G044RXTaVZdOGaZuGidVoOD59V35@lists.infradead.org
X-Gm-Message-State: AFuF++lWXXVTVwwM/e7gG0zwWhcIPDsqRLh82JLmkyrs8yRzbiynvA0Z
	sG88jc9zSYJ8AOPMxp/u36+7ZoGi+svSTY9xr/5puyY2yE/NipAqbr3BXjoPmu+3SwD7mxHTX03
	s7OWEftoijdNhkDt+t9bUUA==
X-Received: from wmdv11.prod.google.com ([2002:a05:600c:12cb:b0:4a0:2a5:ce1a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6990:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a01fb931e2mr46156775e9.14.1790864955622;
 Thu, 01 Oct 2026 07:29:15 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:46 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-16-vdonnefort@google.com>
Subject: [PATCH v6 15/18] KVM: arm64: Rename vCPU pkvm_memcache to stage2_mc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072920_152780_600ED738 
X-CRM114-Status: GOOD (  18.34  )
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

With the introduction of the pKVM hyp allocator, the memcache for vCPUs
is now only used for carrying pages dedicated to the stage-2 page tables.
Rename pkvm_memcache to stage2_mc to reflect its purpose.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h     |  4 ++--
 arch/arm64/kvm/arm.c                  |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c    |  6 +++---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 10 +++++-----
 arch/arm64/kvm/hyp/nvhe/pkvm.c        |  6 +++---
 arch/arm64/kvm/mmu.c                  |  2 +-
 arch/arm64/kvm/pkvm.c                 |  2 +-
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3cca9f3b2eeb..0c4498a2f30d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -937,8 +937,8 @@ struct kvm_vcpu_arch {
 	/* Cache some mmu pages needed inside spinlock regions */
 	struct kvm_mmu_memory_cache mmu_page_cache;
 
-	/* Pages to top-up the pKVM/EL2 guest pool */
-	struct kvm_hyp_memcache pkvm_memcache;
+	/* Pages to top-up the pKVM/EL2 guest stage-2 pool */
+	struct kvm_hyp_memcache stage2_mc;
 
 	/* Virtual SError ESR to restore when HCR_EL2.VSE is set */
 	u64 vsesr_el2;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 09ae5431ce58..fa77abf8cff6 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -591,7 +591,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	if (!is_protected_kvm_enabled())
 		kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 	else
-		free_hyp_memcache(&vcpu->arch.pkvm_memcache);
+		free_hyp_memcache(&vcpu->arch.stage2_mc);
 	kvm_timer_vcpu_terminate(vcpu);
 	kvm_pmu_vcpu_destroy(vcpu);
 	kvm_vgic_vcpu_destroy(vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 281d1359606a..af348e008f52 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -464,9 +464,9 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
 
-	return refill_memcache(&hyp_vcpu->vcpu.arch.pkvm_memcache,
-			       host_vcpu->arch.pkvm_memcache.nr_pages,
-			       &host_vcpu->arch.pkvm_memcache);
+	return refill_memcache(&hyp_vcpu->vcpu.arch.stage2_mc,
+			       host_vcpu->arch.stage2_mc.nr_pages,
+			       &host_vcpu->arch.stage2_mc);
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 39aa8911f62c..dadd48431036 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1023,7 +1023,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	ret = 0;
 	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+				       &vcpu->vcpu.arch.stage2_mc, 0));
 	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
 unlock:
 	guest_unlock_component(vm);
@@ -1058,7 +1058,7 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 						      PKVM_ID_GUEST, meta));
 	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+				       &vcpu->vcpu.arch.stage2_mc, 0));
 unlock:
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1422,7 +1422,7 @@ static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
-	if (vcpu->vcpu.arch.pkvm_memcache.nr_pages < kvm_mmu_cache_min_pages(vm->pgt.mmu))
+	if (vcpu->vcpu.arch.stage2_mc.nr_pages < kvm_mmu_cache_min_pages(vm->pgt.mmu))
 		return -ENOMEM;
 
 	return 0;
@@ -1456,7 +1456,7 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 						      PKVM_ID_GUEST, meta));
 	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+				       &vcpu->vcpu.arch.stage2_mc, 0));
 
 unlock:
 	guest_unlock_component(vm);
@@ -1527,7 +1527,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 
 	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+				       &vcpu->vcpu.arch.stage2_mc, 0));
 
 unlock:
 	guest_unlock_component(vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 5031ef9e6fe9..599488b6d124 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -774,7 +774,7 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 			continue;
 		p[i].refcount = 1;
 		if (seeded < min_pages) {
-			push_hyp_memcache(&selftest_vcpu.vcpu.arch.pkvm_memcache,
+			push_hyp_memcache(&selftest_vcpu.vcpu.arch.stage2_mc,
 					  hyp_page_to_virt(&p[i]), hyp_virt_to_phys);
 			seeded++;
 		} else {
@@ -1009,7 +1009,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	reclaim_pgtable_pages(hyp_vm, stage2_mc);
 	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->kvm.created_vcpus);
 
-	/* Push the metadata pages to the teardown memcache */
+	/* Push the stage-2 pages to the teardown memcache */
 	for (idx = 0; idx < hyp_vm->kvm.created_vcpus; ++idx) {
 		struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vm->vcpus[idx];
 		struct kvm_hyp_memcache *vcpu_mc;
@@ -1017,7 +1017,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 		if (!hyp_vcpu)
 			continue;
 
-		vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
+		vcpu_mc = &hyp_vcpu->vcpu.arch.stage2_mc;
 
 		while (vcpu_mc->nr_pages) {
 			void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 3163502cc7d2..afde0894ab15 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1553,7 +1553,7 @@ static void *get_mmu_memcache(struct kvm_vcpu *vcpu)
 	if (!is_protected_kvm_enabled())
 		return &vcpu->arch.mmu_page_cache;
 	else
-		return &vcpu->arch.pkvm_memcache;
+		return &vcpu->arch.stage2_mc;
 }
 
 static int topup_mmu_memcache(struct kvm_vcpu *vcpu, void *memcache)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 36e677e51f7d..83e18c0e30b5 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -182,7 +182,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	pkvm_handle_t handle = vcpu->kvm->arch.pkvm.handle;
 	int ret;
 
-	init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
+	init_hyp_stage2_memcache(&vcpu->arch.stage2_mc);
 
 	ret = pkvm_call_hyp_req(__pkvm_init_vcpu, handle, vcpu);
 	if (!ret)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


