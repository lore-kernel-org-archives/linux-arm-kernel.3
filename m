Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287CFC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oOywI3lWUi+ThL0evAN+qRgbUGNCNJIAVRpALASeb0=; b=1i0bd+lFjMgDARHxH8M0tUSxys
	5b/YnqQU35wRv9yiEXtEHWj+SqmvrU0sCt9ViR6vT7zStxUk/xy7/jV1TAnSa5UX++6waJH8DLFVy
	bIwyRlaB87dy0xr1QKq/4GIAMWHSp/m16NIiTx2D1+kYLDGei/AzMBip5G0nfzCUPYV2mEnRZys3j
	qbIb+ef2uZa8LUEY5j322CreJDn47eHH9UX8kDOTPwaJWc6ZY79bplR3fn7/9UkIeqpFK1n88A00H
	seQktJG0yH+71mbu7V/KeB/ajIQirAkbETY0rJ/k0m0MKyI3s7Gf5JZ2T0RTUqRrsZMPEC/JWj+bB
	PxjKKdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCO99-0000000DFk0-10YK;
	Tue, 06 May 2025 19:40:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBX-0000000CUW5-26UA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:26:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 732B41007;
	Tue,  6 May 2025 08:26:09 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB66E3F58B;
	Tue,  6 May 2025 08:26:16 -0700 (PDT)
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
Subject: [PATCH 14/20] arm64/fpsimd: ptrace/prctl: Ensure VL changes do not resurrect stale data
Date: Tue,  6 May 2025 16:25:17 +0100
Message-Id: <20250506152523.1107431-15-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082619_582352_9299DF53 
X-CRM114-Status: GOOD (  12.75  )
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

The SVE/SME vector lengths can be changed via prctl/ptrace syscalls.
Changes to the SVE/SME vector lengths are documented as preserving the
lower 128 bits of the Z registers (i.e. the bits shared with the FPSIMD
V registers). To ensure this, vec_set_vector_length() explicitly copies
register values from a task's saved SVE state to its saved FPSIMD state
when dropping the task to FPSIMD-only.

The logic for this was not updated when when FPSIMD/SVE state tracking
was changed across commits:

  baa8515281b3 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
  a0136be443d5 (arm64/fpsimd: Load FP state based on recorded data type")
  bbc6172eefdb ("arm64/fpsimd: SME no longer requires SVE register state")
  8c845e273104 ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")

Since the last commit above, a task's FPSIMD/SVE state may be stored in
FPSIMD format while TIF_SVE is set, and the stored SVE state is stale.
When vec_set_vector_length() encounters this case, it will erroneously
clobber the live FPSIMD state with stale SVE state by using
sve_to_fpsimd().

Fix this by using fpsimd_sync_from_effective_state() instead.

Related issues with streaming mode state will be addressed in subsequent
patches.

Fixes: 8c845e273104 ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index fe96e018e18c0..faeedaab0558e 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -852,7 +852,7 @@ int vec_set_vector_length(struct task_struct *task, enum vec_type type,
 	fpsimd_flush_task_state(task);
 	if (test_and_clear_tsk_thread_flag(task, TIF_SVE) ||
 	    thread_sm_enabled(&task->thread)) {
-		sve_to_fpsimd(task);
+		fpsimd_sync_from_effective_state(task);
 		task->thread.fp_type = FP_STATE_FPSIMD;
 	}
 
-- 
2.30.2


