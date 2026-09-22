Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A88C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRT4LKrWmlIEgB+8kAa2SxHNKz3rcwa3j5wHsFjjrzo=; b=j97oPmVKC5AP4TnYdQxViwfpNp
	vE3UxVsCZmUQdx4vc5l8THU93ucQs2/iOwP5nN1gNPQm6uMKI7LSPgSysC34gz5GYGuRNGYSqVRdW
	q9uSXyPRkevVC883V3zCm2oHK4uAf14+Mhw6ep4NnLahWRvHGvifZpsX17oMUo18B1q6Bk1Ngivv6
	2hHKZoh+Wg/Lp6wHuIhIzytyAnn2B20FPAjeEKwVwByVIjnAe/F2lgN8fOwfZn+eBCUgsmKWPFSzO
	u3NZ9ZKmr7cgEv1phKe3mHDo7Xcs/D27q6ciWnaNRFN3VuqySu0KqHH4bKuGC44ArcPTW3k3FWc7p
	OccfJPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Eh-00000005R2b-0KSI;
	Tue, 22 Sep 2026 13:08:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Ee-00000005R0Y-21xD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hRT4LKrWmlIEgB+8kAa2SxHNKz3rcwa3j5wHsFjjrzo=; b=QGOY/7zFQg8LwShztWzE2lfDw/
	iLNAmM+ZJJ9wysfmqmwIr1WvtuQa23CboC26AiqSdwzhyy/uQevJdjyE1KH0sTs2ZRFsr9RLzDvie
	prHX8nqBDE4PghcdR8IRPrkGTLzwIR+gpRkvP3imaeQuWXho1O6G5csfJmJ0gigXjhc9SpskRO24i
	XcWIECcbwDDGpDObyOdHU2eG3XcQNJLl4L5nKLC0Bd0pZBnzPa7/4PxSnQLvk6i4qGDIWeYVJvymG
	DX3U000AbgCHYKxuDaqF2Aa50wYv34WdGxRoClk27oAWw319gguNg9WfnZTEGmKyopzI4OZUQm5M9
	yhSdH/qg==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90Eb-0000000DbCp-0wf6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:35 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-490a767b782so32697765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082512; x=1790687312; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRT4LKrWmlIEgB+8kAa2SxHNKz3rcwa3j5wHsFjjrzo=;
        b=VK00sfrt7oqTPpHIPc9IINpEYK7taB9gKSQEYj/zJS69EE8vv0vV244WUPdT4I9ox7
         XycSTqxq9rHrTFu45YjvHpPA+nMqg/YgCVljSEWfBbUM0lJtJJpCbrraijCkfrsgTzN0
         Kc2aWNju67VoRG7QrOHR0fXuRQfQHzeQwgn5KTRStMvinLYzvx2Olm0s9l8qokUwRTXh
         yhjVpdGc1UrWsn5I505+pplTFxS4SuGNuSq4t01rCXTBdVksFGnCk3wDb9sPKzR3c89F
         9aKNV9nSu7VY/bYBjgH43mjxz2eV+joLdhKwvsbC+k+yhg7mYUrTFmqIH3lLTHdofN4s
         k6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082512; x=1790687312;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRT4LKrWmlIEgB+8kAa2SxHNKz3rcwa3j5wHsFjjrzo=;
        b=p7PzJbWGQnThsP+UnQWbm7AUtwelgFyRFC+S9QsW4yTIPinVoKXzo44OQdVY8QQovK
         GCGxu18ppurKDy6NbRoro8NpO98JmKAaZf0uOK0sJgzEM1PRqCF96uv/QW2qxdlqJ+oS
         ih2Ymf3qv1oJw6oa9U5yYpbfdPwvnQg9o22gbBuiwWS5adsivmP/JG1Sp6oOgRzWy5Fa
         ihDmnO/+s/TuFaogMXgjgmviucpr/QwMsg3Bd8fPy3VlV6fKrnTS24TnE47yyw8ue5+6
         F4oVajeGyKGog/OtUoqcGajENYQlfElO9DKHWPBWMVFf52P5AGGFF/sH22tI4zUWqWNz
         EoTw==
