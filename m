Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD796C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AigF+Y9MYNfRX+27Mz1zGJDa9Ruxb1FfbdKOr62V2pU=; b=GfN2UexGVgdSSn/wbobbrDJyoR
	rDbw6oxJbk5NyjlyIs7R4RMdOdp2tmyYzvZVDpsuAiCRhJ8lIAQZb4HzFpDfiIQ8ix6X4ox0IQeOF
	3f1z6lpQ3E7nSSUnybi72ts2zemQUtCa5McyhZUoWwTFLpNQRG9p4UtCg75Cp7nOEMIKYYAMqPjG8
	9VqwVHaE3dQt1BaEN0JO7ZU9kKQQ7Ybqp1vxihF2FNvu+upLqYx6OBBADIDeWdHA2GQudpyfEw1Je
	wCI1Siy5wz3DtZtGmyaykqk9FazBUpqbRb6+uJxPf7N1K43VsoTuqAqf5G+QIRVAbiIEUSwJC2i9Z
	Rzxw7bNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVdc-0000000Blzh-2bJ4;
	Thu, 12 Jun 2025 00:17:48 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDn-0000000BWsu-3m3b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:04 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23494a515e3so1951465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682022; x=1750286822; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AigF+Y9MYNfRX+27Mz1zGJDa9Ruxb1FfbdKOr62V2pU=;
        b=X3dR5pA/b8MFQ32mhVLWhAaCXM8lL4cijI34BUoXtmQiFG+1r+1NN+kvzC2vm1FQhw
         2nOMl8lnUz91CiTdv3O6e6+VuHxBckY7K0wezXUuiUtoFGIlGMdpl6WDULKJP7UQrk8a
         OskN3/h33DJ6KexCC5bexubkdzRfHUiB9EB/efe0Rzgd5YfOi560r0gJ45CzyAtSnjLi
         BMp84ZTvbF2QBcZCg9e5GBYJwlYOe6q/UV0JdNAmyJ6OYEuMpJZgUm4JdVDdwdSpHKXf
         lfLPczp+z2qDww3xWoTA1A/IkL0JL7owVCZlNOHNJ4qbL9b7Oktg1vFgzdILPa6sOmQg
         Ae3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682022; x=1750286822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AigF+Y9MYNfRX+27Mz1zGJDa9Ruxb1FfbdKOr62V2pU=;
        b=PtCvqAXn+s8r3S3z3t96RNEIru+HQ6+bl64LYI+W9wlLqBhTx2cbYMF2lTjCsDb6aa
         o0WRpsnvxUGQB+0o8JtyxDPWPS6zjpqjCW2mPREIUqZfa60WC/nfurfethL2XRksGfa5
         Ma5w3Cgd4pQPkJNdW9eyVV4OqVexkoOD1Dx5THmqwsaqyd6PWGU1K9Ml+rvPKwJBYQ+U
         CX4AbEP7TkLWg2aZ+jtmKq47V51fd6EQAxvyFZFNruasEq8FtV2R6Q4mucvSBJ32q7pJ
         ZiKKGLJnWi6zR+GaGUH/VUwMxsoQIgBf0jUHvM2GbHGeI8SxAXLt7iZN+1h5+Kv1pcXX
         2rBQ==
X-Gm-Message-State: AOJu0YwRtOdOKMM2vvI5bC4y1oNRbffnWQqNSKynAt1u8STt6QZlD9W7
	93bScsjrdXCoOADZzvftPFOjth/VYXUtuHiIz07QDfWR9BPxzZL7UiuYo+RBiEFhGsag9yrvTvi
	72Wu7Fw==
