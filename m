Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10930E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LkXqlJAd4fQvrkyb/GIMYTRcu+OGHQVMPLjSgCJbVo=; b=FLmgyqxSyNY6Cwe2mWsgLbxuma
	Ivax/T+BAO/44Qfmab7/f1NI83bNmv5/ab2xATHZQI+TUT7Z+Cz3vJ3Iiz9s3xL6ttqb0UvW2hL9g
	AS1mQXtMjA4GE013+c0ufIf6B7QGVZ1cS6pF/8lBjdOeHncSVuXa5w5h9DxPEY4Up+0HGFI10Y+hB
	cGKoYvSUMyAJ+A7ZaUgG6qa0ymDPRr+AhW2cyqsTDfoVjLKvAzpnFnR28GSglb54YRy4gDu+GDTnw
	0jGiPoPRY3OLkCcl1DSiaskkqDT8a3Pb2FRMEhsWeYvAWer8po3KoozXfuCCoqYQKR+4RciSq7Li2
	UEZjOsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIv4F-0000000DgbE-2IgN;
	Wed, 04 Dec 2024 19:29:47 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupK-0000000DdiW-3iKT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:23 +0000
Received: by mail-qk1-x749.google.com with SMTP id af79cd13be357-7b677762665so13213985a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339661; x=1733944461; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LkXqlJAd4fQvrkyb/GIMYTRcu+OGHQVMPLjSgCJbVo=;
        b=VCwtdkQ+oujk2Xs4iASlv+04WCwBzbWV8ZAcJJbiGqowmckp0pRinHGb5lytP2ersP
         /Hqi0UIz+wjDPS1pMCBIP/dhs402boW75oMQgg2LqxBC+Bj73ZrPzvNvuD5S0QIfK2Vb
         Gj5vBFm33hQ2L+5XxOkEe1yhB1SRMsRfoRJLGbQnKO+YSUPZvMTGoK7cdO2c5UHzdyhz
         WLc4Ls+0WD2SN8/OE0cOQ3H0DqeKm8sbpNnLoSFw/WiZV6hEV7xkU2SP9L+ajYqJCoSz
         /SdCC23B6b94OhZWUl6DmXoHmG81YZh5EzHJiqt0XoaTAFny8ALm9qsDi8qxpJL71JiI
         eknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339661; x=1733944461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LkXqlJAd4fQvrkyb/GIMYTRcu+OGHQVMPLjSgCJbVo=;
        b=PhjgDVzLx98Uo278h5EPxMKC28ya+Xr/8utW/TJt1kOqV1cwcYPc0eS6BerCMSh317
         qrhSmP4QnNMbmdS1RgmxDHHTMJKG03okU6EHVj8N3/2JJ73JU/oJMSq4dg+P5b8MUygj
         XgLB1gzVPznQ5/Ao3pQGp+0u0I5zxolMxtxJX6tUGIgrjv1EQII3Rp8J7Y7WuLLZN6dD
         XDPmJ/hnL7eeJcjfLVTpURSIYDNhYzxGwd87cEwXncyoMY4hgDTCGffGznsOcGdxoHma
         +IlpIAsQbFhZHrWY8hWCbSEuF2iX7Tx3DJFBCo+DGHTmBsNCUG0KxM4Bxies/6KNv27V
         BjVw==
X-Forwarded-Encrypted: i=1; AJvYcCUFpvdRLvpqapQkKWUUpDjz7ruZhbOwKCzMegKFHY20cAfAsa+vZshEqmFQuEmL0IyEw6iR8eEUoASQFgF1+v9r@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ONKcphmPNB9ZBxqME9mRB47Zealdh7TT5PvjxkDv4O7Pdjhb
	m4LCi8LJBl5PzOoUHuVi5AcCdf95gDNlIyoLiH6NZfEBxmrE/YlbgcjH2bZCRoDtF4fnCFi7Iv+
	GcnYe9t0p2KPENGqb/w==
X-Google-Smtp-Source: AGHT+IG2YC7xA0GwWXk+cMxHq3A6sTNXchADXjRqs7ScJbz/ng/FU66WmJEiNslyAxyIF4C+tDiCnDtGEeEHeuoK
X-Received: from uah9.prod.google.com ([2002:a05:6130:5209:b0:856:f0b0:717])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:40c2:b0:7b6:6b07:e80d with SMTP id af79cd13be357-7b6abbb7350mr835946485a.57.1733339661300;
 Wed, 04 Dec 2024 11:14:21 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:41 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-7-jthoughton@google.com>
Subject: [PATCH v1 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111422_932422_9905F392 
X-CRM114-Status: GOOD (  18.12  )
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

Adhering to the requirements of KVM Userfault:

1. When it is toggled (either on or off), zap the second stage with
   kvm_arch_flush_shadow_memslot(). This is to (1) respect
   userfault-ness and (2) to reconstruct block mappings.
2. While KVM_MEM_USERFAULT is enabled, restrict new second-stage mappings
   to be PAGE_SIZE, just like when dirty logging is enabled.

Signed-off-by: James Houghton <jthoughton@google.com>
---
  I'm not 100% sure if kvm_arch_flush_shadow_memslot() is correct in
  this case (like if the host does not have S2FWB).
---
 arch/arm64/kvm/Kconfig |  1 +
 arch/arm64/kvm/mmu.c   | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..d89b4088b580 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select HAVE_KVM_USERFAULT
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a71fe6f6bd90..53cee0bacb75 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1482,7 +1482,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active) {
+	if (logging_active || kvm_memslot_userfault(memslot)) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1571,6 +1571,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	if (kvm_gfn_userfault(kvm, memslot, gfn)) {
+		kvm_prepare_memory_fault_exit(vcpu, gfn << PAGE_SHIFT,
+					      PAGE_SIZE, write_fault,
+					      exec_fault, false, true);
+		return -EFAULT;
+	}
+
 	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
 				&writable, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
@@ -2062,6 +2069,20 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 changed_flags = (new ? new->flags : 0) ^ (old ? old->flags : 0);
+
+	/*
+	 * If KVM_MEM_USERFAULT changed, drop all the stage-2 mappings so that
+	 * we can (1) respect userfault-ness or (2) create block mappings.
+	 */
+	if ((changed_flags & KVM_MEM_USERFAULT) && change == KVM_MR_FLAGS_ONLY)
+		kvm_arch_flush_shadow_memslot(kvm, old);
+
+	/*
+	 * Nothing left to do if not toggling dirty logging.
+	 */
+	if (!(changed_flags & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
 
 	/*
 	 * At this point memslot has been committed and there is an
-- 
2.47.0.338.g60cca15819-goog


