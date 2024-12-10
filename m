Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB15E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=; b=liRonZOTNSrV+cG/gcJ9l7KJnx
	qXMc8iu9xOjPJaS6ZWlyjfu16XYRcEOjUDbAFCf8W7YhnJG2cLVQ6yBqGYZebhuj2xfWW27ZA9Kog
	Cif4ZufWHfwk5ipNcm03Vur9aCuNiDTtd7mZ+T2JR16Y5ppL2m2P5yWAhjQSIo40h8V7plGXE1qp2
	Oi7bkFLgj5NIv/M/QI6pFdwV2QTsLo6Z1bCpE6pqSgxxpVOvInjhViGrdo3D+zLxunO0lGRaPcNIg
	NuJQbbmk1AqHaqhHunUVQGNmOIhgwRNQU30uWLL63DbH9Rd8CScSdB7Uivcy8bSBQjkuuMXatKgNf
	j5L/S5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo5k-00000009hpA-1qby;
	Tue, 10 Dec 2024 00:27:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnyH-00000009gPF-2MXX;
	Tue, 10 Dec 2024 00:19:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-725f4025e25so1077525b3a.1;
        Mon, 09 Dec 2024 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789964; x=1734394764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=Y/uhKCRmidgHT3KU+TNsY4oYAd4HLRaD7+YgZcHvGMIXCwPNcAt3nTAOx27wqbmg4V
         /04BgtI2xFSNx9UBdDs94BeD/fv2tnAygLVaOR07ig/64VVltdYlWxzJoXai4VbRkpae
         5lx3KNIntuZ8ZBgjsQ41I5SfEYNVfhHampZHJqLuDW6A000FRWMYfpYRRU4zBQKTEWtI
         KyfJLF+o09SuS6CvWBZVNHImJdauuZobxSoRjatoqchKAl7qXuVNuAWEb+f3dW84MHx+
         dPYpfF3MQJChb2T6mG+PdurGU14FM6OyVimcYxDO7am7HuDEYsSdq1pEqYMCsB04uPKR
         zMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789964; x=1734394764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=On89pF8Ev/zmbld9Gjf0QLoP9fWbSPuM5vIgSccjt3HoRY+gscgbtdPxaOtNXtPnxu
         UFI7XIwqvUq2dznuDA+/PatguWSd4AqnZGx2yZT6R3YlRFtSAqb8AsCI02G7q6/zqbKS
         A9i62zAtI1yQuXH+2VHzquscyNt9rble2n3989J0tJIOCrJQ56JjtUqe2q/YCZi7OsFy
         l4R8n0EcvFWy6/CCh/9T3SU1bLfpKh7h+DFv4uUbdo2xAuXSC8OzuNV6LnSLY0kXIMjo
         kKem5frOTNXFdFpgEvDRK2KSVKuudAqJG7/Xx/8KyeSEAlc9X8wP7634Mu7vNzX/iU1t
         8mRA==
X-Forwarded-Encrypted: i=1; AJvYcCV3P8M3mTxI1cmdQQmOHOLW7ylGQTEm+cr26YGKUnRwcSwJZs/ccEYLV7n+X/rlELpGiDi7r2CV4EQOh4/no97n@lists.infradead.org, AJvYcCW+JGnDAaBNvUonqFQrwF9GQkAVegg2tLb1Wgw7pGoNP3vMn0tB7KiwWmlAwCxM3jrWDe8imN+5wKdpYRs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNERsZdMocp2LYXMeGHUB3ZJ5Fql0jRJlRhSF3vGbO57+hnjn6
	yEtikqd+SGQSM86iv+mRunabzqJcJ/oUytXymiD7XGj9UhOVc7cx
X-Gm-Gg: ASbGncv82TvZ9h3XdDyIoh9WWZpZgtVbV9IKpc+KhsCEI0PT/IFafPCNBexqZXyaTDi
	Hd+PJf2ijnwfljbaav0fK4vKejqWJo9HkEE7tg3jWAu6pbkaxPJy6BE7dPj1juW2CNAIxt8GZwZ
	r406pQqK94+H+WeRXFpYu662xFEO+8BFQHrl2kh117Br0P1614FAH5w/Lotuu3FHo7hDVo9mz0q
	LhoCIlJnSTVW67U9SQY3XOnwqE0VeU235sGJMWyzNCEOVxbaKcR3ur0ZFaS++QDwthue+SIojKT
	itF9CMbdWZpllY2RB8BNWFiVbF8X
X-Google-Smtp-Source: AGHT+IE0sO05jto/zLfmn6/T151S8aCpOvFIvTm7U8rW5Jtk2M587AQu6vur1sMtmKA/fHe5aWFjDA==
X-Received: by 2002:a05:6a00:3e1b:b0:727:3935:dc83 with SMTP id d2e1a72fcca58-7273935f820mr4927070b3a.10.1733789963629;
        Mon, 09 Dec 2024 16:19:23 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:23 -0800 (PST)
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
Subject: [PATCH v1 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:17:58 +0900
Message-ID: <20241210001802.228725-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161925_603479_8F796A02 
X-CRM114-Status: UNSURE (   8.49  )
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


