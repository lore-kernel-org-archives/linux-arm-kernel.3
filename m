Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B2C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpcxrlqibsbrqtQZ2HMASJ40zKJH2nCLx/NEas/62Oc=; b=WcmQdvchK6M8u+ccyTyW3R6SN1
	HvlVv7cM62MchKO14Q+E2OdDWcBkx0/aZOBvIpgMPwuV5FjI94oPO4C/vVBJQgvrJSeLU/dYQKIL9
	OfJD1OFpt5oL/cCoSk262jMMZCfQyMftgvHwgZrfmwV9mCjk1B9j4nA3XySbHb65f3cnA4JttjbLX
	svDTVFilBIg5pMvlV618LswNPucSuBarJ3wS6rVg9d2DRIBJ+2rWXBOqfxxoJ3ygreoTd+ZnqB0Gm
	pAAzqnFqlPC2XxSFLNCPH8xze8Ec77YjhjNplt66sKNdGViJeAZeGWZ+bqj7i13SAMj8sydcgQzPq
	CmGAzKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqI-0000000BdZr-3Vl0;
	Mon, 05 Jan 2026 15:50:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqG-0000000BdY8-0OVe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5901B4197C;
	Mon,  5 Jan 2026 15:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35A0C116D0;
	Mon,  5 Jan 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628199;
	bh=27wZopcJw7/cJco+fEt26YdM4d1w7aPLBlaekI7TuiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MuGYWTvqQD1sFgUn6M1jUx+okntJxvijjH9G/U1Fm1THAZh7nbLBhg22GlhcRhtKu
	 0oayrkClGgGOCYJiJU+/1xUEJJx7nR8P7Yb78AAgYzvN3/P/IipeNA7L3aTYMvPZWs
	 8D/Uz0GFvCjhIRzLziiVg3ArVvQx+NhDztYrOmKvkl9TZ5B+YUTkH3zhpHbm7bgy3Q
	 rbPu6mIRlKZyWpaEhazWP1ST3VVAF1gWNAi7HEEVrRf1pXSm7ZzKKSq6kW0mgTwnf3
	 blWHPGM4NuliCyelt37YGxTxvocDg64+ofBYv2pqashSdDhWvMMHGwZ3VwVBRC8k7+
	 qZCQ69X+H8kug==
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
Subject: [PATCH 03/30] KVM: arm64: Rename __pkvm_pgtable_stage2_unmap()
Date: Mon,  5 Jan 2026 15:49:11 +0000
Message-ID: <20260105154939.11041-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075000_157198_32E9E319 
X-CRM114-Status: GOOD (  11.57  )
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

In preparation for adding support for protected VMs, where pages are
donated rather than shared, rename __pkvm_pgtable_stage2_unmap() to
__pkvm_pgtable_stage2_unshare() to make it clearer about what is going
on.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/pkvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 7797813f4dbe..42f6e50825ac 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -322,7 +322,7 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 	return 0;
 }
 
-static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 end)
+static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64 end)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
@@ -350,7 +350,7 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 	if (!handle)
 		return;
 
-	__pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+	__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
@@ -386,7 +386,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return -EAGAIN;
 
 		/* Remove _any_ pkvm_mapping overlapping with the range, bigger or smaller. */
-		ret = __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+		ret = __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 		if (ret)
 			return ret;
 		mapping = NULL;
@@ -409,7 +409,7 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
 
-	return __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 }
 
 int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
-- 
2.52.0.351.gbe84eed79e-goog


