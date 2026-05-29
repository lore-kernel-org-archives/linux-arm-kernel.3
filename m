Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DE2CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixuk1kcLyoWXvPuunbj8nY84un+scqW38ghks1QIX1w=; b=pHaGmoA3dhO3EqCEP2IUJdLOFz
	1eh9RV+ZHKR663LAukbHNHC33RE2ydqYs1IQqiH+lA5pRsT1erqX/iklAa/PvfAmHEyFw3TaQpAC3
	hEHmIROqErago2aA8RPijnadt82yqOFam8KX/sRKD8Jd2KxtZvozCKFFdQrirWu3A3YH6ohwr7sJG
	Rbkyllmxr3DaEwvzSDej8dUKvj3NibC2oV9lQbb4ma267m2DSoWUKfvwHdg4hL/N+H6Ec5zhX2Vkv
	WFhuorW2aUEQ2jr0798qqSUAnnkfpGMR58DrjQELZgPH87RPHxDJ90+6hFmpb+7wrroEpmaBJ1UWS
	sL/QdvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Ag-00000007tr8-42wt;
	Fri, 29 May 2026 16:34:54 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Ac-00000007tp8-0GTC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ixuk1kcLyoWXvPuunbj8nY84un+scqW38ghks1QIX1w=; b=RhlEmFKmAPVkA2laIRhN6yTpsn
	/4V+Glh42oWbPJ8RFtfp5IlAZanw4AMVmJ7s3Q14pKzqEQOcN4p5QiKXvytD/+SCEiIfeL3d2Xanp
	cRTBgA+qbNr3MhzzeKBQ6lTUbEoc5F3ze2X6ob+W9QieBoRGHwsyoJAfBQcaZs/wWonIrpI0bB1U4
	u4mXgS0Nn1ZK1YKzvmFVAsWk3dpL2rUvsGJDMpyslLMiVm56+RH7mzsGUOOd6tLoUGRBad8/DaxGD
	ewtqvmGFMYdrSKuuzCGG3rOU2mToRnz5CLSvn4h/hPS0Kd4rQVrk6g+GjQurAmfgTKFfJd98ZB6gg
	/ckWCI3A==;
Received: from [179.118.191.12] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wT0AL-009wov-Li; Fri, 29 May 2026 18:34:33 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 29 May 2026 13:33:55 -0300
Subject: [PATCH v3 3/5] selftests: futex: Add support for aarch64 in
 robust_list_critical
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-tonyk-robust_arm-v3-3-a6f02684d4fe@igalia.com>
References: <20260529-tonyk-robust_arm-v3-0-a6f02684d4fe@igalia.com>
In-Reply-To: <20260529-tonyk-robust_arm-v3-0-a6f02684d4fe@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>, 
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 Arnd Bergmann <arnd@arndb.de>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_093450_107387_BA669A87 
X-CRM114-Status: GOOD (  18.17  )
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

Add support for aarch64 for robust_list_critical test.

Apart from the arch specific registers, as the cmpxchg is implemented
using LL/SC, doing single steps clears the exclusive monitor and then the
store fails.

To avoid that, insert a breakpoint just after the store and let it run
continuously until there.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 .../futex/functional/robust_list_critical.c        | 92 ++++++++++++++++++++--
 1 file changed, 87 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/robust_list_critical.c b/tools/testing/selftests/futex/functional/robust_list_critical.c
