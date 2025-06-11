Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E427FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1flKB2rjVjkv7C0HFQg1l92d+sykuVaruHJBCaF8LA=; b=hNbQlABl0I27m5Bbhmd1gks26G
	uilgS5u2l/73JBqpYp2PaneQ82aHt4IdqMXQtrK08m9YgZFANXmqoO0Pee31rYtgqv22eRq5gSz20
	/rYgggHYqPRn/l2KnL4iGe9tm99JTpc/pTM8gBDWAtVMz0qDGeNImztYXZhBS06cJtfR0jygQS4jJ
	5zOEZnz5HZ08XIAWK6ctrJ20sIIhixnAR3qRI+eOXK7yjG6Dz+3IaYur0IW7inZD6jk3vNLO6HoqA
	za7UCM1a1Hsw8xIQVUEBJTSfzy95KY8GS5PHnmV5US0NbMuHnjE+ZMy2tk5t7p0SOsNZ+R1BcnmvE
	GRM0yFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWkt-0000000BsZm-27ce;
	Thu, 12 Jun 2025 01:29:23 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEi-0000000BXZO-3Lub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:02 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7377139d8b1so263433b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682079; x=1750286879; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=v1flKB2rjVjkv7C0HFQg1l92d+sykuVaruHJBCaF8LA=;
        b=21HLGqpJS0XwDgS2Ld5u/Hq3E9szgJwQJug8MmpHWkhgvR+hwnro5IOWPDsP/Hpi1P
         S5npGrYpQs6qCP8yO1Qhf0DNGqkQzym7q3j/tws4Yb8q7fkixuipVn7tZN243rryrNYD
         Qzte5OvUIJ9vBBYq093SKuqjqVbsJSMQpYuv49Cbus4/Pqbg/yCfgTOiF/1dJpllUp8Y
         01jzYDwbPHmdRHCmRlucaMYGE3ubk7+lPZiahF3260Ilv+9VLU+Fvpe4KufAPQVr3Z5h
         BybrGDlxulsQhD6/9Vjen5LRoivTo0Iswszr+jOF0g/QB1/TpolMCt89q1mL2xv9D/vk
         8Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682079; x=1750286879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1flKB2rjVjkv7C0HFQg1l92d+sykuVaruHJBCaF8LA=;
        b=SVMtbsaOY0c4CdlZdywralXtoAc4emsA+/WoWEijmglKMem07qb7lrWQIOlb1AiRKU
         e5koPcAffYd423Gs03kOBeoWGRmhTPSLrhERdPTetcU7HxT0aV4aEyWGtQLPSara9//a
         Fe01hR19KL8p4iqxUCJjLqSa0kDb199cG+Gq6ln0CYkmxncU8FZ0xlZy8+zGCabtT6Zr
         6WMzMPfjq6ROAHnrxrJ9HPMvCN1D5sLRgi/7LpzfL6vV3t0lmHqFx2b4GJSb65+v89V8
         kBalmV5iT4RgPE22+RV8SpcdaF1Y3qiHOZhBtRpgu4WxFLevMPrhuAr8ECps+JZP+Izv
         U9Ug==
X-Gm-Message-State: AOJu0YzDi71g88aMJiaUsctzYvCsYzauw6VVpOPWkYaqurj52txGZLuQ
	gX4mFKvtbz8ooJRSJtRfQWQL8aNNa20rLNDtYpNor7WjHDpwrPAzqPQtGECGLBsit4CNcLYA9px
	OUa/bFw==
X-Google-Smtp-Source: AGHT+IHuGa3sQaIRlgIMVwUeJGMvQqMviqpQnF96PVE++cQNjn6g/w0sfScCYFw1komkaHU5/0t+EZgb2Qc=
X-Received: from pflc8.prod.google.com ([2002:a05:6a00:ac8:b0:746:1e60:660e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c3:b0:742:ae7e:7da8
 with SMTP id d2e1a72fcca58-7487e0f4792mr1105962b3a.8.1749682079546; Wed, 11
 Jun 2025 15:47:59 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:40 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-39-seanjc@google.com>
Subject: [PATCH v3 37/62] KVM: SVM: Revert IRTE to legacy mode if IOMMU
 doesn't provide IR metadata
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
X-CRM114-CacheID: sfid-20250611_154800_840572_C95D3DBC 
X-CRM114-Status: GOOD (  15.12  )
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

Revert the IRTE back to remapping mode if the AMD IOMMU driver mucks up
and doesn't provide the necessary metadata.  Returning an error up the
stack without actually handling the error is useless and confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 97b747e82012..f1e9f0dd43e8 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -769,16 +769,13 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
 }
 
-static int svm_ir_list_add(struct vcpu_svm *svm,
-			   struct kvm_kernel_irqfd *irqfd,
-			   struct amd_iommu_pi_data *pi)
+static void svm_ir_list_add(struct vcpu_svm *svm,
+			    struct kvm_kernel_irqfd *irqfd,
+			    struct amd_iommu_pi_data *pi)
 {
 	unsigned long flags;
 	u64 entry;
 
-	if (WARN_ON_ONCE(!pi->ir_data))
-		return -EINVAL;
-
 	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
@@ -796,7 +793,6 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
 
 	list_add(&irqfd->vcpu_list, &svm->ir_list);
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-	return 0;
 }
 
 int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
@@ -833,6 +829,16 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		if (ret)
 			return ret;
 
+		/*
+		 * Revert to legacy mode if the IOMMU didn't provide metadata
+		 * for the IRTE, which KVM needs to keep the IRTE up-to-date,
+		 * e.g. if the vCPU is migrated or AVIC is disabled.
+		 */
+		if (WARN_ON_ONCE(!pi_data.ir_data)) {
+			irq_set_vcpu_affinity(host_irq, NULL);
+			return -EIO;
+		}
+
 		/**
 		 * Here, we successfully setting up vcpu affinity in
 		 * IOMMU guest mode. Now, we need to store the posted
@@ -840,7 +846,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * we can reference to them directly when we update vcpu
 		 * scheduling information in IOMMU irte.
 		 */
-		return svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
+		svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
+		return 0;
 	}
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog


