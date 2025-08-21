Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F781CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIYjUyPKKDdCEejXmfDWcQPbYLUJJKvCpdBRdQ8wgkk=; b=Lil31MKV9iUqpS/lyP1yGQwFzM
	1WcsUHYk8+XxXi3Qqwl2NG/Dl8Vs8ulYacMO0MwJEkEJneKo9+Tzs4GvahldLWjrT/boYrARTfgJf
	ZZ7lwpe11IkXLYZ7/hic45Tf8cYost68MffdWFb907q60zYp0l8NzpISUyYOIBFXoLZVX4KaFdm9J
	uSNezv2GYoHc5uXzEpvitcG4fBuHIGjOxePMgMeY3oofaenlMfubVJfw43MtNc6TO1/FEMhso8MrF
	bhJ/UI+n+ZXa+QH8RWgd11fZLZjsblZOeSoUPAlqshuPfjSnJL2O8N8RAMcokY2QWG+C0VbkSfA8m
	AyE3KX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHpr-00000001JQa-21yM;
	Fri, 22 Aug 2025 02:48:59 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCP5-00000000bYZ-2QZO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:00 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-324e41e946eso2676983a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810058; x=1756414858; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rIYjUyPKKDdCEejXmfDWcQPbYLUJJKvCpdBRdQ8wgkk=;
        b=ttaHdyutH8i/Wqf62qe3A7hnBwuZzV2lP1/Ap7SnapCzp/eUeFLLSvzniKbsvjpO8s
         CJoNZ4RQNqMBdi+n/irOxv9wiIL5Gq7gQBhonDGbAdzxrlqbMACblZx8ifjI4AekGvmg
         mH3/qCGOvoIlH4tF9kiVsw8qFAOhwAmbJDootViTnusIJcVTwo/Ecw/gG7eQc9GGYIrf
         DxktJqRb259zz2brpaY3Lig0Ju14V5fMatfpp61Ocr/hXH5TkPcYXE0CI6sPxE9dg9+3
         qpNc/SEo3P0rBPEXMmOB5fLheAOkTFD2sUjlzT1CG1WAp+lhJQ8NyBXHMCwhoDdUZsjl
         XOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810058; x=1756414858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIYjUyPKKDdCEejXmfDWcQPbYLUJJKvCpdBRdQ8wgkk=;
        b=QIYIB6eYQPu38es1hMIFIvzb5PjzTdqDDZgCymKqShBLh1rkSWgYN0Gb9qf8PMJUuK
         T9tffrCJZVEAxJyMpqyYKYrZEi9Izdb2bf6V9FMvQ5Svd0JvmVFuCxiL7FGgESRfDqq0
         ujhHWo4RvlMIX0pZfYFA2O2/CvuXSqCROZ1UGsvMwSyWAQcB+cFZ7iH/bBkYLvApQST2
         xmOUlfMT9bC03x6BfmNOAzLFFgRfG4MXrk4hP1Zbz9yV0bz/UszxwyG55VrVwWSWH+ui
         9fZXtcN/24xWInzYNrdFzh+s4N8ZiJg7BzpzvTXRrqATe1zZZitM9SXHkxstGi0zjsOX
         OarQ==
X-Gm-Message-State: AOJu0YzTsLX5WASxX256Io8czb9wKtFhtVJWO4ziZ3Tue1C8kfQzZoZd
	gLmGAMv8mdjoGeOD3FQvQ2UOEUjhnDzq4jOTsae48LCAMEduCIw3P7ltiUOHqiLNGG4W5XPw5RM
	VywLPdw==
X-Google-Smtp-Source: AGHT+IGevG4sJg+U1oYZiyIkXuxzC5L9OjooNDxBFWaxTZvDjCA0pb211437o2pCDdf6DI+kKvb4PRBSGWk=
X-Received: from pjbrr6.prod.google.com ([2002:a17:90b:2b46:b0:323:247f:7f59])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d610:b0:31f:762c:bc40
 with SMTP id 98e67ed59e1d1-32515e54409mr1117649a91.16.1755810058080; Thu, 21
 Aug 2025 14:00:58 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:33 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-8-seanjc@google.com>
Subject: [RFC PATCH 07/16] KVM: arm64: Pass @fault to fault_supports_stage2_huge_mapping()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140059_617966_87AA5DDB 
X-CRM114-Status: GOOD (  12.72  )
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

Pass the full kvm_page_fault object when querying if a fault supports a
hugepage mapping instead of passing the separate slot+address pair.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 047aba00388c..c6aadd8baa18 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1287,10 +1287,10 @@ static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
 	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
 }
 
-static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
-					       unsigned long hva,
+static bool fault_supports_stage2_huge_mapping(struct kvm_page_fault *fault,
 					       unsigned long map_size)
 {
+	struct kvm_memory_slot *memslot = fault->slot;
 	gpa_t gpa_start;
 	hva_t uaddr_start, uaddr_end;
 	size_t size;
@@ -1348,8 +1348,8 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
 	 * userspace_addr or the base_gfn, as both are equally aligned (per
 	 * the check above) and equally sized.
 	 */
-	return (hva & ~(map_size - 1)) >= uaddr_start &&
-	       (hva & ~(map_size - 1)) + map_size <= uaddr_end;
+	return (fault->hva & ~(map_size - 1)) >= uaddr_start &&
+	       (fault->hva & ~(map_size - 1)) + map_size <= uaddr_end;
 }
 
 /*
@@ -1368,7 +1368,7 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_page_fault *fault)
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PMD_SIZE)) {
+	if (fault_supports_stage2_huge_mapping(fault, PMD_SIZE)) {
 		int sz = get_user_mapping_size(kvm, fault->hva);
 
 		if (sz < 0)
@@ -1547,7 +1547,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PUD_SIZE))
+		if (fault_supports_stage2_huge_mapping(fault, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
@@ -1555,7 +1555,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		vma_shift = PMD_SHIFT;
 		fallthrough;
 	case PMD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PMD_SIZE))
+		if (fault_supports_stage2_huge_mapping(fault, PMD_SIZE))
 			break;
 		fallthrough;
 	case CONT_PTE_SHIFT:
-- 
2.51.0.261.g7ce5a0a67e-goog


