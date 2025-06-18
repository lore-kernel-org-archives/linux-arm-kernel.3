Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F6BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JanEUXOf1XWVs3kpYfHVyTXFyH+qIidbAMdFV6akegY=; b=WqRF+Bg2OsWFcG1Un1OXOcuMPr
	AUUsesWjbboQF790dCk5HJNBbwrUoA3Iomd0T4VwjNHKmg+mLlVir8JGQtXJK3GaHXDg6DHtNMqDn
	gv4Yv0miWfwhP4wVu81r6++CVuloTL+Zc/N5YxDf5oFRO6cly6LBoOp1ZpbH7dDOLe7llq7BIYJyT
	NZvVvcxY2zmSCd9dZ96Qn1hqWy8KY8a/XKv8jTH9vGfmSnPZ4QIBJ1zoUXpL/PugX9nz8afta6tui
	lTciFccguAgGLnJM3/JdDx3wdGcnn0ByyznVZlJRFJIDKbnyB2vjzR6vVXi4FVg8lsHtyUP7LUEfH
	pn5FKa+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkS8-000000091KC-0ZWo;
	Wed, 18 Jun 2025 04:31:12 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLf-00000008zo1-1qM5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:32 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-748cf01de06so2320543b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220670; x=1750825470; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JanEUXOf1XWVs3kpYfHVyTXFyH+qIidbAMdFV6akegY=;
        b=4ahf+sNhfr64OByZEOZV7MWDNLP960kW4y3QzTWMWIrKyLplgikqY3hm5kA30//Kfa
         HKJdxfyR0knosTimU/hB6OepdG6xDBsGm3Xpy58tP1uB5EBosN3h4sajNYHEwoUa6jv3
         z/fR0vAODc9yCy/GQaU5Gl3GZyhgd9qNR0gGSruJ2Cac3oIyEPJ+xJcebW6f4gZfygDO
         qGHGY8BVITvMsFoOC5JRkePGcvPBB4W0jJdV+scKtyV0CYk+oJI8fqGbBMSXWgpM+87K
         LXfIzWDjhOA+B18MIhulhty/OXhQA7ZKjeWGo/RFtuE2v5FQIFrNBh2wYZIV9o/a56eY
         d9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220670; x=1750825470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JanEUXOf1XWVs3kpYfHVyTXFyH+qIidbAMdFV6akegY=;
        b=XXnR49Ia6S2/5LuZU476hhauYmiO+DCPGtrWRy9FafMd0SfT22GKVAI0PoljQhjhSV
         Xcl8MJ+BoRjly3bbEXe8DK6n9lL2XtPLd7yv3lore1q6s3yVfJSgSXVVnoehk/ByYiWa
         a2kIwnyPbYGBjIKmQj0mfQeuy9Z0HRPin0Q2/lhfz2htT7FqOVZz5I/okIoHAb2lOv9S
         t/1cHqAawVcyQScZhUBLAx2SaXoBGkEajezFqbQD9B8AheWUAI7APDaRtKqeaFT3L3xf
         5vJKSBNB7ar9Az0YCuN1HopsR/Wro+G6wOoRMsNhd3jfdISZQPZCrmvYfgejilo5dD0/
         pbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCURriqImZphBtUxYHt13dxPQ7c0a7wsQB7tgihp93180mjVUkKtEoCl2US+Q4gshzyOkXl424zX3+kbsOVfcM1s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywshcet4pSV+Fi6o3WLGsdkEIbgXyLu8nHD6O5R/b59I31MScAl
	iJwuGkvCd4OyGSRVNORrG5TKx1kwLXm57bePflYTpp65RZE072B6TliPvAgB7L2oR0Ep2dR40ed
	cwdk3ehJNCgHn5GNLq12kMA==
X-Google-Smtp-Source: AGHT+IGhGlpakj0eJizLYc0gxiQ3hQXVWEsMAv964wrGEVgAjsjBPQA9RJtsv4jH/rvULsmo/zU/Pq4mbBOQ1uSF
X-Received: from pfhp23.prod.google.com ([2002:a05:6a00:a17:b0:746:21fd:3f7a])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a06:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-748e1e475a6mr2959042b3a.22.1750220670239;
 Tue, 17 Jun 2025 21:24:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:11 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-3-jthoughton@google.com>
