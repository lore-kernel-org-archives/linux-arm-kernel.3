Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3BBCFA47E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 21:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UPk0QZ1Pfxq9dylQN+pk5GptQVRhIm2mC7Lan7D5YBg=; b=4iEl/rQIDHkUjwr3JXxio/KwoJ
	U0l6EWtz5HUlvgmBrT+ChCfhRYi1Ne1uuF5c9qoepo+bPgOepXN636Tbait3g79ujHtQ3vENp/A+Z
	zrVemMnHfB2PBP6KB1bkQvpw4rdMF6PKo/L2jgJDgrUSAeFClR2F8U6I4mLhJzYnLG2n7fzBbv3YQ
	vfcL7CwORGUqEhpCElo2ABlQhVmEhmEmoeXqNpB8qLMCO6rbWUx/Pwt5FCBsH306BpnFFAhtlc0Ux
	Py9lwXxwgZl5FmSxYInNR0ymYDLbMHgZx33RnUEwci7Ck+OC29qrCWoiOsYaZxVRrqo4kga9tAQD7
	7Nk6mbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3j0P-0000000FzZT-1P6u;
	Wed, 23 Oct 2024 21:35:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iyq-0000000FzPr-0Tnu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 21:33:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 201CBA445A7;
	Wed, 23 Oct 2024 21:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A979FC4CEC6;
	Wed, 23 Oct 2024 21:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729719202;
	bh=4Cdl78KMSg8ESoVkXR1vtPGDTu30ACB34Uff1obLF+s=;
	h=From:Date:Subject:To:Cc:From;
	b=YhC8LeuvFdI1wN0m3isfCcxto6XSU4YmTdslMeXDevbzGVnkdmBSeici2HTIPTIvR
	 nbH0ka//EPTeVEgqphT31zwCaWwl39ePfhHf+1a0pikShfDasJOP/g2y/nRsYwT3yM
	 8eYG5iiGq4lPlmff0xKHpbAV1HsTgzCsROy7Qafkn/at88zV68q6+W0wsFHTxiDlak
	 fxmzrf1sZaUluYm3GCclT/CrGkzbNHYApThrOuSRzwJL46f8Ujo/8Qyc9D/b8CPYPJ
	 CMqrfp36VW3TMcySp+GqS+hgvB8Ae1m3EhT5HapavU5F464rWjqpDY3Xpre16dqZSi
	 P14DT6sAuK70g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 22:31:24 +0100
Subject: [PATCH] arm64/signal: Avoid corruption of SME state when entering
 signal handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-sme-sigentry-v1-1-249ff7ec3ad0@kernel.org>
X-B4-Tracking: v=1; b=H4sIACtrGWcC/x3MQQ5AMBBA0avIrE2iJSquIhYtg1komREh4u4ay
 7f4/wElYVJosweETlbeYoLJMxgWH2dCHpPBFrYyhS3Ry1pXOO2oK6HyTPGQG70NozONI2cCpHY
 Xmvj6v13/vh9LzOURZwAAAA==
X-Change-ID: 20241023-arm64-fp-sme-sigentry-a2bd7187e71b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=4970; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4Cdl78KMSg8ESoVkXR1vtPGDTu30ACB34Uff1obLF+s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGWufCXMY+wKGUe0veSFLrn03Q+QJr52eqIWW1PoS
 80ym3+OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlrnwAKCRAk1otyXVSH0PLDB/
 sFjdjvP1i9t977GK9dzQ+jJrqtRpqRQre7WINBFglAtjiF2DbrBjDrCtaL3BfnUfChlbwiPMWu/+U8
 d6hWrvxgzvLYCFAz40zNMO/QGRLoz6urB6/B0G4kmI2oMmGTsbOvHn6UhPlRc3G5mHl/n+e5tmXqg5
 VgVax1Qc0j7AlAh9HuIMBU0GTKZgUYZmtwUswoado7ALyJWt6vF17/Jv/xV2p6jnfBqMVsQzIijZNF
 zY49gCyPO2Aa/DZ6bdmpTFClPQS10VYLUfAz+OGwecwo4iqT9hVC+Iny31N0nI8CwykPegh0yV/uVD
 /pD9rVzUnMB590PAKb64tEu45J0Ega
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_143324_335935_4487DECD 
X-CRM114-Status: GOOD (  22.33  )
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

