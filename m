Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED040C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzOMi+9WhLFn5RsmaXLKQASfSh/9aYySv/FWLLLXXM0=; b=uZshJTsHrcgG2L9weiqw6SfX63
	qDkAtC/jei8ijZAiaQPTYvtf5Bj3SVu6S48M0zXuO1JNMh5VjcF0vFGPtUz8nZgmqArGg0g1b3wFC
	+xClCvP3RNGalSzsf2nQDmAwhV+nAphP3m3U7pyxXYWRyaSW5VW+yZgJNgpchCsP7MYQZTRqQwivP
	B96WM1drCs5ZpGV/kjZFU+y4weHy6h7VzURfL0L3Dsj26cqW9URkxAS50NB/SgAuOzu81hKvorjxa
	wy9y2ZR/7XaqgHr7rV4eYpcWuR5YMrDbQ2FsUzERlsErEU018WNnuH9MhGFx7jpWgbpRtWXkuQQfT
	Mi6qocSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj9x-0000000GgzP-3W5i;
	Tue, 29 Jul 2025 12:10:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0F-0000000GfvO-2Mlj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-456013b59c1so29783895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790418; x=1754395218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yzOMi+9WhLFn5RsmaXLKQASfSh/9aYySv/FWLLLXXM0=;
        b=bW8P6MA+oJ+hhtQOmViaV/nCa+yQcSg7YZENT30oMTKd2jnc78tPvRXBuJ9Yi+IXBx
         TI5khegQnA5T7wNdYH3QASlSGiMxz1e2qxT+7qF9SANqlCpnyeZapn7/6nU6LPxxPBTM
         mzNh72LFnQkLa8Poz6oXoGvijUFMIprDPYcUBx0g5M2dA0IPYWqOMkI6yZjkYHNagOkR
         bxZM0t7AW3ujLU/s/+UMmAY9rMkYb0z+EKNpWD/aePgHxYwDFb8XxJmtrq7tHITijY7C
         zX770didVgPJ9KW7IAKUYfuKwnEfCfCrEhrmH7vLOoLwMXuU+1ieXhkdHTCjll2zI5O2
         EJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790418; x=1754395218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzOMi+9WhLFn5RsmaXLKQASfSh/9aYySv/FWLLLXXM0=;
        b=OJwqJGGDSevCzVXg0zK5GSpPFwHiKsNtURffuTks7m0MuqSj0SNs6DySaOxdk8rjKh
         0BI5cRbNzy+cOHKUbaOHxb5yNM6sKW4XiTZ38EjZxPgb9qo/eEs/QShKQyWXVubCPXIn
         rVv3C15+GxQ5yJ1xYyIDSNGyBcxGtmLKnijFBJEuJfw/fAmQSfeGyDxs5f3MlUUihbY/
         6DtbrUyqk+Thj/AZ+M2379MaZgmXHajnuxhSaGOyCsmsIQpD7g6k5JMygrTcEC8CrYmD
         0JDf/CY0rlSRBiq3Deb6x06Mj2j3tjQXo6qT6+i/tBcbrWRocz3Ag6gvyUCgcYKq4qWI
         sfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsWy7pOzVC6qAKRPPFYD9Sean6jy99M3+BWKJL5cH0+5E/Et//VjApp7nb+sbHur/qetcWQv2IpL8bN/ZJiuXw@lists.infradead.org
X-Gm-Message-State: AOJu0YxgjA9J06u8qgqcaE9sSSmv+CRi2Y8ON1cYETNxeKqTBi24vH0g
	TgzLdMyW6FIPELc1ZQe2RAnm+r5b6wRGkbe7h0rwlGr0SZhRWZj4dhMeJHfYXjg4CtAne9Crcj8
	nKw==
X-Google-Smtp-Source: AGHT+IF5m5Jas+Y1tjtFvJmfbbD63cNHNWbScBXNfx43vxxHKWugss/STe0rrrG6LluVj7J7814rLj4CZA==
X-Received: from wmsd13.prod.google.com ([2002:a05:600c:3acd:b0:455:9043:a274])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6088:b0:456:e39:ec1a
 with SMTP id 5b1f17b1804b1-45883089729mr83764525e9.14.1753790417578; Tue, 29
 Jul 2025 05:00:17 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:08 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-4-tabba@google.com>
