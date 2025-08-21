Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399C3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxt6rTMqHrWA9f8ahxcPmdPJmqaCbIUP8K6s+gPHJdY=; b=JNUcc816FaKTTu8wZEYsJsDFtG
	Q6N7jVOwp1I5Zgnf0T6Pt3FtSP1g90/HSE17oy9w8WEuwr5rfH7nKvngd5KrLKI04dCAldoO6rdKn
	94lw/LbXZXce2dO9w9NkyEHYgfvlZIrwC2kn7B5xjgiVoYZasJ8yXVJQQHLZOKQRCp/H7OkR83IDn
	L90pmb+SrD2Fqx28enkWBVHqz0S/dTPNy7lx307FTrg3TKzbPYBAFKcBFMXoxe+XuWjy5hAp5GMpj
	fmTKgJadoniyhimuXENErLHqJ0vZhlxBBQM52L1V7Mt1WTdfNW9EPmW8iWcv4Gbt0GTc/93i29f6w
	o151mV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI8D-00000001LRu-1kvs;
	Fri, 22 Aug 2025 03:07:57 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCPG-00000000bfP-3Pkp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:11 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-76e54a1646aso1567249b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810070; x=1756414870; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fxt6rTMqHrWA9f8ahxcPmdPJmqaCbIUP8K6s+gPHJdY=;
        b=D25ZcgNVpZR5H+CUnwXoYyZB78BmOEp4kLGzKnpphWHe9PCOdgQhrX4zOXxjz1Wtxv
         ALMpyLLCdvLZHFRkgzO+j64zVmHE7NBDydskzCqmPgEyhBB4DdSFA4gsvcNHi092VBWP
         QEu6V0jQYi8BhyJT7zezF1w3sFMypxx9k+5ZaegDXgZByZPDLqUM1yKIMUJNaJiI85Ss
         A1PGIoY3ULRWPHSq3PNNVS3CB/tQtu00Na2QEnd8aNXeXAl79i1CA15Lj/BKQj4DdRdq
         gTjn6PGfp1/TDlubgwHGw2X827kLonlvgXJEwjIjwCGbo9719gOtNLlLvnRd7e23m1Js
         fZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810070; x=1756414870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxt6rTMqHrWA9f8ahxcPmdPJmqaCbIUP8K6s+gPHJdY=;
        b=MzzViGX2aicwjPAKhHBmIajN3UnXIMtSEW9YLKHYhOwiWXHb4nfzghZIrDSBg7ZCp0
         49blD1ias8LqaAfjL8u53lTgGcaUCoYkwyJnFrPPtPrZYWWYWVqKdgCh3DAl69vSFaF+
         /lrCysl19W2bsoa2rWkXfAGafnCkS3NdPUGbys+UuGHk/18jHlYHV5ry9BbH03N6h42w
         xdJSxezbFdgmN4qtFKniT2/9o/DwVxrcaMEl0pSLKOzBzpf8hP3SassXrbRuEXccA0Q9
         VG/+wn1HHtGJPmyL9sra87PCKtxbcV7FLpo8pizlJ2n4fXC7xvZLCn+SBrmU5wRr3Mp1
         9lYQ==
X-Gm-Message-State: AOJu0Yy6hQOekrkZzScj017oEWTX3KFadMo+26AbYfpLCkA0rqsw5WOc
	Vt7WsVizGb8xKdOf3irfkGJnWSthP/hNDa0exraj8tKzK9peibBxZ7jbwJ/myrRLiiF5nBy1CDo
	0vGXQMA==
