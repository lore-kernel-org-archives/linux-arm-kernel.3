Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D146C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAhwD+wb7NC8KByqrJKO/Vffd8F5ob8Xc4vevS05C0o=; b=Ew0/h3RXUt2SdfCnwJx1mdg0f/
	slRYf2HNEDucTlKQ84phBKS+PiPkeihIc+4AG0ngn9DZmyuzLMIrUrfA7OsTUwEq7Z3ETEw9zF2XV
	xLBThaHrkSqr105mRgFcDvxOSEG/xsux3Kez8RZF1Qx7WJXduSjXnaQIRvuBI92dLXUKr+7kQJFtl
	wn4cb2JlgsWzKf5xgyOUZvGE6tvRSgO4dJ53O1EyXkON3bv2EgcUDNkOAUbOW/9bzig1iUPXidXyu
	89wTY+OR8pDXGkH6KnkTUAun0MJueXlipBKM3h88E0SrHl79S1g8uTzw9oE6jzNoHCaIgDwE3R3u+
	jcsQZPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXX9-0000000Bwro-3FC3;
	Thu, 12 Jun 2025 02:19:15 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFM-0000000BY34-2Uls
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23592f5fcb0so3926185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682120; x=1750286920; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rAhwD+wb7NC8KByqrJKO/Vffd8F5ob8Xc4vevS05C0o=;
        b=11EdvJHnF490PS+35aoAJjZEtZ2OeeX2Vpdq3kQyYDImZ76G38a0TZ4m387U7DFAuo
         FZgcpAzh/RG3UgQlKwhZZWB/rntqiJdIFB+Ce7ERSEtWBykg0tKLYdkLRJbMq0OaRdjF
         qEEic2YbX2ZPgw6kVm1vngIxrrLO/tvx9PqRq0LHoopW/fPrPk/Ntb49U8bD3mZSL2rg
         RymtZbMRJY3B5F5P9ZV1Ho0CF75kuISlGp2Awe2oUpwc1KkB+o6TGtvkPPhm4y+DwkNF
         gpbgqfhaqNpUxjLwb8T0w1uNVZ1IzSx/g4LpqElNd66uyq2LTvXfL+zcN17c19R6Ut19
         o6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682120; x=1750286920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAhwD+wb7NC8KByqrJKO/Vffd8F5ob8Xc4vevS05C0o=;
        b=dZ0OtFUAQ0GVsF+nFYBnKBG1vjW1zPORGssQvlcnGjHByk+SPKKcXQlPQdH0VgdgxG
         vo/L44fJR1sVy8bjwJ97R0NL//rJY7pEeiYM+Ca9Y+Tu4stOv65XOlrgTUelmt5ODaHE
         Q4dNisbse+MR90FDkTC8uGTH5lQcZeuyAjUwYIO93Elq3MYciMiIroBKtPPhuAMoWzht
         52A5wnxQPyqYyQ4XxLHMmhLCXoX0gBtsQYzBJDNno838QIBqltl0/Sex4qHfmiEfUeFv
         NEtFAszJY+BXvUplVOVTYPbCefnHdQoWmc63mc8LPDm6xvSbZ8YL3eBXa8EtrDN1Givd
         Lorg==
X-Gm-Message-State: AOJu0YzvHPfuDkemAPbd5rReeB4OlXB2kMe2hT8BbFF4KJ2ESCfiJsXz
	vVOHOtCxWTYVrCjl2b8MKG0za9us8lK4aCMhwLrVpfkCdUZ7EsMje+Kr+y7k3GoVll5fPoVvH1N
	TWxSrcA==
