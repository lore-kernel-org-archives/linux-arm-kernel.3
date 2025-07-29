Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D150C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiFlDju6zyHaKAxwihJ7iowwkY2Ht9KG+A4iKs05oDQ=; b=RDCzO0y1O6YJBRnkpjqLCNC+Yf
	j1InZXNkyGeaBMM5t8OGRjxpRvkL8p+SgL1UP/GGnibsDpdFkahr4/qLqmDl1cqiP+TJdg5WGRwjM
	1XUntbQQpFd/er947Fu9rIwXDgV2A7Y7iCcJh9y6sbBOgA4cXUzGB6ta2BjN0cpAcEMB+zdZoaewH
	YCw0B8bVaI9+XHBCrJTdHAJ7Vm8uD8n1d6lf3WwUCa3eljHjugOFHK0Ql3AHpCrDWyjuczaSifx+K
	o00C82KAj6rBsEUIOd7JBLYaARNtpgdZ46WYhQ4VXNFFfdaymbhRZ4zd/jbDFXA6rYSBBaexA35ET
	3ZwCjMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjEp-0000000GhXH-1hnP;
	Tue, 29 Jul 2025 12:15:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0H-0000000GfwM-42RR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4588cfda8b6so6964215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790420; x=1754395220; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiFlDju6zyHaKAxwihJ7iowwkY2Ht9KG+A4iKs05oDQ=;
        b=P9cMnh7nP1hSeM583Mt7efpgFRIAItWVSVhgJ+LqBdR+9bX1VUFe4S48G5DsTwdPLv
         nyEpaOHz+aalFbinN7M/Ytd2psDvTvI+u3SellI6s9HkjF4AQpNaWCnmWM7G/kMcuwPj
         E5KihANTRr5TO3AbYrFj4KD9Dlp4Wkz/NOllIclMlzl0MYHTNSOWgvCvwNSK64wNoRgh
         jhbaLOvRQ82WxSzzHhPjGYpqrHXokpt9ykdMO4CuGzYvx8JTJc9G+eFSsyUdtswVVBC5
         olSomakuQ4lieXeCodHFUC+p6rZ/VA3slDxuZ+RoRVxJVRTMllz2Zqn6cgYTAxzxHxPE
         FH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790420; x=1754395220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiFlDju6zyHaKAxwihJ7iowwkY2Ht9KG+A4iKs05oDQ=;
        b=ComggihlNxiZJ+HbS7r3D6UAmHiC9JwMkjwOfMAVn3nRFtKVSuIChS0krRwHVDgFrn
         O2qvvGtq0DOYGEZTNEuKyYOhrtdxTHy3tpauGjW/rjcUqUeb2r/INGdcO8whYhCiYoSs
         SQmoXeYw8208Q7xeGNXEBBrcVfsc44pMQfT4z4hOsF0ktCHGP/C61Mx/13BbCsB72Ex1
         k3v32PoWQcNOPhmn9kArymoJYfVQeinPBigNMb/f5mJPygUDt6kZlldN8U3nbagmxtIA
         0FebxPtkka05dV5PE8UjTITlGosAi09zuDXKCdwFTWLnNmTj+EX1Uk5iEeIYm0hcQv/7
         d4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJXapUIEugm1PgilM2zUJDXsfwVztB5WS15LJgfgjXgNuRkT/bqxjT1qLQWiAK8SI4jqphlkxbUCC44ZS38yoK@lists.infradead.org
X-Gm-Message-State: AOJu0YxLapyXV2mEjzabb2TtsjhXyrWx1AnngrVy8bhegIC1Ogy3XDzo
	HwB2uOizj72v6wctRD4vnRF2G71c+0sG9baYdsjaudW6+ACtD+oKvtkSGZABeEYB9S+qA/FtHL9
	Eaw==
X-Google-Smtp-Source: AGHT+IElS4MpP08Tme30k/8QQBtYX8Ukar2Q+S9Sok/Bv77P5UW9cBGFUS/j7P9rFXKjF9pDKUkQHzmBAA==
X-Received: from wrur18.prod.google.com ([2002:a05:6000:1b92:b0:3a3:6eeb:2a27])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:26c1:b0:3b5:e714:9770
 with SMTP id ffacd0b85a97d-3b776733877mr11735997f8f.14.1753790419878; Tue, 29
 Jul 2025 05:00:19 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:10 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-6-tabba@google.com>
Subject: [PATCH v1 5/8] KVM: arm64: Separate allocation and insertion of pKVM
 VM table entries
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050022_007631_B96A8BB9 
X-CRM114-Status: GOOD (  20.48  )
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
index 969f6b293234..ea9df0b079f1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -192,6 +192,11 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
  */
 #define HANDLE_OFFSET 0x1000
 
+/*
+ * Marks a reserved but not yet used entry in the VM table.
+ */
+#define RESERVED_ENTRY ((void *) 0xa110ca7ed)
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
2.50.1.487.gc89ff58d15-goog


