Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B4BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWPqxy/EcaIBVD9x6tvhc+E9e7T+tuW/T8x9vMu/aCc=; b=e5OVDiiAdjl7MvbmYxEjvDp2i3
	xQpmoxNhxMwmLBEAMvVDmCtciY3xzTTTFLtNXdFJ2xIH80zlki8ktEx2cIoSFezfl/QbWuxo2qzRv
	IvZbyGXgRZ10OwNbwZ8UhhBGt5s52h35aF/jeMLuAXM/Y99WD6nBjYTxCetDd68nju6FcqX7K7jPC
	vO2c0xYuZl/WOBUMYZz02CsxuuQ9DWFmhG08tbu9OceBzlwgTwClRX/jrtsQvecfrOWJi+sPiaNO5
	FHNhG/N9KxDdhi1rLSc+RZjXCCzrQGUWsUn+4jSeEPwXS7vcDsvEvj4wpWp2iD4H+WFMS71IpptFV
	M9UVLLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWcV-0000000Bs8C-2wAP;
	Thu, 12 Jun 2025 01:20:43 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEb-0000000BXVV-3dXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:54 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747d143117eso252750b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682072; x=1750286872; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eWPqxy/EcaIBVD9x6tvhc+E9e7T+tuW/T8x9vMu/aCc=;
        b=lo57kKKkB8F2YRqNIT6WHZsKWVJpuly3+Mqyb8irJAvUS/sqPPc1o8r6oJNLq9BihN
         pVzk4SQygUzhLIrsclpQGXPiskK0oaqvp4XUG2d19DL67t+BCDF+gqZ1DItyczBhdOoO
         OWcYLEHIv458QB8i+yx9tqe8dsrRwjPC6FZVZmN8NDfyEepo5wWlKQgI7XXisDWZhdfa
         1jEGmLtPJj5YtlGVFbg14603ctQliw0eGdsM05b+HYpTSa3+KyjL8hpYoqoqNeIdWmuU
         pxOF5DeZNArNgtYqeF26YusiFXvFu9e0Wdp12aVYwQ1TzHu1flvFaGhQIbr37Z++PkzQ
         sLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682072; x=1750286872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWPqxy/EcaIBVD9x6tvhc+E9e7T+tuW/T8x9vMu/aCc=;
        b=a/iaEYfhlFewbz0tow6fQmSfsygEjJOzm9IWO1U0+HK4Y19mf/0MYUHM4yKf5bBlA9
         G29x/CnSmiiM1SWAiLAg5znJiXlnl1FROqPuf7NmUQTyh9qcRlAfay2mGWuNxdUWzWgN
         ZMxzG0cdkNPB9nO+AMbspJ+daEmfgK+/BRTiq8xWxDe2JeYJ9EUxpD0AqaZ44Q2aFQ9s
         IhRJQH53WQcHnEplURXNMEXnHCsZT4nNgvV05WNRdnowJjdIbUdO2IyMOL5J/Ap5TcBh
         38kbdhCzAukrxTttVLvM6EAbt0aRXwRsmbwGxPL3KwsihKdNPe3t/suuJkuWeP00jcrv
         NGvQ==
X-Gm-Message-State: AOJu0YzCnEnXsWN+q4m5TMRS/7nFV6vXxK8p2OUbhpwgkdt3jxIZ2VPX
	q5d2LmXf5k3JTW/H1vLSL92bJfxkPRCzznJIyBcz+KnkzOkO3p0o7WKZnsKR7I1hL1zdti+8liM
	4i+DUJQ==
X-Google-Smtp-Source: AGHT+IGEG5h+XdvBZsfOP4WIVoU6EIbIQoZeJBB+YTLPLiy+efdbc+9aZGANnnVVnd62MBQByP1coVKnSpY=
X-Received: from pfbhj8.prod.google.com ([2002:a05:6a00:8708:b0:746:2747:e782])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:22cf:b0:748:2ebf:7418
 with SMTP id d2e1a72fcca58-7487e2dc74dmr987606b3a.24.1749682072521; Wed, 11
 Jun 2025 15:47:52 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:36 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-35-seanjc@google.com>
Subject: [PATCH v3 33/62] KVM: Fold kvm_arch_irqfd_route_changed() into kvm_arch_update_irqfd_routing()
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
X-CRM114-CacheID: sfid-20250611_154753_907021_DBA152C6 
X-CRM114-Status: GOOD (  14.32  )
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

Fold kvm_arch_irqfd_route_changed() into kvm_arch_update_irqfd_routing().
Calling arch code to know whether or not to call arch code is absurd.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c     | 15 +++++----------
 arch/x86/kvm/irq.c       | 15 +++++----------
 include/linux/kvm_host.h |  2 --
 virt/kvm/eventfd.c       | 10 +---------
 4 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 94fb2f096a20..04f2116927b1 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2761,20 +2761,15 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	kvm_vgic_v4_unset_forwarding(irqfd->kvm, prod->irq);
 }
 
-bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
-{
-	if (old->type != KVM_IRQ_ROUTING_MSI ||
-	    new->type != KVM_IRQ_ROUTING_MSI)
-		return true;
-
-	return memcmp(&old->msi, &new->msi, sizeof(new->msi));
-}
-
 void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 				   struct kvm_kernel_irq_routing_entry *old,
 				   struct kvm_kernel_irq_routing_entry *new)
 {
+	if (old->type == KVM_IRQ_ROUTING_MSI &&
+	    new->type == KVM_IRQ_ROUTING_MSI &&
+	    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
+		return;
+
 	/*
 	 * Remapping the vLPI requires taking the its_lock mutex to resolve
 	 * the new translation. We're in spinlock land at this point, so no
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index adc250ca1171..48134aebb541 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -610,19 +610,14 @@ void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 				   struct kvm_kernel_irq_routing_entry *old,
 				   struct kvm_kernel_irq_routing_entry *new)
 {
+	if (old->type == KVM_IRQ_ROUTING_MSI &&
+	    new->type == KVM_IRQ_ROUTING_MSI &&
+	    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
+		return;
+
 	kvm_pi_update_irte(irqfd, new);
 }
 
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
 #ifdef CONFIG_KVM_IOAPIC
 #define IOAPIC_ROUTING_ENTRY(irq) \
 	{ .gsi = irq, .type = KVM_IRQ_ROUTING_IRQCHIP,	\
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8e74ac0f90b1..fb9ec06aa807 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2413,8 +2413,6 @@ void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *);
 void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 				   struct kvm_kernel_irq_routing_entry *old,
 				   struct kvm_kernel_irq_routing_entry *new);
-bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *,
-				  struct kvm_kernel_irq_routing_entry *);
 #endif /* CONFIG_HAVE_KVM_IRQ_BYPASS */
 
 #ifdef CONFIG_HAVE_KVM_INVALID_WAKEUPS
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index a4f80fe8a5f3..defc2c04d241 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -291,13 +291,6 @@ void __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 {
 
 }
-
-bool __attribute__((weak)) kvm_arch_irqfd_route_changed(
-				struct kvm_kernel_irq_routing_entry *old,
-				struct kvm_kernel_irq_routing_entry *new)
-{
-	return true;
-}
 #endif
 
 static int
@@ -617,8 +610,7 @@ void kvm_irq_routing_update(struct kvm *kvm)
 		irqfd_update(kvm, irqfd);
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
-		if (irqfd->producer &&
-		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry))
+		if (irqfd->producer)
 			kvm_arch_update_irqfd_routing(irqfd, &old, &irqfd->irq_entry);
 #endif
 	}
-- 
2.50.0.rc1.591.g9c95f17f64-goog


