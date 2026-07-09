Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ty5ADPWIKqd8Px0gGtRTP0jl6mErohylK4VL5tgWduw=; b=DNmEFsaZYwmx9sqVoMxnikhaV0
	0Yck24RVdyiM674lPMd1Fpc2R7/RWfjy6xtaB1IPy2f3ZCZbY/fTy9wAr0tkvw3PqyVPuHV+8CimX
	Y6bEzZ0NvxVnLz1RBbBNJNeI68VusjqUYJdAGW+WnsJMBkbomcRmSAqD//zO51bO6gxQUxm/0Sm4u
	BjWcgD8uqznd4RVrBsxckIu5NlqcCawVrv5eGskkGb5Df7RF/wml0JJB/mbsaMH3OUtN91QbgqiwF
	IKnoij6w5Bm47NOxKb8V4kxsUyIx/Co/7V9bSI0OaMqh0VPitjBDVJ/iV2lHinP8RNF78joB5kTV2
	eNfozAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMw-00000003nzy-2eu4;
	Thu, 09 Jul 2026 22:37:22 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMt-00000003nx1-1eFD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:21 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-48e5de5a23cso261124b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636638; x=1784241438; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ty5ADPWIKqd8Px0gGtRTP0jl6mErohylK4VL5tgWduw=;
        b=FCgw0Lwv+6ACv4Cso1SnozCodKid50azOJyUe1YTc7FZ0FIjpsKuMYJzC8Q6mfxryp
         gdzq2TRYkMSnKseBpyk0+5+1gAAAMWK4S/+2+p4h2+4BkZi8F4fl5wDjsuhSQ6SzuMx2
         yXKcL400Ld/YE4llkB4Px+p0frvocJENxD98ijoWlRsQOvlalT7+Tp8/1O5/FG01rgmb
         3Wtt2CU/n7i/KPdhuL8qlNAG83I+xj6/ueurMS75tYne6SsrvpYlm5HG87UlXUavQ7Qu
         SLxR94QYVZnvdHuk0L31PUYWS8MnLVN2VuYuzLgfnn6ltxe1NJmfYN7kTCKZGJc0QFyw
         mwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636638; x=1784241438;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ty5ADPWIKqd8Px0gGtRTP0jl6mErohylK4VL5tgWduw=;
        b=qUuKSEwgUxMGI/etACpT+Te0uipVU13qPn2jo1AK3vhIy2pTIFf3d4an66IKhVw3eT
         nyjsoOS6AOH94bZWvqRXWAYzNzX62xJKnWowmwQvP44A4ny3ySG3mWBZue5BqgLwWdsm
         NP0bKYVaSMPabB4xOSV5kbil6RV2MzFE2ev13zKAVDakZSnUvHhuA/E4RnLzJLjE7LG0
         om2NUHAqnyXsQ5FY16xpY1wUdJ9+Z/YAj/x7X6Fw587OTBu5CQGipa5blcQi3s0zHSXE
         ElJhHHWTB0pdZpOl+4QdavqGr0IimfLhzCW0ehem4k4uWsBwCC94pf7Ybmva8LcgUty+
         K2fA==
X-Forwarded-Encrypted: i=1; AFNElJ/FDW0FvN9XQSwzXfcG6a50WwEWOWGXFroA668DbTyo/CnSA3IyAgtJg27RS2gMQgA6E6xzJlmWOd7Rl43KfR6f@lists.infradead.org
X-Gm-Message-State: AOJu0YyPZZGlHcZyhJF3RT9p5SNJXWMSL/VL+MfEq9a1dSM8t7JL5Ioq
	8bVDd6f5eUwOB5pgYP/buSPBYeNEYSONe82GglOotR7uvQhLmAYfqYjiWGw5VxDuyOqfxVKsi0S
	Qu51NL50T3860qFIG4TSUO5MU1w==
X-Received: from ilsj14.prod.google.com ([2002:a92:ca0e:0:b0:502:28a2:9963])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1308:b0:496:10e9:7627 with SMTP id 5614622812f47-4a202004393mr6764891b6e.9.1783636637765;
 Thu, 09 Jul 2026 15:37:17 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:36:01 +0000
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260709223604.12934-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-5-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 4/6] KVM: arm64: Initialize HCR_EL2.E2H early
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
X-CRM114-CacheID: sfid-20260709_153719_445532_8BD1FB9A 
X-CRM114-Status: GOOD (  19.09  )
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 7a68b55ff39b0a1638acb1694c185d49f6077a0d ]

