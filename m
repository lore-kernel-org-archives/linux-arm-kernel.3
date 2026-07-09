Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A95C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+WyHlE4oxu8xuOxQGOIEBY4bo4OikBdt2+d9yKecQo=; b=VFl0liFlLpHaCX/cZzAh7NJptX
	41DvPcm4akA76wb0V3oWZEwj6qJsMbJzwPzG2xJX2ZX7Xsrgz4/FTkWWC0N5F7I5BnAP1vymN4kx+
	xjn550zxPGWI2+iC+ioAZx356ONA6tIlf/EaAuz9mnJWmtGuUDNX2IrR7jgdAhypbUA5xXkgsD4L+
	fcYMoMtZeTQ0baj8VPMcHn3/A0vLzVk2si57sceJeuIeHZXpYGw9yjqjiJt67d+mT9sl6wJzC0GQE
	y95qhtxZG7jIQHSPps07gegnMNIhXBajUSOL/XAiYx8CznfrydTnAGlrylWWZN4Qv/vleiOW28ld+
	b/l3D73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxN5-00000003o4q-3jqL;
	Thu, 09 Jul 2026 22:37:31 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMu-00000003nxc-3SaJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:22 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-4413ecf22a0so215070fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636639; x=1784241439; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+WyHlE4oxu8xuOxQGOIEBY4bo4OikBdt2+d9yKecQo=;
        b=RkUmhS85wX8qQQ2qLGF2Cp/rv2X+QDl4zf3xRDZnF7EL+pVj74BKN9Gft+RwQSS4II
         bsIBKPFKWHUd2vUS6ibPJRl4MmfYeEaUV6I8qrbLy4aeM7xZzu540CgkEWDybEyfkGl9
         jeO1ZP3vUaaNrorIwIvtY0C/U7YmT0xMzPnF7OPA2Rhoa7FAnQouAoQnG5Y8CInb5cpt
         WMp9Yq+LfjMElpuwdNe2UKZDN4vRUT5ykRDOIE2kHvCvAkK7wgBXcMmDlg7jUoiIup8u
         6xODbB/Y3l8YG767BM7f7knaFjOTIqcAS/80QGxDEAi2UGgYv1ybuGvU9SRYtrA1A+UK
         LMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636639; x=1784241439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+WyHlE4oxu8xuOxQGOIEBY4bo4OikBdt2+d9yKecQo=;
        b=fYW7lySpTyyK02WFWb7G8M0z3Pr8jYvSnNu5HSrkGfp32IrF0uDPSa2c9XwxYc6npM
         0mNOjSL62zy+AYTPIgXjvcL5n9ycLIVeA17dhXeJpihZyl8iWVs/fw399byYHazCPr6r
         xvDuEYet25l7apSJGuQUAsSM2jUlltfg5mCBEq+yZe84MsKqIY7WhT7CzVM9RlrCRF2E
         FDXpHeHuxzuBkcr5HloKybPyj9YZNQuryutX1HCq9a4Mw25SwoIOus9a3VpuCGYDnL4L
         SKpraJMiLGWg+FcJ/yVp1ZdGVNXylmVtCxLx3HhLsGpAokKLpkTeIW1l59JX4XlkCZ/2
         oW9A==
X-Forwarded-Encrypted: i=1; AFNElJ+kseXo9TLOj2GULbM3TR9qicx30gIwU+yatrjRWiCgtkQ7l7THjb4R9VS4GaQ1hurkNg0fRNRbe0hgEPXZyj9d@lists.infradead.org
X-Gm-Message-State: AOJu0YwquLAmVuiMlp5Pp/UaOlsnjePBa9Y+Y6iaeJQGAvvkCs6zcMcX
	VhISlhrX1YsaX84AMrpuTdqWBGkbAGr5Xxo/XGjS9HYg59JxKUFEyHmYEg5QHo1DYl3hIVbnwix
	YxvCzSztg2ulimMOcvEP6OQ0fwA==
X-Received: from jabms16-n1.prod.google.com ([2002:a05:6638:e050:10b0:5e7:2c1b:b294])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4d01:b0:4a3:2bd1:5218 with SMTP id 5614622812f47-4a32bd160fdmr4018778b6e.20.1783636638778;
 Thu, 09 Jul 2026 15:37:18 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:36:02 +0000
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260709223604.12934-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-6-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 5/6] KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ben Horgan <ben.horgan@arm.com>, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_153720_874629_8613D62A 
X-CRM114-Status: GOOD (  15.91  )
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

[ Upstream commit 3855a7b91d42ebf3513b7ccffc44807274978b3d ]

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
Reviewed-by: Leo Yan <leo.yan@arm.com>
Link: https://lore.kernel.org/r/20250227180526.1204723-3-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[ Backport: Resolved context conflicts when removing the
  __init_el2_nvhe_prepare_eret macro and invocation:
  - arch/arm64/include/asm/el2_setup.h: conflicted because 6.6.y lacks later
    GCS/MPAM macros (__init_el2_gcs / __init_el2_mpam) surrounding the definition.
  - arch/arm64/kvm/hyp/nvhe/hyp-init.S: conflicted because __kvm_init_el2_state
    does not exist in 6.6.y (EL2 state is initialized inline). ]
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/el2_setup.h   | 4 ----
 arch/arm64/kernel/head.S             | 3 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 1 -
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 3 +++
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 3498dc5d02c18..76b0d50d286d5 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -229,10 +229,6 @@
 .Lskip_fgt_\@:
 .endm
 
-.macro __init_el2_nvhe_prepare_eret
-	mov	x0, #INIT_PSTATE_EL1
-	msr	spsr_el2, x0
-.endm
 
 /**
  * Initialize EL2 registers to sane values. This should be called early on all
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ff7769821166a..9996029853d23 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -601,7 +601,8 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	msr	sctlr_el1, x1
 	mov	x2, xzr
 3:
-	__init_el2_nvhe_prepare_eret
+	mov	x0, #INIT_PSTATE_EL1
+	msr	spsr_el2, x0
 
 	mov	w0, #BOOT_CPU_MODE_EL2
 	orr	x0, x0, x2
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 3efa9cfaa9d48..9b2ada54be538 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -207,7 +207,6 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 	/* Initialize EL2 CPU state to sane values. */
 	init_el2_state				// Clobbers x0..x2
 	finalise_el2_state
-	__init_el2_nvhe_prepare_eret
 
 	/* Enable MMU, set vectors and stack. */
 	mov	x0, x28
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index d57bcb6ab94d2..5688a16e2ea75 100644
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
2.55.0.795.g602f6c329a-goog


