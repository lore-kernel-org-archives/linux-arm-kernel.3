Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9730DC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2H6mQAi3X2cVhbsLup4QR14EBoE/FmvQ1a87TN4T2w=; b=eEFmBatzKgSHoDLIiWiTFAP/ds
	rXAe6Mlmzw/e+A2+xXIT4OIrcPQvhem41UW3v55gFoOyGmKRsF430liDAbgsYRkWaeLhnAPcIJD/i
	FxIaDq5DA6edRNrSu/1THeUUKFLFN2XRTR17e6oAhbWlw21iANfXPLz3fK6Tmb5haDyZ8JGGghA1T
	zofjuJqPFzodon0bZ9M8axD3qrbAPz8yjf2dubULnBuhBqh44L/AQqkVGC+Ee4KAC5tgK+k89pKJz
	mCC91l/dbb6Rv4KbwPnehE7pq8Liwbw5vR2t0Ld+CpUH0yw25y4A1tVJm3iNbz8CLn/sOGaB9uCq9
	n5vST5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXbN-0000000BxdU-1Ibg;
	Thu, 12 Jun 2025 02:23:37 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFQ-0000000BY52-31K9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:45 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-234a102faa3so1867745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682123; x=1750286923; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A2H6mQAi3X2cVhbsLup4QR14EBoE/FmvQ1a87TN4T2w=;
        b=Y69DtCfb2WXvWhc1OiRIlm/5mNCLrsSuzH3WKibJbaY34C30qgM1tMzL2f3viT4iMA
         CTt/5tMOV82n+aAOrfpGvhLtvOMzBtUmRhYSN3nMY5IkbjxR3WLIMU/1RLFX8H6ez0Ce
         fOV9ZZY9lYJq9bO6Drmy8cvoAx+TvE/lsjmth2hMkfjDkIbFD7GCOZVdpyb+eDtLQhX8
         UgbwV4L8kISWrtACGiZ4W8SMfKdyRxD4jkJEH1iWPXgzdHBpYkjwcQIwdKBIhn0Plbgj
         V3tnl3J38eNCysH9W5TxY0QwH2zwZAxE7AFy4Dyy7UUA5o2FP8ZO5AgTuQSASwjLtC9m
         gsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682123; x=1750286923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2H6mQAi3X2cVhbsLup4QR14EBoE/FmvQ1a87TN4T2w=;
        b=YJOlrkeRB0T3OzpWSYFIQMv+ja8rQFEEkiYJ3DFmrUMbhYXsdrZWzwQnAAWIrOgHDb
         JHfo7O4QWqg2/M1ZTlM3XNM9fylJE3B8zmPCEU5U8i6LKIAJplC9xMk1Oxt/7NJhF4ES
         diqp8TseRkB6uMD2FQD7nuOGJ5Q4iBNS80QqI3nS8sNe3uMxFUmYRGaWk8ijbjaiwjWZ
         3eTDElOTJV0T88r2p1D95ESGngTwNmYCI+UEdecH2tBNiepRSpn99hiXOzJQVQBQTexu
         mcFE9vTeFiY/eRfwkoC23S+iA0UG3yoT3mpoJlcTUXn+wh7ssRkZM3TRkyAcSpq0gR0o
         evRQ==
X-Gm-Message-State: AOJu0YwB2LK5y0tbyMKU8Xyt55BzymtWd6DR1mD4LvLtsXPOnBuRSAVz
	facGf3LqVjHfwGeSPy346YPN25vAnAVSyzQdEZVJtlT8ur29jLTse2a9lA33cE5IFhjZi+U3Wgf
	RxQqNwQ==
X-Google-Smtp-Source: AGHT+IEmj8Wn93vyxOZ20/CzQNxDRl4F7IoOM7uRFd48VrtVcKzRebVp/cgdBntFE1vN9k4o1Eln3ZwGSvs=
X-Received: from plhl7.prod.google.com ([2002:a17:903:1207:b0:21f:4f0a:c7e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54f:b0:234:ba37:87a5
 with SMTP id d9443c01a7336-23641b1aab7mr72956825ad.25.1749682123415; Wed, 11
 Jun 2025 15:48:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:46:05 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-64-seanjc@google.com>
Subject: [PATCH v3 62/62] KVM: x86: Rename kvm_set_msi_irq() => kvm_msi_to_lapic_irq()
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
X-CRM114-CacheID: sfid-20250611_154844_774107_733155ED 
X-CRM114-Status: GOOD (  13.13  )
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

Rename kvm_set_msi_irq() to kvm_msi_to_lapic_irq() to better capture what
it actually does, e.g. it's _really_ easy to conflate kvm_set_msi_irq()
with kvm_set_msi().

Opportunistically delete the public declaration and export, as they are
no longer used/needed.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 ---
 arch/x86/kvm/irq.c              | 14 +++++++-------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 01edcefbd937..af08b1acba04 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2381,9 +2381,6 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu);
 bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
 			     struct kvm_vcpu **dest_vcpu);
 
-void kvm_set_msi_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
-		     struct kvm_lapic_irq *irq);
-
 static inline bool kvm_irq_is_postable(struct kvm_lapic_irq *irq)
 {
 	/* We can only post Fixed and LowPrio IRQs */
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 3e4338c6a712..83c91845389c 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -252,8 +252,9 @@ int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 	return r;
 }
 
-void kvm_set_msi_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
-		     struct kvm_lapic_irq *irq)
+static void kvm_msi_to_lapic_irq(struct kvm *kvm,
+				 struct kvm_kernel_irq_routing_entry *e,
+				 struct kvm_lapic_irq *irq)
 {
 	struct msi_msg msg = { .address_lo = e->msi.address_lo,
 			       .address_hi = e->msi.address_hi,
@@ -271,7 +272,6 @@ void kvm_set_msi_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
 	irq->level = 1;
 	irq->shorthand = APIC_DEST_NOSHORT;
 }
-EXPORT_SYMBOL_GPL(kvm_set_msi_irq);
 
 static inline bool kvm_msi_route_invalid(struct kvm *kvm,
 		struct kvm_kernel_irq_routing_entry *e)
@@ -290,7 +290,7 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
 	if (!level)
 		return -1;
 
-	kvm_set_msi_irq(kvm, e, &irq);
+	kvm_msi_to_lapic_irq(kvm, e, &irq);
 
 	return kvm_irq_delivery_to_apic(kvm, NULL, &irq, NULL);
 }
@@ -313,7 +313,7 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
 		if (kvm_msi_route_invalid(kvm, e))
 			return -EINVAL;
 
-		kvm_set_msi_irq(kvm, e, &irq);
+		kvm_msi_to_lapic_irq(kvm, e, &irq);
 
 		if (kvm_irq_delivery_to_apic_fast(kvm, NULL, &irq, &r, NULL))
 			return r;
@@ -486,7 +486,7 @@ void kvm_scan_ioapic_routes(struct kvm_vcpu *vcpu,
 			if (entry->type != KVM_IRQ_ROUTING_MSI)
 				continue;
 
-			kvm_set_msi_irq(vcpu->kvm, entry, &irq);
+			kvm_msi_to_lapic_irq(vcpu->kvm, entry, &irq);
 
 			if (!irq.trig_mode)
 				continue;
@@ -521,7 +521,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 		return -EINVAL;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
-		kvm_set_msi_irq(kvm, entry, &irq);
+		kvm_msi_to_lapic_irq(kvm, entry, &irq);
 
 		/*
 		 * Force remapped mode if hardware doesn't support posting the
-- 
2.50.0.rc1.591.g9c95f17f64-goog


