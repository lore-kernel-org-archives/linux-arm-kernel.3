Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990F8CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=beO3p0sGgaPSZJ7CEVgVK5oOxwna5ThF4lQVFI0LoQE=; b=Zrvn9ol8VM8Ovdq5WFiUxfVqqt
	iestsudgC0cxj6G22XrwLqUtXPruT9U8nJ39BhHuNlS0dirIZF8cg4G2kt2LHZ+pHdV46qtuSY+Me
	f0J9MabWXy3fFIblDTjf6+tScKlc9aOMikJk4yUwXlG1zN/dP6TDerxKSUAPTLtfDfbjRO39N/6wj
	Vrntwhen3hJ9LWNsGIIpOd6juL+vcMAhW+37EhND1ck0UrF8NAwrBT96lG70WD3/ot/d/QnxrI1C8
	5ywMF3/LXvqduIffdUbar0vheMYAB8bMqTOJ6U9nzP/Rchz9H0GJNwQ4ksXXHEA/aFWmwe99Fri6l
	+mCbp2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGWj-00000009Ayo-2UBv;
	Thu, 01 Oct 2026 13:08:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGWh-00000009Axs-2F92
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:08:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A29DE497;
	Thu,  1 Oct 2026 06:08:37 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 304F63F86F;
	Thu,  1 Oct 2026 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790860121; bh=EOm/D2KzQsEqdd7wd9is+uRLXDRLSy+/KsKEhGkvRR4=;
	h=From:To:Cc:Subject:Date:From;
	b=CaBg22uxt/8wUnwZp2/ZguuzWANQaNCf6V4wNtweFN+YgBY09Qzyd/ZHgZnx4zoJr
	 pZMkhrtIKbnXUCljBU0plEeaU9wWg+DGCxiahcIH6FS04ShuvDQGb8b+7t0obXzFI8
	 f5OJ7rSmyiZ0+gobtU55WgJOb8AEGD4giSRRvrGs=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	stable@vger.kernel.org,
	will@kernel.org
Subject: [PATCH] arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems
Date: Thu,  1 Oct 2026 14:08:36 +0100
Message-Id: <20261001130836.1410888-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_060843_667090_6B2B3B3C 
X-CRM114-Status: GOOD (  21.36  )
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

When system_supports_sme() is true but system_supports_sve() is false,
restoring a specifically crafted SVE signal context can result in the
task erroneously having non-streaming SVE state. Subsequent attempts to
manipulate the task's FPSIMD/SVE/SME state can result in a variety of
problems, including fatal EL1 UNDEFs.

In such configurations, the kernel always creates an SVE signal context
when delivering a signal, and this can only be in one of two states:

(1) SVE_SIG_FLAG_SM is set, and an SVE payload is present containing
    streaming mode SVE state. The recorded VL is the task's live
    streaming VL.

(2) SVE_SIG_FLAG_SM is clear, and an SVE payload is not present. The
    FPSIMD context contains the non-streaming mode FPSIMD state. The
    recorded VL is 0.

Currently restore_sve_fpsimd_context() correctly rejects cases where
SVE_SIG_FLAG_SM is set and an SVE payload is not present, but fails to
reject cases where SVE_SIG_FLAG_SM is clear and an SVE payload is
present. Consequently, restore_sve_fpsimd_context() can place the task
in a state where it has non-streaming SVE state even when this is not
supported by HW.

For example, this can cause a later EL1 UNDEF when the kernel attempts to
restore the task's ZCR_EL1 value:

