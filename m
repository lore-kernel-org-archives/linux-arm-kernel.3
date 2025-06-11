Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C43CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I51DP5gKMKEc7ILNFfZEeDY2g0p+80Ng0YFKm86s12A=; b=zbVQc/BhXa2Yax1uEjuS0JXKi5
	/5tyAxAy8yIqL+eweo5F3wtigiqxrgBhIjbjhAX2HNoiQYIWMfkBxShp+I6hvLeUn3vrv7vFNf/2w
	Dv7lsbk3HgibBK+7BYQMPc93yNr+hFcIF4wBj90iF7gFgr2HaahLZet3tFWbaaw+ccPv+BmUATPZH
	Gz4QvO1KfR5zQ8x1wGVzsU45WZbRgxFlhAn8o4jGPahTnMMI0N0SDNCKhttmpbuh4qcE7nUA7rNNg
	1OrjyP8oZFKVnTf1CdvZIAljNNI4IOEvWY2YRdgF35wpjFTIjID9uPkM9jM2jHUTflkCfHhzkgXwP
	pp943K/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVbW-0000000Blo6-3wl8;
	Thu, 12 Jun 2025 00:15:38 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDm-0000000BWrR-0FjP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:03 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74834bc5d37so485834b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682021; x=1750286821; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I51DP5gKMKEc7ILNFfZEeDY2g0p+80Ng0YFKm86s12A=;
        b=duyidihmBmr4zWuoIeJDJ5kbkDz5t82J9RMJlfkp7vT+ymR2LyNq08yAt/Knv3puKc
         FfXDmHKglP/YeHDUe3bkA5eguouslfRcn6UcnKCnCKkwt9cI2+NrIS5XLcpE4CHgnSGX
         tbClRe+Hd0tONzx5JQRPfNsO96avO6qw/47Qh3KPeC6FxtTl3BguIvRK20D8e5Jzvm7h
         uBUUrIcJO8l5DI1sxA/qT/O/MMYKiSJkpXoG2U7fYiqZtLOXx3tFl/T1t1PyRFJDIFd5
         TD5/lfyVC7FzmQ4yRPXaGdKpyaezmKadNrqaWeXpb2T30gaxb0tKwsNog3Wh2PMkOs+X
         TCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682021; x=1750286821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I51DP5gKMKEc7ILNFfZEeDY2g0p+80Ng0YFKm86s12A=;
        b=f+pKlS8aPWdw3ycE3hOPgsFg2vO98PElRB20rYWyj1nWoXaFrk9R3q9YFXaPy5+ash
         76rf+5S8AuvbS5qRUPVEd6oeBDSEX/kMIw4SwZjYTCQ3Dh4yC0yozbj9fVZOvuy0LpS5
         HE0ycrvwnq1gomGGoqjv48mPTdLsNUPm5YuK/qwa6XbRIQ3GMWIl2sMG53EzqWHpm5mT
         RQYzkEoJMLFGhat1eSRA4UwZDSryilOioHIN4bykGoyKO/OBMPImWH5lJjqmKlIWEUDo
         MCF4g8x1a3hywjvp+4Xtn+dEtYXXr7QVo3cQ0DHpn8GeVQblMRp1SV8MOP8eoxkxBquG
         IDDg==
X-Gm-Message-State: AOJu0Yz5fk1qA5/ctq4ug+GdMxD7TqEz3gZcpHcb0j2Exn4WgilFMkGy
	V/G83xjM521x5wCmMHP2YsQQF+NXGjLwYFT1U3ObEzaSMqvso4etPRAMszJ5VwU3uSc7fuvW52P
	Na4aTbg==
X-Google-Smtp-Source: AGHT+IHwXpNXkDTloFncKpBTTlOBc7cfmL8OdvApNP8cnZ+4+Hh5uII0rNHhd1AacQdbNKEw4+vWvuOjocw=
X-Received: from pfbbd32.prod.google.com ([2002:a05:6a00:27a0:b0:747:a8ac:ca05])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7350:b0:1fe:90c5:7d00
 with SMTP id adf61e73a8af0-21f9b938064mr718014637.28.1749682020789; Wed, 11
 Jun 2025 15:47:00 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:06 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-5-seanjc@google.com>
