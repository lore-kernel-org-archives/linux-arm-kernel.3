Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C82D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvKVwPwP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fzQx/vyh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kJkRWzKTSLUK2/Faj3tcwhme6sF5UGHV5NUdGjAN3AY=; b=zvKVwPwP992lmqG3dGb81S4Kkv
	7NjijbHtFoNo6iQi9P1KvbEIWsL+PDPDDDZeaC4BirKVsi/+4tXmAoXyf1B3zyaYs2sS5xm0iO/jV
	t5ZLW5icb4+yQvvuqziYVSaqXZ/34PusUwVVbQmpc9BXWkJ+3e+qVe1agNPpmg8TH8OWUWo7UsMsM
	xLpiAWlHg6fpIuQRLgiUe/ZHSO8vHnBLqNZPt/tZo31mersjfuvFWWMRDJvyBc+qCRZpsnNTPKEda
	et0NWld+lw0p8hiAYP2JpKiyM/yiyQnxnkEOO+MDghxI7BsdSfQbCeLTgSieByGsMpHU8XOdt7cB3
	zKSVhVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTPt-00000009snf-445b;
	Thu, 29 Oct 2026 16:55:53 +0000
Received: from out-12.mta0.migadu.com ([2001:41d0:1004:224b::c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTPq-00000009smQ-36zd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:55:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DcbHqMXm9YywQXQS5isNbN/DF/Ks2LOHcly/ru2g6p8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793292947; v=1; x=1793897747;
 b=fzQx/vyhDMsNSbH05grz1vVv/dy+61aONHR6Y2tDDyMwJb/K3ZaVBoFEBQ7w8j7qzwF+CqvG
 QIcxH4CmRuSVSy9wASTv4XvQLtKIHfGWlKeVVvvYppk9RzEfEE6fIOzRO8GPv+MI4NuS7x/nofP
 v/ooAxUwdsWIQeuXUQCYIgZw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fa999a47ed1d7bdc;
	Thu, 29 Oct 2026 16:55:23 +0000
X-Mizu-Trace-ID: fa999a47ed1d7bdc
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:55:13 +0000
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
Subject: [PATCH v3 3/7] arm64: ftrace: Make the CALL_OPS prefix layout
 configurable
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-3-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095550_940245_81515BC2 
X-CRM114-Status: GOOD (  31.10  )
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

The arm64 ftrace code assumes two NOPs before every function in
several places. Replace the hardcoded count with a Kconfig value named
CONFIG_ARM64_FUNCTION_PREFIX_NOPS that defaults to 2. Compute the ops
literal address with one formula in both the assembly that reads it
and the C code that writes it. kCFI kernels with CALL_OPS need three
NOPs, or five with ThinLTO and BTI, and the reader and the writer stay
in sync either way.

Also make ftrace_call_adjust() look at each site's bytes and refuse
the ones that do not match the expected layout instead of patching
them. The two instructions to patch must be NOPs and the literal must
fall within the prefix NOPs. Log a refused site and leave it untraced.

No functional change for the layouts compilers generate today.

Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 arch/arm64/Kconfig               |   5 ++
 arch/arm64/include/asm/ftrace.h  |  16 ++++++
 arch/arm64/kernel/entry-ftrace.S |  16 +++---
 arch/arm64/kernel/ftrace.c       | 120 ++++++++++++++++++++++-----------------
 4 files changed, 98 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cfef22aee709..aa7d5e1859af 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -271,6 +271,11 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=2)
 
+config ARM64_FUNCTION_PREFIX_NOPS
+	int
+	default 2 if DYNAMIC_FTRACE_WITH_CALL_OPS
+	default 0
+
 config 64BIT
 	def_bool y
 
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 1621c84f44b3..5a7a515bf7cd 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -24,6 +24,22 @@
 #define FTRACE_PLT_IDX		0
 #define NR_FTRACE_PLTS		1
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+/*
+ * ftrace_caller reads the callsite's ftrace_ops literal at
+ * ALIGN_DOWN(LR, 8) - FTRACE_CALL_OPS_BIAS. See ftrace_call_ops_adjust()
+ * for the layouts this serves.
+ */
+#define FTRACE_PREFIX_NOPS	CONFIG_ARM64_FUNCTION_PREFIX_NOPS
+#if FTRACE_PREFIX_NOPS == 2 || FTRACE_PREFIX_NOPS == 3
+#define FTRACE_CALL_OPS_BIAS	16
+#elif FTRACE_PREFIX_NOPS == 5
+#define FTRACE_CALL_OPS_BIAS	24
+#else
+#error "Unsupported number of function prefix NOPs"
+#endif
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS */
+
 /*
  * Currently, gcc tends to save the link register after the local variables
  * on the stack. This causes the max stack tracer to report the function
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 025140caafe7..95727fee3cc5 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -39,17 +39,17 @@ SYM_CODE_START(ftrace_caller)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
 	/*
 	 * The literal pointer to the ops is at an 8-byte aligned boundary
-	 * which is either 12 or 16 bytes before the BL instruction in the call
-	 * site. See ftrace_call_adjust() for details.
+	 * before the BL instruction in the call site. See ftrace_call_adjust()
+	 * and <asm/ftrace.h> for details.
 	 *
-	 * Therefore here the LR points at `literal + 16` or `literal + 20`,
-	 * and we can find the address of the literal in either case by
-	 * aligning to an 8-byte boundary and subtracting 16. We do the
-	 * alignment first as this allows us to fold the subtraction into the
-	 * LDR.
+	 * Therefore here the LR points at `literal + FTRACE_CALL_OPS_BIAS` or
+	 * `literal + FTRACE_CALL_OPS_BIAS + 4`, and we can find the address of
+	 * the literal in either case by aligning to an 8-byte boundary and
+	 * subtracting FTRACE_CALL_OPS_BIAS. We do the alignment first as this
+	 * allows us to fold the subtraction into the LDR.
 	 */
 	bic	x11, x30, 0x7
-	ldr	x11, [x11, #-(4 * AARCH64_INSN_SIZE)]		// op
+	ldr	x11, [x11, #-FTRACE_CALL_OPS_BIAS]		// op
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	/*
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index e1a3c0b3a051..0d922fa63f71 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -60,6 +60,73 @@ int ftrace_regs_query_register_offset(const char *name)
 }
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+/*
+ * The address of the ops literal for a callsite whose `BL <caller>` is at
+ * @pc, exactly as ftrace_caller derives it from the return address.
+ */
+static unsigned long ftrace_call_ops_literal(unsigned long pc)
+{
+	return ALIGN_DOWN(pc + AARCH64_INSN_SIZE, 8) - FTRACE_CALL_OPS_BIAS;
+}
+
+/*
+ * addr is the first of the FTRACE_PREFIX_NOPS NOPs before a function:
+ *
+ * addr-04:		.word		// kCFI type hash, address-taken and non-local only
+ * addr+00:		NOP		// FTRACE_PREFIX_NOPS of these, two hold the literal
+ * func+00:	func:	BTI	C	// only if BTI and the function may be called indirectly
+ * func+04:		NOP		// patched to MOV X9, LR
+ * func+08:		NOP		// patched to BL <caller>
+ *
+ * The compiler aligns whatever comes first to 8 bytes. ftrace_caller reads
+ * the literal at ALIGN_DOWN(LR, 8) - FTRACE_CALL_OPS_BIAS, with LR at
+ * func+8, or func+12 after a BTI:
+ *
+ *	NOPs	BIAS	literal at
+ *	2	16	func - 8
+ *	3	16	func - 8, or func - 12 if func % 8 == 4 (no hash, no BTI)
+ *	5	24	func - 16, or func - 12 / func - 20 if func % 8 == 4
+ *
+ * Return the address of the NOP to be patched to BL, or 0 when the two
+ * NOPs are not there or the literal would fall outside the prefix.
+ */
+static unsigned long ftrace_call_ops_adjust(unsigned long addr)
+{
+	unsigned long func = addr + FTRACE_PREFIX_NOPS * AARCH64_INSN_SIZE;
+	unsigned long pc = func + AARCH64_INSN_SIZE;
+	unsigned long literal;
+	u32 nop = aarch64_insn_gen_nop();
+
+	if (IS_ENABLED(CONFIG_ARM64_BTI_KERNEL) &&
+	    aarch64_insn_is_bti(le32_to_cpu(*(__le32 *)func)))
+		pc += AARCH64_INSN_SIZE;
+
+	/* Objects built with only the prefix NOPs have nothing to patch. */
+	if (le32_to_cpu(*(__le32 *)(pc - AARCH64_INSN_SIZE)) != nop ||
+	    le32_to_cpu(*(__le32 *)pc) != nop) {
+		pr_warn_ratelimited("ftrace: no patchable entry at %ps\n",
+				    (void *)func);
+		return 0;
+	}
+
+	/* The literal would overlap the type hash or the entry point. */
+	literal = ftrace_call_ops_literal(pc);
+	if (literal < addr || literal + sizeof(u64) > func) {
+		pr_warn_ratelimited("ftrace: cannot trace %ps: no room for the ops literal\n",
+				    (void *)func);
+		return 0;
+	}
+
+	return pc;
+}
+#else
+static unsigned long ftrace_call_ops_adjust(unsigned long addr)
+{
+	return 0;
+}
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS */
+
 unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	/*
@@ -91,56 +158,7 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
 		return addr + AARCH64_INSN_SIZE;
 
-	/*
-	 * When using patchable-function-entry with pre-function NOPs, addr is
-	 * the address of the first pre-function NOP.
-	 *
-	 * Starting from an 8-byte aligned base, the compiler has either
-	 * generated:
-	 *
-	 * addr+00:		NOP		// Literal (first 32 bits)
-	 * addr+04:		NOP		// Literal (last 32 bits)
-	 * addr+08:	func:	NOP		// To be patched to MOV X9, LR
-	 * addr+12:		NOP		// To be patched to BL <caller>
-	 *
-	 * Or:
-	 *
-	 * addr+00:		NOP		// Literal (first 32 bits)
-	 * addr+04:		NOP		// Literal (last 32 bits)
-	 * addr+08:	func:	BTI	C
-	 * addr+12:		NOP		// To be patched to MOV X9, LR
-	 * addr+16:		NOP		// To be patched to BL <caller>
-	 *
-	 * We must adjust addr to the address of the NOP which will be patched
-	 * to `BL <caller>`, which is at either addr+12 or addr+16 depending on
-	 * whether there is a BTI.
-	 */
-
-	if (!IS_ALIGNED(addr, sizeof(unsigned long))) {
-		WARN_RATELIMIT(1, "Misaligned patch-site %pS\n",
-			       (void *)(addr + 8));
-		return 0;
-	}
-
-	/* Skip the NOPs placed before the function entry point */
-	addr += 2 * AARCH64_INSN_SIZE;
-
-	/* Skip any BTI */
-	if (IS_ENABLED(CONFIG_ARM64_BTI_KERNEL)) {
-		u32 insn = le32_to_cpu(*(__le32 *)addr);
-
-		if (aarch64_insn_is_bti(insn)) {
-			addr += AARCH64_INSN_SIZE;
-		} else if (insn != aarch64_insn_gen_nop()) {
-			WARN_RATELIMIT(1, "unexpected insn in patch-site %pS: 0x%08x\n",
-				       (void *)addr, insn);
-		}
-	}
-
-	/* Skip the first NOP after function entry */
-	addr += AARCH64_INSN_SIZE;
-
-	return addr;
+	return ftrace_call_ops_adjust(addr);
 }
 
 /* Convert fentry_ip to the symbol address without kallsyms */
@@ -368,7 +386,7 @@ static const struct ftrace_ops *arm64_rec_get_ops(struct dyn_ftrace *rec)
 static int ftrace_rec_set_ops(const struct dyn_ftrace *rec,
 			      const struct ftrace_ops *ops)
 {
-	unsigned long literal = ALIGN_DOWN(rec->ip - 12, 8);
+	unsigned long literal = ftrace_call_ops_literal(rec->ip);
 	return aarch64_insn_write_literal_u64((void *)literal,
 					      (unsigned long)ops);
 }

-- 
2.54.0