X-Forwarded-Encrypted: i=1; AKwUvByEnSTMvp935mquEdfnPUfMLYzfEzXDgjYMXxFMMVf5l3WnsgbMAvSPWdXay4+db0BNHnV+9rNyKEODWwQTShUk@lists.infradead.org
X-Gm-Message-State: AFuF++kHczDdP3WRveqa1YK5c+0mvB3uGuOgZczq5hkwv3ip4UOuc1ft
	g++ZSkMMgLOQYmFgPvhtf02UvVwR5Mdi+UgkgvGlDUkgXfufGxB7rOLU6hpIqt18JFA11ei28za
	o09o6MaDpNCtxlMC6vWQSZg==
X-Received: from wmbgv5.prod.google.com ([2002:a05:600c:80c5:b0:49e:6a1d:16af])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e24:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49fc574f74bmr191646085e9.17.1790082511588;
 Tue, 22 Sep 2026 06:08:31 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:20 +0100
In-Reply-To: <20260922130821.1666713-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-6-vdonnefort@google.com>
Subject: [PATCH v1 5/6] KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_140833_545741_0798EA9F 
X-CRM114-Status: GOOD (  15.05  )
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

From: Fuad Tabba <fuad.tabba@linux.dev>

gmem_abort() maps at s2fd->fault_ipa, which HPFAR_EL2 holds at 4K
granularity whatever the page size. The generic page-table code aligns
it, but pkvm_pgtable_stage2_map() looks up existing mappings over
[addr, addr + size), so on a pKVM host with pages larger than 4K a
guest_memfd-backed guest that faults past the first 4K of a page can
find its neighbour's mapping, get -EAGAIN and take the same fault
forever.

Take the addresses from kvm_s2_fault_vma_info instead, as
user_mem_abort() does, and report the gfn kvm_gmem_get_pfn() failed on
in the memory fault exit. kvm_s2_fault_get_vma_info() itself isn't
called: a guest_memfd memslot's userspace_addr doesn't need to be
backed by a VMA.

Fixes: a7b57e0995927 ("KVM: arm64: Handle guest_memfd-backed guest page faults")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913175105.A57AC1F000FF@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5aac624b0442..ee0fcca838c1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1953,11 +1953,9 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
-	unsigned long mmu_seq;
-	struct page *page;
+	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	void *memcache = NULL;
-	kvm_pfn_t pfn;
 	gfn_t gfn;
 	int ret;
 
@@ -1968,23 +1966,22 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 			return ret;
 	}
 
-	if (s2fd->nested)
-		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
-	else
-		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
+	s2vi.vma_pagesize = PAGE_SIZE;
+	s2vi.gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi.vma_pagesize) >> PAGE_SHIFT;
+	gfn = get_canonical_gfn(s2fd, &s2vi);
 
 	write_fault = kvm_is_write_fault(s2fd->vcpu);
 	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
 
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
-	mmu_seq = kvm->mmu_invalidate_seq;
+	s2vi.mmu_seq = kvm->mmu_invalidate_seq;
 	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
 	smp_rmb();
 
-	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
+	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &s2vi.pfn, &s2vi.page, NULL);
 	if (ret) {
-		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
+		kvm_prepare_memory_fault_exit(s2fd->vcpu, gfn_to_gpa(gfn), s2vi.vma_pagesize,
 					      write_fault, exec_fault, false);
 		return ret;
 	}
@@ -2002,7 +1999,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
 
 	kvm_fault_lock(kvm);
-	if (mmu_invalidate_retry(kvm, mmu_seq)) {
+	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
 		ret = -EAGAIN;
 		goto out_unlock;
 	}
@@ -2013,16 +2010,17 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		 * PTE, which will be preserved.
 		 */
 		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(s2vi.gfn),
 								 prot, flags);
 	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
-							 __pfn_to_phys(pfn), prot,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(s2vi.gfn),
+							 s2vi.vma_pagesize,
+							 __pfn_to_phys(s2vi.pfn), prot,
 							 memcache, flags);
 	}
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
+	kvm_release_faultin_page(kvm, s2vi.page, !!ret, prot & KVM_PGTABLE_PROT_W);
 	kvm_fault_unlock(kvm);
 
 	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
-- 
2.55.0.1082.g2b9226bbc0-goog


