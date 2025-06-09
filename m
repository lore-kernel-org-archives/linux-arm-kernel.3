Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF25C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qalVOAK/if69lmwtDa6bzO6lxKpagL+SGmw40rYVPM=; b=2tkXVHgvul4M1E
	D3gkw96if67sCjkZRuHkk2KcGDnoEtFAq9UUPLOxgOtyAyMEYGvkulXLsjYMlmwd9SNS93mRx6lPL
	ifiVFEeboTjXPFCcOtFwSf500dy+kyZCZ/kEfPHg6xdXvTP+sDA9iEwv3lSbjI9TIlrNBJ9kr51MG
	CJYHVaBmdPR8BWb3IWTE0XZJ3x0qEya1JwdwRpV4AawWrIu60h1Q9QRck1wS4jlf7S0d6aDL0572v
	bpqdrmpLNbtzdNpHFTQygWGooiuYBUYWdeiawWHxLaT9lJjrPYQBa2z2uqSgltYz1FowIwlPZtgOq
	wO43abgAXwHvC528sT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhlz-00000004yR8-2OC4;
	Mon, 09 Jun 2025 19:03:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgP0-00000004orU-3bsA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:35:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4588150C;
	Mon,  9 Jun 2025 10:34:59 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F7323F66E;
	Mon,  9 Jun 2025 10:35:17 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 05/13] arm64: debug: remove break/step handler registration infrastructure
Date: Mon,  9 Jun 2025 18:34:05 +0100
Message-ID: <20250609173413.132168-6-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103518_984174_0BE86B8D 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Remove all infrastructure for the dynamic registration previously used by
software breakpoints and stepping handlers.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/debug-monitors.h | 24 ----------
 arch/arm64/kernel/debug-monitors.c      | 63 -------------------------
 2 files changed, 87 deletions(-)

diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index e1caf6a8380c..caee1d923f9c 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -62,30 +62,6 @@ struct task_struct;
 #define DBG_HOOK_HANDLED	0
 #define DBG_HOOK_ERROR		1
 
-struct step_hook {
-	struct list_head node;
-	int (*fn)(struct pt_regs *regs, unsigned long esr);
-};
-
-void register_user_step_hook(struct step_hook *hook);
-void unregister_user_step_hook(struct step_hook *hook);
-
-void register_kernel_step_hook(struct step_hook *hook);
-void unregister_kernel_step_hook(struct step_hook *hook);
-
-struct break_hook {
-	struct list_head node;
-	int (*fn)(struct pt_regs *regs, unsigned long esr);
-	u16 imm;
-	u16 mask; /* These bits are ignored when comparing with imm */
-};
-
-void register_user_break_hook(struct break_hook *hook);
-void unregister_user_break_hook(struct break_hook *hook);
-
-void register_kernel_break_hook(struct break_hook *hook);
-void unregister_kernel_break_hook(struct break_hook *hook);
-
 u8 debug_monitors_arch(void);
 
 enum dbg_active_el {
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index b156bef7f61e..02ba2c5e40ec 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -159,46 +159,6 @@ NOKPROBE_SYMBOL(clear_user_regs_spsr_ss);
 #define set_regs_spsr_ss(r)	set_user_regs_spsr_ss(&(r)->user_regs)
 #define clear_regs_spsr_ss(r)	clear_user_regs_spsr_ss(&(r)->user_regs)
 
-static DEFINE_SPINLOCK(debug_hook_lock);
-static LIST_HEAD(user_step_hook);
-static LIST_HEAD(kernel_step_hook);
-
-static void register_debug_hook(struct list_head *node, struct list_head *list)
-{
-	spin_lock(&debug_hook_lock);
-	list_add_rcu(node, list);
-	spin_unlock(&debug_hook_lock);
-
-}
-
-static void unregister_debug_hook(struct list_head *node)
-{
-	spin_lock(&debug_hook_lock);
-	list_del_rcu(node);
-	spin_unlock(&debug_hook_lock);
-	synchronize_rcu();
-}
-
-void register_user_step_hook(struct step_hook *hook)
-{
-	register_debug_hook(&hook->node, &user_step_hook);
-}
-
-void unregister_user_step_hook(struct step_hook *hook)
-{
-	unregister_debug_hook(&hook->node);
-}
-
-void register_kernel_step_hook(struct step_hook *hook)
-{
-	register_debug_hook(&hook->node, &kernel_step_hook);
-}
-
-void unregister_kernel_step_hook(struct step_hook *hook)
-{
-	unregister_debug_hook(&hook->node);
-}
-
 /*
  * Call single step handlers
  * There is no Syndrome info to check for determining the handler.
@@ -264,29 +224,6 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
 }
 NOKPROBE_SYMBOL(single_step_handler);
 
-static LIST_HEAD(user_break_hook);
-static LIST_HEAD(kernel_break_hook);
-
-void register_user_break_hook(struct break_hook *hook)
-{
-	register_debug_hook(&hook->node, &user_break_hook);
-}
-
-void unregister_user_break_hook(struct break_hook *hook)
-{
-	unregister_debug_hook(&hook->node);
-}
-
-void register_kernel_break_hook(struct break_hook *hook)
-{
-	register_debug_hook(&hook->node, &kernel_break_hook);
-}
-
-void unregister_kernel_break_hook(struct break_hook *hook)
-{
-	unregister_debug_hook(&hook->node);
-}
-
 static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 {
 	if (user_mode(regs)) {
-- 
2.43.0


