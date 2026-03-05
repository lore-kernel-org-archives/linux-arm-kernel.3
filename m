Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2848DF33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eX91o5eiAU3dG0I6qFSJ92REc7NtQqDkp0hY88IYews=; b=15DFutxKqu+pFTSJWpLB4ugvOX
	bqHDEesNApMnvAdixN0J7eH2/eyZaS2crVonR3TrlypyGMGNEa7OLD4R6gvRmFM3nApGwBisADWPo
	92+o8z13uHIwPT6CF8cc3+df6jkNKB4PHJZPyj8mtXdknhbY62xiKp6+RM+0tUGkC44W+WIbl20sZ
	D44tpnIXS+idrKqIje39zHe56jfgxeBUduLwtu0kDMuUgVxaA9bmzlytEE7BNnhFduiJzA+B+0OCC
	onUapKBcoJUT+LWG85tsj8men7IuPNAGSHs7sD0Ymlof3lVsVOMUeiV/7WAVPo92/3/jVMijmSQUu
	y8lBBLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9w4-0000000212W-1Oyc;
	Thu, 05 Mar 2026 14:44:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9w2-0000000211b-3Pd0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F2D4441FC;
	Thu,  5 Mar 2026 14:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE21C19423;
	Thu,  5 Mar 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721858;
	bh=wZVmEHB0G05iVbLfQG8WFVsGMKRmMo8Y6r4p8KFCNmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jWDDvJ6NdhqslzfixUaChGLoKcM+mHugfQggkJxnHzAmOzF1FVifMLnVve+aXRWMc
	 qt8Tge1fg3hnkVPupZw4lKk52E5ROrOMjRY/hpAMBP28bCT6Q1MXY1PJz1frMiFi4u
	 dbzaIJzCpJV1wui1vLZZWxHHn14UEdGllepMj1EwFSVwwxsLKOf+KN1upGScMbS//E
	 54zXC26GnlnJQQ8emwcfGON0D6WCGrDsZDdn7dIn+W1I+ZebR6dRupGreRw0hmoMsV
	 U/K7n05yMhToAjT/KGK/5NA8R3ssK7dsTdepL3tB/qsRGf8C1ZkEHeR3h285NYA5ug
	 ighmWb4DVOl/w==
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
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 02/36] KVM: arm64: Move handle check into pkvm_pgtable_stage2_destroy_range()
Date: Thu,  5 Mar 2026 14:43:15 +0000
Message-ID: <20260305144351.17071-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064418_871912_BD2AB851 
X-CRM114-Status: GOOD (  11.21  )
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
2.53.0.473.g4a7958ca14-goog


