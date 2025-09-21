Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0036CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyGetInE+W3z0vlrvglTsxr9vcyzVq8PifvfYA3QYGI=; b=mBfRjCdq6Rkv5kgyNDcuJ5esMK
	tqgrkJRPMcJnNkuJcqMZFFpbI53qTxiaVedRwtd0pi2hq0ZVMOmpeJmrHCUMqVDVWXUX02lXbGTlc
	bAS4B6/GTP+N/BXg6nzBipCMyLjTqdrs9bWEW3V+foEjY7buXgQ1syPKfECticOoqvViI7Tz/8WOU
	m9FWHJsaKEJyEi8XkaN0wew+xcKt1oyg8nafdVlbAmhTu0CD48EXwRBF1AikFwKJBdfSKUoeE3IU9
	fSh6Z2mxFyDn4n9PThVn/gSuYkER5NdYu3fGeemdpCIyfvNMSMCVnz1hsplxLp7Q0Glg369jVJD0Y
	ZxNBO6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0K4A-00000007WdV-2aWu;
	Sun, 21 Sep 2025 13:25:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0K46-00000007Wbs-3eTy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 13:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBF19601D8;
	Sun, 21 Sep 2025 13:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30C5C4CEE7;
	Sun, 21 Sep 2025 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758461116;
	bh=3qNbncmT90BPzEJJHaLs2HVYvULpPXQpoFHOrv1erBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LELg0SYPD4AnIDaWLAu7E81AxissJD842S6MuNVrG1RFsyPlCbT2Ikp9npXmc3zS4
	 APgEQFsJdTfs0Xem42FH0e6T3dJgH54tBLpN/ik4OSFIx7jhvw0+bAkA0q+0F/qnqX
	 HJhYX9W8EDUlsAhRXwZF1zReLBAzJFY20RRI5QT5lLWfgMT38DO460BPTDJxvRN2oM
	 TrKd3a4xu8iEx27dZsTRTL2odEMNjeldVunfaK42YRy9B5EGKlQ5WlYLYEJbxnH3pi
	 HOGXJTKhxezIYbL4/T9/XBXpi8ThZFezQNA6ELX1McasStH9dEJiXfqPKnR0FYaV+b
	 ECQXzrJFfGSGA==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 21 Sep 2025 14:21:35 +0100
Subject: [PATCH RFC 1/3] arm64/gcs: Support reuse of GCS for exited threads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
In-Reply-To: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Carlos O'Donell <codonell@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Szabolcs Nagy <nsz@port70.net>, Rich Felker <dalias@libc.org>, 
 libc-alpha@sourceware.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=3650; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3qNbncmT90BPzEJJHaLs2HVYvULpPXQpoFHOrv1erBo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoz/yzTrIqPApQZ0OfMN2FYRkkN4DO788ZCG5kU
 PVriIJMj4CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaM/8swAKCRAk1otyXVSH
 0NHRB/4k36acdvvxC+SKXrPfjdAtzk1eCyj6iuuVO5LAxs4zrxRm6LUg9s4WJ07cPKb3T3N5ZrY
 F5vo4dKHb2F3EndagY7KQOHPaGje9/F1AJ8tt+1wyi1xjZD/F90TZjcft12SK3g4JIjmUu/2aLZ
 07mEKDHO6Q0OUznBkfTP9bwgxcyart2aD/YrHd6zpBMMNlXmV9BzEmC6Bk+6EfbFT9QkQkDwYSX
 30skzdWJVYBR8D9zfh/yAYi7fUnIIS7IfkenPzWzTedNh5i1QNfXBdHO4lu1B64ueOQPVRg+X9R
 NAWweJWKOPneipsyzmQWfGkPxQxVZqC7a/S/hJhXjqSlCy5J
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Currently when a thread with a userspace allocated stack exits it is not
possible for the GCS that was in use by the thread to be reused since no
stack switch token will be left on the stack, preventing use with
clone3() or userspace stack switching. The only thing userspace can
realistically do with the GCS is inspect it or unmap it which is not
ideal.

Enable reuse by modelling thread exit like pivoting in userspace with
the stack pivot instructions, writing a stack switch token at the top
entry of the GCS of the exiting thread.  This allows userspace to switch
back to the GCS in future, the use of the current stack location should
work well with glibc's current behaviour of fully uwninding the stack of
threads that exit cleanly.

This patch is an RFC and should not be applied as-is. Currently the
token will only be written for the current thread, but will be written
regardless of the reason the thread is exiting. This version of the
patch does not handle scheduling during exit() at all, the code is racy.

The feature is gated behind a new GCS mode flag PR_SHADOW_STACK_EXIT_TOKEN
to ensure that userspace that does not wish to use the tokens never has
to see them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h |  3 ++-
 arch/arm64/mm/gcs.c          | 25 ++++++++++++++++++++++++-
 include/uapi/linux/prctl.h   |  1 +
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index b4bbec9382a1..1ec359d0ad51 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -52,7 +52,8 @@ static inline u64 gcsss2(void)
 }
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK \
-	(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH)
+	(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | \
+	 PR_SHADOW_STACK_PUSH | PR_SHADOW_STACK_EXIT_TOKEN)
 
 #ifdef CONFIG_ARM64_GCS
 
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index fd1d5a6655de..4649c2b107a7 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -199,14 +199,37 @@ void gcs_set_el0_mode(struct task_struct *task)
 
 void gcs_free(struct task_struct *task)
 {
+	unsigned long __user *cap_ptr;
+	unsigned long cap_val;
+	int ret;
+
 	if (!system_supports_gcs())
 		return;
 
 	if (!task->mm || task->mm != current->mm)
 		return;
 
-	if (task->thread.gcs_base)
+	if (task->thread.gcs_base) {
 		vm_munmap(task->thread.gcs_base, task->thread.gcs_size);
+	} else if (task == current &&
+		   task->thread.gcs_el0_mode & PR_SHADOW_STACK_EXIT_TOKEN) {
+		cap_ptr = (unsigned long __user *)read_sysreg_s(SYS_GCSPR_EL0);
+		cap_ptr--;
+		cap_val = GCS_CAP(cap_ptr);
+
+		/*
+		 * We can't do anything constructive if this fails,
+		 * and the thread might be exiting due to being in a
+		 * bad state anyway.
+		 */
+		put_user_gcs(cap_val, cap_ptr, &ret);
+
+		/*
+		 * Ensure the new cap is ordered before standard
+		 * memory accesses to the same location.
+		 */
+		gcsb_dsync();
+	}
 
 	task->thread.gcspr_el0 = 0;
 	task->thread.gcs_base = 0;
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index ed3aed264aeb..c3c37c39639f 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -352,6 +352,7 @@ struct prctl_mm_map {
 # define PR_SHADOW_STACK_ENABLE         (1UL << 0)
 # define PR_SHADOW_STACK_WRITE		(1UL << 1)
 # define PR_SHADOW_STACK_PUSH		(1UL << 2)
+# define PR_SHADOW_STACK_EXIT_TOKEN	(1UL << 3)
 
 /*
  * Prevent further changes to the specified shadow stack

-- 
2.47.2


