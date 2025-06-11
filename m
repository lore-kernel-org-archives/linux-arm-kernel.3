Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD648C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R/fidHqC5yeF1RrOI6ocG+diWBEwovSia+ZMiokcw0=; b=WRPX8V3KFEUF0Z7anAEpjqeVxg
	5D55SNu5vhRyuIFd41EgmOjp02d5UiOjQsO4clZcLuKwO6UwrolAZgYaDndJYNDNZNuYQuZnGAOLr
	e6k/Ae0+EvgdWM5Ktaou6+DR1t67P8tvvXqCs3T8QFmBkAo2I2fAKmC8hATwwUGz3Kegc2nerFNqX
	CWh/mC9jg4OVK54mbVd1bhYbBYUDeZOTXk10PqrMXalK0BTE98N0hMmJWANqt4+zQdV+gUlbpSOSN
	UORxsqftnpAzijT2RoqTMjTNjIkG1nlwFDOuXsktV9iWrEkbKFeE/ablctcxvH837fj9E5QVNg9Fg
	tB20Dhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWNp-0000000Br0C-2l3P;
	Thu, 12 Jun 2025 01:05:33 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEQ-0000000BXOP-0RnU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-234b133b428so1775925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682061; x=1750286861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3R/fidHqC5yeF1RrOI6ocG+diWBEwovSia+ZMiokcw0=;
        b=3hvQEpkKeHIj85wTW+MZKuQb8zbl0KugCKHAQxqB9bNh0EJVaLZKzj6D57av+b7nQl
         9g1EfXixqTWpyNt1870PtQX8NEdY6Tv6wgLTadAIsamV2MBaLuklD1j8Ygtcj6z5TVwr
         8bacHkkJWwpi2W5NiKdUWZjr2qg3Qk8yNZlmQSw1gJcKCwNCFVfCw4d5NYTPSlWYg7/w
         nONlyfXzQqmHcVkSFw3n84vyWL1ie1jY6BQM/X57Kz8FDjU8sRsmSdC1At9+KPnlJYH1
         ldYYZ8ZCwn9eKO3/+h00y629mGBPgk5G67QeZMouwdoYauVKww5Hv2Ez6T8V2Hb+IzpY
         TjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682061; x=1750286861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3R/fidHqC5yeF1RrOI6ocG+diWBEwovSia+ZMiokcw0=;
        b=ajrGnLsB7VBPiqg8KIdZBx0sgP2dY/2pUzmEYqOjkJboWLJ9xDJbIY3vGzRcee0yZW
         bc7m/G7F91xGsEyUt3QsoWs4kGSYEkKQE88ZnxKbAOr008wkz/vR3naLJCDqCyjfRz1w
         LAGRL586eAsgyy023CJAbHDoEICu00OlbHCh0rHqEEPnxcCmqheXeOIQUZzcajjL0sO3
         y7G5gh2noO44GHJOhf4xQnDVfYPgXubHm7UoBGPXC9yu7W45V6DuG7+RKBl5f22DsYKn
         ZDelX4+3dNU1N+jBBgwZM43jvS62vTKzKa+tY/Z/FQouNX14xtdJMdlHD37r1MjyKwpq
         FdPw==
X-Gm-Message-State: AOJu0YxWcVd8iKt4ALmp9YvIJ3C8vRbizKexGfZz4tpEKUqKm0IX+Hs1
	til76mo5abfEHdYhmlKJqBTwC8rBZ9aSuWk99V2cjMobCeIwK4kQ0E2Kpt9AS8u5OX75vSVSaVE
	O0B5vvg==
X-Google-Smtp-Source: AGHT+IEOtnEHDa7Bgrp+UndiVZVCJiDQiRFAkA9eta61DTFWTRaWJpwzsbPxucwMY3m/JsIguUfc/GrPZbc=
X-Received: from plhi6.prod.google.com ([2002:a17:903:2ec6:b0:234:7a8f:b8e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b44:b0:233:d1e6:4d12
 with SMTP id d9443c01a7336-23641abc389mr58408685ad.13.1749682060626; Wed, 11
 Jun 2025 15:47:40 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:29 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-28-seanjc@google.com>
Subject: [PATCH v3 26/62] KVM: x86: Move IRQ routing/delivery APIs from x86.c
 => irq.c
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
X-CRM114-CacheID: sfid-20250611_154742_150950_900E8351 
X-CRM114-Status: GOOD (  19.38  )
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

Move a bunch of IRQ routing and delivery APIs from x86.c to irq.c.  x86.c
has grown quite fat, and irq.c is the perfect landing spot.

Opportunistically rewrite kvm_arch_irq_bypass_del_producer()'s comment, as
the existing comment has several typos and is rather confusing.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 arch/x86/kvm/x86.c | 87 ---------------------------------------------
 2 files changed, 88 insertions(+), 87 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index a0b1499baf6e..b9d3ec72037c 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -11,6 +11,7 @@
 
 #include <linux/export.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
 
 #include "hyperv.h"
 #include "ioapic.h"
@@ -332,6 +333,18 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
 	return -EWOULDBLOCK;
 }
 
+int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_event,
+			bool line_status)
+{
+	if (!irqchip_in_kernel(kvm))
+		return -ENXIO;
+
+	irq_event->status = kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID,
+					irq_event->irq, irq_event->level,
+					line_status);
+	return 0;
+}
+
 bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
 {
 	return irqchip_in_kernel(kvm);
@@ -495,6 +508,81 @@ void kvm_arch_irq_routing_update(struct kvm *kvm)
 		kvm_make_scan_ioapic_request(kvm);
 }
 
