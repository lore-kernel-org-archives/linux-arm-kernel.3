Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1719C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mF265Aqimdj2iepOluks5IBu1SG+YdC3V4Gk2EYyoIs=; b=HhGeJMYC5ZrcF/jqGEoTh3oI3I
	y+cLLSRoLVoPIKqnfm1xfUR6DDkawklPS4i7Vy/TCwjm3Xo0ks2/wI9e2rk9E8TF7GsiKuyba6sDx
	sVnodqs2eMm9lDFMwgXkMj2kJWuxJcwCVTWAU3qhZrzIkFOG4n6yjqRtZ1odDJLYt12bEq1e3zK+f
	JnDDnCLDesEN02b09MJ8DFJPIY6KJRwY7hOhYMkDeP81OUmwMYWFeqmMmLL8hnBZdl0vzZRiPsQQI
	1R1mjcHRt8rYWF8VkXPS1w+Dx2X377hHmnmyaZrf4RyMKU5DRquYA16cBUGoZhOQD976dxz3qO/lo
	yg2MvCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfy-00000008qcn-2NAc;
	Tue, 08 Sep 2026 11:07:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfv-00000008qad-1z8U
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mF265Aqimdj2iepOluks5IBu1SG+YdC3V4Gk2EYyoIs=; b=hz3GVC/nZPGT6IoQaeMtOUIeGp
	hM/u11yxO2HswKMX3vmv05GRefjLqRNTpF6OMPS72MLFK8eCSG+t95bgq2SJDw8uMVeUH8wiC7qcb
	FRNjk84cifryIDH7nEY78uz+55+jY4GzkZjkdbYoe8s5WXYjrEUi+oxgXx5zbTrqgRaPtkjS0lebx
	8A0D0lrfC4pkxIuRy8jby8tC6Km0uA/4mFrPisfaGtqjAP0yueeKZvY5rEswX41N5cUKsWKCcHnEE
	PDy+HXqFkoleOs16f1Ze2hHxbUuRqLqgt3v6y80TxUqR5T0Nr//Gto797IiCe+suHiT53jUC5o/rA
	pJnO50ZQ==;
Received: from out-223.mta1.migadu.com ([2001:41d0:203:375::df] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3tfs-0000000HJr5-2owQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:07:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=n+vTJUIvsDxI7yNE//7ETqP96fI8JsmTAhqvehLBjCw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788865654; v=1; x=1789470454;
 b=Fw9nXrdrrkkKWAhzydgvKtfzedI2UdLMt6vCEmBAHhH9Z4/NCbrhcVPjLyNIkqJj2r5nGM+0
 491VgUcPWtwtCkSNTxhBJ2ofBbWhVaTiRj95lOsSH9VXguZpBtkdTo/qCnL7PrI/qLsQDRTgljq
 LwI6xy4ImfumwNednqaCJXSg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5f1e715ccda4b9bd;
	Tue, 08 Sep 2026 11:07:34 +0000
X-Mizu-Trace-ID: 5f1e715ccda4b9bd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] KVM: arm64: Check every private mapping is hyp-owned at pKVM init
Date: Tue,  8 Sep 2026 12:07:13 +0100
Message-Id: <20260908110713.1540304-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_120736_800367_3FB3591E 
X-CRM114-Status: GOOD (  17.23  )
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

fix_host_ownership() transfers only what it walks, so a hyp mapping
outside the linear map is not manipulated by the walk.

