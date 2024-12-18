Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5167E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=; b=2ct2//tpoZyiMMCIm9LT9nmXOJ
	Rl/FATMGv/9B5nPOE8dRjm+I1c4dWHsoixjh23/BFuHsKdwR8I7Y/hB3FfW3c97Rr8LHkKCRHeXzU
	1ahMB/lSG0ERIPjZ10JQ+q4SPY9bsrfjUvRKdV2GE0QmaEE1Oc9n77onWSpcz8PNwNCmnXLO469AL
	6vpuK5jpLKDCqQYnozw0UnpNth70mm3G7oH8oY1v/SqAvwmSBD7EMcFtJlraDB8oq5WmSzYTiw3pE
	7NGwLfiRkzSrQRFp01VxeSDB7l4Y9QozXmndG9SZjqnZ5KgGzPCUbAsOsJnQHKL+xgdVvvcnL76I2
	8FyZ7rXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnTv-0000000Fhwq-2QTY;
	Wed, 18 Dec 2024 06:24:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnQp-0000000FhBU-3g7N;
	Wed, 18 Dec 2024 06:21:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-728ec840a8aso6499976b3a.0;
        Tue, 17 Dec 2024 22:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502875; x=1735107675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=PBWWhQyF8xqhkITS3nsldrtXPPRGnQqw65RvykwSTLjb/o8Umvysa9ztAcuZ2suLQS
         Z9AgjN+tfWDtTKY+egGavkNvOw56tdgeXGjUEIWrjrE9dxfY5rzLLe/g56QPbcqB0mFo
         dMrMeUqHI3GB6qTR4WDnVcUv6iSNw1fsh8Ee+MYPtVPL83AZ+F79cDC9OT9C5CBLD+m+
         zMxt/XIRhpzcm381s4AKCKx2au8yUuCe1ppWXvxCgaEPH9cvqrxX0uAEcxlh2VXNGgG6
         w/xh7kf+9GHlnX+QH8YKG7l5McG+91Nyyr+/LlAJ1WnuFPq91nLvvD4J5k98B/+1UEUa
         m/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502875; x=1735107675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=lLQ13vVqHW8GNj6SVR751cgvDQgUX10P1ecVAFfF4BhdtWfvwQFFEn0saW+oUtKRAJ
         jxSnV7pzYLWeRWhN5J7cDz2K89Mx4bYXXheb6aOWvafVEYhqNARUABM6ipSjoi24/nDq
         EfS/yJ+xyJFrNPivdorbEJjX64Fiwx566A17iKWibYl+b8j2H6WRmQxCD8BaYbMCaGn5
         tVdRoUaZsiyZXe0xrNjU6lCkG/rsKa/w5DLIjM8i2JcAs0QBfzIIPAlxknh5Tv32kP0I
         aHFVxMxfBvKSTqeH+uK++rPL1ir7c5KsXOD2Aus1+4NoUqhF7bcKVYJVK/6eC4Un08vn
         ifdA==
X-Forwarded-Encrypted: i=1; AJvYcCVwWG9vRK5O/yoeiWRY2IPe2Tg5lIr0zBAoCEYfmwOlertixdozrLCve80Mwm11uzo+6ePzxXQq319fUTA=@lists.infradead.org, AJvYcCWDFFyeyrqHR4vEzkf430r3dyGB8dDtdMcOaur7Ofayicvvo+/InEGsTJYwZgoOJ/9h6ku99M57yc504vOwg+d6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMwX3bPTKWzWou56wRJygLneBKNrfiUVJdbej4XkL+frZGbXI5
	pAPSJ0GssM8gS6Jg2h9ZI8wX//6ysRUSzxE3+MPBKHYPMfPj3RnL
X-Gm-Gg: ASbGncuCR1a52ER4XODKnV/8MHevPk4nTD/pw2rIsnFHnY67uOCjMPvMYYx1VS84ina
	T3O9Q4FY/4tutbngIjFuNAImNxhuS/Eu540gfXd3xHwCKU8f4jSwnkbB/Mw1bUkd+w+MWjC7fS+
	wNgOZbFci5QmucjKU0Ka1J80IiOJHT3Ge43BstuqDDLO3hej9F90ywLMXUkQdSaq43XrkxL4OhE
	rRlX08Jx+yNJgsAmcEZtYdLEMokL3uo95UvOA6wZTTWz4gk8wV8SFCHcRylekSPW0oCDnBvDz16
	NItXG2H60gc+1KoHpQ==
X-Google-Smtp-Source: AGHT+IE8Ef54dNMtI5iw0XGR0f6dNrZGSBFn2rHI6W1DYE3F710PsI3NNNPfVvjoBn7Wi42XdgnDdw==
X-Received: by 2002:a05:6a21:3382:b0:1e1:d22d:bc01 with SMTP id adf61e73a8af0-1e5b48831e7mr2645443637.30.1734502874926;
        Tue, 17 Dec 2024 22:21:14 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:14 -0800 (PST)
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
Subject: [PATCH v2 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:06 +0900
Message-ID: <20241218062009.2402650-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_222115_911688_5025B8D1 
X-CRM114-Status: UNSURE (   9.13  )
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
 arch/riscv/include/asm/bug.h | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..ee6b9b787e46 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
-- 
2.43.0


