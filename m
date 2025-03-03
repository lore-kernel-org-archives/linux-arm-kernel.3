Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FE9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nymZZudf34hrdxusEHfgJt6WkWUJ+6WT6FOvsBZVSeI=; b=2FLGq/rhe5zzuvyd4TZWeZuS8T
	s7M5QPUKm6gE5ht7SFnXnVZaZBuXr48UB+C0luzLpx0eRTsLZxz0k1chrJWRS7kFG+MDkSEnMuRnj
	1w7jYRTv+InEeza1wkcrH564OT5S7PMCrBbyZoUo17t+hcgbO7Zg7y7EHCD1nIpM++VOnG/bLdXM/
	pwwXmgKvCKXx0QqTrNYEpit9Zk1NBDAp+T8sr1eY4tK5dfBirvEP7ecIqxo06neCe8bf1im/EBcW1
	KYz0zzYrjxUXYNmH+LigFGbaUzHuvyuzFddEm2I/CxeejNFGEf2qyzf8ECx/l2ZBUsd7WUalENCJe
	nYd+p+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozlO-0000000HN77-1B3V;
	Mon, 03 Mar 2025 06:58:54 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toziP-0000000HMVD-3snS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 06:55:51 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-2fe821570e4so5804027a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 22:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984949; x=1741589749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nymZZudf34hrdxusEHfgJt6WkWUJ+6WT6FOvsBZVSeI=;
        b=cGeni1eJ0Pv/c1fxarMLMnsnHk8WyotBCBOJ/5jKO9b5pADqfyjPDqQCEpUra2HKld
         T76OatE4f4I3NcvYRBwJcZcaEg/4Zu8D+Jtfk0hU6MDVsXqOy6S4pp1zYgSUeOkbkZwT
         1J0VkIGlG8ySAtPvl9Hn6MsINOiqr1taUZw13D+cATX6OM1/EwvfSJdLCqRyGYjvb53A
         B5B9KRGuZKgZ0nNvDAonTg6FvqcarbPNvHYJFSTxrTXLO+f931TNQCcV6aokVqPYhN3J
         uzHmJTekUMSpG+CQ++nL79TyC+P6dwgP93ePxUQiTwepLvD4Op8icbB3MO3AwwoOnIMZ
         /hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984949; x=1741589749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nymZZudf34hrdxusEHfgJt6WkWUJ+6WT6FOvsBZVSeI=;
        b=vNgsgxNmNBJ4jHZafF7WThgAKphAbuayK4LqWhnNpwqpZ801GZ0NTqr7jWJgGKNy8U
         p/HXfgcURbuKq9oHiDR6yWx0ms79lRDUW44IkvX6Y/yGgcervhJn6BvPbL9eHPrhWLGF
         jULI4W8wa4R69/oe30UaTBg5KMgmrHSfyszSYpz9RUlxxMxfyfeKdmOh62TfwKEFRqor
         Bu8nLPuiN33kCdORZtBUh+hv9f/7h1gm3ZuOpDjaPcjtDpWV3AIBq1UjmllZCwzquIUE
         Qv60fziX9efsqL2+nzhKg/qm3cAlxfRc08WW4R0Po2uXSN81XUlXflnOz96WeG93VqKe
         3TLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9HlKjbYgvzICCLtOEPjUnLiGkpiw7PHRjwn+bVfAxPRWM5lXN00D9JBYmGFwM0rSLgWk4xP7UyFzMMM0a6fiY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk6ngR9LvkQwQ9/0SrflcHZmhnMy9VZFtjAoSxqRxOdvA0+Izt
	bcA8jJook+GU7DjbSyD5uPG5LHKsfj9kXTgJdRVjEglDI2z0a1Fx
X-Gm-Gg: ASbGncu9POJKn6i4k6AMl3PkwcYumMyum73lePxtyueYMpYvAe70GtJ1GiRt1Pg5fYg
	4BFsVHhuspvLzb4YO/uAwjnXqVw0GeNC3MBSJ1hC+tRmADeB4kjYF2Rbyeb49dG+SWYfa3AMoN8
	dbYfcXGNs/nlimNBOZzXCrCIPH8c0HmkCn9z3+jZjA/FzyuTo23XFjWNCchePbxxwj6uZMNGZRG
	FjHQ5JT1P4hMncCNlC+vLii2H/i28N1O9HZ23BDyf7kSNiUSxbD0S4OQDLVI41Kcey3eNL9QB0v
	Km8rEfusD3Fiu862kMDxCmWwKa14BhmyreA00NW8eZVmeDz5mVF/B5nTKWXjNw==
