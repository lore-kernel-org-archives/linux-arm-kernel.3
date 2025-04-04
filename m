Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urcjPGO/ldVu/mWI8JTzBSN6SKwOtRGa7u2Kt8myzPo=; b=CmJKV2jUNUemzK4HotsKOJo4RP
	lipR398hz4rUqhVU3M+blDS2icEZqmTWshQ7QTt6oIxY4oEYqCQAa3Hh2O7sJMOxrWNRnw8ucwzg/
	gcXXJTMkBZhyuim9wEinJDMfT9U7JOqcddFQmz0oGjRhmR84guqB5tGPLELdhpEmDooxWW2NaD842
	PyxTKQ6sC/0hXOMZEZthIHxeZIjCNGfkDmVAZn1ehVCGssF4aBjWRV32ojN2ALBCER8mXN+35ibGN
	1kK72W9mtd51L8CwZ8h5g+/cuWqhIAIxb0NqAiOI/4959YZJj2scT1pYnbxplx3Ec5YjarVXWYUF7
	guP8ksFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lDD-0000000CSS0-3Psv;
	Fri, 04 Apr 2025 17:52:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l60-0000000CROD-23qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43991516;
	Fri,  4 Apr 2025 10:44:49 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F0B33F63F;
	Fri,  4 Apr 2025 10:44:46 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 03/14] arm64/fpsimd: Remove redundant clearing of TIF_SVE
Date: Fri,  4 Apr 2025 18:44:24 +0100
Message-Id: <20250404174435.3288106-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104448_591186_CD70C388 
X-CRM114-Status: GOOD (  13.50  )
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

TIF_SVE implies that sve_state has been allocated. Barring specific
transient periods (e.g. during changes to SVE/SME vector lengths), it is
not valid for a task to have TIF_SVE set while sve_state is NULL.

This was not taken into account in commit:

  7559b7d7d651d397 ("arm64/sve: Better handle failure to allocate SVE register storage")

As of that commit, sve_set_common() and restore_sve_fpsimd_context()
clear TIF_SVE if sve_alloc() fails to allocate memory. In these cases
TIF_SVE cannot legitimately have been set to begin with, and clearing
TIF_SVE only serves to complicate the code. No other code paths clear
TIF_SVE if sve_alloc() fails to allocate memory.

The unnecessary clearing of TIF_SVE lead to further unnecessary changes
in commit:

  baa8515281b30861 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")

As of that commit, sve_set_common() also sets the task's saved fp_type
to FP_STATE_FPSIMD if sve_alloc() fails to allocate memory. This is
unnecessary as when sve_state is NULL, the saved fp_type can only
legitimately be FP_STATE_FPSIMD. That commit did not update
restore_sve_fpsimd_context() similarly, and so
restore_sve_fpsimd_context() does not alter the task's saved fp_type if
sve_alloc() fails to allocate memory.

Remove the unnecessary and confusing clearing of TIF_SVE, and remove the
similarly unnecessary and confusing update of the saved fp_type.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 2 --
 arch/arm64/kernel/signal.c | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f79b0d5f71ac9..575ececb8b720 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -969,8 +969,6 @@ static int sve_set_common(struct task_struct *target,
 	sve_alloc(target, true);
 	if (!target->thread.sve_state) {
 		ret = -ENOMEM;
-		clear_tsk_thread_flag(target, TIF_SVE);
-		target->thread.fp_type = FP_STATE_FPSIMD;
 		goto out;
 	}
 
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 99ea26d400ffe..40c572869325b 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -443,10 +443,8 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	/* From now, fpsimd_thread_switch() won't touch thread.sve_state */
 
 	sve_alloc(current, true);
-	if (!current->thread.sve_state) {
-		clear_thread_flag(TIF_SVE);
+	if (!current->thread.sve_state)
 		return -ENOMEM;
-	}
 
 	err = __copy_from_user(current->thread.sve_state,
 			       (char __user const *)user->sve +
-- 
2.30.2


