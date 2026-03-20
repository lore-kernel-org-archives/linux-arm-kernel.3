Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814731098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HH8VpBIzKVocR9QCMMr19KWQ72io3kjYmR3wR3NBXU=; b=DwhTIINwe2TLeRUCqY7uYzLLPt
	Eg79rXFK2KbpwIzAjrT+mztUv9jJGUlhjmx9cDrWLlsmpXQAmmH7kWMWyr12Z3E8b7w2R3y+pdOvw
	g7Olb2wbL9jqegt3EaZaRqJLXcUmxiTqDW+QCfdpzkp9UzvPFnIV8UBwXvv420m/9x0jflbmWX9My
	r8DbGIdrHXlYkYPJRUkt+fGpfs9Yy/bsyg8ZttuHFQ/mn6HrhgaQcIGZ0Z38aA9l4re+ilILxLYo/
	9mGxGKeklKBPS4Zt5QoV891LXt6mj095rW8UqrjUd/lX6gWaQa81No3ur6e/dFCBrnUSOPo0ScW1P
	y5jOgaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c4X-0000000D3mF-2pL4;
	Fri, 20 Mar 2026 15:47:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c4T-0000000D3ka-2Ub2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8531960128;
	Fri, 20 Mar 2026 15:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB9EC19425;
	Fri, 20 Mar 2026 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774021652;
	bh=AhrpkkmBjpJ2/C5bTeRAdRM8zKL8qpGvBKtsGgaXuvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L1e5DJ6tOjlbLmriA4lWJl5yyybE/SFBxARBbpuTXD1YeA04w1pBJ8UQickjcHrM9
	 BKarYMcFslJIhhKrGWUIocdSoLi8e1jMSymjwbziiz4HwCdj3jfTAqvAnrtJNZLqup
	 uHiOj2YAkSZgVr+/sXD/OFlpUP4gwoPZGGgQl8LlDbmwS1Scx60YbwyHVeOXA/baJM
	 9b23m3XvpBEG6x6g4QzmBuyfrmSpdLLgOPwOC1Bv0PBD32NV7jVbDMg9gcv5Sf4qLp
	 FDPVS+AY3HjHjzN7guPd+KSFWUhqpKgf9FUgl7rnPhYEi54jz4j4x6/T9CtnsI8u2X
	 IBAH3jVKNcwiQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Mar 2026 15:44:14 +0000
Subject: [PATCH v8 1/2] arm64/fpsimd: Suppress SVE access traps when
 loading FPSIMD state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm64-sve-trap-mitigation-v8-1-8bf116c8e360@kernel.org>
References: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
In-Reply-To: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-db13a
X-Developer-Signature: v=1; a=openpgp-sha256; l=8045; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AhrpkkmBjpJ2/C5bTeRAdRM8zKL8qpGvBKtsGgaXuvw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpvWwPit2ilNGQvUG4YuV8Y7q1fXnFNBAGVfQ8n
 pX3v07g5MKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCab1sDwAKCRAk1otyXVSH
 0GS5B/9glBVNO//slD40nLdrGSf3IwWpG0ctuQwOoCzSeAh1LbHXkAM3q8xzMbR6oOfWI/Un4BO
 JhmmglCZo2Huh9g0qJydziLy4XctvZx/rbV9AE/kCrcJm3gZG3SUJzMDhPoLseUW08EOUixvkkW
 jYCNs4SxYGz7LTzxk44JBSwZL344VM/fKO50zIqbS9N4fDN7QWl0uhd+P9o6Q1B1cvFJTbGcO/e
 M2NfiYIQjLwzchb+qpAjtY0+6rAqkujArB7f9lt8XNBxVehcHTUZXzY8lC1BhhKrDf8X43xtI74
 MD4vZCran+LaH5WUukS/LEmPiZUaJ8fCNrjXTwxoF55xlz2k
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

When we are in a syscall we take the opportunity to discard the SVE state,
saving only the FPSIMD subset of the register state. If we have to
reload the floating point state from memory then we reenable SVE access
traps, stopping tracking SVE until the task uses SVE again at which
point it will take another SVE access trap. This means that for a task
which is actively using SVE and also doing many blocking system calls
will have the additional overhead of SVE access traps.

The use of SVE for applications like memcpy() means that frequent SVE
usage is common with modern distributions, even with tasks that do not
obviously use floating point.  I did some instrumentation which counted
the number of SVE access traps and the number of times we loaded FPSIMD
only register state for each task.  Testing with Debian Bookworm this
showed that during boot the overwhelming majority of tasks triggered
another SVE access trap more than 50% of the time after loading FPSIMD
only state with a substantial number near 100%, though some programs had
a very small number of SVE accesses most likely from startup. There were
few tasks in the range 5-45%, most tasks either used SVE frequently or
used it only a tiny proportion of times. As expected older distributions
which do not have the SVE performance work available showed no SVE usage
in general applications.

