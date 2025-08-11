Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926AEC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRLA9pRzTbDwXC6FM9b3f4CLrD1Kf3l8+kFNoeqL9OE=; b=OwdHieA/KRTK7kUUUrwJZVAW1N
	F2At3cID+lnC6NY8YwmaO2Wex+NRlN4yb0LAqsqCP4UvWZ9O4wz9wTJ7JfcLCYctbuCzAp+kM8NB/
	Noq1RITPE7fCwc9TK9r8+C8VHpgxOWF5zd2CZXufcZjpQkbxCj7aRd+t2UpgMsSKK/d0CYeGDctBL
	JxvWxwtUE9FJrqqJNuTrUX4X56I45UP/LQXToZiBSLmT4RHVyKJlStEUOwFpw448x3JESt+O8UUhE
	0RFJ3wa8VwtDLsXGT40gNAzwQO9V4Cua+tRhbHtcbIstuIBGM6is0D6sj8Iuechnvng0ncqr86k36
	FidGSLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPvL-00000007LzT-1cyM;
	Mon, 11 Aug 2025 10:38:39 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPdE-00000007Inf-49hZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:58 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b78c983014so2809449f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907595; x=1755512395; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mRLA9pRzTbDwXC6FM9b3f4CLrD1Kf3l8+kFNoeqL9OE=;
        b=cKiYl3cNhRV2hIHQmV5E3sHSvFvGaUnxpYm/GZoVuG8veJYITkDFitqjOn7sSzu7KJ
         gqSLW0dg6yO2Oxp0qu5Ge1XkRZtdvIz/e6JbZP3ydjdjjQ9vUiO92k6OYOYEydFLsHBS
         297e8zBJf1C2N7nekkzU0GKwRPFSzDrch4Hq5Tj0c5n6q4LHM5nSQ+auMbUtZYHHyS29
         3D7ayKrD+UKtU+YzWVjNts5LMdKP8F303f5ExXqBTpROD/S28zV5i1qnPoP9FJXXsy8T
         9k0KEmjhJzM3qhqF+0gjwOMnzzEzfON0S32Fjj7zAww7UR4HyxFvUj/AR1ciPZ3ctiwf
         R96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907595; x=1755512395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRLA9pRzTbDwXC6FM9b3f4CLrD1Kf3l8+kFNoeqL9OE=;
        b=otU25kB5qpUnDKS4n0ZTFNvVtLShmJqqSWpi2gQG6cUbkU0amOaX1YamMYtx4iMz9i
         yzpdvAcpcKHoUFUdM0Vhz0WBBDBjy7vFugT+LBsFJD/nKuG53gUxjlm2hxN1MYQmfmK2
         s3dqOlZ55nv/BKgDYvZ8ftzQLv0wPjNE7JHGgL565/q59EENLa0y27CZkhV9paCCNWj5
         9EgLDJPcRRqOjFyLHA08ezPmRFj9RhFn4izjTNmJFyzEtpB36qRZYe/2FPYIrB+/Vet8
         6dkYQaIVn+JjCHdrZUQhotCst8S5TmcX4//3wlotSlpLoTE5QHuWjYn4l+pFO4J1S2wI
         necA==
X-Forwarded-Encrypted: i=1; AJvYcCUfF5pF8C2euFzPcddEd3BIGDw8qv1pOaffBgvYMW6Vm5VNPPEHrs0Z6o8PN6uIf7AN44iH5533CmFIiEX7dSM8@lists.infradead.org
X-Gm-Message-State: AOJu0YwpFm4oqM0sUiG8VqkBylzgUns2gmeMjTWHhWvsvTlLp3on4X22
	84uWmLdFPFlBiRjVABp8PmBQWUGQqrkmH7X1w4LALSoTstc59A71Fn79zA9G16kPBlJzUwIRToH
	/yA==
