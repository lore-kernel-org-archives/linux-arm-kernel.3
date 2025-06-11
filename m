Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A4C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0ognzEJ7YTCwR3VXid30BiQbWyTOWaypqhwvcHXf3s=; b=QZTZfAwxfqNVxYQfYkLB3g5P6L
	XDe7eYpTnxnR/AORJwEVDBoS6bCjm96M9VdNBJ9XtseyGw7t2zgeJIVo1VZpU9VadmZki++0zMk3S
	6f/v5Lx3RWGcr7Zd778JHjeyzBKsC2ls0TrL5I3fb0BEfU3WeYrw5qt2/KKtGlLhW8UZbUL7YQpFq
	KTahqsp6G/FZ5pJfOi2b8j8ML+iLE3eUp/mZvI2sku78oXkb2dk2XYvZkzHncyl3rqn1axyguLu/0
	HLtUl/XZ2UVUEveGCZFk2BscQdPXpakW7lZY0l843qKAMaPoyFzbhne9TlbiruMypvyRbAgwj5hrJ
	yhM7Y7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXMf-0000000Bw7p-0ksT;
	Thu, 12 Jun 2025 02:08:25 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFE-0000000BXvr-1X8m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:33 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so311592a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682111; x=1750286911; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=y0ognzEJ7YTCwR3VXid30BiQbWyTOWaypqhwvcHXf3s=;
        b=M13Sl1jmy2qufVeD5juWTLSyHhw6xECuI/dGeqqLiTGnRYACctI2LIORl7TorXq4Q3
         0wqEffCbNl9MM/Sw5oPv/yjxK739hsQr7DJa+xYu0XAHpWJiEopDuZrktV+53a9q2KO7
         Nmzgbb+pzKGgjmgtnc6FCQqUKAxHQcSTOCKCSzlH6nLVO9y3mwpdtPTab2A/VoW6DVrV
         XYAa3RdxMIyR+pQZjHaf06mK2cbISAPkZL/Y4AnoXhUfsq1qemCPqG+qwaCVE1UN5fts
         g8dzvm9odqnATzMyCyTWU+/Kq3KHn4AINeeYsk73sEqFcYE9qP3q9W0Mta0v5zV9rIgk
         7etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682111; x=1750286911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0ognzEJ7YTCwR3VXid30BiQbWyTOWaypqhwvcHXf3s=;
        b=DESL87HPjD8fQoh718Rc8zeYV+JA8mW2N9ojNspBZ2n0UXsr1h1ihjQnvuy5p4y0Cg
         RfNYrno/Z62HJbtCUgSD63spDwvCXBS/9U7l1lCbo+CeS1VdL/FY+KCQVQMdu4Y2q/as
         7CyRXb+wjEhuEPN78lc78VAhJJGtTTm3cJy5rCjg0mrNkjZapVYmLgnfC8A6Y2YYn/zn
         cDWALipjd3u7XcfgGCA0O4Cdeo36aj+QerHT1I/wEy0rShfoyMnPf5IOvKoy823Tzpd3
         HENduXfWYk589NHWWnH6qQMhRj3GsjCuXhJjzfa1ylKuQ6qP/BS0qe7j+st7A3mYfEFt
         4Pyw==
X-Gm-Message-State: AOJu0Yw7Qe2Be3j4IBFoGLSGYGKLW4Db5jZsot4R9zS985emjw3PWcft
	SjD4hF0x/Jd8zdkCEQJLh1Hd92CfdytVbDMYR6hEcZ7yIQWgvVIQpWLaoRu2pFY5ItmHDXh9DbL
	s9Ioh9Q==
