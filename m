Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D175BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1NCAKys4dQcFTKaVl654SWQB4KyErRvmEmcj8YMFdA=; b=gNmwbWxurfIWHTVXpQX7yMhdO6
	luTuowJDcDxY2TNxhs+uOQSUku6KGXPC6KYqsWQQR1ECWmX4m9LM7xHMGpOPWSY0hoZkb4LoZPSt3
	AcAAt9T4C08+525XezDGhEVVlTKmodgG+RetNrygekiCBzTsWgU1u7M83nWFzu0K82q1bAUTTckNZ
	1NUe3tt3jenPKPgSj2ZojkXm1xAqgrjoHcubqrr03IQ8+A1ODBaYkfDorzLZwGBp0CaCe64gS29Uj
	qnVtH5suosiH5QSfFjs9xo9IVhmiRo2q2S9tQwwWlvc99hRr5hDIRf2yXkBnkSm/oZAC/Lztw2r/T
	CRgA4fMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64tW-00000001nNu-3kQW;
	Tue, 07 Oct 2025 10:26:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64tT-00000001nNZ-3ibW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED68045253;
	Tue,  7 Oct 2025 10:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FD1C4CEF1;
	Tue,  7 Oct 2025 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759832765;
	bh=Bvl2ChImxgS0j7pE2mZq01mesct/mBT06Z3hhwBQYhk=;
	h=From:To:Cc:Subject:Date:From;
	b=AzalYBIZ46U8TQOJ/BdtoBHCDYL0IlollYqNRTKto6tmDpwW36bl6n1oDkcJHdek+
	 ObIRDuby4KQyLzE4fouU04ViQ44OLlt4l7/Q+w3PPreAunRoNM22zBGKRuTqXF2KZo
	 ub9XTeK9fgy/vf4CqY9BxZ/eVfwauVGXyr6B/dKpmp8pmRjCNJftAlKCdZOMDgIBYf
	 bk3s8HRKc/Jx1t3TcHRBV6IB+RklX6bu13NiH81fK91u3bw1Exk11YBM5E8R54c4Q7
	 bPGkkW6ukRfMmtjPMbqWnwPEtzCq0USOij0Tw10BHkgMBP17M55uceroIXPrx1cVtd
	 QDaF7JTesmcSA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2] arm64/sysreg: Fix GIC CDEOI instruction encoding
Date: Tue,  7 Oct 2025 12:26:00 +0200
Message-ID: <20251007102600.879337-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_032607_969401_B878641B 
X-CRM114-Status: GOOD (  14.55  )
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

The GIC CDEOI system instruction requires the Rt field to be set to 0b11111
otherwise the instruction behaviour becomes CONSTRAINED UNPREDICTABLE.

Currenly, its usage is encoded as a system register write, with a constant
0 value:

write_sysreg_s(0, GICV5_OP_GIC_CDEOI)

While compiling with GCC, the 0 constant value, through these asm
constraints and modifiers ('x' modifier and 'Z' constraint combo):

asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));

forces the compiler to issue the XZR register for the MSR operation (ie
that corresponds to Rt == 0b11111) issuing the right instruction encoding.

Unfortunately LLVM does not yet understand that modifier/constraint
combo so it ends up issuing a different register from XZR for the MSR
source, which in turns means that it encodes the GIC CDEOI instruction
wrongly and the instruction behaviour becomes CONSTRAINED UNPREDICTABLE
that we must prevent.

Add a conditional to write_sysreg_s() macro that detects whether it
is passed a constant 0 value and issues an MSR write with XZR as source
register - explicitly doing what the asm modifier/constraint is meant to
achieve through constraints/modifiers, fixing the LLVM compilation issue.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
v1: https://lore.kernel.org/lkml/20251006100758.624934-1-lpieralisi@kernel.org/

 arch/arm64/include/asm/sysreg.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 6455db1b54fd..c231d2a3e515 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1220,10 +1220,19 @@
 	__val;								\
 })
 
+/*
+ * The "Z" constraint combined with the "%x0" template should be enough
+ * to force XZR generation if (v) is a constant 0 value but LLVM does not
+ * yet understand that modifier/constraint combo so a conditional is required
+ * to nudge the compiler into using XZR as a source for a 0 constant value.
+ */
 #define write_sysreg_s(v, r) do {					\
 	u64 __val = (u64)(v);						\
 	u32 __maybe_unused __check_r = (u32)(r);			\
-	asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));		\
+	if (__builtin_constant_p(__val) && __val == 0)			\
+		asm volatile(__msr_s(r, "xzr"));			\
+	else								\
+		asm volatile(__msr_s(r, "%x0") : : "r" (__val));	\
 } while (0)
 
 /*
-- 
2.48.0


