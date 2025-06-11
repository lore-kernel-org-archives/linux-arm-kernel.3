Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B10AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mZdmaSdm4nN9o3kcSmnCQqm8oVomLbyxtnfKwvcz+Y=; b=kOa1pctte2u3/HciNQeO8FVWBL
	LWO8YuIHjZ5PuJLoOT940tUjYdjV0VqUPXIW0uEfygcMn7howjOJVOg2JOsqwEdNabS/7cVJE21z8
	KsQ5msgwjl0bBb5YI7Fh/jrmIlUF7iQmyv/Ty3LJs+/9PpWNISUIFEfsJuysaB9+cYCVFcZKQebBk
	qtjzimaMTHH2gsiCQgK70z4FtYzEF40ozeYVBij9HHqyFY8lMdDmLnrADYUyelsWfy9XcPsHV3dLn
	HsPlAHjDCAQyTwPbzv/e+t3U7qxQvo2xuT40qDkFbEUcxM6fkZudkI2LZiw4xMkQ367gnLs7IcLwi
	4VRupPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXA3-0000000Bv1D-3dOs;
	Thu, 12 Jun 2025 01:55:23 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUF3-0000000BXoE-25sQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:22 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747d84fe5f8so177140b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682100; x=1750286900; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4mZdmaSdm4nN9o3kcSmnCQqm8oVomLbyxtnfKwvcz+Y=;
        b=JUndHQ4JyqcUu8W371Hu7BVqcY1HazIazG07B7U+Rhc6kDuYhX2ZEITTM/R6JS4u55
         nMEtWWebCzPZzin3W/SKvRLkR3OcS9GMZPVtEZiR8xkEtYjU/leP6yMIHTK9EcbeA2LT
         T0NAsToE1O4ZlEk+E4B42t9OPOMfYTbrf4KlZDDK6Gu9prla9SI4OK8MNyf14vXnObLh
         BK+xmFlfXGmPRbyU1XzCA2gjkxfesg7xGdU6nY4vOersC7aDUtOwanaTKVp8HCB+VM5m
         dd7X4143u9nRpNrHvi9mwefpN4Hr7nXdkUtTluR5ufA3VGVKf2rgDIhAcaejEL4qDY/Z
         7YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682100; x=1750286900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mZdmaSdm4nN9o3kcSmnCQqm8oVomLbyxtnfKwvcz+Y=;
        b=l7IqZ5wz2bnPadCkNllj/mTIQCVcGXrILax/yNipVwvzydi23I+ByjDsEx/4kMAJo4
         RpF+cdztUT5jDFoigcyUDzf9518fG3Lnam00YhkLlHWgWOiw4wuXBfuhneg2nGAsOeS+
         U7LZwCKVW92EVGhtNwo1NO18ddj6RcTopDfqv9YQTiE9XHs+MDkUymulQQc5PWBdznsv
         SrK2bPWPoSM9KE3dm5OZI6iNRn6PEJm8Kl5yzCZGxXcVpmAkRJSO91PPg2uz6wmwoUhs
         mMNA7kpkl2oPEDrEGwZbGKfyyaQDpa/LKcJD82yfGSeiNIIvw9q9SSRek0my+rmxVLwi
         ITeQ==
X-Gm-Message-State: AOJu0YzOiyNy/oZvIFfsUFQZLafblIhaagW1YtXyLpV00cXaTbVLc3BR
	KCJkHlCHPA9axcP1in9cuxT/S0RoDs9vGa3RROfPJ3VlBAh8ezapY6iL9jnFB+Fu9NKg0iBDH0s
	9xXOWbA==
X-Google-Smtp-Source: AGHT+IEg+AS8QoF49j7jfT3TPcNYHFW9Ujm+mi8oTh+WHeby3lk+SesimVareIU6PzlpR4BED7xC7oESYEc=
X-Received: from pgn7.prod.google.com ([2002:a63:d47:0:b0:b2c:4d7e:b626])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2d43:b0:1f5:56fe:b437
 with SMTP id adf61e73a8af0-21f86727b69mr7698366637.32.1749682100654; Wed, 11
 Jun 2025 15:48:20 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:52 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-51-seanjc@google.com>
Subject: [PATCH v3 49/62] KVM: x86: Drop superfluous "has assigned device"
 check in kvm_pi_update_irte()
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
X-CRM114-CacheID: sfid-20250611_154821_533529_B76DE3BB 
X-CRM114-Status: GOOD (  10.71  )
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

Don't bother checking if the VM has an assigned device when updating
IRTE entries.  kvm_arch_irq_bypass_add_producer() explicitly increments
the assigned device count, kvm_arch_irq_bypass_del_producer() explicitly
decrements the count before invoking kvm_pi_update_irte(), and
kvm_irq_routing_update() only updates IRTE entries if there's an active
IRQ bypass producer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 4119c1e880e7..45cb9f1ee618 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,9 +517,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) ||
-	    !kvm_arch_has_irq_bypass() ||
-	    !kvm_arch_has_assigned_device(kvm))
+	if (!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass())
 		return 0;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


