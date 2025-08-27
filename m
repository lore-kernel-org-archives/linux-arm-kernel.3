Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2619CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Mnbd4Q5k7JD2kPdF6Eij8SGcex3kyAoVM00VR9ktf4=; b=1JAIls8xwRvdmvSGlUSwj8rAhf
	o4ZhKY5fzdsuGHCKSG308L5ABJkYe32TJzeFBV6aTn9xQxmiQ8yaA0cX6qcfbflAwg1OpXgEs3Y8K
	Fg7bSPVVUphZsc6VVFT/GoO9dAvrnobY9e9pDO242ckXn1y7koyw4+6DQsIQhU8jrCgv6o3WA83qW
	6WDmz/+P4IJnNy1AircWHq1fkhIEGt65PEfXv2nyvK5JcBLqAR6cZIz/EO9mDdNh+g29Zf2KO+jrN
	/UBEMG0asePc7JRxDqrWO/zWj2E9mlvcPyhZBDFKkcc0FF/46adY3Esm4UZfVkh2HEk4rNDr+ox+C
	lNaOWpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1T-0000000FCMg-21dE;
	Wed, 27 Aug 2025 11:08:59 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDG1-0000000F2Zy-3GPD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:19:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b0b46bbso29957925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289996; x=1756894796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Mnbd4Q5k7JD2kPdF6Eij8SGcex3kyAoVM00VR9ktf4=;
        b=t8BAcfYGnb/qTfZoRBxb2/4wUHI+Mg8oRxl57LRblQ4TViqupWDtvTNdguUa7yfp91
         OHgKLys3S5CdQOeV/AaMknTsnSEdCWYkKb8QyaPa4N6IQGFL4reBB3gdEIHPWXEqbZoV
         y9BYSlyVC3OpYI07/0cYuC0SsSTlbQ68cSoEyOSq0EUp1luOkwHg6OXG4qEsJmE6I4a2
         rg2qW3dIATCOpVtU+wzRyKS9K3xv/ZEo3j0FqOInDpNJq8IUN9jhsw2rxhz9WYcEJiuq
         V98OLF+Q5lH4eXteLgsYayW8ZdBvyPz87Lf+pPRljH2qAklqK+gMSuB8ZZaiSkfzq94G
         sTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289996; x=1756894796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Mnbd4Q5k7JD2kPdF6Eij8SGcex3kyAoVM00VR9ktf4=;
        b=q7Pe3ebX2D+ciUGhD1oJTEkqFD8c4/CoHwYFk8hAR1DWuRjKn2k7cK2BjsPAe6l32s
         ZWp+eUNEYmAIG2UZ3YpIU9FhUdmqSN2sO9Mh8EQSRE6ptUweUB4fAuZ+NHIQcD2wCZN3
         ljgcyU9/iU7HSRxflcK/Cl1LwOb8x+EiLHIJD72+KqJYnEjcVIVH8L/rr/np9oHAO5VM
         goPoyKeKMH5veD3st14ayFI/toE3yTpYIYjWkAq0m6EvM1EpeL08wBDvsEk+fpvrpUo0
         a+K3Vc69XUPY5DemlCS1Y4cJsQimHIe/xMoE4e3uhtLjZJyQvpXQdSAg6al1Yq4Ia7Mn
         y2pw==
X-Forwarded-Encrypted: i=1; AJvYcCXl19XEjZTnRAm93Xs893zJN7mec2fmtGWsMtAO8+8md3yelLO7x1RWiVZl5MazlAHWCrh9Xou9m5ITOo1UlhU4@lists.infradead.org
X-Gm-Message-State: AOJu0YzysFWU3czFpx7vNNoWjosWTby+VuVMTQDZx95BFCFFz2gxvoSy
	L/jQ91iAjFqMz6HjdfBmgGxLeZ6eCHzqSWiSEGSghW92fEcntsKhf+sZZw1EVR83O85xiC3K/Nd
	K1g==