X-Google-Smtp-Source: AGHT+IEyipb6CSG32fPdkBnIH7AX3Zq2Z2jB0QyZC6+PFK6cFG6DODigZnV9KthZcAYR6p98mMBWNxQJtN0=
X-Received: from pjqq12.prod.google.com ([2002:a17:90b:584c:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:18c:b0:234:c8cf:a0e6
 with SMTP id d9443c01a7336-23641b199c4mr70063175ad.24.1749682022639; Wed, 11
 Jun 2025 15:47:02 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:07 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-6-seanjc@google.com>
Subject: [PATCH v3 04/62] KVM: SVM: Track per-vCPU IRTEs using
 kvm_kernel_irqfd structure
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154703_937500_63CBF057 
X-CRM114-Status: GOOD (  24.21  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Track the IRTEs that are posting to an SVM vCPU via the associated irqfd
structure and GSI routing instead of dynamically allocating a separate
data structure.  In addition to eliminating an atomic allocation, this
will allow hoisting much of the IRTE update logic to common x86.

Cc: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 71 +++++++++++++++------------------------
 arch/x86/kvm/svm/svm.h    | 10 +++---
 include/linux/kvm_irqfd.h |  3 ++
 3 files changed, 36 insertions(+), 48 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index adacf00d6664..d33c01379421 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -75,14 +75,6 @@ static bool next_vm_id_wrapped = 0;
 static DEFINE_SPINLOCK(svm_vm_data_hash_lock);
 bool x2avic_enabled;
 
-/*
- * This is a wrapper of struct amd_iommu_ir_data.
- */
-struct amd_svm_iommu_ir {
-	struct list_head node;	/* Used by SVM for per-vcpu ir_list */
-	void *data;		/* Storing pointer to struct amd_ir_data */
-};
-
 static void avic_activate_vmcb(struct vcpu_svm *svm)
 {
 	struct vmcb *vmcb = svm->vmcb01.ptr;
@@ -746,8 +738,8 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 {
 	int ret = 0;
 	unsigned long flags;
-	struct amd_svm_iommu_ir *ir;
 	struct vcpu_svm *svm = to_svm(vcpu);
+	struct kvm_kernel_irqfd *irqfd;
 
 	if (!kvm_arch_has_assigned_device(vcpu->kvm))
 		return 0;
@@ -761,11 +753,11 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 	if (list_empty(&svm->ir_list))
 		goto out;
 
-	list_for_each_entry(ir, &svm->ir_list, node) {
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
 		if (activate)
-			ret = amd_iommu_activate_guest_mode(ir->data);
+			ret = amd_iommu_activate_guest_mode(irqfd->irq_bypass_data);
 		else
-			ret = amd_iommu_deactivate_guest_mode(ir->data);
+			ret = amd_iommu_deactivate_guest_mode(irqfd->irq_bypass_data);
 		if (ret)
 			break;
 	}
@@ -774,27 +766,30 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 	return ret;
 }
 
-static void svm_ir_list_del(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
+static void svm_ir_list_del(struct vcpu_svm *svm,
+			    struct kvm_kernel_irqfd *irqfd,
+			    struct amd_iommu_pi_data *pi)
 {
 	unsigned long flags;
-	struct amd_svm_iommu_ir *cur;
+	struct kvm_kernel_irqfd *cur;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
-	list_for_each_entry(cur, &svm->ir_list, node) {
-		if (cur->data != pi->ir_data)
+	list_for_each_entry(cur, &svm->ir_list, vcpu_list) {
+		if (cur->irq_bypass_data != pi->ir_data)
 			continue;
-		list_del(&cur->node);
-		kfree(cur);
+		if (WARN_ON_ONCE(cur != irqfd))
+			continue;
+		list_del(&irqfd->vcpu_list);
 		break;
 	}
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
 
-static int svm_ir_list_add(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
+static int svm_ir_list_add(struct vcpu_svm *svm,
+			   struct kvm_kernel_irqfd *irqfd,
+			   struct amd_iommu_pi_data *pi)
 {
-	int ret = 0;
 	unsigned long flags;
-	struct amd_svm_iommu_ir *ir;
 	u64 entry;
 
 	if (WARN_ON_ONCE(!pi->ir_data))
@@ -811,25 +806,14 @@ static int svm_ir_list_add(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
 		struct kvm_vcpu *prev_vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
 		struct vcpu_svm *prev_svm;
 
-		if (!prev_vcpu) {
-			ret = -EINVAL;
-			goto out;
-		}
+		if (!prev_vcpu)
+			return -EINVAL;
 
 		prev_svm = to_svm(prev_vcpu);
-		svm_ir_list_del(prev_svm, pi);
+		svm_ir_list_del(prev_svm, irqfd, pi);
 	}
 
-	/**
-	 * Allocating new amd_iommu_pi_data, which will get
-	 * add to the per-vcpu ir_list.
-	 */
-	ir = kzalloc(sizeof(struct amd_svm_iommu_ir), GFP_ATOMIC | __GFP_ACCOUNT);
-	if (!ir) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	ir->data = pi->ir_data;
+	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
 
@@ -844,10 +828,9 @@ static int svm_ir_list_add(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
 		amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
 				    true, pi->ir_data);
 
-	list_add(&ir->node, &svm->ir_list);
+	list_add(&irqfd->vcpu_list, &svm->ir_list);
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-out:
-	return ret;
+	return 0;
 }
 
 /*
@@ -951,7 +934,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			 * scheduling information in IOMMU irte.
 			 */
 			if (!ret && pi.is_guest_mode)
-				svm_ir_list_add(svm, &pi);
+				svm_ir_list_add(svm, irqfd, &pi);
 		}
 
 		if (!ret && svm) {
@@ -992,7 +975,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 
 			vcpu = kvm_get_vcpu_by_id(kvm, id);
 			if (vcpu)
-				svm_ir_list_del(to_svm(vcpu), &pi);
+				svm_ir_list_del(to_svm(vcpu), irqfd, &pi);
 		}
 	}
 out:
@@ -1004,8 +987,8 @@ static inline int
 avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu, bool r)
 {
 	int ret = 0;
-	struct amd_svm_iommu_ir *ir;
 	struct vcpu_svm *svm = to_svm(vcpu);
+	struct kvm_kernel_irqfd *irqfd;
 
 	lockdep_assert_held(&svm->ir_list_lock);
 
@@ -1019,8 +1002,8 @@ avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu, bool r)
 	if (list_empty(&svm->ir_list))
 		return 0;
 
-	list_for_each_entry(ir, &svm->ir_list, node) {
-		ret = amd_iommu_update_ga(cpu, r, ir->data);
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		ret = amd_iommu_update_ga(cpu, r, irqfd->irq_bypass_data);
 		if (ret)
 			return ret;
 	}
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index b35fce30d923..cc27877d69ae 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -310,10 +310,12 @@ struct vcpu_svm {
 	u64 *avic_physical_id_cache;
 
 	/*
-	 * Per-vcpu list of struct amd_svm_iommu_ir:
-	 * This is used mainly to store interrupt remapping information used
-	 * when update the vcpu affinity. This avoids the need to scan for
-	 * IRTE and try to match ga_tag in the IOMMU driver.
+	 * Per-vCPU list of irqfds that are eligible to post IRQs directly to
+	 * the vCPU (a.k.a. device posted IRQs, a.k.a. IRQ bypass).  The list
+	 * is used to reconfigure IRTEs when the vCPU is loaded/put (to set the
+	 * target pCPU), when AVIC is toggled on/off (to (de)activate bypass),
+	 * and if the irqfd becomes ineligible for posting (to put the IRTE
+	 * back into remapped mode).
 	 */
 	struct list_head ir_list;
 	spinlock_t ir_list_lock;
diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 8ad43692e3bb..6510a48e62aa 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -59,6 +59,9 @@ struct kvm_kernel_irqfd {
 	struct work_struct shutdown;
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
+
+	struct list_head vcpu_list;
+	void *irq_bypass_data;
 };
 
 #endif /* __LINUX_KVM_IRQFD_H */
-- 
2.50.0.rc1.591.g9c95f17f64-goog


