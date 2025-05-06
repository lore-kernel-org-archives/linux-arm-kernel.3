Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E83BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ait8HSehG9JBxnaCO08D+AflcZLQTinPAzyaosHJQUY=; b=ATbynOLXIpV7tCFf4r8ClLYXN/
	al+iofydV6xWhOcY+uan54vPdZcdsv4JTowK0Xp+Rq8RGMIXGBuZ3YPU04YH0sABzpxlRe6mwZCaR
	+JG1NA1M4jJcoOmCg048+mSMj+SawS/21s0JoOU4J5aK9gwlXz/ZfTvJZGlQoa63RkoNOe7ul6Qft
	8g9eySW8RIPKtJeS+8BZACPaGbDmwOlxrh/XLGleabjumK7iCLEinJMV/OaBsbgIrlX2kg/wf8Xxn
	wtPPRJ1DTp2kmvYLiqvTt4OI6C/rp6h7WOHnSGagU79A0M0I7XOcvnH7xR8wjo1nVGLdrAzNDNjSV
	0oFtatyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNzS-0000000DEcC-1G8G;
	Tue, 06 May 2025 19:30:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBH-0000000CUOa-0JSC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:26:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C3151007;
	Tue,  6 May 2025 08:25:53 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5436F3F58B;
	Tue,  6 May 2025 08:26:00 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH 09/20] arm64/fpsimd: signal: Use SMSTOP behaviour in setup_return()
Date: Tue,  6 May 2025 16:25:12 +0100
Message-Id: <20250506152523.1107431-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082603_157091_69ADA819 
X-CRM114-Status: GOOD (  12.30  )
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

Historically the behaviour of setup_return() was nondeterministic,
depending on whether the task's FSIMD/SVE/SME state happened to be live.
We fixed most of that in commit:

  929fa99b1215 ("arm64/fpsimd: signal: Always save+flush state early")

... but we didn't decide on how clearing PSTATE.SM should behave, and left a
TODO comment to that effect.

Use the new task_smstop_sm() helper to make this behave as if an SMSTOP
instruction was used to exit streaming mode. This would have been the
most common behaviour prior to the commit above.

Fixes: 40a8e87bb328 ("arm64/sme: Disable ZA and streaming mode when handling signals")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 57b15f8bc29ff..bd5fd6ddb4486 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1475,22 +1475,8 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 
 	/* Signal handlers are invoked with ZA and streaming mode disabled */
 	if (system_supports_sme()) {
-		/*
-		 * If we were in streaming mode the saved register
-		 * state was SVE but we will exit SM and use the
-		 * FPSIMD register state.
-		 *
-		 * TODO: decide if this should behave as SMSTOP (e.g. reset
-		 * FPSR + FPMR), or whether this should only clear the scalable
-		 * registers + ZA state.
-		 */
-		if (current->thread.svcr & SVCR_SM_MASK) {
-			memset(&current->thread.uw.fpsimd_state, 0,
-			       sizeof(current->thread.uw.fpsimd_state));
-			current->thread.fp_type = FP_STATE_FPSIMD;
-		}
-
-		current->thread.svcr &= ~(SVCR_ZA_MASK | SVCR_SM_MASK);
+		task_smstop_sm(current);
+		current->thread.svcr &= ~SVCR_ZA_MASK;
 		write_sysreg_s(0, SYS_TPIDR2_EL0);
 	}
 
-- 
2.30.2


