Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07622C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWlaEFL1PUnGvKov0qrFcR2EuojVTo0yUVeuiRnl1MQ=; b=zlN9Bw/emAg7HuF8o5/f8vM0gc
	VgKVCkdNtSPfitt7wpwpMkxR40zmJVN4oFlDB1hnBwZDE6zGCsoOkLk9hzpEbNDVWqoryZI+C/Hur
	WzBRnVjifUtYnu5Orve/gefxWg64A0pQjpVyIxAjm0FUnNLKF2YOtSFX7y83tCFz0QL0l0IZGltvj
	mKPXBTPdauAHgv6++e+pvLCUS0hTwaTmejTvvyeq8hcP60Jp5IlOLWLH9/cvO5OampXxwgos4Dgb4
	/9Fw4Og9CXWMIR+Muc+rCfGIkbnoWl7aabmKNPK6OwaLShNUy60bmDYkwDeDMYa4tcTrW0i1014/s
	gyWBdVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWLi-0000000Bqo9-3Zwl;
	Thu, 12 Jun 2025 01:03:22 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEN-0000000BXMV-3ZWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:40 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747dd44048cso284185b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682059; x=1750286859; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EWlaEFL1PUnGvKov0qrFcR2EuojVTo0yUVeuiRnl1MQ=;
        b=2gnSECkPoHB+/yXXP03AsCw9DAQpzA0X525M/j1dZ+Nr0AawcV+2uvHYvL6qj8wWr8
         snU4BX0EEgsGqfFSDQGvwmbqtS8lXzyB6ULNEuo3tDQGR9w4d+bfXqUT9ZMyyVaVwuFA
         fGcNojxfaTSGsQ0FpZ4hb6+7zMeT76Ej3Euoh+UH1nb/aIkshAjZC0FSQjpcJ4CUun9/
         rurgE8zoRB7sPjCQ17n0Hcre/BFuXHAi1IWHtE+n99D/HgS8sjwh1YnzKMezfJ/bJUMk
         uAGACVOUxV123cTG6L64ZIfljY7E3it3WVVEo10JtPrnR8jeEhR86Ax2+wcc/3iuEIPI
         cNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682059; x=1750286859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWlaEFL1PUnGvKov0qrFcR2EuojVTo0yUVeuiRnl1MQ=;
        b=pI/goUbb/nQCdqEiYRWLwQU78pqo4I5SXO0eZFQot3eEAWYcX07el4f/YzkmppQqkL
         RV6oEQ9r2xA6SxOQ3Ab4yPcBNPCmtDmjaHLIQD70CgfFy/NyyFZAMI8npX86du1AP9KH
         toX3TL189975YEsMrcnRoK+vb14p/wXu8nJKZa3uSbGRTqi9YxerPQ8VYItUWeIkMvQt
         OVm28kGnb6+3/HiDnSdQLIZJ0qztKyeu5sPi64BElobNrdyH+uAgI2H/4GqH8aARqJ2T
         mYFWfgTsiw0nDNgnGUlsyaVwKVXAVQnnSx/3KzwuZVdo99+m/FI6aufpduaoHdeKfnt2
         j9dg==
X-Gm-Message-State: AOJu0Yysk+k2bb8SLzGSZAXRdil1ZIKM/045Hd6mWN2LJt7pznPWqyh2
	kUPK2D1PAnJhlqd6FmYSx4gSkbBCBswRd+OlanL0UEBRMFM8QOYptERp8+f6hVlmHuz9qW2QRrt
	hiXoPnA==
