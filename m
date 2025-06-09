Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949AFC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 18:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIa5oCO6frSG3OKU7iD+EOMfOCg0SWKAQF+ojVmLS/M=; b=eyPlGjzfOmwiGx
	3UATlLrFILWCHcHJuFkh2B+A0yV8QdvlnhwyaJHP+lgZ9l0czfvGQ+afFGiSIR+NZCyXnLu1i8hNJ
	iuC7h0issKIaVj9KDocqMtG5Ck4ByteokI3Sl5DkwZzUALIKDCgXIxjuCpXrFbgl/Ewf6L12kXODT
	Y6JFpLyjRu35H2746lsf81umigaoWOJWXgUF5sjPCmzQhJvUojMHfEoptmrl4hci3/tLkFt1DMLcq
	p1wN1u5DceGMLA4CRXHOlhLLwQzqIzDCQU9FXcLTyNc6eV24mAwvv4xBcyQxNI9anR2AGymPTRXnV
	XRUzp0VWoBp+hrl7mlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhhl-00000004xqT-3A7r;
	Mon, 09 Jun 2025 18:58:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgOw-00000004opi-05Z2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:35:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B5AB2573;
	Mon,  9 Jun 2025 10:34:54 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 206EF3F66E;
	Mon,  9 Jun 2025 10:35:11 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/13] arm64: refactor aarch32_break_handler()
Date: Mon,  9 Jun 2025 18:34:02 +0100
Message-ID: <20250609173413.132168-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103514_104667_C8DF2FF5 
X-CRM114-Status: GOOD (  14.67  )
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

`aarch32_break_handler()` is called in `do_el0_undef()` when we
are trying to handle an exception whose Exception Syndrome is unknown.
It checks if the instruction hit might be a 32-bit arm break (be it
A32 or T2), and sends a SIGTRAP to userspace if it is so that it can
be handled.

However, this is badly represented in the naming of the function, and
is not consistent with the other functions called with the same logic
in `do_el0_undef()`.

Rename it `try_handle_aarch32_break()` and change the return value to
a boolean to align with the logic of the other tentative handlers in
`do_el0_undef()`, the previous error code being ignored anyway.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/debug-monitors.h |  2 +-
 arch/arm64/kernel/debug-monitors.c      | 10 +++++-----
 arch/arm64/kernel/traps.c               |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index 8f6ba31b8658..e1caf6a8380c 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -116,7 +116,7 @@ static inline int reinstall_suspended_bps(struct pt_regs *regs)
 }
 #endif
 
-int aarch32_break_handler(struct pt_regs *regs);
+bool try_handle_aarch32_break(struct pt_regs *regs);
 
 void debug_traps_init(void);
 
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 676fa0231935..9e69f2e915e8 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -334,7 +334,7 @@ static int brk_handler(unsigned long unused, unsigned long esr,
 }
 NOKPROBE_SYMBOL(brk_handler);
 
-int aarch32_break_handler(struct pt_regs *regs)
+bool try_handle_aarch32_break(struct pt_regs *regs)
 {
 	u32 arm_instr;
 	u16 thumb_instr;
@@ -342,7 +342,7 @@ int aarch32_break_handler(struct pt_regs *regs)
 	void __user *pc = (void __user *)instruction_pointer(regs);
 
 	if (!compat_user_mode(regs))
-		return -EFAULT;
+		return false;
 
 	if (compat_thumb_mode(regs)) {
 		/* get 16-bit Thumb instruction */
@@ -366,12 +366,12 @@ int aarch32_break_handler(struct pt_regs *regs)
 	}
 
 	if (!bp)
-		return -EFAULT;
+		return false;
 
 	send_user_sigtrap(TRAP_BRKPT);
-	return 0;
+	return true;
 }
-NOKPROBE_SYMBOL(aarch32_break_handler);
+NOKPROBE_SYMBOL(try_handle_aarch32_break);
 
 void __init debug_traps_init(void)
 {
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 9bfa5c944379..685c11b2c553 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -454,7 +454,7 @@ void do_el0_undef(struct pt_regs *regs, unsigned long esr)
 	u32 insn;
 
 	/* check for AArch32 breakpoint instructions */
-	if (!aarch32_break_handler(regs))
+	if (try_handle_aarch32_break(regs))
 		return;
 
 	if (user_insn_read(regs, &insn))
-- 
2.43.0