X-Google-Smtp-Source: AGHT+IGSoY6DTXHZdCGzW7B6A82lurvA8twdiEOcJq7108bwjigQWB9/CnfNiFNnV2PDUqTyIKthyQ==
X-Received: by 2002:a17:90b:2f8d:b0:2ee:48bf:7dc3 with SMTP id 98e67ed59e1d1-2febab7862fmr19657613a91.15.1740984949306;
        Sun, 02 Mar 2025 22:55:49 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:55:48 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 1/4] x86/ibt: factor out cfi and fineibt offset
Date: Mon,  3 Mar 2025 14:53:42 +0800
Message-Id: <20250303065345.229298-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303065345.229298-1-dongml2@chinatelecom.cn>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_225549_963279_6BB0848C 
X-CRM114-Status: GOOD (  18.02  )
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

For now, the layout of cfi and fineibt is hard coded, and the padding is
fixed on 16 bytes.

Factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET. CFI_INSN_OFFSET is
the offset of cfi, which is the same as FUNCTION_ALIGNMENT when
CALL_PADDING is enabled. And FINEIBT_INSN_OFFSET is the offset where we
put the fineibt preamble on, which is 16 for now.

When the FUNCTION_ALIGNMENT is bigger than 16, we place the fineibt
preamble on the last 16 bytes of the padding for better performance, which
means the fineibt preamble don't use the space that cfi uses.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 arch/x86/include/asm/cfi.h    | 12 ++++++++----
 arch/x86/kernel/alternative.c | 27 ++++++++++++++++++++-------
 arch/x86/net/bpf_jit_comp.c   | 22 +++++++++++-----------
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/cfi.h b/arch/x86/include/asm/cfi.h
index 31d19c815f99..ab51fa0ef6af 100644
--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -109,15 +109,19 @@ enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 extern u32 cfi_bpf_hash;
 extern u32 cfi_bpf_subprog_hash;
 
+#ifdef CONFIG_CALL_PADDING
+#define FINEIBT_INSN_OFFSET	16
+#define CFI_INSN_OFFSET		CONFIG_FUNCTION_ALIGNMENT
+#else
+#define CFI_INSN_OFFSET		5
+#endif
+
 static inline int cfi_get_offset(void)
 {
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
-		return 16;
 	case CFI_KCFI:
-		if (IS_ENABLED(CONFIG_CALL_PADDING))
-			return 16;
-		return 5;
+		return CFI_INSN_OFFSET;
 	default:
 		return 0;
 	}
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index c71b575bf229..ad050d09cb2b 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -908,7 +908,7 @@ void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end, struct mod
 
 		poison_endbr(addr, wr_addr, true);
 		if (IS_ENABLED(CONFIG_FINEIBT))
-			poison_cfi(addr - 16, wr_addr - 16);
+			poison_cfi(addr, wr_addr);
 	}
 }
 