| # ./sme-sigcontext-to-sve
| Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
| Modules linked in:
| CPU: 0 UID: 0 PID: 131 Comm: sme-sigcontext- Not tainted 7.3.0-rc1 #1 PREEMPT
| Hardware name: linux,dummy-virt (DT)
| pstate: 61402009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
| pc : fpsimd_restore_current_state+0x258/0x458
| lr : exit_to_user_mode_loop+0xb8/0x188
| sp : ffff80008056be40
| x29: ffff80008056be40 x28: fff00000c1670000 x27: 0000000000000000
| x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
| x23: ffff80008056bec0 x22: 0000000000000008 x21: 0000000000000040
| x20: 0000000000000081 x19: 0000000008800010 x18: 0000000000000000
| x17: 0000fffffd412570 x16: 0000000000001000 x15: 0000fffffd4123b0
| x14: 0000fffffd412780 x13: 0000fffffd412be8 x12: 0000000047435300
| x11: 0000fffffd412570 x10: 0000000000000000 x9 : 0000000045585401
| x8 : fff00000c18a6c44 x7 : 0000000000000000 x6 : 0000000000000002
| x5 : 0000000000000002 x4 : ffff800080568000 x3 : 0000000000000001
| x2 : 0000000008800010 x1 : fff00000c1670000 x0 : 0000000008800000
| Call trace:
|  fpsimd_restore_current_state+0x258/0x458 (P)
|  exit_to_user_mode_loop+0xb8/0x188
|  el0_svc+0x1cc/0x1d0
|  el0t_64_sync_handler+0xa0/0xe4
|  el0t_64_sync+0x198/0x19c
| Code: d5384101 f9400020 53175c03 36b80de0 (d5381202)
| ---[ end trace 0000000000000000 ]---
| Kernel panic - not syncing: Oops - Undefined instruction: Fatal exception in interrupt
| Kernel Offset: 0x291fb1000000 from 0xffff800080000000
| PHYS_OFFSET: 0x40000000
| CPU features: 0x0,00000000,0052802f,ffb88f43,3afcf73f
| Memory Limit: none

Rework restore_sve_fpsimd_context() to reject cases where
SVE_SIG_FLAG_SM is clear and an SVE payload is not present. As
parse_user_sigframe() rejects SVE signal frames when neither SVE nor SME
are supported, it isn't necessary for restore_sve_fpsimd_context() to
handle the case where neither are supported.

Fixes: 7dde62f0687c  ("arm64/signal: Always accept SVE signal frames on SME only systems")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/signal.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

I've given this a spin on a model atop v7.3-rc1, in all combinations of
SVE and/or SME being supported, running the fpsimd and signal kselftests.

Regardless of this patch, the kselftests themselves are broken for
SME-only configurations. The signal tests have been broken for at least
3 years (since the kernel started creating SVE contexts on SME-only
systems), so evidently such configurations are not being tested. I have
some local fixes for the kselftests that I will send out soon.

Mark.

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 38e6fa204c17b..6a06a4e352b1d 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -433,6 +433,7 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	unsigned int vl, vq;
 	struct user_fpsimd_state fpsimd;
 	u16 user_vl, flags;
+	bool fpsimd_only;
 	bool sm;
 
 	if (user->sve_size < sizeof(*user->sve))
@@ -443,19 +444,33 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (err)
 		return err;
 
+	fpsimd_only = (user->sve_size == sizeof(*user->sve));
 	sm = flags & SVE_SIG_FLAG_SM;
+
 	if (sm) {
 		if (!system_supports_sme())
 			return -EINVAL;
 
+		/*
+		 * Streaming SVE state is always preserved with an SVE payload.
+		 * Only accept streaming state which has an SVE payload.
+		 */
+		if (fpsimd_only)
+			return -EINVAL;
+
 		vl = task_get_sme_vl(current);
 	} else {
 		/*
-		 * A SME only system use SVE for streaming mode so can
-		 * have a SVE formatted context with a zero VL and no
-		 * payload data.
+		 * Non-streaming SVE state may be preserved without an SVE
+		 * payload, in which case all state is saved in the FPSIMD
+		 * context.
+		 *
+		 * On SME-only systems, non-streaming (FPSIMD-only) state is
+		 * always preserved without an SVE payload, and with VL==0. On
+		 * such systems, only accept non-streaming state without an SVE
+		 * payload.
 		 */
-		if (!system_supports_sve() && !system_supports_sme())
+		if (!system_supports_sve() && !fpsimd_only)
 			return -EINVAL;
 
 		vl = task_get_sve_vl(current);
@@ -464,16 +479,7 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (user_vl != vl)
 		return -EINVAL;
 
-	/*
-	 * Non-streaming SVE state may be preserved without an SVE payload, in
-	 * which case the SVE context only has a header with VL==0, and all
-	 * state can be restored from the FPSIMD context.
-	 *
-	 * Streaming SVE state is always preserved with an SVE payload. For
-	 * consistency and robustness, reject restoring streaming SVE state
-	 * without an SVE payload.
-	 */
-	if (!sm && user->sve_size == sizeof(*user->sve))
+	if (fpsimd_only)
 		return restore_fpsimd_context(user);
 
 	vq = sve_vq_from_vl(vl);
-- 
2.30.2