On CPUs without FEAT_E2H0, HCR_EL2.E2H is RES1, but may reset to an
UNKNOWN value out of reset and consequently may not read as 1 unless it
has been explicitly initialized.

We handled this for the head.S boot code in commits:

  3944382fa6f22b54 ("arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is negative")
  b3320142f3db9b3f ("arm64: Fix early handling of FEAT_E2H0 not being implemented")

Unfortunately, we forgot to apply a similar fix to the KVM PSCI entry
points used when relaying CPU_ON, CPU_SUSPEND, and SYSTEM SUSPEND. When
KVM is entered via these entry points, the value of HCR_EL2.E2H may be
consumed before it has been initialized (e.g. by the 'init_el2_state'
macro).

Initialize HCR_EL2.E2H early in these paths such that it can be consumed
reliably. The existing code in head.S is factored out into a new
'init_el2_hcr' macro, and this is used in the __kvm_hyp_init_cpu()
function common to all the relevant PSCI entry points.

For clarity, I've tweaked the assembly used to check whether
ID_AA64MMFR4_EL1.E2H0 is negative. The bitfield is extracted as a signed
value, and this is checked with a signed-greater-or-equal (GE) comparison.

As the hyp code will reconfigure HCR_EL2 later in ___kvm_hyp_init(), all
bits other than E2H are initialized to zero in __kvm_hyp_init_cpu().

Fixes: 3944382fa6f22b54 ("arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is negative")
Fixes: b3320142f3db9b3f ("arm64: Fix early handling of FEAT_E2H0 not being implemented")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ahmed Genidi <ahmed.genidi@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20250227180526.1204723-2-mark.rutland@arm.com
[maz: fixed LT->GE thinko]
Signed-off-by: Marc Zyngier <maz@kernel.org>
[ Backport: Resolved trivial conflict in arch/arm64/kvm/hyp/nvhe/hyp-init.S
  caused by __kvm_init_el2_state not existing in 6.6.y (EL2 state is initialized
  inline via init_el2_state / finalise_el2_state); placed init_el2_hcr 0
  directly before the inline sequence. ]
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/el2_setup.h | 26 ++++++++++++++++++++++++++
 arch/arm64/kernel/head.S           | 19 +------------------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S |  2 ++
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index b7afaa026842b..3498dc5d02c18 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -16,6 +16,32 @@
 #include <asm/sysreg.h>
 #include <linux/irqchip/arm-gic-v3.h>
 
+.macro init_el2_hcr	val
+	mov_q	x0, \val
+
+	/*
+	 * Compliant CPUs advertise their VHE-onlyness with
+	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
+	 * can reset into an UNKNOWN state and might not read as 1 until it has
+	 * been initialized explicitly.
+	 *
+	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
+	 * don't advertise it (they predate this relaxation).
+	 *
+	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
+	 * indicating whether the CPU is running in E2H mode.
+	 */
+	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
+	sbfx	x1, x1, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
+	cmp	x1, #0
+	b.ge	.LnVHE_\@
+
+	orr	x0, x0, #HCR_E2H
+.LnVHE_\@:
+	msr	hcr_el2, x0
+	isb
+.endm
+
 .macro __init_el2_sctlr
 	mov_q	x0, INIT_SCTLR_EL2_MMU_OFF
 	msr	sctlr_el2, x0
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index e0e710b36da37..ff7769821166a 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -575,25 +575,8 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	msr	sctlr_el2, x0
 	isb
 0:
-	mov_q	x0, HCR_HOST_NVHE_FLAGS
-
-	/*
-	 * Compliant CPUs advertise their VHE-onlyness with
-	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
-	 * RES1 in that case. Publish the E2H bit early so that
-	 * it can be picked up by the init_el2_state macro.
-	 *
-	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
-	 * don't advertise it (they predate this relaxation).
-	 */
-	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
-	tbz	x1, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
-
-	orr	x0, x0, #HCR_E2H
-1:
-	msr	hcr_el2, x0
-	isb
 
+	init_el2_hcr	HCR_HOST_NVHE_FLAGS
 	init_el2_state
 
 	/* Hypervisor stub */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 1cc06e6797bda..3efa9cfaa9d48 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -202,6 +202,8 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 
 2:	msr	SPsel, #1			// We want to use SP_EL{1,2}
 
+	init_el2_hcr	0
+
 	/* Initialize EL2 CPU state to sane values. */
 	init_el2_state				// Clobbers x0..x2
 	finalise_el2_state
-- 
2.55.0.795.g602f6c329a-goog


