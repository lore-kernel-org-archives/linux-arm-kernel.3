Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6kFV0aM2/7WGCbUITdYj+59/K3RoQFqsqt5SwSOyE0=; b=tn1lstscRjF8luLqCxqMlwgNuG
	7SCOMdDUyoBG/Fk/lmUKdF+m22Zr3WjJD8v/J39T8jvPKSqL7OvfXt2K1KyoS0s3ww7Frjy2AfiV7
	qmzTq5nf2v0624RdBFfkjdo7ZPEblR5platrc1LX0GLWPGdyaLNLfJTdWNaAWoELrhNTDsz4QGoiJ
	U2v02Av4RRGvUxO/eajXgks+V4hysfzYnaYRB77y75MNKp7AFQ7DXhzbXq2ecMDWPNybP+S7h5kym
	3NQ2KKMPotCnzNB7fKpis9YLovZ0SeN/yY8GkpMfhf7YmPnu09EwDvQOla3Kdh4+QKNoscTKMyCSJ
	V2AXYnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWYK-0000000Brps-10Wt;
	Thu, 12 Jun 2025 01:16:24 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEX-0000000BXTb-3s2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:51 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so522186b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682069; x=1750286869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A6kFV0aM2/7WGCbUITdYj+59/K3RoQFqsqt5SwSOyE0=;
        b=gHakrehRpA/bJ0QN+jFrFq2mjMPmB/du3OPgTOPP081kdr+zz0JQaPmA94rGrU6xv5
         DXxNUYjPXLzT3WIuAwAb46aJ/iQUC79cwefYU0239g74wAvo2jrFO6+b1+NTfZfVtuNB
         7U414lHL7d+XEkG4SzEX38tSUmG+fAPvWSNMGmRtfEsuTuR0z+nWU+5D4TMzGOLrzAXa
         Fp7vRTNVPXc6uJf8B2V6IARY2CR8qxbWDrlWyECQvrHPaNBji9y5KLX/TT8c4Dek0rV9
         QM7qRonSgYu2qt3rIVxbqExjiNnvbYRk1hvGS70Xmb0STDlCeFW1dzp85XQnUGJ0KDRn
         /trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682069; x=1750286869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6kFV0aM2/7WGCbUITdYj+59/K3RoQFqsqt5SwSOyE0=;
        b=FcNKOt5qDP+p9CvDGRDaBDSrUqy3OEA1vbsWNISo8fauinLtYjq5PPe1XfcJ6UO5X2
         zI1FBFhxYhqLpupuJPZI2UM1x6IB7LtP4tmW5Tnyp9P2OriQtDRvDfrUA9AHbSaK2W7x
         Y2fDactARCzBlLkoyEgytOTo8WQqacYsWUcLuEZWdNSdHxgmsfZXif6dKmj2UXBjG4K8
         iE8GUhTckxolazHGoih2rdfaVn3WDoGh1p+cSx14bENaXAza+0XvUcsk4XzRcMt7L4t/
         nxL8IQnl6I3gRxRxq5BH0pZXU13eWJubjHukaTjqYdKBDDHI1/0AlE3BHoiLj+ck3TSQ
         nzRA==
X-Gm-Message-State: AOJu0YwgMO2YCH3eH3NdyGYcZtYC6ynOQRPz38p+GiyIj3IIdjQUlE0Z
	thXueVLi21thTvYs9Hn8SpqGya6A+ZtUIOdAYxML4P8s+HD9dGFoeHqdSOT2iHfy97ewSoFDxTm
	3EehO3g==
