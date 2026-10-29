Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008AC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41akyT37;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XZoYqSH/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4uo4YwZye5gbwG4LR+me6BP44T84OykPaJHKbYTcGKA=; b=41akyT37KZ2mh6
	XzfE1k0S/UiV4ZXADjxYeravqSuGhA8xXl9XfxONe6T5U+E+sXbOaVPQI+bEz6jOA8aaM6nEKAplJ
	NXXU9Hy5YRJSToSqbtKw/mTmktSwqhmiO3rqORSthsRW5431BWcuxQHWJVBuetrDnxsChiXmVs0H7
	t1mYkvq4wkhagsJXjn+y0Xxk6Kdgkpz2zwlceEHCkmeZ8f1woejzVrIuff9vvPa2JMv/1Tt74fMYu
	ffRkwwWpPx59QM+QTRQkrGLhCcBAdQwvOVQJ/otPFzt2DxyNGTjZ9GzKjt/ZYBLM+r9g9TV+9v4HX
	2o8ETjcHMwmZXwXVkedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMS4s-00000009dPV-3RyQ;
	Thu, 29 Oct 2026 15:30:06 +0000
Received: from out-169.mta0.migadu.com ([2001:41d0:1004:224b::a9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMS4q-00000009dOT-2DCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:30:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=la7E0PWX7gnalEHWFdRBnWD3MsgOWAc+7PnzT7S9dEs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793287799; v=1; x=1793892599;
 b=XZoYqSH/aQZxkCrLSCy//P1p6IxM8xGicTQUKfRs6DhKhsCoLR7vUNmXoR7DXAk+IY1Kz+m1
 8t4fznkRl005Twkt3hEWMLvn26zd/omJrEJN565kpgb7OrlvZhcGaS2ND7zcVuNAQkx9BaYzWyX
 XI/YS5MSmQDQY9Qh93mLonL0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8a1ab3f95cac30d7;
	Thu, 29 Oct 2026 15:29:59 +0000
X-Mizu-Trace-ID: 8a1ab3f95cac30d7
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	qperret@google.com,
	weilin.chang@arm.com,
	tabba@google.com
Subject: Re: [PATCH v2 22/22] KVM: arm64: Stage-2 huge mappings for protected VMs
Date: Thu, 29 Oct 2026 15:29:59 +0000
Message-ID: <20261029152959.3552746-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911135053.146435-23-vdonnefort@google.com>
References: <20260911135053.146435-1-vdonnefort@google.com> <20260911135053.146435-23-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_083004_715082_D9DB75F3 
X-CRM114-Status: GOOD (  17.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Fri, 11 Sep 2026 14:50:53 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
[...]
> @@ -513,17 +512,23 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
[...]
> +                /*
> +                 * If a huge mapping overlaps an existing PAGE_SIZE one,
> +                 * then the VMM has played games with the stage-1. Abort.
> +                 */
> +                if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
> +                        return -EFAULT;

A guest can hit this on its own, without the VMM touching its stage-1.
I ran into it while porting your unposted v3 to android18-7.3, and v3
has the same race. A pVM shares one page of a 2M block, and another
vCPU touches the block during the split's break-before-make. The host
sizes that fault at 2M from the THP, but under the mmu_lock it finds
the split's PAGE_SIZE mappings.

I made the following change in the android18-7.3 port. It maps just
the faulting page, since retrying alone re-faults forever if the VMM
puts a fresh THP behind a partly mapped block. If you're happy with it,
can you fold it into v3?

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 70b002eb17e05..72fc2577f51cd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1921,6 +1921,7 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
+	u64 size;
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
@@ -1936,13 +1937,21 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if (ret)
 		goto unpin;
 
+	size = s2vi.vma_pagesize;
 	kvm_fault_lock(kvm);
 	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
 		ret = -EAGAIN;
 	} else {
-		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), s2vi.vma_pagesize,
+		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), size,
 					      __pfn_to_phys(s2vi.pfn), KVM_PGTABLE_PROT_RWX,
 					      hyp_memcache, 0);
+		/* The block may hold PAGE_SIZE mappings from a split: map the page alone. */
+		if (ret == -EAGAIN && size > PAGE_SIZE) {
+			size = PAGE_SIZE;
+			ret = pkvm_pgtable_stage2_map(pgt, ALIGN_DOWN(s2fd->fault_ipa, size), size,
+						      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
+						      hyp_memcache, 0);
+		}
 	}
 	kvm_fault_unlock(kvm);
 	if (ret) {
@@ -1953,6 +1962,9 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		goto unpin;
 	}
 
+	if (size != s2vi.vma_pagesize)
+		account_locked_vm(mm, (s2vi.vma_pagesize - size) / PAGE_SIZE, false);
+
 	return 0;
 unpin:
 	unpin_user_page(s2vi.page);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8a74df9f9fec3..6b5df4595f6a6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -650,14 +650,8 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return -EINVAL;
 
 		/*
-		 * If a huge mapping overlaps an existing PAGE_SIZE one,
-		 * then the VMM has played games with the stage-1. Abort.
-		 */
-		if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
-			return -EFAULT;
-
-		/*
-		 * We either raced with another vCPU or the guest PTE
+		 * We either raced with another vCPU, a block overlaps the
+		 * PAGE_SIZE mappings of a guest-driven split, or the guest PTE
 		 * has been poisoned by an erroneous host access.
 		 */
 		if (mapping) {

Cheers,
/fuad

