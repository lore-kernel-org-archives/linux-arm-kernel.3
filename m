Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCBC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l8+b9e0/Q6QTTa/X+Y9bPUN62TvEMYxM1Z2IjZuFKU=; b=Vf3D5ufTxvXZRGDTRJOM+31iru
	3ood26lyRZ+Kn2GBjwetBl1E5MGX0xjNKqriQekpzXwWIbxw/9QAjObUg26LW4MVPfRrRJve61SF2
	Dnka6lHKAfKa7zJceh3Q+kN2f0FKj5s4gg1n4/tixS2bCTC7TFOsU9NvKl3Y6HBUGAFj3bp6cL5Qk
	RcdgA9ZEw/c+SSOrPcI3jVVZeb16nG25LX2mvMac7dWDF0k5WMGAfCzFJIdR5ZAjqVWuHnBgSMaiX
	Ug1FC2aoZjsvleKN/RXurYFauWNX31M5CIUSDCUiC0vq1IJMIO9ZurCerNQ7ZtsJIxTn+gO3Wu/eW
	g7CRcZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVfj-0000000BmAm-1fnz;
	Thu, 12 Jun 2025 00:19:59 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDq-0000000BWu9-01wY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:07 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b16b35ea570so250532a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682024; x=1750286824; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/l8+b9e0/Q6QTTa/X+Y9bPUN62TvEMYxM1Z2IjZuFKU=;
        b=kbUUewhP6Yk4+Fj6eXYk/mEGcZL1j80TvvdPbI1dJZo3+s4oV+nRCeDwUX2YJ8hjig
         pD8HinDDQ0tATX0vDDX5f+maqg69W8l5dmRcK5PR1XnWB1V4kVFeRufrRB3VcmZF006z
         nu5GOlOaJwUYfyHCrfmrwBRGMXo9xA3dPtyolWMAn4VWFrBXuWSQNl2ijba8FpXX6BL5
         awnrnGSkkw56F1d2WVZ25aCa4Y0LzLV5pjs+xMuLHLbf4F3L5RKdTypMADXMhbPDSxYw
         AP8zTdcFxvxpsvIpngeUHse4497q2eJRwEryIFYgzFbj8JA7Az9X8kriHZA9mfFIvKm6
         AapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682024; x=1750286824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/l8+b9e0/Q6QTTa/X+Y9bPUN62TvEMYxM1Z2IjZuFKU=;
        b=j0AfYugNf61jIYj4CTGqF1Kx7wnPDuHZRKLdL3TFkBtTHTGJAazQNvkgWIjFVVUOD6
         FD0zQDxvld3H0aMrv7tPihYu4nw5GbQonB+P9kLs1vyEaVlRcNNaf9pT8yBh57ixuNHS
         F3r9SjSj8dXGYQli7fwbG/zgstOLk4doI91LeL05/ATwOkbDwyMaaq6v09bG3XQfgDJc
         43NAwWzq9IUzCtTGHPpYEp5tm9hc+ddSUxQRmlL1wAD+X3SwGoTbYYZTuWFS6z0kUKVK
         01REgpEajU+WvOBoxDa0IyfSrGm3E2JpMDAphzDfyNFpRPK4fPywEKQ3KNBSxdA66b+n
         UUHw==
X-Gm-Message-State: AOJu0YwPdPwT15TbzgNpTfPywjbO2T6/xfpLs1utrr8MPxIcSXvd9JnY
	MwS5fdfUC3h8nsii1SxoDAUDzBjgR18K3XzZUMSJbefbXsjThmrewHJ33fQHaF1SS1yp5WjkqpD
	uyJAeHg==
