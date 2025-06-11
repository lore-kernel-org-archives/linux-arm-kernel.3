Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DFFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbXp9fY7meDnEME0LsYBGX1Fint2Pz95NNyIdmrjoGE=; b=SU4i4OYbsTs05pwDcgze64OtjS
	VuKQLdvQXhlQ9gT9T7MpLBsTkg/9NOj6L0Bimzwpv+7Q+/kjL3JGwy1jl24Iysg5zO+U7EhV+ixur
	+ZaIstrbIUBOK+z+RwDzKi/Q/Hr3oSUQAhx5dlHfB5hVxUSyJCGMW9q5QVG1LdxOGrPZKyo3ktQjE
	1UMf03aTBOT2WYN2Y9tib46p9RVyM/FrN4W4UeZy9BBPVvt39G4hIVvv3AFLYeJZaSzGTz/8zxSE8
	LHYLqGUcBeiL/PsR8wOlnHFC5z+RYm+nvss67NfC5nj1mFac4CVpih7nfax9H+VvR6lDAyUCPux6X
	z467hcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXV4-0000000Bwfc-0Sib;
	Thu, 12 Jun 2025 02:17:06 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFL-0000000BY2B-1IfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:40 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-73bfc657aefso225260b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682118; x=1750286918; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbXp9fY7meDnEME0LsYBGX1Fint2Pz95NNyIdmrjoGE=;
        b=Y7lqDOYrFINbUgsd3QiMMYQTG6O5GabUjeMWZR6D+H+ubY1/AiHrwMsyzqo/lrCt6z
         lE7SxYc+Fs+gfM7mf0U0UL7xZ1u/so0Wx9/ZPrtGScy0o14yz1RFhrsp1zXeUHp4lsO4
         bllscvltrt1WY+ZL3ZFzry5DIFVSMr1EyDE3xJQOq82UHSnGrfJiZ6lFXsCrZIWtHUyf
         e0Aoljy6Y7kVg7IjuBDjMtP1urfBaMh+O7l/QcPmD9Wo0Qt3EQ/lsBhWuwAlt0Dmu7AF
         8dnMOCeMTUw3Or8zTrk4uP1mFUqpmKLVPbPJft2PYUbqTCCF7tqlq2RplFORdGRkrPwl
         YpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682118; x=1750286918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbXp9fY7meDnEME0LsYBGX1Fint2Pz95NNyIdmrjoGE=;
        b=V6j6H/Zx/mUGX4Q20sLFFFZ+POOW4dM5H7TIEnUYcGwH8DKDAbDHuFr6Rnd77WN2hI
         4R0ZT6YROC01F/XuUKgkxzwqTKTS8W+jw7UKxKVGncSTex9luycgIoUoWBpzQBo/9g27
         +yeO570CS6SoW/gh/cbQ8tfgUHtVUNgFg4kD4r+DV0f9kh8MDrUHmslomJAJPLj/Outs
         J6flIBLWbPjkp+NUHIJZRrMrVaYQ+yfZ0HnO/xhDP4MeTvBC5kJr4Rh0MK5x22NRe2g5
         JF7wmgGcmCZI61TA31pkGftN1Zw85px2aRK0bcvbMCuxCY9fIxbOWMgbmJpatz+1W1jw
         p0ZA==
X-Gm-Message-State: AOJu0YxKHLGC40gmgKjXdu6btZMEWq+u3o+IWm1/1Of50fiiQyO5xiNp
	ik0QGgm0LtPHlHl4f5PS2Ej+Q17KaeZgEcMsbx1jqEpnFT8JOOkABE+vANLQLlzmWtmUpyayBze
	P//zXrQ==
