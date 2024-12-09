Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED133E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ILvmy54JWA4zTvJTtPsNzaYB6nztcd2Ns/mns53N58=; b=KjlYWKdmltfnKJdro5/10bOLTB
	qyRsPcR+Cq/sZJl/pUe6VcdDAlEtpanPvqJ4HLsPEehl+6CogBVTeOvR6xgH26gNqRD0FFwgIf5q2
	Mpkidvl4u+yACdz46Kd35b1yxC13XLa/gQgijnTkyVEpi93tdI8Z1f3t2tNCKBChtcuddlkXmqaCl
	szx2vgwpgf1YqKJZ80ofi1T2sjXzT59jlVMUssaU17RiY3wP+BKKsVIdcWW13QoMRxqlm31XLlosT
	yRR6TnrHkyQYFfkg7NumcBpMO7QltMHWQdGch1cCgFK3aaPZa2BHfHhpGrnNT5f98OYkMxe/0lY/i
	PXdCETPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbZf-00000007Q9q-3ngA;
	Mon, 09 Dec 2024 11:05:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbYc-00000007Ptv-1FqK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:04:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E65D2113E;
	Mon,  9 Dec 2024 03:04:31 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEA383F5A1;
	Mon,  9 Dec 2024 03:04:02 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aishwarya.tcv@arm.com,
	catalin.marinas@arm.com,
	kent.overstreet@linux.dev,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH] arm64: stacktrace: skip reporting LR at exception boundaries
Date: Mon,  9 Dec 2024 11:03:51 +0000
Message-Id: <20241209110351.1876804-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_030406_423649_8686A967 
X-CRM114-Status: GOOD (  13.94  )
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

Recently the arm64 stacktrace code was modified to report the LR at
exception boundaries, which interacts poorly with fgraph tracing. It is
possible for the LR to contain the start address of return_to_handler()
even when the LR is not live, and in such cases attempts to recover the
return address via ftrace_graph_ret_addr() may fail, triggering a
WARN_ON_ONCE() in kunwind_recover_return_address() and aborting the
unwind. This has resulted in test failures and unexpected warnings, as
reported by Aishwarya and Kent.

Handling unreliable LR values in these cases is likely to require some
larger rework, so for the moment avoid this problem by restoring the old
behaviour of skipping the LR at exception boundaries, as we did prior to
commit:

  c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")

This commit is effectively a partial revert, keeping the structures and
logic to explicitly identify exception boundaries while still skipping
reporting of the LR. The logic to explicitly identify exception
boundaries is still useful for general robustness and as a building
block for future support for reliably stacktracing.

Fixes: c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/stacktrace.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index caef85462acb6..4a08ad8158380 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -26,7 +26,6 @@ enum kunwind_source {
 	KUNWIND_SOURCE_CALLER,
 	KUNWIND_SOURCE_TASK,
 	KUNWIND_SOURCE_REGS_PC,
-	KUNWIND_SOURCE_REGS_LR,
 };
 
 union unwind_flags {
@@ -178,23 +177,8 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
 	state->regs = regs;
 	state->common.pc = regs->pc;
 	state->common.fp = regs->regs[29];
-	state->source = KUNWIND_SOURCE_REGS_PC;
-	return 0;
-}
-
-static __always_inline int
-kunwind_next_regs_lr(struct kunwind_state *state)
-{
-	/*
-	 * The stack for the regs was consumed by kunwind_next_regs_pc(), so we
-	 * cannot consume that again here, but we know the regs are safe to
-	 * access.
-	 */
-	state->common.pc = state->regs->regs[30];
-	state->common.fp = state->regs->regs[29];
 	state->regs = NULL;
-	state->source = KUNWIND_SOURCE_REGS_LR;
-
+	state->source = KUNWIND_SOURCE_REGS_PC;
 	return 0;
 }
 
@@ -274,11 +258,8 @@ kunwind_next(struct kunwind_state *state)
 	case KUNWIND_SOURCE_FRAME:
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
-	case KUNWIND_SOURCE_REGS_LR:
-		err = kunwind_next_frame_record(state);
-		break;
 	case KUNWIND_SOURCE_REGS_PC:
-		err = kunwind_next_regs_lr(state);
+		err = kunwind_next_frame_record(state);
 		break;
 	default:
 		err = -EINVAL;
@@ -436,7 +417,6 @@ static const char *state_source_string(const struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:	return "C";
 	case KUNWIND_SOURCE_TASK:	return "T";
 	case KUNWIND_SOURCE_REGS_PC:	return "P";
-	case KUNWIND_SOURCE_REGS_LR:	return "L";
 	default:			return "U";
 	}
 }
-- 
2.30.2