X-Google-Smtp-Source: AGHT+IEwLPp9ZwKHHJvdCNATCEbEk7/i7MtOM/rrdXxEjxE0o72kz2eYLC0EZSMjrHeYRytdHRQAnkeACcE=
X-Received: from pfva20.prod.google.com ([2002:a05:6a00:c94:b0:746:2414:11ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9a:b0:21f:5532:1e53
 with SMTP id adf61e73a8af0-21f9b938a55mr541389637.33.1749682024419; Wed, 11
 Jun 2025 15:47:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:08 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-7-seanjc@google.com>
Subject: [PATCH v3 05/62] KVM: SVM: Delete IRTE link from previous vCPU before
 setting new IRTE
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
X-CRM114-CacheID: sfid-20250611_154706_047147_CABE9673 
X-CRM114-Status: GOOD (  20.33  )
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

Delete the previous per-vCPU IRTE link prior to modifying the IRTE.  If
forcing the IRTE back to remapped mode fails, the IRQ is already broken;
keeping stale metadata won't change that, and the IOMMU should be
sufficiently paranoid to sanitize the IRTE when the IRQ is freed and
reallocated.

This will allow hoisting the vCPU tracking to common x86, which in turn
will allow most of the IRTE update code to be deduplicated.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 60 +++++++++------------------------------
 include/linux/kvm_irqfd.h |  1 +
 2 files changed, 14 insertions(+), 47 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index d33c01379421..ed7374f0bd5a 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -766,23 +766,19 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 	return ret;
 }
 
-static void svm_ir_list_del(struct vcpu_svm *svm,
-			    struct kvm_kernel_irqfd *irqfd,
-			    struct amd_iommu_pi_data *pi)
+static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 {
+	struct kvm_vcpu *vcpu = irqfd->irq_bypass_vcpu;
 	unsigned long flags;
-	struct kvm_kernel_irqfd *cur;
 
-	spin_lock_irqsave(&svm->ir_list_lock, flags);
-	list_for_each_entry(cur, &svm->ir_list, vcpu_list) {
-		if (cur->irq_bypass_data != pi->ir_data)
-			continue;
-		if (WARN_ON_ONCE(cur != irqfd))
-			continue;
-		list_del(&irqfd->vcpu_list);
-		break;
-	}
-	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
+	if (!vcpu)
+		return;
+
+	spin_lock_irqsave(&to_svm(vcpu)->ir_list_lock, flags);
+	list_del(&irqfd->vcpu_list);
+	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
+
+	irqfd->irq_bypass_vcpu = NULL;
 }
 
 static int svm_ir_list_add(struct vcpu_svm *svm,
@@ -795,24 +791,7 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
 	if (WARN_ON_ONCE(!pi->ir_data))
 		return -EINVAL;
 
-	/**
-	 * In some cases, the existing irte is updated and re-set,
-	 * so we need to check here if it's already been * added
-	 * to the ir_list.
-	 */
-	if (pi->prev_ga_tag) {
-		struct kvm *kvm = svm->vcpu.kvm;
-		u32 vcpu_id = AVIC_GATAG_TO_VCPUID(pi->prev_ga_tag);
-		struct kvm_vcpu *prev_vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
-		struct vcpu_svm *prev_svm;
-
-		if (!prev_vcpu)
-			return -EINVAL;
-
-		prev_svm = to_svm(prev_vcpu);
-		svm_ir_list_del(prev_svm, irqfd, pi);
-	}
-
+	irqfd->irq_bypass_vcpu = &svm->vcpu;
 	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
@@ -904,6 +883,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 
 		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
 
+		svm_ir_list_del(irqfd);
+
 		/**
 		 * Here, we setup with legacy mode in the following cases:
 		 * 1. When cannot target interrupt to a specific vcpu.
@@ -962,21 +943,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		pi.prev_ga_tag = 0;
 		pi.is_guest_mode = false;
 		ret = irq_set_vcpu_affinity(host_irq, &pi);
-
-		/**
-		 * Check if the posted interrupt was previously
-		 * setup with the guest_mode by checking if the ga_tag
-		 * was cached. If so, we need to clean up the per-vcpu
-		 * ir_list.
-		 */
-		if (!ret && pi.prev_ga_tag) {
-			int id = AVIC_GATAG_TO_VCPUID(pi.prev_ga_tag);
-			struct kvm_vcpu *vcpu;
-
-			vcpu = kvm_get_vcpu_by_id(kvm, id);
-			if (vcpu)
-				svm_ir_list_del(to_svm(vcpu), irqfd, &pi);
-		}
 	}
 out:
 	srcu_read_unlock(&kvm->irq_srcu, idx);
diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 6510a48e62aa..361c07f4466d 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -60,6 +60,7 @@ struct kvm_kernel_irqfd {
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
 
+	struct kvm_vcpu *irq_bypass_vcpu;
 	struct list_head vcpu_list;
 	void *irq_bypass_data;
 };
-- 
2.50.0.rc1.591.g9c95f17f64-goog