X-Google-Smtp-Source: AGHT+IGqrnoO1KrxPHkw7mtKYmJwMGPuKTrPb0AcYQOuUunb5B6w6dzsz0HfUlLTGR+LG8OGb1BWB2PGJ7s=
X-Received: from pfsq2.prod.google.com ([2002:a05:6a00:2a2:b0:746:25af:51c4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4095:b0:747:b043:41e8
 with SMTP id d2e1a72fcca58-7487c2afac6mr1379741b3a.15.1749682058654; Wed, 11
 Jun 2025 15:47:38 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:28 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-27-seanjc@google.com>
Subject: [PATCH v3 25/62] KVM: SVM: Extract SVM specific code out of get_pi_vcpu_info()
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
X-CRM114-CacheID: sfid-20250611_154739_898487_293637F4 
X-CRM114-Status: GOOD (  15.04  )
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

Genericize SVM's get_pi_vcpu_info() so that it can be shared with VMX.
The only SVM specific information it provides is the AVIC back page, and
that can be trivially retrieved by its sole caller.

No functional change intended.

Cc: Francesco Lavra <francescolavra.fl@gmail.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index a83769bb8123..3bbd565dcd0f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -816,14 +816,14 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
  */
 static int
 get_pi_vcpu_info(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
-		 struct vcpu_data *vcpu_info, struct vcpu_svm **svm)
+		 struct vcpu_data *vcpu_info, struct kvm_vcpu **vcpu)
 {
 	struct kvm_lapic_irq irq;
-	struct kvm_vcpu *vcpu = NULL;
+	*vcpu = NULL;
 
 	kvm_set_msi_irq(kvm, e, &irq);
 
-	if (!kvm_intr_is_single_vcpu(kvm, &irq, &vcpu) ||
+	if (!kvm_intr_is_single_vcpu(kvm, &irq, vcpu) ||
 	    !kvm_irq_is_postable(&irq)) {
 		pr_debug("SVM: %s: use legacy intr remap mode for irq %u\n",
 			 __func__, irq.vector);
@@ -832,8 +832,6 @@ get_pi_vcpu_info(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
 
 	pr_debug("SVM: %s: use GA mode for irq %u\n", __func__,
 		 irq.vector);
-	*svm = to_svm(vcpu);
-	vcpu_info->pi_desc_addr = avic_get_backing_page_address(*svm);
 	vcpu_info->vector = irq.vector;
 
 	return 0;
@@ -845,7 +843,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 {
 	bool enable_remapped_mode = true;
 	struct vcpu_data vcpu_info;
-	struct vcpu_svm *svm = NULL;
+	struct kvm_vcpu *vcpu = NULL;
 	int ret = 0;
 
 	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
@@ -868,19 +866,20 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
 	 */
 	if (new && new->type == KVM_IRQ_ROUTING_MSI &&
-	    !get_pi_vcpu_info(kvm, new, &vcpu_info, &svm) &&
-	    kvm_vcpu_apicv_active(&svm->vcpu)) {
+	    !get_pi_vcpu_info(kvm, new, &vcpu_info, &vcpu) &&
+	    kvm_vcpu_apicv_active(vcpu)) {
 		struct amd_iommu_pi_data pi;
 
 		enable_remapped_mode = false;
 
+		vcpu_info.pi_desc_addr = avic_get_backing_page_address(to_svm(vcpu));
+
 		/*
 		 * Try to enable guest_mode in IRTE.  Note, the address
 		 * of the vCPU's AVIC backing page is passed to the
 		 * IOMMU via vcpu_info->pi_desc_addr.
 		 */
-		pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
-					     svm->vcpu.vcpu_id);
+		pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id, vcpu->vcpu_id);
 		pi.is_guest_mode = true;
 		pi.vcpu_data = &vcpu_info;
 		ret = irq_set_vcpu_affinity(host_irq, &pi);
@@ -893,11 +892,11 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * scheduling information in IOMMU irte.
 		 */
 		if (!ret)
-			ret = svm_ir_list_add(svm, irqfd, &pi);
+			ret = svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
 	}
 
-	if (!ret && svm) {
-		trace_kvm_pi_irte_update(host_irq, svm->vcpu.vcpu_id,
+	if (!ret && vcpu) {
+		trace_kvm_pi_irte_update(host_irq, vcpu->vcpu_id,
 					 guest_irq, vcpu_info.vector,
 					 vcpu_info.pi_desc_addr, !!new);
 	}
-- 
2.50.0.rc1.591.g9c95f17f64-goog


