Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F791CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NQrLbjTkAkkBdVm1JiOinsPV3ynzSkm/zG4HsiaqKA=; b=3PjHA+uExulm6bxTlcqpEjQiDg
	34e9MX6akNpSOywTbSEEiRMMgavBLqneJqIocL/cBIdk6zwFh2gVxTASHujfn2jwWbaTvklIgPeke
	YjbDxaJXrzv+EztWaQPYXyOFLeIbW/C+VTqkGPIQFUS+Irf74BynU2z/rjT8PiWEh3wD3Rd25g0y0
	hZY1mh46jszPdONP9k66VC3zepEOHaNAovfKFurWY85YZGpCDhN57f/+JOKuXYP3HPyphRsZCwu3l
	Aqht5a78wHQNzPKZD3MBc6REzYUFfqmoeMOfVLas5J0laNH2CuntSWkoNo1uHhE6DE1GbDNCWUpET
	aMihfAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCaH-00000001Kui-3ZZg;
	Thu, 18 Jun 2026 13:15:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCaF-00000001Ktd-0okG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:15:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D93E5293B;
	Thu, 18 Jun 2026 06:14:56 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D68D33F915;
	Thu, 18 Jun 2026 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781788501; bh=dUkILoZJI/RNijTUFLYa3jizknsO8qivApkZa+N0csA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8tUGLH8YhHfADsJHrnePcrz5Icl6qNns8+brYjstpiJKFsDznyqPtCh/QY7zQvgA
	 TfjaTNLe7alu0fMbDYk8GpgAXaFROIZwTN+d/FzDE+T98YZcoOZd1QVabGPi8ajO8o
	 g0ohSiHbmGH8xGPT1rlUb6Xu3royOpz9zofNBPcw=
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
Subject: [PATCH v2 1/3] KVM: arm64: Avoid re-testing walk_continue
Date: Thu, 18 Jun 2026 14:14:42 +0100
Message-ID: <20260618131447.764085-2-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618131447.764085-1-leo.bras@arm.com>
References: <20260618131447.764085-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=leo.bras@arm.com; h=from:subject; bh=dUkILoZJI/RNijTUFLYa3jizknsO8qivApkZa+N0csA=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKM3/E+lNK5GLfeielSyew/U2uiov+sP3zgXmHICtHFC +wn7nA83VHKwiDGxSArpsgi+2j+Kp7vUzKOXPmxAGYOKxPIEAYuTgGYSPE1ht9slcImp/1/Tui4 xZ3nyPlzy5dDLkznlPmXXe/Xmd37XHAOw1+peavy3VrerpZmPukR2MT1mkfP0ibWqu7qjDNftA5 cuskCAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_061503_278360_F5D4C1E7 
X-CRM114-Status: GOOD (  12.70  )
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

In __kvm_pgtable_visit(), a couple tests for kvm_pgtable_walk_continue()
will 'goto out' if it should not continue. This means the same test will be
ran again before returning ret, which is unnecessary.

Return ret directly instead.
This will simplify next patch.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 91a7dfad6686..4be1d51a6ac5 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -183,32 +183,32 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	 * Reload the page table after invoking the walker callback for leaf
 	 * entries or after pre-order traversal, to allow the walker to descend
 	 * into a newly installed or replaced table.
 	 */
 	if (reload) {
 		ctx.old = READ_ONCE(*ptep);
 		table = kvm_pte_table(ctx.old, level);
 	}
 
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
-		goto out;
+		return ret;
 
 	if (!table) {
 		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
 		data->addr += kvm_granule_size(level);
 		goto out;
 	}
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
-		goto out;
+		return ret;
 
 	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
 		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
 
 out:
 	if (kvm_pgtable_walk_continue(data->walker, ret))
 		return 0;
 
 	return ret;
 }
-- 
2.54.0


