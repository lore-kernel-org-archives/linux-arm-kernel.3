Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B031C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0whn35vPm8J+vjBTbfA5u1AHwSTrw7swcARc6I++Hc=; b=x2b2XoQS/sSMcITlQ+2KBCsM71
	RyuG4QI01yBksIGZmPVR50w7960f9imXQ/5/y6u+5ooon12OaV7kBtNVC6I+KJfpQ/IHaGrmjE4gz
	pUFrp4MyaskvS05v78sclejdmAXplqw0o1nRMMTB8QP8/OgDwAYh3bGX7ja6fRxbabsPT56EZ0F17
	pjXSkRcVEjKAPdl8B3gocGh/qSRdcXbxMMW6rpu0k9eCfiH/VqevERHVaJo/0txUqW8EYUMk/uvqh
	S9CAzQlOsgCnBkHixZEYGKzQm02GjZUS6UnxwYCAxpfLivMoxVzNvubOOMyeMk7ffLRdqjpk39irU
	FQZ101mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6IN-00000000zzG-0aNS;
	Mon, 03 Mar 2025 13:57:23 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5sj-00000000vUy-13DR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:30:54 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2232b12cd36so58594285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741008653; x=1741613453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0whn35vPm8J+vjBTbfA5u1AHwSTrw7swcARc6I++Hc=;
        b=ezIBxddQV/PXltfPFFd1cNrOfpnGY6zdeIIaqrNA655DG0EZz8PTR7OQ5Usgm2HnKX
         3lCOQFjvkOHamBLFP6O1syJCpmPtKDrYvAsEWb6MQPUtbCVrHMdMCyvnd07m+ejEesGl
         B+z8O16jgo9jVvzAIsVz78ic/ZiZhCEFUNUmRAwnEMFrVBekKiNV8tsfeJXoY4ggo7Pr
         DoY3FyfCnFeAdySnCI/SvDFJgJNVZfztjMiMIlCbfVV68t1X50JPDu/fBNvuU4H3q2KL
         XuSfk496XDTrpEEUPGVsm5HKu2bSI/AG03yn1U7o1iOh8iOLRa+PVoLVNuo/7OqzBEd1
         vG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008653; x=1741613453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0whn35vPm8J+vjBTbfA5u1AHwSTrw7swcARc6I++Hc=;
        b=KHysmFwjxRxeinRw3wW1CJ7TsZaosXMcgTu2kklnArzNv3RRER75ZXhXGhaaXzTdLS
         TzttdNQpLaNt7fxafp5idsNi2me8W8xVQGFBjEqMUPdaXw0zHyxGJOqXfs/Aolpe9t8l
         Vi1P9QOPfz61BKOP6QEw15/HQNFHzzZpBoWWGv9MAOXLbhWAaLHFbvVdjynA4geJ55f7
         FeTbod6dTd1mBLUx+zYXPf62dCaNV+F4cE9s4TUpAqA2RoE0UB/Kw4rOm1kYDQXqLeOm
         1bjg0VZfcGnB+snVLFatgwVig4QttRmiA5kBbJoNQer9qrWqbDB1PMLrNuD5swmoXKe3
         GzYw==
X-Forwarded-Encrypted: i=1; AJvYcCUQxD/rL8bgBtyQ8FukYDW4xr93QpQMJ9zgGS5LIybvzwf/pGrxLhCIO21jK1eyTRTyuZ2HfyV8BqZ0qWwMYttE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9LSjr65jsa7wTuPa6EQaR1r9xchE8jYZ3cHpvSCfrxDeM7iQx
	IQGN6hI/fDRKYuPbjxMkWU494PD8KIixhTLwhezYnRJdUHNSOUW2
