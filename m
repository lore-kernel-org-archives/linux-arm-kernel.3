Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49fX2vvXuVdu3+0XQ/on9jtyf3uuR767mzi4uJ1zz/A=; b=mJGo3xxWRwf7Wf
	37vlN8KGU75rkFuxlhyZkrod7zNYRRWMFjriKDjC4zibIGb7pCMx7hegQTuEi+ryPSad6a+bUtqQP
	XncvB0SAFS6rphXBSdxMDHR8bW82w5jHC4h8pYVWzGpe01fkX/M43smjvB+ViuXw5aJukGUDGxy8w
	g1DnN6GFRGN8LkkJpTLWc+/oprz3rJLSxIT9pK9M4cV0/SloXgOSU3ebZXQHUQMb9YW78Kvj3ZohS
	GcPW2HE3eBFfO5C8/lLSfwUKYKdz9xsuXdrN14YQQ0iZyDJeJzUpiVqMeZ6kkZ3LbP3DLElM7rago
	VonZ22gNouHUNbWV+yVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYklU-00000002OaJ-1rfC;
	Mon, 07 Jul 2025 12:16:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkE6-00000002J88-43ZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:41:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270931762;
	Mon,  7 Jul 2025 04:41:26 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.31.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5355F3F694;
	Mon,  7 Jul 2025 04:41:37 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 04/13] arm64: debug: call step handlers statically
Date: Mon,  7 Jul 2025 12:41:00 +0100
Message-ID: <20250707114109.35672-5-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707114109.35672-1-ada.coupriediaz@arm.com>
References: <20250707114109.35672-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_044139_093182_4C10B4CF 
X-CRM114-Status: GOOD (  21.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, "Luis Claudio R . Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Software stepping checks for the correct handler by iterating over a list
of dynamically registered handlers and calling all of them until one
handles the exception.

This is the only generic way to handle software stepping handlers in arm64
as the exception does not provide an immediate that could be checked,
contrary to software breakpoints.

However, the registration mechanism is not exported and has only
two current users : the KGDB stepping handler, and the uprobe single step
handler.
Given that one comes from user mode and the other from kernel mode, call
the appropriate one by checking the source EL of the exception.
Add a stand-in that returns DBG_HOOK_ERROR when the configuration
options are not enabled.

Remove `arch_init_uprobes()` as it is not useful anymore and is
specific to arm64.

Unify the naming of the handler to XXX_single_step_handler(), making it
clear they are related.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
Reviewed-by: Will Deacon <will@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/include/asm/kgdb.h      |  9 +++++++++
 arch/arm64/include/asm/uprobes.h   |  9 +++++++++
 arch/arm64/kernel/debug-monitors.c | 25 ++++++-------------------
 arch/arm64/kernel/kgdb.c           | 17 +++--------------
 arch/arm64/kernel/probes/uprobes.c | 15 +--------------
 5 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
index 82a76b2102fb..3184f5d1e3ae 100644
--- a/arch/arm64/include/asm/kgdb.h
+++ b/arch/arm64/include/asm/kgdb.h
@@ -26,6 +26,15 @@ extern int kgdb_fault_expected;
 
 int kgdb_brk_handler(struct pt_regs *regs, unsigned long esr);
 int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr);
+#ifdef CONFIG_KGDB
+int kgdb_single_step_handler(struct pt_regs *regs, unsigned long esr);
+#else
+static inline int kgdb_single_step_handler(struct pt_regs *regs,
+	unsigned long esr)
+{
+	return DBG_HOOK_ERROR;
+}
+#endif
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/arm64/include/asm/uprobes.h b/arch/arm64/include/asm/uprobes.h
index 3659a79a9f32..89bfb0213a50 100644
--- a/arch/arm64/include/asm/uprobes.h
+++ b/arch/arm64/include/asm/uprobes.h
@@ -29,5 +29,14 @@ struct arch_uprobe {
 };
 
 int uprobe_brk_handler(struct pt_regs *regs, unsigned long esr);
