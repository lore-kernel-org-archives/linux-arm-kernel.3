Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52536C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sot0xOLLqT5jl7UPs1tEjpIi3IAlhrP2GH6sB88yxis=; b=lyA3U1vuGQ5yK2rULrrhkLjQPG
	RU5a+wL7ui6oW6zs91+LKezfbYQo6imSbbyKc1dzmj06TD0bpuCJL7m7GzGt7ko+T3jqpol1DFoM5
	Q4G0y6dyXS8ni2iFPCJWSxf8Dl05Xc28ifrCkkTn2Sow0IdzsEg3TgI6Cxs9dwmnSgI+S6GRmjTzG
	iMlKUfgSYC3SKVUvF/1H+TCMOjgc/8MtK0vF7AHgFgvpxo1ihkcaVBn9DUhbokRwxbE8JsUHp7MVd
	dnxhqBezggLUnTu37wN6cphFYEYNV3jGStLPHB8F5SzsjUa44W7/ftcZJtfurPO5jfnKHyKM1uS2P
	bfz0NUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mi-00000002zKR-4729;
	Wed, 01 Jul 2026 20:43:52 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mf-00000002zGV-0xaP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:43:51 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-48576b535b6so665943b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938628; x=1783543428; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sot0xOLLqT5jl7UPs1tEjpIi3IAlhrP2GH6sB88yxis=;
        b=p8NjWItD6dKzPQR+gdA/kBx1Bpc1HOG17pO7a0ow1yxUUVszXBqQjP6jO+YsIE30lL
         CwA44z7B6dxnnxhZIzEbziTcsi3CDaXEVfXScAJoLltF5GnYZ8TDwI9FuWUZd8QULRwh
         RGMlPX/N97nhCDcsS5xOFNnZCDLBSbSOqFufcW8ID7jy+B+TBjBjSz5PKgG5CCxc4ibo
         Ya0d4pTCC1gE4ndQpjkUEZcFS7yY3tseEJ+7r7oLt0XniNBwQQcpss9t8WdunIVztqma
         RfjDaLF26HauLFGsD2J8M5f6CUsDoK877luHsdKTXnS8jKG0+ERzBFydDKbbffJoOV6i
         lfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938628; x=1783543428;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sot0xOLLqT5jl7UPs1tEjpIi3IAlhrP2GH6sB88yxis=;
        b=ltGqEK+JALcWJhjfpbZOvJI2mQgUEFL0BODSQO93qgMRX0cuSkY9YY7Gvqks9Rk5cn
         VRu576/Wel5D+zmPKWhnVC8tl61/3CsvktTRa/oNXcDVCviDgUMBPKDw3FIPoLZmLuTa
         DyKz4n5gB5y3PjFR+sFsV+w24sN997HT4LBoKyEtz6vn30qP3W2WFtdB1uOH/rCKg8rE
         wMhTctgYRTAuE7jQ3Me9fqz2vApSPZ7iJ240YTIEcy3jSvPxSRAeLlJr6AaFxq+US6rX
         06/LPgnTgpCAQLv2xYv32KaqKKHZwX/UWIdHhpQGZXCmZfpLNGT+wZQnStnYgkJm74hj
         VtzA==
X-Forwarded-Encrypted: i=1; AFNElJ80jLDS5DWjodGkejZ9CvkfNwtSipBaxvXPudb0D+0qoLuxqVSRJATMrYSrxDkMcP61JTa30okjw4WmfIyv+EDQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Cgk9geOld2Z5v2PmdiZ/f40INYgsXlQJjNgum1EeGyaX7GeX
	Jl8ux9bwB5Zncc941M4Kmhum45fo6zeVFP+dqVYUeHTk1vh2ySPiQAnXKEu2A4LVc4jshPQUJqi
	29csA5MGPZjKmE31K9bVVbMjFcQ==
X-Received: from jabjw14.prod.google.com ([2002:a05:6638:a20e:b0:5e7:3ea0:602c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1210:b0:48a:3f80:ee5f with SMTP id 5614622812f47-4960f04d9cdmr2092075b6e.29.1782938627860;
 Wed, 01 Jul 2026 13:43:47 -0700 (PDT)
Date: Wed,  1 Jul 2026 20:43:42 +0000
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260701204342.2654385-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260701204342.2654385-6-coltonlewis@google.com>
Subject: [PATCH 5/5] arm64: Revamp HCR_EL2.E2H RES1 detection
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jan Kotas <jank@cadence.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134349_281100_153E91A3 
X-CRM114-Status: GOOD (  18.89  )
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

[ Upstream commit ca88ecdce5f5127ef2ee241b12b23a7e03c6210f ]

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
---
 arch/arm64/include/asm/el2_setup.h | 38 +++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 3498dc5d02c18..38d32116a23eb 100644
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
2.55.0.rc2.803.g1fd1e6609c-goog


