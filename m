Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6855A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=my84dOiR;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SB/cbvIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hua8r15V7TSjOPkP1LZ0fLVVfYG8l7xLUVsTAllRXFY=; b=my84dOiRoArAAxEFl5+/tboc9U
	DD31LFHJGiAtm2t72IHP935iMyBolZv5GvmZk0LCWihPNqRYyjEMsdNhJfWU1FeX3IZluRIeG658k
	+rwissp4O9SOHUk2UOqucFLRmQjNmq44/o1q6eL2pmF07M/tVrnkMz6+aoH2EAK8K+IibK2Xw6tXQ
	v+LenULTCZEz3ENFqEygOfEjGUidNI/CR7bhUAf8Eq82vNwIaKEqCclbC2z9dFZJYM5Kygn8UrRKE
	U0Su88sYiH8aYl0mW871MKmuszrxbJBe4mEKOPLkk1bmh0Y/8RNWIAqB40fSl62IB0pqOj2PGuooY
	KJBSR7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTQU-00000009svi-1Q7e;
	Thu, 29 Oct 2026 16:56:30 +0000
Received: from out-26.mta0.migadu.com ([2001:41d0:1004:224b::1a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTQR-00000009suw-1hVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:56:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=434KqqiFbfCjkA3irR1iRo73T1t1MZ/g1nUcxCwYWug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793292984; v=1; x=1793897784;
 b=SB/cbvIMn8fzU93V1cumKiWJi/6yMseJcAkNuE388oSnCtAUPcNQMjh/nRWj0CVpivpLJWth
 RIqwr0VrtyfZOZmff6NIWBuxTRyMlKhoVTzYiwTMs7hVvryUM55oji7mRz4zEDc9EmseKRfnsAn
 cTPBg3NpRc0dH2aQ1fmRRR9c=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5d6b4a9e39e1a764;
	Thu, 29 Oct 2026 16:56:24 +0000
X-Mizu-Trace-ID: 5d6b4a9e39e1a764
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:56:15 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Puranjay Mohan <puranjay@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Ben Cressey <ben@cressey.dev>, 
	Florent Revest <florent.revest@linux.dev>, Bill Wendling <morbo@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Subject: [PATCH v3 4/7] arm64: cfi: Use CONFIG_ARM64_FUNCTION_PREFIX_NOPS for
 the type hash offset
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-4-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095627_584306_02062DB5 
X-CRM114-Status: GOOD (  13.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make cfi_get_offset(), SYM_TYPED_FUNC_START and the BPF JIT use
CONFIG_ARM64_FUNCTION_PREFIX_NOPS instead of hardcoding four bytes. kCFI
kernels with CALL_OPS need three NOPs, or five with ThinLTO and BTI.

CONFIG_ARM64_FUNCTION_PREFIX_NOPS is 0 on every CFI kernel today, so no
functional change.

Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 arch/arm64/include/asm/cfi.h     | 11 +++++++++++
 arch/arm64/include/asm/linkage.h | 11 +++++++++++
 arch/arm64/net/bpf_jit_comp.c    |  8 ++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
index ab90f0351b7a..f3c04a2a6a95 100644
--- a/arch/arm64/include/asm/cfi.h
+++ b/arch/arm64/include/asm/cfi.h
@@ -2,6 +2,17 @@
 #ifndef _ASM_ARM64_CFI_H
 #define _ASM_ARM64_CFI_H
 
+#include <asm/insn-def.h>
+
 #define __bpfcall
 
+#ifdef CONFIG_CFI
+static inline int cfi_get_offset(void)
+{
+	/* The 4-byte type hash sits before the prefix NOPs. */
+	return 4 + CONFIG_ARM64_FUNCTION_PREFIX_NOPS * AARCH64_INSN_SIZE;
+}
+#define cfi_get_offset cfi_get_offset
+#endif /* CONFIG_CFI */
+
 #endif /* _ASM_ARM64_CFI_H */
diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index d1f7a16729d2..14bc3c67c38b 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -39,6 +39,17 @@
 	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
 	bti c ;
 
+/*
+ * The compiler emits CONFIG_ARM64_FUNCTION_PREFIX_NOPS NOPs between a C
+ * function's kCFI type hash and its entry point. Callers check the hash
+ * at that offset.
+ */
+#define __CFI_TYPE(name)				\
+	.4byte __kcfi_typeid_##name ASM_NL		\
+	.rept CONFIG_ARM64_FUNCTION_PREFIX_NOPS ASM_NL	\
+	nop ASM_NL					\
+	.endr
+
 #define SYM_TYPED_FUNC_START(name)				\
 	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
 	bti c ;
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index aaa34c739004..42cb2d446680 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -185,8 +185,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
 
 static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
 {
-	if (IS_ENABLED(CONFIG_CFI))
-		emit_u32_data(hash, ctx);
+	if (!IS_ENABLED(CONFIG_CFI))
+		return;
+
+	emit_u32_data(hash, ctx);
+	for (int i = 0; i < CONFIG_ARM64_FUNCTION_PREFIX_NOPS; i++)
+		emit(A64_NOP, ctx);
 }
 
 /*

-- 
2.54.0