+#ifdef CONFIG_UPROBES
+int uprobe_single_step_handler(struct pt_regs *regs, unsigned long esr);
+#else
+static inline int uprobe_single_step_handler(struct pt_regs *regs,
+	unsigned long esr)
+{
+	return DBG_HOOK_ERROR;
+}
+#endif
 
 #endif
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 15d7158a7548..26c71b7edc26 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -200,30 +200,17 @@ void unregister_kernel_step_hook(struct step_hook *hook)
 }
 
 /*
- * Call registered single step handlers
+ * Call single step handlers
  * There is no Syndrome info to check for determining the handler.
- * So we call all the registered handlers, until the right handler is
- * found which returns zero.
+ * However, there is only one possible handler for user and kernel modes, so
+ * check and call the appropriate one.
  */
 static int call_step_hook(struct pt_regs *regs, unsigned long esr)
 {
-	struct step_hook *hook;
-	struct list_head *list;
-	int retval = DBG_HOOK_ERROR;
+	if (user_mode(regs))
+		return uprobe_single_step_handler(regs, esr);
 
-	list = user_mode(regs) ? &user_step_hook : &kernel_step_hook;
-
-	/*
-	 * Since single-step exception disables interrupt, this function is
-	 * entirely not preemptible, and we can use rcu list safely here.
-	 */
-	list_for_each_entry_rcu(hook, list, node)	{
-		retval = hook->fn(regs, esr);
-		if (retval == DBG_HOOK_HANDLED)
-			break;
-	}
-
-	return retval;
+	return kgdb_single_step_handler(regs, esr);
 }
 NOKPROBE_SYMBOL(call_step_hook);
 
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index b5a3b9c85a65..968324a79a89 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -250,7 +250,7 @@ int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr)
 }
 NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
 
-static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
+int kgdb_single_step_handler(struct pt_regs *regs, unsigned long esr)
 {
 	if (!kgdb_single_step)
 		return DBG_HOOK_ERROR;
@@ -258,11 +258,7 @@ static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
 	kgdb_handle_exception(0, SIGTRAP, 0, regs);
 	return DBG_HOOK_HANDLED;
 }
-NOKPROBE_SYMBOL(kgdb_step_brk_fn);
-
-static struct step_hook kgdb_step_hook = {
-	.fn		= kgdb_step_brk_fn
-};
+NOKPROBE_SYMBOL(kgdb_single_step_handler);
 
 static int __kgdb_notify(struct die_args *args, unsigned long cmd)
 {
@@ -301,13 +297,7 @@ static struct notifier_block kgdb_notifier = {
  */
 int kgdb_arch_init(void)
 {
-	int ret = register_die_notifier(&kgdb_notifier);
-
-	if (ret != 0)
-		return ret;
-
-	register_kernel_step_hook(&kgdb_step_hook);
-	return 0;
+	return register_die_notifier(&kgdb_notifier);
 }
 
 /*
@@ -317,7 +307,6 @@ int kgdb_arch_init(void)
  */
 void kgdb_arch_exit(void)
 {
-	unregister_kernel_step_hook(&kgdb_step_hook);
 	unregister_die_notifier(&kgdb_notifier);
 }
 
diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index ad68b4a5974d..1f91fd2a8187 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -182,7 +182,7 @@ int uprobe_brk_handler(struct pt_regs *regs,
 	return DBG_HOOK_ERROR;
 }
 
-static int uprobe_single_step_handler(struct pt_regs *regs,
+int uprobe_single_step_handler(struct pt_regs *regs,
 				      unsigned long esr)
 {
 	struct uprobe_task *utask = current->utask;
@@ -194,16 +194,3 @@ static int uprobe_single_step_handler(struct pt_regs *regs,
 	return DBG_HOOK_ERROR;
 }
 
-/* uprobe single step handler hook */
-static struct step_hook uprobes_step_hook = {
-	.fn = uprobe_single_step_handler,
-};
-
-static int __init arch_init_uprobes(void)
-{
-	register_user_step_hook(&uprobes_step_hook);
-
-	return 0;
-}
-
-device_initcall(arch_init_uprobes);
-- 
2.43.0


