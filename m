Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEBBCCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGiT6Rw1DyAULFudLn3VaEOfgw67B0gQn+NWTU0j5mI=; b=0fMzgSyzC4UZH/tHUmCs24jKtC
	f/inE4EROoQO8ju9M6yYQp86BCrwIVJgBypRzQ64xECzsEiW+FIWKwrB165dQzdxEBVNZhkMVKvWf
	BBuhlhOeHfHixMEOJtcw4aUgFo4Nj3U3xY37vpFLiZb98idWLQyUBQ3+Cksfry+z3hI1083Beu+e1
	DntC3rIyo78iPbl14jNIn8rWByYVJLrGIzw7o4Txj5RWS4OExpjNl80O5Vu5t6GI3/JGZwK9FBVsL
	0qeWHxgOIpcd+eRQc52mnaDdggX7kKmyh7o6Etglov/ejygtcFfLoiwOsKA0g+ii3TUi4k8Rv74O5
	Qm5TmHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhof1-0000000236t-1Pa6;
	Mon, 19 Jan 2026 12:47:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoet-0000000233C-0wkp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8798E43DB0;
	Mon, 19 Jan 2026 12:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CEFC19423;
	Mon, 19 Jan 2026 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826822;
	bh=Xla0EE0EqHreutQ1jfO5kxNb3sYx2UrdMxQNpU9siy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZi+Ot5nUMovxcGhzAfN6vlS+gsXjPikIAh2pOzdZQgYXnpEKjCYbfDVGGnOJz/qm
	 Eotcok8jIdkys8NSCeA54BpAxxhU9Z1R2Nc22wwvKKzh1gE2mLN15YcAUmJpTR1zUf
	 1frm3QKvvP8hKJcQyhUxM6uFAfm2tdML0gZKqs6GwEsQFjXW+hMXhw3tgVIL8XoOhm
	 JZYwjWCJHwCeBNOtGELHKWvNot6SapKju6B4s5iJAUYd+PyxSUPH3IB3ImxxoJDNoh
	 i4267bysFRykLsNNDNjl+ZOL+NiE5JofXFmLx8CNZzIbwo0NMfxaK3WmZF9mnV4/Cx
	 CAyXACEtxojQg==
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
Subject: [PATCH v2 03/35] KVM: arm64: Move handle check into pkvm_pgtable_stage2_destroy_range()
Date: Mon, 19 Jan 2026 12:45:56 +0000
Message-ID: <20260119124629.2563-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044703_973962_59F06FEB 
X-CRM114-Status: GOOD (  11.31  )
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

When pKVM is enabled, a VM has a 'handle' allocated by the hypervisor
in kvm_arch_init_vm() and released later by kvm_arch_destroy_vm().

Consequently, the only time __pkvm_pgtable_stage2_unmap() can run into
an uninitialised 'handle' is on the kvm_arch_init_vm() failure path,
where we destroy the empty stage-2 page-table if we fail to allocate a
handle.

Move the handle check into pkvm_pgtable_stage2_destroy_range(), which
will additionally handle protected VMs in subsequent patches.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/pkvm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d7a0f69a9982..7797813f4dbe 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -329,9 +329,6 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 	struct pkvm_mapping *mapping;
 	int ret;
 
-	if (!handle)
-		return 0;
-
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
 					mapping->nr_pages);
@@ -347,6 +344,12 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 					u64 addr, u64 size)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+
+	if (!handle)
+		return;
+
 	__pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
 }
 
-- 
2.52.0.457.g6b5491de43-goog


