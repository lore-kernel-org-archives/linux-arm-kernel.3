Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C63C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRLBDv0GR5+I5QEs+yagz6DalTxaINze8PKIAjmPSRo=; b=C7CIV98D9bEbPFtFp4xnAg0+zi
	/1058lNQQdy4fSRLDxzeKa3DPeHDq6qZ3cu5979ShJTUTB7ECSzngRc14BVjfe61YYuhUq6Z5GhMF
	fowSU7t+smcyx+b9HMu+rQI5yjb53Qk3UO0oFHfskg9gKamfExlhcHOM9Te3HZUaehTKoBXJxhHEd
	nf0jL87dS7jE+bN4MaMSQp3UpfxRRpH0ZAZ/Wo9wkCLiIY74KyWslx6lBQUfKIDjAMUURtvtcI88j
	g5QAsIvcruGDwOvarseo1MLR4sRSYiOwU7Dg5kkI+6mu5lGUtH4WMGnS9qvQRdZ1KPyHZAdeEPYVB
	XAQrOjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7t-00000000Yht-1gO2;
	Wed, 08 Jul 2026 22:52:21 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7n-00000000YdT-2ck0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:52:17 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-6a18bd9c3caso1551816eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783551133; x=1784155933; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRLBDv0GR5+I5QEs+yagz6DalTxaINze8PKIAjmPSRo=;
        b=keB4SCG57F3k0KfBAYvRo4gHSGrOC4TSK3/c2ij2qrn5OK6/HE08WbcYT0QSJhoIEd
         GcZOFxiC1nB1TdeuId4gH4VVtkxRi6QCiiCF0cwyodkmHR6EbH+gKvaoBStgh3497JBC
         lZmNuFAAJ01mJ5s7AWsTWfXKhaXdcAaXZy+CPgAly/98+gFBLQu/LZkl00BiAlyiU1dM
         dFcWI2v/VlpxIUkeeyC27j6gaSQgi20r7iFYqRGq5ONVgQWPb4duUEuaZukaJctvEQjW
         vvIybWpTG7mmdyzB9aAxowsXIdD9P83FHgwqWOX2AdRWwKDsI4SeMW/JkVJ8wHf3A3zd
         k3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551133; x=1784155933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRLBDv0GR5+I5QEs+yagz6DalTxaINze8PKIAjmPSRo=;
        b=U9qT7Lyj/hNCfFEeHbTDnmXUR8LCiZrCS4YAQ7DwsywEpcUTIxH4F+BrsR1T8T0HA4
         5tK9Zqn0NEyiiL/ME4g3X8dlolmQTydVvmoaWyoGITBNK5ZUJBV8kh5HUdfYEOU0Cl7p
         uOU5tBUAVGT2M8ROvAs1WiS9idM5SNYz+QggbLGoxGk/72uzjFoS84Z8xvdoa+0PdAAN
         vFTZT/jp9NiAEmcKSvzGCOueJagDqKR3nFVLJNcorQjtyzpWsnKBnRqLk5KTftle1A7p
         5N85woJ4HQE85MLSpKWAdQi0x29X99SIFw6RfwFkN8s5MB/hiZbAtl58hqkq9vWobRdy
         RlIg==
X-Forwarded-Encrypted: i=1; AFNElJ89P8zwpahvN6qO4DgX3yPknjMsrX0mKyKUbXgZi/+xftKXyZmqQcmAUDIRyOCpDgOt+wAYXbyz+BPQ086cfQ+x@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ6uc6G+M66+YoZ9cVfARJK7ImVowcf5hJgPWQg/dsrJNKKGaP
	02O2oDT4s14YggxhPaSIR/ugBPsh09P5KjjlJ5pMUz7VweB881WuwLzvGbmP3YxmU2D+PrN8NFU
	iS+TDO6uRADktHnZb449cIh8bUg==
X-Received: from ilmq1.prod.google.com ([2002:a92:d401:0:b0:503:8d4a:5b5b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:5708:10b0:6a3:74fd:a86f with SMTP id 006d021491bc7-6a374fdb227mr1250772eaf.9.1783551133388;
 Wed, 08 Jul 2026 15:52:13 -0700 (PDT)
Date: Wed,  8 Jul 2026 22:51:24 +0000
In-Reply-To: <20260708225124.4130846-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260708225124.4130846-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708225124.4130846-7-coltonlewis@google.com>
Subject: [PATCH 6.6 v2 6/6] arm64: Revamp HCR_EL2.E2H RES1 detection
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, dbrazdil@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_155215_700800_23BC8E32 
X-CRM114-Status: GOOD (  18.74  )
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