X-Gm-Gg: ASbGncux6jWcLTFxDU5vVoOk/Uqyzfs1dAexjTdNVYXjLOfhweAfdLo7q5zkOud3cGz
	uOcirb+F7y9vtPf65D0FojASWygYqMWlBRDU9EN1/7Vi4YzKHqBrvslcX4M7rbJWvJZSewa7Owo
	xv5A+cWvWCLpkX6xrJXrAV6CMf96WPyDiemwxZNhnAXOXy2CXrTIfgSPtZv8KD2z9chtJnn1jWo
	1R31ehMTGV3brEKSflnnFwzEzcUU9NDIpqT0NcxtdMkpypNUqyW9kH67y74WMlIktdWCjeCpIEw
	+aMQoiapElS4PAWcSG9UOw512kfzB9wIexzFpvj92vQ9i/cOQxRZNcu3jyQIzA==
X-Google-Smtp-Source: AGHT+IECVEaRvzz7jFgM9Xs6Qsz7AN1fGJ1Lrd2ZRMORcgHaHlhwWOyshFl83O3butQP+uNtOa6yXg==
X-Received: by 2002:a17:902:e5c5:b0:223:4bd6:3863 with SMTP id d9443c01a7336-22368f6a174mr217254605ad.10.1741008652539;
        Mon, 03 Mar 2025 05:30:52 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505359b8sm77297035ad.253.2025.03.03.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:52 -0800 (PST)
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
Subject: [PATCH v4 3/4] x86: implement per-function metadata storage for x86
Date: Mon,  3 Mar 2025 21:28:36 +0800
Message-Id: <20250303132837.498938-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303132837.498938-1-dongml2@chinatelecom.cn>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_053053_288430_EC85227F 
X-CRM114-Status: GOOD (  22.09  )
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

With CONFIG_CALL_PADDING enabled, there will be 16-bytes padding space
before all the kernel functions. And some kernel features can use it,
such as MITIGATION_CALL_DEPTH_TRACKING, CFI_CLANG, FINEIBT, etc.

In my research, MITIGATION_CALL_DEPTH_TRACKING will consume the tail
9-bytes in the function padding, CFI_CLANG will consume the head 5-bytes,
and FINEIBT will consume all the 16 bytes if it is enabled. So there will
be no space for us if MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are
both enabled, or FINEIBT is enabled.

In x86, we need 5-bytes to prepend a "mov %eax xxx" insn, which can hold
a 4-bytes index. So we have following logic:

1. use the head 5-bytes if CFI_CLANG is not enabled
2. use the tail 5-bytes if MITIGATION_CALL_DEPTH_TRACKING and FINEIBT are
   not enabled
3. compile the kernel with FUNCTION_ALIGNMENT_32B otherwise

In the third case, we make the kernel function 32 bytes aligned, and there
will be 32 bytes padding before the functions. According to my testing,
the text size didn't increase on this case, which is weird.

With 16-bytes padding:

-rwxr-xr-x 1 401190688  x86-dev/vmlinux*
-rw-r--r-- 1    251068  x86-dev/vmlinux.a
-rw-r--r-- 1 851892992  x86-dev/vmlinux.o
-rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage

With 32-bytes padding:

-rwxr-xr-x 1 401318128 x86-dev/vmlinux*
-rw-r--r-- 1    251154 x86-dev/vmlinux.a
-rw-r--r-- 1 853636704 x86-dev/vmlinux.o
-rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage

The way I tested should be right, and this is a good news for us. On the
third case, the layout of the padding space will be like this if fineibt
is enabled:

__cfi_func:
	mov	--	5	-- cfi, not used anymore
	nop
	nop
	nop
	mov	--	5	-- function metadata
	nop
	nop
	nop
	fineibt	--	16	-- fineibt
func:
	nopw	--	4
	......

I tested the fineibt with "cfi=fineibt" cmdline, and it works well
together with FUNCTION_METADATA enabled. And I also tested the
performance of this function by setting metadata for all the kernel
function, and it consumes 0.7s for 70k+ functions, not bad :/

