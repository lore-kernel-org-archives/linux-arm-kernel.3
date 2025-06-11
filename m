Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05078C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmfB8lOX2q4C1Qfnb9hUYc3blCs/E2S3R9OL4z8QP30=; b=loGm5SFyc+BuRPIrRBRNJz/aap
	aUsPfPPtF0CTtAiKcFXDYX0LF8JYrGLsyNNclyMdL2y2XWtQYYIUeERxeSnNoz6ap2grXFUUulg48
	poRxgMr98ClZDOa+XrwzFmuXogr1LfPRlV6tBHvinGgtlVV1rD6j5hpX64PGorffUtGotNJrsqV+D
	Cet5BiGXn9IfWeIcoQm4VxboG4z8FHyfj5GXgjX1joKOihK9lwBS15/DknmO1fm4B+B5jpy7TNXTN
	27Hlx+t7qcQDYsEHKIYWyZ9kMbPEvtmk6V3rSNGa00NL4TD+KWLgtBcNT/MPowtJSpBEbHjpE0I9y
	65RCwuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXZG-0000000Bx95-2A5v;
	Thu, 12 Jun 2025 02:21:26 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFO-0000000BY3n-3vUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:44 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so107904a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682121; x=1750286921; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hmfB8lOX2q4C1Qfnb9hUYc3blCs/E2S3R9OL4z8QP30=;
        b=wZPf3A8QKvpOl84ueVkbyGQZBXJlaqVeEmPEW95SNI4QbOiOZ03b4cH9SfQJ8beHHp
         cx3psf1JkIQ2+M9mKN0H90PpOxChMxLtXjVGeyY0hRh9qzZTnx67xzF+nCDX02YFaL0Y
         qz7flbqXf03OVOeKR4L9xPZkmpQEeoojLvbEJgX+vu79gcK92CkWgj27Y8yYJojps/gx
         FmQV/CVJSY0NG+vo8gxeVqDWAusN21N4ivIcFj3d+G0ecbxrq2HTOGFjbLUz87ye2Yry
         PRVmkJ9yZlTtACx5oOzgDk0j2hdxxQnGNaNT4GQVb1VZpFRNl2fPQHa1+gUqrCdIUg/N
         PnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682121; x=1750286921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmfB8lOX2q4C1Qfnb9hUYc3blCs/E2S3R9OL4z8QP30=;
        b=DvrYRE+VOKPMMTwZVUHtr3HcLwmfY72wj7v/us13Lh/ndAyKzhbPjTyushXdS5fJEW
         rYcgwljlXvaC3MT1SXJZFWQ1bwLOd4V1wmtv6JMZMoAB/t0F3n30AAP3J+knAwuctsww
         YwrXlUjjiwAehNFoiAnM+EzEsV5Zo7ef9V9SKH3GIxF91K02uymBe/TWVpUxwbxBaoiD
         XWyRPd3nUAf/CWl7cdUN14NWbbdrKfpg/+CYu22YxPeHyKeyZRrvIuLoN+Lx8uzWLqqw
         oG/K8hAT3tKBtM4se+ZIH9qtc8XHrMWQ+Nb9f43+ZxAihPgtS7MiTRqGffmc178ZcG99
         5BDQ==
X-Gm-Message-State: AOJu0Yzh9ELb+uNCZ9goXMLge866U9ogrd/Nw00mXDdfAJ2ahKgkaALK
	vP2ReB4/JDAzvgQkTX3RNpbNg4iwJOuumOecLpKI8fp5Ueb5scFs/LTR2ndbxdxljwPrSiaEx8V
	bE0YpeQ==
