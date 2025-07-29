Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5C5C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzTlWySJCG78jq2IfrYfNkJ/pZ9aJEn2AikPiisxllU=; b=OH/G7gOa5G/QCylFezBFgX4PY4
	0q4ZszDvqXEJFT6LWQuF8/OyBHU6Qf/CtY27WyBaiu8cX6meCQRxPNP7WXogTkezkUuvWq0pG9G47
	jdNohQlYsd+g72O34xrhG//TkZ+NAYSl+lYc19i7npf8vhbHmAp2KNCAgLIwTsyhVVMXGKca+56Xi
	C2Ch//dJ5Yt/uIq1wzner3yqQ8PyUfKwKtHkITo90VtShXxnWc1N817Wsy79qsslBT9aIpD1NdGvd
	msS6OB+wR5OFDNLK31iGCiwkLNw0NmxkdIji5GOa2P7OT6P2OoI8AzzKOq/z66NvSYs7lNosAnhA2
	P90qCtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjHF-0000000GhoP-0dlt;
	Tue, 29 Jul 2025 12:17:53 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0I-0000000Gfwq-32oQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4588cfda8b6so6964445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790421; x=1754395221; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nzTlWySJCG78jq2IfrYfNkJ/pZ9aJEn2AikPiisxllU=;
        b=NkUdxQn5pK+QZ6QVterUNiiqAfN1WbmcTclBl4OJDxhmOFz8A8TNZgKbGKX272yumk
         yadxP7Y7yrYtTuBQ3LBUQckuU7kqTSeRWFWurU60B3IuFiwMY7tcHJFi1xVpY0MNekCg
         VV4YfpAasqmbMSLA5llBHSoiIDrG9qDaZ2WVVGqc58CAjpUDunT3dI7okpFrtAHmbZNv
         RVv8FtEXUWg95SJhyjcN9uTl7IBXDq0D0SDOuT68nOJFioNLoBTDqKc/QoI2AaLPT/ZB
         2/vXfZxUInogpPTx/uOiwthBMfbJ34nsjp0q8MhZjy67/mvErNu5SyFa81Nyy2/bYTyw
         ZAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790421; x=1754395221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzTlWySJCG78jq2IfrYfNkJ/pZ9aJEn2AikPiisxllU=;
        b=INqTZ7tyt86nHc7mA3f8VV+hTAOunr8NOniaGAcGz++sHhXUDgGimVKo64FntoIdnN
         H4Z/OzHFrhwxSLSVIXMp9wHvuuW5mEaZkeL/VXp24Fl4AMPr6tayecHqX8gdeAP1S3y/
         H58ERp4qyExcYSkywb/wA9mnxZ3jRLwhFGWl7JS6m3Y//U/PLKXYRl78JZn8aaCGFp7E
         VMx12Q3dhFANJ5dmX1n+aupHLzgOViOa9+/DQBwh0KAgGE/Mw1A7kFM/lMshMuAsjdou
         OQ2xIJiZ6yYBMrGj+0Ksdfc3gXMGDWjy7E0/YHOrejvJjY43VVilHRR4m6EMFDd/1PVk
         IsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUidZkHzVld9MQ5F4PvV0xU1Z5UwDBPH+zyHjS/hyMjhNK50DAo82K5WJJaOLpxndxX46hOsn47pfzVIfh2vvD@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJLkqNE6GxphOskg5QcaZw/70xhvgvSV/x9SMI3EnlMPdje0J
	zbmXifHm6NOziSqirL9CXp1fb3iIGFrNTxrGKZRBKRDO82u+DrerQgmEE0IlF8itVoRTSCrCyuc
	1lA==
X-Google-Smtp-Source: AGHT+IFejJUgHX+Z1CtNT5C8c6rHJGlUTyHBo3o4bob1n8JrSXQa6u68mJSZfdFMtBOpsqH/b8/i4YqXXQ==
X-Received: from wmrn32.prod.google.com ([2002:a05:600c:5020:b0:456:1754:78e0])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:64ca:b0:456:11cb:b9c7
 with SMTP id 5b1f17b1804b1-458786424f8mr124021765e9.25.1753790420714; Tue, 29
 Jul 2025 05:00:20 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:11 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-7-tabba@google.com>
Subject: [PATCH v1 6/8] KVM: arm64: Consolidate pKVM hypervisor VM
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
X-CRM114-CacheID: sfid-20250729_050022_764727_CCC42924 
X-CRM114-Status: GOOD (  19.36  )
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
index ea9df0b079f1..ff974290f144 100644
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
2.50.1.487.gc89ff58d15-goog


