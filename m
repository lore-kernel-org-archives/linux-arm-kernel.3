Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A637EC71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBV8ONm1woYvPckJRib1WYeJ0sSeMlwaWEnLKoaPZXQ=; b=dYEDiShsesXScT6WdRZBThQaMB
	D/mC9s/98A/pw4MNl/PMONDiZKd8VrPs2AmWWe0laEXgSFqAAB/ftoupuKe/aisTgC383AfVcSCFE
	4notQ8ANhBbNyT9y0PyC0y6R+U19NLbSx23U3CWbMmrf6bo/S3U3l4Om1e6a0+ZQs8yK9X1S0aW4b
	9DM0ifQkUBP6EfSRVexRs+kYBVJ4XhbLQrUgFsBMp0qxV9OSZOETxzhnFtgVYwoZzSNNvKAVLUdAu
	X1h69/QLGPJYoXG1TxyJoiqwRK9KG24IYNTbz+SXJTDsB/+2yzBVQY2wF7Eq0x/S2REEkgvImTUI/
	Dd768OiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVqD-0000000Bn23-40n6;
	Thu, 12 Jun 2025 00:30:49 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDz-0000000BX4t-00Cj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:16 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so301960a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682034; x=1750286834; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vBV8ONm1woYvPckJRib1WYeJ0sSeMlwaWEnLKoaPZXQ=;
        b=3QXlSUVexdPT9HG+ZH7N36ZRLmLhSr20EWn+OBlok6CO7SkJ+I54j+zscrUUhhhESx
         0WTaIJwlF5W92j0iEBW9XU6Egrxeqo1K2op6yEsdhoL156wYksQCAOFQfagylzhtMCTb
         pJB8GzQ2N44g6ESYcoO9P+vN6bcKGJe6PI3OHW3tL4pUbVpSwDXvWaBrMLOJn99fi4Nb
         pQaJEsuB6aLn1L3BrETFhp0RmjvTvM1yUppyQGw8BCIzM0yP9UbmMAY+xDLFYqXkqYwQ
         v8Wh9j8ahriaogy0NsHMxHtHgJC5jlumzsP/8BqibFlweI6s4n88/j7+8ykVgKvcrz8R
         Czvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682034; x=1750286834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBV8ONm1woYvPckJRib1WYeJ0sSeMlwaWEnLKoaPZXQ=;
        b=r8YO3zMjUxP9K7kq3HRqF5CxlBtLClhbvCOE3fd3U/WoJwKurdB7n5BKhrjzD+LNs3
         iif5hxD8mT0YyaytxgjMdQX7aPHTIYBjbkZjomfwFbW2J7LjhbbuOy7oIfIgoHqkvMl0
         MmLf8NLTForYTsLv7HHFaDxJEWrIHv01HRYb1NGEXKDUNLars9DNRvx9MgEBtCAberhW
         QDdI0MdQpIggwXQEj383XGVSkDZxUY9DxAZ8/PsHmw1dmfUy3AC7taoSaxrRHetoBhFL
         XjNS23EHiyI/UuakZ7DVDM09KOFnClRHLH7Dd1zKNdOQbjHBxq3F/U25X5BPF5mig2Um
         i5qg==
X-Gm-Message-State: AOJu0Yw3s0KuELUXaO7jKSYtUNGcLwd07jRHvmu6olxn/q1zeZnnKQue
	OkL0QPjxniYpr2w0gkHPHLx+Tc6GWUs8f2X+R9VJMb0gN3kxGSVM1EfNpAhUeOzryudb/ac/qAb
	Y0dIw2A==
X-Google-Smtp-Source: AGHT+IEPFYmZzXUCGlwdowyqWkn5bPnHZM+aDnI6sRBuhesrGFICkRbpeSKEZTLooo10gbnXC/Ab4llRnXs=
X-Received: from pjbsv3.prod.google.com ([2002:a17:90b:5383:b0:311:6040:2c7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d4e:b0:311:c1ec:7d0a
 with SMTP id 98e67ed59e1d1-313c08d253fmr1028886a91.25.1749682033852; Wed, 11
 Jun 2025 15:47:13 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:13 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-12-seanjc@google.com>
Subject: [PATCH v3 10/62] KVM: SVM: Add helper to deduplicate code for getting
 AVIC backing page
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
X-CRM114-CacheID: sfid-20250611_154715_036746_30D788DC 
X-CRM114-Status: GOOD (  12.69  )
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

Add a helper to get the physical address of the AVIC backing page, both
to deduplicate code and to prepare for getting the address directly from
apic->regs, at which point it won't be all that obvious that the address
in question is what SVM calls the AVIC backing page.

No functional change intended.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 4b882148f2c0..c36f7db9252e 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -234,14 +234,18 @@ int avic_vm_init(struct kvm *kvm)
 	return err;
 }
 
+static phys_addr_t avic_get_backing_page_address(struct vcpu_svm *svm)
+{
+	return __sme_set(page_to_phys(svm->avic_backing_page));
+}
+
 void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
-	phys_addr_t bpa = __sme_set(page_to_phys(svm->avic_backing_page));
 	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic_logical_id_table_page));
 	phys_addr_t ppa = __sme_set(page_to_phys(kvm_svm->avic_physical_id_table_page));
 
-	vmcb->control.avic_backing_page = bpa;
+	vmcb->control.avic_backing_page = avic_get_backing_page_address(svm);
 	vmcb->control.avic_logical_id = lpa;
 	vmcb->control.avic_physical_id = ppa;
 	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
@@ -305,7 +309,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	BUILD_BUG_ON(__PHYSICAL_MASK_SHIFT >
 		     fls64(AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK));
 
-	new_entry = __sme_set(page_to_phys(svm->avic_backing_page)) |
+	new_entry = avic_get_backing_page_address(svm) |
 		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
 	WRITE_ONCE(*entry, new_entry);
 
@@ -845,7 +849,7 @@ get_pi_vcpu_info(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
 	pr_debug("SVM: %s: use GA mode for irq %u\n", __func__,
 		 irq.vector);
 	*svm = to_svm(vcpu);
-	vcpu_info->pi_desc_addr = __sme_set(page_to_phys((*svm)->avic_backing_page));
+	vcpu_info->pi_desc_addr = avic_get_backing_page_address(*svm);
 	vcpu_info->vector = irq.vector;
 
 	return 0;
@@ -906,7 +910,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			enable_remapped_mode = false;
 
 			/* Try to enable guest_mode in IRTE */
-			pi.base = __sme_set(page_to_phys(svm->avic_backing_page));
+			pi.base = avic_get_backing_page_address(svm);
 			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 						     svm->vcpu.vcpu_id);
 			pi.is_guest_mode = true;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


