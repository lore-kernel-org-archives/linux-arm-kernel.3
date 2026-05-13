Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41F3CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2Ooj7F76F4/htrsBO8X2cHcTBIYbwW5nBalyGxkNHs=; b=ndxiPAM9unWuDWdXTs1Hm6UP4X
	D//LZaR0sTxaD+raMNE5I5zSmbP3vpVPr+mrZXNU4xup1gKwUfiVjP0FwY1AWz1xzhremfXLKlJcP
	/jbYIOqsAZeJpN1DWFlD9AmLJifQJNEQnlTKRz3p+qeDdBFur6tdo7WKCPXPgjpD48bbZlCZ9FCKc
	B8ozvaJgHs8Q0WY2k5jv7sU9kVBgAE1JP4OrW+whUYS/E8TI4xseu/QrljQWMbK9aWghDYAGP0Obr
	DrES0vwyDqCIKWWWl6JW1aXDSwCThH7HGQxoakhOZP/uPtatY3UOvKN4sZqYL/T06nVUWJwrzRoAG
	Ix5v0BzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mj-000000013fE-3qU1;
	Wed, 13 May 2026 03:34:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mi-000000013eH-1cxn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF70B60120;
	Wed, 13 May 2026 03:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B65BC2BCF7;
	Wed, 13 May 2026 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643271;
	bh=/D2z4LhluhXqyHCGUz6p/RDiGmFitxBUbjhr8ydpie0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hIIHfT854Lr7qsvx6I7cr5tcMFSOYnHYPsUmlBOOQ12eZ0G9T3SFghvuElI0QqTAV
	 2SLst2YyVIO1f/ZvenQYzJYqR/oV8LI5/GEj7n/hGWaNL6KxmxWXwSHw24BJsHHoz6
	 e2OgjzlFPNrAXLwegFCvo6KF2cyu61LwIX8Bm4kooPJGmoqItKTAdEUrh4Olr0dA4K
	 zOUmYG+BHOMK3fJejkQed26rSkT16Kc94617C4QN3JjjjI7wd97LhqZFTbFIDtbb7+
	 i9PXHoqiMYP2/mIjzf87KMuc5dG8JRc9WUbRdqozAxsJGZKdOOuGVGb91juojVNqX6
	 5dREqsC8NOPAg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 02/21] arm64: Annotate intra-function calls
Date: Tue, 12 May 2026 20:33:36 -0700
Message-ID: <16bdb04ed6653809514d9f060702248b8e587f05.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Message-ID: <20260513033336.lQuZxvupC6gk50AxhGfmq3IYPAsVsK07eNZClHJ91cw@z>

In preparation for enabling objtool on arm64, annotate intra-function
calls.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/entry.S       |  2 ++
 arch/arm64/kernel/proton-pack.c | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843a..d4cbdfb23d733 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/annotate.h>
 
 #include <asm/alternative.h>
 #include <asm/assembler.h>
@@ -705,6 +706,7 @@ alternative_else_nop_endif
 	 * entry onto the return stack and using a RET instruction to
 	 * enter the full-fat kernel vectors.
 	 */
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	2f
 	b	.
 2:
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b3801f532b10b..b63887a1b8234 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -24,6 +24,7 @@
 #include <linux/nospec.h>
 #include <linux/prctl.h>
 #include <linux/sched/task_stack.h>
+#include <linux/annotate.h>
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
@@ -245,11 +246,12 @@ static noinstr void qcom_link_stack_sanitisation(void)
 {
 	u64 tmp;
 
-	asm volatile("mov	%0, x30		\n"
-		     ".rept	16		\n"
-		     "bl	. + 4		\n"
-		     ".endr			\n"
-		     "mov	x30, %0		\n"
+	asm volatile("mov	%0, x30			\n"
+		     ".rept	16			\n"
+		     ANNOTATE_INTRA_FUNCTION_CALL "	\n"
+		     "bl	. + 4			\n"
+		     ".endr				\n"
+		     "mov	x30, %0			\n"
 		     : "=&r" (tmp));
 }
 
-- 
2.53.0


