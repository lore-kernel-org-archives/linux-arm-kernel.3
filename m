Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D38CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjzOSTvjzoI0OH7YTgkhLbltX+AewWbZawTMtWA1EO0=; b=JY/OyQSEPqfwZaId46fFD3l5Ot
	C46md574Hs8vnPN0zL8WwQOi4t2KtuPzTy1fXwzoazXtXi6Ei1AxSSEjkmwIal31syBCJ7YYmWLD7
	Iy8jwALzVKzqiBZgGgQF54s/WGzNJjIlwQf1gGzL95HKk6fmMDXgOjzhxg52cfKp+q1NKqRf2iqyU
	4DJZ5UqGtA4VrzQ/smcfw0rrtmPpgKPnoxzc2d8F8m0r4EJluTNR68biq7FSoYWkuFNVJWlMhX8Ep
	Flrbqn7niGPGAqpE4TQwpQSS4VaWU2jg2QYctYcsXWbRqx4LQn5IENyfbcrodsXq0DHtA+SN31dMF
	C08Wzw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjR6-0000000Et3b-1cc7;
	Wed, 03 Jun 2026 11:07:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjR3-0000000Et08-3zwy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:06:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFD232E4;
	Wed,  3 Jun 2026 04:06:52 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 31CB63F86F;
	Wed,  3 Jun 2026 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484816; bh=yiYr0l0Iv497+flH8aCC3mO7kOKlOwem5IyW68INDow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1wf+F860BHayQkHPUAjaHsO7vtxUbiF4+Jog8KP/aNwjFxuRbWorYlfpOsq2yOFJ
	 yGo13bXpyXsckMw+bCX1VwwexNE4RuT1TY9KNM0eM+gtlHUyMFgM5dPxSQRZT8I4W8
	 +uOPG6qsgAO0FkTcBODS3EWuDWHAo+5ckf38RPRU=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 07/20] arm64: fpsimd: Fold sve_init_regs() into do_sve_acc()
Date: Wed,  3 Jun 2026 12:06:17 +0100
Message-Id: <20260603110630.1027435-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040658_077268_2FA584BB 
X-CRM114-Status: GOOD (  18.79  )
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

For historical reasons, do_sve_acc() is structurally different from
do_sme_acc(), and the logic to convert the task from FPSIMD to SVE is
out-of-line in sve_init_regs(). We only use sve_init_regs() within
do_sve_acc(), so it's not necessary for this to be a separate function.

Fold sve_init_regs() into do_sve_acc(), and simplify the associated
comments. This makes do_sve_acc() structurally similar to do_sme_acc(),
making it easier to see similarities and differences.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 48 ++++++++++++++------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 60a45d600b460..a8395cb303344 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1293,31 +1293,6 @@ void sme_suspend_exit(void)
 
 #endif /* CONFIG_ARM64_SME */
 
-static void sve_init_regs(void)
-{
-	/*
-	 * Convert the FPSIMD state to SVE, zeroing all the state that
-	 * is not shared with FPSIMD. If (as is likely) the current
-	 * state is live in the registers then do this there and
-	 * update our metadata for the current task including
-	 * disabling the trap, otherwise update our in-memory copy.
-	 * We are guaranteed to not be in streaming mode, we can only
-	 * take a SVE trap when not in streaming mode and we can't be
-	 * in streaming mode when taking a SME trap.
-	 */
-	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
-		unsigned long vq_minus_one =
-			sve_vq_from_vl(task_get_sve_vl(current)) - 1;
-		sve_set_vq(vq_minus_one);
-		sve_flush_live(true, vq_minus_one);
-		fpsimd_bind_task_to_cpu();
-	} else {
-		fpsimd_to_sve(current);
-		current->thread.fp_type = FP_STATE_SVE;
-		fpsimd_flush_task_state(current);
-	}
-}
-
 /*
  * Trapped SVE access
  *
@@ -1349,13 +1324,24 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 		WARN_ON(1); /* SVE access shouldn't have trapped */
 
 	/*
-	 * Even if the task can have used streaming mode we can only
-	 * generate SVE access traps in normal SVE mode and
-	 * transitioning out of streaming mode may discard any
-	 * streaming mode state.  Always clear the high bits to avoid
-	 * any potential errors tracking what is properly initialised.
+	 * Convert the FPSIMD state to SVE. Stale SVE state can be present in
+	 * registers or memory, so we must zero all state that is not shared
+	 * with FPSIMD.
+	 *
+	 * SVE traps cannot be taken from streaming mode, so there cannot be
+	 * any effective streaming mode SVE state.
 	 */
-	sve_init_regs();
+	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
+		unsigned long vq_minus_one =
+			sve_vq_from_vl(task_get_sve_vl(current)) - 1;
+		sve_set_vq(vq_minus_one);
+		sve_flush_live(true, vq_minus_one);
+		fpsimd_bind_task_to_cpu();
+	} else {
+		fpsimd_to_sve(current);
+		current->thread.fp_type = FP_STATE_SVE;
+		fpsimd_flush_task_state(current);
+	}
 
 	put_cpu_fpsimd_context();
 }
-- 
2.30.2


