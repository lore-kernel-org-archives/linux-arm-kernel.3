Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AB1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tmV8pXYVBz2TEcGvVpi9a87NynlxAMUhsrmvYUuAAU=; b=inV8QgNOHB8N2v7Q98SvfJxvky
	V/xuShzXKFzA3QPzBg3oDt4v8lCaBi/QaGMbMXXTsusEWCTDZ6LU1srHPOJHev4PqhddbXCxYyGY8
	bHV35LbYl11jhtrjwbvNvE3THva7lwVRxXTdJlPgOjd+19D86T7nK/xoJugvzNXJVy4WW2qGJo30y
	l6f6MaMvNUS6FsceLKwnzNve7/+RZCMa+NVIMHo+PeHpEQEfJk/tnAOmZGM8Ua1xLWFoBtGKJCEWU
	vB6s+zQdhG5NA1VAACE6UdHsjvO0DvAaH4zT/I9nrb2+1xMQaIMOOnDiPXrj7futGdJOkKw+zUFyM
	aO8LYulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YYe-00000007veG-0jjF;
	Wed, 09 Apr 2025 16:45:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTX-00000007uuF-1FOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47BC01D6F;
	Wed,  9 Apr 2025 09:40:31 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9369C3F59E;
	Wed,  9 Apr 2025 09:40:29 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 02/13] arm64/fpsimd: Remove unused fpsimd_force_sync_to_sve()
Date: Wed,  9 Apr 2025 17:39:59 +0100
Message-Id: <20250409164010.3480271-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094031_377642_A1AB22D6 
X-CRM114-Status: GOOD (  11.66  )
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

There have been no users of fpsimd_force_sync_to_sve() since commit:

  bbc6172eefdb276b ("arm64/fpsimd: SME no longer requires SVE register state")

Remove fpsimd_force_sync_to_sve().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 -
 arch/arm64/kernel/fpsimd.c      | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 564bc09b3e06d..9c3e88ec873ab 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -196,7 +196,6 @@ struct vl_info {
 extern void sve_alloc(struct task_struct *task, bool flush);
 extern void fpsimd_release_task(struct task_struct *task);
 extern void fpsimd_sync_to_sve(struct task_struct *task);
-extern void fpsimd_force_sync_to_sve(struct task_struct *task);
 extern void sve_sync_to_fpsimd(struct task_struct *task);
 extern void sve_sync_from_fpsimd_zeropad(struct task_struct *task);
 
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 1ee5f330b8ed3..1391a491f2226 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -758,20 +758,6 @@ void sve_alloc(struct task_struct *task, bool flush)
 		kzalloc(sve_state_size(task), GFP_KERNEL);
 }
 
-
-/*
- * Force the FPSIMD state shared with SVE to be updated in the SVE state
- * even if the SVE state is the current active state.
- *
- * This should only be called by ptrace.  task must be non-runnable.
- * task->thread.sve_state must point to at least sve_state_size(task)
- * bytes of allocated kernel memory.
- */
-void fpsimd_force_sync_to_sve(struct task_struct *task)
-{
-	fpsimd_to_sve(task);
-}
-
 /*
  * Ensure that task->thread.sve_state is up to date with respect to
  * the user task, irrespective of when SVE is in use or not.
-- 
2.30.2


