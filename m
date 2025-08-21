Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC94CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raIzGhW7lpJoGFirZ1c9kEw1ZuKCVqeLv2nD/b2/YKU=; b=xQBEshPPstwFd8I99uVAIT3OP7
	bJ646SgaEtLdI1futA2htOZck/cFB3G5OxW33pjvdHJK1/hFXTPyl+QH0XhkmpIixkVO/j3Ogiuk0
	yOHxFx3dlcFatJiBda9s5GauAAoO5kg6btax99IfFSurNTVtJ71QerMJu8jMVrhgfQy3YyTAdt8U/
	w+O7PcM/m3mAHLldpIIykn4uIAey2Cl73GlMsNTIFPutrva1axiHlz+3/Ejpid9ACJ5LEmcEMAbBH
	OihaaVS6tu4vt/n7DyM2PGvxR8MoAZxz81qQUckcji6hKg/GwC7g8QK8Kkph7kCal7MR7NY2Dtx4U
	KvO/9IDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIDQ-00000001M5j-27bO;
	Fri, 22 Aug 2025 03:13:20 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCPK-00000000bgn-0fPF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:15 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-324e6a1a414so2224693a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810073; x=1756414873; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=raIzGhW7lpJoGFirZ1c9kEw1ZuKCVqeLv2nD/b2/YKU=;
        b=owPS7QBAdkMjBmf6h9YQkrQystCgWARWmcbubwXvikrA0I+RL+eTv1FDNtHR54z+Rs
         3fWYub6Ub/yNDKeLMfRyQyD5FQ+c1YU2yB/qyi+VqllxGXJtSkD0N/tRMURZc6r0oNbR
         qFZIis3XSKCyHdhMA7ZnXPnoYkkGQmKME5dZhgcqvfIWK13gBocfStc7DXYwEnpZOWiv
         uByWd6fsfIRfX57y4pzM62CXVq0QM33zZ/gXM111Mc8JDqwiJl0JxDj076EqNebzYRlW
         YnMHuDPgWlwFgCAMR0EJrn5EyJ1NlUbjthUxdsnRThrUZC1aJ2dm290GfsX9PnNYRLmI
         5Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810073; x=1756414873;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raIzGhW7lpJoGFirZ1c9kEw1ZuKCVqeLv2nD/b2/YKU=;
        b=Vh+wFAm2T6+qArCPMf5Vn54ZNOdJJK/FH5Ud2h6gie6GnJv+idCuCmvxqseVW0JQAj
         I4dqGCPj1enhkHgBP+/XzAy8QmtrBO3hxMSR9h4xfuqLZTnZcrEJJrsEsFG9u7PO4RNY
         lF6P0wO3/fpH/m0P/E6qSOWjD96PSXOXSIXf/3m78oeAXs6tXF2ajiqau+xVpK2EVExi
         naDTDnKWCQhNfcBd15HVamDs97cMbFz2PMnNPNnWtGPxHXT1JW3oSkGENdB3jOliMENM
         s8KV1vRcY8c2vIMOIZfWxuGZE7QYS04cJCQkaph+YF0zjJ6Kl0V3EjLEM4N2GXrJHE7S
         Uq8g==
X-Gm-Message-State: AOJu0YzWNkgS4Ccrm7vt4IHnESBaZSullZs2C5KJa9WWHqnJpKNg/vwO
	DNTnx2fAfDqDuWDdADuRQY4J2n4W5tN7jYm1IOUKEcwwdw9l2xMBxHaQa6ud+o7vjHQUJ3rKCUH
	HlQp4IA==
X-Google-Smtp-Source: AGHT+IFblgzDSGtA8EPOlO44N2jRty+RipPpxQzb/XSsK78s9IItTWN33FoV1VAgZIXu+UmzYrewPt9GIfA=
X-Received: from pjgg5.prod.google.com ([2002:a17:90b:57c5:b0:321:76a2:947c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d4e:b0:321:1348:4438
 with SMTP id 98e67ed59e1d1-324eed210damr5152464a91.7.1755810073194; Thu, 21
 Aug 2025 14:01:13 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:42 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-17-seanjc@google.com>
Subject: [RFC PATCH 16/16] KVM: arm64: Don't bother nullifying "vma" in mem
 abort path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140114_196898_DBDBCFBC 
X-CRM114-Status: UNSURE (   9.85  )
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

Now that the local "vma" in kvm_gather_fault_vma_info() will naturally go
out of scope when mmap_lock is dropped, don't bother nullifying the
variable.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ea326d66f027..435582e997ce 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1559,9 +1559,6 @@ static int kvm_gather_fault_vma_info(struct kvm_vcpu *vcpu,
 	fault->vma.vm_flags = vma->vm_flags;
 	fault->vma.is_cacheable = kvm_vma_is_cacheable(vma);
 
-	/* Don't use the VMA after the unlock -- it may have vanished */
-	vma = NULL;
-
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
 	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
-- 
2.51.0.261.g7ce5a0a67e-goog


