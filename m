Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A3CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nw5kiI6YvAO2RXGdtpyjseVagbE32KnshmO9YLBiZhk=; b=JWaE190enfFpC26pZm70f+alnN
	cPtJq6mCC4CTZ9hgPXCgTjALlJQ2uLZ/oaI0GuZkzFaDqAtH0zMXCRSMIp4QcUYK5tFsfaVcdGi0F
	8a0kmfvt1B6br7Su6p7ySedFl0N/hDGcXVu2vtWvZ/H6M3mHz9a50C1Ca8X6E7Q68h483pxdatWZD
	9ndWzNPA2xnZaVN58J2oA8/Rz9Yj9XboL82jJj8+DxGTC77brO0tXQuyBh4tLpKMbcpLkwg2MF49Z
	XTxQdwvz/fRhjYvjM92x7qC/2QTXCH1oKjM+Lse42MDUxqIJfZszRLZ6bB3e7SWsCQwLxblFpgVU6
	2ncuwfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHv5-00000001Jve-0RN7;
	Fri, 22 Aug 2025 02:54:23 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCP8-00000000baM-1iB9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:04 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-76e7ef21d52so2894720b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810061; x=1756414861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nw5kiI6YvAO2RXGdtpyjseVagbE32KnshmO9YLBiZhk=;
        b=tgV3jCKjH254/MjS1d2jBXgDkz81vdMzf1Owt+84vhbTl8lWkl8u9MOMzdje6BBglr
         2arJm1Ok5PI/c4uWThxfSpjYCnE94Rr/H5MSY3reNdk/DCOKcHu54h6h+OCjjB7jKcXU
         +K2DkYC0OsEO6UcgolG+fl+w1Uy9iX4MhRBzOscOopck4rGyZbn2tIFUkd9I4YWekLdK
         mU7Ob97/uCIOy74XD1W0uAURqiW9dBd/afoxzEYI+7T+tZRS9QYtnqMzqTVLsr3EwxXE
         JDLCoOkRbxAyumMUvXGnjAm4WiR2g/BTVl2gNqr6s5Hm2mYF8I7WQk7NkJ0ZOmn7XOkc
         RfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810061; x=1756414861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nw5kiI6YvAO2RXGdtpyjseVagbE32KnshmO9YLBiZhk=;
        b=pQvFaKrdyXv02ck7SVQtbeXJ+JMtUI0itJ0Og5wmH+agqhLsaTaPWSN6Ntw30/E8U/
         3s6VocIsWJAwRZjOIA7tRjuMRkhotRoHwCxRCJE+oNVWqvPVgYkw0qT+YBeUUL8WtAJO
         OWGuV+ZnAftEOrpvxURL0BsXMkQ2LDLdZ2y3qPPDOFrgHtpSDl8Z9TPVvkebnGh/U/hm
         OplBOY1GZfiVrGN45D9n5iV5PyxWdv7Rngt8PqSfSclOW13Cb6nHnMVEjbdq6kn8OO47
         ILUmJvoHuAN4MM3NkgLNsQUdxEtChXLaw1WK26PGHNI5kL+ZeJB18MZlAlgD+x+JZjO6
         BR5w==
X-Gm-Message-State: AOJu0YxMiD/xb3c/BZiB3AFXIKce7EU+zZjNTLVSwD9EZU2uvAzImLiJ
	ibxzCynJquFYTxiT1hV0/naq31uE4Z+beras87qxwjwcJI8659l7HNI+ZyMpe8qiGe2EtscVuNr
	1nxf10g==