+int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
+				      struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+	struct kvm *kvm = irqfd->kvm;
+	int ret = 0;
+
+	kvm_arch_start_assignment(irqfd->kvm);
+
+	spin_lock_irq(&kvm->irqfds.lock);
+	irqfd->producer = prod;
+
+	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
+		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
+						   irqfd->gsi, &irqfd->irq_entry);
+		if (ret)
+			kvm_arch_end_assignment(irqfd->kvm);
+	}
+	spin_unlock_irq(&kvm->irqfds.lock);
+
+	return ret;
+}
+
+void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
+				      struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+	struct kvm *kvm = irqfd->kvm;
+	int ret;
+
+	WARN_ON(irqfd->producer != prod);
+
+	/*
+	 * If the producer of an IRQ that is currently being posted to a vCPU
+	 * is unregistered, change the associated IRTE back to remapped mode as
+	 * the IRQ has been released (or repurposed) by the device driver, i.e.
+	 * KVM must relinquish control of the IRTE.
+	 */
+	spin_lock_irq(&kvm->irqfds.lock);
+	irqfd->producer = NULL;
+
+	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
+		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
+						   irqfd->gsi, NULL);
+		if (ret)
+			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
+				irqfd->consumer.token, ret);
+	}
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
+
+	kvm_arch_end_assignment(irqfd->kvm);
+}
+
+int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				  struct kvm_kernel_irq_routing_entry *old,
+				  struct kvm_kernel_irq_routing_entry *new)
+{
+	return kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, irqfd->producer->irq,
+					    irqfd->gsi, new);
+}
+
+bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
+				  struct kvm_kernel_irq_routing_entry *new)
+{
+	if (old->type != KVM_IRQ_ROUTING_MSI ||
+	    new->type != KVM_IRQ_ROUTING_MSI)
+		return true;
+
+	return !!memcmp(&old->msi, &new->msi, sizeof(new->msi));
+}
+
 #ifdef CONFIG_KVM_IOAPIC
 #define IOAPIC_ROUTING_ENTRY(irq) \
 	{ .gsi = irq, .type = KVM_IRQ_ROUTING_IRQCHIP,	\
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f1b0dbce9a8b..5ba5e28532de 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6420,18 +6420,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 		kvm_vcpu_kick(vcpu);
 }
 
-int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_event,
-			bool line_status)
-{
-	if (!irqchip_in_kernel(kvm))
-		return -ENXIO;
-
-	irq_event->status = kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID,
-					irq_event->irq, irq_event->level,
-					line_status);
-	return 0;
-}
-
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
@@ -13504,81 +13492,6 @@ bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_arch_has_noncoherent_dma);
 
-int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
-				      struct irq_bypass_producer *prod)
-{
-	struct kvm_kernel_irqfd *irqfd =
-		container_of(cons, struct kvm_kernel_irqfd, consumer);
-	struct kvm *kvm = irqfd->kvm;
-	int ret = 0;
-
-	kvm_arch_start_assignment(irqfd->kvm);
-
-	spin_lock_irq(&kvm->irqfds.lock);
-	irqfd->producer = prod;
-
-	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
-		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
-						   irqfd->gsi, &irqfd->irq_entry);
-		if (ret)
-			kvm_arch_end_assignment(irqfd->kvm);
-	}
-	spin_unlock_irq(&kvm->irqfds.lock);
-
-	return ret;
-}
-
-void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
-				      struct irq_bypass_producer *prod)
-{
-	struct kvm_kernel_irqfd *irqfd =
-		container_of(cons, struct kvm_kernel_irqfd, consumer);
-	struct kvm *kvm = irqfd->kvm;
-	int ret;
-
-	WARN_ON(irqfd->producer != prod);
-
-	/*
-	 * When producer of consumer is unregistered, we change back to
-	 * remapped mode, so we can re-use the current implementation
-	 * when the irq is masked/disabled or the consumer side (KVM
-	 * int this case doesn't want to receive the interrupts.
-	*/
-	spin_lock_irq(&kvm->irqfds.lock);
-	irqfd->producer = NULL;
-
-	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
-		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
-						   irqfd->gsi, NULL);
-		if (ret)
-			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
-				irqfd->consumer.token, ret);
-	}
-
-	spin_unlock_irq(&kvm->irqfds.lock);
-
-
-	kvm_arch_end_assignment(irqfd->kvm);
-}
-
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
-{
-	return kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, irqfd->producer->irq,
-					    irqfd->gsi, new);
-}
-
-bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
-{
-	if (old->type != KVM_IRQ_ROUTING_MSI ||
-	    new->type != KVM_IRQ_ROUTING_MSI)
-		return true;
-
-	return !!memcmp(&old->msi, &new->msi, sizeof(new->msi));
-}
-
 bool kvm_vector_hashing_enabled(void)
 {
 	return vector_hashing;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


