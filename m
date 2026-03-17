Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240D6FF6E9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsQjUfgvY+cs+PVniUGlAVWULquEaaNin8Td5tfUwkY=; b=nBiDVSSiBgAAlbWjoTej60y1iW
	qC9Q1MaLhLLnZDfW4I/nxlWeCMWTl4/dSUKG0Rc7AwngS77VL6anMyWsgYwbxX5h8nMcEqFWzGQgb
	Kve07Ehg55ukhVzAFt375KuJ6JQKNj92iYlx/34LLG6EARrTU927lcXsvW/HhJfmlN+3Xq1JF9tfy
	MnOxXNXcmvnzzeWAt777sjkN/+/Z8GEkrLPfTeMGymxt4dsDquPuFhJsNg7lkViMQxUHduYuz0uh+
	ATSu8CVFukMtI3JYdzeetq+8QwYMkmMaGu+fPXO5455TK5WohM6ZHtqvC/pbSuCnWIwVcq6p+VH0G
	cmgJZo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dGP-00000007KbH-0Db5;
	Tue, 17 Mar 2026 22:51:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dG9-00000007KUr-2sMr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 22:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60DA7444CF;
	Tue, 17 Mar 2026 22:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD522C4CEF7;
	Tue, 17 Mar 2026 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787893;
	bh=W1WxiHbuvXgUL/GnkhyKUEAdymsHY0Opyqu1xOqSq/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V7ngc1osjOIco43BFhUtLp/DIzLkOHFDFV+nx47wIDWCw6gIbjjSTRd6CLV8NdBMa
	 6l67mCiRx8lBOK5RN4xfJELW5Qf4FSoabnC0rua2yK+TL4H5Hpk0WMwQ5a15Jw6woj
	 rkV9WKrQcr3Yvu+VWEDLr5iaxIaiEzlWvrVdN02BFPnasdHFdJDThvzsi6bYvLI988
	 YfmgRPIJ1ugL7fCiNCL0e5JIVj+A+7lb/7kYGeheud3n8CtNUu+npm7sc0FztMfOQ/
	 u2ZIcn7gnkMQ8ZyGI830V2JDgb0d61Xpbl0QJUU3Z2950Fz7yvAdHPMiU/y5PnVzV0
	 nVWfXKoXBZqPA==
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
Subject: [PATCH v2 02/12] arm64: head: Move boot header to .head.data
Date: Tue, 17 Mar 2026 15:51:02 -0700
Message-ID: <63e5cf00cb5636d1315754a264ff90175820ec65.1773787568.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_155133_752305_6355F451 
X-CRM114-Status: GOOD (  12.71  )
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

The arm64 boot header is mostly data.  Move it to a data section to
prevent objtool and other tools from trying to disassemble it.  The
final linked result is the same.

Acked-by: Song Liu <song@kernel.or
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/head.S          | 2 +-
 include/asm-generic/vmlinux.lds.h | 2 +-
 include/linux/init.h              | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..0681c6e50859 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -54,7 +54,7 @@
  * that are useful before the MMU is enabled. The allocations are described
  * in the entry routines.
  */
-	__HEAD
+	__HEADDATA
 	/*
 	 * DO NOT MODIFY. Image header expected by Linux boot-loaders.
 	 */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e1580febe4b..f82f170a97eb 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -663,7 +663,7 @@
 		__static_call_text_end = .;
 
 /* Section used for early init (in .S files) */
-#define HEAD_TEXT  KEEP(*(.head.text))
+#define HEAD_TEXT  KEEP(*(.head.data .head.text))
 
 #define HEAD_TEXT_SECTION							\
 	.head.text : AT(ADDR(.head.text) - LOAD_OFFSET) {		\
diff --git a/include/linux/init.h b/include/linux/init.h
index 40331923b9f4..91e16f3205e2 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -90,6 +90,7 @@
 
 /* For assembly routines */
 #define __HEAD		.section	".head.text","ax"
+#define __HEADDATA	.section	".head.data","aw"
 #define __INIT		.section	".init.text","ax"
 #define __FINIT		.previous
 
-- 
2.53.0


