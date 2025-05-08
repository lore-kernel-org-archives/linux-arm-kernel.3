Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA5C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx6YTfovuApz1UR23c3JzyaRkpAizfiaAE5NL3mEL9g=; b=YQYfR9Vq5H2TBdDjNESk2ETguh
	qxIMxxWEKypnHZaBFocxOTYnflINkv7uBoa8TNQcR4aG8whOmpAKpNf0oL8FHx3LWnQco5MzPHqzx
	C+te9WNi6M/9OW3h8ZT8SYzzyqgm0lZxfSZCTMzN5gb4Wbr+7Mi6MJKNWu33B1u0t9/zSOZznxuaP
	CRq+oRSPfQCEy2ep5/92HdKEefUdZMw1WJ3jKHoDaY/TPUqrughJDMuxqmOr5Qwm2r50j37q1cB08
	fV2ekJ9ejUlq6yveY5oaYjnZ0phslb72Sgmdh4dzpOfxY8gUssg3c8DB1lPkanYVjZvYj5KW+hWtA
	d7yRUMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1PK-00000000ljr-2ltk;
	Thu, 08 May 2025 13:35:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1HU-00000000kLN-24ux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C35106F;
	Thu,  8 May 2025 06:27:09 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF88D3F58B;
	Thu,  8 May 2025 06:27:17 -0700 (PDT)
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
Subject: [PATCH v2 02/24] arm64/fpsimd: signal: Clear PSTATE.SM when restoring FPSIMD frame only
Date: Thu,  8 May 2025 14:26:22 +0100
Message-Id: <20250508132644.1395904-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062720_660513_49FAE77B 
X-CRM114-Status: GOOD (  13.27  )
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

On systems with SVE and/or SME, the kernel will always create SVE and
FPSIMD signal frames when delivering a signal, but a user can manipulate
signal frames such that a signal return only observes an FPSIMD signal
frame. When this happens, restore_fpsimd_context() will restore state
such that fp_type==FP_STATE_FPSIMD, but will leave PSTATE.SM as-is.

It is possible for a user to set PSTATE.SM between syscall entry and
execution of the sigreturn logic (e.g. via ptrace), and consequently the
sigreturn may result in the task having PSTATE.SM==1 and
fp_type==FP_STATE_FPSIMD.

For various reasons it is not legitimate for a task to be in a state
where PSTATE.SM==1 and fp_type==FP_STATE_FPSIMD. Portions of the user
ABI are written with the requirement that streaming SVE state is always
presented in SVE format rather than FPSIMD format, and as there is no
mechanism to permit access to only the FPSIMD subset of streaming SVE
state, streaming SVE state must always be saved and restored in SVE
format.

Fix restore_fpsimd_context() to clear PSTATE.SM when restoring an FPSIMD
signal frame without an SVE signal frame. This matches the current
behaviour when an SVE signal frame is present, but the SVE signal frame
has no register payload (e.g. as is the case on SME-only systems which
lack SVE).

This change should have no effect for applications which do not alter
signal frames (i.e. almost all applications). I do not expect
non-{malicious,buggy} applications to hide the SVE signal frame, but
I've chosen to clear PSTATE.SM rather than mandating the presence of an
SVE signal frame in case there is some legacy (non-SME) usage that I am
not currently aware of.

For context, the SME handling was originally introduced in commit:

  85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")

... and subsequently updated/fixed to handle SME-only systems in commits:

  7dde62f0687c ("arm64/signal: Always accept SVE signal frames on SME only systems")
  f26cd7372160 ("arm64/signal: Always allocate SVE signal frames on SME only systems")

Fixes: 85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 48d3c0129dade..fdce1b856f498 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -280,6 +280,7 @@ static int restore_fpsimd_context(struct user_ctxs *user)
 	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
 
 	clear_thread_flag(TIF_SVE);
+	current->thread.svcr &= ~SVCR_SM_MASK;
 	current->thread.fp_type = FP_STATE_FPSIMD;
 
 	/* load the hardware registers from the fpsimd_state structure */
-- 
2.30.2


