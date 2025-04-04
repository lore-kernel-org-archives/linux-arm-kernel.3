Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853F2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSEZBbvEe3qpG73LK4o8HjwaIhiytyeGBDtmBgYScYQ=; b=fHr5ee7IyC2y2SnrjeGuCR6pKz
	xuri8N0hRrjgpUpT7qNhBRNNmauWUPd6UPQXsfN9yBNpCXFHzkNyFZfVaLe0O4enflvk3corpbU0l
	IO0I4kExAXX2V3Hub8KcIraEEq3vh0/C1m06ZVKnoXKylE2RcCT1EYwJVUE1LbRb7ywmLvxQLo215
	NYqyUYNW4K6C3AWkR4bStHZrp/rzV8S2KZKQfDsrd1xh/W0mXUzpkgp6l+L/QEdMqs9JV9a17STmN
	mRrt/PLNMuC7U0zc0YDhmZ2vlnFi4+cLhPN9P9MnsktbuLc0gNMfQYqM2Y3tt0yIbiCUlBPJ7e2od
	v6Ld9a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lBP-0000000CSCh-0UiR;
	Fri, 04 Apr 2025 17:50:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l5x-0000000CRMt-49A0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC37C1516;
	Fri,  4 Apr 2025 10:44:45 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36EE23F63F;
	Fri,  4 Apr 2025 10:44:42 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 01/14] arm64/fpsimd: Avoid RES0 bits in the SME trap handler
Date: Fri,  4 Apr 2025 18:44:22 +0100
Message-Id: <20250404174435.3288106-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104446_080564_D628185C 
X-CRM114-Status: GOOD (  11.81  )
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

The SME trap handler consumes RES0 bits from the ESR when determining
the reason for the trap, and depends upon those bits reading as zero.
This may break in future when those RES0 bits are allocated a meaning
and stop reading as zero.

For SME traps taken with ESR_ELx.EC == 0b011101, the specific reason for
the trap is indicated by ESR_ELx.ISS.SMTC ("SME Trap Code"). This field
occupies bits [2:0] of ESR_ELx.ISS, and as of ARM DDI 0487 L.a, bits
[24:3] of ESR_ELx.ISS are RES0. ESR_ELx.ISS itself occupies bits [24:0]
of ESR_ELx.

Extract the SMTC field specifically, matching the way we handle ESR_ELx
fields elsewhere, and ensuring that the handler is future-proof.

Fixes: 8bd7f91c03d886f4 ("arm64/sme: Implement traps and syscall handling for SME")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/esr.h | 14 ++++++++------
 arch/arm64/kernel/fpsimd.c   |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index d1b1a33f9a8b0..63aed18a933fe 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -371,12 +371,14 @@
 /*
  * ISS values for SME traps
  */
-
-#define ESR_ELx_SME_ISS_SME_DISABLED	0
-#define ESR_ELx_SME_ISS_ILL		1
-#define ESR_ELx_SME_ISS_SM_DISABLED	2
-#define ESR_ELx_SME_ISS_ZA_DISABLED	3
-#define ESR_ELx_SME_ISS_ZT_DISABLED	4
+#define ESR_ELx_SME_ISS_SMTC_MASK		GENMASK(2, 0)
+#define ESR_ELx_SME_ISS_SMTC(esr)		((esr) & ESR_ELx_SME_ISS_SMTC_MASK)
+
+#define ESR_ELx_SME_ISS_SMTC_SME_DISABLED	0
+#define ESR_ELx_SME_ISS_SMTC_ILL		1
+#define ESR_ELx_SME_ISS_SMTC_SM_DISABLED	2
+#define ESR_ELx_SME_ISS_SMTC_ZA_DISABLED	3
+#define ESR_ELx_SME_ISS_SMTC_ZT_DISABLED	4
 
 /* ISS field definitions for MOPS exceptions */
 #define ESR_ELx_MOPS_ISS_MEM_INST	(UL(1) << 24)
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 8370d55f03533..1ee5f330b8ed3 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1436,7 +1436,7 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 	 * If this not a trap due to SME being disabled then something
 	 * is being used in the wrong mode, report as SIGILL.
 	 */
-	if (ESR_ELx_ISS(esr) != ESR_ELx_SME_ISS_SME_DISABLED) {
+	if (ESR_ELx_SME_ISS_SMTC(esr) != ESR_ELx_SME_ISS_SMTC_SME_DISABLED) {
 		force_signal_inject(SIGILL, ILL_ILLOPC, regs->pc, 0);
 		return;
 	}
-- 
2.30.2


