Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30BBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8oMP1EOncIUD9US+9qQ69z324nW43UQ9Vgx7SP4DmY=; b=s2OMj0NxtDLVNjdGKhBXLoVEy2
	zSmJ4GMijzwr32cl+Y7CA8PYySwaiJmsKZNH8E3iU1fwj9hfVQwU7zxSqgh4Xwg1O7UZkE0vRKuVV
	7yklmdOI8L2e4P0yFx25tD4GppORhtnjGB9pgMkI+ZfV4nMuMMe0PLJL/RGkgEgNHKdm1WJa5jqCP
	fXAqP8Gvwlh/8v4MCKzKne1r44QKyijaX/cM+nh9TqBoXX9APUSYRm0IjyRxtoYY2rrcneY6fOEG0
	Qtbi3L9fDmhBgQTGnrUxTZ2/XzHmOadS5B5jbbITFHZXqcMhS6EXaIZJtJc9tQgMSUYJi17NueuDm
	du1ivq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVo8-0000000Bmp4-18jS;
	Thu, 12 Jun 2025 00:28:40 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDx-0000000BX3Q-2P59
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:14 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2eeff19115so270474a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682032; x=1750286832; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I8oMP1EOncIUD9US+9qQ69z324nW43UQ9Vgx7SP4DmY=;
        b=e+qs58zZzYy2yFYNQvKYo6yY8WO00blJ0np6RVO3iuWsFSKBVGQn9k/6oxdX9YFJPF
         eZL0N4S3a3Twx5halcviNB9rXR8k1xLIY9W0gwbYhM02p3mMjEtb7a2U/lYKAnc11vli
         GJ8RwECksMJ9aliP94eTnhqqVpnYulNEvyTi/FqRdCPWZCuUxdPTXsrTYU1CmLsOjsh2
         kl00pqXo+As2n9CD6S+kQBuK14P77iiH6XyiFzo5w2C0Y10WKVZIs6zCqYJ/IuIo/Xyk
         luLnvQGzoOLPQI5NlsBpGWDZzC9w1cEyctZq+mPtG0rLL5E3b4xF5A0xRSUoMiHmr/PM
         DkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682032; x=1750286832;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8oMP1EOncIUD9US+9qQ69z324nW43UQ9Vgx7SP4DmY=;
        b=B0VJpArWIC9njeErP8UM0a9NUhGGswPiP/1arB8aLk16q7cu0spEryDallqdBLStes
         UFZKTrs+eex9QJhXmesFIkkUOupzQnspV5XN2J4RbbPxvkM3sod8dzubt3BCK/grPehG
         DW4lUWX6vQRtlCdGaW16nWgsE4U/4/vjKqXzoAGE9peP6d/r0DP07gdbx4BmyYFWY695
         LC5xys7HGDS4yjs9iAijylY7VJLb8FdzB1DZh0WxEaEL9HujOhDmPILT+hORMRDYR0Of
         eoYTcAodsectuDwJKzJEn/E6gAMDvrshSNY+37B6a0ErioWwHLRbTro0eSxEm1FRdmXj
         f/kQ==
X-Gm-Message-State: AOJu0YyoZsOx48NNdfqWZaeRgWtJQQoJQ+bCI3+DVP8a03/18pnHOPVY
	ssZI9tKN2L6uuTosI3rFBTJbAFRvO4mlrI6ETX6Xxx8rhwHzk4ssZ5/CP38IRC60qKWwxRl2xsk
	+GEp8uw==
