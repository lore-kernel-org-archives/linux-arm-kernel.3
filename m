Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F82FC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 10:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqHXjcVnGTBQ1bsrr/Fc3iQEP7fL/Kd/ZHlhsq2jKSg=; b=1civL+1uG3FlCYH9/CLFV3+FRM
	nNNxjq1z2NpwvWelWt4WKYgxYtHp5HgDDdAhSckHAvgV6aQ7m64JT5NroLApRhzxToy0OgWFBrqrn
	MeLyJZIPqynXVYTIKE7Z0PJOIqkdmsd9CurbWh0AZqwfd48z1D5ShnXG9BpfbTtTJZCPSbXB0wn5j
	mHXzcmwLxjoVCL2hCDnAUGctX8dMYUenhqOCyUKD6PklNm8ERq+S8ZTk+IhtXpDUrZj/oSp9m9JbC
	qpd8/RXx14fm//eAHcobt/F9O0fIlyOMX1qscm0zdsJPT+RQA2N4f/BwEyVPslJxB7dyLm0nKyYOc
	is/0hmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHo-00000000nYa-2xQh;
	Sat, 12 Sep 2026 10:48:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHm-00000000nXp-3hMe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 10:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13E70601F1;
	Sat, 12 Sep 2026 10:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1011F00893;
	Sat, 12 Sep 2026 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789210121;
	bh=lqHXjcVnGTBQ1bsrr/Fc3iQEP7fL/Kd/ZHlhsq2jKSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UPQn6Hk6L3XaClKSjURgEoqrzMQxg8Ho2mk3WOjlxjxGmQ59sKFnZoJSjkHUd+jz8
	 9pdsbnlYCEb10NKeAGJT4kAaYB1RyP1qhbodrWOe3gedlMiUNDtIj8JiSYM9UW8n3K
	 nCmrXQcpm7hiNFMq50vduLY1Md3rfv3s+/nQIm0ycxexwlkOh1Ui17eLmrYzT6Ya/I
	 6Dla2iiHgt0QOp5QjKRdXphpfDtMo74GR+H6gnFrLAHDGp4isH/mSRq4m+HbU/Xj/W
	 e7houfmX///x78aoEotAVDauvlgq7ENdNeuSGZ4nsW/pM3PtH4MFVHzEMwzq1b6kqA
	 V43vbULHFVyuQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x5LHj-000000084hK-3oow;
	Sat, 12 Sep 2026 10:48:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 2/4] KVM: arm64: MMU: Add kvm_stage2_unmap_all() helper
Date: Sat, 12 Sep 2026 11:48:32 +0100
Message-ID: <20260912104834.3093878-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260912104834.3093878-1-maz@kernel.org>
References: <20260912104834.3093878-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, weilin.chang@arm.com, wanghan@linux.alibaba.com, xueshuai@linux.alibaba.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Build on top of kvm_pgtable_stage2_unmap_notlbi() to provide a primitive
tearing down a whole Stage-2 MMU and invalidating the corresponding TLBs
by VMID, which is far more efficient than performing range invalidation
(or even worse, single mappings).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_mmu.h |  1 +
 arch/arm64/kvm/mmu.c             | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6eae7e7e2a684..f450557d4b7b3 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -171,6 +171,7 @@ void __init free_hyp_pgds(void);
 
 void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 			    u64 size, bool may_block);
+void kvm_stage2_unmap_all(struct kvm_s2_mmu *mmu, bool may_block);
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end);
 void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4af..68bfd09870b76 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -346,6 +346,21 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 	__unmap_stage2_range(mmu, start, size, may_block);
 }
 
+void kvm_stage2_unmap_all(struct kvm_s2_mmu *mmu, bool may_block)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+
+	if (kvm_vm_is_protected(kvm))
+		return;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+	WARN_ON(stage2_apply_range(mmu, 0, kvm_phys_size(mmu),
+				   KVM_PGT_FN(kvm_pgtable_stage2_unmap_notlbi),
+				   may_block));
+
+	kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+}
+
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
 {
 	stage2_apply_range_resched(mmu, addr, end, KVM_PGT_FN(kvm_pgtable_stage2_flush));
-- 
2.47.3