Subject: [PATCH v3 02/15] KVM: arm64: Add "struct kvm_page_fault" to gather
 common fault variables
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
X-CRM114-CacheID: sfid-20250617_212431_480414_BA7886BE 
X-CRM114-Status: GOOD (  20.23  )
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

From: Sean Christopherson <seanjc@google.com>

Introduce "struct kvm_page_fault" and use it in user_mem_abort() in lieu
of a collection of local variables.  Providing "struct kvm_page_fault"
will allow common KVM to provide APIs to take in said structure, e.g. when
preparing memory fault exits.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  9 +++++++++
 arch/arm64/kvm/mmu.c              | 32 +++++++++++++++++--------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 6ce2c51734820..ae83d95d11b74 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -413,6 +413,15 @@ struct kvm_vcpu_fault_info {
 	u64 disr_el1;		/* Deferred [SError] Status Register */
 };
 
+struct kvm_page_fault {
+	const bool exec;
+	const bool write;
+	const bool is_private;
+
+	gfn_t gfn;
+	struct kvm_memory_slot *slot;
+};
+
 /*
  * VNCR() just places the VNCR_capable registers in the enum after
  * __VNCR_START__, and the value (after correction) to be an 8-byte offset
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2942ec92c5a4a..0c209f2e1c7b2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1476,8 +1476,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  bool fault_is_perm)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
-	bool exec_fault, mte_allowed;
+	bool writable, force_pte = false;
+	bool mte_allowed;
 	bool device = false, vfio_allow_any_uc = false;
 	unsigned long mmu_seq;
 	phys_addr_t ipa = fault_ipa;
@@ -1485,7 +1485,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	struct vm_area_struct *vma;
 	short vma_shift;
 	void *memcache;
-	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
 	long vma_pagesize, fault_granule;
@@ -1494,13 +1493,18 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	struct page *page;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 
+	struct kvm_page_fault fault = {
+		.write = kvm_is_write_fault(vcpu),
+		.exec = kvm_vcpu_trap_is_exec_fault(vcpu),
+
+		.slot = memslot,
+	};
+
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
-	write_fault = kvm_is_write_fault(vcpu);
-	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
-	VM_BUG_ON(write_fault && exec_fault);
+	VM_BUG_ON(fault.write && fault.exec);
 
-	if (fault_is_perm && !write_fault && !exec_fault) {
+	if (fault_is_perm && !fault.write && !fault.exec) {
 		kvm_err("Unexpected L2 read permission error\n");
 		return -EFAULT;
 	}
@@ -1516,7 +1520,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * only exception to this is when dirty logging is enabled at runtime
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
-	if (!fault_is_perm || (logging_active && write_fault)) {
+	if (!fault_is_perm || (logging_active && fault.write)) {
 		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
 
 		if (!is_protected_kvm_enabled())
@@ -1614,7 +1618,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		ipa &= ~(vma_pagesize - 1);
 	}
 
-	gfn = ipa >> PAGE_SHIFT;
+	fault.gfn = ipa >> PAGE_SHIFT;
 	mte_allowed = kvm_vma_mte_allowed(vma);
 
 	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
@@ -1633,7 +1637,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
-	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
+	pfn = __kvm_faultin_pfn(memslot, fault.gfn, fault.write ? FOLL_WRITE : 0,
 				&writable, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
@@ -1654,7 +1658,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * change things at the last minute.
 		 */
 		device = true;
-	} else if (logging_active && !write_fault) {
+	} else if (logging_active && !fault.write) {
 		/*
 		 * Only actually map the page as writable if this was a write
 		 * fault.
@@ -1662,7 +1666,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		writable = false;
 	}
 
-	if (exec_fault && device)
+	if (fault.exec && device)
 		return -ENOEXEC;
 
 	/*
@@ -1722,7 +1726,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
-	if (exec_fault)
+	if (fault.exec)
 		prot |= KVM_PGTABLE_PROT_X;
 
 	if (device) {
@@ -1759,7 +1763,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret)
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+		mark_page_dirty_in_slot(kvm, memslot, fault.gfn);
 
 	return ret != -EAGAIN ? ret : 0;
 }
-- 
2.50.0.rc2.692.g299adb8693-goog