X-Google-Smtp-Source: AGHT+IEYMkMwcnIeyPgfPFP0NuScaZzgC9Stpbf3ExVHDUo0EXQg9uCGSRWh/jAB4CmBrW8hxEhAywt4G8k=
X-Received: from pfsq2.prod.google.com ([2002:a05:6a00:2a2:b0:746:25af:51c4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac4:b0:737:678d:fb66
 with SMTP id d2e1a72fcca58-7487e082857mr873149b3a.5.1749682068984; Wed, 11
 Jun 2025 15:47:48 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:34 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-33-seanjc@google.com>
Subject: [PATCH v3 31/62] iommu: KVM: Split "struct vcpu_data" into separate
 AMD vs. Intel structs
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
X-CRM114-CacheID: sfid-20250611_154749_975754_25341500 
X-CRM114-Status: GOOD (  22.42  )
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

Split the vcpu_data structure that serves as a handoff from KVM to IOMMU
drivers into vendor specific structures.  Overloading a single structure
makes the code hard to read and maintain, is *very* misleading as it
suggests that mixing vendors is actually supported, and bastardizing
Intel's posted interrupt descriptor address when AMD's IOMMU already has
its own structure is quite unnecessary.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/irq_remapping.h | 15 ++++++++++++++-
 arch/x86/kvm/svm/avic.c              | 21 ++++++++-------------
 arch/x86/kvm/vmx/posted_intr.c       |  4 ++--
 drivers/iommu/amd/iommu.c            | 12 ++++--------
 drivers/iommu/intel/irq_remapping.c  | 10 +++++-----
 include/linux/amd-iommu.h            | 12 ------------
 6 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/arch/x86/include/asm/irq_remapping.h b/arch/x86/include/asm/irq_remapping.h
index 5036f13ab69f..2dbc9cb61c2f 100644
--- a/arch/x86/include/asm/irq_remapping.h
+++ b/arch/x86/include/asm/irq_remapping.h
@@ -26,7 +26,20 @@ enum {
 	IRQ_REMAP_X2APIC_MODE,
 };
 
-struct vcpu_data {
+/*
+ * This is mainly used to communicate information back-and-forth
+ * between SVM and IOMMU for setting up and tearing down posted
+ * interrupt
+ */
+struct amd_iommu_pi_data {
+	u64 vapic_addr;		/* Physical address of the vCPU's vAPIC. */
+	u32 ga_tag;
+	u32 vector;		/* Guest vector of the interrupt */
+	bool is_guest_mode;
+	void *ir_data;
+};
+
+struct intel_iommu_pi_data {
 	u64 pi_desc_addr;	/* Physical address of PI Descriptor */
 	u32 vector;		/* Guest vector of the interrupt */
 };
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index a0f3cdd2ea3f..6085a629c5e6 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -822,23 +822,18 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	 */
 	if (vcpu && kvm_vcpu_apicv_active(vcpu)) {
 		/*
-		 * Try to enable guest_mode in IRTE.  Note, the address
-		 * of the vCPU's AVIC backing page is passed to the
-		 * IOMMU via vcpu_info->pi_desc_addr.
+		 * Try to enable guest_mode in IRTE.
 		 */
-		struct vcpu_data vcpu_info = {
-			.pi_desc_addr = avic_get_backing_page_address(to_svm(vcpu)),
-			.vector = vector,
-		};
-
-		struct amd_iommu_pi_data pi = {
-			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id, vcpu->vcpu_id),
+		struct amd_iommu_pi_data pi_data = {
+			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
+					     vcpu->vcpu_id),
 			.is_guest_mode = true,
-			.vcpu_data = &vcpu_info,
+			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
+			.vector = vector,
 		};
 		int ret;
 
-		ret = irq_set_vcpu_affinity(host_irq, &pi);
+		ret = irq_set_vcpu_affinity(host_irq, &pi_data);
 		if (ret)
 			return ret;
 
@@ -849,7 +844,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * we can reference to them directly when we update vcpu
 		 * scheduling information in IOMMU irte.
 		 */
-		return svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
+		return svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
 	}
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 687ffde3b61c..3a23c30f73cb 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -303,12 +303,12 @@ int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		       struct kvm_vcpu *vcpu, u32 vector)
 {
 	if (vcpu) {
-		struct vcpu_data vcpu_info = {
+		struct intel_iommu_pi_data pi_data = {
 			.pi_desc_addr = __pa(vcpu_to_pi_desc(vcpu)),
 			.vector = vector,
 		};
 
-		return irq_set_vcpu_affinity(host_irq, &vcpu_info);
+		return irq_set_vcpu_affinity(host_irq, &pi_data);
 	} else {
 		return irq_set_vcpu_affinity(host_irq, NULL);
 	}
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 5141507587e1..36749efcc781 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3860,10 +3860,10 @@ int amd_iommu_deactivate_guest_mode(void *data)
 }
 EXPORT_SYMBOL(amd_iommu_deactivate_guest_mode);
 
-static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
+static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 {
 	int ret;
-	struct amd_iommu_pi_data *pi_data = vcpu_info;
+	struct amd_iommu_pi_data *pi_data = info;
 	struct amd_ir_data *ir_data = data->chip_data;
 	struct irq_2_irte *irte_info = &ir_data->irq_2_irte;
 	struct iommu_dev_data *dev_data;
@@ -3886,14 +3886,10 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	ir_data->cfg = irqd_cfg(data);
 
 	if (pi_data) {
-		struct vcpu_data *vcpu_pi_info = pi_data->vcpu_data;
-
 		pi_data->ir_data = ir_data;
 
-		WARN_ON_ONCE(!pi_data->is_guest_mode);
-
-		ir_data->ga_root_ptr = (vcpu_pi_info->pi_desc_addr >> 12);
-		ir_data->ga_vector = vcpu_pi_info->vector;
+		ir_data->ga_root_ptr = (pi_data->vapic_addr >> 12);
+		ir_data->ga_vector = pi_data->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
 		ret = amd_iommu_activate_guest_mode(ir_data);
 	} else {
diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 3bc2a03cceca..6165bb919520 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1244,10 +1244,10 @@ static void intel_ir_compose_msi_msg(struct irq_data *irq_data,
 static int intel_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 {
 	struct intel_ir_data *ir_data = data->chip_data;
-	struct vcpu_data *vcpu_pi_info = info;
+	struct intel_iommu_pi_data *pi_data = info;
 
 	/* stop posting interrupts, back to the default mode */
-	if (!vcpu_pi_info) {
+	if (!pi_data) {
 		__intel_ir_reconfigure_irte(data, true);
 	} else {
 		struct irte irte_pi;
@@ -1265,10 +1265,10 @@ static int intel_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 		/* Update the posted mode fields */
 		irte_pi.p_pst = 1;
 		irte_pi.p_urgent = 0;
-		irte_pi.p_vector = vcpu_pi_info->vector;
-		irte_pi.pda_l = (vcpu_pi_info->pi_desc_addr >>
+		irte_pi.p_vector = pi_data->vector;
+		irte_pi.pda_l = (pi_data->pi_desc_addr >>
 				(32 - PDA_LOW_BIT)) & ~(-1UL << PDA_LOW_BIT);
-		irte_pi.pda_h = (vcpu_pi_info->pi_desc_addr >> 32) &
+		irte_pi.pda_h = (pi_data->pi_desc_addr >> 32) &
 				~(-1UL << PDA_HIGH_BIT);
 
 		ir_data->irq_2_iommu.posted_vcpu = true;
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index deeefc92a5cf..99b4fa9a0296 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -12,18 +12,6 @@
 
 struct amd_iommu;
 
-/*
- * This is mainly used to communicate information back-and-forth
- * between SVM and IOMMU for setting up and tearing down posted
- * interrupt
- */
-struct amd_iommu_pi_data {
-	u32 ga_tag;
-	bool is_guest_mode;
-	struct vcpu_data *vcpu_data;
-	void *ir_data;
-};
-
 #ifdef CONFIG_AMD_IOMMU
 
 struct task_struct;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


