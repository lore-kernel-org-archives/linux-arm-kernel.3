Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110EFCA5FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUG0dDHj/Zm5K5qiyoTo+dRTmDhIG43OjUhDi38YRoU=; b=jw7DxLCn6MbfG6e8c/JEkPK/a2
	VKpZn6GRSWcNeHNQOXZXNeUOwsLqzunim9NfPgFq068cdybJlsnYHIpK32PjmzsbGKMESvW9LlBmA
	2DQr08Cu52htvv3btnINN5uX17DscUy13vaCeFASh/GjVcZPTNY4hI85mGfJNqcUxRr6M1dQs8poq
	1oAEC8gj7nez99jGx2SXFa2Y8ZZUhmaS/ky8xkPnMsw/sr0YW+p7+kcwJ5HjSdGdFm+owmW5e4sWW
	+SwNLJMoTn9NUwNbzl/JehGkh7HAkNya3vXkbrZCxUQrT9fjsBCFkF3BN4W7yctkOKPcb/VpcAKIq
	ZYUXKQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy2I-00000006oWC-1OVf;
	Wed, 30 Sep 2026 17:24:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy21-00000006oPN-23ZF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IUG0dDHj/Zm5K5qiyoTo+dRTmDhIG43OjUhDi38YRoU=; b=ckS49AciGZE7H3V2WQ2RMLLYBL
	c/qG7a9ee9v4g8bSe/132Pe/8knvt8h2hvVG+FpdzQvECxxi9FcUoIludLAwMjTuBIoSk7qzxEael
	yU5rBvuWTCzsmPSXYJ4P+CGrWSaUnpr9zp6WzSF0Vi3RoLltbW4mr5vUoKRLiAiAH98OjUTajvfFm
	iee+LtbRIY7aPA6RepRj2eh3CTxnBauq+99ekUMNdMneBSThg19mg/n359Q7TBFRiOlevcWkLQT7I
	Zbiec5/6osMxPD2AeSDnNPdx57xtC1z9NXxfqWMHn55kj3b0NulRQXvJduTIfWp/BZzPWr9B78oVc
	2rUK3YdQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy1y-000000048N6-2fI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:23:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 904551596;
	Wed, 30 Sep 2026 10:23:40 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C33C3F86F;
	Wed, 30 Sep 2026 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790789024; bh=Hl+8S3N2mqoCQjLHJajTSd+0DIMoIu1+UBhREoQ7E5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0J2Ev4zxOvmeICuM6sr2SP/MNQJJAzkgT+mHgYrRrAM0xjPkd/j3G4KgK+8CWqOL
	 jpODEMDtc4lxLc1kvAIUYNLR3OGi4d7rwN1p2r+Qr2dVIF5v0+ygyVo/a2HtTKGmgY
	 yWVbrXH4eclnM6BEJE9zo36al3QFL8HSr2j7YRmU=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] KVM: arm64: Make stage2_split_walker() skip unnecessary walks
Date: Wed, 30 Sep 2026 18:22:23 +0100
Message-ID: <20260930172226.2459423-5-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930172226.2459423-2-leo.bras@arm.com>
References: <20260930172226.2459423-2-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=leo.bras@arm.com; h=from:subject; bh=Hl+8S3N2mqoCQjLHJajTSd+0DIMoIu1+UBhREoQ7E5E=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLL2uvqpX3YSb36wrWWSz+clXRLKsrEP3wU7Vp60fr4oN ehKaY5KRykLgxgXg6yYIovso/mreL5PyThy5ccCmDmsTCBDGLg4BWAi9QWMDEctfK7M+Mjfahge ps2/a0Vk0fw5flv3/InYPGdS4+e+5ysY/gcrXC6PvXsqKeCtstDvLUc0y5/Mr1S+1/jl+wwh5d0 PN/IBAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182346_893550_1A500AD7 
X-CRM114-Status: GOOD (  14.47  )
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

Currently, when splitting, all the child nodes will be walked, with the
walker just returning earlier if there is nothing to do. This means all
pagetable entries in the splitting range get a callback from the walker
function, even if it was a level-3 entry.

Optimize splitting by skipping all level-3 entries, as they are already the
smallest block size and can't be split any further.
(i.e. set flag KVM_PGTABLE_WALK_SKIP_LEVEL3)

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 80744478c810..f75cb666a103 100644
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


