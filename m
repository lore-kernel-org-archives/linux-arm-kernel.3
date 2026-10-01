Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD5CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bqnQIqqMqnbT46+V/V7VF0JnzPNPe+wlcND2x7i+9k=; b=gk9ENCaJK6zU7Ij67Z2trEPeWo
	6hlkFkzEnfJvnqO5nEafX92KwXaEnhF9eA+i5j6AVPm5l4AkwEOJvX7HyL8p8eYzZ5TYIYFiu5JL3
	LBk3EY2c8nfpKo/DFgf/O/bnb6qJJmSCx4t8LdFk1NElwQf/T62wtCDoNWYdLoFS4WNdL56EJNZeV
	oS4W+bcbNcjxTjQ40NjwZ0g91DQxWJLtbgFC6Ip7xuXkS0E8VZuv/b7mNXVZOgF3nNu/XW8cRDBmt
	dA5HI/JhFFRVNX2riPTkE0HeXcJJyh9kvgzmgC8b6Vy+Q75SeY7u8GS5EtiArG9Geh6shtPLYik/E
	lxWeVxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmj-00000009NUC-1R59;
	Thu, 01 Oct 2026 14:29:21 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHme-00000009NKh-3FAt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:19 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48589603501so4486159f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864954; x=1791469754; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bqnQIqqMqnbT46+V/V7VF0JnzPNPe+wlcND2x7i+9k=;
        b=Yza+3aoTPmK0Wtpxfn02V5S7EkmW5pl4TtqPCe2cHBHobajjqahF188SUQjwNCtrr0
         0zVf2gjA5QtILNeuiIBl2SjIGHwEduLICn/aGus+o4H0BTal5//YGgNEWNbe4dfOopU9
         Nf7002n0NUiu7rz1ypFxXlstdXtzMhb9YM+wvJbzNGrcywSoP3k9LBDIu0jDlGypH60t
         goaXco55wcRzKdziJ2DWBPrDsPWAkBrtulbWCSByI0OX9wbrAsVQk8mXqiwxmS2+thNK
         qOGmDTw+7Wmq3YDGjfh+/bWj1+n20XJklembtH1pV0PY803k+3CU6Uh5EfCSrN2A5gAv
         Vn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864954; x=1791469754;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bqnQIqqMqnbT46+V/V7VF0JnzPNPe+wlcND2x7i+9k=;
        b=ubkv7xw2oaVaw3QZd7MTItJyk7rGdIAnHlxWS/ikLVmyrC45ox7ZD76OyoqOZqiHsN
         hIL4bbSaebrFO05wmN52MJ1T4YH4zeV0YpPSSN/zgYaxuMgd1x93yDqCcb7ql1jSkUBC
         RDQi5l6QiyOshgJNyM1H/Dh+4dq7o66n4M6SNIeWStS/PvaHosKUpzMNxKfNyExPfUJY
         3UOhNK6rg0MRE9w/psfXDFcMfj2dtIengAIdYzzLjt9SjXqz3dDW93utQezbVYJVKZAD
         HQ9LOMMpksYKzGtv+A+bii7+uWtXfvLFEFz0Pyj67Ga50Dk3khLNHDQABdmv9ukTIgbJ
         30OA==
X-Forwarded-Encrypted: i=1; AKwUvBzuIp/e0IAQSr4T4K5euuqKoYA3FRuE5pQk09g3vNqIQp6ZPX21EFWwiggRtKPy8ier3DRNIzlq+XaTVH0BP7we@lists.infradead.org
X-Gm-Message-State: AFq9FYLMf2lSNMjWBrmNFe0lU+XMsSFjnOkau6hDQcd7KDEhHvKi5zU7
	+ef2sZRdi9nEGix62i6NNUK0Tly1U/Sem+F5T3J+iSACt1NvFvqST5Dd1KcNc0PK1dDuoWwPZir
	StKxXxfjBsXh67TPh0SuFbQ==
