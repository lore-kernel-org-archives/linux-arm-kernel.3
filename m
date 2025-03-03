Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F2C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HoYAW6D8hO+aaE9DpE+f5d9KWUfqlQeSUmUL0RBP80=; b=REPzTldH7D71G/MT1vhR7husYS
	QjyWsVuLsMTTASebDUr/zK6LQiQqogIlKAX11khrnY8oHUfNESFWy/b8160PZd6oIbIqGu94FVXPE
	zYuz0eQXm7WwkG9yzqJH2wCxox8xtgrlr/D01wwDhQdLhzUnQxB8t3RqO5TF4uVqasRs0c7tIsM2y
	FzZY/kwuddFgV/CDFL3acqvkLwAv/JjqW6sNjYReQI9jlTQ1OsJsyEkdK4VVThM7MGO6G1F4itHvT
	gFPpqqdZ76lxrJsfgRzj1tVZeCtRNIBtRSPJzKZWB36XtekIlnWXfWPm4kDbET9kxtTdg5X+sfNGu
	RryvbeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6FI-00000000zZq-2vKB;
	Mon, 03 Mar 2025 13:54:12 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5sT-00000000vOk-22I8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:30:38 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-22355618fd9so73288295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741008637; x=1741613437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HoYAW6D8hO+aaE9DpE+f5d9KWUfqlQeSUmUL0RBP80=;
        b=aqNQlIUGF6DRP1lR7Ga6nRQpRXO9dMLzLlT1Fqi0zBbmknp8DwFTf65i74W08HRLju
         +IhISh4SnngRneRWLXpga91OsSWnY/xsEWGHMDzyYYemqq8d35bDvUH8rJzVyBBlMVyV
         0y5YhohYofrxlx5uXuiVj2n2xISTtbsEjzE++IP/dDhE2eIaAo4+/rpsnuM2b1OMOr2/
         rimzmGwU7DVIzWz90sFED9b4mlcPr/CuGnO5eDka3lJZn5ma7yL6chgD9LYuuzys1YR1
         axDsXMAeGmHd5m6xnQH2NOPOKsWOh6JRqlfRKomYZz2A7Lw3tXegHJklK+mplUiDHuFF
         IZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008637; x=1741613437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HoYAW6D8hO+aaE9DpE+f5d9KWUfqlQeSUmUL0RBP80=;
        b=teraFGxNKKHkSL4xl8EAEwBgR1A6cSe/Um9gQe2rJ4wmGiyguokHNUEh/gTYZT7lyf
         zwn7VVnkj85tdArC/DG8XP30EvUK2Tt6Ty9g+HErsTDSyGZVOLRAeaAkLjq68bPdhigx
         mVFwKHar8oj5Bwt/11G3kyyBmiq73FL877YjYDNYmPnVmePteJKzi9+jPyIIp51CasZ3
         rSfMd58BBy4V3YQCsCgcjq1ZHZCBUhY3TQBefkd+ZH4qXQhUEzgJ1hExaCp/QzKDLHvj
         9YjcUUPgoLp36vLtxqXeaRYUZFqjVZT5mYDTMqq4qtJ4OFkYOUi2q4ykRMJlWcTTwKUi
         dV9g==
X-Forwarded-Encrypted: i=1; AJvYcCU4B0IjJdfogMzN5vX44eAJj39NoaLpRYbX+E+Mtklg/zvXFNWWNyItPle2QBVweECNb29L4NdVOm/FzD4IFFSy@lists.infradead.org
X-Gm-Message-State: AOJu0YwbdRRFwZxfKX5tYgPgxMEmOWMbE3R/xHaXbSPAod8YX1tvi4t7
	TBKwL68hS7kV8sHI0A7SOLYhciOcsN8qbRAsPYpQY6M7p/cb3/W1
X-Gm-Gg: ASbGnctJg1poifmRUDUA0U/jWZPO8UphmT7WkOIdZa/59mpcj4RlGLhksONdH5qVOXk
	75gZGjbr0XSKX+b2fmeJPAAU3phFu26HVGcNf+NIw0J5djlbE6vf7G4xDmCrJW0lF4fTZ2iyEqp
	t1dmOHJOP9p2ZiN0Wd4ZxS6qIgC4Ov9hyoRsZXiUZYIFidksK3b1pVrPtZNRGRzb02NhdHQBvff
	jay1dtzgWqevkrNSjGkORq+6Sirz3gawENvSvXFVftPIRwrQtjHd2PtGBW2vNZoYuCjDkUcHdMI
	Wv230p6m37Z/wkpC3eD/PbZ63NDXzguvHe4n47M0RpLU+cucl2fmdPCPhy9Ixg==
