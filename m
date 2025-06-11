Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D651AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uk2iCAGJzrguXHDElw3kCcpBtr7DWJxGiIVAHEgt7PU=; b=xqQtKIKbYkCGfdgIRusBuWjv8a
	CmIQ1AOdmTQq4VBxIHO7B9TjP2QGg76a8LDdZuk0ySsS//sqZ0uH+cbmMTUd1/D1o0ulyf4E/0+pK
	j1Jh/UL0o0aeI9gXn5rfxf57abzsEfqXmAqzmy2+VhkJmPSMfnJIQqZQB3a4t32ervzdrL9znDB/A
	FX1jEsaioQBnF9VKqB6m8fO3OOboE6GCRI+FntvEapsVmk2fucLVok0GgLawysQIkk4mkHr87J0ms
	1KUImVqddJsd4Ah4Rt91cUh70RVcZOU+7mMl2gnpv6PkxzgRTBJRctcwAkQNbI/R2iyLWz6vSMF0I
	aVt+LHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVsK-0000000BnD1-30WI;
	Thu, 12 Jun 2025 00:33:00 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUE0-0000000BX5y-3Hnj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:17 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747a9ef52a4so487235b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682035; x=1750286835; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Uk2iCAGJzrguXHDElw3kCcpBtr7DWJxGiIVAHEgt7PU=;
        b=WqotKNmBOS438tKrAf4CRq6Bx7j9JXDq12H8/I9+U1BeP+dYWaxSPLkytenmw/bzpi
         knBQKyob011t96krrskj+ep99hC4R9mvD6WdzdtAKxSzTLfg5/RISp0isP6bavyUCsY2
         oODSMIQF29JgAwhIYLmeO6rjH45jzV0M9pItdqsvZgW+8fKFIZC8HCjGMCEESqR1Iw35
         YETHNWpc8EhlRTz6QdUqI+AmOSf5iKTWZBsIJLZ+JBfvIn4KUevVddiYV2YfyCtiZk//
         hsVtx7DwzZbFJ1AWlaf3Y0ncsal4FefOu9pm0pqMa0dS27C6HCBpZhPmZQEQSfrLhm84
         W0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682035; x=1750286835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uk2iCAGJzrguXHDElw3kCcpBtr7DWJxGiIVAHEgt7PU=;
        b=iYqM5lXU0raLCjBIcJMOJRFnIE1FJ1/+xKc2pUkrs75/QV09fum13cW4sZopr/gk0B
         Q8+CdPHDRenjaMOWCmZGvgcegYIZbfNI5NPl6KcP4svZRLOr8Ejbk58uwMp9ssaTqZNR
         mF0OWO0GhP4fVO8/GtYFYRCn/PTDoUzWCnQ06AJYhH7RrvGoiMu/SEGrltwuF42AUcsy
         VIYBVGT72nBl7VkGnsFGdKEIQnJzo7N3Zos1bK4HN6sYhCKLEUsKNEr5GN3ZDkrF5VyT
         RjzHvXHnj9lGqwJwCTymXqsmUzjKAYqEXggDBUWF03C5NUlbydzuOmWx53x1HXHB2WD+
         r1uw==
X-Gm-Message-State: AOJu0Yz9yD973h1Wc3CURm+my3SXsiMyRtjOhXPTixkN9btIOQ015JKw
	WhCcVnQ7LsDfpLtvztmMEjBZOrUh0irUY6RVkiEnBssLfHC9VO7jCsjhlHF199DaPYOQo7cwjvL
	3/EpfLw==
X-Google-Smtp-Source: AGHT+IGox2X2Zreqz4euwsJYQpeNVHu/PrMeM6P+22mIkRw9tS6EPJEXitiClHg3UaYo284wvAOiHfeC7Dw=
X-Received: from pfbfa12.prod.google.com ([2002:a05:6a00:2d0c:b0:742:a99a:ec52])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b95:b0:73e:598:7e5b
 with SMTP id d2e1a72fcca58-7487c207d5emr1537775b3a.1.1749682035598; Wed, 11
 Jun 2025 15:47:15 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:14 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-13-seanjc@google.com>
Subject: [PATCH v3 11/62] KVM: SVM: Drop vcpu_svm's pointless
 avic_backing_page field
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
X-CRM114-CacheID: sfid-20250611_154716_822464_5E747000 
X-CRM114-Status: GOOD (  18.01  )
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

Drop vcpu_svm's avic_backing_page pointer and instead grab the physical
address of KVM's vAPIC page directly from the source.  Getting a physical
address from a kernel virtual address is not an expensive operation, and
getting the physical address from a struct page is *more* expensive for
CONFIG_SPARSEMEM=y kernels.  Regardless, none of the paths that consume
the address are hot paths, i.e. shaving cycles is not a priority.

Eliminating the "cache" means KVM doesn't have to worry about the cache
being invalid, which will simplify a future fix when dealing with vCPU IDs
that are too big.

WARN if KVM attempts to allocate a vCPU's AVIC backing page without an
in-kernel local APIC.  avic_init_vcpu() bails early if the APIC is not
in-kernel, and KVM disallows enabling an in-kernel APIC after vCPUs have
been created, i.e. it should be impossible to reach
avic_init_backing_page() without the vAPIC being allocated.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 6 ++----
 arch/x86/kvm/svm/svm.h  | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index c36f7db9252e..ab228872a19b 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -236,7 +236,7 @@ int avic_vm_init(struct kvm *kvm)
 
 static phys_addr_t avic_get_backing_page_address(struct vcpu_svm *svm)
 {
-	return __sme_set(page_to_phys(svm->avic_backing_page));
+	return __sme_set(__pa(svm->vcpu.arch.apic->regs));
 }
 
 void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
@@ -281,7 +281,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	    (id > X2AVIC_MAX_PHYSICAL_ID))
 		return -EINVAL;
 
-	if (!vcpu->arch.apic->regs)
+	if (WARN_ON_ONCE(!vcpu->arch.apic->regs))
 		return -EINVAL;
 
 	if (kvm_apicv_activated(vcpu->kvm)) {
@@ -298,8 +298,6 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	svm->avic_backing_page = virt_to_page(vcpu->arch.apic->regs);
-
 	/* Setting AVIC backing page address in the phy APIC ID table */
 	entry = avic_get_physical_id_entry(vcpu, id);
 	if (!entry)
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index cc27877d69ae..1585288200f4 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -306,7 +306,6 @@ struct vcpu_svm {
 
 	u32 ldr_reg;
 	u32 dfr_reg;
-	struct page *avic_backing_page;
 	u64 *avic_physical_id_cache;
 
 	/*
-- 
2.50.0.rc1.591.g9c95f17f64-goog


