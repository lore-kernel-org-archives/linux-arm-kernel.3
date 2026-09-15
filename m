Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D669C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAcoPa4jlwbshTSTSUzhgIUdN8VWUk7aj8T/MzEYoIs=; b=bC009SGHVWAmKkdR9hoU1CZL75
	rIvpYeBCNO3l19BoGsgVHkTcT1zDDLVl4QjwLHWAX3/Suz/LBsk7LOFAnuMStqPGDP19B1KasmVYK
	lLbqoDdOFQztFSTKnumDveN6E/XXLBr/LhPoy/tYO8fIXrNv6WWtliOisveKepEc+2hyAfdIXwH82
	Fzv7yGAFCsVFW0s9NerFfkz7zYW+zNUkXNRoTIfwB3woj304mQ8KhqaKqlwvaqeI/YIIs9HYAzmQi
	C+mq4fI5uDlXHty9jU0K2ydL/eN14GPvekdn0T1kbHVma9ipt6l0nT45wpuUBWwEX3oDsxAvg0KtF
	P4S7nYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PHH-00000005lLG-0zey;
	Tue, 15 Sep 2026 09:16:35 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PHE-00000005lKj-06PY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:16:33 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-485866e0066so1778647f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789463789; x=1790068589; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAcoPa4jlwbshTSTSUzhgIUdN8VWUk7aj8T/MzEYoIs=;
        b=R5vC9MbXSo8wgwQJRLQsBrBnfUQIxRDy0nDByj1vTjKHjQ4Z4MP39+Sl2bKTyBZ5k9
         Yg5urdNWNBxdyg5fMIAqamH46eIQSceTd5Ad7M9rN/2bwZ+F5GLj5SHloPuWJJh9JpW7
         QvJGmD5nRA26XwS1iw1nlOKztXXmgpeG7hhCfWoVVqgzJAEI006OFu8Dm0mq1SF5NIkJ
         3wz7ks46fvfeyLWsjUxxwUYBwtMdEmewAWzQW73dCnJlYqYwbm4vSUhnoVq048fkkpc5
         dmZhQV6Snnx6av/lLQrA3ETbyUBwQBnQmieIrj6iPBiV4ePmH2f5HSvKsXnsRVlc4gfp
         vulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463789; x=1790068589;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAcoPa4jlwbshTSTSUzhgIUdN8VWUk7aj8T/MzEYoIs=;
        b=lC/6BLkW53bFloP6ESBc8svQHoAxgh2GnQ3kN7zGqK/RH9EmE4MQWKN4xOjdAh4OoG
         wU5QENdltPzgr6v0rvvMrNel086y1dlA7uy10vL1d74Yy4EzULAZJgxG9toC+8uLxWYd
         6p26vQWFb86MEvommg83kv7fNli/roBNAA7iwuYm1/1w6EjeqclkMkqqvTuuaxcM+0+X
         DDblid+bGAAAEUJzP1VHJQ/cwxR97u2dG1vKhUYDNxSgMEd9k3nIPpufGaM7fli05I5M
         7HAfTrs42E31YLqGWx7w0uiTHZGtoNoXA3TimgGXbrKuLqwBax7H7CT1ZmpKTW08/4Ed
         lD8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZyNaJN4m7/07D/VCMSYYDALHI5R6jSXNJKe9wkHUI0Q+zWJmEDVBr4rjw1T/ma/0GSzpgsqBZQSdr5LlkXi6U@lists.infradead.org
X-Gm-Message-State: AFuF++k0QpRe9GkKIEHITrRtI0XUwHRtDZKAvnOXVBbA2Fv/P0WMsCqv
	1uLQzwRaxCQnwWrdoWRiEIe4n9dFG5Af2g1b+b5raoyFNdVUPYkcn7L4qmSeuHIsQR6xNFN8OWZ
	7uFN7wAKUpWOLV1pXvzq0Dw==
X-Received: from wrvm9.prod.google.com ([2002:a5d:6249:0:b0:484:3705:a028])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4605:b0:487:92e:c609 with SMTP id ffacd0b85a97d-487092ec81cmr1510335f8f.0.1789463789109;
 Tue, 15 Sep 2026 02:16:29 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:16:06 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260915091606.2111217-1-vdonnefort@google.com>
Subject: [PATCH v3] KVM: arm64: Fix protected VM fault on system with pages
 larger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_021632_080153_F2EABEAD 
X-CRM114-Status: GOOD (  15.23  )
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

Just like commit 08f97454b7fa ("KVM: arm64: Fix protected mode handling
of pages larger than 4kB") fixed the boot of non-protected VMs on system
larger than 4K pages, align the fault IPA down to the page-size for
protected VMs.

To paraphrase Marc, pkvm_pgtable_stage2_map() assumes the address passed
as a parameter is aligned to the size of the intended mapping, while
HPFAR_EL2 gives the IPA minus the bottom 12 bits, regardless of the
system page size configuration.

Add a check at the start of pkvm_pgtable_stage2_map() as we do not
support !PAGE_ALIGNED arguments and ensure callers pass a page-aligned
IPA.

Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c  | 12 +++++++-----
 arch/arm64/kvm/pkvm.c |  3 +++
 2 files changed, 10 insertions(+), 5 deletions(-)

Changelog:

v3: 
  - Fix nested case in gmem_abort() (Sashiko)

v2: https://lore.kernel.org/all/20260914075839.4019904-1-vdonnefort@google.com/

  - Use gfn_to_gpa(gfn)
  - Drop "phys" from the PAGE_ALIGNED check, it isn't a requirement.
  - Fix gmem_abort() as well (Sashiko)

v1: https://lore.kernel.org/all/20260913173516.3122436-1-vdonnefort@google.com/

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..e199dd339583 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1610,6 +1610,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	bool write_fault, exec_fault;
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
+	phys_addr_t ipa = ALIGN_DOWN(s2fd->fault_ipa, PAGE_SIZE);
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
 	unsigned long mmu_seq;
@@ -1672,12 +1673,12 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		 * PTE, which will be preserved.
 		 */
 		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, ipa,
 								 prot, flags);
 	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
-							 __pfn_to_phys(pfn), prot,
-							 memcache, flags);
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, ipa, PAGE_SIZE,
+							 __pfn_to_phys(pfn),
+							 prot, memcache, flags);
 	}
 
 out_unlock:
@@ -1710,6 +1711,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
 	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	gfn_t gfn = gpa_to_gfn(s2fd->fault_ipa);
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
@@ -1756,7 +1758,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
+	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(gfn), PAGE_SIZE,
 				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
 				      hyp_memcache, 0);
 	write_unlock(&kvm->mmu_lock);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..b7340c430ed6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 end = addr + size;
 	int ret;
 
+	if (!PAGE_ALIGNED(addr | size))
+		return -EINVAL;
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0.1032.g73a4cd73de-goog