X-Google-Smtp-Source: AGHT+IGle6xFEs66cx8IStkT7ygYTzBQ/CVc9BMQ/qOuDjmd3FaQf765ZcadOYjVlZz3dCJkQZna0ErFQAI=
X-Received: from pgww17.prod.google.com ([2002:a05:6a02:2c91:b0:b42:189a:ccf8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1582:b0:240:9126:2bde
 with SMTP id adf61e73a8af0-24340d5e4cemr792496637.46.1755810061454; Thu, 21
 Aug 2025 14:01:01 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:35 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-10-seanjc@google.com>
Subject: [RFC PATCH 09/16] KVM: arm64: Track perm fault granule in "struct kvm_page_fault"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140102_472318_8601D94E 
X-CRM114-Status: GOOD (  16.67  )
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

Add permission fault granule information to "struct kvm_page_fault", to
help capture that the granule is a property of the fault, and to make the
information readily available, e.g. without needing to be explicitly
passed if it's needed by a helper.

Opportunistically drop kvm_vcpu_trap_get_perm_fault_granule() and simply
grab the granule from the passed-in ESR.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  9 ---------
 arch/arm64/include/asm/kvm_host.h    |  1 +
 arch/arm64/kvm/mmu.c                 | 13 ++++++-------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 8065f54927cb..93e7a0bad0fb 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -449,15 +449,6 @@ bool kvm_vcpu_trap_is_translation_fault(const struct kvm_vcpu *vcpu)
 	return esr_fsc_is_translation_fault(kvm_vcpu_get_esr(vcpu));
 }
 
-static inline
-u64 kvm_vcpu_trap_get_perm_fault_granule(const struct kvm_vcpu *vcpu)
-{
-	unsigned long esr = kvm_vcpu_get_esr(vcpu);
-
-	BUG_ON(!esr_fsc_is_permission_fault(esr));
-	return esr_fsc_perm_fault_granule(esr);
-}
-
 static __always_inline bool kvm_vcpu_abt_issea(const struct kvm_vcpu *vcpu)
 {
 	switch (kvm_vcpu_trap_get_fault(vcpu)) {
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4623cbc1edf4..ec6473007fb9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -418,6 +418,7 @@ struct kvm_page_fault {
 	const bool exec;
 	const bool write;
 	const bool is_perm;
+	const u64  granule;
 
 	phys_addr_t fault_ipa; /* The address we faulted on */
 	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c6aadd8baa18..10c73494d505 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1483,14 +1483,12 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	short vma_shift;
 	void *memcache;
 	bool logging_active = memslot_is_logging(fault->slot);
-	long vma_pagesize, fault_granule;
+	long vma_pagesize;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	vm_flags_t vm_flags;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 
-	if (fault->is_perm)
-		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
 	VM_BUG_ON(fault->write && fault->exec);
 
 	if (fault->is_perm && !fault->write && !fault->exec) {
@@ -1715,8 +1713,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	 * backed by a THP and thus use block mapping if possible.
 	 */
 	if (vma_pagesize == PAGE_SIZE && !(force_pte || s2_force_noncacheable)) {
-		if (fault->is_perm && fault_granule > PAGE_SIZE)
-			vma_pagesize = fault_granule;
+		if (fault->is_perm && fault->granule > PAGE_SIZE)
+			vma_pagesize = fault->granule;
 		else
 			vma_pagesize = transparent_hugepage_adjust(kvm, fault);
 
@@ -1754,10 +1752,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
-	 * permissions only if vma_pagesize equals fault_granule. Otherwise,
+	 * permissions only if vma_pagesize equals fault->granule. Otherwise,
 	 * kvm_pgtable_stage2_map() should be called to change block size.
 	 */
-	if (fault->is_perm && vma_pagesize == fault_granule) {
+	if (fault->is_perm && vma_pagesize == fault->granule) {
 		/*
 		 * Drop the SW bits in favour of those stored in the
 		 * PTE, which will be preserved.
@@ -1806,6 +1804,7 @@ static int __kvm_handle_guest_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa
 		.write = kvm_is_write_fault(vcpu),
 		.exec  = kvm_vcpu_trap_is_exec_fault(vcpu),
 		.is_perm = esr_fsc_is_permission_fault(esr),
+		.granule = esr_fsc_is_permission_fault(esr) ? esr_fsc_perm_fault_granule(esr) : 0,
 	};
 	struct kvm_s2_trans nested_trans;
 	bool writable;
-- 
2.51.0.261.g7ce5a0a67e-goog


