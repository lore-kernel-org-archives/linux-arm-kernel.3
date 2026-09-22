Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C844C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOKAAp8+OItHea6211ysyzU6E4IDtXCLElD0UjeYReI=; b=tZvqTguqhe/5qI8mGetevOPU8e
	RhHK0d/RtE7+6i+gAu27M9y3wclC9JoG7KitRX7Ygk4YgE+T/oYguURUMkc+hId3RcYB9t8kunGI7
	IR5vfYsbdToIH1dNLEtKlhtoYheNuKCV/1yJpsfLynqQLdNqBVr2bDuPJldrt6sWEBt8xn8gLRsVT
	ruLMbTaYnEqWvml1S0dggVlTmEmhEeCwK9TEvpTrTP9IB8GyxkYNfuZlcqfUEuY8O8IXMIG7ZiFFs
	EEbZNmblpoQDY8DsUrN3lbIUSjOA/4B2J/UaQ3EPFaJgjFvmonxpw3247xMex8jnJ/KbILAKFEapA
	xcFsXO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Eg-00000005R2J-3zyg;
	Tue, 22 Sep 2026 13:08:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Ec-00000005Qzr-2Qib
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oOKAAp8+OItHea6211ysyzU6E4IDtXCLElD0UjeYReI=; b=HeF1EU9bWZ8dzRGPDTZHnq5Cns
	pW7VfCkD3CPFvIXrOyFIexKoi2fBzB8hpbw0Qv2bOvgZLIOFUTS1DlCD+Errc5vH94BcPigRxPFRj
	+l70oShuI4eSnm7a6L0I22VwFr+p783+q4ic/F0DsZckvm4qx3Yrf2bzV1Udm7RDSZCYhlOnDfcHw
	cNz6HOX06GOJLaKwhS/H7gkGHH4QcteUDbvbczR7RZ0P6LXXFJWYsmNoWOSDn9Q+AlwC8kVvolatN
	L/smuCAQktLAKAQSqWDRkepmOg3FDDT1YZfgO4CjtnoXNF5J2OWqeepDC0jABTNz9ZIWXy5sHavOS
	LWJMAMwQ==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90EZ-0000000DbC1-0rTa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:33 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so30616885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082509; x=1790687309; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOKAAp8+OItHea6211ysyzU6E4IDtXCLElD0UjeYReI=;
        b=MAWJpNPn7lkoX27s4hmSMi+LVC+HBxVOfTqFeJ969MUSksX434tXnF1Wkc4B2BZew3
         Addtvuz0nDFrNTnrLjDzm18MzOJ3temXBYBEpuiiNesDnINYLl2QCxfn+HmORRmtx6e7
         PsZI3ZEf4vSpsEroYdI3x5aiAorAqXoqQvPZnM8ndpeKf1PPB7XdbcmUs4qkgYCXJAMX
         ByZXn4ql37J8FxqCLDM3KkvqQvKLajaAARag1gvTcIcaACkPhvFJbxIupaQLR92yxYXP
         bg7mfeWvxEJ8FWcFa8bJIyPyJhyPsXz/yS1bY8NRCRz10lXm5cI/lGE9H1i1t/SMnJR9
         iOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082509; x=1790687309;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOKAAp8+OItHea6211ysyzU6E4IDtXCLElD0UjeYReI=;
        b=MmNFxjtTvrysbzIx8SuLzIP0ZdzI+7flN9PGSetdU8kxf+gmGw7cGtgv9I++zXxXIH
         tX0CNKtGC5/Md1NWlZ4hlWy9EIRV6q4REUEYitky4NkYBAbqSeoPuRGUkYlZvzHo8E4B
         DnxtXIX+h5bZu7q2ESaFhtEV9qaiGn3kAL+LeEVdYlvxALdSkOv1y4+ZCuLwkJzfLCVC
         o/kgnTrrZvXtr1OuA2E++mGlDFXmKASAbPjEuMzgKRSJJgO72ZAOnnEXbywFs2Ev7UXQ
         PaRrk+x6LWPUOwgez6AozPbZmQiOvKEIyQrDgTIrXqOXo5LrznIxv3dryfP+Ms6ueAsh
         MdSg==
X-Forwarded-Encrypted: i=1; AKwUvBxzVCuxmRfIghfkfE6j651zdmIcVM6IgP1hYbZePK1CZdNdaRT0OW6CBUCIaTJMV+y9ynEurCm++ChE+A0OJ43D@lists.infradead.org
X-Gm-Message-State: AFuF++l45xigG10qylZZmU7OUiBWMpHktpGr2l/o3qSJXJYzzNy4YE2R
	a+GtM1J9DkKa92Zw359jZ6vdb9bVjtdHf4VfpkVOBsPaiulAOqAmc+Upalsk9mNYJK7jRXmAZt2
	fHdA9HPmBEICitkLFVBrSEQ==
