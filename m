Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3FBCFA449
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQzUTn13+HtZN7hy8OMOYOZ6R6awvf7CPWCERmhGTRc=; b=ygWkvqdE9ypNgwA5YkUt/t/L1W
	KqK83l31sqeDWD+8gl+ztURB4AU/wMXkTQI/nH4uWlhQ2cV6EJodkJ8lmP+fM0QptRU780btHqTtF
	ZEmEP6lhXnpv3LzdOJsOf2nmwRf0SICMdJd5YftuHOYY3l6tWOBhOwNVBGt0bz6zxt133Wnowt72j
	niNIk5wRa4IlOxB7exutKePpKDVvajkaOOVBo8k+azQaDVVlY6kiuxNqZ0Cl61CafjvCevSumw3c0
	1pmkGL1bNsrKswKduh17K3blwxiQW2Ehn5+kkDxqIbbW/Dk1rxm+shTPbFyYpeezk4DlYX/54hYmv
	YKgUxlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dmY-0000000F42X-2KHt;
	Wed, 23 Oct 2024 16:00:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cvW-0000000Escc-0PgT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:05:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F774339;
	Wed, 23 Oct 2024 08:06:03 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4E063F528;
	Wed, 23 Oct 2024 08:05:31 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	dave.martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	will@kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 3/5] arm64: signal: Improve POR_EL0 handling to avoid uaccess failures
Date: Wed, 23 Oct 2024 16:05:09 +0100
Message-ID: <20241023150511.3923558-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023150511.3923558-1-kevin.brodsky@arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080534_330654_AAB6A686 
X-CRM114-Status: GOOD (  31.15  )
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

TL;DR: reset POR_EL0 to "allow all" before writing the signal frame,
preventing spurious uaccess failures. Also, make sure that POR_EL0
remains unchanged if delivering the signal fails.

When POE is supported, the POR_EL0 register constrains memory
accesses based on the target page's POIndex (pkey). This raises the
question: what constraints should apply to a signal handler? The
current answer is that POR_EL0 is reset to POR_EL0_INIT when
invoking the handler, giving it full access to POIndex 0. This is in
line with x86's MPK support and remains unchanged.

This is only part of the story, though. POR_EL0 constrains all
unprivileged memory accesses, meaning that uaccess routines such as
put_user() are also impacted. As a result POR_EL0 may prevent the
signal frame from being written to the signal stack (ultimately
causing a SIGSEGV). This is especially concerning when an alternate
signal stack is used, because userspace may want to prevent access
to it outside of signal handlers. There is currently no provision
for that: POR_EL0 is reset after writing to the stack, and
POR_EL0_INIT only enables access to POIndex 0.

This patch ensures that POR_EL0 is reset to its most permissive
state before the signal stack is accessed. Once the signal frame has
been fully written, POR_EL0 is still set to POR_EL0_INIT - it is up
to the signal handler to enable access to additional pkeys if
needed. As to sigreturn(), it expects having access to the stack
like any other syscall; we only need to ensure that POR_EL0 is
restored from the signal frame after all uaccess calls. This
approach is in line with the recent x86/pkeys series [1].

Resetting POR_EL0 early introduces some complications, in that we
can no longer read the register directly in preserve_poe_context().
This is addressed by introducing a struct (user_access_state)
and helpers to manage any such register impacting user accesses
(uaccess and accesses in userspace). Things look like this on signal
delivery:

1. Save original POR_EL0 into struct [save_reset_user_access_state()]
2. Set POR_EL0 to "allow all"  [save_reset_user_access_state()]
3. Create signal frame
4. Write saved POR_EL0 value to the signal frame [preserve_poe_context()]
5. Finalise signal frame
6. If all operations succeeded:
  a. Set POR_EL0 to POR_EL0_INIT [set_handler_user_access_state()]
  b. Else reset POR_EL0 to its original value [restore_user_access_state()]