X-Google-Smtp-Source: AGHT+IHvf3odZF8McDLukwtR+c5Ts/RiD+Gr/igRa+Gy+FZyAPIiyl4mAfkupeFQ3doXLOpmODAbezE5sRM=
X-Received: from pfblu14.prod.google.com ([2002:a05:6a00:748e:b0:747:aac7:7c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748c:b0:21d:375a:ee33
 with SMTP id adf61e73a8af0-21f9b6a21bbmr686227637.9.1749682117969; Wed, 11
 Jun 2025 15:48:37 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:02 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-61-seanjc@google.com>
Subject: [PATCH v3 59/62] KVM: SVM: Consolidate IRTE update when toggling AVIC on/off
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
X-CRM114-CacheID: sfid-20250611_154839_348988_19C363B4 
X-CRM114-Status: GOOD (  18.79  )
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

Fold the IRTE modification logic in avic_refresh_apicv_exec_ctrl() into
__avic_vcpu_{load,put}(), and add a param to the helpers to communicate
whether or not AVIC is being toggled, i.e. if IRTE needs a "full" update,
or just a quick update to set the CPU and IsRun.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 85 ++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 39 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 1e6e5d1f6b4e..2e47559a4134 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -810,7 +810,28 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
 
-static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
+enum avic_vcpu_action {
+	/*
+	 * There is no need to differentiate between activate and deactivate,
+	 * as KVM only refreshes AVIC state when the vCPU is scheduled in and
+	 * isn't blocking, i.e. the pCPU must always be (in)valid when AVIC is
+	 * being (de)activated.
+	 */
+	AVIC_TOGGLE_ON_OFF	= BIT(0),
+	AVIC_ACTIVATE		= AVIC_TOGGLE_ON_OFF,
+	AVIC_DEACTIVATE		= AVIC_TOGGLE_ON_OFF,
+
+	/*
+	 * No unique action is required to deal with a vCPU that stops/starts
+	 * running, as IRTEs are configured to generate GALog interrupts at all
+	 * times.
+	 */
+	AVIC_START_RUNNING	= 0,
+	AVIC_STOP_RUNNING	= 0,
+};
+
+static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
+					    enum avic_vcpu_action action)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
@@ -824,11 +845,20 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
 	if (list_empty(&svm->ir_list))
 		return;
 
-	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list)
-		WARN_ON_ONCE(amd_iommu_update_ga(cpu, irqfd->irq_bypass_data));
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		void *data = irqfd->irq_bypass_data;
+
+		if (!(action & AVIC_TOGGLE_ON_OFF))
+			WARN_ON_ONCE(amd_iommu_update_ga(cpu, data));
+		else if (cpu >= 0)
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu));
+		else
+			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
+	}
 }
 
-static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu,
+			     enum avic_vcpu_action action)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	int h_physical_id = kvm_cpu_get_apicid(cpu);
@@ -873,7 +903,7 @@ static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
 
-	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id);
+	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id, action);
 
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
@@ -890,10 +920,10 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	__avic_vcpu_load(vcpu, cpu);
+	__avic_vcpu_load(vcpu, cpu, AVIC_START_RUNNING);
 }
 
-static void __avic_vcpu_put(struct kvm_vcpu *vcpu)
+static void __avic_vcpu_put(struct kvm_vcpu *vcpu, enum avic_vcpu_action action)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -915,7 +945,7 @@ static void __avic_vcpu_put(struct kvm_vcpu *vcpu)
 	 */
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
 
-	avic_update_iommu_vcpu_affinity(vcpu, -1);
+	avic_update_iommu_vcpu_affinity(vcpu, -1, action);
 
 	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
 	svm->avic_physical_id_entry = entry;
@@ -941,7 +971,7 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
 		return;
 
-	__avic_vcpu_put(vcpu);
+	__avic_vcpu_put(vcpu, AVIC_STOP_RUNNING);
 }
 
 void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
@@ -970,41 +1000,18 @@ void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
 
 void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 {
-	bool activated = kvm_vcpu_apicv_active(vcpu);
-	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
-	struct vcpu_svm *svm = to_svm(vcpu);
-	struct kvm_kernel_irqfd *irqfd;
-	unsigned long flags;
-
 	if (!enable_apicv)
 		return;
 
+	/* APICv should only be toggled on/off while the vCPU is running. */
+	WARN_ON_ONCE(kvm_vcpu_is_blocking(vcpu));
+
 	avic_refresh_virtual_apic_mode(vcpu);
 
-	if (activated)
-		__avic_vcpu_load(vcpu, vcpu->cpu);
+	if (kvm_vcpu_apicv_active(vcpu))
+		__avic_vcpu_load(vcpu, vcpu->cpu, AVIC_ACTIVATE);
 	else
-		__avic_vcpu_put(vcpu);
-
-	/*
-	 * Here, we go through the per-vcpu ir_list to update all existing
-	 * interrupt remapping table entry targeting this vcpu.
-	 */
-	spin_lock_irqsave(&svm->ir_list_lock, flags);
-
-	if (list_empty(&svm->ir_list))
-		goto out;
-
-	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
-		void *data = irqfd->irq_bypass_data;
-
-		if (activated)
-			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
-		else
-			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
-	}
-out:
-	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
+		__avic_vcpu_put(vcpu, AVIC_DEACTIVATE);
 }
 
 void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
@@ -1030,7 +1037,7 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
 	 * CPU and cause noisy neighbor problems if the VM is sending interrupts
 	 * to the vCPU while it's scheduled out.
 	 */
-	avic_vcpu_put(vcpu);
+	__avic_vcpu_put(vcpu, AVIC_STOP_RUNNING);
 }
 
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


