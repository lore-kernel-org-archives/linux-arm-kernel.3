Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AA7CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AynODOx7TIbccej4ZjLdZ9RTKEuSncfsehCPn6XLS1g=; b=PGb0yMh7XGgLD7OeZ0YM1wXm8X
	qRiTOeQRxyeoXBL+2Ug2UigfUzlDgChd6uJP4hGGhM4oxq9vyjLAyur/rklpkCyD+mS2iXkVbtSe4
	7jGWWUfaRrpGER5VcI4egrJ2RCPjbrVYcG+uLVQemaJlXS56f7nTO8GzQhE5Vd0xEVf9ZeAWBgENp
	udRdEkz2R5JxpfFtUVtoZ4Wn8iXv6NyRboNzhdZONSZJhG4PMSp7c6aDSsxqgXvzz+xE2NUf9eavP
	La8QM0MXhO2j2JHOyUdAOAxp+h7O6qMADJw8M1wUXSlvGsyfT8cL9MctOxIr1GuiErZptZTioPko9
	s/r52jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHxf-00000001KAG-3dk6;
	Fri, 22 Aug 2025 02:57:03 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCPA-00000000bbx-0tb1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:05 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32515e8e4cbso579626a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810063; x=1756414863; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AynODOx7TIbccej4ZjLdZ9RTKEuSncfsehCPn6XLS1g=;
        b=aXd2zVC3SBAYX90gktvIljE0DpOjTH50BTUQcCnSA4u0ybxQvQA9DPauv39hKgB81P
         0DJJqVKyMFjiFzBffjwEjG3h8X8O5tF5wnT29avWMiwK8+7+z8xkU9Jy0zVhqXBwA8v0
         73+X/C5epxfTmHwUq/qmv0BWDuRMljxceduy3Itt3d/0rnGpuF8X1Q3slYyxrL5+wr2q
         ecB82uZpRYB34CC/VNN3ggI8guTr0vvEz8wXYnD/v/IYkhLWqnk77sUOrgVVs5RIIgOJ
         C/fWBbBikabA2Yg7wiLja+9/9te2gD+yNdLeYM5g5gz08Wwa4JJh9/jWhKe8slxTk7RH
         G3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810063; x=1756414863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AynODOx7TIbccej4ZjLdZ9RTKEuSncfsehCPn6XLS1g=;
        b=xJ0UGmde5ypitmw5w0u+8SQWsY2ahNEeEbQGfI+rx8VW8gRUSvXinxyI9URrUyFAMZ
         pv27AmBh2s+ipuTmtsQha33Goukzj4whN3cdrx/Ke2kck7nvesPzqdyZuMhuJyMp+aKI
         fzZM9bmW7C7hcNu6/hB+m1g3mFW3Y27Dl0PNKXZ9dlEpptADWA2WQb4Qu6hVC3BCt63J
         1y0VTa6+ZjLw819JqBYr9r6OLTx2l53iBzw12SkZNKazfrLnXOp96lpT60u1J+XU4veS
         2k3zcX5Ebdlu1jBjbxi05zYoxFDRy7LBU/sTfxNpjKvn0/PIyuo3odEjaZUlSwuXA4cf
         el5Q==
X-Gm-Message-State: AOJu0YzuJmpZIJwy0D0844/CFnBaRvEI2jOjRpxry1G5swwoHwEGO+aQ
	/E2vUNT/SzC4VitK8jP2msuUicfGOIIK+816xoFPqhTlLRJFUVLZcZJGY9iHlBVv5zvV0//ApXy
	zpimpUw==
X-Google-Smtp-Source: AGHT+IEVYwl5YEkw1vqENiDixKFNtOSSF5og6sdGONTLhDTmarsazTWsy/GXacXJvdeMD+BKnVg4vh8e0tk=
X-Received: from pjbsd14.prod.google.com ([2002:a17:90b:514e:b0:321:78e7:57fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b4c:b0:31e:d929:5ca5
 with SMTP id 98e67ed59e1d1-32515e2230emr1041388a91.1.1755810063041; Thu, 21
 Aug 2025 14:01:03 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:36 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-11-seanjc@google.com>
Subject: [RFC PATCH 10/16] KVM: arm64: Drop local vfio_allow_any_uc, use
 vm_flags snapshot
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140104_252948_7C163418 
X-CRM114-Status: GOOD (  11.97  )
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

Drop user_mem_abort()'s local vfio_allow_any_uc variable and instead use
the vm_flags snapshot.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 10c73494d505..e1375296940b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1476,7 +1476,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	int ret = 0;
 	bool writable, force_pte = false;
 	bool mte_allowed, is_vma_cacheable;
-	bool s2_force_noncacheable = false, vfio_allow_any_uc = false;
+	bool s2_force_noncacheable = false;
 	unsigned long mmu_seq;
 	struct kvm *kvm = vcpu->kvm;
 	struct vm_area_struct *vma;
@@ -1608,8 +1608,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	fault->gfn = fault->ipa >> PAGE_SHIFT;
 	mte_allowed = kvm_vma_mte_allowed(vma);
 
-	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
-
 	vm_flags = vma->vm_flags;
 
 	is_vma_cacheable = kvm_vma_is_cacheable(vma);
@@ -1741,7 +1739,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		prot |= KVM_PGTABLE_PROT_X;
 
 	if (s2_force_noncacheable) {
-		if (vfio_allow_any_uc)
+		if (vm_flags & VM_ALLOW_ANY_UNCACHED)
 			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
 		else
 			prot |= KVM_PGTABLE_PROT_DEVICE;
-- 
2.51.0.261.g7ce5a0a67e-goog