Subject: [PATCH v3 03/62] KVM: Pass new routing entries and irqfd when
 updating IRTEs
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
X-CRM114-CacheID: sfid-20250611_154702_150331_160C8D5C 
X-CRM114-Status: GOOD (  21.22  )
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

When updating IRTEs in response to a GSI routing or IRQ bypass change,
pass the new/current routing information along with the associated irqfd.
This will allow KVM x86 to harden, simplify, and deduplicate its code.

Since adding/removing a bypass producer is now conveniently protected with
irqfds.lock, i.e. can't run concurrently with kvm_irq_routing_update(),
use the routing information cached in the irqfd instead of looking up
the information in the current GSI routing tables.

Opportunistically convert an existing printk() to pr_info() and put its
string onto a single line (old code that strictly adhered to 80 chars).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c            |  7 ++++---
 arch/x86/include/asm/kvm_host.h |  6 ++++--
 arch/x86/kvm/svm/avic.c         | 18 +++++++----------
 arch/x86/kvm/svm/svm.h          |  5 +++--
 arch/x86/kvm/vmx/posted_intr.c  | 19 ++++++++---------
 arch/x86/kvm/vmx/posted_intr.h  |  8 ++++++--
 arch/x86/kvm/x86.c              | 36 ++++++++++++++++++---------------
 include/linux/kvm_host.h        |  7 +++++--
 virt/kvm/eventfd.c              | 11 +++++-----
 9 files changed, 62 insertions(+), 55 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 38a91bb5d4c7..a9a39e0375f7 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2771,8 +2771,9 @@ bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
 	return memcmp(&old->msi, &new->msi, sizeof(new->msi));
 }
 
-int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
-				  uint32_t guest_irq, bool set)
+int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				  struct kvm_kernel_irq_routing_entry *old,
+				  struct kvm_kernel_irq_routing_entry *new)
 {
 	/*
 	 * Remapping the vLPI requires taking the its_lock mutex to resolve
@@ -2781,7 +2782,7 @@ int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 	 *
 	 * Unmap the vLPI and fall back to software LPI injection.
 	 */
-	return kvm_vgic_v4_unset_forwarding(kvm, host_irq);
+	return kvm_vgic_v4_unset_forwarding(irqfd->kvm, irqfd->producer->irq);
 }
 
 void kvm_arch_irq_bypass_stop(struct irq_bypass_consumer *cons)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 21ccb122ab76..2a6ef1398da7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -296,6 +296,7 @@ enum x86_intercept_stage;
  */
 #define KVM_APIC_PV_EOI_PENDING	1
 
