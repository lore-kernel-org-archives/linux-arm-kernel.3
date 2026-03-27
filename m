Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C15E10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mp2XZ44ArE2N+A34q6saPAs4MxbSZABfVjPs+dCqHZU=; b=1FHCnHElObetnXsvNyPLbEmu0x
	hoqZcfoVq/2khttM0QaP79KfO+k+4LzTO/BA0LgB48HOPO3EqDPbHFsDxWaMGKweuI6NmByztH9/0
	hncA3707akzH/rMp+OZy10uysahuoR8AM6+qUcAJ3zdQ+7QqOP4lF32gi29IlWiRHy5lkLU+3nLvl
	8M38Be134YdN5o1K1dki/00wemjxTOBOpRiXm1PR2opcF2W2HSCihhNTWrJvK8lppbzXf4LXL27+I
	2kqOeIq6phXI+J0291l0ymeSta1rr6fouGhiZ72jKfjh2KdNaQwkvTCYY1SNud58og910Ktldzfon
	Coc8GbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uj-00000007FUZ-49dH;
	Fri, 27 Mar 2026 11:36:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UL-00000007F65-1Rk6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAE734474D;
	Fri, 27 Mar 2026 11:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADA5C2BCB4;
	Fri, 27 Mar 2026 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611388;
	bh=pcTTqXh84ObMi4KJgCftkIiV8Pxu0ISQSHYAz2k5qWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hyk0+NtPqOLQBCBqCXv5demBO7JBU8d55d9l+lfzA8ZouS9t+aCbouKq2Lgv5i8u9
	 dnbwOYiA5GPbmVpU24qEox8JCZNLNqLVZpL8Ay7D4hrYl/qY4IxYtKa9D+dpBhosKv
	 +Bx6iK7WPlVym+wPDwGTzwfN5kNweeTWbp/8M4vhQQKjEn185mR7G/hX4LDEe83Eif
	 AX38z/ehbtTaOzR0BO5kzphRaM5KWIHMBcvGbYSv4tgWpmapUy356LhMaUY7KwxOBP
	 u7/lmJIkC/BM4os/IrB4C3mBH1pGCszUfwIAXuIlrWaLSz6+xG5i+R4xuB4xsifh2H
	 deYTCGfCsJCgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UI-00000006K4a-3yOs;
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
Subject: [PATCH v2 20/30] KVM: arm64: Kill exec_fault from kvm_s2_fault
Date: Fri, 27 Mar 2026 11:36:08 +0000
Message-ID: <20260327113618.4051534-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043629_491544_EE09B198 
X-CRM114-Status: GOOD (  11.25  )
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

Similarly to write_fault, exec_fault can be advantageously replaced
by the kvm_vcpu_trap_is_exec_fault() predicate where needed.

Another one bites the dust...

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7dab0c3faa5bf..e8bda71e862b2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1711,7 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 }
 
 struct kvm_s2_fault {
-	bool exec_fault;
 	bool writable;
 	bool topup_memcache;
 	bool mte_allowed;
@@ -1857,7 +1856,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 		fault->writable = false;
 	}
 
-	if (fault->exec_fault && fault->s2_force_noncacheable)
+	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
 		return -ENOEXEC;
 
 	/*
@@ -1877,7 +1876,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (fault->writable)
 		fault->prot |= KVM_PGTABLE_PROT_W;
 
-	if (fault->exec_fault)
+	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
 	if (fault->s2_force_noncacheable)
@@ -1984,7 +1983,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
 		.topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
 	};
 	void *memcache;
-- 
2.47.3