X-Google-Smtp-Source: AGHT+IFCw4nm3TFxQYvAdNmh6gnDBKhiV2T9Iv4xzvZMX9NqKTRoM2Z40bqRwgvAKgtWr8chRpb35/3TV8M=
X-Received: from pgn7.prod.google.com ([2002:a63:d47:0:b0:b2e:ce0c:b3fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:728a:b0:1f5:8622:5ed5
 with SMTP id adf61e73a8af0-21f866001b6mr7401056637.3.1749682031934; Wed, 11
 Jun 2025 15:47:11 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:12 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-11-seanjc@google.com>
Subject: [PATCH v3 09/62] KVM: SVM: Drop pointless masking of kernel page pa's
 with AVIC HPA masks
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
X-CRM114-CacheID: sfid-20250611_154713_611781_DFC56315 
X-CRM114-Status: GOOD (  17.10  )
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

Drop AVIC_HPA_MASK and all its users, the mask is just the 4KiB-aligned
maximum theoretical physical address for x86-64 CPUs, as x86-64 is
currently defined (going beyond PA52 would require an entirely new paging
mode, which would arguably create a new, different architecture).

All usage in KVM masks the result of page_to_phys(), which on x86-64 is
guaranteed to be 4KiB aligned and a legal physical address; if either of
those requirements doesn't hold true, KVM has far bigger problems.

Drop masking the avic_backing_page with
AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK for all the same reasons, but
keep the macro even though it's unused in functional code.  It's a
distinct architectural define, and having the definition in software
helps visualize the layout of an entry.  And to be hyper-paranoid about
MAXPA going beyond 52, add a compile-time assert to ensure the kernel's
maximum supported physical address stays in bounds.

The unnecessary masking in avic_init_vmcb() also incorrectly assumes that
SME's C-bit resides between bits 51:11; that holds true for current CPUs,
but isn't required by AMD's architecture:

  In some implementations, the bit used may be a physical address bit

Key word being "may".

Opportunistically use the GENMASK_ULL() version for
AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK, which is far more readable
than a set of repeating Fs.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/svm.h |  4 +---
 arch/x86/kvm/svm/avic.c    | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index 89a666952b01..36f67c69ea66 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -253,7 +253,7 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 #define AVIC_LOGICAL_ID_ENTRY_VALID_MASK		(1 << 31)
 
 #define AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK	GENMASK_ULL(11, 0)
-#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK	(0xFFFFFFFFFFULL << 12)
+#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK	GENMASK_ULL(51, 12)
 #define AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK		(1ULL << 62)
 #define AVIC_PHYSICAL_ID_ENTRY_VALID_MASK		(1ULL << 63)
 #define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK		(0xFFULL)
@@ -288,8 +288,6 @@ enum avic_ipi_failure_cause {
 static_assert((AVIC_MAX_PHYSICAL_ID & AVIC_PHYSICAL_MAX_INDEX_MASK) == AVIC_MAX_PHYSICAL_ID);
 static_assert((X2AVIC_MAX_PHYSICAL_ID & AVIC_PHYSICAL_MAX_INDEX_MASK) == X2AVIC_MAX_PHYSICAL_ID);
 
-#define AVIC_HPA_MASK	~((0xFFFULL << 52) | 0xFFF)
-
 #define SVM_SEV_FEAT_SNP_ACTIVE				BIT(0)
 #define SVM_SEV_FEAT_RESTRICTED_INJECTION		BIT(3)
 #define SVM_SEV_FEAT_ALTERNATE_INJECTION		BIT(4)
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 5344ae76c590..4b882148f2c0 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -241,9 +241,9 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic_logical_id_table_page));
 	phys_addr_t ppa = __sme_set(page_to_phys(kvm_svm->avic_physical_id_table_page));
 
-	vmcb->control.avic_backing_page = bpa & AVIC_HPA_MASK;
-	vmcb->control.avic_logical_id = lpa & AVIC_HPA_MASK;
-	vmcb->control.avic_physical_id = ppa & AVIC_HPA_MASK;
+	vmcb->control.avic_backing_page = bpa;
+	vmcb->control.avic_logical_id = lpa;
+	vmcb->control.avic_physical_id = ppa;
 	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
 
 	if (kvm_apicv_activated(svm->vcpu.kvm))
@@ -301,9 +301,12 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	if (!entry)
 		return -EINVAL;
 
-	new_entry = __sme_set((page_to_phys(svm->avic_backing_page) &
-			      AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK) |
-			      AVIC_PHYSICAL_ID_ENTRY_VALID_MASK);
+	/* Note, fls64() returns the bit position, +1. */
+	BUILD_BUG_ON(__PHYSICAL_MASK_SHIFT >
+		     fls64(AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK));
+
+	new_entry = __sme_set(page_to_phys(svm->avic_backing_page)) |
+		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
 	WRITE_ONCE(*entry, new_entry);
 
 	svm->avic_physical_id_cache = entry;
@@ -903,8 +906,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			enable_remapped_mode = false;
 
 			/* Try to enable guest_mode in IRTE */
-			pi.base = __sme_set(page_to_phys(svm->avic_backing_page) &
-					    AVIC_HPA_MASK);
+			pi.base = __sme_set(page_to_phys(svm->avic_backing_page));
 			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 						     svm->vcpu.vcpu_id);
 			pi.is_guest_mode = true;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


