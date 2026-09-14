Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F64C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0g8YRTAfNpB/LIEJRW4htZZQabejSE3QJeAUYbefuTU=; b=AXn0afSgCbGwb/Jqq0A2ahAkSH
	Hhe4vdholxbLJsygqGmqmU7eqUimeaxHSxxSZulyCbUDgsGa4mwSqlD+CsOVD09c0p58PGhvzlkCd
	sKratDG/U7NDhXbRJGBanMZx0NCOrRoDPPXyAyPMxC7gzAXEWdFqiMXjtRSF+JU6yH2bSE5uhQDAL
	RtYkkqBIcwYG7Xslc0oKIv3rUUe0q0+MdsN6DvrUPMXzQA2NwR6DHHtH4eEJXYbATXaPy4/4d32/I
	O4mtVy1oGEyIF+EtrBHwdTFNrY99fRtgTYGoDo4Et00iUHLza8M0PfPXWKsNAqVvTbpLX8IyP9MvY
	cNgprAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61aX-00000002dYy-1l0Q;
	Mon, 14 Sep 2026 07:58:53 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61aV-00000002dYb-0IsY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:58:52 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4957287363bso17373565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789372729; x=1789977529; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0g8YRTAfNpB/LIEJRW4htZZQabejSE3QJeAUYbefuTU=;
        b=qaf6Ba/b8nEtDWQVrgwThtNIq8NUYy1GlC0m64boNsvtylk5Zuc/StXkkFZh6QivSd
         BB/tgELEVHUfyRA76u9jR9B33Yii2xyAdsCmTXMkcBahhoWwG9v5O/Z7E7S+DUxvVuAm
         4aht0PumdXO9nKHciHs3EczlmL5J0leJ2A1pFUmRlI0D7kyFCwRgwvDxCP/Nwp9A3RDn
         liPqoSibv4iPQ4Qb9+XbFOZbzQZ8tnhHNfj1av0vIJ5kZ0imASg+G0wIcCRsTVGavT2c
         BTI7H19bMttFgQW2NR2+tpxMu1CQhiUFAFKUNBW3OW4rYcznVQEW0DRrKf7FSkMvdqBv
         xL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372729; x=1789977529;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0g8YRTAfNpB/LIEJRW4htZZQabejSE3QJeAUYbefuTU=;
        b=rzm2K1PLtzgQVHQCmsy0zcIY8V6XJArOUxMWMgPfvfflAlntVQOOIjRlvmtXdwLA+F
         YQMZdY05Kz7UWL/iWmzPPnDpbz6DWtmL7vt+YOoctIn760vuhQ/PJdLXcT/jyQI8z8Bd
         zvEAMkKduaZ/5a8qF2k3HIYbUglx48NnWIX+IB29mKIRjTMyZNIrXMeUFh4WAF43/BW9
         tCveoS9NqeWQIcAVDiN8rqvP7vLpPHj4MGyjmtClgW0Zt9CiaNaNZfLYlNjkbmfUDIs5
         7P74O3MAZptaj9bMs6Dp6rhPVuK0p6bT7xv9hH7sve1aZzAq0U585F9+HuZ0oiCL2yRd
         A+MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrGn1fKRx5Wo7LW64GVyEwQpSC1qVt0z5ifPTqFnI++0boFqL/Ae5a3N9t5T/bKGaReHmEwKb8OmY6Zcm0OaZj@lists.infradead.org
X-Gm-Message-State: AFuF++kCbunyCc9wbf+fH1532b/G1CO3hkvSK2GiCnWnuxJ+IOJ72WTP
	Ub0WxwHb8ypkUAgN7wO+ZuvHEjSr2AiTZK+gkThxgaR4ttpzB0Io8Ii/tp8fmI7ykL48376/dzX
	cP91GnP0tMaM0FvAeIzk51A==
X-Received: from wmfr12.prod.google.com ([2002:a05:600c:158c:b0:495:72a8:661f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49e7a655a2dmr16386405e9.14.1789372728554;
 Mon, 14 Sep 2026 00:58:48 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:58:39 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260914075839.4019904-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Fix protected VM fault on system with pages
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
X-CRM114-CacheID: sfid-20260914_005851_154071_152CC7E8 
X-CRM114-Status: GOOD (  15.28  )
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
support !PAGE_ALIGNED arguments and use the gfn as an argument in all
callers.

Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---

Changelog:

v2:
  - Use gfn_to_gpa(gfn)
  - Drop "phys" from the PAGE_ALIGNED check, it isn't a requirement.
  - Fix gmem_abort() as well (Sashiko)

v1: https://lore.kernel.org/all/20260913173516.3122436-1-vdonnefort@google.com/

 arch/arm64/kvm/mmu.c  | 7 ++++---
 arch/arm64/kvm/pkvm.c | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..ee78201a44df 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1672,10 +1672,10 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		 * PTE, which will be preserved.
 		 */
 		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
 								 prot, flags);
 	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), PAGE_SIZE,
 							 __pfn_to_phys(pfn), prot,
 							 memcache, flags);
 	}
@@ -1710,6 +1710,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
 	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	gfn_t gfn = gpa_to_gfn(s2fd->fault_ipa);
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
@@ -1756,7 +1757,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
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
2.55.0.1007.g17ff1f9808-goog