Walk the quarter of the VA space holding the private range and the
vmemmap once the transfer is done, and fail init unless every valid
leaf is hyp-owned: in the vmemmap when the page is memory, and in the
host stage-2, where hyp text may instead be mapped without write
access. A leaf that is not memory has no vmemmap entry and is checked
against the host stage-2 alone. Hyp text is matched by physical
address, since the only executable mapping in the range is the
Spectre-v3a vectors, whose VA is a private allocation, and an
executable mapping of anything else must not be host-readable. The
vmemmap can be block-mapped, so the walker checks each page of a leaf.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 12 ++++
 arch/arm64/kvm/hyp/nvhe/mm.c                  | 59 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |  4 ++
 5 files changed, 77 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index cab27f7bd423a..ec85a95471207 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -55,6 +55,7 @@ bool addr_is_memory(phys_addr_t phys);
 bool addr_is_hyp_text(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
+bool host_stage2_pte_is_hyp_owned(kvm_pte_t pte);
 int kvm_host_prepare_stage2(void *pgt_pool_base);
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd);
 void kvm_guest_destroy_stage2(struct pkvm_hyp_vm *vm);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 6e83ce35c2f2e..31cae95ddb716 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -29,6 +29,7 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
+int pkvm_check_host_ownership(void);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d026f446bd8ef..a6a47c1e058b3 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -641,6 +641,18 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 	return ret;
 }
 
+bool host_stage2_pte_is_hyp_owned(kvm_pte_t pte)
+{
+	if (kvm_pte_valid(pte))
+		return false;
+
+	if (FIELD_GET(KVM_INVALID_PTE_TYPE_MASK, pte) !=
+	    KVM_HOST_INVALID_PTE_TYPE_DONATION)
+		return false;
+
+	return FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) == PKVM_ID_HYP;
+}
+
 #define KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK	GENMASK(15, 0)
 /* We need 40 bits for the GFN to cover a 52-bit IPA with 4k pages and LPA2 */
 #define KVM_HOST_PTE_OWNER_GUEST_GFN_MASK	GENMASK(55, 16)
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 422ee57be9560..29ab5ee9d57fc 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -472,6 +472,65 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 	return ret;
 }
 
+static int check_page_ownership(phys_addr_t phys)
+{
+	kvm_pte_t pte;
+	bool host_ok;
+	int ret;
+
+	if (addr_is_memory(phys)) {
+		struct hyp_page *page = hyp_phys_to_page(phys);
+
+		if (get_hyp_state(page) != PKVM_PAGE_OWNED ||
+		    get_host_state(page) != PKVM_NOPAGE)
+			return -EPERM;
+	}
+
+	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
+	if (ret)
+		return ret;
+
+	/* Hyp text may stay host-readable, see fix_host_ownership_walker(). */
+	if (kvm_pte_valid(pte) && addr_is_hyp_text(phys))
+		host_ok = !(kvm_pgtable_stage2_pte_prot(pte) & KVM_PGTABLE_PROT_W);
+	else
+		host_ok = host_stage2_pte_is_hyp_owned(pte);
+
+	return host_ok ? 0 : -EPERM;
+}
+
+static int check_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				       enum kvm_pgtable_walk_flags visit)
+{
+	phys_addr_t phys, end;
+	int ret;
+
+	if (!kvm_pte_valid(ctx->old))
+		return 0;
+
+	phys = kvm_pte_to_phys(ctx->old);
+	end = phys + kvm_granule_size(ctx->level);
+	for (; phys < end; phys += PAGE_SIZE) {
+		ret = check_page_ownership(phys);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int pkvm_check_host_ownership(void)
+{
+	struct kvm_pgtable_walker walker = {
+		.cb	= check_host_ownership_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+	};
+
+	/* The private range and the vmemmap share one quarter of the VA space. */
+	return kvm_pgtable_walk(&pkvm_pgtable, __io_map_base,
+				BIT(pkvm_pgtable.ia_bits - 2), &walker);
+}
+
 static void *admit_host_page(void *arg)
 {
 	struct kvm_hyp_memcache *host_mc = arg;
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index bb667cd7080b4..45ac5f2ba4f7a 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -334,6 +334,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = pkvm_check_host_ownership();
+	if (ret)
+		goto out;
+
 	ret = hyp_ffa_init(ffa_proxy_pages);
 	if (ret)
 		goto out;
-- 
2.39.5


