Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DB9C624D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSsAeCTnj7JowSArhdAWoJWpv0EUg3Eajoq0vBky2Ls=; b=b/IrMEJjij0WX2cUs0Pud+pnJy
	XkqR0ELn6nrWeQFP0KcFwPQ5/RVydFplVwTMfvAE/fmG6kwww8mmSCS4La/MaWITGjeNZWKnmwvPY
	T3wY8ORwQJnOayIDHd2m9P+nQzOEsTE4f/pMvKcW1uh5LgYx1S3pqiCWm9mTCiL785jinR64knxVp
	Gmd9j/O81gGkBGx/yKOFfXATLiP3qY67tBHt+VbzW8zz1vbNjtzPvXUfai5tvrRX04cOuqy2Jn+Vj
	kENsjGI2gPQVKp1bmZG8Ri024Xja8HuoPF9YIkUn3n2rz0X3bk1qk10DOZo0OcMr4/mBo/fHLs64H
	L1mACOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZN-0000000BD9s-2Aoc;
	Tue, 01 Sep 2026 08:10:13 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZI-0000000BCxv-2HIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:11 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so34099585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250206; x=1788855006; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSsAeCTnj7JowSArhdAWoJWpv0EUg3Eajoq0vBky2Ls=;
        b=ILWWNWKPnKBK9HWvs5wq0yeJsPz9i1Fz/g/POuIwTmlpWLp2/p280jSyfMIVDbqyC7
         kHZBkcSg/eka8CPFvJEST7A75SDePQS08sHe5jBj+qqUULqg2bQkhOHgg+QCziAy9owE
         x0K168PL/MYmcxmCBi+4NxIfwtOpuPDcFnX5LmK178UJkv34G+yEwBnztoAF0QVMYKNO
         QsTPaM8T32GFC3ip5MA6sY5rof0xQgWr79GWroUI/tLyN20l3Gcj24fSepVrjrtAsPPB
         FxbX51ra2Nv3NLtyvRAjzU46FB8reZ+t0ZVj8ZEt1qIBt1fISHnueFIKfSv6kDIrtl9O
         MoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250206; x=1788855006;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSsAeCTnj7JowSArhdAWoJWpv0EUg3Eajoq0vBky2Ls=;
        b=Hxe7gwpHCDmpF2n7wZaclVW4pxc2DAbBAXb7ZCYa3/FagDLvFn2vKUV3m9WqJ+S7Q5
         NJeGy7Ir0AwOVSQ+wnKiHXTeh02nehBWjiEpwc+OHqPdISJ3NJFRr0llAZMX4TP51yJ4
         vOyT74PekWcGupTAXihu9xLl2g/6zLew1ynHFe/4yWVnGeNDrOflB83oMpHFyo5ghzs/
         mJFIBShO6zVN6iUo/gbksZhC+ZX8c5fBhck1Yq0Vk5ZALuZs831D7Uyh0hykKGvt0Ol4
         D89SaXvJGcZ7h+ITd+qE+OPhCriYagRDPPAFqb388KusaF63cDfz+SAf+co6+Pmkm2Jl
         73Tg==
X-Forwarded-Encrypted: i=1; AHgh+RpiapSdxS+BB6B1/14OHU2qEGuOpG106jZD0iFKNtwMWgaFZaVTvWQJbxbL8C9CL4CQ85hxICreoBtxIhLZKwq0@lists.infradead.org
X-Gm-Message-State: AFuF++nvH+20/HpeZUt/LDb8xiXyEG+NbpknLxRXnfijsLfavJgYWppm
	OTvLC9qr8+J7y3RMbFdz9uP2LBnRQxMGCqT9Az7erRA8l+eJiEQ6sjn0hJwr1hgPM66De9dDIHz
	dgevk9wMYlN0uy3b0jnl8oQ==
X-Received: from wmfr22.prod.google.com ([2002:a05:600c:1596:b0:499:caa3:ae0f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0e:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49cdc40ff56mr130922965e9.4.1788250206008;
 Tue, 01 Sep 2026 01:10:06 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:38 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-16-vdonnefort@google.com>
Subject: [PATCH v5 15/18] KVM: arm64: Rename vCPU pkvm_memcache to stage2_mc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011008_629383_EBEE7E65 
X-CRM114-Status: GOOD (  14.06  )
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

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fe5364b507f9..7aaa139ac89b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -939,7 +939,7 @@ struct kvm_vcpu_arch {
 	struct kvm_mmu_memory_cache mmu_page_cache;
 
 	/* Pages to top-up the pKVM/EL2 guest pool */
-	struct kvm_hyp_memcache pkvm_memcache;
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
index bc54f477c147..fc3a624b0c4c 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -407,9 +407,9 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
 
-	return refill_memcache(&hyp_vcpu->vcpu.arch.pkvm_memcache,
-			       host_vcpu->arch.pkvm_memcache.nr_pages,
-			       &host_vcpu->arch.pkvm_memcache);
+	return refill_memcache(&hyp_vcpu->vcpu.arch.stage2_mc,
+			       host_vcpu->arch.stage2_mc.nr_pages,
+			       &host_vcpu->arch.stage2_mc);
 }
 
 static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
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
index ee2060aa1131..8a8b694ca00f 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -760,7 +760,7 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 			continue;
 		p[i].refcount = 1;
 		if (seeded < min_pages) {
-			push_hyp_memcache(&selftest_vcpu.vcpu.arch.pkvm_memcache,
+			push_hyp_memcache(&selftest_vcpu.vcpu.arch.stage2_mc,
 					  hyp_page_to_virt(&p[i]), hyp_virt_to_phys);
 			seeded++;
 		} else {
@@ -1002,7 +1002,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
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
2.55.0.897.gb25b4bd76c-goog


