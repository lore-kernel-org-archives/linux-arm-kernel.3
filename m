Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A0C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVORzZ3WtABPA4nL5djBdFQBg9zHlAGlDI6miaVMwbQ=; b=i/uIIMtGPrWDPmMCE6kjQhMT5p
	w0Wo5K+B16xFOeQFcaZFuk51bbYXzyYu4hmsWBRaltYRXR7df8cp5Z76+mULjrO1ZdjFeOtrT0JVq
	1wNnMsMu4nF2NRpIB4n6ZadzN5ReOyqfxWE9xc99NOZA6aHpIX9CLRaDtf/CJC6i1OXJR1kSWraFf
	ALzPpbR88jc7iUZXPUcPXtuGraGSJtW0fYSU1Orde7ZtmRoFh+Wv4Z2Hx7cja7RVgdg5wRrO6+/b4
	IBBV597jhQ+SUZsu9APdTz3cXL+kOUf1rcX37/6t25ma1td2YO5IsoHv4rB8/yYzZ+H4ygUbfD09R
	llPvjYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWaQ-0000000Bs2F-04Rj;
	Thu, 12 Jun 2025 01:18:34 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEZ-0000000BXUb-44Xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:53 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30a59538b17so291516a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682071; x=1750286871; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IVORzZ3WtABPA4nL5djBdFQBg9zHlAGlDI6miaVMwbQ=;
        b=4WM4D/dL0DwFOR8Ie4rCDlY/d0UKBPrfW45ZjfI2NRe3lBE56S4B0niBT9BUHrR6gk
         V4ajtXKm2DlemA5/5hrViPHssL3szZri+u9GFCZ/DD1oQnCszd0u2l9r2cXNHYYvc/0c
         vVyoE+FgDebQNG5YFIgumvQnUDg3wzmrcVx3s7azamU8Gk99hCQuR/XbKjRXM4YycLGG
         m6SK2g0z0WwNSW3/q4k7h5aIiZH3kQLmSLxPjYofDC1z1c1rYm6DlyUouRg6U2Ezduk9
         Gc0ee+HkY+rBN07/ydAHdeVALtjLxiEBve7ncBENX/CMJd2tkKd0SvHalwI9DjVOwsWr
         WvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682071; x=1750286871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVORzZ3WtABPA4nL5djBdFQBg9zHlAGlDI6miaVMwbQ=;
        b=f7tjAVwUqYYSNSfKuWwUbp2w+C2ZMAAVFuUYTBQDdfajve6UCv9P19TTjXOgGxjoYV
         r6B5RTQODcdLYw4vfR2ZeEIqiNAV+Pqprb/Xxh6hgBEb6eoMWWNt2vQ0wIXl+OXeBLuA
         CbZYL3+6Flv1bfXn3QgGGdaXqwHsYfnLlEQ1XKS40gBp6RSDWaXJqENmkp16cl4KRurd
         58lIjJZ3nEYyA6dcr7VB3BDfIcr5ODgLXYfuHX53Nzpwz4S282qOnm0JqQjAoHXYXvQy
         dLM8I+yb7/NpGI8bDqfy94BW7V65Zk4CL6nikSqLeI4Z2wtviKwRulD8LrIeJX8NX6Ew
         NyWg==
X-Gm-Message-State: AOJu0YwditzHPTvn+zoL2EmMeK2iZM902pixWfikK5xZSh+oh98lteaS
	rfOCZMohFJg/UpJbh0fGAH18/VJk505x3wEDr3jI4JHGWE2aqDFZky3yBG4eKOhpjtpWaydxKZO
	y3wm7Zg==
