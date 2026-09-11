Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53560C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HszkVWFP7Noq8WhHATPc5LOgdotiy1DdsO2MJHAL+IE=; b=q+2JVuw39lbv7pR1xoOecP5/1+
	0I1hFyIw33FmJcxHvwNRQOeeb1qF7UralvOx61O6MWxP2qE0bChFmrviK88BPBhglUwB2J5xJp8cj
	fFpchnvC5Ds4wDcYzODCj8KdgLx4+5+6a/jiOkN8pkSKldA0m2R279gM3t++3VUyexKLfLfHyiLn+
	4BC2QlpEKZkVE8FGcU1ZgNRamkx+0AA41rpmhoEHKA1AWJAFXDFelPYl/KBTu5+JIUqJZ+abPDjg+
	EIHBgSDksHSwUW3eA9Egdg0SFafGKa1ndLL+doaRozdTu0WW1FDEBnfF8ZZ1SyG6icfCmnuoJL6QF
	zCduOHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fR-0000000GoQ9-28AK;
	Fri, 11 Sep 2026 13:51:49 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51f5-0000000Go2r-2UWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:28 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so7168145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134684; x=1789739484; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HszkVWFP7Noq8WhHATPc5LOgdotiy1DdsO2MJHAL+IE=;
        b=pRh0IzYKd2CXwcdOZnrp6MA27Xq8PXtDr0egz+dQprqFY6dbEDk1R06wRS2qVy7vXP
         Oqe1FzvEZqwWJyA1bSDY2OW2YYaAu34uXgkGx25m7YQ76HGGZmrG0bOpUD+9Ao1GuolW
         p+1sDg1dUHn0QUDw8y6QTRCTV/K5DU4jYHWeSoXpxSuukBBtVSu4dfs0hRqXGkoS5DA/
         VRncC5uy8dVCppcqsGNol70Boa+vfyLx4V3dxX4yJUN9OI8KIEFdCcmm+LnH51LazJKN
         Ss1jUCve3QGW2Sk67O3QJf/DrZh/FC/bo6w3KRrLhgGBxeBPYAdQ5teE0wZtpM7vkh77
         umZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134684; x=1789739484;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HszkVWFP7Noq8WhHATPc5LOgdotiy1DdsO2MJHAL+IE=;
        b=eF8Zatirdxnw4tmnylvtsUEeCE+PZWWbJpwfOyAP5mEi3/wPuRJXTKZkE1ZNYkXHNs
         Zj24m6MqZKIeCCLyMUtbxNNlhJ1HBhyPaYTDmRQqb2ay62+DTZAMdlotdi8ho9Bfwans
         uyrk5fyDrSvLRnjXeMBIj0f3Hw2yeeIn2W9OhdbaGwRetMf3J4V3roMIG3M1aS3KpsgT
         Mbn+YmEeF9QFnvgjD2dLgRz9ZuUlGK8xi33xEJKlewbDsxcFyYu9BnDAW1euwAkrXk73
         4BdYTTmkHBhbk/jsEV/RUw1Z1vYM0DjLGukCpKmVK+lSN9HYbPvAb5Izwoz23qe7gOLG
         z2uA==
X-Forwarded-Encrypted: i=1; AKwUvBzVhLyqtBGt/We/eYN9DadLzhf6t7PQH84grbA9yPmG0Tpqr58jcFBKUO53w20L5KLs47hUL3tLmkHMjFAlSDdR@lists.infradead.org
X-Gm-Message-State: AFuF++nXxVMJGrjnqX1TqyfgjHIXFjZ+iPfTPC7Yg1SMsZn5MndMlABW
	pEioXuorp8Z9eN+DXbgO/6cII9r+aMfY0vleta1xBOLAgAv2VU7kC9RX53k9nNRG2mrR6vOhKUJ
	Pur+4PPuQLpuDJSdjNDcdOg==
X-Received: from wmnp7.prod.google.com ([2002:a05:600c:2e87:b0:495:5ec9:83bb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b02:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49e61982fb0mr51570255e9.3.1789134683428;
 Fri, 11 Sep 2026 06:51:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:49 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-19-vdonnefort@google.com>
Subject: [PATCH v2 18/22] KVM: arm64: Add __pkvm_host_split_guest HVC
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065127_702552_A52913A6 
X-CRM114-Status: GOOD (  17.29  )
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

This HVC allows the host to break an existing block in a protected VM. This
will later allow the guest to share a sub-region of an existing
huge-mapping with the host.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |   1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  22 +++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 127 ++++++++++++++++--
 4 files changed, 138 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ec59f0fe9374..a67d171c86d0 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -105,6 +105,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_split_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 7904a95ab8ac..f9604f9a92dc 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -50,6 +50,7 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_host_split_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 7ef7da69f48b..cc0e1061d584 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -540,6 +540,27 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+static void handle___pkvm_host_split_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, gfn, host_ctxt, 1);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 2);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || !pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = pkvm_refill_memcache(hyp_vcpu);
+	if (ret)
+		goto out;
+
+	ret = __pkvm_host_split_guest(gfn, nr_pages, hyp_vcpu);
+
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -958,6 +979,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
 	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
+	HANDLE_FUNC(__pkvm_host_split_guest),
 	HANDLE_FUNC(__pkvm_reserve_vm),
 	HANDLE_FUNC(__pkvm_unreserve_vm),
 	HANDLE_FUNC(__pkvm_init_vm),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2e8c241f76c9..f4943c2a237f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -578,6 +578,12 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 
 #define KVM_HOST_DONATION_PTE_OWNER_MASK	GENMASK(3, 1)
 #define KVM_HOST_DONATION_PTE_EXTRA_MASK	GENMASK(59, 4)
