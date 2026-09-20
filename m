Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B1C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2MervBKa3e2q9fBioDLa6RkwGpGx98JY81Q84WDyxs=; b=Pla17PRJI0QFhqE8GqVvOLuSqm
	Io/Q8ThB+WCy2dd4uM3CnHizpJ/7tgGBBBjBM04WrXhDhO8dOJQfFXslyJmqVzsv/oBJMC6GQ+t6c
	xMD+XMBdN1LJY9AkFOjJJ9Hk7/o8CccjL7+NN/8rKb0FyFh05qkCruEZm8bCMQ6un4TV/lI+rmPHe
	lyrU3S5VJrrvis84fEjjm65Fmq7bLVi+Cc62inBD989D08ihOGFqbbgmoNiCh1IQKt3MRYahEY2Zl
	pn+nZLE7XndFqkFOegKZ0HWUAaviPOpISHyVdvVumdnr9QUdx0g9MW22D/jEOaew0YSKsSTtsYNtv
	+Kc78OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P6Z-00000000S5D-3KpM;
	Sun, 20 Sep 2026 21:29:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P6F-00000000RoB-3zfq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:29:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB60C1596;
	Sun, 20 Sep 2026 14:29:23 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5591C3F632;
	Sun, 20 Sep 2026 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789939767; bh=xWBRQ2iZnL1JYRZR7SER1/+fXiX3ZfT1xA7aqCXLF9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjGhEq1CcR8oyElFmpjIHT/xx5we7EOOqmzmwwei/jCpyg10QAI8WQmns+VA7zOGf
	 8KOvMB+ImofXDqZR2bjIXqRkDi7fY4XfYogIMtc3mDJI/bx5wxxqe3qgcZJaOBiPv7
	 +iTXgBJlRiM8ojV5CEfqCRZb0JDP/bEyuDVuOFMw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v19 08/20] KVM: arm64: Reuse kvm_stage2_unmap_range in kvm_unmap_gfn_range
Date: Sun, 20 Sep 2026 22:28:33 +0100
Message-ID: <20260920212845.707-9-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920212845.707-1-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_142928_110077_BA36822B 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

In preparation for adding VM specific backends for stage2 operation,
switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
from the kvm_unmap_gfn_range(). Drop the bail out check for protected
VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
would replace the logic in kvm_stage2_unmap_range() with VM specific
backends.

No functional changes intended.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0f4e8b71fa85d..03f2017a7404a 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2436,12 +2436,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
+	if (!kvm->arch.mmu.pgt)
 		return false;
 
-	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
-			     (range->end - range->start) << PAGE_SHIFT,
-			     range->may_block);
+	kvm_stage2_unmap_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
+				(range->end - range->start) << PAGE_SHIFT,
+				range->may_block);
 
 	kvm_nested_s2_unmap(kvm, range->may_block);
 	return false;
-- 
2.43.0