X-Google-Smtp-Source: AGHT+IFvDUJP6bGiY4X2/HzWaCBMBazHwqdIL+mdn+XAdEWLTxdufC4OfuuvJ13ntKudn0x/5xdIZEaEn5k=
X-Received: from pjbsr5.prod.google.com ([2002:a17:90b:4e85:b0:313:17cf:434f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fc8:b0:311:df4b:4b81
 with SMTP id 98e67ed59e1d1-313af208395mr6148128a91.25.1749682119788; Wed, 11
 Jun 2025 15:48:39 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:03 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-62-seanjc@google.com>
Subject: [PATCH v3 60/62] iommu/amd: KVM: SVM: Allow KVM to control need for
 GA log interrupts
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
X-CRM114-CacheID: sfid-20250611_154840_639841_13364AAA 
X-CRM114-Status: GOOD (  24.80  )
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

Add plumbing to the AMD IOMMU driver to allow KVM to control whether or
not an IRTE is configured to generate GA log interrupts.  KVM only needs a
notification if the target vCPU is blocking, so the vCPU can be awakened.
If a vCPU is preempted or exits to userspace, KVM clears is_run, but will
set the vCPU back to running when userspace does KVM_RUN and/or the vCPU
task is scheduled back in, i.e. KVM doesn't need a notification.

Unconditionally pass "true" in all KVM paths to isolate the IOMMU changes
from the KVM changes insofar as possible.

Opportunistically swap the ordering of parameters for amd_iommu_update_ga()
so that the match amd_iommu_activate_guest_mode().

Note, as of this writing, the AMD IOMMU manual doesn't list GALogIntr as
a non-cached field, but per AMD hardware architects, it's not cached and
can be safely updated without an invalidation.

Link: https://lore.kernel.org/all/b29b8c22-2fd4-4b5e-b755-9198874157c7@amd.com
Cc: Vasant Hegde <vasant.hegde@amd.com>
Cc: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/irq_remapping.h |  1 +
 arch/x86/kvm/svm/avic.c              | 10 ++++++----
 drivers/iommu/amd/iommu.c            | 28 +++++++++++++++++-----------
 include/linux/amd-iommu.h            |  9 ++++-----
 4 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/irq_remapping.h b/arch/x86/include/asm/irq_remapping.h
index 4c75a17632f6..5a0d42464d44 100644
--- a/arch/x86/include/asm/irq_remapping.h
+++ b/arch/x86/include/asm/irq_remapping.h
@@ -36,6 +36,7 @@ struct amd_iommu_pi_data {
 	u32 ga_tag;
 	u32 vector;		/* Guest vector of the interrupt */
 	int cpu;
+	bool ga_log_intr;
 	bool is_guest_mode;
 	void *ir_data;
 };
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 2e47559a4134..e61ecc3514ea 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -784,10 +784,12 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * is awakened and/or scheduled in.  See also avic_vcpu_load().
 		 */
 		entry = svm->avic_physical_id_entry;
-		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
+		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK) {
 			pi_data.cpu = entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
-		else
+		} else {
 			pi_data.cpu = -1;
+			pi_data.ga_log_intr = true;
+		}
 
 		ret = irq_set_vcpu_affinity(host_irq, &pi_data);
 		if (ret)
@@ -849,9 +851,9 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
 		void *data = irqfd->irq_bypass_data;
 
 		if (!(action & AVIC_TOGGLE_ON_OFF))
-			WARN_ON_ONCE(amd_iommu_update_ga(cpu, data));
+			WARN_ON_ONCE(amd_iommu_update_ga(data, cpu, true));
 		else if (cpu >= 0)
-			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu));
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu, true));
 		else
 			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
 	}
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 926dcdfe08c8..e79f583da36b 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3804,7 +3804,8 @@ static const struct irq_domain_ops amd_ir_domain_ops = {
 	.deactivate = irq_remapping_deactivate,
 };
 
-static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
+static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu,
+				  bool ga_log_intr)
 {
 	if (cpu >= 0) {
 		entry->lo.fields_vapic.destination =
@@ -3812,8 +3813,10 @@ static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
 		entry->hi.fields.destination =
 					APICID_TO_IRTE_DEST_HI(cpu);
 		entry->lo.fields_vapic.is_run = true;
+		entry->lo.fields_vapic.ga_log_intr = false;
 	} else {
 		entry->lo.fields_vapic.is_run = false;
+		entry->lo.fields_vapic.ga_log_intr = ga_log_intr;
 	}
 }
 
@@ -3822,16 +3825,19 @@ static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
  * a vCPU, without issuing an IOMMU invalidation for the IRTE.
  *
  * If the vCPU is associated with a pCPU (@cpu >= 0), configure the Destination