If any step fails when setting up the signal frame, the process will
be sent a SIGSEGV, which it may be able to handle. Step 6.b ensures
that the original POR_EL0 is saved in the signal frame when
delivering that SIGSEGV (so that the original value is restored by
sigreturn).

The return path (sys_rt_sigreturn) doesn't strictly require any change
since restore_poe_context() is already called last. However, to
avoid uaccess calls being accidentally added after that point, we
use the same approach as in the delivery path, i.e. separating
uaccess from writing to the register:

1. Read saved POR_EL0 value from the signal frame [restore_poe_context()]
2. Set POR_EL0 to the saved value [restore_user_access_state()]

[1] https://lore.kernel.org/lkml/20240802061318.2140081-1-aruna.ramakrishna@oracle.com/

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Note: the addtional check on err at the end of setup_rt_frame() is
made on purpose, in expectation of [2] which will allow setup_return()
to fail too.

[2] https://lore.kernel.org/all/20241001-arm64-gcs-v13-25-222b78d87eee@kernel.org/
---

 arch/arm64/kernel/signal.c | 92 ++++++++++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index f5fb48dabebe..d2e4e50977ae 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -66,9 +66,63 @@ struct rt_sigframe_user_layout {
 	unsigned long end_offset;
 };
 
+/*
+ * Holds any EL0-controlled state that influences unprivileged memory accesses.
+ * This includes both accesses done in userspace and uaccess done in the kernel.
+ *
+ * This state needs to be carefully managed to ensure that it doesn't cause
+ * uaccess to fail when setting up the signal frame, and the signal handler
+ * itself also expects a well-defined state when entered.
+ */
+struct user_access_state {
+	u64 por_el0;
+};
+
 #define TERMINATOR_SIZE round_up(sizeof(struct _aarch64_ctx), 16)
 #define EXTRA_CONTEXT_SIZE round_up(sizeof(struct extra_context), 16)
 
+/*
+ * Save the unpriv access state into ua_state and reset it to disable any
+ * restrictions.
+ */
+static void save_reset_user_access_state(struct user_access_state *ua_state)
+{
+	if (system_supports_poe()) {
+		/*
+		 * Enable all permissions in all 8 keys
+		 * (inspired by REPEAT_BYTE())
+		 */
+		u64 por_enable_all = (~0u / POE_MASK) * POE_RXW;
+
+		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
+		write_sysreg_s(por_enable_all, SYS_POR_EL0);
+		/* Ensure that any subsequent uaccess observes the updated value */
+		isb();
+	}
+}
+
+/*
+ * Set the unpriv access state for invoking the signal handler.
+ *
+ * No uaccess should be done after that function is called.
+ */
+static void set_handler_user_access_state(void)
+{
+	if (system_supports_poe())
+		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
+}
+
+/*
+ * Restore the unpriv access state to the values saved in ua_state.
+ *
+ * No uaccess should be done after that function is called.
+ */
+static void restore_user_access_state(const struct user_access_state *ua_state)
+{
+	if (system_supports_poe())
+		write_sysreg_s(ua_state->por_el0, SYS_POR_EL0);
+}
+
 static void init_user_layout(struct rt_sigframe_user_layout *user)
 {
 	const size_t reserved_size =
@@ -260,18 +314,20 @@ static int restore_fpmr_context(struct user_ctxs *user)
 	return err;
 }
 
-static int preserve_poe_context(struct poe_context __user *ctx)
+static int preserve_poe_context(struct poe_context __user *ctx,
+				const struct user_access_state *ua_state)
 {
 	int err = 0;
 
 	__put_user_error(POE_MAGIC, &ctx->head.magic, err);
 	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
-	__put_user_error(read_sysreg_s(SYS_POR_EL0), &ctx->por_el0, err);
+	__put_user_error(ua_state->por_el0, &ctx->por_el0, err);
 
 	return err;
 }
 
