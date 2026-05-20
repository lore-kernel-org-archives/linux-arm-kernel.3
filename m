Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF62DCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHeEKF2lnPePtRIDEx7t4QMIhDc5F/CHK14oAcruyjE=; b=N67kcex8Zh1/O20uHJ/82bVJf0
	v4gvvReUf1sYWPQjJvR/1m9IC2aAo5wZaNAXHcpicfbJ0CxA/5h3DUzDdw/zcev66BAvRK1IAuAgP
	KcJ+mW/B9Lm/73UFW1pDkE6zwkWMN/hUzDprVFpOyin5FS98ORP+UtZ8IHQTB+2DqBPFk7KIU92JP
	tIdjfgz6MhzLoa1WV483XXWjE/BzjJbJPlt6GXPQL4l5Se3v9jQhV3quDO/PnoyhJhyH80S3i9UEo
	H5HovWtW3Okf8xMLnZNGqgAQdwS+CXEijat91QdgKYbqeYZn/acdyIBIDNEq8XxFdYWqrBbcsK0Zk
	DUVFAgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipk-00000004zLZ-0GqU;
	Wed, 20 May 2026 15:27:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipa-00000004zBR-1dyO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fdacff6d2so37767665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290852; x=1779895652; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHeEKF2lnPePtRIDEx7t4QMIhDc5F/CHK14oAcruyjE=;
        b=STZS7bxOkji5W5qs5WZ+6wLzsZNMCfdlk7XlAX6JFBRLPzsKpRb/TpGQACxLurm6IW
         stNnQEATPH3jEQ+JOvdS9GBizC/Sk0GiAAAsyt4l6APLI3IpbR6c4hZGfRgy3m2Bfe0A
         iX2M2meUx9zvCvU9iPWCRlwYfv4y359fHrICT5hYGi5jFZilLA1EMPTN38GyZAd+OBLf
         FEg0rH2avCzMN4REfVusi9DaLJjcK8sYEv93JjkzlHo+AEEwsX7HDumL/fe5Udygfjr/
         HfReUlU0gGvx2stmDyA8x2anmiNaZCjxlaPVq3tKPS0bctTqkqOvFfXcrLWcVBkZU7r8
         qUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290852; x=1779895652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHeEKF2lnPePtRIDEx7t4QMIhDc5F/CHK14oAcruyjE=;
        b=Ozv5tIWuw2995N7qeDJzNi7+jY0/JsnvELudRFlTw8ywVgaz+5N1CrCJc5QJL0jjS4
         BPE5PW7pitEO4QqR4hSxsjzbPWD0N79G833jRlraM1gFZaToJOqYpuoZKNLKC0aJntR8
         uAHVS75nQNPFfIdeJSjU2UVmgtNJTkLLLWBqjdksGSlA4JGf+MCbAmjwhOqB1wW175cc
         N1qbfefd7VvMWddwOt9e1KfffA9ChkQQbzag+YZoFOL0Ovs3OgK0RPiIy4wpqi6zfmuZ
         vTj2bAIudqfHXwphV1o2zXIkdvR4dol7FNoYKhk1FFuyDiEgYxePKRQqr7QD4r/mPUd1
         v5sw==
X-Gm-Message-State: AOJu0Yy2xxsG4zal76Hr1xhfWvcmsXEutgKUDX8F3b7l0CTNN8XbXkdL
	3mOFTIa4Q0wRxqTn+jM9vlX3Qt7CEKiAu/+8pjliLX0sHtffO3AOq6uRN1h+/1djuzqNZZHFuym
	6M/7V76/JoCKDfRT9xswS6Q==
X-Received: from wmnk6.prod.google.com ([2002:a05:600c:1686:b0:488:7c5a:b238])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc9:b0:48e:706b:53e3 with SMTP id 5b1f17b1804b1-48fe60e51eamr343615215e9.1.1779290852340;
 Wed, 20 May 2026 08:27:32 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:49 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-17-vdonnefort@google.com>
Subject: [PATCH 16/17] KVM: arm64: Alloc pkvm_hyp_vcpu using pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082734_470611_257F3FE8 
X-CRM114-Status: GOOD (  13.32  )
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

Transition the allocation of the hypervisor vCPU state structure
(pkvm_hyp_vcpu) from the host to the hypervisor using the new pKVM heap
allocator (hyp_alloc()).

Previously, the host was responsible for calculating the size of,
allocating, and donating memory for pkvm_hyp_vcpu during VM creation.
With the heap allocator in place, the hypervisor now allocates this
structure dynamically at EL2.

Use the pkvm_call_hyp_req() wrapper in the host to invoke
__pkvm_create_hyp_vcpu, which automatically handles any top-up requests
if the hypervisor runs out of heap memory during allocation.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 15c5378b70a0..d7286f2944f3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -268,7 +268,6 @@ typedef u16 pkvm_handle_t;
 
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
-	struct kvm_hyp_memcache teardown_mc;
 	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool is_protected;
 	bool is_created;
diff --git a/arch/arm64/kvm/hyp/hyp-constants.c b/arch/arm64/kvm/hyp/hyp-constants.c
index 501ab35a3840..b2caae21f271 100644
--- a/arch/arm64/kvm/hyp/hyp-constants.c
+++ b/arch/arm64/kvm/hyp/hyp-constants.c
@@ -7,6 +7,5 @@
 int main(void)
 {
 	DEFINE(STRUCT_HYP_PAGE_SIZE,	sizeof(struct hyp_page));
-	DEFINE(PKVM_HYP_VCPU_SIZE,	sizeof(struct pkvm_hyp_vcpu));
 	return 0;
 }
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 8e930c8729af..cfb6e409bf49 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -83,8 +83,7 @@ void pkvm_hyp_vm_table_init(void *tbl);
 int __pkvm_reserve_vm(void);
 void __pkvm_unreserve_vm(pkvm_handle_t handle);
 int __pkvm_init_vm(struct kvm *host_kvm, void *pgd);
