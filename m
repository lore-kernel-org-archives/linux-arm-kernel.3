Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8A4C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sSD/MdR7z212lU1O4WIMPoRpCWIEcBrC5jBLx8jitA=; b=J/F+F3v/1Z1Rm1qViVGRV+njM7
	/t+DBKqHJiZwCH26cAJlZm8IK7rHDOoFuTn9qXDC376vGd3yy4joLfJ7LnLfxRn7QiZWI+C+vcVEv
	r7PSUVeRJcbe/8WX7MFagHOzq0Ix0SSqIGlh96LVHZvoyfNSYF+yS+bKOQzB06xbglMXgW6Bk9wNd
	FmvZfQQmWF9myFfQmj7gaK2S9R613oLwa82uUZ51X0r2QIcIAjyfpzuHILghCltL4UkpaC75CcCNw
	/gnWuA4mqPUEwO+A6ryHL9fX+aIeeZ1/YI6Y1ZDY8TDZ+YGdQuiQSbenQ6Mtzc8Xvg3+n1YC1Aqgn
	NtFw9a+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxN5-00000003o5A-48YB;
	Thu, 09 Jul 2026 22:37:31 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMv-00000003nyB-2Uy6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:23 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-448bb8bd2efso445691fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636640; x=1784241440; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sSD/MdR7z212lU1O4WIMPoRpCWIEcBrC5jBLx8jitA=;
        b=iZiWxlrP3GH2hQ/0RL62VdHY+U23s/mSvPTqqRzaHJDEASrcqvQaKIfd76kBt5FC3S
         G+7rg8147282g6o0VYxxFFVb06ItgFsfs71rL5esyIhKceWDZYKC+aTev7w0ewISJYc0
         /ziI87OoFh7LgImeevKA/jItMy9C2YOiapocaTxrKOOPrRjO8uW65q7EBxiWAoR4ivey
         iiWgRdKXj1ZFTjGI7MNVFUNjqqL4jF2afkZDXDZEBUN2kPlRAyqCshveG8M5GqjUkOio
         xKl6vTKlkDamVR16lb/aVKUG0YVIKcmP+iYQkvnKgeQotVUpVGepA8xxCgw8QBX5FQKT
         O8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636640; x=1784241440;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sSD/MdR7z212lU1O4WIMPoRpCWIEcBrC5jBLx8jitA=;
        b=fr4dkiQtB4iknOkIg7SmAnfaJUFnEV4wYcAi8flssXcJCypTJUBkS8uHqhpypBBagJ
         oNi3FbHrR9Nrl7MF+cX4V7/4aZFdzbKnkptWMky9HXnnonDJr57mY7ALbMZqCL6FbIUp
         SK1gXKNbCEcaIxmdUwjuG673P6Fqozoi0Vfw6unlvNBCs5iWcRvMNmzaHSoBBfAsCl44
         jYV7JAprXcxh0Z5dFRBpUKhbVIvIEeRLpi3pvXeQYrkbcqCoB2iUrlH0/lCDFLrsKUn9
         1fjAZOxEf7uodvdkaKBYhbUtUdcfM+Gc3Gqz2tvvNMNELUaBcxrngwlXzS396I4fMwFC
         sb7w==
X-Forwarded-Encrypted: i=1; AFNElJ+QGOXD5t1xb7jxDfweVAF6Pwga/DoekGU2rnAFOD+yB/+v/SKBt39xqAdSgcw8NlGGrQ7ueyK8piXPE8X7jSJv@lists.infradead.org
X-Gm-Message-State: AOJu0Yywz0+UMZpc9Cp5vvCYybl/nockrQyEKnlm22tbj3IcuRi4I1K2
	py1RZ/NOW9qyYe6z8AhN0iDvaY+DdtI+WDBPhtwNs5JjBOcRqSp7JDMI0Zcd+8GSaskjQvHMJHm
	lvdGW/3B40chkA8mBOHOyEVNcig==
