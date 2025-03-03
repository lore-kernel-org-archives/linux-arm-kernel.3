Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792AAC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 07:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvSQXTXm2WJtvrSSulKAAYVeipdazZIwWA04KeDmP3s=; b=nkshV42Uob/UB0olBcwJcafyuo
	GaF4p9AsZ0m0YLueBTnHYAFlPv4wN8KUSZy42Vubd9GDkymoo5TV4ykgNWggaMYRjVdbuiBbVZ2Il
	zDH/SGZj4EGydIHzObvvhBL9VGUYhGjgktcnZ9mdFguchSaYQVj7Mt3z2osr9bTjELiepzvAlL11b
	KMOoOjYzjItj07Er4O95DsMSruygdo9ClPrdJXc/bwyv98uWU8kRxZPhZW6xAsYy+nA3J3NT0b9X6
	MxMJA6ercvw0d2xHWMdQgz6G9ky4Zad48QyT70HVg4qpQqe4+5wxME6geWRQ/WcQlNJxTB6Xh3e+D
	W5J5++9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozpy-0000000HNVE-24Gl;
	Mon, 03 Mar 2025 07:03:38 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tozin-0000000HMbe-0Fla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 06:56:14 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-223378e2b0dso56856875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 22:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984972; x=1741589772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvSQXTXm2WJtvrSSulKAAYVeipdazZIwWA04KeDmP3s=;
        b=fZuj9fA7a54RY+Dersq984gxMMlM5c2IBIa+J3C6o8asWXM4mI248G/1nj942+wFfi
         5LCW3RLylrsTPD1DL3EVn+ZlAUlIsF7wuHxKDxCZcZ0ikWB2pDUPDdOfXLpQlb61p9rK
         TcwdIAPV7+xEW0FVALf/1ACeJyxtIjp2FZoXL1Klh585FblPoe0jsZXivLivKYCsUQD8
         zHlk0ChNFTZ8ai3cf183moIQW7aExOjfW/5t9iE01s2TeyK7ipYjxX76lo2IIeB6cq1D
         XtkFFVR76lNI4rgHI7LWFZmNVRe6GJbdpc2iZ8HknLBh/8Sm0D++38e2LXm57Lqooq2D
         78ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984972; x=1741589772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvSQXTXm2WJtvrSSulKAAYVeipdazZIwWA04KeDmP3s=;
        b=nal6TQLhO3F84SX+4NuSS4zHGRBdl6Jl10h4awFsfZwdpgmoK3RfgCM6B9vzixBFzV
         hKWNBy0Kk0Y1ZLWCGvIXUdxzkDRCpmTgAX0elZoM6WulbTuLpHRp9HpZo9nMT3UJjdNm
         Nke00W5EUhugxiVFL14HwlcZ41bX+97y1M6i8dZv+5AmGfSeUlIUAtkTcitqNbhjjsc4
         bJKCnX0BlcOC5nMIYJaKGZvnB+oUTV3NXXNr/qT+SQDBzNzAbx1glb2LwyFhYzeHe8Gv
         SJpoPTr/6X075X1moNZmvAl8rFjv1pNsH0IwppwTMOQs5tbtU3T1sUhPsYp7Zya4y2F9
         tRsA==
X-Forwarded-Encrypted: i=1; AJvYcCUN8joVFb5G7XrCJGtqHzGOG+J2BgTEBiAe91SHNjIveRgS3Owdo9nmSr090yIHro6IzT1eX874mk38ZhIg61ys@lists.infradead.org
X-Gm-Message-State: AOJu0YxTSxTbSHmrwcfS5wXr/dQ6TkEJO64MQyEU03gfoCTed+Ch+tWI
	Yg7yEZ+yJm6Va7PKsrOUzBHYYd6Js++TsdmQysgUQfnpZd2Q8hGi
X-Gm-Gg: ASbGnct6ks/OnzEABYyaE9SPjau442WwgVyTyY5Q3QWx+WZGWFhWrPVvSWwrrZWgrPK
	y8T5Ev21ZdL530bvLGe72bjPYBUQwNXAHE+xxhXJpO9TzX4SAWwOj+OaJuALGy3Zcmg55Lc1FBL
	XsSBIDBHUBE/ernz/9DPTcFVyCOQN2eEd21UUbImOQMsXA3kB03K/GAMVKjmtXHOIpj33VG29q8
	9z1g9fdxOJrJ1/ryWfQqOpSWOqMFxCN0Rk5saUwJOCQRSErNMB0Z90JC5TS/DzS3O4vImBJiNtA
	EmY24rykS4ogW+m9/y8se0npAvd5cmw6n96XLDVxpmo4sHp0Sp08K1Ve5gkQvA==
X-Google-Smtp-Source: AGHT+IHD7TOQHXPnvhY3fUJExGRRx5jR57Vtr+fKvMEWMLLg1ZWvH9nc0mv2BX9j9PlmWnQhBjDbsg==
X-Received: by 2002:a17:903:3b83:b0:21f:6c3:aefb with SMTP id d9443c01a7336-2236920c418mr195671705ad.35.1740984972122;
        Sun, 02 Mar 2025 22:56:12 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:56:11 -0800 (PST)
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
Subject: [PATCH bpf-next v3 4/4] arm64: implement per-function metadata storage for arm64
Date: Mon,  3 Mar 2025 14:53:45 +0800
Message-Id: <20250303065345.229298-5-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303065345.229298-1-dongml2@chinatelecom.cn>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_225613_101524_924A472E 
X-CRM114-Status: GOOD (  21.55  )
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

The per-function metadata storage is already used by ftrace if
CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointer
of the callback directly to the function padding, which consume 8-bytes,
in the commit
baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
So we can directly store the index to the function padding too, without
a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
function is 8-bytes aligned, and we will compile the kernel with extra
8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
aligned, and only extra 4-bytes (1 NOPS) is needed.

