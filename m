Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAA0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFUa7znH4M21s1U2YoShafNp4F1ZnEDYd6H2bCRg/JI=; b=jlG18WkshMyN19PmiZhM5JzwqZ
	qU24ACDyqKcqOkV+qMjnlkyS1NHffNhBThCEeVM00GJ8mb391TdxD2X93QceNJGyWKz+nDlR83u+8
	yh/0y7bzAFHZmfhWJAG/3I4S8LsaJpbfESLZWIHImAvaTv7BXgEbC+knYKKNnzgv8w+fLNuLxPpsi
	xlDxfr4xG3iQ7p4WxPi30XCOuxHQIH3hkKp2Ar0NpP61G1E7WUtXci+NYhmrYO1wvFiBQQN151kVy
	MBckVDLqlmvjDc3yG1c4F0IQv4zgZRHlij2OzyU68J8bhjgVxbHfwv2rBlUskmnV1WXdmmpfMa+Sm
	XqIKkbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mi-00000002zK8-3iAN;
	Wed, 01 Jul 2026 20:43:52 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1me-00000002zFd-1pmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:43:49 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-485ebc5706cso3268854b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938627; x=1783543427; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFUa7znH4M21s1U2YoShafNp4F1ZnEDYd6H2bCRg/JI=;
        b=IZakfmvXbLa/MTGJUmPThga+bFrwQiQa9HE+7SHKKnbUgxMPnt8jMMBFXP/5p25ZUx
         q/83PwwX6Nh+60lPgEYkhU3ELalPJOSrLzdE8fz3imIyxSwaexC6unyJHQ1gWJRF9ie0
         mvnMSC4tOZtG7P1xU3Rg9itYLJSkUJ/Ecfp1FOcucXXYJqLmCa4XjtdgLtoMmA7TN6dq
         WhH6wMgN/wMOZmD29WgSW+0mIeOvi4FbBHKTuPnlUOycDSVS430OL/qWWk9Uqm537dAd
         hibCT+lw7l3JnBtLw2P0JpU2RXDEIrwGdPkt8OedwxHukKWAo0jNIFpmm8HGQMVnvwwU
         lAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938627; x=1783543427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFUa7znH4M21s1U2YoShafNp4F1ZnEDYd6H2bCRg/JI=;
        b=mxy497A7PrMEH/5hc9x12Sqlsy0nCjwC8TiIxC9In6g/xvZeKEfsOpIX2eAoweiVrh
         3+WIBR+3x8oqV7u1hxjIU3cpithVwc9tGhlxWqFnEN/OHhC7ij8zONZbKkB9sVk9va0H
         MfgfT58TwTtoKgAxFdnKNeE1BCN08bQmM5gpXt+KjaVeWWwb739WyAhAqdnEiQxubxnY
         Wdre4VDqXcSiUMmG5aQAo3IplJ8/uBL7pJq7J2UYHRAwWtkt99BuvvApRsg1h/bjNGRb
         PhZ9el53YPVdGBjowKl/Ir4T/qUhJVhAIw1AeSpoMXtETr/ekM+76TDHMRqer/4C5Ghl
         qEFw==
X-Forwarded-Encrypted: i=1; AFNElJ8fUqc6Qa4b8+KfPn3URlGKfLrR9UvkiRipsSzjbI1tVXR9T79efw/a48Z0xUIHRe/i9gwsCW3HaWkCoMuIEo+9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+URes/K+b3/E8jP4u5xf8RpkVopbgZzZrrrt2/meOSK4TDAuK
	5b+2X/pivAPALTUyZT/eG82/+braOJ4Zg0gBU0TzT5eL2j9/MeoIX2SZHe0Urw3WwTIkrgmZXFF
	8f1rGimWRLRYUv7+wufpAUagVRA==
X-Received: from ilb3-n1.prod.google.com ([2002:a05:6e02:5303:10b0:503:bd20:d827])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c3ee:b0:495:ca1b:7865 with SMTP id 5614622812f47-495f502375fmr5855417b6e.11.1782938626972;
 Wed, 01 Jul 2026 13:43:46 -0700 (PDT)
Date: Wed,  1 Jul 2026 20:43:41 +0000
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260701204342.2654385-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260701204342.2654385-5-coltonlewis@google.com>
Subject: [PATCH 4/5] KVM: arm64: Initialize HCR_EL2.E2H early
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Ahmed Genidi <ahmed.genidi@arm.com>, Ben Horgan <ben.horgan@arm.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134348_494391_05AA0B34 
X-CRM114-Status: GOOD (  19.87  )
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

[ Upstream commit 7a68b55ff39b0d2dcd92ee241b12b23a7e03c621 ]

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

[ Backport: Resolved conflict in arch/arm64/kvm/hyp/nvhe/hyp-init.S
  by extracting EL2 state initialization into __kvm_init_el2_state
  and calling it after HCR setup. ]
---
 arch/arm64/include/asm/el2_setup.h | 26 ++++++++++++++++++++++++++
 arch/arm64/kernel/head.S           | 19 +------------------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 16 +++++++++++++---
 3 files changed, 40 insertions(+), 21 deletions(-)

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
index 1cc06e6797bda..a08363b9b10fd 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -75,6 +75,16 @@ __do_hyp_init:
 	eret
 SYM_CODE_END(__kvm_hyp_init)
 
+/*
+ * Initialize EL2 CPU state to sane values.
+ *
+ * HCR_EL2.E2H must have been initialized already.
+ */
+SYM_CODE_START_LOCAL(__kvm_init_el2_state)
+	init_el2_state				// Clobbers x0..x2
+	finalise_el2_state
+	ret
+SYM_CODE_END(__kvm_init_el2_state)
 /*
  * Initialize the hypervisor in EL2.
  *
@@ -202,9 +212,9 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 
 2:	msr	SPsel, #1			// We want to use SP_EL{1,2}
 
-	/* Initialize EL2 CPU state to sane values. */
-	init_el2_state				// Clobbers x0..x2
-	finalise_el2_state
+	init_el2_hcr	0
+
+	bl	__kvm_init_el2_state
 	__init_el2_nvhe_prepare_eret
 
 	/* Enable MMU, set vectors and stack. */
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


