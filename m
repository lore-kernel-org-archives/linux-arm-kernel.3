Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40654CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBlatNZogSVtHgRUtoqflxLkmp73EbTbckKY3UHYcxQ=; b=3YsmViJmauEX1BzY4WaW/HXtHG
	BbE5S0k2m43QChE35ikCs1y8qcSz31SbjtRSarI3mQ0qDWu8KQDQ1AGxHLUmliAmdIZHntV1nBYbh
	ywt4aXU7A5+ZvGx9kXlP1KMdedBs12x3lMoT7RzHiDR0iNH2lXqp0eOy1ymafP4d0SQ4v7tDYNBBU
	5nbKN+nOoIe8QI6Cxfv4pZOe7QEJS2wjhPPW7epu3RKV7+5z0cUxMDxgx0AuAn6RBijQDvDggUozK
	i75riGEmaEWA7M0Omb02MGKICbP90qX89PRLH8bJdQDGP2mpF0XqOjb4pk9jn4m2wTNg1lA0yT71p
	mNPKaIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSW-00000005t12-0Ojs;
	Tue, 09 Sep 2025 09:16:16 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsib-000000058wR-1azU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:46 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b04271cfc88so358799666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402683; x=1758007483; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HBlatNZogSVtHgRUtoqflxLkmp73EbTbckKY3UHYcxQ=;
        b=1DiKgh6IRFUgoRZwFMuv8HX5vBm3wiDbdMaOMdrXKeAI9Z/mbj91Io03bLkMfbrH+Q
         0t8lQhfFNbzQcwV4ebzhTSgWs5vibTYVGjn9jaJzoeJZAmbv7t97AMQ764IEG3CLLLuN
         Tvwc0iQVISbAprAWfHFFW8JaNuvX0XInkCfVjVdXOUmfJynWEHbF3MhypP+bmqsWqvhG
         +zG1B9kEajL4ld72UOVBF/Rz1E4O4wZLE5Abp7XDCixsOR5WBdxXu1XaneiH+Dnnf4SE
         HZ52m1QQXTQBZ3WKR57j9JuX+7kYCjdnxif60iytCablip1BhCTucxQoyQh5CUmiNIZB
         6olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402683; x=1758007483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBlatNZogSVtHgRUtoqflxLkmp73EbTbckKY3UHYcxQ=;
        b=FJLyEitPRb+2QPWXguv4UXuS1oXQC49xDURrd82ORRrjs8UZjW/TZ9Rt7Nk1frGjEY
         Pv8GjS3GVXxk0WDkZH0/i5gLmTqqBF0yX8MK+obYBKhos/lV2H7euY9A/8cPhvKFPeRU
         UW2j9+VhTVj1K9X3wHeGJ7ZmzqzB0ZJxzEcgEizWCHQS1rCxUxSUnFeUa+Pzl0T/xPaK
         Fz4QKNWlgb2YfPBssYUrc606NVYXbXd71bG0a9ccdLK6aDDx0I8JYaRbxjGjGFGFNsKo
         S8k80BBEVdn83TKO4HJJ/bhFC51KQiTEXCAa3zHVsYyYE7ZSsWgkrJkcu8ImLbHr7l5Z
         4KYg==
X-Forwarded-Encrypted: i=1; AJvYcCWd0r7BnvoYZIRdnsAQbc2nfSDhGV5qS4eKchPKxTU57FHBsXKJNQuBqo2rWHitVGnoRRwVFd5nYgrWsVi6EJl7@lists.infradead.org
X-Gm-Message-State: AOJu0YyaTSdcXD3aqjY1JSPKoZ7l2+S7r7qkIuLIq0C6tny99jq2+WME
	Km+jiLdtx5Ee9NRpMjw5sLSVRUw679tUu2Vprz6ewOymfE3M1zFrUtiqU4mX/bc05jKnBszeFNK
	agw==
X-Google-Smtp-Source: AGHT+IET6bM6myhOi9tNma3d70x70a1N88PiYCS8MHYHbKBvpAalmvpkEEEA/7N6Lbh2UFnO+rE1yFkjDA==
X-Received: from ejcty8.prod.google.com ([2002:a17:907:c708:b0:b03:84d5:ce15])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:26c7:b0:b04:33a1:7f14
 with SMTP id a640c23a62f3a-b04b1666d4fmr971382466b.35.1757402683174; Tue, 09
 Sep 2025 00:24:43 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:33 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-7-tabba@google.com>
Subject: [PATCH v4 6/9] KVM: arm64: Separate allocation and insertion of pKVM
 VM table entries
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002445_426634_D6B05450 
X-CRM114-Status: GOOD (  20.97  )
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

