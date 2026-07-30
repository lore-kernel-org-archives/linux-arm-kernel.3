Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92005C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXptIvD3yImJlDeKXQJCzH7xA2WLNgQI67OtSBoKL1s=; b=m1XsnGiO0pNBGEBouLJl3n3CZW
	rXSPk54jztVPqvwb7FrmBVqBms2XjFt0BZ2Xy2AJNGNHZtp2v4jgblcBdBUo20thPrSt9gbqmMxNR
	mkg7JgKXVrxY2D4s6KfNuZTw7aRwJleC+v9Aep9WKfy7dqedQJixAuK+iEkXFtQcMZz+tjjNUjFCn
	L6ZtL4QcCZHk2Vn/840UdPXEqHt8qVUQcYCU1a0pSBD3cEv/lwl6kzmHkQQD144NZ9pBIphNaE14Q
	KfK1wmBHwv7rr7VtPosT9CkBzTX5YcAKrKW+PvdNDkQD0rlcq8mVEWEo0WlIiM6V8eeY3aiwklLfz
	bdTc0ERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQmy-0000000Aalu-01PY;
	Thu, 30 Jul 2026 13:27:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQms-0000000Aaka-2Gtx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:27:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B8E444EEF;
	Thu, 30 Jul 2026 13:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE491F000E9;
	Thu, 30 Jul 2026 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418021;
	bh=mXptIvD3yImJlDeKXQJCzH7xA2WLNgQI67OtSBoKL1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EU/Sx5QVqNfdlnf76o8KYIiD9/vSjv6k3QuEFUHlqdha3wKQ8tNw55N0lWbpEx8i4
	 ZxTENCn7Na/UqPPzfbbTMCmDs1vzc4HiK2jmGYas6lpJfEsT/ub1TqSnq9YcE4iUcc
	 /dpfovu2RKwzvjV4850HIBoUFa7bqRuVVLUZDcxaKrhJzv71BjkbeMy4fdpq/q8PT/
	 eTswDURsoHASai4mrDMrvLcEHka3KUnwM4X1kYqsPTysTC7hHC6zj3bjnSWGysJoYb
	 KGOp3SD/zw3AFs06tY+JkT8vuO/CtedvGNGU5IbWwFFz6TQDH40j5/GESZiSeQIt9U
	 MIQEyiAqXMg2A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 2/2] arm64: syscall: Pass 'orig_x0' as first argument to native system call
Date: Thu, 30 Jul 2026 14:26:51 +0100
Message-ID: <20260730132651.25993-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730132651.25993-1-will@kernel.org>
References: <20260730132651.25993-1-will@kernel.org>
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

syscall_get_arguments() returns 'regs->orig_x0' for the first system
call argument so as to avoid aliasing with the syscall return value in
'regs->regs[0]' on the return path, however the actual syscall
invocation passes 'regs->regs[0]' as the first parameter.

Although the two registers should be kept in sync during syscall entry
for native tasks, pass 'regs->orig_x0' as the first syscall parameter
for consistency with the syscall argument APIs. Compat tasks continue to
use 'regs->regs[0]' for compatibility with the behaviour of the 32-bit
kernel.

Suggested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/syscall_wrapper.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/syscall_wrapper.h b/arch/arm64/include/asm/syscall_wrapper.h
index abb57bc54305..395152ef5372 100644
--- a/arch/arm64/include/asm/syscall_wrapper.h
+++ b/arch/arm64/include/asm/syscall_wrapper.h
@@ -10,13 +10,13 @@
 
 #include <asm/ptrace.h>
 
-#define SC_ARM64_REGS_TO_ARGS(x, ...)				\
+#ifdef CONFIG_COMPAT
+
+#define COMPAT_SC_ARM64_REGS_TO_ARGS(x, ...)			\
 	__MAP(x,__SC_ARGS					\
 	      ,,regs->regs[0],,regs->regs[1],,regs->regs[2]	\
 	      ,,regs->regs[3],,regs->regs[4],,regs->regs[5])
 
-#ifdef CONFIG_COMPAT
-
 #define COMPAT_SYSCALL_DEFINEx(x, name, ...)						\
 	asmlinkage long __arm64_compat_sys##name(const struct pt_regs *regs);		\
 	ALLOW_ERROR_INJECTION(__arm64_compat_sys##name, ERRNO);				\
@@ -24,7 +24,7 @@
 	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
 	asmlinkage long __arm64_compat_sys##name(const struct pt_regs *regs)		\
 	{										\
-		return __se_compat_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));	\
+		return __se_compat_sys##name(COMPAT_SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));	\
 	}										\
 	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
 	{										\
@@ -46,6 +46,11 @@
 
 #endif /* CONFIG_COMPAT */
 
+#define SC_ARM64_REGS_TO_ARGS(x, ...)				\
+	__MAP(x,__SC_ARGS					\
+	      ,,regs->orig_x0,,regs->regs[1],,regs->regs[2]	\
+	      ,,regs->regs[3],,regs->regs[4],,regs->regs[5])
+
 #define __SYSCALL_DEFINEx(x, name, ...)						\
 	asmlinkage long __arm64_sys##name(const struct pt_regs *regs);		\
 	ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);			\
-- 
2.55.0.508.g3f0d502094-goog


