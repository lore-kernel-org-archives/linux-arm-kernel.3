Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144E3C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUMLMkfrYG7ovAWGgH8OISX4nHJaEyCyIq32R+fyFGQ=; b=45b3c813lTfLfPlXxFiBVcEU5D
	/RaRwoeUcE0jKZ1GtpKHfoIZT5iRiGl/h9xfLlv+FnAeXPtwm/efsTgUWEhVHwULIGel9zJRvMMpX
	in/Iul7lBYc3efCdvGm6aY5T0ZOxZ2YfMej8Zin/VXfU2UUb/4akJ8mlds/92x4fP9kbWSOFGpZkj
	HiaUf+QrXMjU803sVuPHa4h7Zf8z+vTz6cwmJDOPWtqgLDVqzUIg821lGVouN9+dzeVML2Rtxeh3l
	NoaS7w26e6EWsEwriHDMQlOxTS1taRdYxK4obhAG05/MSOa7t1/epS64PkDA1QBFoGGAu1bYcDzGy
	jHZDd0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84t-00000000Htm-02su;
	Mon, 28 Sep 2026 09:55:19 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84o-00000000Hqr-1ClG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:55:16 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a0023f2b97so4531295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790589312; x=1791194112; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUMLMkfrYG7ovAWGgH8OISX4nHJaEyCyIq32R+fyFGQ=;
        b=EjuLlLEP04rBQrAR2UsFepsv64M7JlJzO9Jm6J2HdrgbzrJAC/6aBv+sPFJFhiyAu0
         4/cvoPeYCM/fzsjsUiPFbXIr0S5ppxLuQzb3EZwqXL4/qeiPdOO9gpww1NCsM8ipTMtP
         yupYT4WGpnmj+WoW9NQtATwjeiUoKMnhliGaf8e129soM1r/z9FBfrPmcRGCGQHJcdSD
         mv1ekDmeDTZ7Ws3xefEoTHM3Sl2mvHIGkbddP2b3lq3q4oQbqQnBqcpuYEBxiaoMZHWJ
         z8Xb6ig/vre8DejZyvLyz3En7H/ornFA69R6lqS5R7qKi4c9lQwun88G6et/0/CPdaEA
         z/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589312; x=1791194112;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUMLMkfrYG7ovAWGgH8OISX4nHJaEyCyIq32R+fyFGQ=;
        b=I3DdU0Kn9lbt3+Wk5JJmQ5KddT5QRxJCGuZrXhwrbwcvI4hJ6ZXmeX0s1vrmjM1uRq
         k79htyvEPzuhbp/sKcc9O6saarFCR9Sm0ugpu9XII66KazEgQRYvZnqlFbGdwPLLqjo5
         EyAECtpwHSfWMWQxosywipfvopJIJEylGMF3uW3JLDuGrS8F7H14i1VkZp95K5OAL4L+
         tcjRaIeURxBst/7QFsybV0cgxoaztBksOUDQodeVvOgLc8Zwjprs1zctdB/oW3U+74nS
         7IVlBGYqrXwR1QgtiyDPVgClmzBT0gW9LQk2L3NuZYDKBGpjVexNfodUxDoVfNynS+/D
         N5FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs9Q36JLvSb1f89H4/u1ylneXER7lKJ1koCq+YdlX9EdFvtdTo+NHIrNX9DmpjcmjmpuPVpR5Z/piDfATDOnDD@lists.infradead.org
X-Gm-Message-State: AFuF++l8AtVuW3Mlw7KHDxO7ilXNpc1eBs9RaTlWC5PUZc383tk8iYGo
	fTvVImJZxMsWCcJaxHv12q9xw34l+oz30Qtf/5HqEILm0ydLGZ3PaeNgUahHYow1nFbMTGRoRMI
	N5W2mR81j6hDr2I0Yq36EUg==
X-Received: from wmdv19.prod.google.com ([2002:a05:600c:12d3:b0:49f:e401:6ca4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr163475965e9.5.1790589311187;
 Mon, 28 Sep 2026 02:55:11 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:54:53 +0100
In-Reply-To: <20260928095454.3255918-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260928095454.3255918-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928095454.3255918-5-vdonnefort@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Use kvm_s2_fault_vma_info in pkvm_mem_abort()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_025514_352936_AFC325EC 
X-CRM114-Status: GOOD (  20.22  )
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

To paraphrase Marc in commit 08f97454b7fa ("KVM: arm64: Fix protected
mode handling of pages larger than 4kB"), pkvm_pgtable_stage2_map()
assumes the address passed as a parameter is aligned to the size of the
intended mapping, while HPFAR_EL2 gives the IPA minus the bottom 12
bits, regardless of the system page size configuration.

To fix this alignment, bring support for kvm_s2_fault_vma_info in
pkvm_mem_abort() and use its members where possible. They do contain the
page-alignment we need to fix the fault on system with pages larger than
4K.

Also, add a check at the start of pkvm_pgtable_stage2_map(), it does not
support !PAGE_ALIGNED arguments.

Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
Cc: stable@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c  | 27 ++++++++++++++++++---------
 arch/arm64/kvm/pkvm.c |  3 +++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5c89b6684b02..d48e4beab483 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1383,9 +1383,11 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
 	if (map_size == PAGE_SIZE)
 		return true;
 
-	/* pKVM only supports PMD_SIZE huge-mappings */
-	if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
-		return false;
+	/* pKVM only supports PMD_SIZE huge-mappings for non-protected VMs */
+	if (is_protected_kvm_enabled()) {
+		if (vcpu_is_protected(s2fd->vcpu) || map_size != PMD_SIZE)
+			return false;
+	}
 
 	size = memslot->npages * PAGE_SIZE;
 
@@ -1630,6 +1632,9 @@ struct kvm_s2_fault_vma_info {
 	bool		map_non_cacheable;
 };
 
+static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
+				     struct kvm_s2_fault_vma_info *s2vi);
+
 static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
 			       const struct kvm_s2_fault_vma_info *s2vi);
 
@@ -1719,12 +1724,12 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
+	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
 	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
-	struct page *page;
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
@@ -1732,12 +1737,16 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if (ret)
 		return -ENOMEM;
 
+	ret = kvm_s2_fault_get_vma_info(s2fd, &s2vi);
+	if (ret)
+		return ret;
+
 	ret = account_locked_vm(mm, 1, true);
 	if (ret)
 		return ret;
 
 	mmap_read_lock(mm);
-	ret = pin_user_pages(s2fd->hva, 1, flags, &page);
+	ret = pin_user_pages(s2fd->hva, 1, flags, &s2vi.page);
 	mmap_read_unlock(mm);
 
 	if (ret == -EHWPOISON) {
@@ -1747,7 +1756,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	} else if (ret != 1) {
 		ret = -EFAULT;
 		goto dec_account;
-	} else if (!folio_test_swapbacked(page_folio(page))) {
+	} else if (!folio_test_swapbacked(page_folio(s2vi.page))) {
 		/*
 		 * We really can't deal with page-cache pages returned by GUP
 		 * because (a) we may trigger writeback of a page for which we
@@ -1767,8 +1776,8 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
-				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
+	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), PAGE_SIZE,
+				      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
 				      hyp_memcache, 0);
 	write_unlock(&kvm->mmu_lock);
 	if (ret) {
@@ -1779,7 +1788,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 
 	return 0;
 unpin:
-	unpin_user_pages(&page, 1);
+	unpin_user_page(s2vi.page);
 dec_account:
 	account_locked_vm(mm, 1, false);
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..c298a5b9b12a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 end = addr + size;
 	int ret;
 
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr | size)))
+		return -EINVAL;
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