+static kvm_pte_t host_stage2_encode_annotation(u8 owner_id, u64 meta)
+{
+	return FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, owner_id) |
+	       FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
+}
+
 static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
 						 u8 owner_id, u64 meta)
 {
@@ -596,8 +602,7 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
 	if (!FIELD_FIT(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta))
 		return -EINVAL;
 
-	annotation = FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, owner_id) |
-		     FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
+	annotation = host_stage2_encode_annotation(owner_id, meta);
 	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
 			      addr, size, &host_s2_pool,
 			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
@@ -649,10 +654,8 @@ static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
 	       FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn);
 }
 
-static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
-				       u64 *gfn)
+static int host_stage2_decode_gfn_meta(kvm_pte_t pte, pkvm_handle_t *handle, u64 *gfn)
 {
-	pkvm_handle_t handle;
 	u64 meta;
 
 	if (WARN_ON(kvm_pte_valid(pte)))
@@ -667,17 +670,59 @@ static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
 		return -EPERM;
 
 	meta = FIELD_GET(KVM_HOST_DONATION_PTE_EXTRA_MASK, pte);
-	handle = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK, meta);
-	*vm = get_vm_by_handle(handle);
-	if (!*vm) {
-		/* We probably raced with teardown; try again */
-		return -EAGAIN;
-	}
-
+	*handle = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK, meta);
 	*gfn = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, meta);
 	return 0;
 }
 
+static int host_stage2_split_gfn_meta(phys_addr_t phys, u64 ipa, u64 size, struct pkvm_hyp_vm *vm)
+{
+	struct kvm_pgtable_mm_ops *mm_ops = &host_mmu.mm_ops;
+	struct kvm_pgtable *pgt = &host_mmu.pgt;
+	kvm_pte_t pte, *table, *ptep;
+	pkvm_handle_t handle;
+	s8 level;
+	u64 gfn;
+	int ret;
+
+	ret = kvm_pgtable_get_leaf(pgt, phys, &pte, &level);
+	if (ret)
+		return ret;
+
+	if (kvm_granule_size(level) != size)
+		return -EINVAL;
+
+	ret = host_stage2_decode_gfn_meta(pte, &handle, &gfn);
+	if (ret)
+		return ret;
+
+	if (handle != vm->kvm.arch.pkvm.handle || gfn != (ipa >> PAGE_SHIFT))
+		return -EINVAL;
+
+	table = mm_ops->zalloc_page(&host_s2_pool);
+	if (!table)
+		return -ENOMEM;
+
+	ptep = table;
+	while (ptep < table + PTRS_PER_PTE) {
+		u64 meta = host_stage2_encode_gfn_meta(vm, gfn);
+		kvm_pte_t annotation = host_stage2_encode_annotation(PKVM_ID_GUEST, meta);
+
+		*ptep = FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK, KVM_HOST_INVALID_PTE_TYPE_DONATION) |
+			annotation;
+
+		mm_ops->get_page(ptep);
+		ptep++;
+		gfn++;
+	}
+
+	ret = kvm_pgtable_stage2_table_install(pgt, phys, size, table);
+	if (ret)
+		kvm_pgtable_stage2_free_unlinked(mm_ops, table, level);
+
+	return ret;
+}
+
 static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
 {
 	/*
@@ -1328,6 +1373,7 @@ static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_h
 				      u64 *gfn)
 {
 	enum pkvm_page_state state;
+	pkvm_handle_t handle;
 	kvm_pte_t pte;
 	s8 level;
 	int ret;
@@ -1356,10 +1402,16 @@ static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_h
 	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
 		return -E2BIG;
 
-	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
+	ret = host_stage2_decode_gfn_meta(pte, &handle, gfn);
 	if (ret)
 		return ret;
 
+	*vm = get_vm_by_handle(handle);
+	if (!*vm) {
+		/* We probably raced with teardown; try again */
+		return -EAGAIN;
+	}
+
 	*size = kvm_granule_size(level);
 
 	return 0;
@@ -1755,6 +1807,55 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	return 0;
 }
 
+int __pkvm_host_split_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct kvm_hyp_memcache *mc = &vcpu->vcpu.arch.pkvm_memcache;
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 size = nr_pages << PAGE_SHIFT;
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	kvm_pte_t pte, *table;
+	phys_addr_t phys;
+	s8 level;
+	int ret;
+
+	if (!vcpu->vcpu.arch.pkvm_memcache.nr_pages)
+		return -ENOMEM;
+
+	if (size != PMD_SIZE || !IS_ALIGNED(ipa, PMD_SIZE))
+		return -EINVAL;
+
+	level = KVM_PGTABLE_LAST_LEVEL - 1;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
+	if (ret)
+		goto unlock;
+
+	table = kvm_pgtable_stage2_create_unlinked(&vm->pgt, kvm_pte_to_phys(pte), level,
+						   kvm_pgtable_stage2_pte_prot(pte),
+						   mc, true);
+	if (IS_ERR(table)) {
+		ret = PTR_ERR(table);
+		goto unlock;
+	}
+
+	ret = host_stage2_split_gfn_meta(phys, ipa, size, vm);
+	if (ret) {
+		kvm_pgtable_stage2_free_unlinked(&vm->mm_ops, table, level);
+		goto unlock;
+	}
+
+	WARN_ON(kvm_pgtable_stage2_table_install(&vm->pgt, ipa, size, table));
+
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
+
 #ifdef CONFIG_NVHE_EL2_DEBUG
 struct pkvm_expected_state {
 	enum pkvm_page_state host;
-- 
2.55.0.1007.g17ff1f9808-goog


