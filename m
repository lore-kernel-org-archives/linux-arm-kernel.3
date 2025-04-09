Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1695FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=; b=qAWZZVQuu+dH3MVrpHFqoGXrJO
	G2ZU5onGIbJDwsv6xtiJmZ7s2YNMsKH1ZKwEHranzB2DihLZFCiV2G9rMxQv+z6IrNVR+h3O85pyC
	XzZ1Ng3xkLkSckaSvYNOThCzqA7a05fS1i/PfixvFtIDGQjOcklXi+8voAtg/7SrvABM6m2MvLuCQ
	cbNWWZ/lqP8FVmCvl20COx10c5n2Sp6iqFvZNQr9N3ra0sNMqMbtb5t+j9Q6foqy73YL7u8pIEj8B
	eihJgS08he0hj0banGuexc7ObZnKeQSyhseY+A0eYIFn1MRT8ks0Cc4AA2dDdnW7Lhrfdt16RuJ65
	xr+FiaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PS7-00000006MEw-40Lt;
	Wed, 09 Apr 2025 07:02:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PPB-00000006LXw-2pjM;
	Wed, 09 Apr 2025 06:59:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224191d92e4so60807015ad.3;
        Tue, 08 Apr 2025 23:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181965; x=1744786765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=QjNe4hdktiqCff7bE/wu8omMkSghs1WavlwKmo1aRd4HQcqOPuTdjDHmlH8cN+QI3D
         fMoCkGZlCnqe8WuSsYSE2haCbkGmx+XNfwj5qKP4WxQVzNaVBj/n187nHOCt+6QFaBh8
         mte0scevcgbEBbqSVSwVGORA7o9d/r7fLW3l/x2Etoiy3f1wU59z1oTZZnLevXo/zeBo
         8SlQIK/ZEf/GJ59RujxZG/MmwrBGuTIAMTHdN/e2p+hhx7ZLASZHGdYqNU95C40j+FSk
         /d+cJiWkbd9GKlPmINW6IqjRVxqwq/T6MNdK6/s4HRBEH0A9pltdBJ5QpBof2gVG2pTs
         xNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181965; x=1744786765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=mts7DhPjDfiwYpkyvfWQaXAw24T2AOF5EGtto4AerV69OLiXthLRce1PQYNtB/6apR
         1jlg+MkaoR1tD4zYxbxyyKhNRx7d3+QFIhi/RWDo2ku3U++fY6lGaRhvuv6I1Y3+ZYSi
         ZkWqkE3FBlzjY+DicbLMi7EdOtRbs5Zi447o1AX1vVzMUSOKZphsgU4dFERJKxnagUU9
         lMk3UJrXZq7FWsQxOpDkaDPWX4rlVJMrXJfDI2pJb3RvgIMaSVX+vkwHFmHur/5oSBNT
         W9TLX1igioUEbF+nh1KQfkEaZo6scvKWp5H80uB8CwSnraHoSyuIcNE+fhY+lRQYkbpH
         re2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgjJIqVd8CMlzCDVap0QsH4Or5ld5NDpiTpTbsmopQPXIoZ130jyDepa8m4QIjuENj0p8TQLLjsAqVKTk=@lists.infradead.org, AJvYcCWa4Kwu+kf4gfpbs5S1TA+kBG/HYA9fzqnKDZoj6wLzWVMnXTavz/GPM0Uecc3FXL7byQ5mmjOG1vaKWj6VXVp5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7NVha6cA3OJjl65k7XlBwSnF/hPuiIHX8BIdt9ybw1aWnxaXT
	Ltk8W2/4qqh5EkYG4bR4IiI6krEx6gDu9z1WgDZbVODd0J+3O+iX
X-Gm-Gg: ASbGncubXK2Ys3i+zRgGRIaqOZuisLyo5dw1Kd9XQ+uVh53YnsEclaLdFl39WhYhgg6
	6xK7HCfCnOMNw48bt3tobnfukBq0I5Qt6RNiwWCluhTAiKiE3uVEi74czlm369QQEqvFOV4qRlv
	VthDuJoxNbs/JFnsEfiDoNWp6vh4ROg8YKXu5OCwwDNIxclf0k5QexICpz26qhzenjJUvNabnHr
	qHb2kYA1YDrdYavnrBULWf0ealgg5+S30ITX15Bj+Zjfv++aYJnMPuK9A8GT+930PIxm8LtEMPM
	jtv8gcIk7Zg8yQMl/vDzexpJa7PJdGwyOHN2085hVyHzC4r8sjy4Z7mv+xC6Au0WpcjXaM/YT7Y
	g8QVcE20+Z1vDk6zuDQNrgsp4xP9w
X-Google-Smtp-Source: AGHT+IH3bX9bz4NSeffRNUm1cA4jaTwLt7BuSbxQGS6DHGZ0kp+vhH5H4LqkKJt7qc/lkXgGcXJQYg==
X-Received: by 2002:a17:903:1c4:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22ac3fefc81mr20504865ad.34.1744181965015;
        Tue, 08 Apr 2025 23:59:25 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:24 -0700 (PDT)
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
Subject: [PATCH v5 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:57:58 +0900
Message-ID: <20250409065802.136971-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409065802.136971-1-fujita.tomonori@gmail.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_235925_713007_29B5ABE8 
X-CRM114-Status: GOOD (  10.84  )
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
index f0e9acf72547..be5aef1aff9e 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -32,45 +32,42 @@
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
 
@@ -92,11 +89,14 @@ do {								\
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


