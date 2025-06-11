Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1ACC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1v5tfF/UZZJDfH96jk5AIZx6aa1AacPrxrUndI2qrI=; b=gTx7fRVHttsRLEp3Is8B1uSvRw
	GzoYqGk9SPxVCjztyWWS/hGExGr4zHKHuIaVUFsEIkjLB0Cx2G8eGFQZKbYldu69FYyXLBkxHbGDW
	aET59KzX6lVI4yYeFb7Iv2E0YVtAxnKFiorH69yshoBveCSTEb27R54TnZWSwE5jE7VAHOvoVavOI
	IRnJR0gRWtyVLcQUhFQr1AoA4rOxq8l0IUVBKiWF0QAlkVEKp+GvPN1sJb1hxHDukQhAli9CkWwU3
	zbGCxrffrRavjHINTN97KdWXCO44GM1LdRCyWOujk2Ue9b9UCAZztnbiKiJU0T3hT5EfoVuGa30RX
	hQIJX2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWeb-0000000BsDz-1bJg;
	Thu, 12 Jun 2025 01:22:53 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEd-0000000BXWM-0Xg0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:56 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2358de17665so2295345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682074; x=1750286874; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t1v5tfF/UZZJDfH96jk5AIZx6aa1AacPrxrUndI2qrI=;
        b=d4QEoCQolDGTyaSvzAN5q0pvdqlvVH8ekkJm9uBh3abu4l/8Fx1se+xERMk8TbKUW7
         1d7lKAC3X2loSkr/D/fzNCXR/GpyWUBcU6urQaF7kKxuMyPLSS33mHyV3bH1XqmScfAX
         OviUpHMtkxxPQBi5eI2Y+TqlqpEhbju0YY1vHB1LH8PMXUINOi7aobDyEIYdeN10qBgg
         tRWB48mRa/0WkAPE6UoEFEhb0dbY5FiBOZ2UJBNir5tw0zodTqfTzK5NpbymHvWW9R56
         KF87f+ZDrhyEunerZcOPbHzFK/bMUzD1mjguZddalKP8qWN+6RE6cXuNsIqCt577LSEN
         kWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682074; x=1750286874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1v5tfF/UZZJDfH96jk5AIZx6aa1AacPrxrUndI2qrI=;
        b=TgWMqSoEMCLcGnvMdl8+aDZtB23B0b8X+yoz6WU+HYemF0Dvx7yJHGL+rJHs5dZ5JW
         VWpmbgk3P4Qp8IcvSPZKnkOvRoYvtvmDU5CXGyV/KxzhPUCHZEil2Xj1c5nPYRwyS5Oi
         OzIDVwn2k3bItKkZQyLIs+bGv9Awa+M/+a7osOBJgcLgtaIoJC+p6yLW4KvhnFrynYow
         7ZwCvHsxXT67ZOAHAoOwvIBZGakzF4+dH+Ws7sSfHgRq4pA92qCnU0Jk2UEXd9tNL3Ss
         05RY5Rj30Y+7kIU0Vjzz1S3PQLqUiTEybAN5tIofppY1KhJJC1EpIvOPxwykE16a+i5f
         3Zgw==
X-Gm-Message-State: AOJu0YxWvR0RXOgbyLNMozdepAH+OL/GhWSPoNG8PzWcTq4McEuLAAt2
	TtF4hZ6tpr4VI0JuU5sjHdDklQhK6SKmj+6rbvfOmsQwEtTIhtFy4NZ28f73zG+pjn4i7YLFLB4
	NvHRrTw==
X-Google-Smtp-Source: AGHT+IHIOpTSYBslk2iwZ1Yvx7LxGgsjWNiUHu2s2XYfcpOZTsc6ZoL/od1AWVcDdNAHt+Yg97+L8Wtz5XQ=
X-Received: from pjbta5.prod.google.com ([2002:a17:90b:4ec5:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f4e:b0:234:cb4a:bc1b
 with SMTP id d9443c01a7336-2364d90f8acmr10461455ad.49.1749682074268; Wed, 11
 Jun 2025 15:47:54 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:37 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-36-seanjc@google.com>
Subject: [PATCH v3 34/62] KVM: x86: Track irq_bypass_vcpu in common x86 code
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
X-CRM114-CacheID: sfid-20250611_154755_175765_66487A98 
X-CRM114-Status: GOOD (  14.18  )
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

Track the vCPU that is being targeted for IRQ bypass, a.k.a. for a posted
IRQ, in common x86 code.  This will allow for additional consolidation of
the SVM and VMX code.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c      | 7 ++++++-
 arch/x86/kvm/svm/avic.c | 4 ----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 48134aebb541..6447ea518d01 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -544,8 +544,13 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 
 	r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
 					 vcpu, irq.vector);
-	if (r)
+	if (r) {
+		WARN_ON_ONCE(irqfd->irq_bypass_vcpu && !vcpu);
+		irqfd->irq_bypass_vcpu = NULL;
 		return r;
+	}
+
+	irqfd->irq_bypass_vcpu = vcpu;
 
 	trace_kvm_pi_irte_update(host_irq, vcpu, irqfd->gsi, irq.vector, !!vcpu);
 	return 0;
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 6085a629c5e6..97b747e82012 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -767,22 +767,18 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 	spin_lock_irqsave(&to_svm(vcpu)->ir_list_lock, flags);
 	list_del(&irqfd->vcpu_list);
 	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
-
-	irqfd->irq_bypass_vcpu = NULL;
 }
 
 static int svm_ir_list_add(struct vcpu_svm *svm,
 			   struct kvm_kernel_irqfd *irqfd,
 			   struct amd_iommu_pi_data *pi)
 {
-	struct kvm_vcpu *vcpu = &svm->vcpu;
 	unsigned long flags;
 	u64 entry;
 
 	if (WARN_ON_ONCE(!pi->ir_data))
 		return -EINVAL;
 
-	irqfd->irq_bypass_vcpu = vcpu;
 	irqfd->irq_bypass_data = pi->ir_data;
 
 	spin_lock_irqsave(&svm->ir_list_lock, flags);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