X-Google-Smtp-Source: AGHT+IH5h0j7VRVfcXIPqKoozM0Dd+19ZFrZA3sJjyCkhp4wpaWauQxaF+akeAplYxcFuLxUbJfK933sl3c=
X-Received: from pgjp8.prod.google.com ([2002:a63:e648:0:b0:b2c:3a2e:ac7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d704:b0:215:dfd0:fd24
 with SMTP id adf61e73a8af0-21f978aeb8cmr2433515637.31.1749682121591; Wed, 11
 Jun 2025 15:48:41 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:04 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-63-seanjc@google.com>
Subject: [PATCH v3 61/62] KVM: SVM: Generate GA log IRQs only if the
 associated vCPUs is blocking
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
X-CRM114-CacheID: sfid-20250611_154842_977061_6EA7C60E 
X-CRM114-Status: GOOD (  26.14  )
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

Configure IRTEs to GA log interrupts for device posted IRQs that hit
non-running vCPUs if and only if the target vCPU is blocking, i.e.
actually needs a wake event.  If the vCPU has exited to userspace or was
preempted, generating GA log entries and interrupts is wasteful and
unnecessary, as the vCPU will be re-loaded and/or scheduled back in
irrespective of the GA log notification (avic_ga_log_notifier() is just a
fancy wrapper for kvm_vcpu_wake_up()).

Use a should-be-zero bit in the vCPU's Physical APIC ID Table Entry to
track whether or not the vCPU's associated IRTEs are configured to
generate GA logs, but only set the synthetic bit in KVM's "cache", i.e.
never set the should-be-zero bit in tables that are used by hardware.
Use a synthetic bit instead of a dedicated boolean to minimize the odds
of messing up the locking, i.e. so that all the existing rules that apply
to avic_physical_id_entry for IS_RUNNING are reused verbatim for
GA_LOG_INTR.

Note, because KVM (by design) "puts" AVIC state in a "pre-blocking"
phase, using kvm_vcpu_is_blocking() to track the need for notifications
isn't a viable option.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/svm.h |  7 +++++
 arch/x86/kvm/svm/avic.c    | 63 ++++++++++++++++++++++++++++++--------
 2 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index 36f67c69ea66..ffc27f676243 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -252,6 +252,13 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 #define AVIC_LOGICAL_ID_ENTRY_VALID_BIT			31
 #define AVIC_LOGICAL_ID_ENTRY_VALID_MASK		(1 << 31)
 
+/*
+ * GA_LOG_INTR is a synthetic flag that's never propagated to hardware-visible
+ * tables.  GA_LOG_INTR is set if the vCPU needs device posted IRQs to generate
+ * GA log interrupts to wake the vCPU (because it's blocking or about to block).
+ */
+#define AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR		BIT_ULL(61)
+
 #define AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK	GENMASK_ULL(11, 0)
 #define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK	GENMASK_ULL(51, 12)
 #define AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK		(1ULL << 62)
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index e61ecc3514ea..e4e1d169577f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -788,7 +788,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			pi_data.cpu = entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
 		} else {
 			pi_data.cpu = -1;
-			pi_data.ga_log_intr = true;
+			pi_data.ga_log_intr = entry & AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR;
 		}
 
 		ret = irq_set_vcpu_affinity(host_irq, &pi_data);
@@ -825,16 +825,25 @@ enum avic_vcpu_action {
 
 	/*
 	 * No unique action is required to deal with a vCPU that stops/starts
-	 * running, as IRTEs are configured to generate GALog interrupts at all
-	 * times.
+	 * running.  A vCPU that starts running by definition stops blocking as
+	 * well, and a vCPU that stops running can't have been blocking, i.e.
+	 * doesn't need to toggle GALogIntr.
 	 */
 	AVIC_START_RUNNING	= 0,
 	AVIC_STOP_RUNNING	= 0,
+
+	/*
+	 * When a vCPU starts blocking, KVM needs to set the GALogIntr flag
+	 * int all associated IRTEs so that KVM can wake the vCPU if an IRQ is
+	 * sent to the vCPU.
+	 */
+	AVIC_START_BLOCKING	= BIT(1),
 };
 
 static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
 					    enum avic_vcpu_action action)
 {
+	bool ga_log_intr = (action & AVIC_START_BLOCKING);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
 
@@ -851,9 +860,9 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
 		void *data = irqfd->irq_bypass_data;
 
 		if (!(action & AVIC_TOGGLE_ON_OFF))
-			WARN_ON_ONCE(amd_iommu_update_ga(data, cpu, true));
+			WARN_ON_ONCE(amd_iommu_update_ga(data, cpu, ga_log_intr));
 		else if (cpu >= 0)
-			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu, true));
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu, ga_log_intr));
 		else
 			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
 	}
@@ -888,7 +897,8 @@ static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu,
 	entry = svm->avic_physical_id_entry;
 	WARN_ON_ONCE(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
 
-	entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+	entry &= ~(AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK |
+		   AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR);
 	entry |= (h_physical_id & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK);
 	entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
 
@@ -949,12 +959,26 @@ static void __avic_vcpu_put(struct kvm_vcpu *vcpu, enum avic_vcpu_action action)
 
 	avic_update_iommu_vcpu_affinity(vcpu, -1, action);
 
+	WARN_ON_ONCE(entry & AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR);
+
+	/*
+	 * Keep the previous APIC ID in the entry so that a rogue doorbell from
+	 * hardware is at least restricted to a CPU associated with the vCPU.
+	 */
 	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
-	svm->avic_physical_id_entry = entry;
 
 	if (enable_ipiv)
 		WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
 
+	/*
+	 * Note!  Don't set AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR in the table as
+	 * it's a synthetic flag that usurps an unused should-be-zero bit.
+	 */
+	if (action & AVIC_START_BLOCKING)
+		entry |= AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR;
+
+	svm->avic_physical_id_entry = entry;
+
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
 
@@ -969,11 +993,26 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 	 */
 	u64 entry = to_svm(vcpu)->avic_physical_id_entry;
 
-	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
-	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
-		return;
+	/*
+	 * Nothing to do if IsRunning == '0' due to vCPU blocking, i.e. if the
+	 * vCPU is preempted while its in the process of blocking.  WARN if the
+	 * vCPU wasn't running and isn't blocking, KVM shouldn't attempt to put
+	 * the AVIC if it wasn't previously loaded.
+	 */
+	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)) {
+		if (WARN_ON_ONCE(!kvm_vcpu_is_blocking(vcpu)))
+			return;
 
-	__avic_vcpu_put(vcpu, AVIC_STOP_RUNNING);
+		/*
+		 * The vCPU was preempted while blocking, ensure its IRTEs are
+		 * configured to generate GA Log Interrupts.
+		 */
+		if (!(WARN_ON_ONCE(!(entry & AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR))))
+			return;
+	}
+
+	__avic_vcpu_put(vcpu, kvm_vcpu_is_blocking(vcpu) ? AVIC_START_BLOCKING :
+							   AVIC_STOP_RUNNING);
 }
 
 void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
@@ -1039,7 +1078,7 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
 	 * CPU and cause noisy neighbor problems if the VM is sending interrupts
 	 * to the vCPU while it's scheduled out.
 	 */
-	__avic_vcpu_put(vcpu, AVIC_STOP_RUNNING);
+	__avic_vcpu_put(vcpu, AVIC_START_BLOCKING);
 }
 
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