X-Received: from ilpy16.prod.google.com ([2002:a92:c750:0:b0:501:bcc7:5e68])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:152b:b0:4a4:934:b316 with SMTP id 5614622812f47-4a40934b663mr1606708b6e.21.1783636639699;
 Thu, 09 Jul 2026 15:37:19 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:36:03 +0000
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260709223604.12934-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-7-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 6/6] arm64: Revamp HCR_EL2.E2H RES1 detection
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_153721_665171_72CF13D9 
X-CRM114-Status: GOOD (  18.01  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit ca88ecdce5f51874a7c151809bd2c936ee0d3805 ]

We currently have two ways to identify CPUs that only implement FEAT_VHE
and not FEAT_E2H0:

- either they advertise it via ID_AA64MMFR4_EL1.E2H0,
- or the HCR_EL2.E2H bit is RAO/WI

However, there is a third category of "cpus" that fall between these
two cases: on CPUs that do not implement FEAT_FGT, it is IMPDEF whether
an access to ID_AA64MMFR4_EL1 can trap to EL2 when the register value
is zero.

A consequence of this is that on systems such as Neoverse V2, a NV
guest cannot reliably detect that it is in a VHE-only configuration
(E2H is writable, and ID_AA64MMFR0_EL1 is 0), despite the hypervisor's
best effort to repaint the id register.

Replace the RAO/WI test by a sequence that makes use of the VHE
register remnapping between EL1 and EL2 to detect this situation,
and work out whether we get the VHE behaviour even after having
set HCR_EL2.E2H to 0.

This solves the NV problem, and provides a more reliable acid test
for CPUs that do not completely follow the letter of the architecture
while providing a RES1 behaviour for HCR_EL2.E2H.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Tested-by: Jan Kotas <jank@cadence.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/15A85F2B-1A0C-4FA7-9FE4-EEC2203CC09E@global.cadence.com

[ Backport: Resolved conflict in arch/arm64/include/asm/el2_setup.h
  by replacing msr_hcr_el2 macro usages with raw msr hcr_el2 (since
  the macro is missing in 6.6.y). ]
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/el2_setup.h | 38 +++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 76b0d50d286d5..4c7467b382b60 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -24,22 +24,48 @@
 	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
 	 * can reset into an UNKNOWN state and might not read as 1 until it has
 	 * been initialized explicitly.
-	 *
-	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
-	 * don't advertise it (they predate this relaxation).
-	 *
 	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
 	 * indicating whether the CPU is running in E2H mode.
 	 */
 	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
 	sbfx	x1, x1, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
 	cmp	x1, #0
-	b.ge	.LnVHE_\@
+	b.lt	.LnE2H0_\@
 
+	/*
+	 * Unfortunately, HCR_EL2.E2H can be RES1 even if not advertised
+	 * as such via ID_AA64MMFR4_EL1.E2H0:
+	 *
+	 * - Fruity CPUs predate the !FEAT_E2H0 relaxation, and seem to
+	 *   have HCR_EL2.E2H implemented as RAO/WI.
+	 *
+	 * - On CPUs that lack FEAT_FGT, a hypervisor can't trap guest
+	 *   reads of ID_AA64MMFR4_EL1 to advertise !FEAT_E2H0. NV
+	 *   guests on these hosts can write to HCR_EL2.E2H without
+	 *   trapping to the hypervisor, but these writes have no
+	 *   functional effect.
+	 *
+	 * Handle both cases by checking for an essential VHE property
+	 * (system register remapping) to decide whether we're
+	 * effectively VHE-only or not.
+	 */
+	msr	hcr_el2, x0		// Setup HCR_EL2 as nVHE
+	isb
+	mov	x1, #1		// Write something to FAR_EL1
+	msr	far_el1, x1
+	isb
+	mov	x1, #2		// Try to overwrite it via FAR_EL2
+	msr	far_el2, x1
+	isb
+	mrs	x1, far_el1	// If we see the latest write in FAR_EL1,
+	cmp	x1, #2		// we can safely assume we are VHE only.
+	b.ne	.LnVHE_\@	// Otherwise, we know that nVHE works.
+
+.LnE2H0_\@:
 	orr	x0, x0, #HCR_E2H
-.LnVHE_\@:
 	msr	hcr_el2, x0
 	isb
+.LnVHE_\@:
 .endm
 
 .macro __init_el2_sctlr
-- 
2.55.0.795.g602f6c329a-goog


