Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2ECF33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTX+XsVEdQIPCTaCrgZ7V/0pUyrsR1VHYDEZh6DHHDI=; b=CrtkeJ0SoXeEvJdMJJSmLHWXKN
	8gi3E9in25f5U7d2IxprKysccuBY9nq/8BJHuzepHLsLPlinuuMqM8Te0SaTl3MogcE3XOKxE+XEx
	pF0+yakd6+nRQR/q8wTvY9bGom+8VwhR29I8zDrWBRSbJ+CuG6wbDZV59C1431H3We169bXkEkKYH
	e8kiEY0A95/1QyrJDuuiu9lAzaSK7zX+sJKZ1q/AIovWlpJK0sgRXZb4RI7MHO1kLtEgRi3XdVcKg
	MXDWvSmnnCW8StRUg/0IeA7TToPPPhrxGER577ZZxQ8zNJOZrYLWpKxz6xlYkvGjvQ+Pt0EjIFLUM
	OWzb5emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wv-000000021ro-145t;
	Thu, 05 Mar 2026 14:45:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9ws-000000021nd-1eUE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DAB043649;
	Thu,  5 Mar 2026 14:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A66EC2BC87;
	Thu,  5 Mar 2026 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721909;
	bh=lgKaBfTxFIy6N2O167IZSquC1rmS31Si+e9fbRSoKsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ecEBzHivkbW/XdgHW4XjT9kLf7wDDJI365WJwlJzybC7sj65qlFlEp5xbefcI/7Fp
	 vZ1yDF6raVusLrIxTh/fBEW7agzGGy2bNas4vt1oXLuj2WA1RNgM4a3MrY3b7a8lKH
	 4xwhFuCx/AlN+rVRkFGbkSuMKtGwoKsacUPRaGLNm8QKVFEiHj//ObHPgqSjUJhmYN
	 ivmvyp/hjco5uAvZbI2EPvtCou8Aco6n4PAn34F5OsSnj/5TwW7tsebjwqZmis9vcM
	 q0TuGoVwyNn0bRGIVByr/J1IaBObe6afbcIhOXXGhZy0dV2Jb0fHxsFhkvVQ7AuEJz
	 xI88bg6qc8czg==
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
Subject: [PATCH v3 17/36] KVM: arm64: Support translation faults in inject_host_exception()
Date: Thu,  5 Mar 2026 14:43:30 +0000
Message-ID: <20260305144351.17071-18-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064510_476985_25840658 
X-CRM114-Status: GOOD (  12.39  )
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
2.53.0.473.g4a7958ca14-goog


