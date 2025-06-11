Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA567C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDp2MAm1ts1xFlPsVR9eKX3SKPzdTZ7kBVeXKS2SKzA=; b=bUIN8AlmwKNkl/sXDuPtkPxI6N
	P07kFim3YX9oIWRhdW1/Aj6l1jbDnysHpMpy5I85XndsFHcWQQyhCPFmVz96I/Moxi2MMqEa6MNi2
	HwUABzcC0vHi9UPMn9K00rKQ30COP+jWqG3on3FWQxK28HQg9nH1JG6KEdYuKi20nOky76FoRJfrB
	FfBEG3+hTHwvtww5ULcu94qWO5wzj2XHOK7pn67JAHKFuc70o/yn+jE4cD5N8jIRTYKHjOEOiHW3H
	w57BvKvTHbY1u5hdk0fhZ5V2bCnVinsdyMvU+zNovCrjW3/Rd1XB5/UPmpsBSI+RlCFYAfdAXqTVB
	+TUg2lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXQs-0000000BwOh-2lOr;
	Thu, 12 Jun 2025 02:12:46 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFH-0000000BXxp-48UD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:37 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311b6d25278so342080a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682115; x=1750286915; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EDp2MAm1ts1xFlPsVR9eKX3SKPzdTZ7kBVeXKS2SKzA=;
        b=QUbJptUtWHyE20tMDgVNENBWewz9lCXW37nvXdeBMnW6lyqzGft7FrR4RQE5HzHnA8
         5VUCOPHw1eMb3y/ofpbOMBRnNGmeTAjK/yPjnglLFDYfT8W8yzQ79vu8VrTMo6M8MsjQ
         gSwdihmY7mTgd6SfD4lopn/zQBg2NAUWWU0m9MpMA3VJ+ObV+F2DquSPpEDkKWnt8UWk
         dEBrrJ/QxISXmtotkB9dgyqAHQUiUm77kO/6D+jr58T+minEA2nnwLLdCvtnpKhIiGYG
         T1hHGbPsL/H0yPZsND3Ut7cKz01+drGCuVX+jo3WXCP7ueANj2TAgRpGhoanyA6r8KgT
         PzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682115; x=1750286915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDp2MAm1ts1xFlPsVR9eKX3SKPzdTZ7kBVeXKS2SKzA=;
        b=CuOxxhRhTcHUdZtS9HP+yzfBe3p7WGybb8/1TMY9jrX06Wkc8X4d4xIHWdxZSze/Nq
         AHkzgzQ6gp98opvUic1NuLmjH0mfIJNsh06ypJ2gpA8vQHzy/SPqnW20jypQUA602pLV
         P4Qy9YhMaG5gnPSi3lJVkoetdCdZ38xy0NJhTq1hjSJRenLUShnHOM7nvb3ryI3EvlpO
         N+LNzKVrA8Lk+bqKUTx0t5rvTU2Ogz/ZQgrnIz2v8zyl82AEK1vHwSFqUb8TBRUea179
         i5pR/wp0pkcWGj0NHysNG7yhiqCeK46/DmmZkvwUZT8+5ye1vrUqaDGNHJo5rM9ufMCM
         3TAw==
X-Gm-Message-State: AOJu0Yxfv1D0ttvS76XphD4mvBlT7kaB3LwNIkV3c7yE+dDiGBV0s34O
	Dls6EaxoLpZhDIMvsAoGEZ8Mcfv12GFOK5OY9fdAeIEn7iSZi3dQNujKDVBXe+7Ex5+9QkZpN3b
	2SFKn6A==
X-Google-Smtp-Source: AGHT+IEbfo0mMPt12ljEjE30pCWmP1qbKv/AIuMxYG67rAiSNKYcSiWLenrS7AYH9QEP9z44f7kSaVHJGlo=
X-Received: from pjbsz14.prod.google.com ([2002:a17:90b:2d4e:b0:311:d264:6f5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55c6:b0:312:f650:c795
 with SMTP id 98e67ed59e1d1-313c08b05afmr1045053a91.21.1749682114717; Wed, 11
 Jun 2025 15:48:34 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:00 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-59-seanjc@google.com>
Subject: [PATCH v3 57/62] KVM: SVM: Fold avic_set_pi_irte_mode() into its sole caller
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
X-CRM114-CacheID: sfid-20250611_154836_022645_185C2CC8 
X-CRM114-Status: GOOD (  14.31  )
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

Fold avic_set_pi_irte_mode() into avic_refresh_apicv_exec_ctrl() in
anticipation of moving the __avic_vcpu_{load,put}() calls into the
critical section, and because having a one-off helper with a name that's
easily confused with avic_pi_update_irte() is unnecessary.

No functional change intended.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 52 ++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index bb74705d6cfd..9ddec6f3ad41 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -728,34 +728,6 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 	avic_handle_ldr_update(vcpu);
 }
 
-static void avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
-{
-	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
-	unsigned long flags;
-	struct vcpu_svm *svm = to_svm(vcpu);
-	struct kvm_kernel_irqfd *irqfd;
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
-		if (activate)
-			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
-		else
-			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
-	}
-out:
-	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-}
-
 static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 {
 	struct kvm_vcpu *vcpu = irqfd->irq_bypass_vcpu;
@@ -990,6 +962,10 @@ void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
 void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 {
 	bool activated = kvm_vcpu_apicv_active(vcpu);
+	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
+	struct vcpu_svm *svm = to_svm(vcpu);
+	struct kvm_kernel_irqfd *irqfd;
+	unsigned long flags;
 
 	if (!enable_apicv)
 		return;
@@ -1001,7 +977,25 @@ void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 	else
 		avic_vcpu_put(vcpu);
 
-	avic_set_pi_irte_mode(vcpu, activated);
+	/*
+	 * Here, we go through the per-vcpu ir_list to update all existing
+	 * interrupt remapping table entry targeting this vcpu.
+	 */
+	spin_lock_irqsave(&svm->ir_list_lock, flags);
+
+	if (list_empty(&svm->ir_list))
+		goto out;
+
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		void *data = irqfd->irq_bypass_data;
+
+		if (activated)
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
+		else
+			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
+	}
+out:
+	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
 
 void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


