Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAJOfxqME/wGtmL0ltejd33aSpgxllbYRKYEu+7OKXA=; b=SyKUnBQKEnJj+XuSI1OMq2q56i
	Jg01D4b6RH+W6L9LKRE/OSWGU9l/z/4YWDlpZ93wn47yEkro0Hnt77SjDpX/5A5ZRqKR14sTTYx88
	F44yTu/eMLJskDW0b+9r0vR43VJUgLD1mj1AnvqSsSiiL9we5ZEO8L2+UUWq1AOE6SzXL1to/Gq9Z
	HzIhzlj+T9AMy2oZGMsgB6EXTCcpwJ1R/lW7Fix9AasYVV12vWH5vrbij1n1HDNrYFqaFC6uaXtDI
	4dn/pNQOYEkHOQDv6h2lLt6pbHo2lBvtN+IZRgiEGYEi+q7JOjTbk+IW+lhgLKMTnLqCWQ2T6/r5A
	OvjjxQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1RF-00000000m25-1Lkn;
	Thu, 08 May 2025 13:37:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Ha-00000000kN4-0KfL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EDE7106F;
	Thu,  8 May 2025 06:27:15 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E3CF3F58B;
	Thu,  8 May 2025 06:27:23 -0700 (PDT)
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
Subject: [PATCH v2 04/24] arm64/fpsimd: signal: Consistently read FPSIMD context
Date: Thu,  8 May 2025 14:26:24 +0100
Message-Id: <20250508132644.1395904-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062726_200263_5FF562D0 
X-CRM114-Status: GOOD (  17.80  )
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

For historical reasons, restore_sve_fpsimd_context() has an open-coded
copy of the logic from read_fpsimd_context(), which is used to either
restore an FPSIMD-only context, or to merge FPSIMD state into an
SVE state when restoring an SVE+FPSIMD context. The logic is *almost*
identical.

Refactor the logic to avoid duplication and make this clearer.

This comes with two functional changes that I do not believe will be
problematic in practice:

* The user_fpsimd_state::size field will be checked in all restore paths
  that consume it user_fpsimd_state. The kernel always populates this
  field when delivering a signal, and so this should contain the
  expected value unless it has been corrupted.

* If a read of user_fpsimd_state fails, we will return early without
  modifying TIF_SVE, the saved SVCR, or the save fp_type. This will
  leave the task in a consistent state, without potentially resurrecting
  stale FPSIMD state. A read of user_fpsimd_state should never fail
  unless the structure has been corrupted or the stack has been
  unmapped.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 57 +++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index e898948a31b65..87890d7be8de3 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -264,30 +264,40 @@ static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
 	return err ? -EFAULT : 0;
 }
 
-static int restore_fpsimd_context(struct user_ctxs *user)
+static int read_fpsimd_context(struct user_fpsimd_state *fpsimd,
+			       struct user_ctxs *user)
 {
-	struct user_fpsimd_state fpsimd;
-	int err = 0;
+	int err;
 
 	/* check the size information */
 	if (user->fpsimd_size != sizeof(struct fpsimd_context))
 		return -EINVAL;
 
 	/* copy the FP and status/control registers */
-	err = __copy_from_user(fpsimd.vregs, &(user->fpsimd->vregs),
-			       sizeof(fpsimd.vregs));
-	__get_user_error(fpsimd.fpsr, &(user->fpsimd->fpsr), err);
-	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
+	err = __copy_from_user(fpsimd->vregs, &(user->fpsimd->vregs),
+			       sizeof(fpsimd->vregs));
+	__get_user_error(fpsimd->fpsr, &(user->fpsimd->fpsr), err);
+	__get_user_error(fpsimd->fpcr, &(user->fpsimd->fpcr), err);
+
+	return err;
+}
+
+static int restore_fpsimd_context(struct user_ctxs *user)
+{
+	struct user_fpsimd_state fpsimd;
+	int err;
+
+	err = read_fpsimd_context(&fpsimd, user);
+	if (err)
+		return err;
 
 	clear_thread_flag(TIF_SVE);
 	current->thread.svcr &= ~SVCR_SM_MASK;
 	current->thread.fp_type = FP_STATE_FPSIMD;
 
 	/* load the hardware registers from the fpsimd_state structure */
-	if (!err)
-		fpsimd_update_current_state(&fpsimd);
-
-	return err ? -EFAULT : 0;
+	fpsimd_update_current_state(&fpsimd);
+	return 0;
 }
 
 static int preserve_fpmr_context(struct fpmr_context __user *ctx)
@@ -427,12 +437,8 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	 * consistency and robustness, reject restoring streaming SVE state
 	 * without an SVE payload.
 	 */
-	if (!sm && user->sve_size == sizeof(*user->sve)) {
-		clear_thread_flag(TIF_SVE);
-		current->thread.svcr &= ~SVCR_SM_MASK;
-		current->thread.fp_type = FP_STATE_FPSIMD;
-		goto fpsimd_only;
-	}
+	if (!sm && user->sve_size == sizeof(*user->sve))
+		return restore_fpsimd_context(user);
 
 	vq = sve_vq_from_vl(vl);
 
@@ -458,19 +464,14 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 		set_thread_flag(TIF_SVE);
 	current->thread.fp_type = FP_STATE_SVE;
 
-fpsimd_only:
-	/* copy the FP and status/control registers */
-	/* restore_sigframe() already checked that user->fpsimd != NULL. */
-	err = __copy_from_user(fpsimd.vregs, user->fpsimd->vregs,
-			       sizeof(fpsimd.vregs));
-	__get_user_error(fpsimd.fpsr, &user->fpsimd->fpsr, err);
-	__get_user_error(fpsimd.fpcr, &user->fpsimd->fpcr, err);
+	err = read_fpsimd_context(&fpsimd, user);
+	if (err)
+		return -EFAULT;
 
-	/* load the hardware registers from the fpsimd_state structure */
-	if (!err)
-		fpsimd_update_current_state(&fpsimd);
+	/* Merge the FPSIMD registers into the SVE state */
+	fpsimd_update_current_state(&fpsimd);
 
-	return err ? -EFAULT : 0;
+	return 0;
 }
 
 #else /* ! CONFIG_ARM64_SVE */
-- 
2.30.2


