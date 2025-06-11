Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313D7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUvsQ8mDIzQb0qFFdXVmPhQyIfkBQRy6OI+aTTyokEg=; b=JmhEndu3KeRNNz5MIMslDkmRIJ
	LK9LHMCdDGYGLk9HHS9lJClhecvlcpM+jUTJbq737zXDy7VDhuor4X0qAEfiDXZMlFxv4lxcCtTG7
	odXtdsrNv7ZY4f4cx0MVHD4BGKeTMSGZpqYgvWfQKuuavl4mb5JrhIrAeSAV180Sd7iw5RwibN2HS
	ZODSBmNIMlZQYJvYys2KxY0lqsv+jNJ3cUf6Hb6hLzOLoVEbVEVCY/Z3acUs9MFVZ4ygiE+UHPhNI
	VqVNKDEC4qIELEioN4vCnDAh/f31pf1xxrEQ61pz0d9cNo3ZHj8hb28QKx2oFXetYWxdYavBuLfVg
	ZZDlKyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVuQ-0000000BnPl-2lgV;
	Thu, 12 Jun 2025 00:35:10 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUE4-0000000BX8m-11mE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-740270e168aso253534b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682039; x=1750286839; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oUvsQ8mDIzQb0qFFdXVmPhQyIfkBQRy6OI+aTTyokEg=;
        b=SbtiRQemfMfFXO5avST+V+8tnXrodDEvRiMpYCzFFex1QKBCAvhjTsN08mFdhmVnyz
         VgaratfxsHwB93VYuYGV9WJsBWhjNewjdgqjqkZXbra0eXJMdR3vUu1WEmNZG6M7yX62
         APvTCJIXggObSDaAHkH3lR6gb70khm9F1A1kexepyXksVPoANfZHFAHik++5A8taw5ek
         A4+p7lyizO4W19BR0Qo5q7IVUXkcE933/lV0Koy5MjkxrPth+VX5k63yJnCHAoD3Bw1w
         w/iPTBPU+FmOrCr9NUfrqgNncUkiG0kArU2vHdjg7c7HelN4j/M/fKF79joXEf9EY1Oo
         qf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682039; x=1750286839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUvsQ8mDIzQb0qFFdXVmPhQyIfkBQRy6OI+aTTyokEg=;
        b=flVvh+OMz4RRwf3rHJrBcDABh8F29z0m4UN1/FVdxmjJt4lvSz2iJw/jzpTdaAxWCQ
         RwMCRA3bHm1bg86o59Ewk0nOIhoXRHKxWT2mdW3SflMlW+7Jw3wmkVgWJ+5HbwKkaUgb
         gn6D91hsDpjGvgeX9lfI4yp7VNt47XsUCukWi8gimAwweh66dGBFWUC9M1PaqbXSOhIS
         QE/PSXc7M14gaJcpMrmnW51CO6hmYQLs2Z/1RXjKiqy9ELFuzpmoIVww78aPjS5tIlFU
         mgizYGiuCsWr+sEAJc2SA2yTqAOBEIDOxERUiYB6CD//mRvhKvtVTX0NXHpKWxBP7cFe
         V5cg==
X-Gm-Message-State: AOJu0Yzy8XxCu3E76L6Kmk5ik9tSc9KrPfIFPS0oPRFx1YJZ6cOhMukJ
	DcwdOzeoiHFVI+W2Mjrm/hLK6OwnXc2FQB9ioCcs+e5dM6TojwAACXlZj9P2xfKNsbVWEucIgy3
	HfRDu3A==
X-Google-Smtp-Source: AGHT+IEfPx6THB86jTUP6dJfz6pw9nwRImiQrl8t3HHDUWJ7TfKep9MrKXl6SwXip961tO69ZHuJKVDD+j4=
X-Received: from pfbfn21.prod.google.com ([2002:a05:6a00:2fd5:b0:746:270f:79c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a4:b0:748:31ed:ba8a
 with SMTP id d2e1a72fcca58-7486cbbf515mr6176704b3a.15.1749682038641; Wed, 11
 Jun 2025 15:47:18 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:16 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-15-seanjc@google.com>
Subject: [PATCH v3 13/62] KVM: SVM: Drop redundant check in AVIC code on ID
 during vCPU creation
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
X-CRM114-CacheID: sfid-20250611_154720_298413_95933F68 
X-CRM114-Status: GOOD (  16.79  )
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

Drop avic_get_physical_id_entry()'s compatibility check on the incoming
ID, as its sole caller, avic_init_backing_page(), performs the exact same
check.  Drop avic_get_physical_id_entry() entirely as the only remaining
functionality is getting the address of the Physical ID table, and
accessing the array without an immediate bounds check is kludgy.

Opportunistically add a compile-time assertion to ensure the vcpu_id can't
result in a bounds overflow, e.g. if KVM (really) messed up a maximum
physical ID #define, as well as run-time assertions so that a NULL pointer
dereference is morphed into a safer WARN().

No functional change intended.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index f0a74b102c57..948bab48083b 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -256,26 +256,12 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 		avic_deactivate_vmcb(svm);
 }
 
-static u64 *avic_get_physical_id_entry(struct kvm_vcpu *vcpu,
-				       unsigned int index)
-{
-	u64 *avic_physical_id_table;
-	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
-
-	if ((!x2avic_enabled && index > AVIC_MAX_PHYSICAL_ID) ||
-	    (index > X2AVIC_MAX_PHYSICAL_ID))
-		return NULL;
-
-	avic_physical_id_table = page_address(kvm_svm->avic_physical_id_table_page);
-
-	return &avic_physical_id_table[index];
-}
-
 static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 {
-	u64 *entry, new_entry;
-	int id = vcpu->vcpu_id;
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
+	u32 id = vcpu->vcpu_id;
+	u64 *table, new_entry;
 
 	/*
 	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
@@ -291,6 +277,9 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 		return 0;
 	}
 
+	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE ||
+		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE);
+
 	if (WARN_ON_ONCE(!vcpu->arch.apic->regs))
 		return -EINVAL;
 
@@ -309,9 +298,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	}
 
 	/* Setting AVIC backing page address in the phy APIC ID table */
-	entry = avic_get_physical_id_entry(vcpu, id);
-	if (!entry)
-		return -EINVAL;
+	table = page_address(kvm_svm->avic_physical_id_table_page);
 
 	/* Note, fls64() returns the bit position, +1. */
 	BUILD_BUG_ON(__PHYSICAL_MASK_SHIFT >
@@ -319,9 +306,9 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 
 	new_entry = avic_get_backing_page_address(svm) |
 		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
-	WRITE_ONCE(*entry, new_entry);
+	WRITE_ONCE(table[id], new_entry);
 
-	svm->avic_physical_id_cache = entry;
+	svm->avic_physical_id_cache = &table[id];
 
 	return 0;
 }
@@ -1004,6 +991,9 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (WARN_ON(h_physical_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK))
 		return;
 
+	if (WARN_ON_ONCE(!svm->avic_physical_id_cache))
+		return;
+
 	/*
 	 * No need to update anything if the vCPU is blocking, i.e. if the vCPU
 	 * is being scheduled in after being preempted.  The CPU entries in the
@@ -1044,6 +1034,9 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 
 	lockdep_assert_preemption_disabled();
 
+	if (WARN_ON_ONCE(!svm->avic_physical_id_cache))
+		return;
+
 	/*
 	 * Note, reading the Physical ID entry outside of ir_list_lock is safe
 	 * as only the pCPU that has loaded (or is loading) the vCPU is allowed
-- 
2.50.0.rc1.591.g9c95f17f64-goog


