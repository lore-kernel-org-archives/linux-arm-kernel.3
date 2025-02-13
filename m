Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8E4C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=; b=IGPbK8KsOXdUVQCa1B9CQa/UkR
	SibVXPtDQzSYoNoliWyi1cknvT7aNKt/jYMkclj4qXAVJgpCgl2EnwKKzSal6veH2GoJMG7KLPoNb
	CSvOvmsg4wPqwBzzUyP9ZLzCiwT1riSaqaEJc2BKInAa/rix8fipMw3MyTed/UhLa3Ah96XqcBM06
	UkWaAUo3qze8XnnrqSkMD9oh0OKmr3XySlji4YqIeC4XnRQhUSyUU1mcrkJrZXfkdJDTSCJ/QAJMi
	j2xegn2QmVQBJzYFzE80xq9DEUNsusC+f/xLgm+6m+lZ1RinCV+LUSl37Hchl+fMbIW21homHRO54
	P7nx3+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIE-0000000BKwn-06Vi;
	Thu, 13 Feb 2025 14:34:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZlq-0000000BEqI-3nG9;
	Thu, 13 Feb 2025 14:00:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f7f03d856so15746845ad.1;
        Thu, 13 Feb 2025 06:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455248; x=1740060048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=a5V5D3L+PqWyB7x05KuFFOPxt1CeZuR/aZgeTElZwbZVkonzdMomKowUSAieH9z2+D
         AJkiGHO7Lyu/ygmo36eo+ksrM9P8IxVOwJ23A5lI+nbM8tI7ow+Xeaj0Q6mIIjHgcXSl
         AeVt21VKPOC9dnCR1tT3IqgM5BDosroiH4HPe7UDAo/fg4hQsKY4lq8wZ37cxsrYzf+U
         F4lYJSj0QJA5h/yjfLCx4Z2znaP68SCLMjd1rvaNn3qXNjFfcTrsGgZNpf7hHi+KkzIW
         +5AciM0bCwShIU0yUdd7QUWRQ6ke8u1Qx7QLoJXith0M7WZH0kTeDWvfbDIBzy/UUhsJ
         4AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455248; x=1740060048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=XS+rL/UOH3GH8p9qmXhLc6mTjw42PvAuDH+4bz26YoWM3jHeeJtdB/fvw2mkCAaxHJ
         v34ndiqqxXKa/PulMYXQH5/bRSLp5QVpmD5+LtEAKwsgprmpBNw1IGWoKJX0dR2xRIJo
         X/BroyZppe8imgeWR0dw8YIDtLY7c6YSDA73h30YPa4xbTgNR0vZla9DlAOwnHuFHLII
         EKPHIUYnHWYgZoHR50jxq7krsYZZn0jDCh/l8baq1p65flJuaZXBWBDOTGOv8ZfjSIcA
         NQfpuQuWVu1vq+jxdDyYUdwaozrgrJAkgnDxViXAVLtUMtjID/HIUqxxEPynJa/cMlx7
         oDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGB+//BdTd132FsaL96ZD23DFFquuWgd8kTKXpfd12/4399Xxqn8O7+r2S1lJZPU0nZpftTTKAs5EazUw=@lists.infradead.org, AJvYcCWpTd4z6i+9qNE1UnmzK7RBPafsuPtQ1kxAOQkJTUS/T6gRFdO96jJREj0P85DdRt/zFVATZZtHkUedk8iUkykX@lists.infradead.org
X-Gm-Message-State: AOJu0YwGebee9aV+9slYgjZ9eed+hNxJxUkLxep6YhFO2OAXMQWDtZ8s
	Nvq8gxs5x26rBtHwD0dDQKUnVEnMzVGUWsdh3ZNb1Ivqsr8g8biE
X-Gm-Gg: ASbGncviouLYfqxvHyhPqvMRjf/Gddkfz2Om1WyR4gcLXYXPbyt4TPgsPN+uy9TgL5t
	ikXiUMkyyqydsxoQ6ypBveoJ1eNFBhayVcnTj1IDgQxjEBQtQ5nCs+jdX25Qmrxdg+WPXwcvx2u
	pxYHJ3lncmzynVYNOAIE+aM0YMTOpcXfThCSMBTqIeO9ryMBgfbLnoT0hHgaIi6ehj/ICTcdfQ6
	+qFcoll8srre1QXchiclohqhUNfjTjBtBp43Ds0uK26UMdIEAsl0nz8fU3VpXwvCHRI587195Lc
	xpxx5GAJKX/IM3CuKHgzATY1bODOkbZrHIEieznlhdHjPVZ5cpZSbSDG3fJJK2YUIbE=
X-Google-Smtp-Source: AGHT+IFTuUUy1Wq3iWeeuJp7RF8h8HqcmzEsROtZ3HzF4SlUho3mcp66MzG3aF4wwbARFTyZlT5eFg==
X-Received: by 2002:a17:902:d58c:b0:20c:6399:d637 with SMTP id d9443c01a7336-220d2132be5mr57272645ad.40.1739455248450;
        Thu, 13 Feb 2025 06:00:48 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:48 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v3 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:55 +0900
Message-ID: <20250213135759.190006-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_060050_941853_0F536E91 
X-CRM114-Status: GOOD (  10.33  )
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

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index e85ac0c7c039..61570ec9464c 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -28,45 +28,42 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+# define __BUG_REL(val)	".long " val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+# define __BUG_REL(val)	".long " val " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_ENTRY(file, line, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+	"\t.word " line        "\t# bug_entry::line\n"			\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#else
+#define __BUG_ENTRY(file, ine, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#endif
+
+#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+	"1:\t" ins "\n"							\
+	".pushsection __bug_table,\"aw\"\n"				\
+	__BUG_ENTRY(file, line, flags)					\
+	"\t.org 2b + " size "\n"					\
+	".popsection\n"							\
+	extra
 
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
+	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+					   "%c1", "%c2", "%c3", extra)	\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
-
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
-
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
+#define ARCH_WARN_ASM(file, line, flags, size)				\
+	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
 
 #else
 
@@ -88,11 +85,14 @@ do {								\
  * were to trigger, we'd rather wreck the machine in an attempt to get the
  * message out than not know about it.
  */
+
+#define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(1b)
+
 #define __WARN_FLAGS(flags)					\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	_BUG_FLAGS(ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.43.0


