Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1130C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVzEHyBaRiJNDQh5a5Dx7H8kv7wjszZU3WXvYcKHvtU=; b=c0FnrzJi4+yeNfHxcMeZvtVhlX
	HNqedzO/eUvAf/K2asTGx9y8LMmL1vdx18k9p6H6e+47OVnJJZxSaX8oI0vXnwckxzn10mXioqgM+
	LZXx2dRiXpr92/Q5/5LHUpG86ftG3TpYPYMh2+J2nYMMfO7h36i69SZ7fjsNAan4VpVRSjEs0JrtC
	4Mu3nGAGHkrDisAJu+ua4rY4ZAjxToBX/PrrO2Mxmzw3eSnw92I6bn3RthIEkIcPMlIDQC7knOU98
	2Fw18CIcuOdc659IOF82+H8v8YrDJFq0fsR82dWyXVEHiqF7C4EiA+qrZVVdZKqb5NPXLXLUZW+Yk
	GSLnogiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVyd-0000000BndI-0cHn;
	Thu, 12 Jun 2025 00:39:31 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUE7-0000000BXAx-1kNE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747cebffd4eso233085b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682042; x=1750286842; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uVzEHyBaRiJNDQh5a5Dx7H8kv7wjszZU3WXvYcKHvtU=;
        b=JIWfxi/QbOUND80hA7DRMKgsvjcI5UNCjF6Qj1/xTruv81RDeSAq8qW0IcvV0maceR
         QWITG3GnZKxbrHBKrkgLZejrpGjcd8EONNzO+K7yGUfH7YxKBzJfd0e3+OgScTLdjs8n
         mp1oquygW6QetZ12ExR2yXDpU8L+2zotwhPSW8HSrhylcKo0NQ17Hl58hUEubtO5K6hd
         6e9l9flkxskxr6r5CdWqwUyWhKZCHQ8PttT8UQ/2fjLnszy4ZIErNGL/iazv2RUyKDj2
         kKXN9yl1wX7+suc5zy3e2GHK6tK9LP0XpO54cm4SrqlV7IKSiL4D9mpY6mZ7KGwmEZgc
         TCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682042; x=1750286842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVzEHyBaRiJNDQh5a5Dx7H8kv7wjszZU3WXvYcKHvtU=;
        b=KEbuoFqnuBdoWfccC2DYyMDao2ecEfcEVNQbT7yUY4Ln1z/asflg0h5TIXA+J6V8uk
         m6yPx8OaOID5jWn1k3+F18o86VFqvnpZTvUEWmxRF8OhuunX1d1TRY3hmqJ3A64xorOL
         kRtRbfHbtGG2PREs4rhtRWW5ngp/vO3ItIYTbMnvtdl6ca+vSyKrMdtugdAcV0BC6eXi
         ZvTAt2mAmTG/jtOtV845WilhoUCQnk5/rixIOZr0F1xDvDyrjsruvTgQGCpgXNGD3aql
         0ia/hkEofmsGbkboZwqxaXDcR/GolofSosLHZzpwBuAdA6bp7GCFyCOHVJHydPVs17eC
         BoCw==
X-Gm-Message-State: AOJu0Yy/LFYOqUqSqAl55RwRO02o22CRbUz/OAkYnEoDFfI9UShJs8YH
	S5y7uNK7gpYwjWFaSCCSS2+Egyp1DopzSisFH+Es8ERl/ks9hDWWUyVJuBiz2TOy1yMRjgZxS4j
	o3zOvPg==