X-Google-Smtp-Source: AGHT+IGa2OXp31RIOkeWltDfubFfhgbApuPcgBbAFrQZ9t2QvmsER073iwlg1cHEBx+MH0iIIjmq5lmmXg==
X-Received: from wmsz17.prod.google.com ([2002:a05:600c:c171:b0:459:10dd:2e55])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f86:b0:459:db80:c29f
 with SMTP id 5b1f17b1804b1-45b5178e84amr152274095e9.1.1756289995668; Wed, 27
 Aug 2025 03:19:55 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:44 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-5-tabba@google.com>
Subject: [PATCH v3 4/9] KVM: arm64: Clarify comments to distinguish pKVM mode
 from protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031957_817625_55B9B94E 
X-CRM114-Status: GOOD (  21.24  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The hypervisor code for protected KVM contains comments that are
imprecise and at times flat-out wrong. They often refer to a "protected
VM" in contexts where the code or data structure applies to _any_ VM
managed by the hypervisor when pKVM is enabled.

For instance, the 'vm_table' holds handles for all VMs known to the
hypervisor, not exclusively for those that are configured as protected.
This inaccurate terminology can make the code scope harder to understand
for future (and current) developers.

Clarify the comments throughout the pKVM hypervisor code to make a clear
distinction between the pKVM feature itself (i.e., "protected mode") and
the VMs that are specifically configured to be protected. This involves
replacing ambiguous uses of "protected VM" with more accurate phrasing.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index ce31d3b73603..4540324b5657 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -29,7 +29,7 @@ struct pkvm_hyp_vcpu {
 };
 
 /*
- * Holds the relevant data for running a protected vm.
+ * Holds the relevant data for running a vm in protected mode.
  */
 struct pkvm_hyp_vm {
 	struct kvm kvm;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6198c1d27b5b..abe173406c88 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -23,8 +23,8 @@ unsigned int kvm_arm_vmid_bits;
 unsigned int kvm_host_sve_max_vl;
 
 /*
- * The currently loaded hyp vCPU for each physical CPU. Used only when
- * protected KVM is enabled, but for both protected and non-protected VMs.
+ * The currently loaded hyp vCPU for each physical CPU. Used in protected mode
+ * for both protected and non-protected VMs.
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
@@ -135,7 +135,7 @@ static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 
-	/* Protected KVM does not support AArch32 guests. */
+	/* No AArch32 support for protected guests. */
 	if (kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL0, AARCH32) ||
 	    kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL1, AARCH32))
 		return -EINVAL;
@@ -210,8 +210,8 @@ static pkvm_handle_t idx_to_vm_handle(unsigned int idx)
 DEFINE_HYP_SPINLOCK(vm_table_lock);
 
 /*
- * The table of VM entries for protected VMs in hyp.
- * Allocated at hyp initialization and setup.
+ * A table that tracks all VMs in protected mode.
+ * Allocated during hyp initialization and setup.
  */
 static struct pkvm_hyp_vm **vm_table;
 
@@ -495,7 +495,7 @@ static int find_free_vm_table_entry(struct kvm *host_kvm)
 /*
  * Allocate a VM table entry and insert a pointer to the new vm.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
@@ -594,10 +594,8 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
 }
 
 /*
- * Initialize the hypervisor copy of the protected VM state using the
- * memory donated by the host.
- *
- * Unmaps the donated memory from the host at stage 2.
+ * Initialize the hypervisor copy of the VM state using host-donated memory.
+ * Unmap the donated memory from the host at stage 2.
  *
  * host_kvm: A pointer to the host's struct kvm.
  * vm_hva: The host va of the area being donated for the VM state.
@@ -606,7 +604,7 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
  *	    the VM. Must be page aligned. Its size is implied by the VM's
  *	    VTCR.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
@@ -668,10 +666,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 }
 
 /*
- * Initialize the hypervisor copy of the protected vCPU state using the
- * memory donated by the host.
+ * Initialize the hypervisor copy of the vCPU state using host-donated memory.
  *
- * handle: The handle for the protected vm.
+ * handle: The hypervisor handle for the vm.
  * host_vcpu: A pointer to the corresponding host vcpu.
  * vcpu_hva: The host va of the area being donated for the vcpu state.
  *	     Must be page aligned. The size of the area must be equal to
-- 
2.51.0.261.g7ce5a0a67e-goog


