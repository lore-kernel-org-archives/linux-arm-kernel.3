Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8493C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FezZVwAIX27yOhkNPTycKKVEi5uWL2iUiKq6QlVZHOU=; b=b+cu6nwmYqgo09A59puYxgemNO
	N0S4HMpXB+8PQA/5Z2UPY3ftljeP1fajr0BP9TkS2sxm8f+0FI6nyxqQ6rkmM52ZqdHwqSMWbKwq2
	s7SOOgPFVCCp8fuapGDHdP6Hx1Xoxnz5NzUYVqd1dPKAuMKm3GUT3k9ZIhB7pwgRDHQ1Wke40nzO3
	5qQLqjd1MZlOi2VgDC4B9YI7hL0EzcUNch4kNcZVkTmyQ/Cq90DGcoGedKpm1c9LKMviEOVsMWwbB
	/bKzNH+xLgVRtfASnAvnAUfqjAK1SnBd8n8o1L1YGld+jz3slun6VU5ucvDEQ7mctkUoab9lO4IVy
	XCR+/qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXSy-0000000BwWv-1OHQ;
	Thu, 12 Jun 2025 02:14:56 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFJ-0000000BY0L-2j0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:38 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2350804a43eso4300295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682116; x=1750286916; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FezZVwAIX27yOhkNPTycKKVEi5uWL2iUiKq6QlVZHOU=;
        b=XWHP6CIxgUHH1CKWr9++6PEJAPwQskZ6IiIC2kHA8ffrw68xPcoP06yJABzJgB1IZS
         6Pf5np3WlpZ6W7H+NTXtK98n7xU7oDCmvAVad+lh1iorki1CPd8J84aZ0MjmMw92HoV9
         qrvBEnrbqurl0+qbO+o9ZoP6/22mh219IkyItz+cF38xU8cbCgnAhG7fA5fYnOIpR8NG
         NqsUcY6JMfQA9qe0d1hzXxP18dhq3LIdlq12JOnqfGkd3rjr7WEjnPPwYrE+qTKPLinm
         cZUEPl0RtjUSJ99dhw47jKNeXgLTX85jX1S/lav1nCBaHzS7E1He+FenUxtfqXbLeFbG
         HjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682116; x=1750286916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FezZVwAIX27yOhkNPTycKKVEi5uWL2iUiKq6QlVZHOU=;
        b=RuGMhVqS/BsV1xUGH98IEtjrhRbwp2hwj1FBfBbBQl0TN6GwthluFAz0fbcP3aZ387
         GHhHPzfK20YxF+TFfNTycNewu9brQp0yc2c/fjoqk32A5qcK3sfyXZ+bo2UW+aEeFHAR
         M/Ma254rUhmEjbQfQBiTZqvXJzg+eXFjSYX+bxvoFafFXw5CKiwN1JiTO+MFnvQercgu
         fSfssBP6V808ZOt5kE4F4E8Ui5Q/0gjpHPVB54Dqt1Mez3gXzEuR7OPfCD9ealSJShBp
         OJ6FycIpU0I+7AGxRnW6pq0LsWetcgjCUBgA6jxKg5IS1Egk8Zl20dj76Y47e0Hc0Do5
         r+CA==
X-Gm-Message-State: AOJu0YxZdKLAN0mmEHc/Tb5WPOSaVYCK/GbInSLXtPmRhEVPY/tYPXMU
	aRgRK4+qGnX6zB8t7tHO/OXj9swdP3SC7W+47dlkiLdYO7pu4e0rjDpy42MFC2sXNzsVbp+UOCW
	QJwSWyg==
