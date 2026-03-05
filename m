Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E5EF33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWxIorD93eYypbe/8W96tbobxnF8SPb3wai0D1ZH9iU=; b=oZnDYvRvym/qFLzSkyA3/5oB32
	z8ekjyr6zlFxFQE3A3mgJ8Ja80LK7ze80A6nnU+m3a0aEN9+ybuLBq1typO+5mKowVJQryaXJ/dD+
	c2VqRuXpyNa2UssdW/86HJdKPm+qCx/WAuOsb4pTt9HOAatgq1QxDVaZ4213YMapabfZg1JbU3JaJ
	OxmFLd6JFS7f45vMmZ5L2/lT89O3tOJemhjQrjRT7c1WoYUrMd0Ep8dfHsg5rpLz3+/IJ6+z+6IVA
	8HunhB2tNNzLRzwWR80g8WI2yqc7vW5qE2bj6A/SZrg+ZXXtmxdIgblJ5/Z67tIKI+vvB2LzpcUb1
	WRN+Jmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9w7-0000000213j-3UcX;
	Thu, 05 Mar 2026 14:44:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9w6-0000000213K-1Hfi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAB7561344;
	Thu,  5 Mar 2026 14:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1C8C19423;
	Thu,  5 Mar 2026 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721861;
	bh=K002Gz27tnD45KP5u95dP7QuZtqLaRe95BWroiXb4rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Np7GybqqaFvnkfnQIC95iHDGZCZ5NV4iMNh8GhzSOY3ZQrgLG7ZeGMHjaDe/M1uPD
	 BPFORi3RJoBE0HLN3eO4l8DFuXUa8juYw/lr4JvwPkqITg6rDYcTqd6U/y77GpPwYf
	 xRjBpG65uqeUXd8Vzsar7iWYdea/GiimMOCwr54nqJmikv843nsi9lxgR4kwEtbPlD
	 cA9Stomr4utGC1avFMsM3Z2P7jOYY9y87UL3YOouFE0C/tFkmT3rjxNHPcAGkdX3K8
	 M24y0SEYTMl/lUujK4BUdk1gzhMEOlbf0UNVm6MCcFr18mFY8ylFEDLfDmIoMif2II
	 AxSkrq3zFeMgg==
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
Subject: [PATCH v3 03/36] KVM: arm64: Rename __pkvm_pgtable_stage2_unmap()
Date: Thu,  5 Mar 2026 14:43:16 +0000
Message-ID: <20260305144351.17071-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
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
2.53.0.473.g4a7958ca14-goog


