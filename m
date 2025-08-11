Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20276C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9urlrOuwfpYC0uyUnrnH4VyPXMAyZOw1Pz1r7m6n6Q=; b=wd9Misnh9DqeJP3ELaeeoKiFM5
	wXGGa9LeggyEZ19Aui+6gZ1U4ulbeSWg+Y2Uxd3aNjShD+Y0OeySoH5nW7HcA4QHocL4vmgjNiys+
	i836b5XRvvYf0kduHatfZeNDMyC0iLz32Tb9Itqxr+QQaaAgla0LwjSx1LT2NbdQscIgtxA1MByQp
	W06eqZPJvYEEIIfbUAlf26kUfZi4lyIcyWItgA4sLfTUYPdwE9dWUNcg+jKQgSXBRPFTnt1pu159d
	dGLLpQbeWDy3SRmyVLlAfWkJkSfSb3Bchusz5An5+F8dUSiGvkr1UU+XsKC8MQGCNlJsP6WCep9Zf
	7LuMSXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPsk-00000007LGv-2SFx;
	Mon, 11 Aug 2025 10:35:58 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPdD-00000007InE-2cQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:57 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b785d52c19so2002812f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907594; x=1755512394; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u9urlrOuwfpYC0uyUnrnH4VyPXMAyZOw1Pz1r7m6n6Q=;
        b=0v+5MzenWh9foy+8izgHGyuZxjkdorXHwDqVoMmYPVElHRZzL+lHPFR8ysk19G818i
         asE41K37m4HieUkSaGOhVt/rMwlJD5hX5iCNuWBjj9xx54EgLcrIhmwfU//pBXXTegc5
         O+PAhsjIBEdBvhzat4jq7oPUw1/zNhZi1dh/zbfxxm7KFQhytzLEGotZ4HWygCqWqjbG
         /E3QiE6hSGkIbxPPWNB/PQjJSSmbiEbCbRyCR5EHPQjTQUhfw9ix4avKHQWQdw6sORxx
         aqBFLwnto5vOeXWBq+2Lhm7z2nNIX99RPx80mvIVuCIAVe6gGrecAXl2MEo/NoU7LUb6
         hU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907594; x=1755512394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9urlrOuwfpYC0uyUnrnH4VyPXMAyZOw1Pz1r7m6n6Q=;
        b=uLCqLS1EyKzV1t7FFJpP+UIsOKO8gWl4y04kvWTdpGkIEhKqPVGt2WRl5gsJ5GAzZX
         nMiwwL8ZKsJgMrjSVnBwhB2QB0YhKdPuRO5twPoqeEKzdc6D92ChPw698XGjCK5J6GPb
         /GsWtCDqMCDJ6RbWINC/7dXy3R8q9TDt4K/1tA/i18aVYjmkc3pSzIYewy4XaM+O9X0O
         azBdSPqZ2obFaLnTrTIr/VaEDgiHWj9LbUG7bk8RIWcHjiEYjK2GOQHTSnhfAMLqSXc5
         KA688VbKrmp37lStyt9kFFMu6uFiiUm3Ss+9H+4t2qY/XQguRdl5myQL5CQH76z4S7Nh
         j2pw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ONgJmwqg8jxWSXSsVIAi2KFjyytAgjw7jwcOiPsAOK34IYkELvd+A1d/mcKtv2n9DQ8m8WHtvF8ZgLbJnGhJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxbJrg0ndbks1bGxmutVnAMZM3AsYYME8YyZojCvzghUU83u6Dd
	Tm8fcHI032wYMKm8x7eRC2W394AXvIqWMmzqOQWYYZhrPbsZxCABhRNrgoOdcViazFZZvVtzq/+
	Heg==
X-Google-Smtp-Source: AGHT+IH03m51ayBE816Ub3cJXS+vuPgcGnbPU+wOh2WUf7Ykyc1/ideNfZdtPCPyixIk+LVkRO+tDsAjxw==
X-Received: from wrou4.prod.google.com ([2002:adf:ed44:0:b0:3b8:d821:9ad7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:18aa:b0:3a5:2257:17b4
 with SMTP id ffacd0b85a97d-3b900b6a291mr10236647f8f.55.1754907593528; Mon, 11
 Aug 2025 03:19:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:44 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-6-tabba@google.com>
Subject: [PATCH v2 5/8] KVM: arm64: Separate allocation and insertion of pKVM
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
X-CRM114-CacheID: sfid-20250811_031955_720594_8DDF47F5 
X-CRM114-Status: GOOD (  20.66  )
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
2.50.1.703.g449372360f-goog


