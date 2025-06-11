Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F2C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL/zmEfedJaVYRCaVWCVwHvRFcjp3FGRcd4gYxRqVws=; b=PFbTLT7M83VoszTqY8U3+TUeoc
	X5sVf28/EAfjrcpYt/P/CYE3JZ+iylhOHCj0AvGizqa3NLcbG3r3hJTRIlzvXtcmOW/s8BAmor08G
	IzVCnD7WE4R+U6iclI8rbHS175bcbI00pUjvmlphQVEWitd7Fec09B77lOKwb/EgdRiLpC3uYVIww
	3Hxp2p5w9hIOqFPI4PlppssqH7UTXxWYavLuNqz1OvjsquhSoB3X3jWxBvt1DfmJhjmnI7zqt5BpF
	8NYDjBeGYSd7xGRwhpdx6fOOFmrgeKoCyY3VZKum7JhAmWXG/l3QWvzePrS+V4r5N/HlNJgZurAvb
	1a6cMIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXEH-0000000BvZo-1Juj;
	Thu, 12 Jun 2025 01:59:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUF7-0000000BXqK-0O1R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:26 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31366819969so290646a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682104; x=1750286904; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HL/zmEfedJaVYRCaVWCVwHvRFcjp3FGRcd4gYxRqVws=;
        b=h3w/4jpnh8/OCkNGhMMc84xvBtfvI8sX3C0P3DmfxYRPNX6CCDefzDgJwbQqCULaB/
         FZZp4F6tbbkGPj104jTagxAc4CJa2wGlKafChb/IOA6dxYB3lCcSFm7cFgoueiLf2z9X
         XCaUnJYb6nmQF7vWzpGez3K8l2scdbJHQxXzB+b6mmgoWrZiJ4q2m/p+G4PShUkFveps
         35baX1sPpcsen7FfV8W3ftm/5iHd+nXuQlKj35h1RGLOvV0mRiQxrgAE2OI0TbuaUDko
         sNpOkVpwQc8IglWhGpLmesqs28o6K4ToKaKnBXI6MpLO0Fxdw3AImPnb+bIwc3MWM34+
         53lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682104; x=1750286904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HL/zmEfedJaVYRCaVWCVwHvRFcjp3FGRcd4gYxRqVws=;
        b=SS5ldHaImVjN1vcHsAOWHFBmBzpH/2oxeIiKf8Bm9tL9/2ZBQ3Kq/WE/tulDNVw4/j
         1x+z5Gpsx1qeyJHZLiQ3d+INYpit9NZ0kSS11Sdwe8cmbUtgDq507Ezk5fGlXgpVxMPs
         m/FvbTS4qxWqltoHZzbZX39dsPtpkyhVkFe/OLfyWIWj09gEGbL4uSu3E6b3x37yvkOe
         Cse8EtUVKiKQqkBdCEn/mYJBWSagL0rqhxG5i4rPuzcwN5YJEG4G6nBfxRe8i1ZyUNNa
         jUZF4qNjA90cRTboeN5ogjyeCEpcDnDG+8foEYCnITehQnMOkY9TxJ/UwcCXv2UlnKOr
         aTNA==
X-Gm-Message-State: AOJu0YwfTiA1FGplcZBRvvtwm7k3/pGd2fNTPPson7dkafmGknI1BNwL
	kVskRdBACLTOHHq7JWnVbR75O5OQFK1wj74QyeW/9VAOYYnGRw47ieyHlpfGJp3bZpRduk8iseS
	WvWjSnA==
X-Google-Smtp-Source: AGHT+IGhHNFSgThb/kvZUf4kLsDMQ1oq0Au4sXs0Omc7Pt0JkF2VfQnLMbJPUM3t5xwiyldmiRdw4k1+Wjw=
X-Received: from pjv12.prod.google.com ([2002:a17:90b:564c:b0:313:2b27:3f90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3952:b0:30e:9349:2da2
 with SMTP id 98e67ed59e1d1-313af0fd336mr6601829a91.4.1749682104030; Wed, 11
 Jun 2025 15:48:24 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:54 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-53-seanjc@google.com>
Subject: [PATCH v3 51/62] KVM: x86: WARN if IRQ bypass routing is updated
 without in-kernel local APIC
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
X-CRM114-CacheID: sfid-20250611_154825_131940_E16335B1 
X-CRM114-Status: GOOD (  12.16  )
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

Yell if kvm_pi_update_irte() is reached without an in-kernel local APIC,
as kvm_arch_irqfd_allowed() should prevent attaching an irqfd and thus any
and all postable IRQs to an APIC-less VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 9c03a67fedbe..02efa7162252 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,8 +517,8 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) || WARN_ON_ONCE(!kvm_arch_has_irq_bypass()))
-		return 0;
+	if (WARN_ON_ONCE(!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass()))
+		return -EINVAL;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
 		kvm_set_msi_irq(kvm, entry, &irq);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


