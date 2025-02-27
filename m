Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D7C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcxp82QURhRN2PSj+DhryD+btNtg06otT1ZvrAw5SxI=; b=OKzALAyFV1gi+HG1zsLLTSyHoq
	ROzzdiRxQLaK6cylm9ZB0E8AtyJIFFicoReCbBa2VLhwS3vYrbMfm5uohZg/DcBAel3twZ3rAw+4k
	HnBXjSNU/ygg63A4xmGZ5mmvwZMXA7Pe/ce9Qj+gtgnm20qWOyXaCiuX/bgSBCvhiYNTWdtj/ZwB6
	Dq95ENPAWitqKmQktR+1QGR/asqSpn7jBknJDTeTltq4nJitWKhWKXrBxWsFGB8w4VPPwfbqzwBAs
	+Ewk+RPeML5Nn+N1r2akTk2PqtrxZ92koB2wMUp4QlkGrJrwut2ffu1sfksQarnDSNtRqm9CzBWw/
	kTYN+46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlh-00000008cB7-2c5R;
	Thu, 27 Feb 2025 19:42:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tniGb-00000008H2s-06TR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:05:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100C91688;
	Thu, 27 Feb 2025 10:06:02 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD6AF3F5A1;
	Thu, 27 Feb 2025 10:05:44 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ahmed.genidi@arm.com,
	ben.horgan@arm.com,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	leo.yan@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	will@kernel.org
Subject: [PATCH 2/2] KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
Date: Thu, 27 Feb 2025 18:05:26 +0000
Message-Id: <20250227180526.1204723-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250227180526.1204723-1-mark.rutland@arm.com>
References: <20250227180526.1204723-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_100549_159294_60A5AED1 
X-CRM114-Status: GOOD (  12.75  )
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

From: Ahmed Genidi <ahmed.genidi@arm.com>

When KVM is in protected mode, host calls to PSCI are proxied via EL2,
and cold entries from CPU_ON, CPU_SUSPEND, and SYSTEM_SUSPEND bounce
through __kvm_hyp_init_cpu() at EL2 before entering the host kernel's
entry point at EL1. While __kvm_hyp_init_cpu() initializes SPSR_EL2 for
the exception return to EL1, it does not initialize SCTLR_EL1.

Due to this, it's possible to enter EL1 with SCTLR_EL1 in an UNKNOWN
state. In practice this has been seen to result in kernel crashes after
CPU_ON as a result of SCTLR_EL1.M being 1 in violation of the initial
core configuration specified by PSCI.

Fix this by initializing SCTLR_EL1 for cold entry to the host kernel.
As it's necessary to write to SCTLR_EL12 in VHE mode, this
initialization is moved into __kvm_host_psci_cpu_entry() where we can
use write_sysreg_el1().

The remnants of the '__init_el2_nvhe_prepare_eret' macro are folded into
its only caller, as this is clearer than having the macro.

Fixes: cdf367192766ad11 ("KVM: arm64: Intercept host's CPU_ON SMCs")
Reported-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Ahmed Genidi <ahmed.genidi@arm.com>
[ Mark: clarify commit message, handle E2H, move to C, remove macro ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ahmed Genidi <ahmed.genidi@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h   | 5 -----
 arch/arm64/kernel/head.S             | 3 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 2 --
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 3 +++
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index bc8ebd55788ac..7774aec91027e 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -270,11 +270,6 @@
 .Lskip_gcs_\@:
 .endm
 
-.macro __init_el2_nvhe_prepare_eret
-	mov	x0, #INIT_PSTATE_EL1
-	msr	spsr_el2, x0
-.endm
-
 .macro __init_el2_mpam
 	/* Memory Partitioning And Monitoring: disable EL2 traps */
 	mrs	x1, id_aa64pfr0_el1
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 2d56459d6c94c..2ce73525de2c9 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -322,7 +322,8 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	msr	sctlr_el1, x1
 	mov	x2, xzr
 3:
-	__init_el2_nvhe_prepare_eret
+	mov	x0, #INIT_PSTATE_EL1
+	msr	spsr_el2, x0
 
 	mov	w0, #BOOT_CPU_MODE_EL2
 	orr	x0, x0, x2
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 3fb5504a7d7fc..f8af11189572f 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -214,8 +214,6 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 
 	bl	__kvm_init_el2_state
 
-	__init_el2_nvhe_prepare_eret
-
 	/* Enable MMU, set vectors and stack. */
 	mov	x0, x28
 	bl	___kvm_hyp_init			// Clobbers x0..x2
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index 9c2ce1e0e99a5..c3e196fb8b18f 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -218,6 +218,9 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	if (is_cpu_on)
 		release_boot_args(boot_args);
 
+	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
+	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
+
 	__host_enter(host_ctxt);
 }
 
-- 
2.30.2


