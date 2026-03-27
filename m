Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3182810ED663
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MfeIHpZpAJ9rRDacy+nNlZvNtDMNG/sjtvRsZMUqdg=; b=m9HAlb4XTyB5o7yfXBBQ3wjulg
	QEX6eAPsbqhF8Pj1IZRXmPDPeQ9EMzdofAV/khDJNR/HPhvKIGtQYO/Esh0oQ4Ut/wsnliC73sjRT
	A4c9dzvHVaxo/N2fwU1ILx8DsQn0HvqpFBvMbN+9HeH295CLivTHNzemlF7R6uzAJ10CMsb9pSyf7
	BauYXEc3KAkuC92/MFWs4okzdvzq2cCFiTgSPuDKhEQWFn1V47yIx6q1bA2MgTdYdIf6YmlLG9hvY
	mJU3K3Omo/evbwRSIGfib40WmNZQYwZHaCfr7TRFW1AasetLevPzNt9YixkHOpGdBOhE8r3bUdaXW
	Ab0ybd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uh-00000007FQD-3RNe;
	Fri, 27 Mar 2026 11:36:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UM-00000007F78-0ZNj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78DA761870;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DDBC2BCB0;
	Fri, 27 Mar 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611389;
	bh=mw/ote3jncKQHaloT0cPobEmS1MkiecE/Mak5sizrCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ELMREghpzJwPnjJeWDcju2tK/yLMRR+/4RhMhlBC8wMCRqbr2Kpdy/C8VqQpYbirQ
	 kAftfrq5Njx+dwTJN85kaSmS37Q33aYwJ+Va4nKp1iDkCFOiVA7uiGY7Xe95Zk8RSl
	 0BNLa49DXw+9OGjfMLB4GLQdPTQgusTesTdfnyiozHTZe5A8r7MsQu+VtUWhT5L79y
	 d0a/XJR6RLDvUVPhE6C9kaT7At8hfeHNw2CQFFzPKK+RcwiZzKNdomTrAB9bhX8D7b
	 phKb+W/H7MuqMnGf6+3c6sQrtXKh80VjLU3btGPAGQP38ebt5rFmzriJnzYM/I3C5g
	 Z2mnJn65Ch5Sw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UJ-00000006K4a-0j10;
	Fri, 27 Mar 2026 11:36:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 21/30] KVM: arm64: Kill topup_memcache from kvm_s2_fault
Date: Fri, 27 Mar 2026 11:36:09 +0000
Message-ID: <20260327113618.4051534-22-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
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

The topup_memcache field can be easily replaced by the equivalent
conditions, and the resulting code is not much worse.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e8bda71e862b2..5b05caecdbd92 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1712,7 +1712,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 
 struct kvm_s2_fault {
 	bool writable;
-	bool topup_memcache;
 	bool mte_allowed;
 	bool is_vma_cacheable;
 	bool s2_force_noncacheable;
@@ -1983,9 +1982,8 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-		.topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
 	};
-	void *memcache;
+	void *memcache = NULL;
 	int ret;
 
 	/*
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
 	 * Let's check if we will get back a huge page backed by hugetlbfs, or
-- 
2.47.3


