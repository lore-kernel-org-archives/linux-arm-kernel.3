Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D7C79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z1t3f7wrfxeNesPgJJ9II3gEkT9Nl6MjeL1+/sskaA=; b=3IJXWkh1Ql5eqsV/7qP/2xOeU7
	OzloW6vpCIR22Xp8JVn41XYvovR6g1MsmQjB7jQA0aE5bpqv6QUjgTrSoeNBIR/7V9hF7+iNZRFcY
	AvgLiZc+29z+xMfCEaPgpCpJI0N56jI/U80OpSz2lSYV4djmQG2hf1crjtImcC4jt1Muh2RWHZEen
	JCGWAtDADrho1a+mP8OGxBTuWRw9oXskh0SQlROdXhapnoHOU7Eooo4Jb7HXmERp1rvaAj28DIuZb
	UlcCSLrFg8NYBtpaZXhStaKjAcogxcIu0UzQQDabYC2imqC46eoBoO8k7IKEV/ieJVXXYnGewu67M
	YyulCzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmr5-0000000BeHM-2b8x;
	Mon, 05 Jan 2026 15:50:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmr4-0000000BeF4-0HA6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71DD660143;
	Mon,  5 Jan 2026 15:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C676C19421;
	Mon,  5 Jan 2026 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628249;
	bh=s4+WSuCvYplaNUVX5guR216Cm3FmdjlvuYliNemWxzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yus9aiDxosBrh2s7VoV5ser5y1E8q+nTR4OKnk+pbn2lhNkNbNea7Aq7iPcsI1J0i
	 JrHj4KBvAHIsvVyVKeY9V9taKvOlBddc6GZpWb6IdT7K1mouz9jqP4R0kCrJczoZVD
	 mydUavxCMbd0nT/huYYmPK7hSmluKY3RZMn+1gHEOqI3CIt9ZLyRKahjb/lbbw1P7f
	 j60HWn4RDcKT0kXDSm2ZQVnuSBrz7AR45z+C79fS7kZb2sELpX4qaT1G92iVjcJUYa
	 Y3PxDUCcbCYHXhOM/3s+nu/QxAIF31wDmc++p6U5hg2uRiljGM3sD0gGnncFsYC6/b
	 ZOdMiAwhiQMpg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 19/30] KVM: arm64: Annotate guest donations with handle and gfn in host stage-2
Date: Mon,  5 Jan 2026 15:49:27 +0000
Message-ID: <20260105154939.11041-20-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Handling host kernel faults arising from accesses to donated guest
memory will require an rmap-like mechanism to identify the guest mapping
of the faulting page.

Extend the page donation logic to encode the guest handle and gfn
alongside the owner information in the host stage-2 pte.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7d1844e2888d..1a341337b272 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1063,6 +1063,19 @@ static void hyp_poison_page(phys_addr_t phys)
 	hyp_fixmap_unmap();
 }
 
+#define KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK	GENMASK(15, 0)
+#define KVM_HOST_INVALID_PTE_GUEST_GFN_MASK	GENMASK(56, 16)
+static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
+{
+	pkvm_handle_t handle = vm->kvm.arch.pkvm.handle;
+
+	WARN_ON(!FIELD_FIT(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, handle));
+	WARN_ON(!FIELD_FIT(KVM_HOST_INVALID_PTE_GUEST_GFN_MASK, gfn));
+
+	return FIELD_PREP(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, handle) |
+	       FIELD_PREP(KVM_HOST_INVALID_PTE_GUEST_GFN_MASK, gfn);
+}
+
 int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
@@ -1105,6 +1118,7 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 meta;
 	int ret;
 
 	host_lock_component();
@@ -1118,7 +1132,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	if (ret)
 		goto unlock;
 
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
+	meta = host_stage2_encode_gfn_meta(vm, gfn);
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+						      PKVM_ID_GUEST, meta));
 	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
-- 
2.52.0.351.gbe84eed79e-goog


