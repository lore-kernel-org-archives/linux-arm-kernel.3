Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B868F53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXl/MjJNGRwsoGFVyJ2Pf41NztlE1yOSwIXZL0U4rzc=; b=IITEF36c5O4ztGLeeNVDjbTzsv
	6AU04D0eYXO32Zj39ZoQy/X5/X70WkPNKeAe4li6k77R4xw7HAr4erGlgquQV44s5WoACGhRUioY1
	ixBfGq4LUbvYJTYxftVEuk5uhD0VUzHvf1YvIcDCy4A51TwhuGAxVJa0NWhpNaKx2Eg0VANvYX2Xi
	rDE6XUGhf1M+KoXh7GAXtm0GLJuKrOJgHnFdcH+uB8urv02ZkYuNTh7PtkyXkvw0f2FjImwPBAHG5
	xJ1kqOFta85iNfVGYRulNGZwBFmiUERUopNAGhTGGBJpKEuNiNVAzIzHpXpe6r9cIJRrN4jomqtzR
	RO07GZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9n-00000004cpn-0fCx;
	Mon, 16 Mar 2026 17:55:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9f-00000004cjn-3b4M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 082CE4438B;
	Mon, 16 Mar 2026 17:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17ADC4AF09;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683702;
	bh=mi4o7VJwjJ7mCXjGkRr0+qnth9Sye75ortbEYQO/k/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=as0uQIopz2uqNw2ogQDOhJhgE9uDwUL17b8/+VRB6h3Kr7qDL5gjhtEFtRugyBx0l
	 w043z5d79Uri6ia+iOtZ3XwNYns43ClBGFU9JYxIImEFMKuIrSzcSi3hPq6IGo5kna
	 0zLXi4zVlitLQtjlXgTYKAKnmzKoYgjAr+BHzAlOvfEfB+ee6GuUE2zVrCD/78bkMX
	 n2Lx9HJW3XrfOR/ErUMu90FfgV+FPerOEyd0oqWRrO+xwqywKLPGXoqcSdb+4zdeRF
	 8Lts5w4S31ya1+4jUOrpmFfM4AxyiMLLllmvDslfy777rF/vKHojM7RHro420n8gZ2
	 kX2d4dPnTlyew==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9d-00000002XDx-0OnR;
	Mon, 16 Mar 2026 17:55:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 08/17] KVM: arm64: Kill topup_memcache from kvm_s2_fault
Date: Mon, 16 Mar 2026 17:54:41 +0000
Message-ID: <20260316175451.1866175-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
References: <20260316175451.1866175-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_105503_938088_4D280D4D 
X-CRM114-Status: GOOD (  13.49  )
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

The topup_memcache field can be easily replaced by the equivalent
conditions, and the resulting code is not much worse.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 11820e39ad8e1..abe239752c696 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1712,7 +1712,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 
 struct kvm_s2_fault {
 	bool writable;
-	bool topup_memcache;
 	bool mte_allowed;
 	bool is_vma_cacheable;
 	bool s2_force_noncacheable;
@@ -1983,7 +1982,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-		.topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
 	};
 	void *memcache;
 	int ret;
@@ -1994,9 +1992,11 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * only exception to this is when dirty logging is enabled at runtime
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
-	ret = prepare_mmu_memcache(s2fd->vcpu, fault.topup_memcache, &memcache);
-	if (ret)
-		return ret;
+	if (!perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu))) {
+		ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
-- 
2.47.3


