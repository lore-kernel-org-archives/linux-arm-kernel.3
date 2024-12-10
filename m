Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6FFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=; b=vhWuvY9zUpMZOOV3+mwr+692H4
	dOpFWQ9nHoXPmpoKQgBo9RT8FeA/Elfoc3UhYAso68a8myDE5SlZZrcnoQbaxiQB1yl9imUspU4WF
	iauHQ8GFuIN+zf5fA4nNm4QG+1j2Atie+Rx1gG+CEMf8oKRYu4CY6Ole/h+OfNzwqzOCqViYqUz47
	4dOueMzQdzGbkojXTIWeVZaNR50RJrakghT1UstY3YEggKr3Ur9+ZIplQItmIv4hXV2ktAWqMn3wF
	ULuDrmJlTZV8Qs/INkjlAWrkwGoR/6R2qST86lM5GGMduC9t99/6MTbfi3An+E4uWp7TkOCpBZ+xr
	OZl/0Erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo4j-00000009haR-178X;
	Tue, 10 Dec 2024 00:26:05 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnyA-00000009gNB-1Dud;
	Tue, 10 Dec 2024 00:19:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725ec1fa493so1246130b3a.1;
        Mon, 09 Dec 2024 16:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789957; x=1734394757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=DOxK1P2k9V21Q2cNm3mqZxUv2ZRijAQZqiofCsllSpCQzIoRb04of4IuqYbKS3sf7q
         loHk74J/z5HrcqEOPfZJjI3D8gNyW29/R+C4hzI02tvMF4J3Zk8cmdDur6TtgbeQ4WCP
         RqRTJJm6gE08SV/fdu5F1Pe0weom/d6v0Bt7cxBtSR5LWg5W2VsZ5PLtUyNc0Q0y01ef
         fyXq745hzWi57c2K4JQmrz6I3KX+l4uQ9mk3bbBaez+L0gqqgy6mKjHknVToDExJWNsk
         6Hk5IhzBvyFioqVVTdRnsEXEaXVgtxEC31TQaup/loEmNLoPB4jJT/6Xbe75WORI7rAG
         DKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789957; x=1734394757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=w4zynU/7Cy9R8H8jUZAWjFy5aCz4Fb1r7cpGTY1bAEuee9wWgO5WzNcihmF3OM1eao
         xQs/XFSUBMyKU5QSeUnGKIM6vlCVW3iOM4bzKa2gwTmSJEM662jKiPkXq9ox9M1QJ5er
         IPd4CcqSULLQyPQqFZpTofoNDgLWkGyNQNOEj7v2wDNTioUmuf5uaWt0bqTuyn88jeKX
         4YwMxrKuQl3p3s2zbNHHRVNR50ohqypYpdzydMx8DrTAE4yl8NAT8NhPNTA4eiIHFLCw
         uvRxei6VME4FTOOpu3gpFyeMtc6pFSBySZUr4R/afl9TUgjguerI3AEH3QjVXf+QiBjV
         N6Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW6umXAlvp0alSK3LglveTt67O18m0f3XFdOLsLTsLpsypN0EUgPoChje7NdHroHn2ywiH4uWUtd8hjDfw=@lists.infradead.org, AJvYcCXlcSgeMw1FqgjbUvQZsy6EgjHpeoFNAuEQUQCiO7E6db4puX+sLMKJEGUOaqACcXWbUfVeyWdXrfMOlOvpPe1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw00Vov2IoldB4jiaZHZK6ScdVV7oTRKqqfKGQSzErnWexFn4x4
	EYHrmFJPjxcNPpAxrLhFoyD8RZxmfZBAomC39pYkLxQANbhASaag
X-Gm-Gg: ASbGncujK5vd84Ibg/yIKpzAfF6kyfz4YwmZmI1lU2iSm0RBzv7RyTEoZ2db/hB4Q9a
	PIeM9k6mPmmOmSWVEyE7j4YocNWjMoyTluh7KCNd/bewslyoaCuCG9aNoPPsDFhQpIjnUuVmZCG
	dBEprKlxbiRtOVXUwQJArDK0A0F3IUbrDi2l/fe0IwZ/sh7AggrwIk7ONkbYVnLqG/qC0BgAZY2
	/roMirC1zZVncUHZSfB6+VWEfRZvW5MaaI30d5n4UKaZOJjwbK9j/4Jykh8Yvry1GCZq39g45aI
	zzkk7pNlKq295XPKxtF/I+ntzjaw
X-Google-Smtp-Source: AGHT+IGXDLB74qKfVuatRG8d4NT0q2/7WE7V1EKSlo1ahbfyprBuniJ//vSx8P3YzstgSPlCq25zXA==
X-Received: by 2002:a05:6a00:1815:b0:725:e015:9090 with SMTP id d2e1a72fcca58-7273c90ae9bmr3318953b3a.9.1733789957264;
        Mon, 09 Dec 2024 16:19:17 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:17 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
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
Subject: [PATCH v1 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:17:57 +0900
Message-ID: <20241210001802.228725-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161918_330779_8DD6AE77 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 51 ++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 806649c7f23d..71df68e2a731 100644
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
 
-- 
2.43.0