X-Google-Smtp-Source: AGHT+IFakcvyKnqCueAUeZlAT109XlS9YCn8fDNscX2Sisdyt0t4bYMkEX6AxhE9x+pXQlvyQldIB86adbU=
X-Received: from pfnx17.prod.google.com ([2002:aa7:84d1:0:b0:746:27ff:87f8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a1:b0:210:1c3a:6804
 with SMTP id adf61e73a8af0-21f9bbb2da4mr712401637.31.1749682042326; Wed, 11
 Jun 2025 15:47:22 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:18 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-17-seanjc@google.com>
Subject: [PATCH v3 15/62] KVM: SVM: Drop superfluous "cache" of AVIC Physical
 ID entry pointer
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
X-CRM114-CacheID: sfid-20250611_154723_463043_84024E39 
X-CRM114-Status: GOOD (  17.62  )
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

Drop the vCPU's pointer to its AVIC Physical ID entry, and simply index
the table directly.  Caching a pointer address is completely unnecessary
for performance, and while the field technically caches the result of the
pointer calculation, it's all too easy to misinterpret the name and think
that the field somehow caches the _data_ in the table.

No functional change intended.

Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 27 +++++++++++++++------------
 arch/x86/kvm/svm/svm.h  |  1 -
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index bf18b0b643d9..0c0be274d29e 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -294,8 +294,6 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
 	WRITE_ONCE(kvm_svm->avic_physical_id_table[id], new_entry);
 
-	svm->avic_physical_id_cache = &kvm_svm->avic_physical_id_table[id];
-
 	return 0;
 }
 
@@ -770,13 +768,16 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
 			   struct kvm_kernel_irqfd *irqfd,
 			   struct amd_iommu_pi_data *pi)
 {
+	struct kvm_vcpu *vcpu = &svm->vcpu;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
 	unsigned long flags;
 	u64 entry;
 
 	if (WARN_ON_ONCE(!pi->ir_data))
 		return -EINVAL;
 
-	irqfd->irq_bypass_vcpu = &svm->vcpu;
+	irqfd->irq_bypass_vcpu = vcpu;
 	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
@@ -787,7 +788,7 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
 	 * will update the pCPU info when the vCPU awkened and/or scheduled in.
 	 * See also avic_vcpu_load().
 	 */
-	entry = READ_ONCE(*(svm->avic_physical_id_cache));
+	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
 	if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
 		amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
 				    true, pi->ir_data);
@@ -964,17 +965,18 @@ avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu, bool r)
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
-	u64 entry;
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	int h_physical_id = kvm_cpu_get_apicid(cpu);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	unsigned long flags;
+	u64 entry;
 
 	lockdep_assert_preemption_disabled();
 
 	if (WARN_ON(h_physical_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK))
 		return;
 
-	if (WARN_ON_ONCE(!svm->avic_physical_id_cache))
+	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >= PAGE_SIZE))
 		return;
 
 	/*
@@ -996,14 +998,14 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	 */
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
 
-	entry = READ_ONCE(*(svm->avic_physical_id_cache));
+	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
 	WARN_ON_ONCE(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
 
 	entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
 	entry |= (h_physical_id & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK);
 	entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
 
-	WRITE_ONCE(*(svm->avic_physical_id_cache), entry);
+	WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
 	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id, true);
 
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
@@ -1011,13 +1013,14 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 void avic_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	u64 entry;
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	unsigned long flags;
+	u64 entry;
 
 	lockdep_assert_preemption_disabled();
 
-	if (WARN_ON_ONCE(!svm->avic_physical_id_cache))
+	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >= PAGE_SIZE))
 		return;
 
 	/*
@@ -1027,7 +1030,7 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
 	 * recursively.
 	 */
-	entry = READ_ONCE(*(svm->avic_physical_id_cache));
+	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
 
 	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
 	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
@@ -1046,7 +1049,7 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 	avic_update_iommu_vcpu_affinity(vcpu, -1, 0);
 
 	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
-	WRITE_ONCE(*(svm->avic_physical_id_cache), entry);
+	WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
 
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index ec5d77d42a49..f225d0bed152 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -306,7 +306,6 @@ struct vcpu_svm {
 
 	u32 ldr_reg;
 	u32 dfr_reg;
-	u64 *avic_physical_id_cache;
 
 	/*
 	 * Per-vCPU list of irqfds that are eligible to post IRQs directly to
-- 
2.50.0.rc1.591.g9c95f17f64-goog