X-Received: from wmbf23.prod.google.com ([2002:a05:600c:5957:b0:49d:6bb2:d0f4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a14:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49fc574be1dmr194770765e9.27.1790082509065;
 Tue, 22 Sep 2026 06:08:29 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:18 +0100
In-Reply-To: <20260922130821.1666713-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-4-vdonnefort@google.com>
Subject: [PATCH v1 3/6] KVM: arm64: Move pkvm_mem_abort()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_140831_426035_A0702C78 
X-CRM114-Status: GOOD (  18.54  )
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

Move pkvm_mem_abort() below kvm_s2_fault_get_vma_info() so it can
resolve stage-2 fault VMA metadata without forward declarations.

No functional change intended.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c | 138 +++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9dfaf4f277b5..242f63066252 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1706,75 +1706,6 @@ struct kvm_s2_fault_vma_info {
 	bool		map_non_cacheable;
 };
 
-static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
-{
-	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
-	struct kvm_vcpu *vcpu = s2fd->vcpu;
-	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
-	struct mm_struct *mm = current->mm;
-	struct kvm *kvm = vcpu->kvm;
-	void *hyp_memcache;
-	struct page *page;
-	int ret;
-
-	hyp_memcache = get_mmu_memcache(vcpu);
-	ret = topup_mmu_memcache(vcpu, hyp_memcache);
-	if (ret)
-		return -ENOMEM;
-
-	ret = account_locked_vm(mm, 1, true);
-	if (ret)
-		return ret;
-
-	mmap_read_lock(mm);
-	ret = pin_user_pages(s2fd->hva, 1, flags, &page);
-	mmap_read_unlock(mm);
-
-	if (ret == -EHWPOISON) {
-		kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
-		ret = 0;
-		goto dec_account;
-	} else if (ret != 1) {
-		ret = -EFAULT;
-		goto dec_account;
-	} else if (!folio_test_swapbacked(page_folio(page))) {
-		/*
-		 * We really can't deal with page-cache pages returned by GUP
-		 * because (a) we may trigger writeback of a page for which we
-		 * no longer have access and (b) page_mkclean() won't find the
-		 * stage-2 mapping in the rmap so we can get out-of-whack with
-		 * the filesystem when marking the page dirty during unpinning
-		 * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
-		 * without asking ext4 first")).
-		 *
-		 * Ideally we'd just restrict ourselves to anonymous pages, but
-		 * we also want to allow memfd (i.e. shmem) pages, so check for
-		 * pages backed by swap in the knowledge that the GUP pin will
-		 * prevent try_to_unmap() from succeeding.
-		 */
-		ret = -EIO;
-		goto unpin;
-	}
-
-	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
-				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
-				      hyp_memcache, 0);
-	write_unlock(&kvm->mmu_lock);
-	if (ret) {
-		if (ret == -EAGAIN)
-			ret = 0;
-		goto unpin;
-	}
-
-	return 0;
-unpin:
-	unpin_user_pages(&page, 1);
-dec_account:
-	account_locked_vm(mm, 1, false);
-	return ret;
-}
-
 static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 				     struct kvm_s2_fault_vma_info *s2vi,
 				     struct vm_area_struct *vma)
@@ -2235,6 +2166,75 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
+	struct kvm_vcpu *vcpu = s2fd->vcpu;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct mm_struct *mm = current->mm;
+	struct kvm *kvm = vcpu->kvm;
+	void *hyp_memcache;
+	struct page *page;
+	int ret;
+
+	hyp_memcache = get_mmu_memcache(vcpu);
+	ret = topup_mmu_memcache(vcpu, hyp_memcache);
+	if (ret)
+		return -ENOMEM;
+
+	ret = account_locked_vm(mm, 1, true);
+	if (ret)
+		return ret;
+
+	mmap_read_lock(mm);
+	ret = pin_user_pages(s2fd->hva, 1, flags, &page);
+	mmap_read_unlock(mm);
+
+	if (ret == -EHWPOISON) {
+		kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
+		ret = 0;
+		goto dec_account;
+	} else if (ret != 1) {
+		ret = -EFAULT;
+		goto dec_account;
+	} else if (!folio_test_swapbacked(page_folio(page))) {
+		/*
+		 * We really can't deal with page-cache pages returned by GUP
+		 * because (a) we may trigger writeback of a page for which we
+		 * no longer have access and (b) page_mkclean() won't find the
+		 * stage-2 mapping in the rmap so we can get out-of-whack with
+		 * the filesystem when marking the page dirty during unpinning
+		 * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
+		 * without asking ext4 first")).
+		 *
+		 * Ideally we'd just restrict ourselves to anonymous pages, but
+		 * we also want to allow memfd (i.e. shmem) pages, so check for
+		 * pages backed by swap in the knowledge that the GUP pin will
+		 * prevent try_to_unmap() from succeeding.
+		 */
+		ret = -EIO;
+		goto unpin;
+	}
+
+	write_lock(&kvm->mmu_lock);
+	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
+				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
+				      hyp_memcache, 0);
+	write_unlock(&kvm->mmu_lock);
+	if (ret) {
+		if (ret == -EAGAIN)
+			ret = 0;
+		goto unpin;
+	}
+
+	return 0;
+unpin:
+	unpin_user_pages(&page, 1);
+dec_account:
+	account_locked_vm(mm, 1, false);
+	return ret;
+}
+
 /**
  * kvm_handle_guest_abort - handles all 2nd stage aborts
  * @vcpu:	the VCPU pointer
-- 
2.55.0.1082.g2b9226bbc0-goog


