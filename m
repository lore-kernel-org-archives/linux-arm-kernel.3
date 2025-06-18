Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E744C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Crtc37yj3I5HY0sOOY/Hc9qKBpXKt+15nfqytsnjM48=; b=g6W7wCkmb3XYKmmqg6S8U4BE21
	NaISzQTyb0ffFjWIkORRolJeVjNX1cq+/d9D6CjjVYUwApSxgRYcDAg+mlCGmxjgyyDiTGsUJvg80
	DY8gOE2SkQyAf9DOE7/53uUknqF3hJtG3lpsfbee1Kw6zuZGcvR4CGMWc9+kaKJGoUa9mfnPJhuyB
	U6q2H6o1oVIapxEOBBNO45BoKDv2U+GFly6zqKjl+rpulA1ThawV57vP5BeoUXNwcbxFAtCbc9OBr
	wRG9ocHHdt1wmbHVwmMRYZjCsDNDwDh5VIzFpgWX9ii7OF1FNWUhaUucXbgiQEM/ysZW2aH+d3S6J
	oAMVYxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRldA-000000096zP-443s;
	Wed, 18 Jun 2025 05:46:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLl-00000008zqO-3QFy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:38 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso6134826a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220676; x=1750825476; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Crtc37yj3I5HY0sOOY/Hc9qKBpXKt+15nfqytsnjM48=;
        b=hlbUIAmD1IRtmKnj4LF1TA9U1HxV2FI8nAx+ni/U/4W5T2sfLzYOUvFDbkDFpauZel
         5LrMGcUwtma17XN5RNXr1ilQGFpTSB7bgvFnCX5KEdgaOULp3/GUrTO3lgvOWU/dGmA+
         MNh3sBz/SYTUg9gPeEjf7bCAYbi4HBPxky/lj0TyRtkW5LbYE2uabIDOA0z5k02nrXVX
         eocqujOo2B1RCToFIIZHSHzri/KU9Z+raZh+12cC1u8w7ldhJiIfsMrTeODZW9dlfFxe
         bBRiPePXS/npCopTnQtuH3uSzZ6SYRo1x2dvsOLcu5QbV5Gafltbf+bDucj0kqMhou0o
         IvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220676; x=1750825476;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Crtc37yj3I5HY0sOOY/Hc9qKBpXKt+15nfqytsnjM48=;
        b=cS6Y3QToCGmCik0jwiRjreZM/YGATN3SYbG09sht/B+ucz9/CUd+nvzJRFPBFT701F
         inRYJ10ua7WM2C12jLnlqnTDoff+Zyfwj6yih/RuMIanrM9MJYXjYqWqg5SdVplNNCR1
         1yGoaZj8mI4tX/EZkasPn6IQhxZgsJ6L49hgKgildKcp1WU6BILdhE2lS0Zz1f59dI5F
         GUZL+vhs+RKblnRpf+2Ty7J0Ll62SDROEvfHIy5wZrRsA4Y6UKfkpP3TIMS1+2hGMH3H
         mmX5tCzT9NgNdiUOJiK2lHPX38mLFwq2kkN6oYgUG9eEJHUoA9ZFruhHYQmhm9USS+rP
         rMEA==
X-Forwarded-Encrypted: i=1; AJvYcCUktnFdQTxuqBXh8hJXMx6O8doBSVLGvZlbd+U0MazWPGQApulVXthK4w172g2n+m9czZu0krndLf/srSJaOT+h@lists.infradead.org
X-Gm-Message-State: AOJu0YxFNs1MIUUs2b/Ch/UNfsi7ouEC0qtP44H3MZVZG54E7MyRFC0H
	PLxTS5N9RRRBhpnW13NIC/8kXj9/8aPQAKJXO7pwnNUPhtuKAGgIgbLTdcjSGrvaGhwV0GwK4sv
	5/qlpDgR805ANi2qJmaPi/w==
X-Google-Smtp-Source: AGHT+IECQVYtJtqccD2ckXzkUCRtEGI61f7empdw5CPtw8UB73TqbA6HTmrTRxT/T52yNYKeR/onnUx3D5hsOmVD
X-Received: from pjbsl11.prod.google.com ([2002:a17:90b:2e0b:b0:312:1dae:6bf0])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5245:b0:311:ff02:3fcc with SMTP id 98e67ed59e1d1-313f1c03409mr27710648a91.14.1750220676391;
 Tue, 17 Jun 2025 21:24:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:15 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-7-jthoughton@google.com>
Subject: [PATCH v3 06/15] KVM: arm64: Add support for KVM userfault exits
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212437_850732_1233159A 
X-CRM114-Status: GOOD (  16.36  )
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

To support KVM userfault exits with arm64:

1. Force mappings to be 4K while KVM_MEM_USERFAULT is enabled.
2. Return -EFAULT when kvm_do_userfault() reports that the page is
   userfault (or that reading the bitmap failed).

kvm_arch_commit_memory_region() was written assuming that, for
KVM_MR_FLAGS_ONLY changes, KVM_MEM_LOG_DIRTY_PAGES must be being
toggled. This is no longer the case, so adjust the logic appropriately.

Signed-off-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0c209f2e1c7b2..d75a6685d6842 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1548,7 +1548,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active) {
+	if (logging_active || is_protected_kvm_enabled() ||
+	    kvm_is_userfault_memslot(memslot)) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1637,6 +1638,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	if (kvm_do_userfault(vcpu, &fault))
+		return -EFAULT;
+
 	pfn = __kvm_faultin_pfn(memslot, fault.gfn, fault.write ? FOLL_WRITE : 0,
 				&writable, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
@@ -2134,15 +2138,19 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
-	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 old_flags = old ? old->flags : 0;
+	u32 new_flags = new ? new->flags : 0;
+
+	/* Nothing to do if not toggling dirty logging. */
+	if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
 
 	/*
 	 * At this point memslot has been committed and there is an
 	 * allocated dirty_bitmap[], dirty pages will be tracked while the
 	 * memory slot is write protected.
 	 */
-	if (log_dirty_pages) {
-
+	if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
 		if (change == KVM_MR_DELETE)
 			return;
 
-- 
2.50.0.rc2.692.g299adb8693-goog


