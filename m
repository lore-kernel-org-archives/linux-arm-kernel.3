Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14282CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy5TRcbxi+oKZaDA6NnkhAWnNCuFaeediLm78a2LlZE=; b=yj6rEi1QZrNv7jDvcE9z347KFK
	F9o2Ih++8ghw38/WE8V3JdBJGQT/7sJMqotzXYhGP2kVzH0/bGyxqSkuChF7rKP7SjIdCgwG9ZDZ3
	cnhc/kg6xTcVz3Y1qJMHuyRsCKmauSsQ52qAy6lPd5LbGidRnVGMCHUd0gQlttk+wm260V4C8VZrV
	esjWOJHxsjE3ywJ1fQ1BkzNUok2W3oE3N0ceS+z48I87NK1XpyUHxFPHnPLNb9XpA90eeAznrzlIT
	oNxZkAhEt8bim/uYi+rNhENsfFgIwM1HTKrfGFPqA8fXeSfPWToZ/9RgV9QMa37xF01WoDn9uzpnP
	v97xs2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1Y-0000000FCUE-38pU;
	Wed, 27 Aug 2025 11:09:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDG5-0000000F2bj-0c3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:20:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b05d8d0so46712885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289999; x=1756894799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy5TRcbxi+oKZaDA6NnkhAWnNCuFaeediLm78a2LlZE=;
        b=uRDziX8ZK4naz+47vjd3H/cQOC8hk4hnDWOs2jSmV5m7I1R73POJlyIdFXTXXYSs/b
         HtkAgm9WoT9XLQb6aTsQVC/h5pkavLpq2Cw0M8kr+h3ID34cQiBmwTegIHQSy19T08XK
         weHOBasaa+BhADWnPZJyVLSHswrcR0jXQKcKHo1tGq5Y+jNRpU+ssHysZhM/bbzOJ5/j
         8RLcTPxVHyMLjWUnTcNgRlenzRnoFNtsUc44Vz2yOqXpqOR+P9RUhOno/xnswnqAWhaD
         e1CvV4S9bB5qna9j2AqoGO/io4obIG66ybfYztINrRSVYZnH88bGekH83CWiHM3h/vUh
         U4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289999; x=1756894799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy5TRcbxi+oKZaDA6NnkhAWnNCuFaeediLm78a2LlZE=;
        b=XDdzwKvITm+S6b+D40Pwguk7evEyTqxQKwTf0GAMVOj80ZAbHUxx+l8KrKD1CwEkKD
         yer5RtvHcQED82Hv2+YDsnzzfvQgzsMu1tRZwMg9qsQxPP9tRKeaX5GUM698igR2I0Y+
         MV9YrfFmQ1Oct+fwRGZeZaAqZMhiB4ZjXgl+QHAJazaAu3w3cyPBKxFL4ZTnHNub55kD
         BYfmtS9sSFktgtWSYN7yD7a8/1OsD/dgQ5gxDH0lqyczN4WKCvOdFfwJT3ZG+CQdhd22
         gpPtWL3eUMQqyK4BJzF7N2ONYpY2w3kMz/CIrhy5HLjPvoXx4N/W2q5505PlnMBSNVoa
         Tfkw==
X-Forwarded-Encrypted: i=1; AJvYcCVzFUCzvVDp6YldJ8QM4G8jVHlvrI8F3grWraT81x/pZ3BPIToo+zevhD8YFcFMRyJRjM6GhcPr7cSrJ4E2kJNc@lists.infradead.org
X-Gm-Message-State: AOJu0YzEEdCvnY+MuiqQwdAmorpcQmYZKyDf8iMCNvSEZgdP0OimdIGO
	qVnobCR15ielkc4165YbJNxyBUwWRoTmeDlLRo2A3DlyLfr13+dg1QYVMGYKvaNAK4XMw/bEyjG
	IZQ==
X-Google-Smtp-Source: AGHT+IGOTeQ1n+VZLdO73T6QTzrnDzOsSB+w2lEpuWcOhvwClk0xQJ9gvC2wzhCXaaJHljlhkSN9uHoNOw==
X-Received: from wmbdp8.prod.google.com ([2002:a05:600c:6488:b0:458:a7ae:4acf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4715:b0:456:1923:7549
 with SMTP id 5b1f17b1804b1-45b517d294dmr152543895e9.26.1756289999079; Wed, 27
 Aug 2025 03:19:59 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:47 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-8-tabba@google.com>
Subject: [PATCH v3 7/9] KVM: arm64: Consolidate pKVM hypervisor VM
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
X-CRM114-CacheID: sfid-20250827_032001_194534_7CF57F5B 
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
2.51.0.261.g7ce5a0a67e-goog


