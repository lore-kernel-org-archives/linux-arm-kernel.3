Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuUzMa9ju3F/0+HO/R2Y6ef+6Qfy2WrAW6u6EpXOAHU=; b=MCmgwi1KVBiOsAEHj9PcAcx8/8
	Q2hBlShE2QT3H8M5/G9HMDCF5ZJobcwWp+njd8so/chIFCNDO1pI94NMltYgs44fWDZijCXm/mdtL
	siWoHWvM1AH7AxD1pQbrqtn83fUOs1X05rWmFTceIde0Kr4J74sd4FKAYLhQL5WW38iQTMI5qAuWo
	Og9f9nCADQs8+nAFbnpWTHCPtqMOMbdf4J+cm1e0/3WBeOI5VnYRrO4E/X4hXk967DV+aSv4SYM85
	VxB2rjZUOlvUWjPSEfotejA0JgE9xn/ppE5YW0KCgUPFQd4gBUJAHAv8Hb3vH3PM2azs+X2bbfc3P
	pDj8jKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSWh-0000000HCrz-3QED;
	Wed, 08 Jul 2026 13:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSWb-0000000HCpj-3Mtj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 13:41:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07F31D14;
	Wed,  8 Jul 2026 06:41:12 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D4C03F915;
	Wed,  8 Jul 2026 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783518077; bh=37qsuxHn+9a5WP4Y016vE3e5beoR08skROVo25BsKcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tmKAQl+tmvRMJvGOtuZsqalTjyELWpJrQ7fCdlCI5WM5t4IBoNVeyqiJnjLtoD/gV
	 ZhW8W2iFTWBStDKW8L0xNXYOoPiJnJfBp/k3JzQl84DF4yexqXvx0nKaBf8NkApfdA
	 xDoI2a2fvKCAD8AterddJutiMZY/4BD2cgVh8KKA=
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
Subject: [PATCH v3 3/3] KVM: arm64: Make stage2_split_walker() skip unnecessary walks
Date: Wed,  8 Jul 2026 14:40:59 +0100
Message-ID: <20260708134101.2514759-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708134101.2514759-1-leo.bras@arm.com>
References: <20260708134101.2514759-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=leo.bras@arm.com; h=from:subject; bh=37qsuxHn+9a5WP4Y016vE3e5beoR08skROVo25BsKcs=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLL8/Gf5c+u87Fk/a3He2eJH4Wq7UqL8d35P8koy/nPs7 H3f45t1O0pZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQATUbvJ8D/dnMM1SU1J+Wu/ /X1t9eyttkldnOpOvOEcrg8VWKOLFjP8d8wQvXDBh7FpQ4feQptt5xrOGGdf387V3bRtx/4Ziu+ cmQA=
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_064117_918495_04141110 
X-CRM114-Status: GOOD (  13.74  )
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

Currently, when splitting, all the child and sibling nodes will be walked,
with the walker just returning earlier if there is nothing to do. This
means all pagetable entries in the splitting range get a callback from the
walker function, even if it was a level-3 entry.

Optimize splitting by skipping all level-3 entries, as they are already the
smallest block size and can't be split any further.
(i.e. set flag KVM_PGTABLE_WALK_SKIP_LEVEL3)

Optimization measured on a 64GB VM, with eager splitting, no manual protect
(splitting all memory at once on dirty-track enalble):
- Memory was already split (4k pages):  -97.33% runtime (-172ms) - 20 runs
- THP backed memory:                    -19.82% runtime (-153ms) - 10 runs
- 64x1GB hugetlb memory:                -20.65% runtime (-150ms) - 10 runs

kvm_mmu_split_huge_pages called in
	kvm_clear_dirty_log_protect() - manual - 64-page granularity
	kvm_mmu_split_memory_region() - no manual - all memory

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b9a2078efc51..9ae4d9d7ed56 100644
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
2.55.0


