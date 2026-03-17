Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECACFF6E99
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKQVlmaAtbkoixLibNB4OYzy4atIiWFLpPmkbtYkr2Q=; b=2Lo2lhsvIR4X0meGLJoU0KNHMy
	7p+X9l/N7kYIsd2uBGWMPvewQ6XIUZ83onZTXvEcy+vlfydVOvVD8SkUovayQokNfzGlLDH6qUPNQ
	PJB0vBzQSg7L/gkUJWs5T7Ju9PbHNFjyuOHaYV+58NIvS2l8QvnlP2LmyLUp7CTU/Rv7F/YLC8ETn
	5tAokznGpMjz5OmtdbGvpDNPjPogeiJF0TeJ6/RdSEpt46L4OJAXunYKlsP61TtGBq0bWxQmSSuNS
	muFSqLwMR16RNynqZLvYzEqnNQJwWg9gl2fe2N9NLO3teuw20y3N7CKxMra7CETSu53ij+qbMp1J7
	9xqtJs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGC-00000007KWV-1NIm;
	Tue, 17 Mar 2026 22:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dG9-00000007KUb-2Ixi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBE4944327;
	Tue, 17 Mar 2026 22:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2F0C2BCB3;
	Tue, 17 Mar 2026 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787892;
	bh=sgRjFM7xWFg9L5n1fihixm+C5Qbm0Ax6cGt49J083JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/glGm01cZOY8IhazlamaSFb++2gB16akWLwpdr+xDiQlDwhFBMGEU+K/8zBRuBlC
	 E3nJxjLBpP4w9TPa2qn0+fQbZdGcp+F/8gAq9AGPW60tQaMAONlVXt/uBSXnmlXS+L
	 tkPS3KC48AHcJwsfN1+2IhpieaQv8xJN3jDq6D47+DEYYYnVtemNLlENMmwtTN8mTr
	 uYpB+UFZ9H2OEZrWlCtfUYzDP8txjmPEzdJgFLb1mAcJgyU56qpNRmHCFgWI4b9kBH
	 qP2VJq8c4xLG6iEn9WyvagAuVOJ3K+GnjBxedvNJgtm3e9xgDIhRdvuATTHneM+y/i
	 kJNmpFfWVDzqw==
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
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 01/12] arm64: Annotate intra-function calls
Date: Tue, 17 Mar 2026 15:51:01 -0700
Message-ID: <3a9decf6cc0ad8ae707c3b4df814b92b3e7f85d8.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155133_607397_60D17AF5 
X-CRM114-Status: GOOD (  11.02  )
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

In preparation for enabling objtool on arm64, annotate intra-function
calls.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/entry.S       |  2 ++
 arch/arm64/kernel/proton-pack.c | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f8018b5c1f9a..cf808bb2abc0 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/annotate.h>
 
 #include <asm/alternative.h>
 #include <asm/assembler.h>
@@ -707,6 +708,7 @@ alternative_else_nop_endif
 	 * entry onto the return stack and using a RET instruction to
 	 * enter the full-fat kernel vectors.
 	 */
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	2f
 	b	.
 2:
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b3801f532b10..b63887a1b823 100644
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


