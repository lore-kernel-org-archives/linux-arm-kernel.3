Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5201CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LstFm1asXfV4uDj/itgGBtazNs0iaSwdLvfFb0Ilux8=; b=nPp/iQ46+DEW4yzXVyeszVWQ3Y
	dxmYa4a0SCDy5FS7oTYAtGBo5Vzd01sTLX9weIhY7v/jjfGH1vWPyPMoYppNK+T6LcixmW9nPnjT6
	7vXSTVancrUW7jJfxvWJT5e/rcX+fBZlusVsiPXZJe0NfTIkPNyEnJSaiZ32ND5Z8PlVk+6M548tK
	TM4vofd5C1NSPqcYGZkj+QxXeDzTeLtypPO2/lOhgzVLVzdQxmqM0VijjDjRwSawr37eDvzJRtQcg
	DeBb6c8e4Bj768aHP3htP7fGr4NTrnDg7aqOOKcTx3PxdJvn11LRfKH2i+rG8ylokzIeOj+nT7ZS2
	bISZIgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdHr-000000070H1-3pgV;
	Fri, 03 Jul 2026 12:46:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdHq-000000070Gb-0tS6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:46:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E08004334D;
	Fri,  3 Jul 2026 12:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F34A1F000E9;
	Fri,  3 Jul 2026 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783082789;
	bh=LstFm1asXfV4uDj/itgGBtazNs0iaSwdLvfFb0Ilux8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BlsEz+K/vRIMUevFwg17gmKYdvLVT6J5ctYIt2MmiweZt3LqEGIH0uAykV7eyoQKB
	 8BTt//g+BRImwdUnDM/Bkhmd2/DJEgHHlUeLA+nio7FAtfqQaoYk0aDQHkT1s4HF24
	 2rf9mPGPmXZu29QfoBBkUi20RGDtO8fbQtOK6LcfA4VdtC81mJcldlkqXio3O3oRj5
	 isEI/sXhN45aJ9+1hBWeGu1P8lSC2zWOcfGpEo4XP/s8y91nkR6wJDA8vCQIql3ao0
	 bK2Z1X+0ec6SedxDinvm2IyoiQPihu4Mif1FgsfGJ8uxwXFV4AfRSVQUL0d3c6yWIj
	 1XE3ybDwjedEQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 03 Jul 2026 13:34:04 +0100
Subject: [PATCH v10 1/2] arm64/fpsimd: Suppress SVE access traps when
 loading FPSIMD state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-arm64-sve-trap-mitigation-v10-1-32b4861b64fc@kernel.org>
References: <20260703-arm64-sve-trap-mitigation-v10-0-32b4861b64fc@kernel.org>
In-Reply-To: <20260703-arm64-sve-trap-mitigation-v10-0-32b4861b64fc@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7374; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BtnFI6j5zmduXPgGAWd9+d/snbb7UGy45A+Uh+rSn58=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR68gHvwqDlV92rkfqCuAxIqSU+P4bZ/mk+WjJ
 HRfHzgJQoiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakevIAAKCRAk1otyXVSH
 0HMhB/4tf0o78P7q89bGrvxZyU2wpU4LfuBFZEG9zDfxE0T7dHLRa2sarc6HXEjrc8EV1iOBqLR
 e0W0bD6p8xSiiHIcrZ4gkvy0I9jkUykwGVKf0xWKVQgj1j7f5kKZU75k085p9japCn6RWYKv9+T
 Py4f9zz9OUJXI6hSGQ16MqhU1A/jLm6TxHX3Oyu5MqKYqoGawiH7dkGGmDwqV9m5l+YE+IQSFHX
 zlkT3/AOT5ZXh8v75npJoyksBJxsXdCegWRfXp2JLAY5SdhgrmTbyN+laG4KdnrmWBN2BqWFTaR
 x/ZDJlFbyHTVx2SP4tdlII+4e0wVWdqmLXsbYL1IEYK9/y9T
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
 arch/arm64/include/asm/fpsimd.h    | 15 ++++++++----
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/kernel/fpsimd.c         | 47 ++++++++++++++++++++++++++++++++------
 3 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index a67d5774e672..bce70a2a6d1e 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -332,6 +332,15 @@ static inline void sve_load_state(const struct arm64_sve_state *state, bool ffr)
 	__sve_load_p(state, vl, ffr);
 }
 
+static inline void sve_flush_p(void)
+{
+	asm volatile(
+	__SVE_PREAMBLE
+	FOR_EACH_P_REG("n", "pfalse	p\\n\\().b")
+	"	wrffr	p0.b\n"
+	);
+}
+
 /*
  * Zero all SVE registers except for the first 128 bits of each vector.
  *
@@ -349,11 +358,7 @@ static inline void sve_flush_live(void)
 		);
 	}
 
-	asm volatile(
-	__SVE_PREAMBLE
-	FOR_EACH_P_REG("n", "pfalse	p\\n\\().b")
-	"	wrffr	p0.b\n"
-	);
+	sve_flush_p();
 }
 
 struct arm64_cpu_capabilities;
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index c2a627f39314..f4312a069586 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -169,6 +169,7 @@ struct thread_struct {
 	unsigned int		fpsimd_cpu;
 	struct arm64_sve_state	*sve_state;	/* SVE registers, if any */
 	struct arm64_sme_state	*sme_state;	/* ZA and ZT state, if any */
+	unsigned long		sve_timeout;    /* jiffies to drop TIF_SVE */
 	unsigned int		vl[ARM64_VEC_MAX];	/* vector length */
 	unsigned int		vl_onexec[ARM64_VEC_MAX]; /* vl after next exec */
 	unsigned long		fault_address;	/* fault info */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 25dc5afe9ba0..f2eb8653665b 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -370,18 +370,11 @@ static void task_fpsimd_load(void)
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
-			/* Stop tracking SVE for this task until next use. */
-			clear_thread_flag(TIF_SVE);
 			break;
 		case FP_STATE_SVE:
 			if (!thread_sm_enabled(&current->thread))
 				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
-			if (test_thread_flag(TIF_SVE)) {
-				unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
-				sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
-			}
-
 			restore_sve_regs = true;
 			restore_ffr = true;
 			break;
@@ -400,6 +393,15 @@ static void task_fpsimd_load(void)
 		}
 	}
 
+	/*
+	 * If SVE has been enabled we may keep it enabled even if
+	 * loading only FPSIMD state, so always set the VL.
+	 */
+	if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
+		unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
+		sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
+	}
+
 	/* Restore SME, override SVE register configuration if needed */
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
@@ -430,6 +432,30 @@ static void task_fpsimd_load(void)
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
+				sve_flush_p();
+			}
+		}
 	}
 }
 
@@ -1324,6 +1350,13 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 
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