X-Received: from wrca11.prod.google.com ([2002:a5d:456b:0:b0:48b:edc:9cd6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f83:b0:488:6d58:bae3 with SMTP id ffacd0b85a97d-48b0254ff7bmr10285799f8f.41.1790864953265;
 Thu, 01 Oct 2026 07:29:13 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:44 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-14-vdonnefort@google.com>
Subject: [PATCH v6 13/18] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072916_909750_3F480CEC 
X-CRM114-Status: GOOD (  20.63  )
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

Transition the allocation of the hypervisor VM state structure
(pkvm_hyp_vm) from the host to the hypervisor using
the new pKVM heap allocator (hyp_alloc()).

Previously, the host was responsible for calculating the size of,
allocating, and donating memory for pkvm_hyp_vm during VM creation. With
the heap allocator in place, the hypervisor now allocates this structure
dynamically at EL2.

Use the pkvm_call_hyp_req() wrapper in the host to invoke
__pkvm_init_vm, which automatically handles any top-up requests if the
hypervisor runs out of heap memory during allocation.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hcall.h     |  3 +--
 arch/arm64/kvm/hyp/hyp-constants.c     |  1 -
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 32 +++++++++++++++++++++++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 25 ++++++++++----------
 arch/arm64/kvm/pkvm.c                  | 21 ++++-------------
 6 files changed, 47 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 9f09eb11193f..c98243e79e31 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -230,8 +230,7 @@ DECLARE_KVM_HOST_HCALL0(int, __pkvm_reserve_vm)
 DECLARE_KVM_HOST_HCALL(void, __pkvm_unreserve_vm,
 	pkvm_handle_t, handle)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vm,
-	struct kvm __kern *, host_kvm, void __kern *, vm_hva,
-	void __kern *, pgd_hva)
+	struct kvm __kern *, host_kvm, void __kern *, pgd_hva)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vcpu,
 	pkvm_handle_t, handle, struct kvm_vcpu __kern *, host_vcpu,
 	void __kern *, vcpu_hva)
diff --git a/arch/arm64/kvm/hyp/hyp-constants.c b/arch/arm64/kvm/hyp/hyp-constants.c
index b257a3b4bfc5..501ab35a3840 100644
--- a/arch/arm64/kvm/hyp/hyp-constants.c
+++ b/arch/arm64/kvm/hyp/hyp-constants.c
@@ -7,7 +7,6 @@
 int main(void)
 {
 	DEFINE(STRUCT_HYP_PAGE_SIZE,	sizeof(struct hyp_page));
-	DEFINE(PKVM_HYP_VM_SIZE,	sizeof(struct pkvm_hyp_vm));
 	DEFINE(PKVM_HYP_VCPU_SIZE,	sizeof(struct pkvm_hyp_vcpu));
 	return 0;
 }
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index b208544141c0..c5fd7315c0e3 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -83,8 +83,7 @@ void pkvm_hyp_vm_table_init(void *tbl);
 
 int __pkvm_reserve_vm(void);
 void __pkvm_unreserve_vm(pkvm_handle_t handle);
-int __pkvm_init_vm(struct kvm *host_kvm, void __kern *vm_hva,
-		   void __kern *pgd_hva);
+int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva);
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 		     void __kern *vcpu_hva);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a6e6c0941428..7eecac7c7fbe 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -69,6 +69,33 @@ DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 	}								\
 	static ret __do_##name(void)
 
+/*
+ * Encode a hypervisor request in the host SMCCC return registers for known
+ * error numbers.
+ *
+ * Must be paired with pkvm_call_hyp_req() on the host side.
+ */
+static int errno_to_smccc(int ret)
+{
+	struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
+
+	switch (ret) {
+	case -ENOMEM: {
+		u32 nr_pages = hyp_alloc_topup_needed();
+
+		if (nr_pages) {
+			req.type = PKVM_HYP_REQ_HYP_ALLOC;
+			req.mem.nr_pages = nr_pages;
+		}
+		break;
+	}
+	}
+
+	pkvm_hyp_req_to_smccc(host_data_ptr(host_ctxt), &req);
+
+	return ret;
+}
+
 /* Number of implemented GICv3 LRs. Used by flush_hyp_vcpu(). */
 unsigned int hyp_gicv3_nr_lr;
 