index b9490d24eb10..a4fe69a21297 100644
--- a/tools/testing/selftests/futex/functional/robust_list_critical.c
+++ b/tools/testing/selftests/futex/functional/robust_list_critical.c
@@ -65,8 +65,9 @@ static bool pc_is_within(struct user_regs_struct *regs, uint64_t start, uint64_t
 
 #if defined(__x86_64__)
 	pc = regs->rip;
-#elif defined(__riscv)
-	pc = reg->pc;
+#elif defined(__riscv) || defined(__aarch64__)
+	pc = regs->pc;
+#else
 # error Missing ptrace support
 #endif
 	if (pc >= (long) start && pc < end)
@@ -219,12 +220,79 @@ enum trace_state {
 	STATE_LEAVE_VDSO,
 };
 
+static int ptrace_get_regs(struct user_regs_struct *regs, pid_t child)
+{
+#if defined(__x86_64__)
+
+	return ptrace(PTRACE_GETREGS, child, 0, regs);
+
+#elif defined(__aarch64__)
+
+	struct iovec io;
+	io.iov_base = regs;
+	io.iov_len = sizeof(struct user_regs_struct);
+
+	return ptrace(PTRACE_GETREGSET, child, NT_PRSTATUS, &io);
+
+#endif
+}
+
+#if defined(__aarch64__)
+/*
+ * A cmpxchg in Arm64 implemented using LL/SC can't single step on every
+ * instruction. This clears the exclusive monitor and invalidates the store.
+ * Instead, we need to add a breakpoint just after the store (on the label
+ * __futex_list64_try_unlock_cs_success) and let it be executed continuously.
+ */
+
+#define AARCH64_BRK 0xD4200000
+static void set_breakpoint(pid_t child, uint64_t *inst)
+{
+
+	long ret;
+
+	ret = ptrace(PTRACE_PEEKDATA, child, __futex_list64_try_unlock_cs_success, 0);
+	if (ret == -1)
+		err(1, "PTRACE_PEEKDATA");
+
+	*inst = (uint64_t) ret;
+
+	ret = ptrace(PTRACE_POKEDATA, child, __futex_list64_try_unlock_cs_success, AARCH64_BRK);
+	if (ret == -1)
+		err(1, "PTRACE_POKEDATA");
+}
+
+static void remove_breakpoint(pid_t child, struct user_regs_struct *regs, uint64_t inst)
+{
+	uint64_t addr = regs->pc;
+	int ret;
+
+	ret = ptrace(PTRACE_POKEDATA, child, addr, inst);
+	if (ret == -1)
+		err(1, "PTRACE_POKEDATA");
+}
+
+#define ptrace_cont()				\
+	if (ptrace(PTRACE_CONT, child, 0, 0))	\
+		err(1, "PTRACE_CONT");		\
+	continue;
+
+#else
+
+static void set_breakpoint(pid_t child, uint64_t *inst) {}
+static void remove_breakpoint(pid_t child, struct user_regs_struct *regs, uint64_t inst) {}
+
+#define ptrace_cont() {}
+
+#endif
+
 static void trace_child(struct __test_metadata *_metadata, pid_t child, bool is_32bit)
 {
 	int state = STATE_WAIT;
 	struct robust_list_head *rhead;
 	size_t sz;
-	bool do_end = false;
+	bool do_end = false, enter_cs = false;
+	uint64_t inst = 0;
 
 	syscall(SYS_get_robust_list, 0, &rhead, &sz);
 	do {
@@ -235,6 +303,7 @@ static void trace_child(struct __test_metadata *_metadata, pid_t child, bool is_
 		pid_t rpid;
 
 		rpid = waitpid(child, &wstatus, 0);
+
 		if (rpid != child)
 			errx(1, "waitpid");
 		if (!do_end) {
@@ -244,11 +313,15 @@ static void trace_child(struct __test_metadata *_metadata, pid_t child, bool is_
 			if (!WIFEXITED(wstatus))
 				errx(1, "Did not exit, but we are done");
 			ASSERT_EQ(WEXITSTATUS(wstatus), 0);
+
+			/* check if the code really reached the critical section */
+			ASSERT_EQ(enter_cs, true);
+
 			return;
 		}
 
-		if (ptrace(PTRACE_GETREGS, child, 0, &regs) != 0)
-			errx(1, "PTRACE_GETREGS");
+		if (ptrace_get_regs(&regs, child))
+			errx(1, "ptrace_get_regs");
 
 		if (is_32bit) {
 			in_vdso = pc_is_within(&regs, (long)frtu32, frtu32_end);
@@ -261,6 +334,11 @@ static void trace_child(struct __test_metadata *_metadata, pid_t child, bool is_
 			if (state == STATE_WAIT) {
 				state = STATE_ENTER_VDSO;
 
+				/* set a bp first time we enter vdso */
+				set_breakpoint(child, &inst);
+
+				/* and let the execution continue until it reaches the CS */
+				ptrace_cont();
 			} else {
 				if (is_32bit) {
 					if (pc_is_within(&regs, __futex_list32_try_unlock_cs_start,
@@ -301,8 +379,12 @@ static void trace_child(struct __test_metadata *_metadata, pid_t child, bool is_
 				if (is_32bit)
 					rhead_val &= 0xffffffff;
 
+				enter_cs = true;
 				ASSERT_EQ(rhead_val, 0);
 				ASSERT_EQ(lock_val, 0);
+
+				/* remove the breakpoint and continue execution */
+				remove_breakpoint(child, &regs, inst);
 			}
 
 			if (ptrace(PTRACE_SINGLESTEP, child, 0, 0))

-- 
2.54.0