X-Google-Smtp-Source: AGHT+IHL9/OcJTEGPKZiKOBxCN3k4QlrTLAqBQPtsp7OZWVMLJS3qoHaHW8s60G6klv+4Oa8JxHOL5bk6d0=
X-Received: from pjbpq18.prod.google.com ([2002:a17:90b:3d92:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3952:b0:30e:9349:2da2
 with SMTP id 98e67ed59e1d1-313af0fd336mr6600558a91.4.1749682070803; Wed, 11
 Jun 2025 15:47:50 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:35 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-34-seanjc@google.com>
Subject: [PATCH v3 32/62] KVM: Don't WARN if updating IRQ bypass route fails
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
X-CRM114-CacheID: sfid-20250611_154752_017709_08A82D73 
X-CRM114-Status: GOOD (  15.83  )
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

Don't bother WARNing if updating an IRTE route fails now that vendor code
provides much more precise WARNs.  The generic WARN doesn't provide enough
information to actually debug the problem, and has obviously done nothing
to surface the myriad bugs in KVM x86's implementation.

Drop all of the associated return code plumbing that existed just so that
common KVM could WARN.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c          |  6 +++---
 arch/arm64/kvm/vgic/vgic-v4.c | 11 ++++-------
 arch/x86/kvm/irq.c            |  8 ++++----
 include/kvm/arm_vgic.h        |  2 +-
 include/linux/kvm_host.h      |  6 +++---
 virt/kvm/eventfd.c            | 15 ++++++---------
 6 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a9a39e0375f7..94fb2f096a20 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2771,9 +2771,9 @@ bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
 	return memcmp(&old->msi, &new->msi, sizeof(new->msi));
 }
 
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new)
 {
 	/*
 	 * Remapping the vLPI requires taking the its_lock mutex to resolve
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 86e54cefc237..5e59a3f5d4c9 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -527,29 +527,26 @@ static struct vgic_irq *__vgic_host_irq_get_vlpi(struct kvm *kvm, int host_irq)
 	return NULL;
 }
 
-int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
+void kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
 {
 	struct vgic_irq *irq;
 	unsigned long flags;
-	int ret = 0;
 
 	if (!vgic_supports_direct_msis(kvm))
-		return 0;
+		return;
 
 	irq = __vgic_host_irq_get_vlpi(kvm, host_irq);
 	if (!irq)
-		return 0;
+		return;
 
 	raw_spin_lock_irqsave(&irq->irq_lock, flags);
 	WARN_ON(irq->hw && irq->host_irq != host_irq);
 	if (irq->hw) {
 		atomic_dec(&irq->target_vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vlpi_count);
 		irq->hw = false;
-		ret = its_unmap_vlpi(host_irq);
-		WARN_ON_ONCE(ret);
+		WARN_ON_ONCE(its_unmap_vlpi(host_irq));
 	}
 
 	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
 	vgic_put_irq(kvm, irq);
-	return ret;
 }
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index ec13d1d7706d..adc250ca1171 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -606,11 +606,11 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	kvm_arch_end_assignment(irqfd->kvm);
 }
 
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new)
 {
-	return kvm_pi_update_irte(irqfd, new);
+	kvm_pi_update_irte(irqfd, new);
 }
 
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4a34f7f0a864..b2a04481de1a 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -434,7 +434,7 @@ struct kvm_kernel_irq_routing_entry;
 int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int irq,
 			       struct kvm_kernel_irq_routing_entry *irq_entry);
 
-int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq);
+void kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq);
 
 int vgic_v4_load(struct kvm_vcpu *vcpu);
 void vgic_v4_commit(struct kvm_vcpu *vcpu);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a4160c1c0c6b..8e74ac0f90b1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2410,9 +2410,9 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
 			   struct irq_bypass_producer *);
 void kvm_arch_irq_bypass_stop(struct irq_bypass_consumer *);
 void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *);
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new);
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new);
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *,
 				  struct kvm_kernel_irq_routing_entry *);
 #endif /* CONFIG_HAVE_KVM_IRQ_BYPASS */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 85581550dc8d..a4f80fe8a5f3 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -285,11 +285,11 @@ void __attribute__((weak)) kvm_arch_irq_bypass_start(
 {
 }
 
-int __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-					 struct kvm_kernel_irq_routing_entry *old,
-					 struct kvm_kernel_irq_routing_entry *new)
+void __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+					  struct kvm_kernel_irq_routing_entry *old,
+					  struct kvm_kernel_irq_routing_entry *new)
 {
-	return 0;
+
 }
 
 bool __attribute__((weak)) kvm_arch_irqfd_route_changed(
@@ -618,11 +618,8 @@ void kvm_irq_routing_update(struct kvm *kvm)
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
 		if (irqfd->producer &&
-		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry)) {
-			int ret = kvm_arch_update_irqfd_routing(irqfd, &old, &irqfd->irq_entry);
-
-			WARN_ON(ret);
-		}
+		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry))
+			kvm_arch_update_irqfd_routing(irqfd, &old, &irqfd->irq_entry);
 #endif
 	}
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog


