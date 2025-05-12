Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAD3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+ts0D5uilzX4onrRGi1KMa/FMReD0xrYI/6YPcEvO4=; b=MLCpjoTD3dHLQe
	8moOpUzqgJ3rv37HvSKK9QVw3X4TcJaM4FUfuuWPKzNA6PZ3VK9tcrXDeQXOI3+vAKZE+OOljiFN2
	BZ58JSFhLEjqAbTavB4LGNTnjpNqx36c0W6Vt1so7w5fsR+CPi7Hp71n/NQo9g6JQi1btXc7r2SuZ
	NxGOjxMcCHSSzDKzfNhW9snsi+XngZImdPJPxV0KTe0HtSOA7AZ5HOG1Z3c7OJoGFafo4xWuvn8rt
	lnFMLqY7QGlbrIh9JLy35Fxwcr+j0+QnVVdjFAKCzzozS9pAOI8Vq0bI0m9H1VC9ZsMIZaOtxEdV5
	5QL4xwo64AIRVNH6dr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXDw-0000000AFcH-2GG4;
	Mon, 12 May 2025 17:45:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXBt-0000000AF9l-2LFG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 17:43:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E032C150C;
	Mon, 12 May 2025 10:43:37 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 285C43F673;
	Mon, 12 May 2025 10:43:46 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/11] arm64: debug: clean up single_step_handler logic
Date: Mon, 12 May 2025 18:43:16 +0100
Message-ID: <20250512174326.133905-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512174326.133905-1-ada.coupriediaz@arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_104349_639051_50B8139E 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Remove the unnecessary boolean which always checks if the handler was found
and return early instead.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/debug-monitors.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 58f047de3e1c..676fa0231935 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -241,8 +241,6 @@ static void send_user_sigtrap(int si_code)
 static int single_step_handler(unsigned long unused, unsigned long esr,
 			       struct pt_regs *regs)
 {
-	bool handler_found = false;
-
 	/*
 	 * If we are stepping a pending breakpoint, call the hw_breakpoint
 	 * handler first.
@@ -250,10 +248,10 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
 	if (!reinstall_suspended_bps(regs))
 		return 0;
 
-	if (!handler_found && call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
-		handler_found = true;
+	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
+		return 0;
 
-	if (!handler_found && user_mode(regs)) {
+	if (user_mode(regs)) {
 		send_user_sigtrap(TRAP_TRACE);
 
 		/*
@@ -263,7 +261,7 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
 		 * to the active-not-pending state).
 		 */
 		user_rewind_single_step(current);
-	} else if (!handler_found) {
+	} else {
 		pr_warn("Unexpected kernel single-step exception at EL1\n");
 		/*
 		 * Re-enable stepping since we know that we will be
-- 
2.43.0


