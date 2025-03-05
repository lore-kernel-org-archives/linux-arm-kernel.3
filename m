Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F33C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=; b=5A0CQSVsmXer/S4+Qus8gA0cbU
	FHLIBkFRrNo/CMNIF4PeD1yGAv0uxfnFEEL2JNN3+pkWZ/7tfMAYcxJS63X0LT0voY2dVyhIA6Z4x
	/fY/4qRJMKnnQUEHZgy9UdJwdDMu+uvlFgnlKm/oKwqpJVDZLOUy4Xk2/CagIzq41aG5sw9G1nW+I
	9oVBg4ErmhweqcTjdJF1eGCW/52E3dezV6AmGPQVH+ktrRJMwgdcffkFH/w9izhSPQnHjZpWR3hTB
	+yrRSjsNBAG6eUCl8+Tqz0xFswiyTOSAbEjHPhSDckZlUwTGi4MmgGLwCeRL8LT/2Q/blQMyJNTnu
	wgLFmVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnSV-00000007wMz-2ehq;
	Wed, 05 Mar 2025 12:02:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmdi-00000007oO7-3ayY;
	Wed, 05 Mar 2025 11:10:16 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fe8c35b6cbso10575633a91.3;
        Wed, 05 Mar 2025 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173014; x=1741777814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=k1KU+WNHW3r5m9zw5bMJ0Nc44+AtNAbYdMdsjpgh6MJwsDv40I2qG/EVu5UJka988c
         yvm8oQwOXyKuwfQHlDWpiNioiC/+L/TeM52diBuXBJaTkiFiLxoDNf9DgJPhTVhNZsBs
         a3jRfIUt1RdlSG0yYRgb3L/QTftG75cRlfjyuTNTzqzNvZlSmNZY+mzRT5nbiHPN3erT
         xhHAX7MTY+G2snFg16RbKR4wOXN1wHLv0Ll1KNqy8AXrM7FxNZ6QZBqfTUJyc+ZQr9Hp
         UmLy9+l3XKZnJZYHRlW/gTDFu78+5qucGNputDQ1ylQTrVvfOSeYG3ukoBcreGL+5Ss9
         9Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173014; x=1741777814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=jVb6c41xqefj2RK8olcTpIMou1e97YW8lctU0KjAB06HDDygP6cJvNAfA+CoyPMZ36
         t3hcqXOVZiLThlLqTT0WS5Nd/KNHzsmW6Y/f+n55uh8zz/FMgk05nHQM2FthSPdwN0ve
         ZckSybyN1U+KYrGWral7i4PqcRzNfcYt8D4vT9ylchz+pUeKXR9jty1efMD7KfHo3CXT
         rb6B/tdhxoQN9xkf7bFeuRvHyPze6Ot+9RuvMNzuTh9si/AatRd3WClIVQZWyph3AhWe
         VtwE+yzMnkZXUCvMxXMXLLVV9i/anGbxZbRp0TynDHR9TbeYvcqabiEPiM1dT31Wh3dT
         jGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWYrjTMwhcyCL9l25hg1IrV5y1i6tDbQsAekLuCu3MjjBaRmxP6GZxJ9psmQsc7TQlm2TM9eBTT+Waj/tc=@lists.infradead.org, AJvYcCXUGFOyhVPEHtizRKpddsdHy4I8IE4PLWMq3ClbnM9Bkw8jl43JgtyxvU6EOWzhxp5TX5P8S7wRXB1WSCWqB9c/@lists.infradead.org
X-Gm-Message-State: AOJu0YxObU2u7m0LKltS6ucKnkgbHmsE/t1ChDXaYTQB+HjadfYxDdWq
	VXxyFGPr7tqxqGWJAyO7ZTyjeWl82ivNH7ECGE8rTC1brrP51poS
X-Gm-Gg: ASbGnctAFFJAckvSjDeh4B0DPsCCR0WHiijVd/tI4XLSmOHCY4MjxUKlJ62PoDwNrFp
	YEqYNZljmTR6yJx1z1HVpgpMQ3yBK07CfnCxLlEbKjDyuRTINT0kt7KeyOmF+Qp0zomRiDRFbqI
	QTIF/f8zrIDQoIVHOzx3WvAzbfBNqjRcMjDksRkxhD/Dp6iikY9r8onAATf+9P4yw0vO67BHQ/C
	c3QNKdk56T9mSJ9URBwwBwb8+13GIix1VROn1NcOwo0riFgWRLJxvaqmG9Cgr9LZx+IIPe4wV95
	6qs6UKAJQh4gP4IB/TKecf0bGV/wvZpKmKj9b7B9M+A7sX94LhEZFFxeqT/yhaa9MicNF6rbIJn
	JTaJyuxCYTQ+UI+YY3TQhGQ==
X-Google-Smtp-Source: AGHT+IGT4sqxYXWLlVa8YluGkM22xVpQMVO/t8msCjLv92geQSngVV+IoJoiRn7vgEXbNQJrnp5b6w==
X-Received: by 2002:a17:90b:2405:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-2ff58c7a78emr497795a91.32.1741173013960;
        Wed, 05 Mar 2025 03:10:13 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:13 -0800 (PST)
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
Subject: [PATCH v4 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  5 Mar 2025 20:08:11 +0900
Message-ID: <20250305110814.272792-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305110814.272792-1-fujita.tomonori@gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031014_888363_AC83562E 
X-CRM114-Status: GOOD (  10.49  )
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


