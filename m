Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A87FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rzY4bvm1L9RJoNH/Kd8fY7EdE2RG+oZBhZocf3tDJQ=; b=naIr4nFdsBHxy0ZiXbAT501A6t
	jg/XlnWgzpMUwlJGeG41r0/itr/QqJucMYUk3+9ClC0p9uahxG8y5ptEa2FBhvfnVDaWEAS3T+flX
	dAbHJFwB37BwPoWDtqykv7cCwO4LH2mtYvbWCk6o5joYJJ+8IglJCfWWhoqGSLUSg3Wa9a9Qc5Eie
	JqeAFDXRfm4n/GnYj2CdzdZUMJlsIoQ/m+D7ySXUJlHFxznAb32QGYyBWV52KXok2D0pQ2tfQFeBu
	rtcrPzz1eO3Tm0RtyWaRbSXpK4x8ylMwANeI+5H4XnWtt2gvQc+A9njosVckwcjZdNEhdJMPUyaji
	eenRNBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YaO-00000007vvs-3r5a;
	Wed, 09 Apr 2025 16:47:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTZ-00000007uvA-1OPR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C61A1D70;
	Wed,  9 Apr 2025 09:40:33 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B93873F59E;
	Wed,  9 Apr 2025 09:40:31 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 03/13] arm64/fpsimd: Remove redundant SVE trap manipulation
Date: Wed,  9 Apr 2025 17:40:00 +0100
Message-Id: <20250409164010.3480271-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094033_409659_CB032E13 
X-CRM114-Status: GOOD (  12.01  )
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

When task_fpsimd_load() loads the saved FPSIMD/SVE/SME state, it
configures EL0 SVE traps by calling sve_user_{enable,disable}(). This is
unnecessary, and this is suspicious/confusing as task_fpsimd_load() does
not configure EL0 SME traps.

All calls to task_fpsimd_load() are followed by a call to
fpsimd_bind_task_to_cpu(), where the latter configures traps for SVE and
SME dependent upon the current values of TIF_SVE and TIF_SME, overriding
any trap configuration performed by task_fpsimd_load().

The calls to sve_user_{enable,disable}() calls in task_fpsimd_load()
have been redundant (though benign) since they were introduced in
commit:

  a0136be443d51803 ("arm64/fpsimd: Load FP state based on recorded data type")

Remove the unnecessary and confusing SVE trap manipulation.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 1391a491f2226..757445d72e5b7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -366,13 +366,11 @@ static void task_fpsimd_load(void)
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
 			/* Stop tracking SVE for this task until next use. */
-			if (test_and_clear_thread_flag(TIF_SVE))
-				sve_user_disable();
+			clear_thread_flag(TIF_SVE);
 			break;
 		case FP_STATE_SVE:
-			if (!thread_sm_enabled(&current->thread) &&
-			    !WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE)))
-				sve_user_enable();
+			if (!thread_sm_enabled(&current->thread))
+				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
 			if (test_thread_flag(TIF_SVE))
 				sve_set_vq(sve_vq_from_vl(task_get_sve_vl(current)) - 1);
-- 
2.30.2