-int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
-		     unsigned long vcpu_hva);
+int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu);
 
 int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
 int __pkvm_start_teardown_vm(pkvm_handle_t handle);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ebd6b5c09928..8d7e44e657eb 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -586,10 +586,9 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(struct kvm_vcpu *, host_vcpu, host_ctxt, 2);
-	DECLARE_REG(unsigned long, vcpu_hva, host_ctxt, 3);
 
 	host_vcpu = kern_hyp_va(host_vcpu);
-	cpu_reg(host_ctxt, 1) = __pkvm_init_vcpu(handle, host_vcpu, vcpu_hva);
+	errno_to_smccc(__pkvm_init_vcpu(handle, host_vcpu), host_ctxt);
 }
 
 static void handle___pkvm_vcpu_in_poison_fault(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 7405626e103a..5932e8afce3e 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -645,30 +645,6 @@ static size_t pkvm_get_hyp_vm_size(unsigned int nr_vcpus)
 		size_mul(sizeof(struct pkvm_hyp_vcpu *), nr_vcpus));
 }
 
-static void *map_donated_memory_noclear(unsigned long host_va, size_t size)
-{
-	void *va = (void *)kern_hyp_va(host_va);
-
-	if (!PAGE_ALIGNED(va))
-		return NULL;
-
-	if (__pkvm_host_donate_hyp(hyp_virt_to_pfn(va),
-				   PAGE_ALIGN(size) >> PAGE_SHIFT))
-		return NULL;
-
-	return va;
-}
-
-static void *map_donated_memory(unsigned long host_va, size_t size)
-{
-	void *va = map_donated_memory_noclear(host_va, size);
-
-	if (va)
-		memset(va, 0, size);
-
-	return va;
-}
-
 static void __unmap_donated_memory(void *va, size_t size)
 {
 	kvm_flush_dcache_to_poc(va, size);
@@ -676,15 +652,6 @@ static void __unmap_donated_memory(void *va, size_t size)
 				       PAGE_ALIGN(size) >> PAGE_SHIFT));
 }
 
-static void unmap_donated_memory(void *va, size_t size)
-{
-	if (!va)
-		return;
-
-	memset(va, 0, size);
-	__unmap_donated_memory(va, size);
-}
-
 static void unmap_donated_memory_noclear(void *va, size_t size)
 {
 	if (!va)
@@ -880,16 +847,15 @@ static int register_hyp_vcpu(struct pkvm_hyp_vm *hyp_vm,
 	return 0;
 }
 
-int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
-		     unsigned long vcpu_hva)
+int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret;
 
-	hyp_vcpu = map_donated_memory(vcpu_hva, sizeof(*hyp_vcpu));
+	hyp_vcpu = hyp_alloc(sizeof(*hyp_vcpu));
 	if (!hyp_vcpu)
-		return -ENOMEM;
+		return hyp_alloc_errno();
 
 	hyp_spin_lock(&vm_table_lock);
 
@@ -910,22 +876,10 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 	}
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
-
 	if (ret)
-		unmap_donated_memory(hyp_vcpu, sizeof(*hyp_vcpu));
-	return ret;
-}
-
-static void
-teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
-{
-	size = PAGE_ALIGN(size);
-	memset(addr, 0, size);
-
-	for (void *start = addr; start < addr + size; start += PAGE_SIZE)
-		push_hyp_memcache(mc, start, hyp_virt_to_phys);
+		hyp_free(hyp_vcpu);
 
-	unmap_donated_memory_noclear(addr, size);
+	return ret;
 }
 
 int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
@@ -977,7 +931,7 @@ int __pkvm_start_teardown_vm(pkvm_handle_t handle)
 
 int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 {
-	struct kvm_hyp_memcache *mc, *stage2_mc;
+	struct kvm_hyp_memcache *stage2_mc;
 	struct pkvm_hyp_vm *hyp_vm;
 	struct kvm *host_kvm;
 	unsigned int idx;
@@ -998,7 +952,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	hyp_spin_unlock(&vm_table_lock);
 
 	/* Reclaim guest pages (including page-table pages) */
-	mc = &host_kvm->arch.pkvm.teardown_mc;
 	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
 	reclaim_pgtable_pages(hyp_vm, stage2_mc);
 	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->kvm.created_vcpus);
@@ -1020,7 +973,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 			unmap_donated_memory_noclear(addr, PAGE_SIZE);
 		}
 
-		teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
+		hyp_free(hyp_vcpu);
 	}
 
 	hyp_free(hyp_vm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8fc2e954d382..5e389099d1b6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -178,28 +178,19 @@ static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 
 	kvm->arch.pkvm.handle = 0;
 	kvm->arch.pkvm.is_created = false;
-	free_hyp_memcache(&kvm->arch.pkvm.teardown_mc);
 	free_hyp_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 }
 
 static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 {
-	size_t hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
 	pkvm_handle_t handle = vcpu->kvm->arch.pkvm.handle;
-	void *hyp_vcpu;
 	int ret;
 
 	init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
 
-	hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
-	if (!hyp_vcpu)
-		return -ENOMEM;
-
-	ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
+	ret = pkvm_call_hyp_req(__pkvm_init_vcpu, handle, vcpu);
 	if (!ret)
 		vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);
-	else
-		free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
 
 	return ret;
 }
-- 
2.54.0.631.ge1b05301d1-goog


