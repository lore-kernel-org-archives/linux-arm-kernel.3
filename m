Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67809CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkpi67qOMp/uiAz2TC5dAbuoUorHcaS9iLgtzkJSQco=; b=mpa8An40tDnfFHwNnivlG92n2N
	0mvYNfXyARV9bs0h4yLncB4VrVH83NLOnxjBxb8m2iaGdMuajIzDmZGQ3gnmyyjN2aHFSFjTgxvJ8
	QLEdc9hNYBjMrOMY3hHnTQDCdL7GYzmHuhrmMHYYBWSxXWIu1o5eiHfMAN9wQoSC2r49iURoiR4XY
	xXYfg5ApKm4M9+d4gTmC78waeeFlIyAyaQSxNN/XBle9xD3alOJ835P5nAoOSOS5OHEZPrIJKPkYN
	nJ9crJ4fOjWMB2bJ6V8TnMbOYuGe2KZMWIaUjACDfWoClHiolBNVhJBmaOwYMzbLRnc84KBEEZuZn
	BnMsdRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuVG-00000005uBa-0c6f;
	Tue, 09 Sep 2025 09:19:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsic-000000058wr-10l5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:47 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45dcf5f1239so20181845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402684; x=1758007484; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkpi67qOMp/uiAz2TC5dAbuoUorHcaS9iLgtzkJSQco=;
        b=KldW5Epohbjz6oYlQcZC1bGAZhbyT7c/mDDUsfBdUs9C8Ckw9zOtw8X4HS6U7/4s8D
         NujEMhfB2jQs4C6oAKyqE+W9PIkncuNRTZ85BTSwig8az75KCPGovNAnWSPeQxGzz+qt
         9zE5/4J0uacYr/k6IeG7YqPN5IZmdmQcj0D7k0q//JuklxTBaJmq6yPlrs7hkON+A/Ma
         NWaiwRdcw0HpYUlc+wRm7SCJa4yxsHqVjRaNyW4R80l/bcomKsBXbGH5Fjw39zOowW/V
         rOoruJyUYFPHBU8ponzGz8vwhTcRl/7FO+mnNwdxBvxvuszdKeJmGDGN00I7REO23AOF
         gkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402684; x=1758007484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkpi67qOMp/uiAz2TC5dAbuoUorHcaS9iLgtzkJSQco=;
        b=fkrm8bjS9Gh5ZHRh85eTVbO6a77PXQgoyWd1uKRX8MRK32gxyqSgHkGShlW+FCCJP3
         VQHXMXNFzByhuw6jn5EPHDSns+042hr7VKzmdU504W08D3TPlx57cRTh5iz62n6AOXah
         aOQvsc31yfNHJfONbLmUfa4MA2IMmXAGmy14tNjAFKGHzmmuzmH7VBVNj+zDVvUT/3Up
         SsNUAfxwVu3DxVxW3bpElJVVBLzHtzrkFHhv1clrVeiKK5ufD6xKR/Jg2k4eaZPu0HYf
         0sQXMVVP8ZKQFwW5IwQ4uGSoLgThYgEA7Y8qN/5d4BkCaesIMmf1Dy/jhsJRSBq/Hf8z
         XvcA==
X-Forwarded-Encrypted: i=1; AJvYcCVxZHAtMlrdUHA/5B+bhl8Sy3qyh3J8G/G8CLNwNdLEKUHj0bakTaMf0yLYzG92wyMNN6IED6YzGQcSBvfUiqPL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyok1sJPot6OxcIjTYJpWjA0GD4x3bAIL63ym0/0OciwroH7aHC
	eEzsNRefYT9r9AvfgV0czvmhlGtJB8/bLppgkSkqyWc4zsrnYLe355UAO3Qsbab8+KkQfJhOgXQ
	Qwg==
X-Google-Smtp-Source: AGHT+IGXGlhvO/Gry5KuVU8JDkyeu45vdQr6fz8ahI5MK/ozUtoBR1pAMbkxHLqtlX/EpdjqL8+Q5vnnKg==
X-Received: from wmer2.prod.google.com ([2002:a05:600c:4342:b0:45d:d1f2:48ba])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b8e:b0:45d:d9ab:b85a
 with SMTP id 5b1f17b1804b1-45def87ee0bmr7641885e9.7.1757402684215; Tue, 09
 Sep 2025 00:24:44 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:34 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-8-tabba@google.com>
Subject: [PATCH v4 7/9] KVM: arm64: Consolidate pKVM hypervisor VM
 initialization logic
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002446_282690_7F539B65 
X-CRM114-Status: GOOD (  19.84  )
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
2.51.0.384.g4c02a37b29-goog