When we enter a signal handler we exit streaming mode in order to ensure
that signal handlers can run normal FPSIMD code, and while we're at it we
also clear PSTATE.ZA. Currently the code in setup_return() updates both the
in memory copy of the state and the register state. Not only is this
redundant it can also lead to corruption if we are preempted.

Consider two tasks on one CPU:

 A: Begins signal entry in kernel mode, is preempted prior to SMSTOP.
 B: Using SM and/or ZA in userspace with register state current on the
    CPU, is preempted.
 A: Scheduled in, no register state changes made as in kernel mode.
 A: Executes SMSTOP, modifying live register state.
 A: Scheduled out.
 B: Scheduled in, fpsimd_thread_switch() sees the register state on the
    CPU is tracked as being that for task B so the state is not reloaded
    prior to returning to userspace.

Task B is now running with SM and ZA incorrectly cleared.

Fix this by check TIF_FOREIGN_FPSTATE and only updating one of the live
register context or the in memory copy when entering a signal handler.
Since this needs to happen atomically and all code that atomically
accesses FP state is in fpsimd.c also move the code there to ensure
consistency.

This race has been observed intermittently with fp-stress, especially
with preempt disabled.

Fixes: 40a8e87bb3285 ("arm64/sme: Disable ZA and streaming mode when handling signals")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kernel/signal.c      | 19 +------------------
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index f2a84efc361858d4deda99faf1967cc7cac386c1..09af7cfd9f6c2cec26332caa4c254976e117b1bf 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -76,6 +76,7 @@ extern void fpsimd_load_state(struct user_fpsimd_state *state);
 extern void fpsimd_thread_switch(struct task_struct *next);
 extern void fpsimd_flush_thread(void);
 
+extern void fpsimd_enter_sighandler(void);
 extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 77006df20a75aee7c991cf116b6d06bfe953d1a4..e6b086dc09f21e7f30df32ab4f6875b53c4228fd 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1693,6 +1693,36 @@ void fpsimd_signal_preserve_current_state(void)
 		sve_to_fpsimd(current);
 }
 
+/*
+ * Called by the signal handling code when preparing current to enter
+ * a signal handler. Currently this only needs to take care of exiting
+ * streaming mode and clearing ZA on SME systems.
+ */
+void fpsimd_enter_sighandler(void)
+{
+	if (!system_supports_sme())
+		return;
+
+	get_cpu_fpsimd_context();
+
+	if (test_thread_flag(TIF_FOREIGN_FPSTATE)) {
+		/* Exiting streaming mode zeros the FPSIMD state */
+		if (current->thread.svcr & SVCR_SM_MASK) {
+			memset(&current->thread.uw.fpsimd_state, 0,
+			       sizeof(current->thread.uw.fpsimd_state));
+			current->thread.fp_type = FP_STATE_FPSIMD;
+		}
+
+		current->thread.svcr &= ~(SVCR_ZA_MASK |
+					  SVCR_SM_MASK);
+	} else {
+		/* The register state is current, just update it. */
+		sme_smstop();
+	}
+
+	put_cpu_fpsimd_context();
+}
+
 /*
  * Called by KVM when entering the guest.
  */
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 5619869475304776fc005fe24a385bf86bfdd253..fe07d0bd9f7978d73973f07ce38b7bdd7914abb2 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1218,24 +1218,7 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
 	/* TCO (Tag Check Override) always cleared for signal handlers */
 	regs->pstate &= ~PSR_TCO_BIT;
 
-	/* Signal handlers are invoked with ZA and streaming mode disabled */
-	if (system_supports_sme()) {
-		/*
-		 * If we were in streaming mode the saved register
-		 * state was SVE but we will exit SM and use the
-		 * FPSIMD register state - flush the saved FPSIMD
-		 * register state in case it gets loaded.
-		 */
-		if (current->thread.svcr & SVCR_SM_MASK) {
-			memset(&current->thread.uw.fpsimd_state, 0,
-			       sizeof(current->thread.uw.fpsimd_state));
-			current->thread.fp_type = FP_STATE_FPSIMD;
-		}
-
-		current->thread.svcr &= ~(SVCR_ZA_MASK |
-					  SVCR_SM_MASK);
-		sme_smstop();
-	}
+	fpsimd_enter_sighandler();
 
 	if (system_supports_poe())
 		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241023-arm64-fp-sme-sigentry-a2bd7187e71b

Best regards,
-- 
Mark Brown <broonie@kernel.org>


