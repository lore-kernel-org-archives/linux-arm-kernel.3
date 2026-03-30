Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885121061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/7WPBVnn+wY3RGRDYoHmhcG//9P0CSZDRZXPby3zwo=; b=j51V+xAEUkNVHfd0urmKRyOWIM
	ub7OEAgXtzXwzf5PtXlcJXKUn85ewJbNukGK95G4oMU6iScGv+osoKut0/f7R/zSEUa8qC/otW8xn
	vZ6pFxaqNQagpRo6eMUw44fZ9itMDZpqQrN2KlEwXRUZIv1hDDIaSmXCn9nMr8APqH0EiDlL2N6pS
	GSzB41Vb4zht5X2983MRC28aqJvglemzAV+o+oDozSiGpLVSJ95dvrdUIwJM2pN6SHfAz7vHQpORP
	KBqdpQsyS4k9lI6HkuXQzbKaCmK0aXVGsJV2wDYApIZg1UI+qYCLR3RSL6Bydqef+zyiGXOxemmbf
	FLX0nH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DwR-0000000BTjf-2tEm;
	Mon, 30 Mar 2026 14:50:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dw7-0000000BTSR-2nlR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 166A260127;
	Mon, 30 Mar 2026 14:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5F9C4CEF7;
	Mon, 30 Mar 2026 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882190;
	bh=ogU9AKOUaT35sbK8mPxNvogWxla2rweipWB00VFORvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMnNL2WMe7uDe3uyNNKfnO/XpOcf0kPrt79ADkN5IDlQa6wWQUQF9RqZmcdffxIul
	 RyAKZWTuiCXPSrn1SXkekHEB9gMtK+lDJaaaa/0/BSvaYkL8jZRVaFmdJVrphYjrlr
	 6P2Xpi7UInitIaR7gB3gK/BH/79/thTyN4bW32/DohKGrWonmR3mp/qCi0h7uTThnL
	 kIhoX2qJqw03dSyGb6gkNpYMuTCWGVuDE6CRoO3k9PVCktqGwbAUD9UF3CibvtDtUb
	 uuZzGJXhmDh98tlEaRo3Nht1XkXpcstRTU1mTuVD5+upShfHP6giDgfX5/2AoSOrgP
	 kjJBlVsbTliLw==
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
Subject: [PATCH v5 18/38] KVM: arm64: Support translation faults in inject_host_exception()
Date: Mon, 30 Mar 2026 15:48:19 +0100
Message-ID: <20260330144841.26181-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