X-Google-Smtp-Source: AGHT+IGA2mWJTfvekJWlfyFWg7JZnBJRMEmVPtYCpiX/IyOQcjy5rGPgwuYYTPg+xM28+Vd56S613A==
X-Received: by 2002:a17:903:230c:b0:223:7006:4db2 with SMTP id d9443c01a7336-22370064ea3mr156649035ad.31.1741008636600;
        Mon, 03 Mar 2025 05:30:36 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505359b8sm77297035ad.253.2025.03.03.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:36 -0800 (PST)
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
Subject: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
Date: Mon,  3 Mar 2025 21:28:34 +0800
Message-Id: <20250303132837.498938-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303132837.498938-1-dongml2@chinatelecom.cn>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_053037_532931_0549AE18 
X-CRM114-Status: GOOD (  20.99  )
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

The FINEIBT_INSN_OFFSET is not used in fineibt_caller_start and
fineibt_paranoid_start, as it is always "0x10". Note that we need to
update the offset in fineibt_caller_start and fineibt_paranoid_start if
FINEIBT_INSN_OFFSET changes.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v4:
- rebase to the newest tip/x86/core, the fineibt has some updating
---
 arch/x86/include/asm/cfi.h    | 13 +++++++++----
 arch/x86/kernel/alternative.c | 18 +++++++++++-------
 arch/x86/net/bpf_jit_comp.c   | 22 +++++++++++-----------
 3 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/cfi.h b/arch/x86/include/asm/cfi.h
index 2f6a01f098b5..04525f2f6bf2 100644
--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -108,6 +108,14 @@ extern bhi_thunk __bhi_args_end[];
 
 struct pt_regs;
 
+#ifdef CONFIG_CALL_PADDING
+#define FINEIBT_INSN_OFFSET	16
+#define CFI_INSN_OFFSET		CONFIG_FUNCTION_ALIGNMENT
+#else
+#define FINEIBT_INSN_OFFSET	0
+#define CFI_INSN_OFFSET		5
+#endif
+
 #ifdef CONFIG_CFI_CLANG
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
@@ -118,11 +126,8 @@ static inline int cfi_get_offset(void)
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
index 32e4b801db99..0088d2313f33 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -917,7 +917,7 @@ void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end)
 
 		poison_endbr(addr);
 		if (IS_ENABLED(CONFIG_FINEIBT))
-			poison_cfi(addr - 16);
+			poison_cfi(addr);
 	}
 }
 
@@ -980,12 +980,13 @@ u32 cfi_get_func_hash(void *func)
 {
 	u32 hash;
 
-	func -= cfi_get_offset();
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+		func -= FINEIBT_INSN_OFFSET;
 		func += 7;
 		break;
 	case CFI_KCFI:
+		func -= CFI_INSN_OFFSET;
 		func += 1;
 		break;
 	default:
@@ -1372,7 +1373,7 @@ static int cfi_rewrite_preamble(s32 *start, s32 *end)
 		 * have determined there are no indirect calls to it and we
 		 * don't need no CFI either.
 		 */
-		if (!is_endbr(addr + 16))
+		if (!is_endbr(addr + CFI_INSN_OFFSET))
 			continue;
 
 		hash = decode_preamble_hash(addr, &arity);
@@ -1380,6 +1381,7 @@ static int cfi_rewrite_preamble(s32 *start, s32 *end)
 			 addr, addr, 5, addr))
 			return -EINVAL;
 
+		addr += (CFI_INSN_OFFSET - FINEIBT_INSN_OFFSET);
 		text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
 		WARN_ON(*(u32 *)(addr + fineibt_preamble_hash) != 0x12345678);
 		text_poke_early(addr + fineibt_preamble_hash, &hash, 4);
@@ -1402,10 +1404,10 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end)
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
 
-		if (!exact_endbr(addr + 16))
+		if (!exact_endbr(addr + CFI_INSN_OFFSET))
 			continue;
 
-		poison_endbr(addr + 16);
+		poison_endbr(addr + CFI_INSN_OFFSET);
 	}
 }
 
@@ -1543,12 +1545,12 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_FINEIBT:
-		/* place the FineIBT preamble at func()-16 */
+		/* place the FineIBT preamble at func()-FINEIBT_INSN_OFFSET */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
-		/* rewrite the callers to target func()-16 */
+		/* rewrite the callers to target func()-FINEIBT_INSN_OFFSET */
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
@@ -1588,6 +1590,7 @@ static void poison_cfi(void *addr)
 	 */
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+		addr -= FINEIBT_INSN_OFFSET;
 		/*
 		 * FineIBT prefix should start with an ENDBR.
 		 */
@@ -1607,6 +1610,7 @@ static void poison_cfi(void *addr)
 		break;
 
 	case CFI_KCFI:
+		addr -= CFI_INSN_OFFSET;
 		/*
 		 * kCFI prefix should start with a valid hash.
 		 */
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 72776dcb75aa..ee86a5df5ffb 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -415,6 +415,12 @@ static int emit_call(u8 **prog, void *func, void *ip);
 static void emit_fineibt(u8 **pprog, u8 *ip, u32 hash, int arity)
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
@@ -432,20 +438,14 @@ static void emit_fineibt(u8 **pprog, u8 *ip, u32 hash, int arity)
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