+struct kvm_kernel_irqfd;
 struct kvm_kernel_irq_routing_entry;
 
 /*
@@ -1844,8 +1845,9 @@ struct kvm_x86_ops {
 	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
 	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
 
-	int (*pi_update_irte)(struct kvm *kvm, unsigned int host_irq,
-			      uint32_t guest_irq, bool set);
+	int (*pi_update_irte)(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+			      unsigned int host_irq, uint32_t guest_irq,
+			      struct kvm_kernel_irq_routing_entry *new);
 	void (*pi_start_assignment)(struct kvm *kvm);
 	void (*apicv_pre_state_restore)(struct kvm_vcpu *vcpu);
 	void (*apicv_post_state_restore)(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 7338879d1c0c..adacf00d6664 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -18,6 +18,7 @@
 #include <linux/hashtable.h>
 #include <linux/amd-iommu.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
 
 #include <asm/irq_remapping.h>
 
@@ -885,21 +886,14 @@ get_pi_vcpu_info(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
 	return 0;
 }
 
-/*
- * avic_pi_update_irte - set IRTE for Posted-Interrupts
- *
- * @kvm: kvm
- * @host_irq: host irq of the interrupt
- * @guest_irq: gsi of the interrupt
- * @set: set or unset PI
- * returns 0 on success, < 0 on failure
- */
-int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
-			uint32_t guest_irq, bool set)
+int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+			unsigned int host_irq, uint32_t guest_irq,
+			struct kvm_kernel_irq_routing_entry *new)
 {
 	struct kvm_kernel_irq_routing_entry *e;
 	struct kvm_irq_routing_table *irq_rt;
 	bool enable_remapped_mode = true;
+	bool set = !!new;
 	int idx, ret = 0;
 
 	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
@@ -925,6 +919,8 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
 		if (e->type != KVM_IRQ_ROUTING_MSI)
 			continue;
 
+		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
+
 		/**
 		 * Here, we setup with legacy mode in the following cases:
 		 * 1. When cannot target interrupt to a specific vcpu.
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index e6f3c6a153a0..b35fce30d923 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -736,8 +736,9 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
 void avic_vcpu_put(struct kvm_vcpu *vcpu);
 void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu);
 void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu);
-int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
-			uint32_t guest_irq, bool set);
+int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+			unsigned int host_irq, uint32_t guest_irq,
+			struct kvm_kernel_irq_routing_entry *new);
 void avic_vcpu_blocking(struct kvm_vcpu *vcpu);
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
 void avic_ring_doorbell(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 5c615e5845bf..110fb19848ab 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
 
 #include <asm/irq_remapping.h>
 #include <asm/cpu.h>
@@ -294,17 +295,9 @@ void vmx_pi_start_assignment(struct kvm *kvm)
 	kvm_make_all_cpus_request(kvm, KVM_REQ_UNBLOCK);
 }
 
-/*
- * vmx_pi_update_irte - set IRTE for Posted-Interrupts
- *
- * @kvm: kvm
- * @host_irq: host irq of the interrupt
- * @guest_irq: gsi of the interrupt
- * @set: set or unset PI
- * returns 0 on success, < 0 on failure
- */
-int vmx_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
-		       uint32_t guest_irq, bool set)
+int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+		       unsigned int host_irq, uint32_t guest_irq,
+		       struct kvm_kernel_irq_routing_entry *new)
 {
 	struct kvm_kernel_irq_routing_entry *e;
 	struct kvm_irq_routing_table *irq_rt;
@@ -312,6 +305,7 @@ int vmx_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
 	struct kvm_lapic_irq irq;
 	struct kvm_vcpu *vcpu;
 	struct vcpu_data vcpu_info;
+	bool set = !!new;
 	int idx, ret = 0;
 
 	if (!vmx_can_use_vtd_pi(kvm))
@@ -329,6 +323,9 @@ int vmx_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
 	hlist_for_each_entry(e, &irq_rt->map[guest_irq], link) {
 		if (e->type != KVM_IRQ_ROUTING_MSI)
 			continue;
+
+		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
+
 		/*
 		 * VT-d PI cannot support posting multicast/broadcast
 		 * interrupts to a vCPU, we still use interrupt remapping
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index 80499ea0e674..a94afcb55f7f 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -3,6 +3,9 @@
 #define __KVM_X86_VMX_POSTED_INTR_H
 
 #include <linux/bitmap.h>
+#include <linux/find.h>
+#include <linux/kvm_host.h>
+
 #include <asm/posted_intr.h>
 
 void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
@@ -11,8 +14,9 @@ void pi_wakeup_handler(void);
 void __init pi_init_cpu(int cpu);
 void pi_apicv_pre_state_restore(struct kvm_vcpu *vcpu);
 bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu);
-int vmx_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
-		       uint32_t guest_irq, bool set);
+int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
+		       unsigned int host_irq, uint32_t guest_irq,
+		       struct kvm_kernel_irq_routing_entry *new);
 void vmx_pi_start_assignment(struct kvm *kvm);
 
 static inline int pi_find_highest_vector(struct pi_desc *pi_desc)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 28a20f0aa3dd..93711a5ef272 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13507,31 +13507,31 @@ int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
 	struct kvm_kernel_irqfd *irqfd =
 		container_of(cons, struct kvm_kernel_irqfd, consumer);
 	struct kvm *kvm = irqfd->kvm;
-	int ret;
+	int ret = 0;
 
 	kvm_arch_start_assignment(irqfd->kvm);
 
 	spin_lock_irq(&kvm->irqfds.lock);
 	irqfd->producer = prod;
 
-	ret = kvm_x86_call(pi_update_irte)(irqfd->kvm,
-					   prod->irq, irqfd->gsi, 1);
-	if (ret)
-		kvm_arch_end_assignment(irqfd->kvm);
-
+	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
+		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
+						   irqfd->gsi, &irqfd->irq_entry);
+		if (ret)
+			kvm_arch_end_assignment(irqfd->kvm);
+	}
 	spin_unlock_irq(&kvm->irqfds.lock);
 
-
 	return ret;
 }
 
 void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 				      struct irq_bypass_producer *prod)
 {
-	int ret;
 	struct kvm_kernel_irqfd *irqfd =
 		container_of(cons, struct kvm_kernel_irqfd, consumer);
 	struct kvm *kvm = irqfd->kvm;
+	int ret;
 
 	WARN_ON(irqfd->producer != prod);
 
@@ -13544,11 +13544,13 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	spin_lock_irq(&kvm->irqfds.lock);
 	irqfd->producer = NULL;
 
-	ret = kvm_x86_call(pi_update_irte)(irqfd->kvm,
-					   prod->irq, irqfd->gsi, 0);
-	if (ret)
-		printk(KERN_INFO "irq bypass consumer (token %p) unregistration"
-		       " fails: %d\n", irqfd->consumer.token, ret);
+	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
+		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
+						   irqfd->gsi, NULL);
+		if (ret)
+			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
+				irqfd->consumer.token, ret);
+	}
 
 	spin_unlock_irq(&kvm->irqfds.lock);
 
@@ -13556,10 +13558,12 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	kvm_arch_end_assignment(irqfd->kvm);
 }
 
-int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
-				   uint32_t guest_irq, bool set)
+int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				  struct kvm_kernel_irq_routing_entry *old,
+				  struct kvm_kernel_irq_routing_entry *new)
 {
-	return kvm_x86_call(pi_update_irte)(kvm, host_irq, guest_irq, set);
+	return kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, irqfd->producer->irq,
+					    irqfd->gsi, new);
 }
 
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b5575d0b574..a4160c1c0c6b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2401,6 +2401,8 @@ struct kvm_vcpu *kvm_get_running_vcpu(void);
 struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
+struct kvm_kernel_irqfd;
+
 bool kvm_arch_has_irq_bypass(void);
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *,
 			   struct irq_bypass_producer *);
@@ -2408,8 +2410,9 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
 			   struct irq_bypass_producer *);
 void kvm_arch_irq_bypass_stop(struct irq_bypass_consumer *);
 void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *);
-int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
-				  uint32_t guest_irq, bool set);
+int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				  struct kvm_kernel_irq_routing_entry *old,
+				  struct kvm_kernel_irq_routing_entry *new);
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *,
 				  struct kvm_kernel_irq_routing_entry *);
 #endif /* CONFIG_HAVE_KVM_IRQ_BYPASS */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..85581550dc8d 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -285,9 +285,9 @@ void __attribute__((weak)) kvm_arch_irq_bypass_start(
 {
 }
 
-int  __attribute__((weak)) kvm_arch_update_irqfd_routing(
-				struct kvm *kvm, unsigned int host_irq,
-				uint32_t guest_irq, bool set)
+int __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+					 struct kvm_kernel_irq_routing_entry *old,
+					 struct kvm_kernel_irq_routing_entry *new)
 {
 	return 0;
 }
@@ -619,9 +619,8 @@ void kvm_irq_routing_update(struct kvm *kvm)
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
 		if (irqfd->producer &&
 		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry)) {
-			int ret = kvm_arch_update_irqfd_routing(
-					irqfd->kvm, irqfd->producer->irq,
-					irqfd->gsi, 1);
+			int ret = kvm_arch_update_irqfd_routing(irqfd, &old, &irqfd->irq_entry);
+
 			WARN_ON(ret);
 		}
 #endif
-- 
2.50.0.rc1.591.g9c95f17f64-goog


