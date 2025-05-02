Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD0C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=; b=dZonX0abX2dG+LY15lrmnSEyEU
	39vDoa4aBU/FrX1R9D6DSVVPO4DHjpXBn8i/81BqEBm7O8BubNlWMmsvaeY0r3uYdMtVs0AZbHiHZ
	mzB26aay9MbX2zqBjh66+ZUr0L+H3eSNFTKin9yx1eEp7QLMiOxJm7lG6Zas/uGZ7lEH0LmYLxYlW
	iS0F9hL0hR1wSqYexC5EJZeBTubc9qR6j/V/BAVVbmu8ZXgd1m9s+mvClRnnoDNa3ERUClG862MRx
	j6hOg/L4lUpFMtyz23PsQtCVQ4CKewxMrlVNaZcjn0Bg2zNp2v5XoYD3hqhdwCgsUosNme3POWESO
	rRixorwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn62-00000001Qy3-3sB7;
	Fri, 02 May 2025 09:54:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmz2-00000001Oug-06Bj;
	Fri, 02 May 2025 09:47:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2241053582dso29787795ad.1;
        Fri, 02 May 2025 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179223; x=1746784023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=D7LIt8sLrp9whL2W95ul8lTvpgBtPuhDpbDUv6KJqE094l/CmLhmds8xKcLdvp19b1
         ZIduUEyn2O7pUqgRyODeXTTsieafQOlzKdoOutHyYqWQZSbtc8BpSOUs3HLKAp1/9yLV
         nRuDfqYtUIMCDoBLAZc81oTe1mzFwkbGXaaCpUsBC1YQpjfW33YnMJNUot/7q3eSCp1Z
         +NVBydJs+O1CF/i5UFl0ggfqbABl8PagHQKdbQtxGE7Hu1Ckj3+h7U+msHINjh8xV3ay
         OWQD8eKfAfZCN3uKFdZxUwdW4ZVIZRgaO7AvZL9DlwhohE/WO4tUjr37ddel58oTUyOs
         HZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179223; x=1746784023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=VXmceFeNJ2CNANrFxre/hCVJ5IQHiihhgBg86X8IDwTcu7tvmQQDBatL+Xv09iPVHK
         tEIV4dzfezQMTkDyVUPUo0JNwYj6B2BhLYzenf+Rji4Kkp4TztjAdTk4ml763Wj8a3/v
         vAMfVPBY4v0BpzLtfVcnU1/ANHFfi+GHPHfzizfknURh8zaYiC1wWTaqadkYylAfwE4z
         /LdinMICyPF2dur7/hhYPm9gCbaywEg9FeIvUqwiryw3yDrfg7DqjepZCukn3TcZh+LB
         PVbr8HmHcXEhCyHfRpCXGKmEzRfeMbmFnnAH5Wfxg8aK9BjTEDOnTIP5l+2EVpzCcTsU
         uTKw==
X-Forwarded-Encrypted: i=1; AJvYcCUKr4Ug78lsxy1jBhKhaUFHkL1S4ybTo1+0HuLAP0g4wrcPBYz6MPNlVwKdwS+8ektA/v5fR7G20sHLZfg=@lists.infradead.org, AJvYcCXxlWhL5zVa9/RmB1EUb5k55cdFFirkicf+4xAI9g1DF4MFP3Yq6NBT6erazJcwJrLLxyqiBlUTvKj8YALBHexT@lists.infradead.org
X-Gm-Message-State: AOJu0YxI+1LKLzXz+Gbgya/7JRjjDMnW39p1hNnz3YEOLSnB6NZk5NZZ
	3gs/+kWJIUSyEJ7qkNI0Q1uBNvC00SQ1nekpMF1NEAj/9OXD25lS
X-Gm-Gg: ASbGnctPtd/5E4+npoplDbwJdV1ZaV6hG0QThKgrkuFRGEBMDOfrTcBj6WrtJqiXzIz
	HP3TasX+MN633GDSsHs3CJAqLKB4c+WEz2Q2gvAxamvunj72BT/vbEaRl0pC4S0pSsJbwV3rhwr
	9cGAiFncMhSVWBkwEmJ7N0VmA/BBYoHOYqwRSfbXIPDqgaAiHRKfXh+qp5RkukWMqOSaJz8sAMY
	FgSb38CI1Uu3FOU5tEQd+xOyReJZw2tilCb+tvLnlqU1Cqb32MqSuX0KkPCi1GKt3TH5fC4tQMG
	IPQJrlkW2wBT580i/e63dO4nOD2BZByglEZQBAwd5JiwBoVKHcNRkKuOhAmVa/WGvqBz/Lw1HiK
	sK+SRiM++YqRakUqUeMjLm06zj14c
X-Google-Smtp-Source: AGHT+IG7SpxC9CYERKlra1NSwOhm+ZnosVtJEMd3hhbHfc+fF/GyvZa2L0kJpSrWYrENqsswlrl6UQ==
X-Received: by 2002:a17:902:f70a:b0:22d:e4b8:7186 with SMTP id d9443c01a7336-22e102dc24bmr40114995ad.22.1746179222992;
        Fri, 02 May 2025 02:47:02 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:47:02 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	x86@kernel.org,
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:35 +0900
Message-ID: <20250502094537.231725-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_024704_059995_54DB2BBF 
X-CRM114-Status: UNSURE (   9.86  )
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0


