Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC81CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rp/hxgid7n//dL/Qnp0sMD8HWsEaacoEAPKYgb7Ql4M=; b=sYp764ppfUdKlWAuxyenIdgRri
	h47JSum4ZPwiSdxV9BII1nT1+ibD7PnoYznT6TY+o8baV+DRnL819gOqO0C0cZkUmswFMOefnzTqR
	8+NKCGkthAwZtgAmbN3wWjZWz7zgRlnBijx9C7zJ8fBAb9o3YCtPmDgBdunUXeRsrwCdKY/uqhhJQ
	SORwUufb4FC10w6Oc0NyJb7X62F9AtnRAmZkzSFgP6qPuVzoYmnNJ8NUDodd+ry6BuoViya8iK5ZC
	VHzbjuIsaWBZ3kYCqKJlTpawfXcKP1BUt6gx4oqd4r3OmtrD8Su3c7GK4LwyQG1T5iKYMD0LqUjn5
	D1aLI4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPR0-00000008Jzv-3q4R;
	Wed, 10 Jun 2026 20:21:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPQy-00000008JzC-0UWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:21:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9161B35B9;
	Wed, 10 Jun 2026 13:21:49 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EADFE3FB7F;
	Wed, 10 Jun 2026 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781122914; bh=IoVLG3gZ7nVDc6fATHc768hV2/reoPfUmWuqYZJFMR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9wQZDDaXOfFEQRmNA/fXCEhydkwELhfIluY/ZhClXDn1AqP34kmnSpYTNnMq1VzH
	 w40XtsMg6ULcF69P84teX9O/NAmfJersWMtYFeCsNNKS04M1/LVXUEtJhUMoLdiIKu
	 KjpPml2M4o3wGci9o6tz1pGpwrto2PAD8kFLilJ0=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] KVM: arm64: Make stage2_split_walker() skip unnecessary walks
Date: Wed, 10 Jun 2026 21:21:09 +0100
Message-ID: <20260610202112.2695205-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610202112.2695205-2-leo.bras@arm.com>
References: <20260610202112.2695205-2-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355; i=leo.bras@arm.com; h=from:subject; bh=IoVLG3gZ7nVDc6fATHc768hV2/reoPfUmWuqYZJFMR0=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLI0j4sWfdpy2Pi+6GMZ5b6geZMdzXZJbWh0Dv0lc654b drOwnOtHaUsDGJcDLJiiiyyj+av4vk+JePIlR8LYOawMoEMYeDiFICJzOhmZFjP1HlrtkPg9wjB wtBVd9MY7zK27k79f4lVpXsuU9MPxcmMDHvljc7zNMjyH9p847jF75/NWYF6QQfS/I1sJ5z487j Ylg8A
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_132156_263247_0E1887E5 
X-CRM114-Status: GOOD (  13.28  )
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

Currently, when splitting a hugepage, all it's child and sibling nodes
will be walked, with the walker just returning earlier if there is nothing
to do. This means all pagetable entries in the splitting range get a
callback from the walker function, even if it was a level-3 entry.

Optimize splitting by skipping all level-3 entries, as they are already the
smallest block size and can't be split any further.
(i.e. set flag KVM_PGTABLE_WALK_SKIP_LEVEL3)

Optimization measured on two scenarios involving eager-splitting on a
VM with 1 memslot of 64GB:
- Scenario 1: No manual protect, whole memslot split at dirty-track enable
  (KVM_SET_USER_MEMORY_REGION2 ioctl with KVM_MEM_LOG_DIRTY_PAGES)
- Scenario 2: Manual protect, split happens during dirty-bit clean
  (KVM_CLEAR_DIRTY_LOG ioctl), average for 2 iterations.

Scenario 1, improvement on dirty-track enable for the memslot:
- Memory was already split (4k pages):  -35.47% runtime
- THP backed memory:                    -11.94% runtime
- 64x1GB hugetlb memory:                -14.46% runtime

Scenario 2, improvement on dirty-log clean for the memslot:
- Memory was already split (4k pages):  -26.36% runtime
- THP backed memory:                    -12.05% runtime
- 64x1GB hugetlb memory:                -13.87% runtime

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 48d88a290a53..70103934a04a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1565,21 +1565,22 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	new = kvm_init_table_pte(childp, mm_ops);
 	stage2_make_pte(ctx, new);
 	return 0;
 }
 
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			     struct kvm_mmu_memory_cache *mc)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= KVM_PGTABLE_WALK_LEAF |
+			  KVM_PGTABLE_WALK_SKIP_LEVEL3,
 		.arg	= mc,
 	};
 	int ret;
 
 	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
 	dsb(ishst);
 	return ret;
 }
 
 int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
-- 
2.54.0