X-Google-Smtp-Source: AGHT+IE0mnhzPmaGDjcFYBs1HKY/3aqg20RLoeGBLv7o8irQVmRVOs75AEwPqXs1TaFQwm4uFyelNA0uq7s=
X-Received: from pjbsg18.prod.google.com ([2002:a17:90b:5212:b0:311:ff32:a85d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acb:b0:313:28f1:fc33
 with SMTP id 98e67ed59e1d1-313c06872aemr1120199a91.10.1749682116501; Wed, 11
 Jun 2025 15:48:36 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:01 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-60-seanjc@google.com>
Subject: [PATCH v3 58/62] KVM: SVM: Don't check vCPU's blocking status when
 toggling AVIC on/off
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
X-CRM114-CacheID: sfid-20250611_154837_691470_BD73A4BE 
X-CRM114-Status: GOOD (  20.01  )
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

Don't query a vCPU's blocking status when toggling AVIC on/off; barring
KVM bugs, the vCPU can't be blocking when refreshing AVIC controls.  And
if there are KVM bugs, ensuring the vCPU and its associated IRTEs are in
the correct state is desirable, i.e. well worth any overhead in a buggy
scenario.

Isolating the "real" load/put flows will allow moving the IOMMU IRTE
(de)activation logic from avic_refresh_apicv_exec_ctrl() to
avic_update_iommu_vcpu_affinity(), i.e. will allow updating the vCPU's
physical ID entry and its IRTEs in a common path, under a single critical
section of ir_list_lock.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 65 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 9ddec6f3ad41..1e6e5d1f6b4e 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -828,7 +828,7 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
 		WARN_ON_ONCE(amd_iommu_update_ga(cpu, irqfd->irq_bypass_data));
 }
 
-void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	int h_physical_id = kvm_cpu_get_apicid(cpu);
@@ -844,16 +844,6 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >= PAGE_SIZE))
 		return;
 
-	/*
-	 * No need to update anything if the vCPU is blocking, i.e. if the vCPU
-	 * is being scheduled in after being preempted.  The CPU entries in the
-	 * Physical APIC table and IRTE are consumed iff IsRun{ning} is '1'.
-	 * If the vCPU was migrated, its new CPU value will be stuffed when the
-	 * vCPU unblocks.
-	 */
-	if (kvm_vcpu_is_blocking(vcpu))
-		return;
-
 	/*
 	 * Grab the per-vCPU interrupt remapping lock even if the VM doesn't
 	 * _currently_ have assigned devices, as that can change.  Holding
@@ -888,31 +878,33 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
 
-void avic_vcpu_put(struct kvm_vcpu *vcpu)
+void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * No need to update anything if the vCPU is blocking, i.e. if the vCPU
+	 * is being scheduled in after being preempted.  The CPU entries in the
+	 * Physical APIC table and IRTE are consumed iff IsRun{ning} is '1'.
+	 * If the vCPU was migrated, its new CPU value will be stuffed when the
+	 * vCPU unblocks.
+	 */
+	if (kvm_vcpu_is_blocking(vcpu))
+		return;
+
+	__avic_vcpu_load(vcpu, cpu);
+}
+
+static void __avic_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	unsigned long flags;
-	u64 entry;
+	u64 entry = svm->avic_physical_id_entry;
 
 	lockdep_assert_preemption_disabled();
 
 	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >= PAGE_SIZE))
 		return;
 
-	/*
-	 * Note, reading the Physical ID entry outside of ir_list_lock is safe
-	 * as only the pCPU that has loaded (or is loading) the vCPU is allowed
-	 * to modify the entry, and preemption is disabled.  I.e. the vCPU
-	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
-	 * recursively.
-	 */
-	entry = svm->avic_physical_id_entry;
-
-	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
-	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
-		return;
-
 	/*
 	 * Take and hold the per-vCPU interrupt remapping lock while updating
 	 * the Physical ID entry even though the lock doesn't protect against
@@ -932,7 +924,24 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 		WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
 
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
+}
 
+void avic_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Note, reading the Physical ID entry outside of ir_list_lock is safe
+	 * as only the pCPU that has loaded (or is loading) the vCPU is allowed
+	 * to modify the entry, and preemption is disabled.  I.e. the vCPU
+	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
+	 * recursively.
+	 */
+	u64 entry = to_svm(vcpu)->avic_physical_id_entry;
+
+	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
+	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
+		return;
+
+	__avic_vcpu_put(vcpu);
 }
 
 void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
@@ -973,9 +982,9 @@ void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 	avic_refresh_virtual_apic_mode(vcpu);
 
 	if (activated)
-		avic_vcpu_load(vcpu, vcpu->cpu);
+		__avic_vcpu_load(vcpu, vcpu->cpu);
 	else
-		avic_vcpu_put(vcpu);
+		__avic_vcpu_put(vcpu);
 
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
-- 
2.50.0.rc1.591.g9c95f17f64-goog