X-Google-Smtp-Source: AGHT+IFn+EYj/FE0ePzblUKFMdEC+BFGAdYI0PBx7I9mvhQoZZjMBZ5mHJyHtUrO2Tk/q3sQHu7NuwUXWEg=
X-Received: from pfbbd13.prod.google.com ([2002:a05:6a00:278d:b0:76e:8abf:185a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7489:b0:240:130e:d781
 with SMTP id adf61e73a8af0-24340c10ac7mr756815637.17.1755810069751; Thu, 21
 Aug 2025 14:01:09 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:40 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-15-seanjc@google.com>
Subject: [RFC PATCH 14/16] KVM: arm64: Track "forced" information in "struct kvm_page_fault"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140110_851631_A4ECF8E9 
X-CRM114-Status: GOOD (  18.21  )
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

Move the abort handler's local "force_pte" and "s2_force_noncacheable"
variables into "struct kvm_page_fault" in anticipation of moving the
mmap_lock-protected code to a separate helper.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/mmu.c              | 22 +++++++++++-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 6a99f7fa065d..fa52546bf870 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -440,6 +440,9 @@ struct kvm_page_fault {
 	} vma;
 
 	long pagesize;
+
+	bool force_pte;
+	bool s2_force_noncacheable;
 };
 
 /*
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 575a4f9f2583..fec3a6aeabd0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1469,8 +1469,7 @@ static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
 static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	int ret = 0;
-	bool writable, force_pte = false;
-	bool s2_force_noncacheable = false;
+	bool writable;
 	struct kvm *kvm = vcpu->kvm;
 	struct vm_area_struct *vma;
 	void *memcache;
@@ -1526,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	 * memslots.
 	 */
 	if (logging_active) {
-		force_pte = true;
+		fault->force_pte = true;
 		fault->vma.pageshift = PAGE_SHIFT;
 	} else {
 		fault->vma.pageshift = get_vma_page_shift(vma, fault->hva);
@@ -1548,7 +1547,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		fallthrough;
 	case CONT_PTE_SHIFT:
 		fault->vma.pageshift = PAGE_SHIFT;
-		force_pte = true;
+		fault->force_pte = true;
 		fallthrough;
 	case PAGE_SHIFT:
 		break;
@@ -1561,7 +1560,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	if (fault->nested) {
 		unsigned long max_map_size;
 
-		max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
+		max_map_size = fault->force_pte ? PAGE_SIZE : PUD_SIZE;
 
 		WARN_ON_ONCE(fault->ipa != kvm_s2_trans_output(fault->nested));
 
@@ -1581,7 +1580,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
 			max_map_size = PAGE_SIZE;
 
-		force_pte = (max_map_size == PAGE_SIZE);
+		fault->force_pte = (max_map_size == PAGE_SIZE);
 		fault->pagesize = min(fault->pagesize, (long)max_map_size);
 	}
 
@@ -1656,7 +1655,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 			 * In both cases, we don't let transparent_hugepage_adjust()
 			 * change things at the last minute.
 			 */
-			s2_force_noncacheable = true;
+			fault->s2_force_noncacheable = true;
 		}
 	} else if (logging_active && !fault->write) {
 		/*
@@ -1666,7 +1665,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		writable = false;
 	}
 
-	if (fault->exec && s2_force_noncacheable)
+	if (fault->exec && fault->s2_force_noncacheable)
 		return -ENOEXEC;
 
 	/*
@@ -1699,7 +1698,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	 * If we are not forced to use page mapping, check if we are
 	 * backed by a THP and thus use block mapping if possible.
 	 */
-	if (fault->pagesize == PAGE_SIZE && !(force_pte || s2_force_noncacheable)) {
+	if (fault->pagesize == PAGE_SIZE &&
+	    !(fault->force_pte || fault->s2_force_noncacheable)) {
 		if (fault->is_perm && fault->granule > PAGE_SIZE)
 			fault->pagesize = fault->granule;
 		else
@@ -1711,7 +1711,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		}
 	}
 
-	if (!fault->is_perm && !s2_force_noncacheable && kvm_has_mte(kvm)) {
+	if (!fault->is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (fault->vma.vm_flags & VM_MTE_ALLOWED) {
 			sanitise_mte_tags(kvm, fault->pfn, fault->pagesize);
@@ -1727,7 +1727,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	if (fault->exec)
 		prot |= KVM_PGTABLE_PROT_X;
 
-	if (s2_force_noncacheable) {
+	if (fault->s2_force_noncacheable) {
 		if (fault->vma.vm_flags & VM_ALLOW_ANY_UNCACHED)
 			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
 		else
-- 
2.51.0.261.g7ce5a0a67e-goog