Subject: [PATCH v1 3/8] KVM: arm64: Clarify comments to distinguish pKVM mode
 from protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050019_601540_6133198D 
X-CRM114-Status: GOOD (  20.49  )
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

The hypervisor code for protected KVM contains comments that are
imprecise and potentially flat-out wrong. They often refer to a
"protected VM" in contexts where the code or data structure applies to
any VM being managed by the hypervisor when pKVM is enabled.

For instance, the vm_table holds handles for all VMs known to the
hypervisor, not exclusively for those that are configured as
protected. This inaccurate terminology can make the code's scope
harder to understand for future developers.

Clarify the comments throughout the pKVM hypervisor code to make a clear
distinction between the pKVM feature itself (i.e., "protected mode") and
the VMs that are specifically configured to be protected. This involves
replacing ambiguous uses of "protected VM" with more accurate phrasing.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index ce31d3b73603..4540324b5657 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -29,7 +29,7 @@ struct pkvm_hyp_vcpu {
 };
 
 /*
- * Holds the relevant data for running a protected vm.
+ * Holds the relevant data for running a vm in protected mode.
  */
 struct pkvm_hyp_vm {
 	struct kvm kvm;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6198c1d27b5b..abe173406c88 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -23,8 +23,8 @@ unsigned int kvm_arm_vmid_bits;
 unsigned int kvm_host_sve_max_vl;
 
 /*
- * The currently loaded hyp vCPU for each physical CPU. Used only when
- * protected KVM is enabled, but for both protected and non-protected VMs.
+ * The currently loaded hyp vCPU for each physical CPU. Used in protected mode
+ * for both protected and non-protected VMs.
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
@@ -135,7 +135,7 @@ static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 
-	/* Protected KVM does not support AArch32 guests. */
+	/* No AArch32 support for protected guests. */
 	if (kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL0, AARCH32) ||
 	    kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL1, AARCH32))
 		return -EINVAL;
@@ -210,8 +210,8 @@ static pkvm_handle_t idx_to_vm_handle(unsigned int idx)
 DEFINE_HYP_SPINLOCK(vm_table_lock);
 
 /*
- * The table of VM entries for protected VMs in hyp.
- * Allocated at hyp initialization and setup.
+ * A table that tracks all VMs in protected mode.
+ * Allocated during hyp initialization and setup.
  */
 static struct pkvm_hyp_vm **vm_table;
 
@@ -495,7 +495,7 @@ static int find_free_vm_table_entry(struct kvm *host_kvm)
 /*
  * Allocate a VM table entry and insert a pointer to the new vm.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
@@ -594,10 +594,8 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
 }
 
 /*
- * Initialize the hypervisor copy of the protected VM state using the
- * memory donated by the host.
- *
- * Unmaps the donated memory from the host at stage 2.
+ * Initialize the hypervisor copy of the VM state using host-donated memory.
+ * Unmap the donated memory from the host at stage 2.
  *
  * host_kvm: A pointer to the host's struct kvm.
  * vm_hva: The host va of the area being donated for the VM state.
@@ -606,7 +604,7 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
  *	    the VM. Must be page aligned. Its size is implied by the VM's
  *	    VTCR.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
@@ -668,10 +666,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 }
 
 /*
- * Initialize the hypervisor copy of the protected vCPU state using the
- * memory donated by the host.
+ * Initialize the hypervisor copy of the vCPU state using host-donated memory.
  *
- * handle: The handle for the protected vm.
+ * handle: The hypervisor handle for the vm.
  * host_vcpu: A pointer to the corresponding host vcpu.
  * vcpu_hva: The host va of the area being donated for the vcpu state.
  *	     Must be page aligned. The size of the area must be equal to
-- 
2.50.1.487.gc89ff58d15-goog