The current insert_vm_table_entry() function performs two actions at
once: it finds a free slot in the pKVM VM table and populates it with
the pkvm_hyp_vm pointer.

Refactor this function as a preparatory step for future work that will
require reserving a VM slot and its corresponding handle earlier in the
VM lifecycle, before the pkvm_hyp_vm structure is initialized and ready
to be inserted.

Split the function into a two-phase process:

- A new allocate_vm_table_entry() function finds an empty slot, marks it
  as reserved with a RESERVED_ENTRY placeholder, and returns a handle
  derived from the slot's index.

- The insert_vm_table_entry() function is repurposed to take the handle,
  validate that the corresponding slot is in the reserved state, and
  then populate it with the pkvm_hyp_vm pointer.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 52 ++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 969f6b293234..64b760d30d05 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -192,6 +192,11 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
  */
 #define HANDLE_OFFSET 0x1000
 
+/*
+ * Marks a reserved but not yet used entry in the VM table.
+ */
+#define RESERVED_ENTRY ((void *)0xa110ca7ed)
+
 static unsigned int vm_handle_to_idx(pkvm_handle_t handle)
 {
 	return handle - HANDLE_OFFSET;
@@ -231,6 +236,10 @@ static struct pkvm_hyp_vm *get_vm_by_handle(pkvm_handle_t handle)
 	if (unlikely(idx >= KVM_MAX_PVMS))
 		return NULL;
 
+	/* A reserved entry doesn't represent an initialized VM. */
+	if (unlikely(vm_table[idx] == RESERVED_ENTRY))
+		return NULL;
+
 	return vm_table[idx];
 }
 
@@ -481,7 +490,7 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	return ret;
 }
 
-static int find_free_vm_table_entry(struct kvm *host_kvm)
+static int find_free_vm_table_entry(void)
 {
 	int i;
 
@@ -494,15 +503,13 @@ static int find_free_vm_table_entry(struct kvm *host_kvm)
 }
 
 /*
- * Allocate a VM table entry and insert a pointer to the new vm.
+ * Reserve a VM table entry.
  *
  * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
-static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
-					   struct pkvm_hyp_vm *hyp_vm)
+static int allocate_vm_table_entry(void)
 {
-	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
 	int idx;
 
 	hyp_assert_lock_held(&vm_table_lock);
@@ -515,10 +522,30 @@ static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
 	if (unlikely(!vm_table))
 		return -EINVAL;
 
-	idx = find_free_vm_table_entry(host_kvm);
-	if (idx < 0)
+	idx = find_free_vm_table_entry();
+	if (unlikely(idx < 0))
 		return idx;
 
+	vm_table[idx] = RESERVED_ENTRY;
+
+	return idx;
+}
+
+/*
+ * Insert a pointer to the new VM into the VM table.
+ *
+ * Return 0 on success, or negative error code on failure.
+ */
+static int insert_vm_table_entry(struct kvm *host_kvm,
+				 struct pkvm_hyp_vm *hyp_vm,
+				 pkvm_handle_t handle)
+{
+	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
+	unsigned int idx;
+
+	hyp_assert_lock_held(&vm_table_lock);
+
+	idx = vm_handle_to_idx(handle);
 	hyp_vm->kvm.arch.pkvm.handle = idx_to_vm_handle(idx);
 
 	/* VMID 0 is reserved for the host */
@@ -528,7 +555,7 @@ static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
 	mmu->pgt = &hyp_vm->pgt;
 
 	vm_table[idx] = hyp_vm;
-	return hyp_vm->kvm.arch.pkvm.handle;
+	return 0;
 }
 
 /*
@@ -614,6 +641,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	struct pkvm_hyp_vm *hyp_vm = NULL;
 	size_t vm_size, pgd_size;
 	unsigned int nr_vcpus;
+	pkvm_handle_t handle;
 	void *pgd = NULL;
 	int ret;
 
@@ -643,10 +671,16 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus);
 
 	hyp_spin_lock(&vm_table_lock);
-	ret = insert_vm_table_entry(host_kvm, hyp_vm);
+	ret = allocate_vm_table_entry();
 	if (ret < 0)
 		goto err_unlock;
 
+	handle = idx_to_vm_handle(ret);
+
+	ret = insert_vm_table_entry(host_kvm, hyp_vm, handle);
+	if (ret)
+		goto err_unlock;
+
 	ret = kvm_guest_prepare_stage2(hyp_vm, pgd);
 	if (ret)
 		goto err_remove_vm_table_entry;
-- 
2.51.0.384.g4c02a37b29-goog