X-Google-Smtp-Source: AGHT+IGa2oIGCioP6NpFjMeI/uX3zO4PAyCBOwSdx0TBdpxIs1WyiO4ChzT9I2fwrMZgmJhhOZOCVvpKOg==
X-Received: from wmbji6.prod.google.com ([2002:a05:600c:a346:b0:456:1ad9:a23a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c03:b0:3b7:8832:fde5
 with SMTP id ffacd0b85a97d-3b900b4d7f2mr8972945f8f.13.1754907594661; Mon, 11
 Aug 2025 03:19:54 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:45 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-7-tabba@google.com>
Subject: [PATCH v2 6/8] KVM: arm64: Consolidate pKVM hypervisor VM
 initialization logic
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031957_093307_3FFC0EC3 
X-CRM114-Status: GOOD (  19.48  )
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

The insert_vm_table_entry() function was performing tasks beyond its
primary responsibility. In addition to inserting a VM pointer into the
vm_table, it was also initializing several fields within 'struct
pkvm_hyp_vm', such as the VMID and stage-2 MMU pointers. This mixing of
concerns made the code harder to follow.

As another preparatory step towards allowing a VM table entry to be
reserved before the VM is fully created, this logic must be cleaned up.
By separating table insertion from state initialization, we can control
the timing of the initialization step more precisely in subsequent
patches.

Refactor the code to consolidate all initialization logic into
init_pkvm_hyp_vm():

- Move the initialization of the handle, VMID, and MMU fields from
  insert_vm_table_entry() to init_pkvm_hyp_vm().

- Simplify insert_vm_table_entry() to perform only one action: placing
  the provided pkvm_hyp_vm pointer into the vm_table.

- Update the calling sequence in __pkvm_init_vm() to first allocate an
  entry in the VM table, initialize the VM, and then insert the VM into
  the VM table. This is all protected by the vm_table_lock for now.
  Subsequent patches will adjust the sequence and not hold the
  vm_table_lock while initializing the VM at the hypervisor
  (init_pkvm_hyp_vm()).

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 47 +++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 64b760d30d05..a9abbeb530f0 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -410,15 +410,26 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
 }
 
 static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
-			     unsigned int nr_vcpus)
+			     unsigned int nr_vcpus, pkvm_handle_t handle)
 {
+	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
+	int idx = vm_handle_to_idx(handle);
+
+	hyp_vm->kvm.arch.pkvm.handle = handle;
+
 	hyp_vm->host_kvm = host_kvm;
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
-	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
 	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
 	hyp_vm->kvm.arch.pkvm.is_created = true;
 	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
+
+	/* VMID 0 is reserved for the host */
+	atomic64_set(&mmu->vmid.id, idx + 1);
+
+	mmu->vtcr = host_mmu.arch.mmu.vtcr;
+	mmu->arch = &hyp_vm->kvm.arch;
+	mmu->pgt = &hyp_vm->pgt;
 }
 
 static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *host_vcpu)
@@ -532,29 +543,19 @@ static int allocate_vm_table_entry(void)
 }
 
 /*
- * Insert a pointer to the new VM into the VM table.
+ * Insert a pointer to the initialized VM into the VM table.
  *
  * Return 0 on success, or negative error code on failure.
  */
-static int insert_vm_table_entry(struct kvm *host_kvm,
-				 struct pkvm_hyp_vm *hyp_vm,
-				 pkvm_handle_t handle)
+static int insert_vm_table_entry(pkvm_handle_t handle,
+				 struct pkvm_hyp_vm *hyp_vm)
 {
-	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
 	unsigned int idx;
 
 	hyp_assert_lock_held(&vm_table_lock);
-
 	idx = vm_handle_to_idx(handle);
-	hyp_vm->kvm.arch.pkvm.handle = idx_to_vm_handle(idx);
-
-	/* VMID 0 is reserved for the host */
-	atomic64_set(&mmu->vmid.id, idx + 1);
-
-	mmu->arch = &hyp_vm->kvm.arch;
-	mmu->pgt = &hyp_vm->pgt;
-
 	vm_table[idx] = hyp_vm;
+
 	return 0;
 }
 
@@ -668,8 +669,6 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	if (!pgd)
 		goto err_remove_mappings;
 
-	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus);
-
 	hyp_spin_lock(&vm_table_lock);
 	ret = allocate_vm_table_entry();
 	if (ret < 0)
@@ -677,19 +676,21 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 
 	handle = idx_to_vm_handle(ret);
 
-	ret = insert_vm_table_entry(host_kvm, hyp_vm, handle);
-	if (ret)
-		goto err_unlock;
+	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus, handle);
 
 	ret = kvm_guest_prepare_stage2(hyp_vm, pgd);
+	if (ret)
+		goto err_remove_vm_table_entry;
+
+	ret = insert_vm_table_entry(handle, hyp_vm);
 	if (ret)
 		goto err_remove_vm_table_entry;
 	hyp_spin_unlock(&vm_table_lock);
 
-	return hyp_vm->kvm.arch.pkvm.handle;
+	return handle;
 
 err_remove_vm_table_entry:
-	remove_vm_table_entry(hyp_vm->kvm.arch.pkvm.handle);
+	remove_vm_table_entry(handle);
 err_unlock:
 	hyp_spin_unlock(&vm_table_lock);
 err_remove_mappings:
-- 
2.50.1.703.g449372360f-goog