This indicates that there should be some benefit from reducing the
number of SVE access traps for blocking system calls like we did for non
blocking system calls in commit 8c845e273104 ("arm64/sve: Leave SVE
enabled on syscall if we don't context switch"). Let's do this with a
timeout, when we take a SVE access trap record a jiffies after which
we'll reeanble SVE traps and then check this whenever we load a FPSIMD
only floating point state from memory. If the time has passed then we
reenable traps, otherwise we leave traps disabled and flush the
non-shared register state like we would on trap.

The timeout is currently set to a second, I pulled this number out of thin
air so there is doubtless some room for tuning. This means that for a
task which is actively using SVE the number of SVE access traps will be
equivalent or reduced but applications which use SVE only very
infrequently will avoid the overheads associated with tracking SVE state
after a second. The extra cost from additional tracking of SVE state
only occurs when a task is preempted so short running tasks should be
minimally affected.

As would be expected fp-pidbench shows minimal change from this patch,
it does not block and on a quiet system is unlikely to see it's state
reloaded from memory.

There should be no functional change resulting from this, it is purely a
performance optimisation.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h    |  1 +
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/kernel/entry-fpsimd.S   | 15 +++++++++++++
 arch/arm64/kernel/fpsimd.c         | 46 +++++++++++++++++++++++++++++++++-----
 4 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 1d2e33559bd5..2d9ab5bbcb22 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -144,6 +144,7 @@ static inline void *thread_zt_state(struct thread_struct *thread)
 extern void sve_save_state(void *state, u32 *pfpsr, int save_ffr);
 extern void sve_load_state(void const *state, u32 const *pfpsr,
 			   int restore_ffr);
+extern void sve_flush_p(bool flush_ffr);
 extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
 extern unsigned int sve_get_vl(void);
 extern void sve_set_vq(unsigned long vq_minus_1);
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index e30c4c8e3a7a..a174864eca5f 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -166,6 +166,7 @@ struct thread_struct {
 	unsigned int		fpsimd_cpu;
 	void			*sve_state;	/* SVE registers, if any */
 	void			*sme_state;	/* ZA and ZT state, if any */
+	unsigned long		sve_timeout;    /* jiffies to drop TIF_SVE */
 	unsigned int		vl[ARM64_VEC_MAX];	/* vector length */
 	unsigned int		vl_onexec[ARM64_VEC_MAX]; /* vl after next exec */
 	unsigned long		fault_address;	/* fault info */
diff --git a/arch/arm64/kernel/entry-fpsimd.S b/arch/arm64/kernel/entry-fpsimd.S
index 6325db1a2179..617dd70cafd7 100644
--- a/arch/arm64/kernel/entry-fpsimd.S
+++ b/arch/arm64/kernel/entry-fpsimd.S
@@ -85,6 +85,21 @@ SYM_FUNC_START(sve_flush_live)
 2:	ret
 SYM_FUNC_END(sve_flush_live)
 
+/*
+ * Zero the predicate registers
+ *
+ * VQ must already be configured by caller, any further updates of VQ
+ * will need to ensure that the register state remains valid.
+ *
+ * x0 = include FFR?
+ */
+SYM_FUNC_START(sve_flush_p)
+	sve_flush_p
+	tbz		x0, #0, 1f
+	sve_flush_ffr
+1:	ret
+SYM_FUNC_END(sve_flush_p)
+
 #endif /* CONFIG_ARM64_SVE */
 
 #ifdef CONFIG_ARM64_SME
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 9de1d8a604cb..d46bb370f9a9 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -360,6 +360,7 @@ static void task_fpsimd_load(void)
 {
 	bool restore_sve_regs = false;
 	bool restore_ffr;
+	unsigned long sve_vq_minus_one;
 
 	WARN_ON(!system_supports_fpsimd());
 	WARN_ON(preemptible());
@@ -368,16 +369,11 @@ static void task_fpsimd_load(void)
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
-			/* Stop tracking SVE for this task until next use. */
-			clear_thread_flag(TIF_SVE);
 			break;
 		case FP_STATE_SVE:
 			if (!thread_sm_enabled(&current->thread))
 				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
-			if (test_thread_flag(TIF_SVE))
-				sve_set_vq(sve_vq_from_vl(task_get_sve_vl(current)) - 1);
-
 			restore_sve_regs = true;
 			restore_ffr = true;
 			break;
@@ -396,6 +392,15 @@ static void task_fpsimd_load(void)
 		}
 	}
 
+	/*
+	 * If SVE has been enabled we may keep it enabled even if
+	 * loading only FPSIMD state, so always set the VL.
+	 */
+	if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
+		sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
+		sve_set_vq(sve_vq_minus_one);
+	}
+
 	/* Restore SME, override SVE register configuration if needed */
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
@@ -425,6 +430,30 @@ static void task_fpsimd_load(void)
 	} else {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
 		fpsimd_load_state(&current->thread.uw.fpsimd_state);
+
+		/*
+		 * If the task had been using SVE we keep it enabled
+		 * when loading FPSIMD only state for a period to
+		 * minimise overhead for tasks actively using SVE,
+		 * disabling it periodicaly to ensure that tasks that
+		 * use SVE intermittently do eventually avoid the
+		 * overhead of carrying SVE state.  The timeout is
+		 * initialised when we take a SVE trap in do_sve_acc().
+		 */
+		if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
+			if (time_after(jiffies, current->thread.sve_timeout)) {
+				clear_thread_flag(TIF_SVE);
+				sve_user_disable();
+			} else {
+				/*
+				 * Loading V will have flushed the
+				 * rest of the Z register, SVE is
+				 * enabled at EL1 and VL was set
+				 * above.
+				 */
+				sve_flush_p(true);
+			}
+		}
 	}
 }
 
@@ -1343,6 +1372,13 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 
 	get_cpu_fpsimd_context();
 
+	/*
+	 * We will keep SVE enabled when loading FPSIMD only state for
+	 * the next second to minimise traps when userspace is
+	 * actively using SVE.
+	 */
+	current->thread.sve_timeout = jiffies + HZ;
+
 	if (test_and_set_thread_flag(TIF_SVE))
 		WARN_ON(1); /* SVE access shouldn't have trapped */
 

-- 
2.47.3