@@ -756,10 +783,9 @@ DEFINE_KVM_HOST_HCALL(void, __pkvm_unreserve_vm,
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_init_vm,
-	struct kvm __kern *, host_kvm, void __kern *, vm_hva,
-	void __kern *, pgd_hva)
+	struct kvm __kern *, host_kvm, void __kern *, pgd_hva)
 {
-	return __pkvm_init_vm(kern_hyp_va_host(host_kvm), vm_hva, pgd_hva);
+	return errno_to_smccc(__pkvm_init_vm(kern_hyp_va_host(host_kvm), pgd_hva));
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_init_vcpu,
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 98db5bd28dde..c29a25cae8e8 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -11,6 +11,7 @@
 
 #include <asm/kvm_emulate.h>
 
+#include <nvhe/alloc.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/memory.h>
 #include <nvhe/pkvm.h>
@@ -810,16 +811,13 @@ void teardown_selftest_vm(void)
  * Unmap the donated memory from the host at stage 2.
  *
  * host_kvm: A pointer to the host's struct kvm.
- * vm_hva: The host va of the area being donated for the VM state.
- *	   Must be page aligned.
  * pgd_hva: The host va of the area being donated for the stage-2 PGD for
  *	    the VM. Must be page aligned. Its size is implied by the VM's
  *	    VTCR.
  *
  * Return 0 success, negative error code on failure.
  */
-int __pkvm_init_vm(struct kvm *host_kvm, void __kern *vm_hva,
-		   void __kern *pgd_hva)
+int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva)
 {
 	struct pkvm_hyp_vm *hyp_vm = NULL;
 	size_t vm_size, pgd_size;
@@ -847,15 +845,17 @@ int __pkvm_init_vm(struct kvm *host_kvm, void __kern *vm_hva,
 	vm_size = pkvm_get_hyp_vm_size(nr_vcpus);
 	pgd_size = kvm_pgtable_stage2_pgd_size(host_mmu.arch.mmu.vtcr);
 
-	ret = -ENOMEM;
+	hyp_vm = hyp_alloc(vm_size);
+	if (!hyp_vm) {
+		ret = hyp_alloc_errno();
+		goto err_unpin_kvm;
+	}
 
-	hyp_vm = map_donated_memory(vm_hva, vm_size);
-	if (!hyp_vm)
-		goto err_remove_mappings;
+	ret = -ENOMEM;
 
 	pgd = map_donated_memory_noclear(pgd_hva, pgd_size);
 	if (!pgd)
-		goto err_remove_mappings;
+		goto err_free_hyp_vm;
 
 	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus, handle);
 
@@ -873,8 +873,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, void __kern *vm_hva,
 err_destroy_stage2:
 	kvm_guest_destroy_stage2(hyp_vm);
 err_remove_mappings:
-	unmap_donated_memory(hyp_vm, vm_size);
 	unmap_donated_memory(pgd, pgd_size);
+err_free_hyp_vm:
+	hyp_free(hyp_vm);
 err_unpin_kvm:
 	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
 	return ret;
@@ -1010,7 +1011,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	struct pkvm_hyp_vm *hyp_vm;
 	struct kvm *host_kvm;
 	unsigned int idx;
-	size_t vm_size;
 	int err;
 
 	hyp_spin_lock(&vm_table_lock);
@@ -1053,8 +1053,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 		teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
 	}
 
-	vm_size = pkvm_get_hyp_vm_size(hyp_vm->kvm.created_vcpus);
-	teardown_donated_memory(mc, hyp_vm, vm_size);
+	hyp_free(hyp_vm);
 	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
 	return 0;
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index ea96744f41fb..8505965dbfb2 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -212,8 +212,8 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
  */
 static int __pkvm_create_hyp_vm(struct kvm *kvm)
 {
-	size_t pgd_sz, hyp_vm_sz;
-	void *pgd, *hyp_vm;
+	size_t pgd_sz;
+	void *pgd;
 	int ret;
 
 	if (kvm->created_vcpus < 1)
@@ -230,28 +230,15 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 	if (!pgd)
 		return -ENOMEM;
 
-	/* Allocate memory to donate to hyp for vm and vcpu pointers. */
-	hyp_vm_sz = PAGE_ALIGN(size_add(PKVM_HYP_VM_SIZE,
-					size_mul(sizeof(void *),
-						 kvm->created_vcpus)));
-	hyp_vm = alloc_pages_exact(hyp_vm_sz, GFP_KERNEL_ACCOUNT);
-	if (!hyp_vm) {
-		ret = -ENOMEM;
-		goto free_pgd;
-	}
-
-	/* Donate the VM memory to hyp and let hyp initialize it. */
-	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
+	ret = pkvm_call_hyp_req(__pkvm_init_vm, kvm, pgd);
 	if (ret)
-		goto free_vm;
+		goto free_pgd;
 
 	kvm->arch.pkvm.is_created = true;
 	init_hyp_stage2_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
-free_vm:
-	free_pages_exact(hyp_vm, hyp_vm_sz);
 free_pgd:
 	free_pages_exact(pgd, pgd_sz);
 	return ret;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