However, we have the same problem with Mark in the commit above: we can't
use the function padding together with CFI_CLANG, which can make the clang
compiles a wrong offset to the pre-function type hash. He said that he was
working with others on this problem 2 years ago. Hi Mark, is there any
progress on this problem?

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 arch/arm64/Kconfig              | 15 +++++++++++++++
 arch/arm64/Makefile             | 23 ++++++++++++++++++++--
 arch/arm64/include/asm/ftrace.h | 34 +++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ftrace.c      | 13 +++++++++++--
 4 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..7ed80f5eb267 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1536,6 +1536,21 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config FUNCTION_METADATA
+	bool "Per-function metadata storage support"
+	default y
+	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE if !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
+	depends on !CFI_CLANG
+	help
+	  Support per-function metadata storage for kernel functions, and
+	  get the metadata of the function by its address with almost no
+	  overhead.
+
+	  The index of the metadata will be stored in the function padding,
+	  which will consume 4-bytes. If FUNCTION_ALIGNMENT_8B is enabled,
+	  extra 8-bytes function padding will be reserved during compiling.
+	  Otherwise, only extra 4-bytes function padding is needed.
+
 source "kernel/Kconfig.hz"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2b25d671365f..2df2b0f4dd90 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -144,12 +144,31 @@ endif
 
 CHECKFLAGS	+= -D__aarch64__
 
+ifeq ($(CONFIG_FUNCTION_METADATA),y)
+  ifeq ($(CONFIG_FUNCTION_ALIGNMENT_8B),y)
+  __padding_nops := 2
+  else
+  __padding_nops := 1
+  endif
+else
+  __padding_nops := 0
+endif
+
 ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
+  __padding_nops  := $(shell echo $(__padding_nops) + 2 | bc)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-  CC_FLAGS_FTRACE := -fpatchable-function-entry=4,2
+  CC_FLAGS_FTRACE := -fpatchable-function-entry=$(shell echo $(__padding_nops) + 2 | bc),$(__padding_nops)
 else ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_ARGS),y)
+  CC_FLAGS_FTRACE := -fpatchable-function-entry=$(shell echo $(__padding_nops) + 2 | bc),$(__padding_nops)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-  CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+else ifeq ($(CONFIG_FUNCTION_METADATA),y)
+  CC_FLAGS_FTRACE += -fpatchable-function-entry=$(__padding_nops),$(__padding_nops)
+  ifneq ($(CONFIG_FUNCTION_TRACER),y)
+    KBUILD_CFLAGS += $(CC_FLAGS_FTRACE)
+    # some file need to remove this cflag when CONFIG_FUNCTION_TRACER
+    # is not enabled, so we need to export it here
+    export CC_FLAGS_FTRACE
+  endif
 endif
 
 ifeq ($(CONFIG_KASAN_SW_TAGS), y)
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index bfe3ce9df197..aa3eaa91bf82 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -24,6 +24,16 @@
 #define FTRACE_PLT_IDX		0
 #define NR_FTRACE_PLTS		1
 
+#ifdef CONFIG_FUNCTION_METADATA
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+#define KFUNC_MD_DATA_OFFSET	(AARCH64_INSN_SIZE * 3)
+#else
+#define KFUNC_MD_DATA_OFFSET	AARCH64_INSN_SIZE
+#endif
+#define KFUNC_MD_INSN_SIZE	AARCH64_INSN_SIZE
+#define KFUNC_MD_INSN_OFFSET	KFUNC_MD_DATA_OFFSET
+#endif
+
 /*
  * Currently, gcc tends to save the link register after the local variables
  * on the stack. This causes the max stack tracer to report the function
@@ -216,6 +226,30 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
 	 */
 	return !strcmp(sym + 8, name);
 }
+
+#ifdef CONFIG_FUNCTION_METADATA
+#include <asm/text-patching.h>
+
+static inline bool kfunc_md_arch_exist(void *ip)
+{
+	return !aarch64_insn_is_nop(*(u32 *)(ip - KFUNC_MD_INSN_OFFSET));
+}
+
+static inline void kfunc_md_arch_pretend(u8 *insn, u32 index)
+{
+	*(u32 *)insn = index;
+}
+
+static inline void kfunc_md_arch_nops(u8 *insn)
+{
+	*(u32 *)insn = aarch64_insn_gen_nop();
+}
+
+static inline int kfunc_md_arch_poke(void *ip, u8 *insn)
+{
+	return aarch64_insn_patch_text_nosync(ip, *(u32 *)insn);
+}
+#endif
 #endif /* ifndef __ASSEMBLY__ */
 
 #ifndef __ASSEMBLY__
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index d7c0d023dfe5..4191ff0037f5 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -88,8 +88,10 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 	 * to `BL <caller>`, which is at `addr + 4` bytes in either case.
 	 *
 	 */
-	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
-		return addr + AARCH64_INSN_SIZE;
+	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS)) {
+		addr += AARCH64_INSN_SIZE;
+		goto out;
+	}
 
 	/*
 	 * When using patchable-function-entry with pre-function NOPs, addr is
@@ -139,6 +141,13 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 
 	/* Skip the first NOP after function entry */
 	addr += AARCH64_INSN_SIZE;
+out:
+	if (IS_ENABLED(CONFIG_FUNCTION_METADATA)) {
+		if (IS_ENABLED(CONFIG_FUNCTION_ALIGNMENT_8B))
+			addr += 2 * AARCH64_INSN_SIZE;
+		else
+			addr += AARCH64_INSN_SIZE;
+	}
 
 	return addr;
 }
-- 
2.39.5