@@ -974,12 +974,15 @@ u32 cfi_get_func_hash(void *func)
 {
 	u32 hash;
 
-	func -= cfi_get_offset();
 	switch (cfi_mode) {
+#ifdef CONFIG_FINEIBT
 	case CFI_FINEIBT:
+		func -= FINEIBT_INSN_OFFSET;
 		func += 7;
 		break;
+#endif
 	case CFI_KCFI:
+		func -= CFI_INSN_OFFSET;
 		func += 1;
 		break;
 	default:
@@ -1068,7 +1071,7 @@ early_param("cfi", cfi_parse_cmdline);
  *
  * caller:					caller:
  *	movl	$(-0x12345678),%r10d	 // 6	     movl   $0x12345678,%r10d	// 6
- *	addl	$-15(%r11),%r10d	 // 4	     sub    $16,%r11		// 4
+ *	addl	$-15(%r11),%r10d	 // 4	     sub    $FINEIBT_INSN_OFFSET,%r11 // 4
  *	je	1f			 // 2	     nop4			// 4
  *	ud2				 // 2
  * 1:	call	__x86_indirect_thunk_r11 // 5	     call   *%r11; nop2;	// 5
@@ -1092,10 +1095,14 @@ extern u8 fineibt_preamble_end[];
 #define fineibt_preamble_size (fineibt_preamble_end - fineibt_preamble_start)
 #define fineibt_preamble_hash 7
 
+#define ___OFFSET_STR(x)	#x
+#define __OFFSET_STR(x)		___OFFSET_STR(x)
+#define OFFSET_STR		__OFFSET_STR(FINEIBT_INSN_OFFSET)
+
 asm(	".pushsection .rodata			\n"
 	"fineibt_caller_start:			\n"
 	"	movl	$0x12345678, %r10d	\n"
-	"	sub	$16, %r11		\n"
+	"	sub	$"OFFSET_STR", %r11	\n"
 	ASM_NOP4
 	"fineibt_caller_end:			\n"
 	".popsection				\n"
@@ -1225,6 +1232,7 @@ static int cfi_rewrite_preamble(s32 *start, s32 *end, struct module *mod)
 			 addr, addr, 5, addr))
 			return -EINVAL;
 
+		wr_addr += (CFI_INSN_OFFSET - FINEIBT_INSN_OFFSET);
 		text_poke_early(wr_addr, fineibt_preamble_start, fineibt_preamble_size);
 		WARN_ON(*(u32 *)(wr_addr + fineibt_preamble_hash) != 0x12345678);
 		text_poke_early(wr_addr + fineibt_preamble_hash, &hash, 4);
@@ -1241,7 +1249,8 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end, struct module *mod)
 		void *addr = (void *)s + *s;
 		void *wr_addr = module_writable_address(mod, addr);
 
-		poison_endbr(addr + 16, wr_addr + 16, false);
+		poison_endbr(addr + CFI_INSN_OFFSET, wr_addr + CFI_INSN_OFFSET,
+			     false);
 	}
 }
 
@@ -1347,12 +1356,12 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_FINEIBT:
-		/* place the FineIBT preamble at func()-16 */
+		/* place the FineIBT preamble at func()-FINEIBT_INSN_OFFSET */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi, mod);
 		if (ret)
 			goto err;
 
-		/* rewrite the callers to target func()-16 */
+		/* rewrite the callers to target func()-FINEIBT_INSN_OFFSET */
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline, mod);
 		if (ret)
 			goto err;
@@ -1381,6 +1390,8 @@ static void poison_cfi(void *addr, void *wr_addr)
 {
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+		addr -= FINEIBT_INSN_OFFSET;
+		wr_addr -= FINEIBT_INSN_OFFSET;
 		/*
 		 * __cfi_\func:
 		 *	osp nopl (%rax)
@@ -1394,6 +1405,8 @@ static void poison_cfi(void *addr, void *wr_addr)
 		break;
 
 	case CFI_KCFI:
+		addr -= CFI_INSN_OFFSET;
+		wr_addr -= CFI_INSN_OFFSET;
 		/*
 		 * __cfi_\func:
 		 *	movl	$0, %eax
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index a43fc5af973d..e0ddb0fd28e2 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -414,6 +414,12 @@ static void emit_nops(u8 **pprog, int len)
 static void emit_fineibt(u8 **pprog, u32 hash)
 {
 	u8 *prog = *pprog;
+#ifdef CONFIG_CALL_PADDING
+	int i;
+
+	for (i = 0; i < CFI_INSN_OFFSET - 16; i++)
+		EMIT1(0x90);
+#endif
 
 	EMIT_ENDBR();
 	EMIT3_off32(0x41, 0x81, 0xea, hash);		/* subl $hash, %r10d	*/
@@ -428,20 +434,14 @@ static void emit_fineibt(u8 **pprog, u32 hash)
 static void emit_kcfi(u8 **pprog, u32 hash)
 {
 	u8 *prog = *pprog;
+#ifdef CONFIG_CALL_PADDING
+	int i;
+#endif
 
 	EMIT1_off32(0xb8, hash);			/* movl $hash, %eax	*/
 #ifdef CONFIG_CALL_PADDING
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
-	EMIT1(0x90);
+	for (i = 0; i < CFI_INSN_OFFSET - 5; i++)
+		EMIT1(0x90);
 #endif
 	EMIT_ENDBR();
 
-- 
2.39.5


