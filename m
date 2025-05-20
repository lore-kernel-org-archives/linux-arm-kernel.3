Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA9EC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnRHv6SkfgJtvQpMwBNoB42NNqkuDHOAUanWlVJEbLI=; b=0/qCkrUxk4l8GUjpG3LGGOO0YJ
	CHO7hptlql/yeNce1pxItJgEkA+Q+2x2cuCCj5vM4ZJ+TI78mFPYbkeyhGlHNPlqdnu/+N/wOF5ga
	ZJMjdd4Q77xewBmrb9h8h2FmEMoGotKXMO3CNrBTMtRNBx6dO5ca2eqdAu2LdQYsR0unaiixcDIez
	IbQfdCSOLqhM87EjfIDd6B3YZdI248/8J0raJ0gM2GQ6cjGk9wBigOILDD6cBXL4MyoRIn/NKkgUv
	O71BuJbFrRjN/cuOAdw2HWHr0D2/6B7eCZsjrLCqtY1VQH/D/iT+GSlsEpPIrJCBXManUpzWZeTrB
	fMzL2KkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVXo-0000000EHld-2BSI;
	Tue, 20 May 2025 22:34:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVRR-0000000EGQS-3rkZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA41A5C26EB;
	Tue, 20 May 2025 22:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C535C4CEED;
	Tue, 20 May 2025 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747780088;
	bh=sapP8zwnsHAl+yrvVOTVkr/ymaBjo6P/Ih3XmnjzUZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mvj5Az2uEfcrN0TbruQ8OhG3cOD7Ky3+Rt5D4YRizZyhQ++WzQK2I+A0pOi+MsWpA
	 o/3uK4zrfVR1wRaLYXsMdC03qulEH+X+xiYRV532pDjQ/+A41TRk2SwIsxLl8GDdYY
	 XT7qA7V0vqS+0/z+3kJg6WJG8QcPZTDeL7u4+CjZFeYS8SPK1vHAhygwNK9OziYMnp
	 Y09R/4/63iGdp5JT8jS6SUn+chgOHFV54LxTfC16IIcAWu6dDgVLz9XBcXo8cmaxYn
	 fkSxN6TletwhcU+GQKE693Pjxx5X3nP09b+V2f+21ZsJsHbGkJ1EvcHW5C61l9uiAb
	 JLkblgdwat6fw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 20 May 2025 17:27:37 -0500
Subject: [PATCH v22 2/5] arm64: el2_setup.h: Make __init_el2_fgt labels
 consistent, again
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-arm-brbe-v19-v22-2-c1ddde38e7f8@kernel.org>
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
In-Reply-To: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Dave Martin <Dave.Martin@arm.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_152810_054132_15915479 
X-CRM114-Status: GOOD (  13.14  )
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

Commit 5b39db6037e7 ("arm64: el2_setup.h: Rename some labels to be more
diff-friendly") reworked the labels in __init_el2_fgt to say what's
skipped rather than what the target location is. The exception was
"set_fgt_" which is where registers are written. In reviewing the BRBE
additions, Will suggested "set_debug_fgt_" where HDFGxTR_EL2 are
written. Doing that would partially revert commit 5b39db6037e7 undoing
the goal of minimizing additions here, but it would follow the
convention for labels where registers are written.

So let's do both. Branches that skip something go to a "skip" label and
places that set registers have a "set" label. This results in some
double labels, but it makes things entirely consistent.

While we're here, the SME skip label was incorrectly named, so fix it.

Reported-by: Will Deacon <will@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
This one can be applied even if the rest of the series is not.

v22:
 - New patch
---
 arch/arm64/include/asm/el2_setup.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ebceaae3c749..30f57b0334a3 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -204,19 +204,21 @@
 	orr	x0, x0, #(1 << 62)
 
 .Lskip_spe_fgt_\@:
+
+.Lset_debug_fgt_\@:
 	msr_s	SYS_HDFGRTR_EL2, x0
 	msr_s	SYS_HDFGWTR_EL2, x0
 
 	mov	x0, xzr
 	mrs	x1, id_aa64pfr1_el1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_SME_SHIFT, #4
-	cbz	x1, .Lskip_debug_fgt_\@
+	cbz	x1, .Lskip_sme_fgt_\@
 
 	/* Disable nVHE traps of TPIDR2 and SMPRI */
 	orr	x0, x0, #HFGxTR_EL2_nSMPRI_EL1_MASK
 	orr	x0, x0, #HFGxTR_EL2_nTPIDR2_EL0_MASK
 
-.Lskip_debug_fgt_\@:
+.Lskip_sme_fgt_\@:
 	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
 	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
 	cbz	x1, .Lskip_pie_fgt_\@
@@ -237,12 +239,14 @@
 	/* GCS depends on PIE so we don't check it if PIE is absent */
 	mrs_s	x1, SYS_ID_AA64PFR1_EL1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
-	cbz	x1, .Lset_fgt_\@
+	cbz	x1, .Lskip_gce_fgt_\@
 
 	/* Disable traps of access to GCS registers at EL0 and EL1 */
 	orr	x0, x0, #HFGxTR_EL2_nGCS_EL1_MASK
 	orr	x0, x0, #HFGxTR_EL2_nGCS_EL0_MASK
 
+.Lskip_gce_fgt_\@:
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0

-- 
2.47.2