X-Google-Smtp-Source: AGHT+IFRdWwIjfXgF8mELaKVUoF9lDiiV8HL8783fqwQWOtpE70D1R2T9PRTPjRcVSy+irY7wjgYviQPM7o=
X-Received: from pjbsk13.prod.google.com ([2002:a17:90b:2dcd:b0:312:187d:382d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcc:b0:311:f30b:c21
 with SMTP id 98e67ed59e1d1-313c08c831amr917024a91.26.1749682111071; Wed, 11
 Jun 2025 15:48:31 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:58 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-57-seanjc@google.com>
Subject: [PATCH v3 55/62] KVM: SVM: Use vcpu_idx, not vcpu_id, for GA log tag/metadata
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
X-CRM114-CacheID: sfid-20250611_154832_402751_11E9CC5F 
X-CRM114-Status: GOOD (  17.11  )
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

Use a vCPU's index, not its ID, for the GA log tag/metadata that's used to
find and kick vCPUs when a device posted interrupt serves as a wake event.
Lookups on a vCPU index are O(fast) (not sure what xa_load() actually
provides), whereas a vCPU ID lookup is O(n) if a vCPU's ID doesn't match
its index.

Unlike the Physical APIC Table, which is accessed by hardware when
virtualizing IPIs, hardware doesn't consume the GA tag, i.e. KVM _must_
use APIC IDs to fill the Physical APIC Table, but KVM has free rein over
the format/meaning of the GA tag.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index c55cbb0610b4..bb74705d6cfd 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -29,36 +29,39 @@
 #include "svm.h"
 
 /*
- * Encode the arbitrary VM ID and the vCPU's default APIC ID, i.e the vCPU ID,
- * into the GATag so that KVM can retrieve the correct vCPU from a GALog entry
- * if an interrupt can't be delivered, e.g. because the vCPU isn't running.
+ * Encode the arbitrary VM ID and the vCPU's _index_ into the GATag so that
+ * KVM can retrieve the correct vCPU from a GALog entry if an interrupt can't
+ * be delivered, e.g. because the vCPU isn't running.  Use the vCPU's index
+ * instead of its ID (a.k.a. its default APIC ID), as KVM is guaranteed a fast
+ * lookup on the index, where as vCPUs whose index doesn't match their ID need
+ * to walk the entire xarray of vCPUs in the worst case scenario.
  *
- * For the vCPU ID, use however many bits are currently allowed for the max
+ * For the vCPU index, use however many bits are currently allowed for the max
  * guest physical APIC ID (limited by the size of the physical ID table), and
  * use whatever bits remain to assign arbitrary AVIC IDs to VMs.  Note, the
  * size of the GATag is defined by hardware (32 bits), but is an opaque value
  * as far as hardware is concerned.
  */
-#define AVIC_VCPU_ID_MASK		AVIC_PHYSICAL_MAX_INDEX_MASK
+#define AVIC_VCPU_IDX_MASK		AVIC_PHYSICAL_MAX_INDEX_MASK
 
 #define AVIC_VM_ID_SHIFT		HWEIGHT32(AVIC_PHYSICAL_MAX_INDEX_MASK)
 #define AVIC_VM_ID_MASK			(GENMASK(31, AVIC_VM_ID_SHIFT) >> AVIC_VM_ID_SHIFT)
 
 #define AVIC_GATAG_TO_VMID(x)		((x >> AVIC_VM_ID_SHIFT) & AVIC_VM_ID_MASK)
-#define AVIC_GATAG_TO_VCPUID(x)		(x & AVIC_VCPU_ID_MASK)
+#define AVIC_GATAG_TO_VCPUIDX(x)	(x & AVIC_VCPU_IDX_MASK)
 
-#define __AVIC_GATAG(vm_id, vcpu_id)	((((vm_id) & AVIC_VM_ID_MASK) << AVIC_VM_ID_SHIFT) | \
-					 ((vcpu_id) & AVIC_VCPU_ID_MASK))
-#define AVIC_GATAG(vm_id, vcpu_id)					\
+#define __AVIC_GATAG(vm_id, vcpu_idx)	((((vm_id) & AVIC_VM_ID_MASK) << AVIC_VM_ID_SHIFT) | \
+					 ((vcpu_idx) & AVIC_VCPU_IDX_MASK))
+#define AVIC_GATAG(vm_id, vcpu_idx)					\
 ({									\
-	u32 ga_tag = __AVIC_GATAG(vm_id, vcpu_id);			\
+	u32 ga_tag = __AVIC_GATAG(vm_id, vcpu_idx);			\
 									\
-	WARN_ON_ONCE(AVIC_GATAG_TO_VCPUID(ga_tag) != (vcpu_id));	\
+	WARN_ON_ONCE(AVIC_GATAG_TO_VCPUIDX(ga_tag) != (vcpu_idx));	\
 	WARN_ON_ONCE(AVIC_GATAG_TO_VMID(ga_tag) != (vm_id));		\
 	ga_tag;								\
 })
 
-static_assert(__AVIC_GATAG(AVIC_VM_ID_MASK, AVIC_VCPU_ID_MASK) == -1u);
+static_assert(__AVIC_GATAG(AVIC_VM_ID_MASK, AVIC_VCPU_IDX_MASK) == -1u);
 
 static bool force_avic;
 module_param_unsafe(force_avic, bool, 0444);
@@ -139,16 +142,16 @@ int avic_ga_log_notifier(u32 ga_tag)
 	struct kvm_svm *kvm_svm;
 	struct kvm_vcpu *vcpu = NULL;
 	u32 vm_id = AVIC_GATAG_TO_VMID(ga_tag);
-	u32 vcpu_id = AVIC_GATAG_TO_VCPUID(ga_tag);
+	u32 vcpu_idx = AVIC_GATAG_TO_VCPUIDX(ga_tag);
 
-	pr_debug("SVM: %s: vm_id=%#x, vcpu_id=%#x\n", __func__, vm_id, vcpu_id);
-	trace_kvm_avic_ga_log(vm_id, vcpu_id);
+	pr_debug("SVM: %s: vm_id=%#x, vcpu_idx=%#x\n", __func__, vm_id, vcpu_idx);
+	trace_kvm_avic_ga_log(vm_id, vcpu_idx);
 
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
 	hash_for_each_possible(svm_vm_data_hash, kvm_svm, hnode, vm_id) {
 		if (kvm_svm->avic_vm_id != vm_id)
 			continue;
-		vcpu = kvm_get_vcpu_by_id(&kvm_svm->kvm, vcpu_id);
+		vcpu = kvm_get_vcpu(&kvm_svm->kvm, vcpu_idx);
 		break;
 	}
 	spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
@@ -785,7 +788,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 */
 		struct amd_iommu_pi_data pi_data = {
 			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
-					     vcpu->vcpu_id),
+					     vcpu->vcpu_idx),
 			.is_guest_mode = kvm_vcpu_apicv_active(vcpu),
 			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
 			.vector = vector,
-- 
2.50.0.rc1.591.g9c95f17f64-goog


