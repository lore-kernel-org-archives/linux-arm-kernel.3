Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFCFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWygzttyaDGZ8i1sz2PNqa3rZtIdDV4A7Q8dk96hn1w=; b=uncRe2UsivhsHsOGfp7zWoNxLu
	xU6tpYLvcjqzw5yi75wu426EOjgE/Sc5oga6muAEYdJvKj/NXItJXQbH/e0T1Rqaxbm7sgRZ/GkNm
	fqzZua+kZLxpZMTogiW4W44/V5cz+d+OFTyKggs1xq/fcJgDGZAlaQuRwbYbgJ85QdWGeSb+FUEwV
	cKu6VBPd0YT8Le9byB0ix2y4xbxtYRXqj3Ca7swVZShabdwysyzR8emPJqhylLHZHIT7eI2ltxmvZ
	GLID//EFKS25wFn/T+hlwHT/5lDM+7JFMr3kq7dC1SG9BN0TK8ZInIY1z8acJhUuLLPRY3pv+zoMo
	gacaEqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zs-0000000EVIR-13qn;
	Mon, 04 May 2026 22:42:40 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zp-0000000EVGy-3iTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:42:38 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-836d0184333so1572076b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934556; x=1778539356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWygzttyaDGZ8i1sz2PNqa3rZtIdDV4A7Q8dk96hn1w=;
        b=bA0iE5I8ts2YXTEj0EPpnyuHBBKM/DcW131xQVfec/ZrWt83CIHcQ5MQZ1xjbWD5D2
         6u/0kJv2yAxltDW/JxoYWMkQQCCQ3491zXUf8CdU7JnNdMHPiIpfJM15SCtEpV8UnXx8
         0PzRlyHyK3HHkBk1kYCgnAJ5nmp9Dg/jXcFTqcSw4mEu2g5baPKncaE3Vv1KGef6fDm3
         B/kPMkdJQLgcxFYzT1ttBpiu9VhnTZjkMdT1wMLwAze1iEELULu0DuuuLUntGpA7gEhr
         hLUs2LnomShlkxuQ1lBHkbk7du3XYbGk0zeMEFJ5i6YUCxrZF+OB1vs8V0PGzO7sMWrT
         ZgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934556; x=1778539356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWygzttyaDGZ8i1sz2PNqa3rZtIdDV4A7Q8dk96hn1w=;
        b=iVGlkpWg69aXQ4rNDlZDwOm9A3jjc7U2pYp/YtkX7X4L8nQpUDwKUrbehOXxJbt5sv
         mwaCAmVdaew1EzyeZ1/p256BX+JBACTB9idoLLgFvk21wWFYjqd124dGjGa3Nn0E3KT3
         h08ekh4BGh/UCNZL4TbUH3LfR/p22W4Z/mBxjv5V8u73qcaaQxfr/ODkeW2ieE/tZiL1
         OncFjNb90cN84FD+tqOIl7uvoAvRaCOgGzbJkXhGuL773gzZlrmTxS3479RBGtezmBQ2
         VxapLc2OOn0aJ71gGb7hvR7+V7MnjWctlI8d61GS7t/CZ9Da9BFMNCxfAnlu3w0kEEt7
         cQHg==
X-Forwarded-Encrypted: i=1; AFNElJ85m7xXAV0Sq/lJm8/P+P+bGMItUkBHtDw0i+yUNmpN9wbgCPLTl6m0dXiWllF42xABucju9CuASm70Js3WZcNc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyazp+tkTfx54XBY/nfIGR9IYN9FOrBq6HpDtLcBi5oPIRyhaj1
	OQXyK70fx1jRTrxURgAPLDKLtKST46i2o6MOSuw68EgIGzswwtWkWgC1eYIK4cMa9VOV1GevHEX
	xvmP2qsxYl2yJVas4tZDzLQ==
X-Received: from pfbhh11.prod.google.com ([2002:a05:6a00:868b:b0:82f:a959:4a7f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:181b:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8352d037329mr12663141b3a.5.1777934555976;
 Mon, 04 May 2026 15:42:35 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:08 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-2-jthoughton@google.com>
Subject: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_154237_932594_84534A2B 
X-CRM114-Status: GOOD (  16.42  )
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

kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
concurrently in the event that the KVM's `mm` is __mmput() at the
same time that last reference to the KVM is being dropped.

T1              T2
KVM_CREATE_VM
                Get VM file from T1
close VM
exit_mm()       close VM

T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
    with only the KVM srcu read lock held.

T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
    kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
    again, with only the KVM srcu read lock held.

This leads to a potential double-free of
kvm->arch.kvm_mmu_free_memory_cache and now with NV
kvm->arch.nested_mmus.

Cc: stable@vger.kernel.org
Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is enabled")
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/kvm_mmu.h |  1 +
 arch/arm64/kvm/mmu.c             | 23 +++++++++++++++++++----
 arch/arm64/kvm/nested.c          |  4 +++-
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 01e9c72d6aa7..30d5c24fcebb 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -178,6 +178,7 @@ void stage2_unmap_vm(struct kvm *kvm);
 int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
 void kvm_uninit_stage2_mmu(struct kvm *kvm);
 void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
+void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
 int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 			  phys_addr_t pa, unsigned long size, bool writable);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..4bab407d43bb 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1021,7 +1021,9 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 
 void kvm_uninit_stage2_mmu(struct kvm *kvm)
 {
-	kvm_free_stage2_pgd(&kvm->arch.mmu);
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
 	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
 }
 
@@ -1095,12 +1097,14 @@ void stage2_unmap_vm(struct kvm *kvm)
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
-void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
+static void __kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu, bool locked)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct kvm_pgtable *pgt = NULL;
 
-	write_lock(&kvm->mmu_lock);
+	if (!locked)
+		write_lock(&kvm->mmu_lock);
+
 	pgt = mmu->pgt;
 	if (pgt) {
 		mmu->pgd_phys = 0;
@@ -1111,7 +1115,8 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
 		kvm_init_nested_s2_mmu(mmu);
 
-	write_unlock(&kvm->mmu_lock);
+	if (!locked)
+		write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
 		kvm_stage2_destroy(pgt);
@@ -1119,6 +1124,16 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	}
 }
 
+void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
+{
+	__kvm_free_stage2_pgd(mmu, false);
+}
+
+void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu)
+{
+	__kvm_free_stage2_pgd(mmu, true);
+}
+
 static void hyp_mc_free_fn(void *addr, void *mc)
 {
 	struct kvm_hyp_memcache *memcache = mc;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 883b6c1008fb..977598bff5e6 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
 	int i;
 
+	guard(write_lock)(&kvm->mmu_lock);
+
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
-			kvm_free_stage2_pgd(mmu);
+			kvm_free_stage2_pgd_locked(mmu);
 	}
 	kvfree(kvm->arch.nested_mmus);
 	kvm->arch.nested_mmus = NULL;
-- 
2.54.0.545.g6539524ca2-goog