- * with the pCPU's APIC ID and set IsRun, else clear IsRun.  I.e. treat vCPUs
- * that are associated with a pCPU as running.  This API is intended to be used
- * when a vCPU is scheduled in/out (or stops running for any reason), to do a
- * fast update of IsRun and (conditionally) Destination.
+ * with the pCPU's APIC ID, set IsRun, and clear GALogIntr.  If the vCPU isn't
+ * associated with a pCPU (@cpu < 0), clear IsRun and set/clear GALogIntr based
+ * on input from the caller (e.g. KVM only requests GALogIntr when the vCPU is
+ * blocking and requires a notification wake event).  I.e. treat vCPUs that are
+ * associated with a pCPU as running.  This API is intended to be used when a
+ * vCPU is scheduled in/out (or stops running for any reason), to do a fast
+ * update of IsRun, GALogIntr, and (conditionally) Destination.
  *
  * Per the IOMMU spec, the Destination, IsRun, and GATag fields are not cached
  * and thus don't require an invalidation to ensure the IOMMU consumes fresh
  * information.
  */
-int amd_iommu_update_ga(int cpu, void *data)
+int amd_iommu_update_ga(void *data, int cpu, bool ga_log_intr)
 {
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
@@ -3845,14 +3851,14 @@ int amd_iommu_update_ga(int cpu, void *data)
 	if (!ir_data->iommu)
 		return -ENODEV;
 
-	__amd_iommu_update_ga(entry, cpu);
+	__amd_iommu_update_ga(entry, cpu, ga_log_intr);
 
 	return __modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
 				ir_data->irq_2_irte.index, entry);
 }
 EXPORT_SYMBOL(amd_iommu_update_ga);
 
-int amd_iommu_activate_guest_mode(void *data, int cpu)
+int amd_iommu_activate_guest_mode(void *data, int cpu, bool ga_log_intr)
 {
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
@@ -3871,12 +3877,11 @@ int amd_iommu_activate_guest_mode(void *data, int cpu)
 
 	entry->lo.fields_vapic.valid       = valid;
 	entry->lo.fields_vapic.guest_mode  = 1;
-	entry->lo.fields_vapic.ga_log_intr = 1;
 	entry->hi.fields.ga_root_ptr       = ir_data->ga_root_ptr;
 	entry->hi.fields.vector            = ir_data->ga_vector;
 	entry->lo.fields_vapic.ga_tag      = ir_data->ga_tag;
 
-	__amd_iommu_update_ga(entry, cpu);
+	__amd_iommu_update_ga(entry, cpu, ga_log_intr);
 
 	return modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
 			      ir_data->irq_2_irte.index, entry);
@@ -3947,7 +3952,8 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 		ir_data->ga_vector = pi_data->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
 		if (pi_data->is_guest_mode)
-			ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+			ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu,
+							    pi_data->ga_log_intr);
 		else
 			ret = amd_iommu_deactivate_guest_mode(ir_data);
 	} else {
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index c9f2df0c4596..8cced632ecd0 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -30,9 +30,8 @@ static inline void amd_iommu_detect(void) { }
 /* IOMMU AVIC Function */
 extern int amd_iommu_register_ga_log_notifier(int (*notifier)(u32));
 
-extern int amd_iommu_update_ga(int cpu, void *data);
-
-extern int amd_iommu_activate_guest_mode(void *data, int cpu);
+extern int amd_iommu_update_ga(void *data, int cpu, bool ga_log_intr);
+extern int amd_iommu_activate_guest_mode(void *data, int cpu, bool ga_log_intr);
 extern int amd_iommu_deactivate_guest_mode(void *data);
 
 #else /* defined(CONFIG_AMD_IOMMU) && defined(CONFIG_IRQ_REMAP) */
@@ -43,12 +42,12 @@ amd_iommu_register_ga_log_notifier(int (*notifier)(u32))
 	return 0;
 }
 
-static inline int amd_iommu_update_ga(int cpu, void *data)
+static inline int amd_iommu_update_ga(void *data, int cpu, bool ga_log_intr)
 {
 	return 0;
 }
 
-static inline int amd_iommu_activate_guest_mode(void *data, int cpu)
+static inline int amd_iommu_activate_guest_mode(void *data, int cpu, bool ga_log_intr)
 {
 	return 0;
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog


