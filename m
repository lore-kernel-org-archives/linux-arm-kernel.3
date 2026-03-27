Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B5610ED67F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/7WPBVnn+wY3RGRDYoHmhcG//9P0CSZDRZXPby3zwo=; b=wEugRhdK4ImgHvs+PveJ+XqUGA
	J728MTQuGXsxmE19p70eqtiImuVa8hTWdLybBKHimCrpdmPCA2Veqo3aEIyISTmC15g7V7H2iSHd2
	QdXegKYBC3ZajQU3SrqjMFIHeHKLPfq3TphwPJdL8IJCST23uErTh7TyGpgsF5OsgKiFL4JDR8n8f
	baaT0wQ3koLYQ0IBbYExGbg5ivw9AyAn8GhcJyAn+E9UtoeKga6GpmIACXKYfHHvQHBxIFtilIhy6
	te91NyZI2qltBRb3jR659ysec4tIopZU2MCps/KdAzNqEHIDq0zz84egS3EJf3dwVN4bld8vCiDAW
	4KSktjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lY-00000007WVR-0zBC;
	Fri, 27 Mar 2026 14:02:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67l0-00000007W5C-3LaL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7542E40B74;
	Fri, 27 Mar 2026 14:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDE2C19423;
	Fri, 27 Mar 2026 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620110;
	bh=ogU9AKOUaT35sbK8mPxNvogWxla2rweipWB00VFORvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QuzuoHu8EK431FJ+O0z4daKXP3oZ1eqjPok8SWzcLR/Ddw8a6Ic7d/6w6FZPft9B0
	 R0EA+rbBcEHx/QzHIHbs2o6Tn0tNBXQ6K+K29duFGOi/FJKy2RjYD5rzvS/hek7Mft
	 FrxsWTj0IXiPR+kNPkPyhNDC6KXzICSBNO0g56uFwP+Qs2Os5OVa57gFj8uTH4HPfS
	 vpjBlWrHkLnmcdNrq3c61AEBdATwfPFogi988nFdL9PpTFp/QpVIXYlzCqqXpVhAGn
	 DCfsRomz3tELc/vVtapiolc2/vJmFQE7lbLjNoFafQoxfiB9t3w6r9RjNtXOj33i/S
	 PgFq9alspEJGw==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 18/38] KVM: arm64: Support translation faults in inject_host_exception()
Date: Fri, 27 Mar 2026 14:00:17 +0000
Message-ID: <20260327140039.21228-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070150_911250_151CD7FF 
X-CRM114-Status: GOOD (  12.00  )
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

Extend inject_host_exception() to support the injection of translation
faults on both the data and instruction side to 32-bit and 64-bit EL0
as well as 64-bit EL1. This will be used in a subsequent patch when
resolving an unhandled host stage-2 abort.

Cc: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/trap_handler.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c             | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
index ba5382c12787..32d7b7746e8e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
@@ -16,4 +16,6 @@
 				__always_unused int ___check_reg_ ## reg;	\
 				type name = (type)cpu_reg(ctxt, (reg))
 
+void inject_host_exception(u64 esr);
+
 #endif /* __ARM64_KVM_NVHE_TRAP_HANDLER_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index adfc0bc15398..6db5aebd92dc 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -705,15 +705,24 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	kvm_skip_host_instr();
 }
 
-static void inject_host_exception(u64 esr)
+void inject_host_exception(u64 esr)
 {
 	u64 sctlr, spsr_el1, spsr_el2, exc_offset = except_type_sync;
 	const u64 spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT |
 			      PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
 
-	exc_offset += CURRENT_EL_SP_ELx_VECTOR;
-
 	spsr_el1 = spsr_el2 = read_sysreg_el2(SYS_SPSR);
+	switch (spsr_el1 & (PSR_MODE_MASK | PSR_MODE32_BIT)) {
+	case PSR_MODE_EL0t:
+		exc_offset += LOWER_EL_AArch64_VECTOR;
+		break;
+	case PSR_MODE_EL0t | PSR_MODE32_BIT:
+		exc_offset += LOWER_EL_AArch32_VECTOR;
+		break;
+	default:
+		exc_offset += CURRENT_EL_SP_ELx_VECTOR;
+	}
+
 	spsr_el2 &= spsr_mask;
 	spsr_el2 |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
 		    PSR_MODE_EL1h;
@@ -728,6 +737,9 @@ static void inject_host_exception(u64 esr)
 	if (system_supports_mte())
 		spsr_el2 |= PSR_TCO_BIT;
 
+	if (esr_fsc_is_translation_fault(esr))
+		write_sysreg_el1(read_sysreg_el2(SYS_FAR), SYS_FAR);
+
 	write_sysreg_el1(esr, SYS_ESR);
 	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
 	write_sysreg_el1(spsr_el1, SYS_SPSR);
-- 
2.53.0.1018.g2bb0e51243-goog


