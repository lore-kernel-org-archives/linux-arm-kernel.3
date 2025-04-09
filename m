Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A60C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHA8jKZbxyVmnYMLzHVWyd6qL64Gcvo0HCQVPnx3SDs=; b=1lCWNQ4gyXvRvYYC6NNQxaCimA
	BZN2eRGWcZd327C9+CXyJAi/zkkQ0R8lN4s8xn0rFL1vTDgdwp+76UMau56UbTsnXaA7CyoDjidBp
	GtIY9H5pxNIJjUj8M4i4TBf9+B+BtM4DYeVE8tE29sDrAgvbKAkp3vezSLINHPSdAQ0JCcwc15l/i
	7joTCMZPHUb/4MSnrq8O44zDAUh95IMuYNvmmets7SaRYOmTNFYRndlb6rv4TTM0ts6hZ2oHqATeT
	MobWfry93FAZ2SyKZey62j/3jw3djqJkchtAgdkprZVhRl8UgghSN8ebNr3KMnqZLk9EXCINCsX32
	a2GPV5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ydu-00000007wY7-14ge;
	Wed, 09 Apr 2025 16:51:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTd-00000007uvu-3oDN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1F4C1D6F;
	Wed,  9 Apr 2025 09:40:37 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AEAC3F59E;
	Wed,  9 Apr 2025 09:40:36 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 05/13] arm64/fpsimd: Discard stale CPU state when handling SME traps
Date: Wed,  9 Apr 2025 17:40:02 +0100
Message-Id: <20250409164010.3480271-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094038_076980_AB096A9D 
X-CRM114-Status: GOOD (  15.88  )
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

From: Mark Brown <broonie@kernel.org>

The logic for handling SME traps manipulates saved FPSIMD/SVE/SME state
incorrectly, and a race with preemption can result in a task having
TIF_SME set and TIF_FOREIGN_FPSTATE clear even though the live CPU state
is stale (e.g. with SME traps enabled). This can result in warnings from
do_sme_acc() where SME traps are not expected while TIF_SME is set:

|        /* With TIF_SME userspace shouldn't generate any traps */
|        if (test_and_set_thread_flag(TIF_SME))
|                WARN_ON(1);

This is very similar to the SVE issue we fixed in commit:

  751ecf6afd6568ad ("arm64/sve: Discard stale CPU state when handling SVE traps")

The race can occur when the SME trap handler is preempted before and
after manipulating the saved FPSIMD/SVE/SME state, starting and ending on
the same CPU, e.g.

| void do_sme_acc(unsigned long esr, struct pt_regs *regs)
| {
|         // Trap on CPU 0 with TIF_SME clear, SME traps enabled
|         // task->fpsimd_cpu is 0.
|         // per_cpu_ptr(&fpsimd_last_state, 0) is task.
|
|         ...
|
|         // Preempted; migrated from CPU 0 to CPU 1.
|         // TIF_FOREIGN_FPSTATE is set.
|
|         get_cpu_fpsimd_context();
|
|         /* With TIF_SME userspace shouldn't generate any traps */
|         if (test_and_set_thread_flag(TIF_SME))
|                 WARN_ON(1);
|
|         if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
|                 unsigned long vq_minus_one =
|                         sve_vq_from_vl(task_get_sme_vl(current)) - 1;
|                 sme_set_vq(vq_minus_one);
|
|                 fpsimd_bind_task_to_cpu();
|         }
|
|         put_cpu_fpsimd_context();
|
|         // Preempted; migrated from CPU 1 to CPU 0.
|         // task->fpsimd_cpu is still 0
|         // If per_cpu_ptr(&fpsimd_last_state, 0) is still task then:
|         // - Stale HW state is reused (with SME traps enabled)
|         // - TIF_FOREIGN_FPSTATE is cleared
|         // - A return to userspace skips HW state restore
| }

Fix the case where the state is not live and TIF_FOREIGN_FPSTATE is set
by calling fpsimd_flush_task_state() to detach from the saved CPU
state. This ensures that a subsequent context switch will not reuse the
stale CPU state, and will instead set TIF_FOREIGN_FPSTATE, forcing the
new state to be reloaded from memory prior to a return to userspace.

Note: this was originallly posted as [1].

Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/20241204-arm64-sme-reenable-v2-1-bae87728251d@kernel.org/ # [1]
[ Rutland: rewrite commit message ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 128774015772a..b4858d85292b4 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1435,6 +1435,8 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 		sme_set_vq(vq_minus_one);
 
 		fpsimd_bind_task_to_cpu();
+	} else {
+		fpsimd_flush_task_state(current);
 	}
 
 	put_cpu_fpsimd_context();
-- 
2.30.2