I can't find a machine that support IBT, so I didn't test the IBT. I'd
appreciate it if someone can do this testing for me :/

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v3:
- select FUNCTION_ALIGNMENT_32B on case3, instead of extra 5-bytes
---
 arch/x86/Kconfig              | 18 ++++++++++++
 arch/x86/include/asm/ftrace.h | 54 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5c277261507e..b0614188c80b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2518,6 +2518,24 @@ config PREFIX_SYMBOLS
 	def_bool y
 	depends on CALL_PADDING && !CFI_CLANG
 
+config FUNCTION_METADATA
+	bool "Per-function metadata storage support"
+	default y
+	depends on CC_HAS_ENTRY_PADDING && OBJTOOL
+	select CALL_PADDING
+	select FUNCTION_ALIGNMENT_32B if ((CFI_CLANG && CALL_THUNKS) || FINEIBT)
+	help
+	  Support per-function metadata storage for kernel functions, and
+	  get the metadata of the function by its address with almost no
+	  overhead.
+
+	  The index of the metadata will be stored in the function padding
+	  and consumes 5-bytes. FUNCTION_ALIGNMENT_32B will be selected if
+	  "(CFI_CLANG && CALL_THUNKS) || FINEIBT" to make sure there is
+	  enough available padding space for this function. However, it
+	  seems that the text size almost don't change, compare with
+	  FUNCTION_ALIGNMENT_16B.
+
 menuconfig CPU_MITIGATIONS
 	bool "Mitigations for CPU vulnerabilities"
 	default y
diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index f2265246249a..700bb729e949 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -4,6 +4,28 @@
 
 #include <asm/ptrace.h>
 
+#ifdef CONFIG_FUNCTION_METADATA
+#if (defined(CONFIG_CFI_CLANG) && defined(CONFIG_CALL_THUNKS)) || (defined(CONFIG_FINEIBT))
+  /* the CONFIG_FUNCTION_PADDING_BYTES is 32 in this case, use the
+   * range: [align + 8, align + 13].
+   */
+  #define KFUNC_MD_INSN_OFFSET		(CONFIG_FUNCTION_PADDING_BYTES - 8)
+  #define KFUNC_MD_DATA_OFFSET		(CONFIG_FUNCTION_PADDING_BYTES - 9)
+#else
+  #ifdef CONFIG_CFI_CLANG
+    /* use the space that CALL_THUNKS suppose to use */
+    #define KFUNC_MD_INSN_OFFSET	(5)
+    #define KFUNC_MD_DATA_OFFSET	(4)
+  #else
+    /* use the space that CFI_CLANG suppose to use */
+    #define KFUNC_MD_INSN_OFFSET	(CONFIG_FUNCTION_PADDING_BYTES)
+    #define KFUNC_MD_DATA_OFFSET	(CONFIG_FUNCTION_PADDING_BYTES - 1)
+  #endif
+#endif
+
+#define KFUNC_MD_INSN_SIZE		(5)
+#endif
+
 #ifdef CONFIG_FUNCTION_TRACER
 #ifndef CC_USING_FENTRY
 # error Compiler does not support fentry?
@@ -156,4 +178,36 @@ static inline bool arch_trace_is_compat_syscall(struct pt_regs *regs)
 #endif /* !COMPILE_OFFSETS */
 #endif /* !__ASSEMBLY__ */
 
+#if !defined(__ASSEMBLY__) && defined(CONFIG_FUNCTION_METADATA)
+#include <asm/text-patching.h>
+
+static inline bool kfunc_md_arch_exist(void *ip)
+{
+	return *(u8 *)(ip - KFUNC_MD_INSN_OFFSET) == 0xB8;
+}
+
+static inline void kfunc_md_arch_pretend(u8 *insn, u32 index)
+{
+	*insn = 0xB8;
+	*(u32 *)(insn + 1) = index;
+}
+
+static inline void kfunc_md_arch_nops(u8 *insn)
+{
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+}
+
+static inline int kfunc_md_arch_poke(void *ip, u8 *insn)
+{
+	text_poke(ip, insn, KFUNC_MD_INSN_SIZE);
+	text_poke_sync();
+	return 0;
+}
+
+#endif
+
 #endif /* _ASM_X86_FTRACE_H */
-- 
2.39.5