-static int restore_poe_context(struct user_ctxs *user)
+static int restore_poe_context(struct user_ctxs *user,
+			       struct user_access_state *ua_state)
 {
 	u64 por_el0;
 	int err = 0;
@@ -281,7 +337,7 @@ static int restore_poe_context(struct user_ctxs *user)
 
 	__get_user_error(por_el0, &(user->poe->por_el0), err);
 	if (!err)
-		write_sysreg_s(por_el0, SYS_POR_EL0);
+		ua_state->por_el0 = por_el0;
 
 	return err;
 }
@@ -849,7 +905,8 @@ static int parse_user_sigframe(struct user_ctxs *user,
 }
 
 static int restore_sigframe(struct pt_regs *regs,
-			    struct rt_sigframe __user *sf)
+			    struct rt_sigframe __user *sf,
+			    struct user_access_state *ua_state)
 {
 	sigset_t set;
 	int i, err;
@@ -898,7 +955,7 @@ static int restore_sigframe(struct pt_regs *regs,
 		err = restore_zt_context(&user);
 
 	if (err == 0 && system_supports_poe() && user.poe)
-		err = restore_poe_context(&user);
+		err = restore_poe_context(&user, ua_state);
 
 	return err;
 }
@@ -907,6 +964,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 {
 	struct pt_regs *regs = current_pt_regs();
 	struct rt_sigframe __user *frame;
+	struct user_access_state ua_state;
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -923,12 +981,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	if (!access_ok(frame, sizeof (*frame)))
 		goto badframe;
 
-	if (restore_sigframe(regs, frame))
+	if (restore_sigframe(regs, frame, &ua_state))
 		goto badframe;
 
 	if (restore_altstack(&frame->uc.uc_stack))
 		goto badframe;
 
+	restore_user_access_state(&ua_state);
+
 	return regs->regs[0];
 
 badframe:
@@ -1034,7 +1094,8 @@ static int setup_sigframe_layout(struct rt_sigframe_user_layout *user,
 }
 
 static int setup_sigframe(struct rt_sigframe_user_layout *user,
-			  struct pt_regs *regs, sigset_t *set)
+			  struct pt_regs *regs, sigset_t *set,
+			  const struct user_access_state *ua_state)
 {
 	int i, err = 0;
 	struct rt_sigframe __user *sf = user->sigframe;
@@ -1096,10 +1157,9 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
 		struct poe_context __user *poe_ctx =
 			apply_user_offset(user, user->poe_offset);
 
-		err |= preserve_poe_context(poe_ctx);
+		err |= preserve_poe_context(poe_ctx, ua_state);
 	}
 
-
 	/* ZA state if present */
 	if (system_supports_sme() && err == 0 && user->za_offset) {
 		struct za_context __user *za_ctx =
@@ -1236,9 +1296,6 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
 		sme_smstop();
 	}
 
-	if (system_supports_poe())
-		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
-
 	if (ka->sa.sa_flags & SA_RESTORER)
 		sigtramp = ka->sa.sa_restorer;
 	else
@@ -1252,6 +1309,7 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe_user_layout user;
 	struct rt_sigframe __user *frame;
+	struct user_access_state ua_state;
 	int err = 0;
 
 	fpsimd_signal_preserve_current_state();
@@ -1259,13 +1317,14 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 	if (get_sigframe(&user, ksig, regs))
 		return 1;
 
+	save_reset_user_access_state(&ua_state);
 	frame = user.sigframe;
 
 	__put_user_error(0, &frame->uc.uc_flags, err);
 	__put_user_error(NULL, &frame->uc.uc_link, err);
 
 	err |= __save_altstack(&frame->uc.uc_stack, regs->sp);
-	err |= setup_sigframe(&user, regs, set);
+	err |= setup_sigframe(&user, regs, set, &ua_state);
 	if (err == 0) {
 		setup_return(regs, &ksig->ka, &user, usig);
 		if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
@@ -1275,6 +1334,11 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 		}
 	}
 
+	if (err == 0)
+		set_handler_user_access_state();
+	else
+		restore_user_access_state(&ua_state);
+
 	return err;
 }
 
-- 
2.43.0


