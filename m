Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537C3CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27eGtMV/VL4SJZrnEukuEHZvKKeCvPLD9+eyEw2LS6o=; b=42rOM5at/C68D4a7NNgtCidy+0
	7rSxWFD+WGzp3dRO83qTofanPkQCqcKIX2x8aPcbR+uAsUL/nTu2XnDdyeZfX7jOZs9mXY5uMApJb
	Kz3XcqNnXLOgiyVW3/h3UKQ7BnowkLdrQ2QjZARwtjNlE1R5c6YV5nHUkkjID5u7UFiNe/jquZolB
	xY4QPSby9QZkFAvn+CDbpAOgqA/GUkRzNDUSH3rk6pqmMx2CErxEOgk/zvhRvc1Zro82SVNRHFRZy
	+GlIqMQhA419wydZxsHSlsdjUya9ox5bPeS61I0lRckv0LPCAaaj1dQFh4Aj9jLFvRXEMoAjAkEbl
	mcxfIIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ2J-000000084Zf-123M;
	Wed, 24 Jun 2026 16:01:11 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ2G-000000084UW-0GkU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 16:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782316858;
	bh=27eGtMV/VL4SJZrnEukuEHZvKKeCvPLD9+eyEw2LS6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUupqmcoxFOZW7w6cbF6SS8jwwQVbWz+gOcb+zEcrheYM8cxFDxmlaSDvetRxD6gA
	 C4m86f7RlFKMS0F/wAbs3M5QSyJorsWGRGkbyh9RLhtvKyGfEEv5GseZfFQGR3FViS
	 0rcjZNYlsNCtqCAfHj+7bJavfoVXBHiBzmV/g3hI=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glmrB4K0Gz10v5;
	Wed, 24 Jun 2026 16:00:58 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glmr813dGz10v2;
	Wed, 24 Jun 2026 16:00:56 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] KVM: arm64: top up stage 2 memcache for dirty logging faults
Date: Wed, 24 Jun 2026 16:00:28 +0000
Message-ID: <20260624160028.15591-4-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624160028.15591-1-include@grrlz.net>
References: <20260624160028.15591-1-include@grrlz.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_090108_277699_CE3D1E75 
X-CRM114-Status: GOOD (  15.18  )
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

Dirty logging forces new stage 2 mappings down to page size, but
it does not always remove an existing block mapping before the next
fault. Eager splitting is best effort and is disabled by default.

A permission fault on such a block can still need a page table page
to install the smaller mapping. Top up the memcache for any permission
fault while dirty logging is active, not only for write faults.

The issue was discovered [1] by Sashiko.

Link: https://lore.kernel.org/all/59984F6D-06F2-4302-BDD7-92DF334E8FA0@grrlz.net/T/#t [1]

Fixes: 6f745f1bb5bf ("KVM: arm64: Convert user_mem_abort() to generic page-table API")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kvm/mmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 3f57f6825a33..8911e319e6fa 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2122,13 +2122,12 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
 	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table. With
-	 * pKVM, they may still need a fresh mapping object if the fault turns
-	 * page entries into a block entry.
+	 * and a fault needs to collapse a block entry into a table. With pKVM,
+	 * they may still need a fresh mapping object if the fault turns page
+	 * entries into a block entry.
 	 */
 	memcache = get_mmu_memcache(s2fd->vcpu);
-	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
-			    kvm_is_write_fault(s2fd->vcpu))) {
+	if (!perm_fault || memslot_is_logging(s2fd->memslot)) {
 		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
 		if (ret)
 			return ret;
-- 
2.53.0


