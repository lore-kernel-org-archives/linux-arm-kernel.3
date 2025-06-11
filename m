Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D591C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8/39YMW2TnSu0vcgq5sLc/aWRKEr8Y6tOCzdbkWep0=; b=lNNy58/Lpkt7nl2kg3kL0Tw/Tx
	Q5+yONWuD8K/GnxCo8zcgJ3Lf/k+f57JkAj+hy+MgrDPoVDNviN1AJ8RvQ6QNbkI8BuNVzrCUkCRA
	1Xt2RUlSEXQP21vW07CAKasTQ5wcHjRw9kDcdb9OmfgA2oNz8UxZmmYEPkCM8QVcEMfpeziwSEKBp
	Wsin2wSi/OZyc0Axiu7/yxzIFfZ4Sax4kE/SwmVUseb/N1G6c1fUT76yDapUhnBxyYBDc1RSlGSql
	u0e2Na/ZRr5iJP4UzcZPaIen5hPUhjtJ00O0iYnKWzu6dia1EYjNN9F+sh7tG5BgTAvU3YX0r4yCD
	oBsl+szg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVZR-0000000BleL-12GP;
	Thu, 12 Jun 2025 00:13:29 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDl-0000000BWqm-09lC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311b6d25163so282471a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682019; x=1750286819; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=J8/39YMW2TnSu0vcgq5sLc/aWRKEr8Y6tOCzdbkWep0=;
        b=R8JjbJ8bcnHCsAbIuewBiZpEp9tp8A/oie4REx6/LEauTtHCrC7VW6+t25qFTfEg3s
         byNOvvhdVlyXsUInn0K1oWgBnwURz6hcGdac8bsRhKRh+aHRn9zPIgzK4zCo7Tj3qQAI
         64rNzZXTVkOWLPHqjr7wA4b8+q0nHkpE9GuUCvEhfMGZqcVfToNPLShjleurYlZHp0TW
         PWRSKiRO25LFOqt2BJ57+Epw17pWhaZ1ysSXE4Ujdjvn93yTa/aPeAvAaw+4gnYF1J/q
         lhNhMyr7n2d6GqFD78mmNtP27Mw53Nvzql5JbyLqOmMj5Jg0iHG6dTrOrUpPw2kGdh1X
         aY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682019; x=1750286819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8/39YMW2TnSu0vcgq5sLc/aWRKEr8Y6tOCzdbkWep0=;
        b=b17PPGpSnrHGrcF3VXM6uEP91NEYBa08Kd+TyQKEQgDSIuCIW/IA30xNoYmUTmlZOL
         /ojhIF49aNeruuu7l3tY94LkzSxIrpI2sftgX7pTugZ7iqCNcoBY8rYtxLMgaku4WJyA
         CJiL19H4xAiceFDvAeX+ig1DxP446YLhqeNYNwvTyBVI2twEaQWLJ14UefhQeiHvyFgz
         tgJ6QCL/Pavz5MfGKrtHg3ioAf0Zs2Ckdy/CC5Ka5rh9jyfonFWvuN6NhIE36KhavWHp
         zMu/zPOWX4xAClOugIjL+dNmvLVptvOA35mfUua7KafZaWnHPjRwklcj3fvuDLbJLH57
         GHoA==
X-Gm-Message-State: AOJu0Yy4kxmDKv6Cl3hNBbD6zDp0M3zio9m2JFLJ31fw4Sch0Lywy4lC
	It+A7W1FDf2KKWNyI1kOt6ej6iB+1jNz5IT0R1dV3CchHgeO+Rzn2vs2I9y/P2lpCvelj0Ix2Iy
	hDdvmPw==
X-Google-Smtp-Source: AGHT+IE4n+pz35x0pb/YvabbWEbD1z+qTn+f+8VFoLc/qnaff30Vgk2g7VglikeaFDWzSwKhNVkNo49sz8M=
X-Received: from pjbpa3.prod.google.com ([2002:a17:90b:2643:b0:311:46e:8c26])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3902:b0:311:abba:53c9
 with SMTP id 98e67ed59e1d1-313bfba1132mr1720309a91.7.1749682019303; Wed, 11
 Jun 2025 15:46:59 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:05 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-4-seanjc@google.com>
Subject: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
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
X-CRM114-CacheID: sfid-20250611_154701_079746_A949150E 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

WARN if unmapping a vLPI in kvm_vgic_v4_unset_forwarding() fails, as
failure means an IRTE has likely been left in a bad state, i.e. IRQs
won't go where they should.  WARNing in arch code will eventually allow
dropping all the plumbing a similar WARN in kvm_irq_routing_update(),
and thus avoid having to plumb back a return code just to WARN.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 193946108192..86e54cefc237 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -546,6 +546,7 @@ int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
 		atomic_dec(&irq->target_vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vlpi_count);
 		irq->hw = false;
 		ret = its_unmap_vlpi(host_irq);
+		WARN_ON_ONCE(ret);
 	}
 
 	raw_spin_unlock_irqrestore(&irq->irq_lock, flags);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


